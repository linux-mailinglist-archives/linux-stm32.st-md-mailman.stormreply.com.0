Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E4BADDAC9
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Jun 2025 19:40:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F1820C32EA8;
	Tue, 17 Jun 2025 17:40:40 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 59270C36B24
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Jun 2025 17:40:40 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55HFaTiR013203;
 Tue, 17 Jun 2025 19:40:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 BCDEKH89I2K3oqjv3tljOt2+d5QzCMjlDICRktrlLTw=; b=IKCyTGnPnox4Lq0F
 vOPeRvGck68q98cBsI1r908q9qQaq0urFuUVIibrgqbHbAF8QnrTAh1syjaauuJI
 Z9fbs2dQMkOJe1WcvbSnPzbQmmMNKhCEGWyV2mx7qoqnIN07dFr7JvdJlSbDV9Zq
 TjRmnsKJc8xXpZRgal2yWz9OHRKVNjr2aYyucZPU7LyStZkEV0PfMCh5kDPsCW0I
 yH3k3rNOtGLEqnfB17zBUwYSnS54AhP49bBzuyxg5/FObZaIvK7EKxEvvt98FKqA
 WMGjPD39u4D2/xnXa0995jsQF7bsnjaBK0utur3Zss/fYyrf6wHQTCVLjRigP0C2
 CqQZdQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4790e27jt9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Jun 2025 19:40:16 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id D153640045;
 Tue, 17 Jun 2025 19:39:10 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node4.st.com [10.75.129.133])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C2540B88169;
 Tue, 17 Jun 2025 19:38:20 +0200 (CEST)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE4.st.com
 (10.75.129.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 17 Jun
 2025 19:38:20 +0200
Received: from [10.48.86.121] (10.48.86.121) by SAFDAG1NODE1.st.com
 (10.75.90.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 17 Jun
 2025 19:38:19 +0200
Message-ID: <cda96440-5c53-4b7a-8b51-51506f5e7cc3@foss.st.com>
Date: Tue, 17 Jun 2025 19:38:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bjorn Andersson <andersson@kernel.org>
References: <20250616075530.4106090-1-arnaud.pouliquen@foss.st.com>
 <20250616075530.4106090-4-arnaud.pouliquen@foss.st.com>
 <6ekro2uytz7kguphtub54wivmclpnfkjobduhsom4kvxlmov2l@hgcjoposj3md>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Organization: STMicroelectronics
In-Reply-To: <6ekro2uytz7kguphtub54wivmclpnfkjobduhsom4kvxlmov2l@hgcjoposj3md>
X-Originating-IP: [10.48.86.121]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_08,2025-06-13_01,2025-03-28_01
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, op-tee@lists.trustedfirmware.org,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh+dt@kernel.org>,
 Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Jens Wiklander <jens.wiklander@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v18 3/6] remoteproc: Introduce release_fw
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

Hello Bjorn,

On 6/17/25 06:44, Bjorn Andersson wrote:
> On Mon, Jun 16, 2025 at 09:55:27AM +0200, Arnaud Pouliquen wrote:
>> The release_fw operation is the inverse operation of the load, responsible
>> for releasing the remote processor resources configured from the loading
>> of the remoteproc firmware (e.g., memories).
>>
> 
> I was under the impression that we agreed that this would unroll
> rproc_parse_fw() not the "load" in general.

Not Krystal clear to me what you are expecting here.
Is it just on the description or on the design?

Unroll only the rproc_parse_fw is not sufficient. The need here is also
to go back from a LOAD state of the TEE. So in such case the role of
release_fw() would be to unroll the load + the parse of the resource.
Is it your expectation?

> 
>> The operation is called in the following cases:
>>  - An error occurs on boot of the remote processor.
>>  - An error occurs on recovery start of the remote processor.
>>  - After stopping the remote processor.
>>
>> This operation is needed for the remoteproc_tee implementation after stop
>> and on error.
> 
> And if it's defined to unroll rproc_parse_fw() it can be used for other
> things where some resources was allocated to set up the resource table.

True

> 
>> Indeed, as the remoteproc image is loaded when we parse the resource
>> table, there are many situations where something can go wrong before
>> the start of the remote processor(resource handling, carveout allocation,
>> ...).
> 
> Unbalanced parenthesis? I think you can write this in less
> conversational style.
> 
>>
>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
>> ---
>>  drivers/remoteproc/remoteproc_core.c     | 6 ++++++
>>  drivers/remoteproc/remoteproc_internal.h | 6 ++++++
>>  include/linux/remoteproc.h               | 3 +++
>>  3 files changed, 15 insertions(+)
>>
>> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
>> index d06eef1fa424..4c1a4bc9e7b7 100644
>> --- a/drivers/remoteproc/remoteproc_core.c
>> +++ b/drivers/remoteproc/remoteproc_core.c
>> @@ -1857,6 +1857,8 @@ static int rproc_boot_recovery(struct rproc *rproc)
>>  
>>  	/* boot the remote processor up again */
>>  	ret = rproc_start(rproc, firmware_p);
>> +	if (ret)
>> +		rproc_release_fw(rproc);
>>  
>>  	release_firmware(firmware_p);
>>  
>> @@ -1998,6 +2000,8 @@ int rproc_boot(struct rproc *rproc)
>>  		}
>>  
>>  		ret = rproc_fw_boot(rproc, firmware_p);
>> +		if (ret)
>> +			rproc_release_fw(rproc);
>>  
>>  		release_firmware(firmware_p);
>>  	}
>> @@ -2067,6 +2071,8 @@ int rproc_shutdown(struct rproc *rproc)
>>  
>>  	rproc_disable_iommu(rproc);
>>  
>> +	rproc_release_fw(rproc);
>> +
>>  	/* Free the copy of the resource table */
>>  	kfree(rproc->cached_table);
>>  	rproc->cached_table = NULL;
> 
> These are allocated in rproc_parse_fw(), would it not make sense to
> clean them up in your newly introduced function?

