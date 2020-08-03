import React, { useState, useEffect, useContext, forwardRef } from 'react'

import { makeStyles } from '@material-ui/core/styles'
import Dialog from '@material-ui/core/Dialog'
import Box from '@material-ui/core/Box'
import Container from '@material-ui/core/Container'
import Divider from '@material-ui/core/Divider'
import AppBar from '@material-ui/core/AppBar'
import Toolbar from '@material-ui/core/Toolbar'
import IconButton from '@material-ui/core/IconButton'
import Typography from '@material-ui/core/Typography'
import CloseIcon from '@material-ui/icons/Close'
import Slide from '@material-ui/core/Slide'

import Table from '@material-ui/core/Table'
import TableBody from '@material-ui/core/TableBody'
import TableCell from '@material-ui/core/TableCell'
import TableContainer from '@material-ui/core/TableContainer'
import Grid from '@material-ui/core/Grid'
import TableRow from '@material-ui/core/TableRow'
import Paper from '@material-ui/core/Paper'
import TextField from '@material-ui/core/TextField'
import Radio from '@material-ui/core/Radio'

import { AuthContext } from '../../context/authContext/authContext'

import { useTranslation } from 'react-i18next'
import { Button } from '@material-ui/core'

const useStyles = makeStyles((theme) => ({
	appBar: {
		position: 'relative'
	},
	title: {
		marginLeft: theme.spacing(2),
		flex: 1
	},
	body: {
		marginTop: theme.spacing(5)
	}
}))

const Transition = forwardRef(function Transition(props, ref) {
	return <Slide direction='up' ref={ref} {...props} />
})

const QuizForm = ({ quizOpen, setQuizOpen, questions, setQuestions }) => {
	const classes = useStyles()

	const [question, setQuestion] = useState({
		Q: '',
		A: {
			'1': '',
			'2': '',
			'3': '',
			'4': '',
			valid: ''
		}
	})

	const handleClose = () => {
		setQuizOpen(false)
	}

	const handleAnswer = (e) => {
		setQuestion({
			...question,
			A: {
				...question.A,
				[e.target.name]: e.target.value
			}
		})
	}

	const handleQuestion = (e) => {
		setQuestion({
			...question,
			Q: e.target.value
		})
	}

	const handleValidAns = (e) => {
		setQuestion({
			...question,
			A: {
				...question.A,
				valid: e.target.value
			}
		})
	}

	const handleQuestions = () => {
		setQuestions([...questions, question])
	}

	const { t } = useTranslation()

	return (
		<Dialog
			fullScreen
			open={quizOpen}
			onClose={handleClose}
			TransitionComponent={Transition}
		>
			<Box>
				<AppBar className={classes.appBar}>
					<Toolbar>
						<Typography variant='h6' className={classes.title}>
							Add Questions for Quiz
						</Typography>
						<IconButton
							edge='start'
							color='inherit'
							onClick={handleClose}
							aria-label='close'
						>
							<CloseIcon />
						</IconButton>
					</Toolbar>
				</AppBar>
				<Container className={classes.body}>
					<Box m={3}>
						<Paper elevation={4}>
							<Box p={3} my={2}>
								<Typography variant='body2'>
									Question {questions.length + 1}
								</Typography>
								<TextField
									fullWidth
									variant='outlined'
									margin='dense'
									label={`Question ${questions.length + 1}`}
									value={question.Q}
									name={questions.length.toString()}
									onChange={handleQuestion}
								/>
								<Box my={2}>
									<Grid container spacing={3}>
										<Grid item sm={6}>
											<TextField
												fullWidth
												variant='outlined'
												margin='dense'
												name='1'
												label='Answer 1'
												color='secondary'
												value={question.A[1]}
												onChange={handleAnswer}
												InputLabelProps={{ shrink: true }}
											/>
											<label htmlFor='answer1'>
												<input
													type='radio'
													name='answer'
													value='1'
													id='answer1'
													onChange={handleValidAns}
												/>
												Choose as Right answer?
											</label>
										</Grid>
										<Grid item sm={6}>
											<TextField
												fullWidth
												variant='outlined'
												margin='dense'
												name='2'
												label='Answer 2'
												color='secondary'
												value={question.A[2]}
												onChange={handleAnswer}
												InputLabelProps={{ shrink: true }}
											/>
											<label htmlFor='answer2'>
												<input
													type='radio'
													name='answer'
													value='2'
													id='answer2'
													onChange={handleValidAns}
												/>
												Choose as Right answer?
											</label>
										</Grid>
										<Grid item sm={6}>
											<TextField
												fullWidth
												variant='outlined'
												margin='dense'
												name='3'
												label='Answer 3'
												color='secondary'
												value={question.A[3]}
												onChange={handleAnswer}
												InputLabelProps={{ shrink: true }}
											/>
											<label htmlFor='answer3'>
												<input
													type='radio'
													name='answer'
													value='3'
													id='answer3'
													onChange={handleValidAns}
												/>
												Choose as Right answer?
											</label>
										</Grid>
										<Grid item sm={6}>
											<TextField
												fullWidth
												variant='outlined'
												margin='dense'
												name='4'
												label='Answer 4'
												color='secondary'
												value={question.A[4]}
												onChange={handleAnswer}
												InputLabelProps={{ shrink: true }}
											/>
											<label htmlFor='answer4'>
												<input
													type='radio'
													name='answer'
													value='4'
													id='answer4'
													onChange={handleValidAns}
												/>
												Choose as Right answer?
											</label>
										</Grid>
									</Grid>
								</Box>
							</Box>
						</Paper>
					</Box>
					<Box display='flex' justifyContent='space-around' my={5}>
						<Button
							onClick={handleQuestions}
							variant='contained'
							color='secondary'
							disabled={
								question.Q.length === 0 || question.A.valid.length === 0
							}
						>
							Add Question
						</Button>
						{questions.length > 0 && (
							<Button onClick={handleClose} variant='contained'>
								Done
							</Button>
						)}
					</Box>
					<Box mt={5}>
						{questions.length > 0 ? (
							<Typography gutterBottom variant='h4'>
								Added Questions
							</Typography>
						) : (
							<span />
						)}
						<Grid container spacing={5}>
							{questions.length > 0 &&
								questions.map((qn, i) => (
									<Grid key={i} item sm={6}>
										<Paper elevation={2} style={{ height: '100%' }}>
											<Box p={5}>
												<Typography gutterBottom variant='body1'>
													Q: {qn.Q}
												</Typography>
												<Grid container spacing={1}>
													<Grid item sm={6}>
														<Typography variant='subtitle2'>
															(a): {qn.A['1']}
														</Typography>
													</Grid>
													<Grid item sm={6}>
														<Typography variant='subtitle2'>
															(b): {qn.A['2']}
														</Typography>
													</Grid>
													<Grid item sm={6}>
														<Typography variant='subtitle2'>
															(c): {qn.A['3']}
														</Typography>
													</Grid>
													<Grid item sm={6}>
														<Typography variant='subtitle2'>
															(d): {qn.A['4']}
														</Typography>
													</Grid>
												</Grid>
												<Typography variant='caption'>
													Correct Answer: {qn.A[qn.A.valid]}
												</Typography>
											</Box>
										</Paper>
									</Grid>
								))}
						</Grid>
					</Box>
				</Container>
			</Box>
		</Dialog>
	)
}

export default QuizForm
