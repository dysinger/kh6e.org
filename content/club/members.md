# KARC Club Members

<table class="table table-striped table-bordered table-hover table-condensed">
  <thead>
    <tr>
      <th>Member</th>
      <th>Call</th>
      <th>Year(s)</th>
    </tr>
  </thead>
  <tbody>
    {{#each members}}
    <tr>
      <td>
        {{#if roles}}**{{/if}}{{first_name}} {{last_name}}{{#if roles}}{{#each roles}}, {{this}}{{/each}}**{{/if}}{{#if silent_key}}, Silent Key{{/if}}
      </td>
      <td>{{call_sign}}</td>
      <td>{{#each years}}{{this}} {{/each}}</td>
    </tr>
    {{/each}}
  </tbody>
</table>
