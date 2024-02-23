import React from 'react';
import axios from 'axios';

function OrgaUpdate(){
    // Import Axios in a Node.js environment
   

    // The URL of the endpoint you want to send the PATCH request to
    const url = 'http://0.0.0.0:3000/organization/283';

    // The data you want to send in the PATCH request
    const patchData = {
        organization:{
        email:"test1upoma@gmail.com",
        password:"test12345",
        confirm_password:"test12345",
        name: "Test102"
        }
    // Add other key-value pairs as needed
    };

        // Make the PATCH request using axios.patch
        axios.patch(url, patchData,
            {
                headers: {
                    'Content-Type': 'application/json',
                    'Authorization':'Bearer ' + 'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiJlZTMxZmM1YS04NjNmLTQyZTAtYjhhMy1jZTAyNjI3NDA0YWUiLCJzdWIiOiIzNyIsInNjcCI6ImFkbWluIiwiYXVkIjpudWxsLCJpYXQiOjE3MDE5Mzg4NjUsImV4cCI6MTcwMTk0NjA2NX0.yOo_AOgk3NWs02RDCXJlHpYVbQ0XVOjUTnkMsHzaVyk',
                },
            })
        .then(response => {
            // Handle the success response
            console.log('PATCH request successful:', response.data);
        })
        .catch(error => {
            // Handle the error
            console.error('Error making PATCH request:', error);
        });
}
export default OrgaUpdate;


