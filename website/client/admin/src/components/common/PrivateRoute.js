import React, { useContext } from 'react'
import { Route, Redirect } from 'react-router-dom'

import { AuthContext } from '../../context/authContext/authContext'

const PrivateRoute = ({ component: Component, ...rest }) => {
	const { authToken } = useContext(AuthContext)

	return (
		<Route
			{...rest}
			render={(props) =>
				authToken ? <Component {...props} /> : <Redirect to='/login' />
			}
		/>
	)
}

export default PrivateRoute
