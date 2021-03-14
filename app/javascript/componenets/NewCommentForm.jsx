import React, { useState } from 'react'

export const NewCommentForm = (props) => {
  const [input, setInput] = useState("");

  return <form
    onSubmit={(event) => {
      event.preventDefault();

      const commentId = Math.floor(Math.random() * 1000);
      props.setComments(
        [
          ...props.comments,
          { id: commentId, content: input, user: { email: "test@email.com" }}
        ]
      );

      setInput("");
    }}
  >
    <textarea
      cols="30"
      rows="10"
      value={input}
      onChange={event => setInput(event.currentTarget.value)}
    ></textarea>
    <input type="submit"/>
  </form>
}