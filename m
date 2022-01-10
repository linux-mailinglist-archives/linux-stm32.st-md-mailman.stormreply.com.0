Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F127548946E
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Jan 2022 09:56:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2BF8AC5F1FC;
	Mon, 10 Jan 2022 08:48:51 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 36FA8CFAC52
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Jan 2022 08:48:49 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20A6Qmr9008917;
 Mon, 10 Jan 2022 09:48:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=6QC6fNL+mfmlwFssZDHcJVIPOyYB0T4GdiuhsjNBWmA=;
 b=ZCh2qWPk4JE8CU27jI7Nqsc5dhv2qODRrv/c7NFkHPAmm3p2vm0XcFtD19RojnTUUDFB
 QxmpRIPY2h69U0FybOjSPyyuA7HgERiSqtNBKwXR+hFhQQQoYG5JCWKDYQQzdTTPrjxC
 SaA0xHf7tBAXvD26JkpxkOcs4YNwroSiWPaKFPo7XGsSDXBpvBZFnkfOAIkD6dQa4TOw
 buChMBRXZuxVkTM3XXnFQEy0zMe88UT6KJz0RDgO4tCopm9obyV9WLTl49PxcQk7qFLX
 9RfTVBX2pA5RQe4zA9mo5eLh0qfnwDZKul2FCP+eta1lphvHz/Xz6uUvwIAzMXeC8qcb cA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3dgfhr0pmn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Jan 2022 09:48:41 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 75B4E10002A;
 Mon, 10 Jan 2022 09:48:40 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5E2A0226D50;
 Mon, 10 Jan 2022 09:48:40 +0100 (CET)
Received: from lmecxl0889.lme.st.com (10.75.127.50) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Mon, 10 Jan
 2022 09:48:39 +0100
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Mathieu Poirier
 <mathieu.poirier@linaro.org>
References: <20211207080843.21222-1-arnaud.pouliquen@foss.st.com>
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <b5b3f474-f84d-d682-2987-a6f812da0710@foss.st.com>
Date: Mon, 10 Jan 2022 09:48:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211207080843.21222-1-arnaud.pouliquen@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-10_03,2022-01-07_01,2021-12-02_01
Cc: julien.massot@iot.bzh, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v8 00/13] Restructure the rpmsg_char
 driver and introduce rpmsg_ctrl driver
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hello Bjorn,


On 12/7/21 9:08 AM, Arnaud Pouliquen wrote:
> Update from V7 [1]:
> - miscellaneous fixes based on Bjorn Andersson's comments
> - add "arm64: defconfig: Config that had RPMSG_CHAR now gets RPMSG_CTRL"
>    for 5.16 compatibility

Gentle reminder.
Any new comment or concern on this patchset?

Regards,
Arnaud

> 
> Patchset description:
> 
> The current rpmsg_char module implements a /dev/rpmsg_ctrl interface that provides the ability to
> instantiate char devices (/dev/rpmsgX) associated with an rpmsg endpoint for communication with the
> remote processor.
> This implementation fit with QCOM rpmsg backend but not with themagement by chanel implemented in
> the generic rpmsg virtio backend.
> This series restructures the rpmsg_char driver to decorrelate the control part from the data part
> in order to improve its compatible with the rpmsg virtio backend.
> 
> Objective:
> - Expose a /dev/rpmsg_ctrlX interface for the application that is no longer dedicated to the
>    rpmsg_char but generalized to all rpmsg services. This offers capability to create and destroy
>    rpmsg channels from a user's application initiative (using the new RPMSG_CREATE_DEV_IOCTL and
>    RPMSG_DESTROY_DEV_IOCTL controls).
>    An application will be able to create/establish an rpmsg communication channel to communicate
>    with the remote processor, and not only wait the remote processor initiative.
>    This is interesting for example to establish a temporary communication link for diagnosis,
>    calibration, debugging... or instantiate  new data flows on some user actions.
> - Add capability to probe the rpmsg_char device at the initiative of the remote processor
>   (rpmsg service announcement mechanism).
>    This allows platforms based on the rpmsg virtio backend to create the /dev/rpmgX interface with
>    a rpmsg name service announcement.
> 
> Subsets:
>    - Extract the control part of the char dev and create the rpmsg_ctrl.c file (patches 1 to 6)
>    - Introduce the "rpmsg-raw" channel in rpmsg_char(patches 7 to 11)
>    - Introduce the RPMSG_CREATE_DEV_IOCTL IOCTL and RPMSG_DESTROY_DEV_IOCTL to instantiate RPMsg
>      devices (patch 12)
>      The application can then create or release a channel by specifying:
>         - the name service of the device to instantiate.
>         - the source address.
>         - the destination address.
>    - Send a ns announcement to the remote processor on default endpoint creation (patche 13)
> 
> This series has be applied and tested on for-next branch 'c4b39a582b9b)[2].
> 
> [1] https://lkml.org/lkml/2021/11/8/501
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git
> 
> Arnaud Pouliquen (10):
>    rpmsg: char: Export eptdev create an destroy functions
>    rpmsg: Create the rpmsg class in core instead of in rpmsg char
>    rpmsg: Move the rpmsg control device from rpmsg_char to rpmsg_ctrl
>    arm: configs: Configs that had RPMSG_CHAR now get RPMSG_CTRL
>    RISC-V: configs: Configs that had RPMSG_CHAR now get RPMSG_CTRL
>    arm64: defconfig: Config that had RPMSG_CHAR now gets RPMSG_CTRL
>    rpmsg: Update rpmsg_chrdev_register_device function
>    rpmsg: char: Refactor rpmsg_chrdev_eptdev_create function
>    rpmsg: Introduce rpmsg_create_default_ept function
>    rpmsg: char: Add possibility to use default endpoint of the rpmsg
>      device.
>    rpmsg: char: Introduce the "rpmsg-raw" channel
>    rpmsg: ctrl: Introduce new RPMSG_CREATE/RELEASE_DEV_IOCTL controls
>    rpmsg: core: Send a ns announcement when a default endpoint is created
> 
>   arch/arm/configs/qcom_defconfig   |   1 +
>   arch/arm64/configs/defconfig      |   1 +
>   arch/riscv/configs/defconfig      |   1 +
>   arch/riscv/configs/rv32_defconfig |   1 +
>   drivers/rpmsg/Kconfig             |   8 +
>   drivers/rpmsg/Makefile            |   1 +
>   drivers/rpmsg/qcom_glink_native.c |   2 +-
>   drivers/rpmsg/qcom_smd.c          |   2 +-
>   drivers/rpmsg/rpmsg_char.c        | 246 +++++++++++------------------
>   drivers/rpmsg/rpmsg_char.h        |  46 ++++++
>   drivers/rpmsg/rpmsg_core.c        |  84 +++++++++-
>   drivers/rpmsg/rpmsg_ctrl.c        | 250 ++++++++++++++++++++++++++++++
>   drivers/rpmsg/rpmsg_internal.h    |  14 +-
>   drivers/rpmsg/virtio_rpmsg_bus.c  |   2 +-
>   include/uapi/linux/rpmsg.h        |  10 ++
>   15 files changed, 505 insertions(+), 164 deletions(-)
>   create mode 100644 drivers/rpmsg/rpmsg_char.h
>   create mode 100644 drivers/rpmsg/rpmsg_ctrl.c
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
