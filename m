Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 160B5428ADB
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Oct 2021 12:39:09 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D2579C5C82E;
	Mon, 11 Oct 2021 10:39:08 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 81EA1C32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Oct 2021 10:39:06 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19B9et2T022265; 
 Mon, 11 Oct 2021 12:39:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=MyCYk6q6b+98QUO/LIMJAx33+2KlWqEKU/USaeERzKM=;
 b=1aVR09Iq3LeQV/m6AxAwRQlmOIInt84Q48kd0FwqGmDpaqq0gc3J/ZrhoKdHa0ehFXD4
 RG+IK3xuoitkthAiP7uNfc81U4WA2SMcDAV6uN/S2pD+5Dv2LTx4XW9LypmtvEzoyxAU
 q3RvvsQrTGjCNUo053a7CtLj6OpHXflrFPq+Vf2YyySmiWhhnf0zrmGxEYe2vz+tczDo
 yoyMEjTi0WVSdjCcBdqSEuNdJJX65xO5zFmaeQK7kmO7NQWdSmy3QRP4cbs8pByNVCoB
 tVjS1fCutPuZoTtNWGiQJd7cerIfcRyU8of1uGUI5tTaHzWSIvDcM8ZoxWrkPphYCX9Y ag== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3bmdxrj464-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Oct 2021 12:39:05 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 671DA10002A;
 Mon, 11 Oct 2021 12:39:05 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5F6F721CA78;
 Mon, 11 Oct 2021 12:39:05 +0200 (CEST)
Received: from lmecxl0889.lme.st.com (10.75.127.48) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 11 Oct
 2021 12:39:04 +0200
To: Bjorn Andersson <bjorn.andersson@linaro.org>
References: <20210712123752.10449-1-arnaud.pouliquen@foss.st.com>
 <20210712123752.10449-3-arnaud.pouliquen@foss.st.com>
 <YWDURVTg1PpxRDEu@ripper>
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <ea8084fa-b9b9-8e23-1adf-f5d22e94192e@foss.st.com>
Date: Mon, 11 Oct 2021 12:39:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YWDURVTg1PpxRDEu@ripper>
Content-Language: en-US
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-11_03,2021-10-07_02,2020-04-07_01
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Mathieu Poirier <mathieu.poirier@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v5 2/4] rpmsg: char: Export eptdev create
 an destroy functions
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



On 10/9/21 1:29 AM, Bjorn Andersson wrote:
> On Mon 12 Jul 05:37 PDT 2021, Arnaud Pouliquen wrote:
> [..]
>> diff --git a/drivers/rpmsg/rpmsg_char.h b/drivers/rpmsg/rpmsg_char.h
>> new file mode 100644
>> index 000000000000..22573b60e008
>> --- /dev/null
>> +++ b/drivers/rpmsg/rpmsg_char.h
>> @@ -0,0 +1,49 @@
>> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
>> +/*
>> + * Copyright (C) STMicroelectronics 2021.
>> + */
>> +
>> +#ifndef __RPMSG_CHRDEV_H__
>> +#define __RPMSG_CHRDEV_H__
>> +
>> +#if IS_REACHABLE(CONFIG_RPMSG_CHAR)
> 
> This does allow you to build a kernel with RPMSG_CHAR=m and RPMSG_CTRL=y
> without link failures. Any modules in the system will be able to call
> rpmsg_chrdev_eptdev_create(), but the rpmsg_ctrl driver will only end up
> in the stub.
> 
> This sounds like a recipe for a terrible debugging session...

The RPMSG_CREATE_EPT_IOCTL control create a dependency between the rpmsg_ctrl
and the rpmsg_char. The build error option seems not a good alternative.
And in case of RPMSG_CHAR=m and RPMSG_CTRL=y, an error is returned so not only a
stub.

What about adding a WARN_ON(1) in rpmsg_chrdev_eptdev_create
with an associated comment to ease the debug?

Regards,
Arnaud

> 
> Regards,
> Bjorn
> 
>> +/**
>> + * rpmsg_chrdev_eptdev_create() - register char device based on an endpoint
>> + * @rpdev:  prepared rpdev to be used for creating endpoints
>> + * @parent: parent device
>> + * @chinfo: associated endpoint channel information.
>> + *
>> + * This function create a new rpmsg char endpoint device to instantiate a new
>> + * endpoint based on chinfo information.
>> + */
>> +int rpmsg_chrdev_eptdev_create(struct rpmsg_device *rpdev, struct device *parent,
>> +			       struct rpmsg_channel_info chinfo);
>> +
>> +/**
>> + * rpmsg_chrdev_eptdev_destroy() - destroy created char device endpoint.
>> + * @data: private data associated to the endpoint device
>> + *
>> + * This function destroys a rpmsg char endpoint device created by the RPMSG_DESTROY_EPT_IOCTL
>> + * control.
>> + */
>> +int rpmsg_chrdev_eptdev_destroy(struct device *dev, void *data);
>> +
>> +#else  /*IS_REACHABLE(CONFIG_RPMSG_CHAR) */
>> +
>> +static inline int rpmsg_chrdev_eptdev_create(struct rpmsg_device *rpdev, struct device *parent,
>> +					     struct rpmsg_channel_info chinfo)
>> +{
>> +	return -EINVAL;
>> +}
>> +
>> +static inline int rpmsg_chrdev_eptdev_destroy(struct device *dev, void *data)
>> +{
>> +	/* This shouldn't be possible */
>> +	WARN_ON(1);
>> +
>> +	return 0;
>> +}
>> +
>> +#endif /*IS_REACHABLE(CONFIG_RPMSG_CHAR) */
>> +
>> +#endif /*__RPMSG_CHRDEV_H__ */
>> -- 
>> 2.17.1
>>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
