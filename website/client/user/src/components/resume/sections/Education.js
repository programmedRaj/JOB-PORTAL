import React from "react";
import Typography from "@material-ui/core/Typography";
import IconButton from "@material-ui/core/IconButton";
import Box from "@material-ui/core/Box";
import DeleteIcon from "@material-ui/icons/Delete";
import EditIcon from "@material-ui/icons/Edit";

const Education = ({ edu_detail }) => {
  const { degree, college, start_year, end_date } = edu_detail;

  return (
    <Box display='flex' justifyContent='space-between'>
      <Box>
        <Typography component='h6' variant='h6'>
          {degree}
        </Typography>
        <Typography component='h6' variant='subtitle1'>
          {college}
        </Typography>
        <Typography component='h6' variant='subtitle1'>
          {start_year} To {end_date}
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
  );
};

export default Education;
