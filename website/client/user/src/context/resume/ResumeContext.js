import React, { createContext, useReducer } from "react";
import config from "../../config";

import resumeReducer from "./resumeReducer";
import {
  FETCH_RESUME,
  ADD_EDU,
  RESUME_ERROR,
  SET_LOADING,
  ADD_WORKEX,
  ADD_JOBS,
  ADD_PROJECTS,
  ADD_TRAININGS,
  RESUME_OCR,
} from "./types";

const initialState = {
  resume: {},
  scanData: {},
  error: null,
  loading: false,
};

export const ResumeContext = createContext(initialState);

export const ResumeProvider = ({ children }) => {
  const [state, dispatch] = useReducer(resumeReducer, initialState);

  //   Fetchin The Whole Frigggggggin Resume
  const fetchResume = (token) => {
    // setLoading();

    var myHeaders = new Headers();
    myHeaders.append("Content-Type", "application/json");
    myHeaders.append("Authorization", token);
    var raw = JSON.stringify({
      want: "everything",
    });

    var requestOptions = {
      method: "POST",
      headers: myHeaders,
      body: raw,
    };

    fetch(config.server + "/resume-details", requestOptions)
      .then((response) => response.json())
      .then((result) =>
        dispatch({
          type: FETCH_RESUME,
          payload: result,
        })
      )
      .catch((err) =>
        dispatch({
          type: RESUME_ERROR,
          payload: err,
        })
      );
  };

  // Add Education Details
  const addEdu = (token, data) => {
    var myHeaders = new Headers();
    myHeaders.append("Content-Type", "application/json");
    myHeaders.append("Authorization", token);
    var raw = JSON.stringify({
      mode: "add",
      status: "pursuing",
      college: data.college,
      degree: data.degree,
      stream: data.stream,
      start_year: data.start_year,
      end_date: data.end_date,
    });

    var requestOptions = {
      method: "POST",
      headers: myHeaders,
      body: raw,
    };

    fetch(config.server + "/resume-edu", requestOptions)
      .then((response) => response.json())
      .then((result) =>
        dispatch({
          type: ADD_EDU,
          payload: result,
        })
      )
      .catch((err) => console.log(err));
    fetchResume(token);
  };

  // Add Job Details
  const addJobs = (token, data) => {
    var myHeaders = new Headers();
    myHeaders.append("Content-Type", "application/json");
    myHeaders.append("Authorization", token);
    var raw = JSON.stringify({
      mode: "add",
      job_title: data.job_title,
      organization: data.organization,
      job_location: data.job_location,
      start_date: data.start_date,
      end_date: data.end_date,
      description: "All Responsibilities under my Job Title",
      type: "Full Time",
    });

    var requestOptions = {
      method: "POST",
      headers: myHeaders,
      body: raw,
    };

    fetch(config.server + "/resume-workexp", requestOptions)
      .then((response) => response.json())
      .then((result) =>
        dispatch({
          type: ADD_JOBS,
          payload: result,
        })
      )
      .catch((err) => console.log(err));
    fetchResume(token);
  };

  // Add Projects Details
  const addProjects = (token, data) => {
    var myHeaders = new Headers();
    myHeaders.append("Content-Type", "application/json");
    myHeaders.append("Authorization", token);
    var raw = JSON.stringify({
      mode: "add",
      status: "pursuing",
      title: data.title,
      project_link: data.project_link,
      description: data.description,
      start_month: data.start_month,
      end_month: data.end_month,
    });

    var requestOptions = {
      method: "POST",
      headers: myHeaders,
      body: raw,
    };

    fetch(config.server + "/resume-projects", requestOptions)
      .then((response) => response.json())
      .then((result) =>
        dispatch({
          type: ADD_PROJECTS,
          payload: result,
        })
      )
      .catch((err) => console.log(err));
    fetchResume(token);
  };

  // Add Training Details
  const addTraining = (token, data) => {
    var myHeaders = new Headers();
    myHeaders.append("Content-Type", "application/json");
    myHeaders.append("Authorization", token);
    var raw = JSON.stringify({
      mode: "add",
      program_name: data.program_name,
      organization_name: data.organization_name,
      description: data.description,
      location: data.location,
      start_date: data.start_date,
      end_date: data.end_date,
    });

    var requestOptions = {
      method: "POST",
      headers: myHeaders,
      body: raw,
    };

    fetch(config.server + "/resume-trainings", requestOptions)
      .then((response) => response.json())
      .then((result) =>
        dispatch({
          type: ADD_TRAININGS,
          payload: result,
        })
      )
      .catch((err) => console.log(err));
    fetchResume(token);
  };

  // Add WorkDetails
  const addWork = (token, data) => {
    var myHeaders = new Headers();
    myHeaders.append("Content-Type", "application/json");
    myHeaders.append("Authorization", token);
    var raw = JSON.stringify({
      mode: "add",
      blog: data.blog,
      github: data.github,
      portfolio: data.portfolio,
    });

    var requestOptions = {
      method: "POST",
      headers: myHeaders,
      body: raw,
    };

    fetch(config.server + "/resume-work", requestOptions)
      .then((response) => response.json())
      .then((result) =>
        dispatch({
          type: ADD_WORKEX,
          payload: result,
        })
      )
      .catch((err) => console.log(err));
    fetchResume(token);
  };

  const scanResume = (file, fileInput, token) => {
    let myHeaders = new Headers();

    myHeaders.append("Authorization", token);

    let formdata = new FormData();
    for (let i = 0; i < file.length; i++) {
      formdata.append("file", fileInput.files[0], file[i].name);
    }

    let requestOptions = {
      method: "POST",
      body: formdata,
      headers: myHeaders,
      redirect: "follow",
    };
    setLoading(true);
    fetch(config.server + "/resume-ocr", requestOptions)
      .then((response) => response.json())
      .then((result) => {
        dispatch({
          type: RESUME_OCR,
          payload: result,
        });
        setLoading(false);
      })
      .catch((error) => console.log("error", error));
  };

  const setLoading = (value) => dispatch({ type: SET_LOADING, payload: value });

  return (
    <ResumeContext.Provider
      value={{
        resume: state.resume,
        scanData: state.scanData,
        loading: state.loading,
        error: state.error,
        fetchResume,
        addEdu,
        addJobs,
        addProjects,
        addTraining,
        addWork,
        setLoading,
        scanResume,
      }}
    >
      {children}
    </ResumeContext.Provider>
  );
};
