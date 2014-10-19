# Kaua'i Simplex Plan

Use the assigned frequency to communicate on simplex within your
district.  Only use a neighboring district's channel to pass a
message in between districts.

<table class="table table-striped table-bordered table-hover table-condensed">
  <thead>
    <tr>
      <th>Frequency</th>
      <th>Display</th>
      <th>Use</th>
    </tr>
  </thead>
  <tbody>
    {{#each simplex}}
    <tr>
      <td>{{frequency}} MHz</td>
      <td>{{display}}</td>
      <td>{{use}}</td>
    </tr>
    {{/each}}
  </tbody>
</table>
