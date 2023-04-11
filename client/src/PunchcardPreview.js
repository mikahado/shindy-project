import React, { useState, useContext } from 'react'
import { UserContext } from './context/user'

const PunchcardPreview = ({punchcard}) => {

  const { editPunchCount } = useContext(UserContext)

  const handlePunch = (e) => {
    e.preventDefault()

    editPunchCount({
            id: punchcard.id,
            count: punchcard.count - 1,
    })
  }

  return (
    <>
    <article>
      <header>
      <em>{punchcard.name}</em>
      </header>
  
      <h3>{punchcard.count} more to go</h3>

      <p>{punchcard.reward}!</p>
      <footer>
     
             <button className="punch-button" 
              onClick={handlePunch}>
                PUNCH IT!</button>

      </footer>
    </article>
    </>
  )
}

export default PunchcardPreview