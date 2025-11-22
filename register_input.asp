<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Register Form</title>
    <style>
      body {
        font-family: Arial, sans-serif;
        font-size: 13px;
        margin: 20px;
        background: #fff;
      }
      .section-title {
        background-color: #663399;
        color: #fff;
        font-weight: bold;
        padding: 6px;
      }
      fieldset {
        border: 1px solid #ccc;
        margin-bottom: 20px;
        padding: 10px;
      }
      legend {
        font-weight: bold;
        color: #663399;
      }
      table {
        width: 100%;
        border-collapse: collapse;
      }
      td {
        padding: 5px;
        vertical-align: middle;
      }
      td.label {
        width: 140px;
        text-align: right;
        padding-right: 8px;
        white-space: nowrap;
      }
      td.input {
        text-align: left;
      }
      input[type="text"],
      input[type="email"],
      input[type="password"],
      select {
        width: 220px;
        padding: 3px;
        border: 1px solid #999;
      }
      input[type="checkbox"],
      input[type="radio"] {
        margin-right: 4px;
      }
      .note {
        font-size: 11px;
        color: #555;
      }
      .form-footer {
        text-align: right;
      }
      .btn-continue {
        background: #ffcc00;
        border: 1px solid #cc9900;
        font-weight: bold;
        padding: 6px 16px;
        cursor: pointer;
      }
      .two-col {
        display: flex;
        gap: 20px;
      }
      .col {
        flex: 1;
      }
    </style>
  </head>
  <body>
    <h3>*Indicates required information.<br /></h3>
    <div class="section-title">Where would you like your order delivered?</div>

    <form method="post" action="register_info.asp">
      <fieldset>
        <input
          type="radio"
          name="deliveryOption"
          value="To my address"
          checked
        />
        Deliver to my address<br />
        <input type="radio" name="deliveryOption" value="Store" /> Deliver to a
        store near me (Learn more)
        <p>
          Participating stores cannot accept deliveries of select oversize
          furnlture items.
        </p>
      </fieldset>

      <!-- Billing + Delivery -->
      <div class="two-col">
        <div class="col">
          <fieldset>
            <legend class="section-title">Billing Address</legend>
            <table>
              <p>Billing address must match credit card.</p>
              <tr>
                <td class="label">First Name: *</td>
                <td class="input">
                  <input type="text" name="billFirstName" />
                </td>
              </tr>
              <tr>
                <td class="label">Last Name: *</td>
                <td class="input"><input type="text" name="billLastName" /></td>
              </tr>
              <tr>
                <td class="label">Company Name:</td>
                <td class="input"><input type="text" name="billCompany" /></td>
              </tr>
              <tr>
                <td class="label">Address Line 1: *</td>
                <td class="input"><input type="text" name="billAddress1" /></td>
              </tr>
              <tr>
                <td class="label">Address Line 2:</td>
                <td class="input"><input type="text" name="billAddress2" /></td>
              </tr>
              <tr>
                <td class="label">City: *</td>
                <td class="input"><input type="text" name="billCity" /></td>
              </tr>
              <tr>
                <td class="label">State: *</td>
                <td class="input">
                  <select name="billState">
                    <option value="">Select</option>
                    <option>CALIFORNIA</option>
                    <option>NEW YORK</option>
                  </select>
                </td>
              </tr>
              <tr>
                <td class="label">Zip Code: *</td>
                <td class="input"><input type="text" name="billZip" /></td>
              </tr>
              <tr>
                <td class="label">Phone Number: *</td>
                <td class="input"><input type="text" name="billPhone" /></td>
              </tr>
              <tr>
                <td class="label">Extension:</td>
                <td class="input"><input type="text" name="billExt" /></td>
              </tr>
            </table>
            <div class="note">Please note: To help prevent delays…</div>
          </fieldset>
        </div>

        <div class="col">
          <fieldset>
            <legend class="section-title">Delivery Address</legend>
            <p></p>
            <input type="checkbox" name="useBilling" /> Use Billing Address
            <p></p>
            <table>
              <tr>
                <td class="label">First Name: *</td>
                <td class="input"><input type="text" name="delFirstName" /></td>
              </tr>
              <tr>
                <td class="label">Last Name: *</td>
                <td class="input"><input type="text" name="delLastName" /></td>
              </tr>
              <tr>
                <td class="label">Company Name:</td>
                <td class="input"><input type="text" name="delCompany" /></td>
              </tr>
              <tr>
                <td class="label">Address Line 1: *</td>
                <td class="input"><input type="text" name="delAddress1" /></td>
              </tr>
              <tr>
                <td class="label">Address Line 2:</td>
                <td class="input"><input type="text" name="delAddress2" /></td>
              </tr>
              <tr>
                <td class="label">City: *</td>
                <td class="input"><input type="text" name="delCity" /></td>
              </tr>
              <tr>
                <td class="label">State: *</td>
                <td class="input">
                  <select name="delState">
                    <option value="">Select</option>
                    <option>CALIFORNIA</option>
                    <option>NEW YORK</option>
                  </select>
                </td>
              </tr>
              <tr>
                <td class="label">Zip Code: *</td>
                <td class="input"><input type="text" name="delZip" /></td>
              </tr>
              <tr>
                <td class="label">Phone Number: *</td>
                <td class="input"><input type="text" name="delPhone" /></td>
              </tr>
              <tr>
                <td class="label">Extension:</td>
                <td class="input"><input type="text" name="delExt" /></td>
              </tr>
            </table>
            <div class="note">
              Please note: Staples.com does not ship to P.O. Boxes…
            </div>
          </fieldset>
        </div>
      </div>

      <!-- Email -->
      <div class="section-title">Email Address</div>
      <fieldset>
        <table>
          <tr>
            <td class="label">Email Address: *</td>
            <td class="input"><input type="email" name="email" /></td>
          </tr>
          <tr>
            <td class="label">Retype Email: *</td>
            <td class="input"><input type="email" name="reEmail" /></td>
          </tr>
          <tr>
            <td></td>
            <td class="input">
              <input type="checkbox" name="receiveNews" /> Yes, I would like to
              receive…
            </td>
          </tr>
        </table>
      </fieldset>

      <!-- Register -->
      <div class="section-title">Save time next time — register now</div>
      <fieldset>
        <table>
          <tr>
            <td class="label">Username: *</td>
            <td class="input"><input type="text" name="username" /></td>
          </tr>
          <tr>
            <td class="label">Password: *</td>
            <td class="input"><input type="password" name="password" /></td>
          </tr>
          <tr>
            <td class="label">Retype Password: *</td>
            <td class="input"><input type="password" name="rePassword" /></td>
          </tr>
          <tr>
            <td class="label">Password Reminder:</td>
            <td class="input"><input type="text" name="reminder" /></td>
          </tr>
          <tr>
            <td class="label">Answer to your question:</td>
            <td class="input"><input type="text" name="answer" /></td>
          </tr>
          <tr>
            <td></td>
            <td class="input">
              <input type="checkbox" name="rememberMe" /> Remember me
            </td>
          </tr>
        </table>
      </fieldset>

      <!-- Optional -->
      <div class="section-title">Optional Information</div>
      <fieldset>
        <table>
          <tr>
            <td class="label">Staples Number:</td>
            <td class="input"><input type="text" name="staplesNumber" /></td>
          </tr>
          <tr>
            <td class="label">This Address is a:</td>
            <td class="input">
              <select name="addressType">
                <option>Please select...</option>
                <option>Home</option>
                <option>Business</option>
              </select>
            </td>
          </tr>
          <tr>
            <td class="label">Type of Company:</td>
            <td class="input">
              <select name="companyType">
                <option>Please select...</option>
                <option>IT</option>
                <option>Education</option>
              </select>
            </td>
          </tr>
          <tr>
            <td class="label">Number of Employees:</td>
            <td class="input">
              <select name="numEmployees">
                <option>Please select...</option>
                <option>1-10</option>
                <option>11-50</option>
                <option>51-100</option>
                <option>100+</option>
              </select>
            </td>
          </tr>
        </table>
      </fieldset>

      <!-- Button -->
      <div class="form-footer">
        <input type="submit" value="Continue" class="btn-continue" />
      </div>
    </form>
  </body>
</html>
