import React from "react";
import Typography from "@material-ui/core/Typography";
import IconButton from "@material-ui/core/IconButton";
import Box from "@material-ui/core/Box";
import DeleteIcon from "@material-ui/icons/Delete";
import EditIcon from "@material-ui/icons/Edit";

const Training = ({ training }) => {
  const {
    program_name,
    organization_name,
    description,
    start_date,
    end_date,
  } = training;

  return (
    <>
      <Box display='flex' justifyContent='space-between'>
        <Box>
          <Typography component='h6' variant='h6'>
            {program_name}
          </Typography>
          <Typography component='h6' variant='subtitle1'>
            {organization_name}
          </Typography>
          <Typography component='h6' variant='subtitle1'>
            {description}
          </Typography>
          <Typography component='h6' variant='subtitle1'>
            {start_date} To {end_date}
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

export default Training;
