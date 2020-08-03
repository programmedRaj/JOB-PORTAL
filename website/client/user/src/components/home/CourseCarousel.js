import React from "react";

import { makeStyles } from "@material-ui/core/styles";
import Container from "@material-ui/core/Container";
import Box from "@material-ui/core/Box";
import Typography from "@material-ui/core/Typography";
import Divider from "@material-ui/core/Divider";
import Slider from "react-slick";
import "slick-carousel/slick/slick.css";
import "slick-carousel/slick/slick-theme.css";
import CourseCard from "../courses/CourseCard";
import JobCard from "../jobs/JobCard";

const CourseCarousel = ({ job, recommendations }) => {
  const slickSettings = {
    dots: false,
    infinite: true,
    speed: 500,
    autoplay: true,
    autoplaySpeed: 2000,
    slidesToShow: 3,
    slidesToScroll: 1,
    arrows: true,
  };

  return (
    <Container>
      <Divider style={{ marginTop: "1rem", marginBottom: "1rem" }} />
      {job ? (
        <Slider {...slickSettings}>
          {recommendations &&
            recommendations.map((recommendation, index) => (
              <Box px={3} mb={5} mt={1}>
                <JobCard key={index} job={recommendation} />
              </Box>
            ))}
        </Slider>
      ) : (
        <Slider {...slickSettings}>
          {recommendations &&
            recommendations.map((recommendation, index) => (
              <Box px={1} mb={5} mt={1}>
                <CourseCard key={index} course={recommendation} />
              </Box>
            ))}
        </Slider>
      )}
    </Container>
  );
};

export default CourseCarousel;
