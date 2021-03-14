import React from 'react'
import ReactDOM from 'react-dom'

import { CommentSection } from '../componenets/CommentSection';

export const initializeComments = () => {
  document.querySelectorAll("[data-react-comments]").forEach((reactCommentContainer) => {
    ReactDOM.render(<CommentSection projectId={reactCommentContainer.dataset.projectId} />, reactCommentContainer)
  });
}