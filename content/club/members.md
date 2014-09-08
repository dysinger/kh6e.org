# Club Members

<table class="table table-striped table-bordered table-hover table-condensed">
  <thead>
    <tr>
      <th>Member</th>
      <th>Call Sign</th>
    </tr>
  </thead>
  <tbody>
{{#each members}}
    <tr>
      <td>{{first_name}} {{last_name}}</td>
      <td>{{call_sign}}</td>
    </tr>
{{/each}}
  </tbody>
</table>
