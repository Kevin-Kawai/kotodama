import "./styles/show.scss"
import axios from "axios";

const addButton = document.getElementById("section-add-button");

const createSectionHeader = (sectionTitle) => {
  let newSectionElement = document.createElement('div')
  newSectionElement.innerHTML = `
    <div class="section-item">
      <i class="material-icons section-icon__transformation">arrow_drop_down_circle</i>
      <div>${sectionTitle}</div>
    </div>`
  document.getElementById('section-container').appendChild(newSectionElement);
}

const createSection = (csrfToken) => {
  return (e) => {
    e.preventDefault();
    axios.post("/sections", {
      sections: {
        resource_id: 1,
        url: "test",
        title: 'wahoooo'
      }
    },{
      headers: {
        'X-CSRF-TOKEN': csrfToken
      }
    }).then((response) => {
      createSectionHeader(response.data["section_title"])
    }).catch((error) => {
      console.log(error);
    })
  }
}

document.addEventListener("DOMContentLoaded", () => {
  const csrfToken = document.getElementsByName('csrf-token')[0].content;
  addButton.addEventListener("click", createSection(csrfToken));
})

