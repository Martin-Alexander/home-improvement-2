import React, { useEffect, useState } from 'react'

export const Comment = (props) => {
  const [color, setColour] = useState(props.new ? "green" : "black");

  useEffect(() => {
    if (props.new) {
      setTimeout(() => setColour("black"), 1000)
    }
  })

  return <li>
    <p><span className="text-sm font-medium">{props.user.name}</span><span className="ml-2 text-xs text-gray-400">{props.time_ago_in_words} ago</span></p>
    <p>{props.content}</p>
  </li>
}