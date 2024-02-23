import React, {useState, MouseEvent} from "react";
import {useNavigate} from 'react-router-dom';
import {AppBar, Toolbar, IconButton, Typography, Button, Backdrop, CircularProgress, Box, Menu, MenuList, MenuItem, ListItemButton, ListItemText, ListItem, Collapse, List, ListItemIcon} from '@mui/material';
import LocalLibraryIcon from '@mui/icons-material/LocalLibrary';
import MenuIcon from '@mui/icons-material/Menu';
import ExpandLess from '@mui/icons-material/ExpandLess';
import ExpandMore from '@mui/icons-material/ExpandMore';
import StarBorder from '@mui/icons-material/StarBorder';
import createTheme from "@mui/material";
const pages=['Home', 'Features', 'About', 'Login' ];
function NavBar(){
    const [anchorNav, setAnchorNav] = useState<null | HTMLElement>(null);
    const openMenu = (event: React.MouseEvent<HTMLElement>)=>{
        setAnchorNav(event.currentTarget);
    };
   

    
    const closeMenu=()=>{
        setAnchorNav(null);
    };

    const [open, setOpen] = React.useState(true);
    const [open1, setOpen1] = React.useState(true);
    const [open2, setOpen2] = React.useState(false);
    const handleOpen = () => {
        setOpen2(true);
      };
      const handleClose = () => {
        setOpen2(false);
      };
    const handleClick = () => {
        setOpen(!open);
      };
      const handleClick1 = () => {
        setOpen1(!open1);
      };
    const navigate = useNavigate();
    const handlefree = (page) => {
        if (page === 'signup') {
          navigate('/signup');
        } else if (page === 'login') {
          navigate('/login');
        }else if(page=='getorga'){
            navigate('/getorga');
        }else if(page=='update'){
            navigate('/update');
        }else if(page=='create'){
            navigate('/create');
        }else if(page=='delete'){
            navigate('/delete');
        }
        // Add more conditions as needed
      };
      
      
    return (
        
       <AppBar>
            <Toolbar>
                <IconButton size='large' edge='start' color='inherit' aria-label='logo' sx={{display:{xs:'flex', md:'none' }}}>
                    <LocalLibraryIcon />

                </IconButton>
            
                    <Typography variant='h6' component='div' sx={{flexGrow:1, display:{xs:'none', md:'flex'}}}>Project Management System</Typography>
                    <Box sx={{display:{xs:'none', md:'flex'}}}>
                        
                                    <ListItemButton onClick={handleClick}>
                                
                                        <ListItemText primary="SIGNUP" />
                                            {open ? <ExpandLess /> : <ExpandMore />}
                                    </ListItemButton>


                                    <Collapse in={open} timeout="auto" unmountOnExit>
                                            <List component="div" disablePadding>
                                                <ListItemButton sx={{ pl: 4 }}>
                                                    
                                                    <ListItemText primary="Free Plan" onClick={() => handlefree('signup')} />
                                                </ListItemButton>
                                            </List>
                                            <List component="div" disablePadding>
                                                <ListItemButton sx={{ pl: 4 }}>
                                                    
                                                    <ListItemText primary="Premium Plan" />
                                                </ListItemButton>
                                            </List>
                                    </Collapse>
                    
                                    <ListItemButton onClick={handleClick1}>
       
                                              <ListItemText primary="LOGIN" />
                                                 {open1 ? <ExpandLess /> : <ExpandMore />}
                                    </ListItemButton>
                        
                                <Collapse in={open1} timeout="auto" unmountOnExit>
                                    <List component="div" disablePadding>
                                        <ListItemButton sx={{ pl: 4 }}>
                                            
                                            <ListItemText primary="Free Plan" onClick={() => handlefree('login')} />
                                            
                                        
                                        </ListItemButton>
                                    </List>
                        <List component="div" disablePadding>
                            <ListItemButton sx={{ pl: 4 }}>
                                
                                <ListItemText primary="Premium Plan" onClick={() => handlefree('loginp')}/>
                            </ListItemButton>
                        </List>
                        </Collapse>
  






            
            </Box> 
           
            
           <Box sx={{display:{xs:'flex', md:'none'}}}>
                <IconButton size="large" edge="start" color='inherit' onClick={openMenu}>
                    <MenuIcon /> 
                </IconButton>

                <Menu open={Boolean(anchorNav)} onClick={closeMenu} sx={{flexGrow:1, display:{xs:'none', md:'flex'}}}>
                        <MenuList>
                            <MenuItem>Home</MenuItem>
                            <MenuItem>Organization</MenuItem>
                            <MenuItem>Member</MenuItem>
                            <MenuItem>Project</MenuItem>
                        </MenuList>
                    
                
                </Menu>

           </Box>
            </Toolbar>
           
            <Box  m={2} pt={3} style={{ display: 'flex', justifyContent: 'center', alignItems: 'center'}}>
                       
                    <Button onClick={handlefree}  component="label" variant="contained"  >
                        Free Plan
                
                    </Button>
                    
            </Box>
            
            <Box m={2} pt={3} style={{ display: 'flex', justifyContent: 'center', alignItems: 'center'}}> 
                    <Button component="label" variant="contained"  >
                        Premium Plan
                
                    </Button>

                     
            </Box>
            <Box m={2} pt={3} style={{ display: 'flex', justifyContent: 'center', alignItems: 'center'}}> 
                    <Button component="label" variant="contained" onClick={() => handlefree('getorga')} >
                        Get Organization
                
                    </Button>

                     
            </Box>
            <Box m={2} pt={3} style={{ display: 'flex', justifyContent: 'center', alignItems: 'center'}}> 
                    <Button component="label" variant="contained" onClick={() => handlefree('create')} >
                        Create Organization
                
                    </Button>

                     
            </Box>
            <Box m={2} pt={3} style={{ display: 'flex', justifyContent: 'center', alignItems: 'center'}}> 
                    <Button component="label" variant="contained" onClick={() => handlefree('update')} >
                        Update Organization
                
                    </Button>

                     
            </Box>
            <Box m={2} pt={3} style={{ display: 'flex', justifyContent: 'center', alignItems: 'center'}}> 
                    <Button component="label" variant="contained" onClick={() => handlefree('delete')} >
                        Delete Organization
                
                    </Button>

                     
            </Box>
       </AppBar>
        
        
        
         
    );

}


export default NavBar;