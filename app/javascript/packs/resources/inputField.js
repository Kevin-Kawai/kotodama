class inputField {
  constructor(inputFieldId) {
    this.sectionInputFieldElement = document.getElementById(inputFieldId);
    this.sectionInputFieldDisplayed = false;
  }

  inputUrl() {
    return this.sectionInputFieldElement.children.url.value;
  }

  inputTitle() {
    return this.sectionInputFieldElement.children.title.value;
  }

  displayInput() {
    this.sectionInputFieldElement.classList.remove("hidden-inputs")
    this.sectionInputFieldDisplayed = true;
  }

  hideInput() {
    this.sectionInputFieldElement.classList.add("hidden-inputs")
    this.sectionInputFieldDisplayed = false;
  }

  inputFieldDisplayStatus() {
    return this.sectionInputFieldDisplayed;
  }
}

export default inputField;
