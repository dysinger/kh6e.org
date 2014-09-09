# Club Members

<table class="table table-striped table-bordered table-hover table-condensed">
  <thead>
    <tr>
      <th>Member</th>
      <th>Call</th>
    </tr>
  </thead>
  <tbody>
{{#each members}}
    <tr>
      <td>{{#if role}}**{{/if}}{{first_name}} {{last_name}}{{#if role}}, {{role}}**{{/if}}<td>
      <td>{{call_sign}}</td>
    </tr>
{{/each}}
  </tbody>
</table>
