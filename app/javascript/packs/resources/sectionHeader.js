class sectionHeader {
  constructor(title, id, deleteCallback) {
    this.title = title;
    this.id = id;
    this.callback = deleteCallback;
  }

  renderTemplate() {
    let newSectionElement = document.createElement('div')
    newSectionElement.innerHTML = `
    <div class="section-item">
      <i class="material-icons section-icon__transformation">arrow_drop_down_circle</i>
      <div>${this.title}</div>
      <i class="material-icons section-icon__transformation section-delete-button" data-delete-url="/sections/${this.id}">clear</i>
    </div>`
    return newSectionElement;
  }

  render() {
    let template = this.renderTemplate();
    template.addEventListener("click", this.callback);
    return template
  }
}

export default sectionHeader;
