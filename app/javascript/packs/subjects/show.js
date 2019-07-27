import "./styles/show.scss"
import axios from "axios";
import inputField from "./inputField";

const addButton = document.getElementById("section-add-button");
const deleteButtons = document.getElementsByClassName("section-delete-button");
const sectionInputField = new inputField("section-field-inputs");

const createSectionHeader = (sectionTitle, sectionId, csrfToken) => {
  let newSectionElement = document.createElement('div')
  newSectionElement.innerHTML = `
    <div class="section-item">
      <i class="material-icons section-icon__transformation">arrow_drop_down_circle</i>
      <div>${sectionTitle}</div>
      <i class="material-icons section-icon__transformation section-delete-button" data-delete-url="/sections/${sectionId}">clear</i>
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
    if(sectionInputField.inputFieldDisplayStatus() === false) {
      sectionInputField.displayInput();
    } else {
      e.preventDefault();
      axios.post("/sections", {
        sections: {
          resource_id: 1,
          url: sectionInputField.inputUrl(),
          title: sectionInputField.inputTitle(),
        }
      },{
        headers: {
          'X-CSRF-TOKEN': csrfToken
        }
      }).then((response) => {
        console.log(response.data);
        createSectionHeader(response.data["section_title"], response.data["section_id"], csrfToken)
      }).catch((error) => {
        console.log(error);
      })
      sectionInputField.hideInput();
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


