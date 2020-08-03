import React from "react";
import Typography from "@material-ui/core/Typography";
import Chip from "@material-ui/core/Chip";

const Skill = ({ skill }) => {
  return (
    <>
      {skill.skill && (
        <Chip
          label={skill.skill}
          variant='outlined'
          color='secondary'
          onDelete
        />
      )}
    </>
  );
};

export default Skill;
