import React, { createContext, useReducer } from "react";
import config from "../../config";

import jobsReducer from "./jobsReducer";
import {
  FETCH_JOBS,
  FETCH_APPLIED_JOBS,
  SET_LOADING,
  SET_CURRENT,
  CLEAR_CURRENT,
} from "./types";

const initialState = {
  jobs: [],
  appliedJobs: [],
  job: {},
  loading: false,
  current: [],
};

export const JobsContext = createContext(initialState);

export const JobsProvider = ({ children }) => {
  const [state, dispatch] = useReducer(jobsReducer, initialState);

  const fetchJobs = () => {
    setLoading();

    var myHeaders = new Headers();
    myHeaders.append("Content-Type", "application/json");
    var raw = JSON.stringify({
      location: "",
      title: "",
      start: "",
      end: "",
    });

    var requestOptions = {
      method: "POST",
      headers: myHeaders,
      body: raw,
    };

    fetch(config.server + "/fetch-jobs", requestOptions)
      .then((response) => response.json())
      .then((result) =>
        dispatch({
          type: FETCH_JOBS,
          payload: result,
        })
      )
      .catch((err) => console.log(err));
  };

  const searchJobs = (data) => {
    setLoading();

    var myHeaders = new Headers();
    myHeaders.append("Content-Type", "application/json");
    var raw = JSON.stringify({
      location: data.location,
      title: data.title,
    });

    var requestOptions = {
      method: "POST",
      headers: myHeaders,
      body: raw,
    };

    fetch(config.server + "/fetch-jobs", requestOptions)
      .then((response) => response.json())
      .then((result) =>
        dispatch({
          type: FETCH_JOBS,
          payload: result,
        })
      )
      .catch((err) => console.log(err));
  };

  const fetchAppliedJobs = (token) => {
    var myHeaders = new Headers();
    myHeaders.append("Content-Type", "application/json");
    myHeaders.append("Authorization", token);

    var requestOptions = {
      method: "GET",
      headers: myHeaders,
      redirect: "follow",
    };

    return fetch(config.server + "/user-applied-jobs", requestOptions)
      .then((response) => response.json())
      .then((res) =>
        dispatch({
          type: FETCH_APPLIED_JOBS,
          payload: res.appliedjobs,
        })
      )
      .catch((err) => {
        console.log(err);
        return false;
      });
  };

  const applyJob = (data, job, token) => {
    setLoading();

    var myHeaders = new Headers();
    myHeaders.append("Content-Type", "application/json");
    myHeaders.append("Authorization", token);
    var raw = JSON.stringify({
      answer: data.answer,
      job_id: job.job_id,
    });

    var requestOptions = {
      method: "POST",
      headers: myHeaders,
      body: raw,
    };

    return fetch(config.server + "/enroll-job", requestOptions)
      .then((response) => (response.status === 200 ? true : false))
      .catch((err) => console.log(err));
  };

  const setLoading = () => dispatch({ type: SET_LOADING });

  // Set Current Job
  const setCurrent = (job) => {
    if (state.current.length < 10) {
      dispatch({ type: SET_CURRENT, payload: job });
    } else {
      state.current.pop();
      dispatch({ type: SET_CURRENT, payload: job });
    }
    state.current = [...new Set(state.current)];
  };

  // Clear Current Job
  const clearCurrent = () => {
    dispatch({ type: CLEAR_CURRENT });
  };

  return (
    <JobsContext.Provider
      value={{
        job: state.job,
        jobs: state.jobs,
        appliedJobs: state.appliedJobs,
        loading: state.loading,
        current: state.current,
        fetchJobs,
        searchJobs,
        fetchAppliedJobs,
        setLoading,
        setCurrent,
        clearCurrent,
        applyJob,
      }}
    >
      {children}
    </JobsContext.Provider>
  );
};
