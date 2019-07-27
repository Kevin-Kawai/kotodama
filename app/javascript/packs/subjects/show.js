import "./styles/show.scss"
import axios from "axios";

const addButton = document.getElementById("section-add-button");
const deleteButtons = document.getElementsByClassName("section-delete-button");
const sectionInputField = document.getElementById("section-field-inputs");
let sectionInputFieldDisplayed = false;

const createSectionHeader = (sectionTitle, csrfToken) => {
  let newSectionElement = document.createElement('div')
  newSectionElement.innerHTML = `
    <div class="section-item">
      <i class="material-icons section-icon__transformation">arrow_drop_down_circle</i>
      <div>${sectionTitle}</div>
      <i class="material-icons section-icon__transformation section-delete-button" data-delete-url="<%= section_path(section) %>">clear</i>
    </div>`
  newSectionElement.addEventListener("click", deleteSection(csrfToken));
  document.getElementById('section-container').appendChild(newSectionElement);
}

const deleteSection = (csrfToken) => {
  return (e) => {
    const deleteUrl = e.target.dataset["deleteUrl"];
    axios.delete(deleteUrl, {
        headers: {
          'X-CSRF-TOKEN': csrfToken
        },
      }
    );
    e.target.parentNode.parentNode.removeChild(e.target.parentNode);
  }
}

const createSection = (csrfToken) => {
  return (e) => {
    if(sectionInputFieldDisplayed === false) {
      sectionInputField.classList.remove("hidden-inputs");
      sectionInputFieldDisplayed = true;
    } else {
      e.preventDefault();
      axios.post("/sections", {
        sections: {
          resource_id: 1,
          url: sectionInputField.children.url.value,
          title: sectionInputField.children.title.value,
        }
      },{
        headers: {
          'X-CSRF-TOKEN': csrfToken
        }
      }).then((response) => {
        createSectionHeader(response.data["section_title"], csrfToken)
      }).catch((error) => {
        console.log(error);
      })
      sectionInputField.classList.add("hidden-inputs");
      sectionInputFieldDisplayed = false;
    }
  }
}

document.addEventListener("DOMContentLoaded", () => {
  const csrfToken = document.getElementsByName('csrf-token')[0].content;
  addButton.addEventListener("click", createSection(csrfToken));
  Array.from(deleteButtons).forEach((button) => {
    button.addEventListener("click", deleteSection(csrfToken));
  })
})


