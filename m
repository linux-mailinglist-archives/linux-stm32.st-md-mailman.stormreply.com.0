Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A9E9D2DB0
	for <lists+linux-stm32@lfdr.de>; Tue, 19 Nov 2024 19:14:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B8445C71280;
	Tue, 19 Nov 2024 18:14:56 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 96798C6DD72
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Nov 2024 18:14:54 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AJGMaPP032500;
 Tue, 19 Nov 2024 19:14:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 U5WAuWYpPyf6x8hsSizrHjQGWA6SpwYTf0LqyhF0bQg=; b=L+vT/u5ko/LfoxQO
 Hv0gs33R0cqdctuSkF3hOC1J5R6S3xX4jKCAwrHiZvrTxKdusx2+nI+042A9B7Jj
 djACs834r+T+VjR8xhovwoJKq4t1PTeMyZkqM6cldKRgiTDt3JzG8Hz2SI2Gkd4z
 tEnf1M1FmjJUTuVawpUwfNo7tz24J432RApl95bWBIxd0qdEaxWEpQDwvgitwe8l
 aS0G0Gwt7DkBngRNr8EDjuJwylsxECmlJqf08yisUtqwSJl2namTrcncTwQpN+ot
 NUkGUlJwqR44z87LRRGS4mkmQBTrX18NsvWIDoSaeKK4d/NqkwmY7/xZDhfDF78w
 tB30pA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42y5u3ud1b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Nov 2024 19:14:37 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B84A440048;
 Tue, 19 Nov 2024 19:13:26 +0100 (CET)
Received: from Webmail-eu.st.com (eqndag1node6.st.com [10.75.129.135])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AC9ED29ADCD;
 Tue, 19 Nov 2024 19:10:59 +0100 (CET)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE6.st.com
 (10.75.129.135) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 19 Nov
 2024 19:10:59 +0100
Received: from [10.48.86.121] (10.48.86.121) by SAFDAG1NODE1.st.com
 (10.75.90.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 19 Nov
 2024 19:10:58 +0100
Message-ID: <0d9075cd-68c2-49ec-9b9c-4315aa8c8517@foss.st.com>
Date: Tue, 19 Nov 2024 19:10:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Mathieu Poirier <mathieu.poirier@linaro.org>
References: <20241104133515.256497-1-arnaud.pouliquen@foss.st.com>
 <20241104133515.256497-5-arnaud.pouliquen@foss.st.com>
 <Zzt+7NBdNjyzWZIb@p14s>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Organization: STMicroelectronics
In-Reply-To: <Zzt+7NBdNjyzWZIb@p14s>
X-Originating-IP: [10.48.86.121]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 op-tee@lists.trustedfirmware.org, Bjorn Andersson <andersson@kernel.org>,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v13 4/7] remoteproc: Introduce release_fw
 optional operation
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

On 11/18/24 18:52, Mathieu Poirier wrote:
> On Mon, Nov 04, 2024 at 02:35:12PM +0100, Arnaud Pouliquen wrote:
>> This patch updates the rproc_ops struct to include an optional
>> release_fw function.
>>
>> The release_fw ops is responsible for releasing the remote processor
>> firmware image. The ops is called in the following cases:
>>
>>  - An error occurs in rproc_start() between the loading of the segments and
>>       the start of the remote processor.
>>  - after stopping the remote processor.
>>
>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>> ---
>> Updates from version V11:
>> - fix typo in @release_fw comment
>> ---
>>  drivers/remoteproc/remoteproc_core.c | 5 +++++
>>  include/linux/remoteproc.h           | 3 +++
>>  2 files changed, 8 insertions(+)
>>
>> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
>> index 7694817f25d4..46863e1ca307 100644
>> --- a/drivers/remoteproc/remoteproc_core.c
>> +++ b/drivers/remoteproc/remoteproc_core.c
>> @@ -1258,6 +1258,9 @@ static int rproc_alloc_registered_carveouts(struct rproc *rproc)
>>  
>>  static void rproc_release_fw(struct rproc *rproc)
>>  {
>> +	if (rproc->ops->release_fw)
>> +		rproc->ops->release_fw(rproc);
>> +
>>  	/* Free the copy of the resource table */
>>  	kfree(rproc->cached_table);
>>  	rproc->cached_table = NULL;
>> @@ -1377,6 +1380,8 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
>>  unprepare_subdevices:
>>  	rproc_unprepare_subdevices(rproc);
>>  reset_table_ptr:
>> +	if (rproc->ops->release_fw)
>> +		rproc->ops->release_fw(rproc);
>>  	rproc->table_ptr = rproc->cached_table;
> 
> I suggest the following:
> 
> 1) Create two new functions, i.e rproc_load_fw() and rproc_release_fw().  The
> only thing those would do is call rproc->ops->load_fw() and
> rproc->ops->release_fw(), if they are present.  When a TEE interface is
> available, ->load_fw() and ->release_fw() become rproc_tee_load_fw() and
> rproc_tee_release_fw().


I'm wondering if it should be ->preload_fw() instead of ->load_fw() ops, as the
->load() op already exists.

> 
> 2) Call rproc_load_fw() in rproc_boot(), just before rproc_fw_boot().  If the
> call to rproc_fw_boot() fails, call rproc_release_fw().
> 
> 3) The same logic applies to rproc_boot_recovery(), i.e call rproc_load_fw()
> before rproc_start() and call rproc_release_fw() if rproc_start() fails.


I implemented this and I'm currently testing it.
Thise second part requires a few adjustments to work. The ->load() ops needs to
becomes optional to not be called if the "->preload_fw()" is used.

For that, I propose to return 0 in rproc_load_segments if rproc->ops->load is
NULL and compensate by checking that at least "->preload_fw()" or ->load() is
non-null in rproc_alloc_ops.

Thanks,
Arnaud


> 
> 4) Take rproc_tee_load_fw() out of rproc_tee_parse_fw().  It will now be called
> in rproc_load_fw().
> 
> 5) As stated above function rproc_release_fw() now calls rproc_tee_release_fw().
> The former is already called in rproc_shutdown() so we are good in that front.
> 
> With the above the cached_table management within the core remains the same and
> we can get rid of patch 3.7.

> 
> Thanks,
> Mathieu
> 
>>  
>>  	return ret;
>> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
>> index 2e0ddcb2d792..08e0187a84d9 100644
>> --- a/include/linux/remoteproc.h
>> +++ b/include/linux/remoteproc.h
>> @@ -381,6 +381,8 @@ enum rsc_handling_status {
>>   * @panic:	optional callback to react to system panic, core will delay
>>   *		panic at least the returned number of milliseconds
>>   * @coredump:	  collect firmware dump after the subsystem is shutdown
>> + * @release_fw:	optional function to release the firmware image from ROM memories.
>> + *		This function is called after stopping the remote processor or in case of an error
>>   */
>>  struct rproc_ops {
>>  	int (*prepare)(struct rproc *rproc);
>> @@ -403,6 +405,7 @@ struct rproc_ops {
>>  	u64 (*get_boot_addr)(struct rproc *rproc, const struct firmware *fw);
>>  	unsigned long (*panic)(struct rproc *rproc);
>>  	void (*coredump)(struct rproc *rproc);
>> +	void (*release_fw)(struct rproc *rproc);
>>  };
>>  
>>  /**
>> -- 
>> 2.25.1
>>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
