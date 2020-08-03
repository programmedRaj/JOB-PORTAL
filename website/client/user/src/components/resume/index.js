import React, { useEffect, useState, useContext } from "react";

import Typography from "@material-ui/core/Typography";
import Container from "@material-ui/core/Container";
import Paper from "@material-ui/core/Paper";
import Grid from "@material-ui/core/Grid";
import Divider from "@material-ui/core/Divider";
import { makeStyles } from "@material-ui/core/styles";
import Button from "@material-ui/core/Button";
import Fab from "@material-ui/core/Fab";
import AddIcon from "@material-ui/icons/Add";
import Tooltip from "@material-ui/core/Tooltip";
import Box from "@material-ui/core/Box";
import LinearProgress from "@material-ui/core/LinearProgress";
import Skeleton from "@material-ui/lab/Skeleton";

import { AuthContext } from "../../context/auth/AuthContext";
import { ResumeContext } from "../../context/resume/ResumeContext";
import PersonalDetails from "./PersonalDetails";
import EducationDetails from "./EducationDetails";
import JobsDetails from "./JobsDetails";
import ProjectDetails from "./ProjectDetails";
import SkillDetails from "./SkillDetails";
import WorkDetails from "./WorkDetails";
import { useTranslation } from "react-i18next";
import TrainingDetails from "./TrainingDetails";

const useStyles = makeStyles((theme) => ({
  root: {
    flexGrow: 1,
  },
  paper: {
    color: theme.palette.text.secondary,
    [theme.breakpoints.up("md")]: {
      margin: theme.spacing(2, 0),
    },
  },
  title: {
    marginBottom: theme.spacing(5),
  },
  resumeContainer: {
    padding: theme.spacing(5),
    [theme.breakpoints.down("md")]: {
      padding: theme.spacing(2),
    },
  },
  extraContainer: {
    margin: theme.spacing(0, 5),
    [theme.breakpoints.down("md")]: {
      margin: theme.spacing(0),
    },
  },
  dividePrettier: {
    margin: theme.spacing(2, 0),
  },
  flexCenter: {
    display: "flex",
    flex: 1,
    flexDirection: "column",
    justifyContent: "space-around",
    alignItems: "center",
  },
  fileInput: {
    display: "none",
  },
  fileName: {
    maxWidth: "100%",
    marginTop: "10px",
    marginBottom: "10px",
    paddingLeft: "15px",
    paddingRight: "15px",
  },
}));

