require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

import "../stylesheets/application.css";

import { initializeComments } from "../initializers/comments";

document.addEventListener("turbolinks:load", () => {
  initializeComments();
});
