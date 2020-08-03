import React, { useState } from "react";
import Skill from "./sections/Skill";
import SkillForm from "./formDialogs/SkillForm";
import { makeStyles } from "@material-ui/core/styles";

import Button from "@material-ui/core/Button";

const useStyles = makeStyles((theme) => ({
  root: {
    display: "flex",
    justifyContent: "flex-start",
    float: "left",
    flexWrap: "wrap",
    "& > *": {
      margin: theme.spacing(0.5),
    },
  },
}));

const SkillDetails = ({ user, skills_list }) => {
  const [skillFormOpen, setSkillFormOpen] = useState(false);

  const classes = useStyles();

  const formatSkill = (obj) => {
    let ret = [];
    for (let i = 0; i <= Object.keys(obj).length; i++) {
      ret.push({
        skill: Object.keys(obj)[i],
        level: Object.values(obj)[i],
      });
    }
    return ret;
  };

  skills_list && console.log(formatSkill(skills_list));

  return (
    <>
      {" "}
      <div className={classes.root}>
        {skills_list &&
          formatSkill(skills_list).map((skill) => (
            <Skill user={user} skill={skill} />
          ))}
      </div>
      <Button color='secondary' onClick={() => setSkillFormOpen(true)}>
        Add Skill Details
      </Button>
      <SkillForm
        skillFormOpen={skillFormOpen}
        setSkillFormOpen={setSkillFormOpen}
      />
    </>
  );
};

export default SkillDetails;
