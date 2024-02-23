import React,{useState} from 'react';
import {Box, Typography, Button, TextField} from "@mui/material";
import LoginIcon from '@mui/icons-material/Login';
import HowToRegIcon from '@mui/icons-material/HowToReg';
import axios from "axios";
import api from './api/api.js';
import {Component} from "react";


const Auth=()=>{
  
   const [formData, setFormData] = useState({


       email: null,
       password: null,
       confirm_password: null,
       username: null


   });
      
      
     
       const handleInputChange = (e) => {
           const { name, value } = e.target;
           setFormData({ ...formData, [name]: value });
       };
       const handleFormSubmit = () => {
           const payload = {
               admin:{
                   email: formData.email,
                   password:"abedin12345",
                   confirm_password:"abedin12345",
                   username:formData.username
               
               }
           };
           axios.post('http://0.0.0.0:3000/adminsignup', payload,
           
           
          
  
  
           )
               .then(response => {
                
                  const authToken = response.headers.authorization;
                  
                   localStorage.setItem('authToken', authToken);
                   console.log('User signed Up successfully:', response.data);
                  // console.log('User signed in successfully:', response.data);
               })
               .catch(error => {
                   console.error('Error siging up user:', error);
               });
       };
       return (
           <form>
           <Box display="flex" flexDirection={"column"} maxWidth={400} alignItems="center" justifyContent={'center'} margin="auto"
             marginTop={5} padding={3} borderRadius={5}
             boxShadow={"5px 5px 10px #ccc"}
             sx={{
                 ":hover":{
                     boxShadow:'10px 10px 20px #ccc'
                 }
             }}>
 
                 <Typography margin="normal" variant="h2" padding={3} textAlign="center">{'SignUp'}</Typography>
           


               <TextField
                   label=""
                   name="email"
                   margin="normal"
                   variant="outlined"
                   value={formData.email}
                   placeholder="Email"
                   onChange={handleInputChange}
               />
               <TextField
                   label=""
                   name="password"
                   margin="normal"
                   variant="outlined"
                   value={formData.password}
                   placeholder="Password"
                   onChange={handleInputChange}
               />
               <TextField
                   label=""
                   name="password"
                   margin="normal"
                   variant="outlined"
                   value={formData.confirm_password}
                   placeholder="Confirmed_Password"
                   onChange={handleInputChange}
               />
               <TextField
                   label=""
                   name="username"
                   margin="normal"
                   variant="outlined"
                   value={formData.username}
                   placeholder="Username"
                   onChange={handleInputChange}
               />
               <Button variant="contained" color="primary" onClick={handleFormSubmit}>
                 SignUp
               </Button>
               

               </Box>
           </form>
       );
   };
   export default Auth;