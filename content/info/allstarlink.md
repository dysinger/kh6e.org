# All Star Link

All of the following nodes on Kauai are tied into the
[All Star Link](https://allstarlink.org/portal/login.php) system and
are viewable on the
[Hawaii-Mainland Allstar Network Map](http://stats.allstarlink.org/getstatus.cgi?28508)
or, more specifically, the local
[Kauai Hub](http://stats.allstarlink.org/getstatus.cgi?29277).

<table class="table table-striped table-bordered table-hover table-condensed">
  <thead>
    <tr>
      <th>Area</th>
      <th>Call</th>
      <th>Freq</th>
      <th>Type</th>
      <th>Tone</th>
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
