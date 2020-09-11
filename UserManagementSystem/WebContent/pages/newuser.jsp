<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/header.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/sideNavbar.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/newuser.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/themify-icons.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/dropify/dist/css/dropify.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<title>User Management</title>
</head>
<body>
	<div class="main-container">
		<%@include file="header.jsp"%>
		<div class="container">
			<%@include file="sideNavbar.jsp"%>
			<div class="main-content" id="main-content">
				<div class="content-heading">
					<div class="page-title">
						<p>New User</p>
					</div>
					<div class="home-link">
						<a href="dashboard"><i class="ti-home"></i> Home</a> / New User
					</div>
				</div>
				<form action="register" method="post" enctype="multipart/form-data"
					class="form" onsubmit="return checkPassword(this)">
					<div class="form-container">
						<p style="text-align: center;">${registerMessage}</p>
						<div class="form-sub-container">
							<div class="general panel">
								<div class="panel-title">General</div>
								<div class="panel-body">
									<div class="form-group">
										<div>
											<label class="control-label">First Name</label>
										</div>
										<div>
											<input name="firstName" type="text" class="form-control"
												pattern="^[A-Z][a-z]{3,}$"
												title="Firstname should start with uppercase remaining letters should be in lowercase. e.g. John"
												required>
										</div>
									</div>
									<div class="form-group">
										<div>
											<label class="control-label">Middle Name</label>
										</div>
										<div>
											<input name="middleName" type="text" class="form-control"
												pattern="^[A-Z][a-z]{3,}$"
												title="Middle should start with uppercase remaining letters should be in lowercase.">
										</div>
									</div>
									<div class="form-group">
										<div>
											<label class="control-label">Last Name</label>
										</div>
										<div>
											<input name="lastName" type="text" class="form-control"
												pattern="^[A-Z][a-z]{3,}$"
												title="LastName should start with uppercase remaining letters should be in lowercase."
												required>
										</div>
									</div>
									<div class="form-group">
										<div>
											<label class="control-label">Date of Birth</label>
										</div>
										<div>
											<input id="dob" name="dob" type="date" id="dob"
												placeholder="dd-mm-yyyy" max="2020-07-29"
												onclick="currentDate();" class="form-control" required>
										</div>
									</div>
									<div class="form-group">
										<div>
											<label class="control-label">Gender</label>
										</div>
										<div>
											<select name="gender" class="form-control select" required>
												<option value="">-- Select --</option>
												<option value="Male">Male</option>
												<option value="Female">Female</option>
											</select>
										</div>
									</div>
									<div class="form-group">
										<div>
											<label class="control-label">Country</label>
										</div>
										<div>
											<select name="country" class="form-control select" required>
												<option value="">-- Select --</option>
												<option value="Afghanistan">Afghanistan</option>
												<option value="Åland Islands">Aland Islands</option>
												<option value="Albania">Albania</option>
												<option value="Algeria">Algeria</option>
												<option value="American Samoa">American Samoa</option>
												<option value="Andorra">Andorra</option>
												<option value="Angola">Angola</option>
												<option value="Anguilla">Anguilla</option>
												<option value="Antarctica">Antarctica</option>
												<option value="Antigua and Barbuda">Antigua and
													Barbuda</option>
												<option value="Argentina">Argentina</option>
												<option value="Armenia">Armenia</option>
												<option value="Aruba">Aruba</option>
												<option value="Australia">Australia</option>
												<option value="Austria">Austria</option>
												<option value="Azerbaijan">Azerbaijan</option>
												<option value="Bahamas">Bahamas</option>
												<option value="Bahrain">Bahrain</option>
												<option value="Bangladesh">Bangladesh</option>
												<option value="Barbados">Barbados</option>
												<option value="Belarus">Belarus</option>
												<option value="Belgium">Belgium</option>
												<option value="Belize">Belize</option>
												<option value="Benin">Benin</option>
												<option value="Bermuda">Bermuda</option>
												<option value="Bhutan">Bhutan</option>
												<option value="Bolivia">Bolivia</option>
												<option value="Bosnia and Herzegovina">Bosnia and
													Herzegovina</option>
												<option value="Botswana">Botswana</option>
												<option value="Bouvet Island">Bouvet Island</option>
												<option value="Brazil">Brazil</option>
												<option value="British Indian Ocean Territory">British
													Indian Ocean Territory</option>
												<option value="Brunei Darussalam">Brunei Darussalam</option>
												<option value="Bulgaria">Bulgaria</option>
												<option value="Burkina Faso">Burkina Faso</option>
												<option value="Burundi">Burundi</option>
												<option value="Cambodia">Cambodia</option>
												<option value="Cameroon">Cameroon</option>
												<option value="Canada">Canada</option>
												<option value="Cape Verde">Cape Verde</option>
												<option value="Cayman Islands">Cayman Islands</option>
												<option value="Central African Republic">Central
													African Republic</option>
												<option value="Chad">Chad</option>
												<option value="Chile">Chile</option>
												<option value="China">China</option>
												<option value="Christmas Island">Christmas Island</option>
												<option value="Cocos (Keeling) Islands">Cocos
													(Keeling) Islands</option>
												<option value="Colombia">Colombia</option>
												<option value="Comoros">Comoros</option>
												<option value="Congo">Congo</option>
												<option value="Congo, The Democratic Republic of The">Congo,
													The Democratic Republic of The</option>
												<option value="Cook Islands">Cook Islands</option>
												<option value="Costa Rica">Costa Rica</option>
												<option value="Cote D'ivoire">Cote D'ivoire</option>
												<option value="Croatia">Croatia</option>
												<option value="Cuba">Cuba</option>
												<option value="Cyprus">Cyprus</option>
												<option value="Czech Republic">Czech Republic</option>
												<option value="Denmark">Denmark</option>
												<option value="Djibouti">Djibouti</option>
												<option value="Dominica">Dominica</option>
												<option value="Dominican Republic">Dominican
													Republic</option>
												<option value="Ecuador">Ecuador</option>
												<option value="Egypt">Egypt</option>
												<option value="El Salvador">El Salvador</option>
												<option value="Equatorial Guinea">Equatorial Guinea</option>
												<option value="Eritrea">Eritrea</option>
												<option value="Estonia">Estonia</option>
												<option value="Ethiopia">Ethiopia</option>
												<option value="Falkland Islands (Malvinas)">Falkland
													Islands (Malvinas)</option>
												<option value="Faroe Islands">Faroe Islands</option>
												<option value="Fiji">Fiji</option>
												<option value="Finland">Finland</option>
												<option value="France">France</option>
												<option value="French Guiana">French Guiana</option>
												<option value="French Polynesia">French Polynesia</option>
												<option value="French Southern Territories">French
													Southern Territories</option>
												<option value="Gabon">Gabon</option>
												<option value="Gambia">Gambia</option>
												<option value="Georgia">Georgia</option>
												<option value="Germany">Germany</option>
												<option value="Ghana">Ghana</option>
												<option value="Gibraltar">Gibraltar</option>
												<option value="Greece">Greece</option>
												<option value="Greenland">Greenland</option>
												<option value="Grenada">Grenada</option>
												<option value="Guadeloupe">Guadeloupe</option>
												<option value="Guam">Guam</option>
												<option value="Guatemala">Guatemala</option>
												<option value="Guernsey">Guernsey</option>
												<option value="Guinea">Guinea</option>
												<option value="Guinea-bissau">Guinea-bissau</option>
												<option value="Guyana">Guyana</option>
												<option value="Haiti">Haiti</option>
												<option value="Heard Island and Mcdonald Islands">Heard
													Island and Mcdonald Islands</option>
												<option value="Holy See (Vatican City State)">Holy
													See (Vatican City State)</option>
												<option value="Honduras">Honduras</option>
												<option value="Hong Kong">Hong Kong</option>
												<option value="Hungary">Hungary</option>
												<option value="Iceland">Iceland</option>
												<option value="India">India</option>
												<option value="Indonesia">Indonesia</option>
												<option value="Iran, Islamic Republic of">Iran,
													Islamic Republic of</option>
												<option value="Iraq">Iraq</option>
												<option value="Ireland">Ireland</option>
												<option value="Isle of Man">Isle of Man</option>
												<option value="Israel">Israel</option>
												<option value="Italy">Italy</option>
												<option value="Jamaica">Jamaica</option>
												<option value="Japan">Japan</option>
												<option value="Jersey">Jersey</option>
												<option value="Jordan">Jordan</option>
												<option value="Kazakhstan">Kazakhstan</option>
												<option value="Kenya">Kenya</option>
												<option value="Kiribati">Kiribati</option>
												<option value="Korea, Democratic People's Republic of">Korea,
													Democratic People's Republic of</option>
												<option value="Korea, Republic of">Korea, Republic
													of</option>
												<option value="Kuwait">Kuwait</option>
												<option value="Kyrgyzstan">Kyrgyzstan</option>
												<option value="Lao People's Democratic Republic">Lao
													People's Democratic Republic</option>
												<option value="Latvia">Latvia</option>
												<option value="Lebanon">Lebanon</option>
												<option value="Lesotho">Lesotho</option>
												<option value="Liberia">Liberia</option>
												<option value="Libyan Arab Jamahiriya">Libyan Arab
													Jamahiriya</option>
												<option value="Liechtenstein">Liechtenstein</option>
												<option value="Lithuania">Lithuania</option>
												<option value="Luxembourg">Luxembourg</option>
												<option value="Macao">Macao</option>
												<option value="Macedonia, The Former Yugoslav Republic of">Macedonia,
													The Former Yugoslav Republic of</option>
												<option value="Madagascar">Madagascar</option>
												<option value="Malawi">Malawi</option>
												<option value="Malaysia">Malaysia</option>
												<option value="Maldives">Maldives</option>
												<option value="Mali">Mali</option>
												<option value="Malta">Malta</option>
												<option value="Marshall Islands">Marshall Islands</option>
												<option value="Martinique">Martinique</option>
												<option value="Mauritania">Mauritania</option>
												<option value="Mauritius">Mauritius</option>
												<option value="Mayotte">Mayotte</option>
												<option value="Mexico">Mexico</option>
												<option value="Micronesia, Federated States of">Micronesia,
													Federated States of</option>
												<option value="Moldova, Republic of">Moldova,
													Republic of</option>
												<option value="Monaco">Monaco</option>
												<option value="Mongolia">Mongolia</option>
												<option value="Montenegro">Montenegro</option>
												<option value="Montserrat">Montserrat</option>
												<option value="Morocco">Morocco</option>
												<option value="Mozambique">Mozambique</option>
												<option value="Myanmar">Myanmar</option>
												<option value="Namibia">Namibia</option>
												<option value="Nauru">Nauru</option>
												<option value="Nepal">Nepal</option>
												<option value="Netherlands">Netherlands</option>
												<option value="Netherlands Antilles">Netherlands
													Antilles</option>
												<option value="New Caledonia">New Caledonia</option>
												<option value="New Zealand">New Zealand</option>
												<option value="Nicaragua">Nicaragua</option>
												<option value="Niger">Niger</option>
												<option value="Nigeria">Nigeria</option>
												<option value="Niue">Niue</option>
												<option value="Norfolk Island">Norfolk Island</option>
												<option value="Northern Mariana Islands">Northern
													Mariana Islands</option>
												<option value="Norway">Norway</option>
												<option value="Oman">Oman</option>
												<option value="Pakistan">Pakistan</option>
												<option value="Palau">Palau</option>
												<option value="Palestinian Territory, Occupied">Palestinian
													Territory, Occupied</option>
												<option value="Panama">Panama</option>
												<option value="Papua New Guinea">Papua New Guinea</option>
												<option value="Paraguay">Paraguay</option>
												<option value="Peru">Peru</option>
												<option value="Philippines">Philippines</option>
												<option value="Pitcairn">Pitcairn</option>
												<option value="Poland">Poland</option>
												<option value="Portugal">Portugal</option>
												<option value="Puerto Rico">Puerto Rico</option>
												<option value="Qatar">Qatar</option>
												<option value="Reunion">Reunion</option>
												<option value="Romania">Romania</option>
												<option value="Russian Federation">Russian
													Federation</option>
												<option value="Rwanda">Rwanda</option>
												<option value="Saint Helena">Saint Helena</option>
												<option value="Saint Kitts and Nevis">Saint Kitts
													and Nevis</option>
												<option value="Saint Lucia">Saint Lucia</option>
												<option value="Saint Pierre and Miquelon">Saint
													Pierre and Miquelon</option>
												<option value="Saint Vincent and The Grenadines">Saint
													Vincent and The Grenadines</option>
												<option value="Samoa">Samoa</option>
												<option value="San Marino">San Marino</option>
												<option value="Sao Tome and Principe">Sao Tome and
													Principe</option>
												<option value="Saudi Arabia">Saudi Arabia</option>
												<option value="Senegal">Senegal</option>
												<option value="Serbia">Serbia</option>
												<option value="Seychelles">Seychelles</option>
												<option value="Sierra Leone">Sierra Leone</option>
												<option value="Singapore">Singapore</option>
												<option value="Slovakia">Slovakia</option>
												<option value="Slovenia">Slovenia</option>
												<option value="Solomon Islands">Solomon Islands</option>
												<option value="Somalia">Somalia</option>
												<option value="South Africa">South Africa</option>
												<option value="South Georgia and The South Sandwich Islands">South
													Georgia and The South Sandwich Islands</option>
												<option value="Spain">Spain</option>
												<option value="Sri Lanka">Sri Lanka</option>
												<option value="Sudan">Sudan</option>
												<option value="Suriname">Suriname</option>
												<option value="Svalbard and Jan Mayen">Svalbard and
													Jan Mayen</option>
												<option value="Swaziland">Swaziland</option>
												<option value="Sweden">Sweden</option>
												<option value="Switzerland">Switzerland</option>
												<option value="Syrian Arab Republic">Syrian Arab
													Republic</option>
												<option value="Taiwan, Province of China">Taiwan,
													Province of China</option>
												<option value="Tajikistan">Tajikistan</option>
												<option value="Tanzania, United Republic of">Tanzania,
													United Republic of</option>
												<option value="Thailand">Thailand</option>
												<option value="Timor-leste">Timor-leste</option>
												<option value="Togo">Togo</option>
												<option value="Tokelau">Tokelau</option>
												<option value="Tonga">Tonga</option>
												<option value="Trinidad and Tobago">Trinidad and
													Tobago</option>
												<option value="Tunisia">Tunisia</option>
												<option value="Turkey">Turkey</option>
												<option value="Turkmenistan">Turkmenistan</option>
												<option value="Turks and Caicos Islands">Turks and
													Caicos Islands</option>
												<option value="Tuvalu">Tuvalu</option>
												<option value="Uganda">Uganda</option>
												<option value="Ukraine">Ukraine</option>
												<option value="United Arab Emirates">United Arab
													Emirates</option>
												<option value="United Kingdom">United Kingdom</option>
												<option value="United States">United States</option>
												<option value="United States Minor Outlying Islands">United
													States Minor Outlying Islands</option>
												<option value="Uruguay">Uruguay</option>
												<option value="Uzbekistan">Uzbekistan</option>
												<option value="Vanuatu">Vanuatu</option>
												<option value="Venezuela">Venezuela</option>
												<option value="Viet Nam">Viet Nam</option>
												<option value="Virgin Islands, British">Virgin
													Islands, British</option>
												<option value="Virgin Islands, U.S.">Virgin
													Islands, U.S.</option>
												<option value="Wallis and Futuna">Wallis and Futuna</option>
												<option value="Western Sahara">Western Sahara</option>
												<option value="Yemen">Yemen</option>
												<option value="Zambia">Zambia</option>
												<option value="Zimbabwe">Zimbabwe</option>
											</select>
										</div>
									</div>
									<div class="form-group">
										<div>
											<label class="control-label">Phone</label>
										</div>
										<div>
											<input name="phoneNumber" type="tel" class="form-control"
												pattern="^\d{10}$" title="Phone number must be 10 digits"
												required><br />
										</div>
									</div>
									<div class="form-group">
										<div>
											<label class="control-label">Alternate Number</label>
										</div>
										<div>
											<input name="alternateNumber" type="tel" pattern="^\d{10}$"
												title="Phone number must be 10 digits" class="form-control"><br />
										</div>
									</div>
									<div class="form-group">
										<div>
											<label class="control-label">Email</label>
										</div>
										<div>
											<input name="email" type="text"
												pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$"
												class="form-control" required>
										</div>
									</div>
									<div class="form-group">
										<div>
											<label class="control-label">Address</label><br />
										</div>
										<div>
											<textarea name="address" rows="5" cols="20"
												class="form-control address" required></textarea>
										</div>
									</div>
									<hr>
									<div class="form-group">
										<div>
											<label class="control-label">Username</label>
										</div>
										<div>
											<input name="userName" type="text" class="form-control"
												required>
										</div>
									</div>
									<div class="form-group">
										<div>
											<label class="control-label">Password</label>
										</div>
										<div>
											<input name="password" type="password" class="form-control"
												required>
										</div>
									</div>
									<div class="form-group">
										<div>
											<label class="control-label">Confirm Password</label>
										</div>
										<div>
											<input name="confirmPassword" type="password"
												class="form-control" required>
										</div>
									</div>
									<br /> <span id='passwords-message'></span>
									<div class="form-group">
										<div>
											<label class="control-label">User Role</label>
										</div>
										<div>
											<select name="role" class="form-control select"
												onchange="UserRolePermissions(this);" required>
												<option value="">-- Select --</option>
												<option value="Admin">Admin</option>
												<option value="User">User</option>
											</select>
										</div>
									</div>
								</div>
							</div>
							<div class="photo panel">
								<div class="panel-title">Photo</div>
								<div class="panel-body">
									<label class="new-user-profile-label">Acceptable image
										formats are jpg, jpeg, png amp; gif.</label> <label
										class="new-user-profile-label">Maximum image size
										allowed is 2MB.</label>
									<div class="dropify-wrapper">
										<input type="file" id="input-file-now" name="userImage"
											class="dropify">
										<button type="button" class="dropify-clear">Remove</button>
										<div class="dropify-preview">
											<span class="dropify-render"></span>
											<div class="dropify-infos">
												<div class="dropify-infos-inner">
													<p class="dropify-filename">
														<span class="file-icon"></span> <span
															class="dropify-filename-inner"></span>
													</p>
													<p class="dropify-infos-message">Drag and drop or click
														to replace</p>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="permissions panel">
							<div class="panel-title">Permissions</div>
							<div class="panel-body">
								<table>
									<tr class="permission-table-head">
										<td><div>Web Page</div></td>
										<td><span><input name="add" id="add"
												type="checkbox" onchange="onCheck('add')"> Add</span></td>
										<td><span><input name="delete" id="delete"
												type="checkbox" onchange="onCheck('delete')"> Delete</span>
										</td>
										<td><span><input name="modify" id="modify"
												type="checkbox" onchange="onCheck('modify')"> Modify</span>
										</td>
										<td><span><input name="read" id="read"
												type="checkbox" onchange="onCheck('read')"> Read</span></td>
									</tr>
									<tr>
										<td>Dashboard</td>
										<td><input name="dashboard_add" id="dashboard_add"
											type="checkbox" value="true"></td>
										<td><input name="dashboard_delete" id="dashboard_delete"
											type="checkbox" value="true"></td>
										<td><input name="dashboard_modify" id="dashboard_modify"
											type="checkbox" value="true"></td>
										<td><input name="dashboard_read" id="dashboard_read"
											type="checkbox" value="true"></td>
									</tr>
									<tr>
										<td>Settings</td>
										<td><input name="settings_add" id="settings_add"
											type="checkbox" value="true"></td>
										<td><input name="settings_delete" id="settings_delete"
											type="checkbox" value="true"></td>
										<td><input name="settings_modify" id="settings_modify"
											type="checkbox" value="true"></td>
										<td><input name="settings_read" id="settings_read"
											type="checkbox" value="true"></td>
									</tr>
									<tr>
										<td>Users Information</td>
										<td><input name="user_info_add" id="user_info_add"
											type="checkbox" value="true"></td>
										<td><input name="user_info_delete" id="user_info_delete"
											type="checkbox" value="true"></td>
										<td><input name="user_info_modify" id="user_info_modify"
											type="checkbox" value="true"></td>
										<td><input name="user_info_read" id="user_info_read"
											type="checkbox" value="true"></td>
									</tr>
									<tr>
										<td>Web Page 1</td>
										<td><input name="w1_add" id="w1_add" type="checkbox"
											value="true"></td>
										<td><input name="w1_delete" id="w1_delete"
											type="checkbox" value="true"></td>
										<td><input name="w1_modify" id="w1_modify"
											type="checkbox" value="true"></td>
										<td><input name="w1_read" id="w1_read" type="checkbox"
											value="true"></td>
									</tr>
									<tr>
										<td>Web Page 2</td>
										<td><input name="w2_add" id="w2_add" type="checkbox"
											value="true"></td>
										<td><input name="w2_delete" id="w2_delete"
											type="checkbox" value="true"></td>
										<td><input name="w2_modify" id="w2_modify"
											type="checkbox" value="true"></td>
										<td><input name="w2_read" id="w2_read" type="checkbox"
											value="true"></td>
									</tr>
									<tr>
										<td>Web Page 3</td>
										<td><input name="w3_add" id="w3_add" type="checkbox"
											value="true"></td>
										<td><input name="w3_delete" id="w3_delete"
											type="checkbox" value="true"></td>
										<td><input name="w3_modify" id="w3_modify"
											type="checkbox" value="true"></td>
										<td><input name="w3_read" id="w3_read" type="checkbox"
											value="true"></td>
									</tr>
								</table>
							</div>
						</div>
						<div class="submit-reset panel">
							<div>
								<input type="submit" name="submit" id="submit" value="Submit">
							</div>
							<div>
								<input type="reset" value="Reset" id="reset">
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script
		src="${pageContext.request.contextPath}/css/jquery/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/css/dropify/dist/js/dropify.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			// Basic
			$('.dropify').dropify();
		});

		function checkPassword(form) {
			var password = form.password.value;
			var confirmPassword = form.confirmPassword.value;

			if (password != confirmPassword) {
				document.getElementById('passwords-message').innerHTML = "Password did not match: Please try again...";
				return false;
			} else {
				return true;
			}
		}
		
		<%@include file="../scripts/dropdown.js" %>
			
		<%@include file="../scripts/showOptions.js" %>
			
		<%@include file="../scripts/toggleSideNavBar.js" %>
			
		</script>
</body>
</html>