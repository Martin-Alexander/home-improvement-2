import React, { useState } from 'react'

export const NewCommentForm = (props) => {
  const [input, setInput] = useState("");

  return <form
    onSubmit={(event) => {
      event.preventDefault();
      props.onSubmit(input);
      setInput("");
    }}
    className="mb-6"
  >
    <div>
      <textarea
        rows="4"
        value={input}
        onChange={event => setInput(event.currentTarget.value)}
        placeholder="Leave a comment..."
        className="w-full my-2 p-2 border border-solid border-gray-400"
      ></textarea>
    </div>
    <div>
      <input style={{ backgroundColor: "var(--red)" }} className="btn" type="submit" value="COMMENT"/>
    </div>
  </form>
}