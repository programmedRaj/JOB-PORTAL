import React from "react";
import { makeStyles } from "@material-ui/core/styles";
import clsx from "clsx";
import Accordion from "@material-ui/core/Accordion";
import AccordionDetails from "@material-ui/core/AccordionDetails";
import AccordionSummary from "@material-ui/core/AccordionSummary";
import AccordionActions from "@material-ui/core/AccordionActions";
import Typography from "@material-ui/core/Typography";
import ExpandMoreIcon from "@material-ui/icons/ExpandMore";
import Box from "@material-ui/core/Box";
import Button from "@material-ui/core/Button";
import Divider from "@material-ui/core/Divider";
import { useTranslation } from "react-i18next";

import Table from "@material-ui/core/Table";
import TableBody from "@material-ui/core/TableBody";
import TableCell from "@material-ui/core/TableCell";
import TableContainer from "@material-ui/core/TableContainer";
import Grid from "@material-ui/core/Grid";
import TableRow from "@material-ui/core/TableRow";
import Paper from "@material-ui/core/Paper";

const useStyles = makeStyles((theme) => ({
  root: {
    width: "100%",
  },
  heading: {
    fontSize: theme.typography.pxToRem(15),
  },
  secondaryHeading: {
    fontSize: theme.typography.pxToRem(15),
    color: theme.palette.text.secondary,
  },
  icon: {
    verticalAlign: "bottom",
    height: 20,
    width: 20,
  },
  details: {
    alignItems: "center",
  },
  column: {
    flexBasis: "33.33%",
  },
  helper: {
    borderLeft: `2px solid ${theme.palette.divider}`,
    padding: theme.spacing(1, 2),
  },
  link: {
    color: theme.palette.primary.main,
    textDecoration: "none",
    "&:hover": {
      textDecoration: "underline",
    },
  },
}));

const JobAccordion = ({ job, index }) => {
  const classes = useStyles();
  const { t } = useTranslation();

  const { pos_names } = job;

  return (
    <div className={classes.root}>
      <Accordion>
        <AccordionSummary
          expandIcon={<ExpandMoreIcon />}
          aria-controls='panel1c-content'
          id='panel1c-header'
        >
          <Box style={{ overflow: "hidden" }}>
            <Typography className={classes.heading}>{pos_names}</Typography>
          </Box>
        </AccordionSummary>
        <AccordionDetails className={classes.details}>
          <TableContainer component={Paper} elevation={4}>
            <Table className={classes.table} aria-label='simple table'>
              <TableBody>
                <TableRow>
                  <TableCell align='left' component='th' scope='row'>
                    {t("No. of Positions")}
                  </TableCell>
                  <TableCell align='right'>{job.no_postions}</TableCell>
                </TableRow>
                <TableRow>
                  <TableCell align='left' component='th' scope='row'>
                    {t("Stipend")}
                  </TableCell>
                  <TableCell align='right'>{job.stipend}</TableCell>
                </TableRow>
                <TableRow>
                  <TableCell align='left' component='th' scope='row'>
                    {t("Job Location")}
                  </TableCell>
                  <TableCell align='right'>{job.interveiw_loc}</TableCell>
                </TableRow>
                <TableRow>
                  <TableCell align='left' component='th' scope='row'>
                    {t("Interview Mode")}
                  </TableCell>
                  <TableCell align='right'>{job.interview_mode}</TableCell>
                </TableRow>
                <TableRow>
                  <TableCell align='left' component='th' scope='row'>
                    {t("Interview Date")}
                  </TableCell>
                  <TableCell align='right'>
                    {new Date(job.date_time_interview).toLocaleDateString(
                      "en-GB"
                    )}
                  </TableCell>
                </TableRow>
                <TableRow>
                  <TableCell align='left' component='th' scope='row'>
                    {t("Closing Date")}
                  </TableCell>
                  <TableCell align='right'>
                    {new Date(job.closing_date).toLocaleDateString("en-GB")}
                  </TableCell>
                </TableRow>
              </TableBody>
            </Table>
          </TableContainer>
        </AccordionDetails>
        <Divider />
        <AccordionActions>
          <Button size='small' color='secondary'>
            Enrol
          </Button>
        </AccordionActions>
      </Accordion>
    </div>
  );
};
export default JobAccordion;
