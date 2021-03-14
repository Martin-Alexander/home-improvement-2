import React, { useState } from 'react'

export const NewCommentForm = (props) => {
  const [input, setInput] = useState("");

  return <form
    onSubmit={(event) => {
      event.preventDefault();
      props.onSubmit(input);
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