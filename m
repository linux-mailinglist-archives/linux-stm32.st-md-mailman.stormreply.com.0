Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0171098822C
	for <lists+linux-stm32@lfdr.de>; Fri, 27 Sep 2024 12:03:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9CA6AC6DD72;
	Fri, 27 Sep 2024 10:03:35 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 32B46C6C841
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Sep 2024 10:03:28 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48R54m7C027365;
 Fri, 27 Sep 2024 12:03:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 X346+p5deRL6SEcB76ngn4tEJM5Pn2Gyvnk4kicZAzE=; b=VB2LG1jJRDC6w4qg
 Q+xG6L69XQ3NdKeh0+I0czuvIW4P9VPP1e+2nH9qGhRnqsFCM8J6lU8oU+Tbw5og
 qf9mNLtsyKTuD3yx+bOrRCSxaXUrTgeb+d1ytKe5+NNOcauOagrHjvVZh8SNitOX
 33UJvaGBWAhfWJqYpulOtTx6hlQ9wM1x6NQoTIjY+0xuX1L8v4HXS452qdm+XGiU
 kcNc+W8dhINW7Cv0UTHvAJ2JtkTR6zK4RE4rj7giAGbLwIyJ2dPwlzHz8wCenjSl
 f3/t1WzpoXeLC0lDpVZybn0clCelAV3Ti2YD7X8Y2tHpKgxHdbJOgerc+umbAuqs
 LRbz7Q==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 41snfyf32e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Sep 2024 12:03:07 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B09914002D;
 Fri, 27 Sep 2024 12:02:01 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node6.st.com [10.75.129.135])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 957E623AA6A;
 Fri, 27 Sep 2024 12:01:10 +0200 (CEST)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE6.st.com
 (10.75.129.135) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 27 Sep
 2024 12:01:10 +0200
Received: from [10.48.86.121] (10.48.86.121) by SAFDAG1NODE1.st.com
 (10.75.90.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 27 Sep
 2024 12:01:09 +0200
Message-ID: <b96cef62-950b-44f9-9cc4-b7d6cc3aad45@foss.st.com>
Date: Fri, 27 Sep 2024 12:01:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bjorn Andersson <andersson@kernel.org>
References: <20240830095147.3538047-1-arnaud.pouliquen@foss.st.com>
 <20240830095147.3538047-5-arnaud.pouliquen@foss.st.com>
 <yvax326sikpqkaygfldunjpziwwlwccfzmi6r5ikaqoyvfvama@w7kifjv5yt47>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Organization: STMicroelectronics
In-Reply-To: <yvax326sikpqkaygfldunjpziwwlwccfzmi6r5ikaqoyvfvama@w7kifjv5yt47>
X-Originating-IP: [10.48.86.121]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, op-tee@lists.trustedfirmware.org,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v9 4/7] remoteproc: core: Add TEE
 interface support for firmware release
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

Hello Bjorn,

On 9/26/24 05:51, Bjorn Andersson wrote:
> On Fri, Aug 30, 2024 at 11:51:44AM GMT, Arnaud Pouliquen wrote:
>> Add support for releasing remote processor firmware through
>> the Trusted Execution Environment (TEE) interface.
>>
>> The tee_rproc_release_fw() function is called in the following cases:
>>
>> - An error occurs in rproc_start() between the loading of the segments and
>>   the start of the remote processor.
>> - When rproc_release_fw is called on error or after stopping the remote
>>   processor.
>>
>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>> ---
>>  drivers/remoteproc/remoteproc_core.c | 10 ++++++++--
>>  1 file changed, 8 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
>> index 7694817f25d4..32052dedc149 100644
>> --- a/drivers/remoteproc/remoteproc_core.c
>> +++ b/drivers/remoteproc/remoteproc_core.c
>> @@ -29,6 +29,7 @@
>>  #include <linux/debugfs.h>
>>  #include <linux/rculist.h>
>>  #include <linux/remoteproc.h>
>> +#include <linux/remoteproc_tee.h>
>>  #include <linux/iommu.h>
>>  #include <linux/idr.h>
>>  #include <linux/elf.h>
>> @@ -1258,6 +1259,9 @@ static int rproc_alloc_registered_carveouts(struct rproc *rproc)
>>  
>>  static void rproc_release_fw(struct rproc *rproc)
>>  {
>> +	if (rproc->state == RPROC_OFFLINE && rproc->tee_interface)
>> +		tee_rproc_release_fw(rproc);
> 
> I don't like the idea of having op-tee specific calls made from the
> core. If the problem is that we need to unroll something we did at load,
> can we instead come up with a more generic mechanism to unload that? Or

As proposed in [1] an alternative could be to define a new rproc_ops->release_fw
operation that will be initialized to tee_rproc_release_fw in the platform driver.

> can we perhaps postpone the tee interaction until start() to avoid the
> gap?

In such a case, the management of the resource table should also be postponed
as the firmware has to be authenticated first.

The OP-TEE implementation authenticates the firmware during the load
(in-destination memory authentication), so the sequence is:
1) Load the firmware.
2) Get the resource table and initialize resources.
3) Start the firmware.

The tee_rproc_release_fw() is used if something goes wrong during step 2 an3.

From my perspective, this would result in an alternative boot sequence, as we
have today for "attach". I proposed this approach in my V3 [2]. But this add
complexity in remote proc core.


Please, could you align with Mathieu to define how we should move forward to
address your concerns?

[1]https://lkml.org/lkml/2024/9/18/612
[2]https://lore.kernel.org/lkml/8af59b01-53cf-4fc4-9946-6c630fb7b38e@quicinc.com/T/

Thanks and Regards,
Arnaud

> 
> 
> PS. Most of the Qualcomm drivers are TEE-based...so the "tee_interface"
> boolean check here is not very nice.
> 
> Regards,
> Bjorn
> 
>> +
>>  	/* Free the copy of the resource table */
>>  	kfree(rproc->cached_table);
>>  	rproc->cached_table = NULL;
>> @@ -1348,7 +1352,7 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
>>  	if (ret) {
>>  		dev_err(dev, "failed to prepare subdevices for %s: %d\n",
>>  			rproc->name, ret);
>> -		goto reset_table_ptr;
>> +		goto release_fw;
>>  	}
>>  
>>  	/* power up the remote processor */
>> @@ -1376,7 +1380,9 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
>>  	rproc->ops->stop(rproc);
>>  unprepare_subdevices:
>>  	rproc_unprepare_subdevices(rproc);
>> -reset_table_ptr:
>> +release_fw:
>> +	if (rproc->tee_interface)
>> +		tee_rproc_release_fw(rproc);
>>  	rproc->table_ptr = rproc->cached_table;
>>  
>>  	return ret;
>> -- 
>> 2.25.1
>>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
