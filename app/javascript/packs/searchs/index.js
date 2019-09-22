import "./styles.scss";

document.addEventListener("DOMContentLoaded", () => {
  const search_action = document.getElementById('search_action');
  search_action.action = '/articles';
  document.getElementById('select_box').addEventListener("change", (e) => {
    search_action.action = `/${e.target.options[e.target.options.selectedIndex].value}`;
  })
});
