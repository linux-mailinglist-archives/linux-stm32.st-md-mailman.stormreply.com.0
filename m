Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2234D8D2DE4
	for <lists+linux-stm32@lfdr.de>; Wed, 29 May 2024 09:14:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A612BC6B47E;
	Wed, 29 May 2024 07:14:05 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F3788C640E5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 May 2024 07:13:58 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44T7Dm7Z026539;
 Wed, 29 May 2024 09:13:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 giAUAjxvPGgqjNWEiBh0pd64idCnDY9qqeG1Xc/oJSE=; b=Tgp0lOTHlsBi7yje
 pY2GaQ2+gzKLuadN2jcTzgXSGVFpMBqPBlUc+EN17f2auWnAg05GsJIassPum/Xf
 ZpYvu1lo0eqhnn2ehkudnlV22IMc0w1MBkR6f24PeL7Cx6TnRBRnmK0pgOy7hpXk
 eFP0thabvUz37wVaAh/D3gtqye5ODMWL5y0KIj/TDAvOIs4APPoB1Cj7caQ2Qhi/
 ovU6DqutF5kcgrvbQwErqzx4lh4maF72EqIYDFpqMQ3aJakCHySwrUEjt3DzbG8O
 F1U0weRkffR/2MXyGcfLGN2jSNHpDmtP01taSknUF/RU5QHHCyOfmKHpKl9ZNtip
 vMb55w==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3yb9yjy8p5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 May 2024 09:13:52 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 2AE1D40045;
 Wed, 29 May 2024 09:13:48 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node4.st.com [10.75.129.133])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3B719211F32;
 Wed, 29 May 2024 09:13:28 +0200 (CEST)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE4.st.com
 (10.75.129.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 29 May
 2024 09:13:28 +0200
Received: from [10.48.86.121] (10.48.86.121) by SAFDAG1NODE1.st.com
 (10.75.90.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 29 May
 2024 09:13:27 +0200
Message-ID: <d9e1356a-d8bf-40a3-9a78-424ead8089a9@foss.st.com>
Date: Wed, 29 May 2024 09:13:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Mathieu Poirier <mathieu.poirier@linaro.org>
References: <20240521081001.2989417-1-arnaud.pouliquen@foss.st.com>
 <20240521081001.2989417-6-arnaud.pouliquen@foss.st.com>
 <ZlZM/hgSO4EeRVqS@p14s>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Organization: STMicroelectronics
In-Reply-To: <ZlZM/hgSO4EeRVqS@p14s>
X-Originating-IP: [10.48.86.121]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-28_14,2024-05-28_01,2024-05-17_01
Cc: Bjorn Andersson <andersson@kernel.org>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v5 5/7] remoteproc: core: support of the
	tee interface
X-BeenThere: linux-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/linux-stm32/>
List-Post: <mailto:linux-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hello Mathieu,

On 5/28/24 23:30, Mathieu Poirier wrote:
> On Tue, May 21, 2024 at 10:09:59AM +0200, Arnaud Pouliquen wrote:
>> 1) on start:
>> - Using the TEE loader, the resource table is loaded by an external entity.
>> In such case the resource table address is not find from the firmware but
>> provided by the TEE remoteproc framework.
>> Use the rproc_get_loaded_rsc_table instead of rproc_find_loaded_rsc_table
>> - test that rproc->cached_table is not null before performing the memcpy
>>
>> 2)on stop
>> The use of the cached_table seems mandatory:
>> - during recovery sequence to have a snapshot of the resource table
>>   resources used,
>> - on stop to allow  for the deinitialization of resources after the
>>   the remote processor has been shutdown.
>> However if the TEE interface is being used, we first need to unmap the
>> table_ptr before setting it to rproc->cached_table.
>> The update of rproc->table_ptr to rproc->cached_table is performed in
>> tee_remoteproc.
>>
>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>> ---
>>  drivers/remoteproc/remoteproc_core.c | 31 +++++++++++++++++++++-------
>>  1 file changed, 23 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
>> index 42bca01f3bde..3a642151c983 100644
>> --- a/drivers/remoteproc/remoteproc_core.c
>> +++ b/drivers/remoteproc/remoteproc_core.c
>> @@ -1267,6 +1267,7 @@ EXPORT_SYMBOL(rproc_resource_cleanup);
>>  static int rproc_set_rsc_table_on_start(struct rproc *rproc, const struct firmware *fw)
>>  {
>>  	struct resource_table *loaded_table;
>> +	struct device *dev = &rproc->dev;
>>  
>>  	/*
>>  	 * The starting device has been given the rproc->cached_table as the
>> @@ -1276,12 +1277,21 @@ static int rproc_set_rsc_table_on_start(struct rproc *rproc, const struct firmwa
>>  	 * this information to device memory. We also update the table_ptr so
>>  	 * that any subsequent changes will be applied to the loaded version.
>>  	 */
>> -	loaded_table = rproc_find_loaded_rsc_table(rproc, fw);
>> -	if (loaded_table) {
>> -		memcpy(loaded_table, rproc->cached_table, rproc->table_sz);
>> -		rproc->table_ptr = loaded_table;
>> +	if (rproc->tee_interface) {
>> +		loaded_table = rproc_get_loaded_rsc_table(rproc, &rproc->table_sz);
>> +		if (IS_ERR(loaded_table)) {
>> +			dev_err(dev, "can't get resource table\n");
>> +			return PTR_ERR(loaded_table);
>> +		}
>> +	} else {
>> +		loaded_table = rproc_find_loaded_rsc_table(rproc, fw);
>>  	}
>>  
>> +	if (loaded_table && rproc->cached_table)
>> +		memcpy(loaded_table, rproc->cached_table, rproc->table_sz);
>> +
> 
> Why is this not part of the else {} above as it was the case before this patch?
> And why was an extra check for ->cached_table added?

Here we have to cover 2 use cases if rproc->tee_interface is set.
1) The remote processor is in stop state
     - loaded_table points to the resource table in the remote memory and
     -  rproc->cached_table is null
     => no memcopy
2) crash recovery
     - loaded_table points to the resource table in the remote memory
     - rproc-cached_table point to a copy of the resource table
     => need to perform the memcpy to reapply settings in the resource table

