import React, { useState, useContext } from 'react'
import CustomerRow from './CustomerRow'
import { UserContext } from './context/user'

const CustomerTable = () => {

  const [searchClient, setSearchClient] = useState("")

  const {customers} = useContext(UserContext)

  const filterBySearch = customers.filter(c => c.username.toLowerCase().includes(searchClient.toLowerCase()))

  const customerEntry = filterBySearch.map(c => 
    <CustomerRow 
      key={c.id}
      id={c.id}
      customer={c.username}
      />)

  const handleSearchChange = (e) => {
    setSearchClient(e.target.value)
  }

  return (
    <div>
      <h1>CLIENTELE</h1>
    <main class="container" >
  
      <input type="text" value={searchClient} onChange={handleSearchChange} placeholder={"search"} />

      <article>
        <table role="grid">
          <thead>
            <tr>
              <th scope="col">ID</th>
              <th scope="col">Name</th>
              <th scope="col"></th>
            </tr>
          </thead>
          <tbody>

            {customerEntry}
          
          </tbody>
        </table>
      </article>
      </main>
    </div>
  )
}

export default CustomerTable