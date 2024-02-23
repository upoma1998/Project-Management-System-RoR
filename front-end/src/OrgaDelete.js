import React, { useState, useEffect } from 'react';
import axios from 'axios';
import { Button, TextField, Box} from "@mui/material";

const OrgaDelete = () => {
    const [formData, setFormData] = useState({

        email: null,
        password: null,
        confirm_password: null,
        name: null

    });

    useEffect(() => {
        const token1 = localStorage.getItem("authToken");
        console.log(token1);
        axios.get('http://0.0.0.0:3000/organization/283',
            {
                headers: {
                    'Content-Type': 'application/json',
                    'Authorization': `Bearer ${token1}`
               },

            }
        )
            .then(response => {

                setFormData(response.data);
            })
            .catch(error => {
                console.error('Error fetching data:', error);
            });
    }, []);
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
        axios.delete('http://0.0.0.0:3000/organization/283', payload,
            {
                headers: {
                    'Content-Type': 'application/json',
                    'Authorization': `Bearer ${token1}`
               },
            }



        )
            .then(response => {
                console.log('Data deleted successfully:', response.data);
            })
            .catch(error => {
                console.error('Error deleting data:', error);
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
                onChange={handleInputChange}
            />
            <TextField
                label=""
                name="password"
                margin="normal"
                variant="outlined"
                value={formData.confirm_password}
                onChange={handleInputChange}
            />
            <TextField
                label=""
                name="confirm_password"
                margin="normal"
                variant="outlined"
                value={formData.confirm_password}
                onChange={handleInputChange}
            />
            <TextField
                label=""
                name="name"
                margin="normal"
                variant="outlined"
                value={formData.name}
                onChange={handleInputChange}
            />
            <Button variant="contained" color="primary" onClick={handleFormSubmit}>
                Update
            </Button>
        </Box>
        </form>
    );
};
export default MyForm;


