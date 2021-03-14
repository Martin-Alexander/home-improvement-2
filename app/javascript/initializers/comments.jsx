import React from 'react'
import ReactDOM from 'react-dom'

import { Comments } from '../componenets/comments';

export const initializeComments = () => {
  document.querySelectorAll("[data-react-comments]").forEach((reactCommentContainer) => {
    ReactDOM.render(<Comments />, reactCommentContainer)
  });
}