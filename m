Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 635B32F5CDD
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Jan 2021 10:06:29 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 080C3C5660F;
	Thu, 14 Jan 2021 09:06:29 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 99470C32EA8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Jan 2021 09:06:25 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 10E922US020227; Thu, 14 Jan 2021 10:06:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=iOusNVKYpK/rUzV9p2n9FI3ih0zBi6c6lWLF2Wo9T2E=;
 b=6SbEn1F8DEZRaoW3tB7wsnwd/an7oQhOAYQyFaSBPL5y94qEkZDRW0oUOCyMO7GXkkRF
 pdTS0FTHYVNps92luQgioXH057rQR1EYkgq40QKA2++C738t59x1i2bZPzf8se+UnfSf
 9+C13zqU9c8tQ+aVY9aP6LRbfwzmByoQD0RnZ5Jwkt4SKz3MhinueBmjgrdUc0fxN7Gs
 Jm85AW7eMgU5mdKpmD9fkd+b24QiYcv9E+A0LDgPWh6Isug7L4edZ1TVEEhtbbP9pc6R
 07MAEDdYd+DVtfaw2z2meXFgbmJ1Hf0Li/V6itt2r05UxqAotx1WQ0lqG+Ou2OvpHzNJ FA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 362379c85y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 14 Jan 2021 10:06:21 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0188210002A;
 Thu, 14 Jan 2021 10:06:20 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DDBFC2283F5;
 Thu, 14 Jan 2021 10:06:20 +0100 (CET)
Received: from lmecxl0889.lme.st.com (10.75.127.50) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 14 Jan
 2021 10:06:20 +0100
To: Mathieu Poirier <mathieu.poirier@linaro.org>
References: <20201222105726.16906-1-arnaud.pouliquen@foss.st.com>
 <20210113203143.GA229796@xps15>
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <d1daa198-dcf1-a63d-309d-868741088d09@foss.st.com>
Date: Thu, 14 Jan 2021 10:05:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210113203143.GA229796@xps15>
Content-Language: en-US
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-14_03:2021-01-13,
 2021-01-14 signatures=0
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-arm-msm@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2 00/16] introduce generic IOCTL
 interface for RPMsg channels management
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

Hi Mathieu,

On 1/13/21 9:31 PM, Mathieu Poirier wrote:
> Hi Arnaud,
> 
> [...]
> 
>>
>> Arnaud Pouliquen (16):
>>   rpmsg: introduce RPMsg control driver for channel creation
>>   rpmsg: add RPMsg control API to register service
>>   rpmsg: add override field in channel info
>>   rpmsg: ctrl: implement the ioctl function to create device
>>   rpmsg: ns: initialize channel info override field
>>   rpmsg: add helper to register the rpmsg ctrl device
>>   rpmsg: char: clean up rpmsg class
>>   rpmsg: char: make char rpmsg a rpmsg device without the control part
>>   rpmsg: char: register RPMsg raw service to the ioctl interface.
>>   rpmsg: char: allow only one endpoint per device
>>   rpmsg: char: check destination address is not null
>>   rpmsg: virtio: use the driver_override in channel creation ops
>>   rpmsg: virtio: probe the rpmsg_ctl device
>>   rpmsg: glink: add create and release rpmsg channel ops
>>   rpmsg: smd: add create and release rpmsg channel ops
>>   rpmsg: replace rpmsg_chrdev_register_device use
>>
>>  drivers/rpmsg/Kconfig             |   8 +
>>  drivers/rpmsg/Makefile            |   1 +
>>  drivers/rpmsg/qcom_glink_native.c |  96 +++++++--
>>  drivers/rpmsg/qcom_smd.c          |  59 +++++-
>>  drivers/rpmsg/rpmsg_char.c        | 246 ++++++-----------------
>>  drivers/rpmsg/rpmsg_ctrl.c        | 320 ++++++++++++++++++++++++++++++
>>  drivers/rpmsg/rpmsg_internal.h    |  14 --
>>  drivers/rpmsg/rpmsg_ns.c          |   1 +
>>  drivers/rpmsg/virtio_rpmsg_bus.c  |  38 +++-
>>  include/linux/rpmsg.h             |  40 ++++
>>  include/uapi/linux/rpmsg.h        |  14 ++
>>  11 files changed, 606 insertions(+), 231 deletions(-)
>>  create mode 100644 drivers/rpmsg/rpmsg_ctrl.c
> 
> I am finally coming around to review this set.  I see that you already had an
> extensive conversation with Bjorn - did you want me to have a look as well or
> should I wait for the next revision?

Based on Bjorn first feedback, my understanding is that the management based on
create/destroy channel does not match with the QCOM RPMsg backend
implementation. I think this is the blocking point of my V2 implementation.

Before sending a new revision i would hope that we have a roundtable discussion
to clarify the direction to move forward, to avoid sending useless revisions.

As discussed in [1], there are different alternatives, that probably depend on
the features we expect to support.
I tried to sum-up the requirement I have in mind in [1].

The 2 main directions I can see are:
- rework the rpmsg_char to match with all rpmsg backend (V2 implementation)
    to be honest i don't know how to move forward in this direction as QCOM and
    virtio backends are rather different.
- not modify the rpmsg_char but create the rpmsg_ctrl (and perhaps also a
rpmsg_raw for a /dev/rpmsg data interface) that would use the create/destroy
channel such as the rpmsg ns (V1 implementation).
    one advantage of this solution is that this does not impact QCOM drivers.
    one drawback is that we duplicate the code.

[1]
https://patchwork.kernel.org/project/linux-remoteproc/patch/20201222105726.16906-5-arnaud.pouliquen@foss.st.com/

[2] https://patchwork.kernel.org/project/linux-remoteproc/list/?series=327277

Thanks,
Arnaud

> 
> Thanks,
> Mathieu
> 
>>
>> -- 
>> 2.17.1
>>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
