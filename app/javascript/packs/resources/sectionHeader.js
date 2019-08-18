class sectionHeader {
  constructor(resourceId, title, id, deleteCallback) {
    this.resourceId = resourceId;
    this.title = title;
    this.id = id;
    this.callback = deleteCallback;
  }

  // TODO: instead of generating the delete URL might want to get from the response and inject it
  // this would isolate the frontend (generating the url) the backend (routing)
  renderTemplate() {
    let newSectionElement = document.createElement('div')
    newSectionElement.innerHTML = `
    <div class="section-item">
      <i class="material-icons section-icon__transformation">arrow_drop_down_circle</i>
      <div>${this.title}</div>
      <i class="material-icons section-icon__transformation section-delete-button" data-delete-url="/resources/${this.resourceId}/sections/${this.id}">clear</i>
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
