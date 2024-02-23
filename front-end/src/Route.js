import NavBar from "./NavBar.tsx"
import Auth from "./Auth.js"
import MyForm from "./OrgaFormUpdate.js"
import {BrowserRouter as Router, Route, Routes} from 'react-router-dom'
import AuthLog from "./AuthLog.js"
import MyGetForm from "./OrgaList.js"
import OrgaCreate from "./OrgaCreate.js"

export const Rot=()=>{
    return(
        <Router>
            <Routes>
                <Route path="/" element={<NavBar/>} />
                <Route path="/signup" element={<Auth/>} />
                <Route path="/login" element={<AuthLog/>} />
                <Route path="/getorga" element={<MyGetForm />} />
                <Route path="/update" element={<MyForm/>} />
                <Route path="/delete" />
                <Route path="/create"element={<OrgaCreate/>}/>
                
              
            </Routes>
        </Router>
    )
}
export default Rot;