const Resume = () => {
  const classes = useStyles();
  const { user } = useContext(AuthContext);
  const { t } = useTranslation();
  const { resume, scanResume, loading, scanData, fetchResume } = useContext(
    ResumeContext
  );
  const localAuthToken = localStorage.getItem("authToken");
  const [uploadedFiles, setUploadedFiles] = useState([]);
  const [inputElement, setInputElement] = useState([]);
  // const edu = scanData.op.experience;

  useEffect(() => {
    fetchResume(localAuthToken);
    // eslint-disable-next-line
  }, []);

  const handleUploadedFile = (e) => {
    const files = Array.from(e.target.files);
    setInputElement(e.target);
    setUploadedFiles(files);
  };

  const handleScanPdf = () => {
    scanResume(uploadedFiles, inputElement, localAuthToken);
  };

  const {
    personal_details,
    edu_details,
    job_details,
    projects_list,
    skills_list,
    trainings_list,
    work_examples,
  } = resume;

  return (
    <>
      <Typography
        component='h1'
        variant='h4'
        align='center'
        className={classes.title}
      >
        Resume
      </Typography>
      <Container maxWidth='md'>
        <Paper className={classes.paper}>
          <Box p={2}>
            <Typography
              color='textSecondary'
              align='center'
              variant='subtitle2'
            >
              {t("Upload a Document")}
            </Typography>
          </Box>
          <Box className={classes.flexCenter}>
            <input
              className={classes.fileInput}
              multiple
              id='contained-button-file'
              type='file'
              onChange={handleUploadedFile}
            />
            <label htmlFor='contained-button-file'>
              <Fab component='span' color='secondary' aria-label='add'>
                <AddIcon />
              </Fab>
            </label>
          </Box>
          <Box className={classes.flexCenter}>
            {uploadedFiles.length > 0 ? (
              <>
                {uploadedFiles.map((uploadedImage, index) => (
                  <Tooltip
                    key={index}
                    title={uploadedImage.name}
                    placement='right'
                    arrow
                  >
                    <Typography
                      noWrap={true}
                      className={classes.fileName}
                      variant='subtitle2'
                    >
                      {uploadedImage.name}
                    </Typography>
                  </Tooltip>
                ))}
                <Divider />
                <Button
                  onClick={handleScanPdf}
                  color='secondary'
                  variant='contained'
                >
                  {t("Upload")}
                </Button>
              </>
            ) : null}
          </Box>
        </Paper>
      </Container>

      <Container maxWidth='md'>
        {loading ? (
          <>
            <LinearProgress color='secondary' />
            <Skeleton
              variant='rect'
              animation='wave'
              width='100%'
              height='100%'
            >
              <Paper elevation={24} className={classes.paper}>
                <Container>
                  <Grid container spacing={3}>
                    <PersonalDetails
                      user={user}
                      personal_details={personal_details}
                    />
                  </Grid>

                  <Divider className={classes.dividePrettier} />

                  <Grid container spacing={3}>
                    <Grid item xs={12} md={3}>
                      <Typography component='h6' variant='h6'>
                        Education
                      </Typography>
                    </Grid>
                    <Grid item xs={12} md={9}>
                      <EducationDetails user={user} edu_details={edu_details} />
                    </Grid>
                  </Grid>

                  <Divider className={classes.dividePrettier} />

                  <Grid container spacing={3}>
                    <Grid item xs={12} md={3}>
                      <Typography component='h6' variant='h6'>
                        Jobs
                      </Typography>
                    </Grid>
                    <Grid item xs={12} md={9}>
                      <JobsDetails user={user} job_details={job_details} />
                    </Grid>
                  </Grid>

                  <Divider className={classes.dividePrettier} />

                  <Grid container spacing={3}>
                    <Grid item xs={12} md={3}>
                      <Typography component='h6' variant='h6'>
                        Projects
                      </Typography>
                    </Grid>
                    <Grid item xs={12} md={9}>
                      <ProjectDetails
                        user={user}
                        projects_list={projects_list}
                      />
                    </Grid>
                  </Grid>

                  <Divider className={classes.dividePrettier} />

                  <Grid container spacing={3}>
                    <Grid item xs={12} md={3}>
                      <Typography component='h6' variant='h6'>
                        Skills
                      </Typography>
                    </Grid>
                    <Grid item xs={12} md={8}>
                      <SkillDetails user={user} skills_list={skills_list} />
                    </Grid>
                  </Grid>

                  <Divider className={classes.dividePrettier} />

                  <Grid container spacing={3}>
                    <Grid item xs={12} md={3}>
                      <Typography component='h6' variant='h6'>
                        Trainings
                      </Typography>
                    </Grid>
                    <Grid item xs={12} md={9}>
                      <TrainingDetails
                        user={user}
                        trainings_list={trainings_list}
                      />
                    </Grid>
                  </Grid>

                  <Divider className={classes.dividePrettier} />

                  <Grid container spacing={3}>
                    <Grid item xs={12} md={3}>
                      <Typography component='h6' variant='h6'>
                        Work Samples
                      </Typography>
                    </Grid>
                    <Grid item xs={12} md={9}>
                      <WorkDetails user={user} work_examples={work_examples} />
                    </Grid>
                  </Grid>

                  <Divider className={classes.dividePrettier} />
                </Container>
              </Paper>
            </Skeleton>
          </>
        ) : (
          <Paper elevation={24} className={classes.paper}>
            <Container>
              <Grid container spacing={3}>
                <PersonalDetails
                  user={user}
                  personal_details={personal_details}
                />
              </Grid>

              <Divider className={classes.dividePrettier} />

              <Grid container spacing={3}>
                <Grid item xs={12} md={3}>
                  <Typography component='h6' variant='h6'>
                    Education
                  </Typography>
                </Grid>
                <Grid item xs={12} md={9}>
                  <EducationDetails user={user} edu_details={edu_details} />
                </Grid>
              </Grid>

              <Divider className={classes.dividePrettier} />

              <Grid container spacing={3}>
                <Grid item xs={12} md={3}>
                  <Typography component='h6' variant='h6'>
                    Jobs
                  </Typography>
                </Grid>
                <Grid item xs={12} md={9}>
                  <JobsDetails user={user} job_details={job_details} />
                </Grid>
              </Grid>

              <Divider className={classes.dividePrettier} />

              <Grid container spacing={3}>
                <Grid item xs={12} md={3}>
                  <Typography component='h6' variant='h6'>
                    Projects
                  </Typography>
                </Grid>
                <Grid item xs={12} md={9}>
                  <ProjectDetails user={user} projects_list={projects_list} />
                </Grid>
              </Grid>

              <Divider className={classes.dividePrettier} />

              <Grid container spacing={3}>
                <Grid item xs={12} md={3}>
                  <Typography component='h6' variant='h6'>
                    Skills
                  </Typography>
                </Grid>
                <Grid item xs={12} md={8}>
                  <SkillDetails user={user} skills_list={skills_list} />
                </Grid>
              </Grid>

              <Divider className={classes.dividePrettier} />

              <Grid container spacing={3}>
                <Grid item xs={12} md={3}>
                  <Typography component='h6' variant='h6'>
                    Trainings
                  </Typography>
                </Grid>
                <Grid item xs={12} md={9}>
                  <TrainingDetails
                    user={user}
                    trainings_list={trainings_list}
                  />
                </Grid>
              </Grid>

              <Divider className={classes.dividePrettier} />

              <Grid container spacing={3}>
                <Grid item xs={12} md={3}>
                  <Typography component='h6' variant='h6'>
                    Work Samples
                  </Typography>
                </Grid>
                <Grid item xs={12} md={9}>
                  <WorkDetails user={user} work_examples={work_examples} />
                </Grid>
              </Grid>

              <Divider className={classes.dividePrettier} />
            </Container>
          </Paper>
        )}
      </Container>
    </>
  );
};

export default Resume;
