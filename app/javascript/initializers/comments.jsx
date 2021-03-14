import React from 'react'
import ReactDOM from 'react-dom'

import { CommentSection } from '../componenets/CommentSection';

export const initializeComments = () => {
  document.querySelectorAll("[data-react-comments]").forEach((reactCommentContainer) => {
    const { userSignedIn, projectId } = reactCommentContainer.dataset;

    ReactDOM.render(
      <CommentSection
        userSignedIn={userSignedIn === "true"}
        projectId={projectId}
      />, reactCommentContainer
    )
  });
}