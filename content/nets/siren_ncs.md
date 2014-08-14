# Siren Net NCS / Logger Schedule

<table class="table table-striped table-bordered table-hover table-condensed">
  <thead>
    <tr>
      <th>Date</th>
      <th>NCS</th>
      <th>Logger</th>
    </tr>
  </thead>
  <tbody>
{{#each nets_siren_ncos}}
    <tr>
      <td>{{date}}</td>
      <td>{{ncs/name}}, {{ncs/call}}</td>
      <td>{{logger/name}}, {{logger/call}}</td>
    </tr>
{{/each}}
  </tbody>
</table>
