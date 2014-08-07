# All Star Link

All of the following nodes on Kauai are tied into the
[All Star Link](https://allstarlink.org/portal/login.php) system and
are viewable on the
[Hawaii-Mainland Allstar Network balloon map](http://stats.allstarlink.org/getstatus.cgi?29277)

<table class="table table-striped table-bordered table-hover table-condensed">
  <thead>
    <tr>
      <th>Location</th>
      <th>Call Sign</th>
      <th>Frequency</th>
      <th>Type</th>
      <th>PL Tone</th>
    </tr>
  </thead>
  <tbody>
{{#each allstarlink}}
    <tr>
      <td>{{location}}</td>
      <td>{{call}}</td>
      <td>{{frequency}} MHz</td>
      <td>{{type}}</td>
      <td>{{pl}}</td>
    </tr>
{{/each}}
  </tbody>
</table>