I can duplicate the memcpy in if{} and else{} but this will be similar code
as needed in both case.
Adding rproc->cached_table test if proc->tee_interface=NULL seems also
reasonable as a memcpy from 0 should not be performed.


> 
> This should be a simple change, i.e introduce an if {} else {} block to take
> care of the two scenarios.  Plus the comment is misplaced now. 

What about split it in 2 patches?
- one adding the test on rproc->cached_table for the memcpy
- one adding the if {} else {}?

Thanks,
Arnaud


> 
> More comments tomorrow.
> 
> Thanks,
> Mathieu
> 
>> +	rproc->table_ptr = loaded_table;
>> +
>>  	return 0;
>>  }
>>  
>> @@ -1318,11 +1328,16 @@ static int rproc_reset_rsc_table_on_stop(struct rproc *rproc)
>>  	kfree(rproc->clean_table);
>>  
>>  out:
>> -	/*
>> -	 * Use a copy of the resource table for the remainder of the
>> -	 * shutdown process.
>> +	/* If the remoteproc_tee interface is used, then we have first to unmap the resource table
>> +	 * before updating the proc->table_ptr reference.
>>  	 */
>> -	rproc->table_ptr = rproc->cached_table;
>> +	if (!rproc->tee_interface) {
>> +		/*
>> +		 * Use a copy of the resource table for the remainder of the
>> +		 * shutdown process.
>> +		 */
>> +		rproc->table_ptr = rproc->cached_table;
>> +	}
>>  	return 0;
>>  }
>>  
>> -- 
>> 2.25.1
>>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
