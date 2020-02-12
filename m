Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 29FDB15AC98
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Feb 2020 17:01:49 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D79FEC36B0B;
	Wed, 12 Feb 2020 16:01:48 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8B2DAC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Feb 2020 16:01:44 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01CFwZ55001528; Wed, 12 Feb 2020 17:01:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=tCuQbEUwxiErUzebwFMT+runU/jX1hB4lUAevsJyGe4=;
 b=o/Sq7l33bVTTqc7pvfeXJh04FwU5vJ0UYsPzz/eBRg/sAOdQgpRwGBxPVSGl7E8ka73Z
 9aV0tADXKLZwFj4/BBs/70tnPLxbtEDclrIxa7wu2v6FwAzDktjAXLRZLfmRcy230xV7
 HZx6chi0iRwo8HNplX6d7ehHGXQdQV1vHanmuDieTqsSQlDnOH/t7bdnqLY+0FgJCM4f
 A3nkZFCuE9bd+npJkb7vx9sZ+wlN0xE4lfl2cRYg2rD4jTK9JfjGi+SBV7Kbgu+499U4
 Y3YAYRuCpa3+hseB93iA7IhzosjIsnafcwD8VHr6fWVob5a2gEzyGOC1yv4gKRH3CrRy Iw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2y1ud9yc5v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Feb 2020 17:01:31 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 03EA910002A;
 Wed, 12 Feb 2020 17:01:30 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0326F2BD40B;
 Wed, 12 Feb 2020 17:01:30 +0100 (CET)
Received: from lmecxl0889.lme.st.com (10.75.127.47) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 12 Feb
 2020 17:01:29 +0100
To: Randy Dunlap <rdunlap@infradead.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, Mathieu
 Poirier <mathieu.poirier@linaro.org>
References: <20200212093211.15270-1-arnaud.pouliquen@st.com>
 <c912fe7e-601d-6d07-c368-109fecd11a7a@infradead.org>
From: Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Message-ID: <b6a7e733-f63f-431c-3b0e-9aeb3de43bb3@st.com>
Date: Wed, 12 Feb 2020 17:01:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <c912fe7e-601d-6d07-c368-109fecd11a7a@infradead.org>
Content-Language: en-US
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG7NODE1.st.com (10.75.127.19) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-12_08:2020-02-11,
 2020-02-12 signatures=0
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] remoteproc: fix kernel-doc warnings
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

Hi Randy

On 2/12/20 4:54 PM, Randy Dunlap wrote:
> Hi,
> 
> kernel-doc supports "..." as a function argument for varargs.
> See Documentation/doc-guide/kernel-doc.rst:
> 
> "If a function has a variable number of arguments, its description should
> be written in kernel-doc notation as::
> 
>       * @...: description"
I missed it, thanks for pointing it out!

Regards
Arnaud
> 
> 
> So the below could be done as:
> 
> On 2/12/20 1:32 AM, Arnaud Pouliquen wrote:
>> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
>> index 097f33e4f1f3..5f9a5812505c 100644
>> --- a/drivers/remoteproc/remoteproc_core.c
>> +++ b/drivers/remoteproc/remoteproc_core.c
>> @@ -224,7 +224,7 @@ EXPORT_SYMBOL(rproc_da_to_va);
>>  /**
>>   * rproc_find_carveout_by_name() - lookup the carveout region by a name
>>   * @rproc: handle of a remote processor
>> - * @name,..: carveout name to find (standard printf format)
>> + * @name: carveout name to find (standard printf format)
> 
>  * @name: carveout name to find
>  * @...: standard printf format of args to search for carveout name
> 
> although I'm not so sure about the descriptions there.
> 
>>   *
>>   * Platform driver has the capability to register some pre-allacoted carveout
>>   * (physically contiguous memory regions) before rproc firmware loading and
> 
> 
> thanks for the kernel-doc update.
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
