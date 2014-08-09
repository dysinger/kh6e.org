# Monday Night Net NCS Schedule

<table class="table table-striped table-bordered table-hover table-condensed">
  <thead>
    <tr>
      <th>Start Date</th>
      <th>Name</th>
      <th>Call-Sign</th>
    </tr>
  </thead>
  <tbody>
{{#each nets_monday_ncos}}
    <tr>
      <td>{{start}}</td>
      <td>{{name}}</td>
      <td>{{call}}</td>
    </tr>
{{/each}}
  </tbody>
</table>
