import React from "react";
import Typography from "@material-ui/core/Typography";
import IconButton from "@material-ui/core/IconButton";
import Box from "@material-ui/core/Box";
import DeleteIcon from "@material-ui/icons/Delete";
import EditIcon from "@material-ui/icons/Edit";

const Work = ({ work_examples }) => {
  const { blog_url, github, portfolio } = work_examples;

  return (
    <>
      <Box display='flex' justifyContent='space-between'>
        <Box>
          <Typography component='h6' variant='h6'>
            {blog_url}
          </Typography>
          <Typography component='h6' variant='subtitle1'>
            {github}
          </Typography>
          <Typography component='h6' variant='subtitle1'>
            {portfolio}
          </Typography>
        </Box>
        <Box>
          <IconButton>
            <EditIcon />
          </IconButton>
          <IconButton>
            <DeleteIcon />
          </IconButton>
        </Box>
      </Box>
    </>
  );
};

export default Work;
