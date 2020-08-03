import React, { useEffect, useState, useContext } from "react";
import { useHistory } from "react-router-dom";
import { useForm } from "react-hook-form";
import { makeStyles } from "@material-ui/core/styles";
import Paper from "@material-ui/core/Paper";
import Grid from "@material-ui/core/Grid";
import Typography from "@material-ui/core/Typography";
import Button from "@material-ui/core/Button";
import TextField from "@material-ui/core/TextField";
import Autocomplete from "@material-ui/lab/Autocomplete";
import { useTranslation } from "react-i18next";

import { fetchRecommendations, fetchLocations, fetchTitles } from "./functions";
import CourseCarousel from "./CourseCarousel";
import JobAccordion from "./JobAccordion";
import { JobsContext } from "../../context/jobs/JobsContext";
import { AuthContext } from "../../context/auth/AuthContext";

const useStyles = makeStyles((theme) => ({
  paper: {
    padding: theme.spacing(5),

    marginTop: theme.spacing(25),
    [theme.breakpoints.down("xs")]: {
      marginTop: theme.spacing(15),
    },
  },
  btoon: {
    padding: theme.spacing(2),
  },
  form: {
    display: "flex",
  },
}));

const Home = (props) => {
  const classes = useStyles();
  const [errorField, setErrorField] = useState(false);
  const [titles, setTitles] = useState([]);
  const [locations, setLocations] = useState([]);
  const [recommendations, setRecommendations] = useState([]);
  const { current, searchJobs } = useContext(JobsContext);
  const { isAuth } = useContext(AuthContext);
  const history = useHistory();
  const { t } = useTranslation();

  const localAuthToken = localStorage.getItem("authToken");
  useEffect(() => {
    fetchTitles().then((res) => setTitles(res.titles));
    fetchLocations().then((res) => setLocations(res.locations));
    // eslint-disable-next-line
  }, []);

  useEffect(() => {
    fetchRecommendations(localAuthToken).then((res) =>
      setRecommendations(res.recommended_courses)
    );
  }, [isAuth]);

  const initialValues = {
    title: "",
    location: "",
  };

  const { register, handleSubmit, errors, watch } = useForm({
    mode: "onChange",
    reValidateMode: "onChange",
    defaultValues: initialValues,
  });

  const onSubmit = (data) => {
    if (data.title === "" && data.location === "") {
      setErrorField(true);
    } else {
      searchJobs(data);
      history.push("/jobs");
    }
  };

  return (
    <>
      <Grid container spacing={3}>
        <Grid item xs={12} md={8}>
          <Paper elevation={8} square className={classes.paper}>
            <form className={classes.form} onSubmit={handleSubmit(onSubmit)}>
              <Grid
                container
                direction='row'
                justify='center'
                alignItems='center'
                spacing={3}
              >
                <Grid item md xs={12}>
                  <Autocomplete
                    id='tags-outlined'
                    options={titles}
                    getOptionLabel={(titles) => titles}
                    filterSelectedOptions
                    renderInput={(params) => (
                      <TextField
                        {...params}
                        variant='outlined'
                        color='secondary'
                        label={t("Job Title")}
                        placeholder={t("Job Title")}
                        type='text'
                        name='title'
                        inputRef={register}
                        error={!!errorField}
                        helperText={
                          !!errorField &&
                          "Enter a job title or location to start a search"
                        }
                      />
                    )}
                  />
                </Grid>
                <Grid item md xs={12}>
                  <Autocomplete
                    id='tags-outlined'
                    options={locations}
                    getOptionLabel={(locations) => locations}
                    filterSelectedOptions
                    renderInput={(params) => (
                      <TextField
                        {...params}
                        variant='outlined'
                        color='secondary'
                        label={t("Location")}
                        placeholder={t("Location")}
                        type='text'
                        name='location'
                        inputRef={register}
                        error={!!errorField}
                        helperText={
                          !!errorField &&
                          "Enter a job title or location to start a search"
                        }
                      />
                    )}
                  />
                </Grid>
                <Grid item md xs={12}>
                  <Button
                    type='submit'
                    variant='contained'
                    color='secondary'
                    className={classes.btoon}
                    fullWidth
                  >
                    {t("Find Jobs")}
                  </Button>
                </Grid>
              </Grid>
            </form>
          </Paper>
        </Grid>

        <Grid item xs={12} md={4}>
          {current.length > 0 && (
            <Typography
              style={{
                marginTop: "8rem",
                textAlign: "center",
                fontWeight: "500",
              }}
              variant='h4'
              gutterBottom
            >
              Recently Viewed Jobs
            </Typography>
          )}
          {current.length > 0 &&
            current.map((job, index) => (
              <JobAccordion index={index} job={job} />
            ))}
        </Grid>
      </Grid>

      {/* {current.length > 2 ? (
        <Grid
          container
          direction='row'
          justify='center'
          alignItems='center'
          spacing={3}
        >
          <Grid item md xs={12}>
            <Typography
              style={{
                marginTop: "10rem",
                textAlign: "center",
                fontWeight: "500",
              }}
              variant='h4'
              gutterBottom
            >
              Recently Viewed Jobs
            </Typography>
            <CourseCarousel job={true} recommendations={current} />
          </Grid>
        </Grid>
      ) : (
        <span></span>
      )} */}

      {isAuth ? (
        <Grid
          container
          direction='row'
          justify='center'
          alignItems='center'
          spacing={3}
        >
          <Grid item md xs={12}>
            <Typography
              style={{
                marginTop: "10rem",
                textAlign: "center",
                fontWeight: "500",
              }}
              variant='h4'
              gutterBottom
            >
              Recommended Courses
            </Typography>
            <CourseCarousel job={false} recommendations={recommendations} />
          </Grid>
        </Grid>
      ) : (
        <span></span>
      )}
    </>
  );
};

export default Home;