It seems possible as proposed in v11 3/7[1], but this needs an exception
for rproc_detach().
[1]
https://patchew.org/linux/20241009080108.4170320-1-arnaud.pouliquen@foss.st.com/20241009080108.4170320-4-arnaud.pouliquen@foss.st.com/

> 
>> diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
>> index 0cd09e67ac14..c7fb908f8652 100644
>> --- a/drivers/remoteproc/remoteproc_internal.h
>> +++ b/drivers/remoteproc/remoteproc_internal.h
>> @@ -221,4 +221,10 @@ bool rproc_u64_fit_in_size_t(u64 val)
>>  	return (val <= (size_t) -1);
>>  }
>>  
>> +static inline void rproc_release_fw(struct rproc *rproc)
>> +{
>> +	if (rproc->ops->release_fw)
>> +		rproc->ops->release_fw(rproc);
>> +}
>> +
>>  #endif /* REMOTEPROC_INTERNAL_H */
>> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
>> index 8fd0d7f63c8e..80128461972b 100644
>> --- a/include/linux/remoteproc.h
>> +++ b/include/linux/remoteproc.h
>> @@ -381,6 +381,8 @@ enum rsc_handling_status {
>>   * @panic:	optional callback to react to system panic, core will delay
>>   *		panic at least the returned number of milliseconds
>>   * @coredump:	  collect firmware dump after the subsystem is shutdown
>> + * @release_fw:	optional function to release the loaded firmware, called after
>> + *              stopping the remote processor or in case of error
> 
> The struct firmware is released at the end of startup and the typical
> carveout memory where the firmware is loaded into is released at
> rproc_shutdown().
> 
> As such, this won't help anyone understand the purpose of the ops unless
> they know your system design (and know you added it).

Could you detail which improvement you are expecting here?
Name of the ops, associated comment? both?

Thanks,
Arnaud

> 
> Regards,
> Bjorn
> 
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
