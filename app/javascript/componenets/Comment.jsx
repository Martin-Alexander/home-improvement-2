import React, { useEffect, useState } from 'react'

export const Comment = (props) => {
  const [color, setColour] = useState(props.new ? "green" : "black");

  useEffect(() => {
    if (props.new) {
      setTimeout(() => setColour("black"), 1000)
    }
  })

  return <li>
    <strong style={{ "color": color }}>{props.user.email}:</strong> <span>{props.content}</span>
  </li>
}