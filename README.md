<p><strong># module_vm_applications</strong><br />module to install vm appllications on azure with terraform</p>
<p><br />This Terraform Module allow to install vm applications (preview on azure) on a virtual machine.</p>
<p>Use AzApi provider as this functionality is in previee</p>
<p>The functionalaity is described here:<br /><span style="text-decoration: underline;">https://docs.microsoft.com/en-us/azure/virtual-machines/vm-applications-how-to?tabs=portal</span></p>
<p>and here you can find directions to create the package.<br /><span style="text-decoration: underline;">https://docs.microsoft.com/en-us/azure/virtual-machines/vm-applications</span></p>
<p><br />Requirements for this module:<br /><strong>Follow MS istruction to create:</strong></p>
<p>&nbsp;</p>
<table class="table table-sm" aria-label="What are VM app packages?">
<thead>
<tr>
<th>Resource</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr>
<td><strong>Azure compute gallery</strong></td>
<td>A gallery is a repository for managing and sharing application packages. Users can share the gallery resource and all the child resources will be shared automatically. The gallery name must be unique per subscription. For example, you may have one gallery to store all your OS images and another gallery to store all your VM applications.</td>
</tr>
<tr>
<td><strong>VM application</strong></td>
<td>The&nbsp;definition of your VM application. It's a <em>logical</em> resource that stores the common metadata for all the versions under it. For example, you may have an application definition for Apache Tomcat and have multiple versions within it.</td>
</tr>
<tr>
<td><strong>VM Application version</strong></td>
<td>The deployable resource. You can globally replicate your VM application versions to target regions closer to your VM infrastructure. The VM Application Version must be replicated to a region before it may be deployed on a VM in that region.</td>
</tr>
</tbody>
</table>
<p>&nbsp;</p>
<p>To use this module you just need a vm...</p>
<p>===================================</p>
<p>example of module calling:</p>
<div style="color: #d4d4d4; background-color: #1e1e1e; font-family: Consolas, 'Courier New', monospace; font-weight: normal; font-size: 14px; line-height: 19px; white-space: pre;">
<div><span style="color: #4ec9b0;">module</span> <span style="color: #4fc1ff;">"vm_applications_sccm"</span><span style="color: #d4d4d4;"> {</span></div>
<div><span style="color: #d4d4d4;"> #</span><span style="color: #9cdcfe;">source</span> <span style="color: #d4d4d4;">=</span> <span style="color: #ce9178;">"./modules/vm_applications"</span></div>
<div>
<div style="color: #d4d4d4; background-color: #1e1e1e; font-family: Consolas, 'Courier New', monospace; font-weight: normal; font-size: 14px; line-height: 19px; white-space: pre;">
<div><span style="color: #9cdcfe;">source</span> <span style="color: #d4d4d4;">=</span> <span style="color: #ce9178;">"git::https://github.com/L-u-k-e-GIT/module_vm_applications.git"</span></div>
</div>
</div>
<div><span style="color: #d4d4d4;">&nbsp; </span><span style="color: #9cdcfe;">MD_RG_NAME</span><span style="color: #9cdcfe;"> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span><span style="color: #d4d4d4;">=</span> <span style="color: #9cdcfe;">azurerm_resource_group</span><span style="color: #d4d4d4;">.</span><span style="color: #9cdcfe;">rg</span><span style="color: #d4d4d4;">.</span><span style="color: #9cdcfe;">id</span><span style="color: #d4d4d4;"> &nbsp; &nbsp; </span></div>
<div><span style="color: #d4d4d4;">&nbsp; </span><span style="color: #9cdcfe;">MD_VIRTUAL_MACHINE_NAME</span><span style="color: #9cdcfe;"> &nbsp; &nbsp; </span><span style="color: #d4d4d4;">=</span> <span style="color: #d4d4d4;">each.</span><span style="color: #9cdcfe;">value</span><span style="color: #d4d4d4;">.</span><span style="color: #9cdcfe;">name</span></div>
<div><span style="color: #d4d4d4;">&nbsp; </span><span style="color: #9cdcfe;">MD_VM_APP_ID</span><span style="color: #9cdcfe;"> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; </span><span style="color: #d4d4d4;">=</span> <span style="color: #9cdcfe;">var</span><span style="color: #d4d4d4;">.</span><span style="color: #9cdcfe;">VM_APP_ID</span></div>
<div><span style="color: #d4d4d4;">&nbsp; </span><span style="color: #9cdcfe;">providers</span> <span style="color: #d4d4d4;">=</span> <span style="color: #d4d4d4;">{</span></div>
<div><span style="color: #d4d4d4;">&nbsp; &nbsp; &nbsp;</span><span style="color: #9cdcfe;">azapi</span><span style="color: #d4d4d4;"> = </span><span style="color: #9cdcfe;">azapi</span></div>
<div><span style="color: #d4d4d4;">&nbsp; }</span></div>
<div><span style="color: #d4d4d4;">}</span></div>
</div>
