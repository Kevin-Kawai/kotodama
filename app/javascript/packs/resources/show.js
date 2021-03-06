import "./styles/show.scss"
import axios from "axios";
import inputField from "./inputField";
import sectionHeader from "./sectionHeader";

const addButton = document.getElementById("section-add-button");
const deleteButtons = document.getElementsByClassName("section-delete-button");
const sectionInputField = new inputField("section-field-inputs");

const createSectionHeader = (resourceId, sectionTitle, sectionUrl, sectionId, csrfToken) => {
  const sectionHeaderTemplate = new sectionHeader(resourceId, sectionTitle, sectionUrl, sectionId, deleteSection(csrfToken));
  document.getElementById('section-container').appendChild(sectionHeaderTemplate.render());
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
    // FIXME: knows too much about how e is shaped
    e.target.parentNode.parentNode.removeChild(e.target.parentNode);
  }
}

const createSection = (csrfToken) => {
  return (e) => {
    const resourceId = e.target.dataset["resourceId"];
    if(sectionInputField.inputFieldDisplayStatus() === false) {
      sectionInputField.displayInput();
    } else {
      e.preventDefault();
      axios.post(`/resources/${resourceId}/sections`, {
        sections: {
          resource_id: resourceId,
          url: sectionInputField.inputUrl(),
          title: sectionInputField.inputTitle(),
        }
      },{
        headers: {
          'X-CSRF-TOKEN': csrfToken
        }
      }).then((response) => {
        // TODO: create response object to wrap/decode responses
        createSectionHeader(resourceId, response.data["section_title"], response.data["section_url"], response.data["section_id"], csrfToken)
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


