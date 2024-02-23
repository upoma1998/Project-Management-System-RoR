import React,{useState} from 'react';
import {Box, Typography, Button, TextField} from "@mui/material";
import LoginIcon from '@mui/icons-material/Login';
import HowToRegIcon from '@mui/icons-material/HowToReg';
import axios from "axios";

import {Component} from "react";
import HowToReg from '@mui/icons-material/HowToReg';

export default class Login extends Component{
    

    constructor(props){
        super(props);

        this.state={
            email:"",
            password:""
            
            
        }
        this.handleSubmit=this.handleSubmit.bind(this);
        this.handleChange= this.handleChange.bind(this);
    }
    handleChange(event){
        this.setState({
            [event.target.name]:[event.target.value]
        })
            //console.log("handle change", event);
    }
    
    handleSubmit(event){
        const {
            email,
            password
            
        } = this.state;
        axios.post("http://0.0.0.0:3000/adminlogin",{//API endpoint that it wants to hit
        
   
        admin:{
                    email:email,
                    password:password
                  
            }//The data we want to send as object in the POST
       
                },


            { withCredentials: false }
           

                ).then(response=>{
                    if(response.data.logged_in){
                        this.props.handleSuccessfulAuth(response.data);
                    }
                    console.log("response from login", response);
                }).catch(error=>{
                    console.log("login error",error);
                });

            event.preventDefault();
}

render(){


        return(
        <div>
        <form onSubmit={this.handleSubmit}>
           <Box display="flex" flexDirection={"column"} maxWidth={400} alignItems="center" justifyContent={'center'} margin="auto"
           marginTop={5} padding={3} borderRadius={5}
           boxShadow={"5px 5px 10px #ccc"} 
           sx={{
               ":hover":{
                   boxShadow:'10px 10px 20px #ccc'
               }
           }}>


               <Typography margin="normal" variant="h2" padding={3} textAlign="center">{'Login'}</Typography>
           
               <TextField onChange={this.handleChange} name="email" value={this.state.email} margin="normal" type={'email'} variant="outlined" placeholder="Email" />
              
               <TextField onChange={this.handleChange} name="password" value={this.state.password} margin="normal" type={'password'} variant="outlined" placeholder="Password"/>
              


             
               <Button endIcon={<LoginIcon/>} type='submit' sx={{marginTop:3, borderRadus:3}}
               variant="contained"
               color="warning">{'Login'}</Button>


               <Button endIcon={ <HowToRegIcon/>}  sx={{marginTop:3, borderRadus:3}}
            
               >{'Change To SignUp'}</Button>


           
             


           </Box>
       </form>
            </div>
        )
    }
   
}

