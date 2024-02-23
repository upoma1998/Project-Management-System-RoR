import React, {useState} from 'react';
import axios from 'axios';
import {Box, Typography, Button, TextField} from "@mui/material";

function OrgaCreate(){
    const url="http://0.0.0.0:3000/organization_create";
 
    const [formData, setFormData] = useState({

        email: null,
        password: null,
        confirm_password: null,
        name: null

    });
    const handleInputChange = (e) => {
        const { name, value } = e.target;
        setFormData({ ...formData, [name]: value });
    };
    const handleFormSubmit = () => {
        const token1 = localStorage.getItem("authToken");
        console.log(token1);
        const payload = {
            organization:{
                email: formData.email,
                password:"adi12345",
                confirm_password: formData.confirm_password,
                name: formData.name,
            }
        };
        axios.post('http://0.0.0.0:3000/organization_create', payload,
            {
                headers: {
                    'Content-Type': 'application/json',
                    'Authorization': `Bearer ${token1}`
               },
            }



        )
            .then(response => {
                console.log('Organization created successfully:', response.data);
            })
            .catch(error => {
                console.error('Error creating data:', error);
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
                name="confirm_password"
                margin="normal"
                variant="outlined"
                value={formData.confirm_password}
                placeholder="Confirm_password"
                onChange={handleInputChange}
            />
            <TextField
                label=""
                name="name"
                margin="normal"
                variant="outlined"
                value={formData.name}
                placeholder="Name"
                onChange={handleInputChange}
            />
            <Button variant="contained" color="primary" onClick={handleFormSubmit}>
                Create
            </Button>
        </Box>
        </form>
    );
}
export default OrgaCreate;