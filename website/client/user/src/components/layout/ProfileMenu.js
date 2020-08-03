import React, { useContext } from "react";
import { Link } from "react-router-dom";
import Menu from "@material-ui/core/Menu";
import MenuItem from "@material-ui/core/MenuItem";

import { AuthContext } from "../../context/auth/AuthContext";

const ProfileMenu = ({ profileMenuAnchor, setProfileMenuAnchor }) => {
  return (
    <Menu
      keepMounted
      anchorEl={profileMenuAnchor}
      open={Boolean(profileMenuAnchor)}
      onClose={() => setProfileMenuAnchor(null)}
    >
      <div>
        <MenuItem>HELLO</MenuItem>
        <MenuItem
          component={Link}
          to='/resume'
          onClick={() => setProfileMenuAnchor(null)}
        >
          Resume
        </MenuItem>
        <MenuItem
          component={Link}
          to='/applied-jobs'
          onClick={() => setProfileMenuAnchor(null)}
        >
          Applied Jobs
        </MenuItem>
        <MenuItem
          component={Link}
          to='/applied-courses'
          onClick={() => setProfileMenuAnchor(null)}
        >
          Applied Courses
        </MenuItem>
      </div>
    </Menu>
  );
};

export default ProfileMenu;
