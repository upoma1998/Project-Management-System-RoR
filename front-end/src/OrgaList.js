import React, { useState, useEffect } from 'react';
import axios from 'axios';
import { Button, TextField, Box } from "@mui/material";
import { DataGrid, GridColDef, GridValueGetterParams } from '@mui/material';
import api from './api/api.js';
import Table from '@mui/material/Table';
import TableBody from '@mui/material/TableBody';
import TableCell from '@mui/material/TableCell';
import TableContainer from '@mui/material/TableContainer';
import TableHead from '@mui/material/TableHead';
import TableRow from '@mui/material/TableRow';
import Paper from '@mui/material/Paper';
const MyGetForm = () => {
const [formData, setFormData] = useState([]);
const[search, setSearch]=useState("");
    
    
       

const getOrgaData=async()=>{

const token1 = localStorage.getItem("authToken");
console.log(token1);
//console.log('Bearer '+ ${token1});
const data=await axios.get('http://0.0.0.0:3000/organization_all',
{
    headers: {
         'Content-Type': 'application/json',
         'Authorization': `Bearer ${token1}`
    },
})
console.log(data.data);
setFormData(data.data);
}

useEffect(() => {
        
    getOrgaData();
},[]);
return (
    
    <div className="App">
        <h1>Organization List</h1>
        <input 
        type="text"
        placeholder="Search here"
        onChange={(e)=>{
            setSearch(e.target.value)
        }}
        />
        
        <TableContainer component={Paper}>
      <Table sx={{ minWidth: 650 }} aria-label="simple table">
        <TableHead>
          <TableRow>
            <TableCell>ID</TableCell>
            <TableCell align="right">Email</TableCell>
            <TableCell align="right">Name</TableCell>
          </TableRow>
        </TableHead>
        <TableBody>
        {formData.filter((item)=>{
           if(search==""){
               return item;
           }else if(item.email.toLowerCase().includes(search.toLowerCase())){
               return item;
           }
       })
       .map((item)=>{
           return (
            <TableRow>
                <TableCell component="th" scope="row">
                {item.id}
                </TableCell> 
                <TableCell align="right">
                {item.email}
                </TableCell>
                <TableCell align="right">
                {item.name}
                </TableCell>
            </TableRow> 
           );
       })}

            
             
           
          
        </TableBody>
      </Table>
    </TableContainer>
        
        
   </div>
  );


};
export default MyGetForm;