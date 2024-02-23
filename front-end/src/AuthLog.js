import React,{useState, useNavigate} from 'react';
import {Box, Typography, Button, TextField} from "@mui/material";
import LoginIcon from '@mui/icons-material/Login';
import HowToRegIcon from '@mui/icons-material/HowToReg';
import axios from "axios";
import api from './api/api.js';
import {Component} from "react";

const AuthLog=()=>{
    
    const [formData, setFormData] = useState({

        email: null,
        password: null
       

    });
        
   
       
        const handleInputChange = (e) => {
            const { name, value } = e.target;
            setFormData({ ...formData, [name]: value });
        };
        const handleFormSubmit = () => {
            const payload = {
                admin:{
                    email: formData.email,
                    password:formData.password
                 
                }
            };
          
            axios.post('http://0.0.0.0:3000/adminlogin', payload,
          
            
           {
                headers: {
                    'Content-Type': 'application/json',
                     
                },
             
            })
                .then(response=> {
                    const authToken = response.headers.authorization;
                    
                    const token=authToken.split(' ')[1];
                    localStorage.setItem('authToken', token);
                    console.log(token)
                    
                   console.log('User signed in successfully:', response.data);
                   
                })
                .catch(error => {
                    console.error('Error siging in data:', error);
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
  
  
                  <Typography margin="normal" variant="h2" padding={3} textAlign="center">{'Login'}</Typography>
             

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
                
                <Button variant="contained" color="primary" onClick={handleFormSubmit}>
                    Login
                </Button>
                <Button endIcon={ <LoginIcon/>}  sx={{marginTop:3, borderRadus:3}} >{'Change To Signup'}</Button>
                </Box>
            </form>
        );
    };
    export default AuthLog;
    