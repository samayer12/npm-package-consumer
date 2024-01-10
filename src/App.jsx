import { useState } from 'react'
import './App.css'
import {ImportedComponent} from '@samayer12/npm-package-demo';


function App() {
  const [count, setCount] = useState(0)

  return (
    <>
      <h1>A simple page to show an imported component.</h1>
      <div className="card">
	<ImportedComponent/>
        <button onClick={() => setCount((count) => count + 1)}>
          count is {count}
        </button>
      </div>
    </>
  )
}

export default App
