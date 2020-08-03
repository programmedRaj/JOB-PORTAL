import React from "react";
import Typography from "@material-ui/core/Typography";
import IconButton from "@material-ui/core/IconButton";
import Box from "@material-ui/core/Box";
import DeleteIcon from "@material-ui/icons/Delete";
import EditIcon from "@material-ui/icons/Edit";

const EducationDetails = ({ project_list }) => {
  const {
    title,
    description,
    project_link,
    start_month,
    end_month,
  } = project_list;

  return (
    <>
      <Box display='flex' justifyContent='space-between'>
        <Box>
          <Typography component='h6' variant='h6'>
            {title}
          </Typography>
          <Typography component='h6' variant='subtitle1'>
            {description}
          </Typography>
          <Typography component='h6' variant='subtitle1'>
            {project_link}
          </Typography>
          <Typography component='h6' variant='subtitle1'>
            {start_month} To {end_month}
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

export default EducationDetails;
