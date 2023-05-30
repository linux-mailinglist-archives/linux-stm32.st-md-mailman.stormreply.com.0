Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF9A716A8E
	for <lists+linux-stm32@lfdr.de>; Tue, 30 May 2023 19:13:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 10C51C6A608;
	Tue, 30 May 2023 17:13:00 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 12A69C65048
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 May 2023 17:12:58 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34UFnxM2017369; Tue, 30 May 2023 19:12:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=FwkP6U9+abkTw5jLxAP82NS3Pqb2yLMLtFGxIOmhkZY=;
 b=IUc1O1SrTMIn+QZWfRSS9AjGAvkYdvByQSrp6ETusmwrvXwnlpUOltNzYRtxq0x3+su9
 okK5FpSsBPPHOgZAR9mczGidpgVLhSdp9Xbkr+wJ/YO9RW31LEqZWsCpH37voqsl6/18
 m2tYXvz2NGHE8n+OW/yOB9XxjcNZNEAV7X6q7GehQlF86gTY+7bWsmMxcGCDuuyM2DsK
 lw+hKYMenVMXCymEvvG8mjtNFCtOXOcQFyFFHa7YaHGKt1AAZdE8612c5GaCiznhWYZN
 0eLUrp8jZXRPt4UhWdMDRaemW6IgGaZfu2yVqfpJ3ufR3nGYPg4lId53E37OmVFg6tI7 Gw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3quahy9j2f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 May 2023 19:12:29 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3FFE410002A;
 Tue, 30 May 2023 19:12:28 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 26A8F23694B;
 Tue, 30 May 2023 19:12:28 +0200 (CEST)
Received: from [10.252.5.129] (10.252.5.129) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Tue, 30 May
 2023 19:12:22 +0200
Message-ID: <fc7fcb92-dec6-413a-7b08-1083a444f6fc@foss.st.com>
Date: Tue, 30 May 2023 19:12:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Mathieu Poirier <mathieu.poirier@linaro.org>
References: <20230523091350.292221-1-arnaud.pouliquen@foss.st.com>
 <ZHYiYGMHdqxBaDzc@p14s>
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Organization: STMicroelectronics
In-Reply-To: <ZHYiYGMHdqxBaDzc@p14s>
X-Originating-IP: [10.252.5.129]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-30_12,2023-05-30_01,2023-05-22_02
Cc: Bjorn Andersson <andersson@kernel.org>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 op-tee@lists.trustedfirmware.org, Jens Wiklander <jens.wiklander@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [RFC PATCH 0/4] introduction of a remoteproc tee
 to load signed firmware images
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

On 5/30/23 18:20, Mathieu Poirier wrote:
> On Tue, May 23, 2023 at 11:13:46AM +0200, Arnaud Pouliquen wrote:
>> This RFC proposes an implementation of a remoteproc tee driver to
>> communicate with a TEE trusted application in charge of authenticating
>> and loading remoteproc firmware image in an Arm secure context.
>>
>> The services implemented are the same as those offered by the Linux
>> remoteproc framework:
>> - load of a signed firmware
>> - start/stop of a coprocessor
>> - get the resource table
>>
>>
>> The OP-TEE code in charge of providing the service in a trusted application
>> is proposed for upstream here:
>> https://github.com/OP-TEE/optee_os/pull/6027
>>
>> For more details on the implementation a presentation is available here:
>> https://resources.linaro.org/en/resource/6c5bGvZwUAjX56fvxthxds
>>
>> Arnaud Pouliquen (4):
>>   tee: Re-enable vmalloc page support for shared memory
>>   remoteproc: Add TEE support
>>   dt-bindings: remoteproc: add compatibility for TEE support
>>   remoteproc: stm32: Add support of an OP-TEE TA to load the firmware
>>
>>  .../bindings/remoteproc/st,stm32-rproc.yaml   |  33 +-
>>  drivers/remoteproc/Kconfig                    |   9 +
>>  drivers/remoteproc/Makefile                   |   1 +
>>  drivers/remoteproc/stm32_rproc.c              | 234 +++++++++--
>>  drivers/remoteproc/tee_remoteproc.c           | 397 ++++++++++++++++++
>>  drivers/tee/tee_shm.c                         |  24 +-
>>  include/linux/tee_remoteproc.h                | 101 +++++
>>  7 files changed, 753 insertions(+), 46 deletions(-)
>>  create mode 100644 drivers/remoteproc/tee_remoteproc.c
>>  create mode 100644 include/linux/tee_remoteproc.h
> 
> Looking at comments from Christoph, there seems to be a good refactoring
> exercise in store for this pathset. 

Yes, a good opportunity to ramp-up on kernel memory management :)

As such I will wait for the next revision
> to look at it.

That's fair. More than that I would prefer to focus first on OP-TEE part that
provides the service. The OP-TEE pull request review could have significant
impacts on the kernel implementation...

Thanks,
Arnaud

> 
> Thanks,
> Mathieu
> 
>>
>> -- 
>> 2.25.1
>>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
