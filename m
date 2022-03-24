Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D9B4E67E5
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Mar 2022 18:36:35 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 05943C60497;
	Thu, 24 Mar 2022 17:36:35 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 43E3FC60468
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Mar 2022 17:36:34 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22OEsGHx021455;
 Thu, 24 Mar 2022 18:36:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=eh0bJYy6P9lh2u14OVLnjWv2JImlfYQbNppO6gtKh8A=;
 b=z2PefEh6Zay2Djoiej/voaURbNdb9QykeoBOsU2tyE2n+wB7zHBg0WkPbX03IkklOkF/
 Fln8Ux4Ym69+VRaVS9sE98+8nANInVn44ljPX3y3C4ixBKEAnpzoQZeRPrz0Ph7yIrVU
 9iHTx8T+YR11Q7Kn/XaxCIg8JiMAh7kLNmSEjqdga5PAIP9qObzqoBKgcf5+l+uudOPN
 TeZvW8otEbW6vuA1ye9vXlor3xX9GQTVeLlPd/OgexbYik3TSaUiK+P9Uc/MqiFCFaBx
 9eAuuo7j/BMgU0ZoKiRhFcgXw1meuDBdhTB6hrM4TDG9ugEwkecSL9Fv4oN8WePPg2w7 8Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ew7d4rd7y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Mar 2022 18:36:26 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DF45410002A;
 Thu, 24 Mar 2022 18:36:24 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node1.st.com [10.75.127.4])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 92772245511;
 Thu, 24 Mar 2022 18:36:24 +0100 (CET)
Received: from [10.201.20.246] (10.75.127.49) by SFHDAG2NODE1.st.com
 (10.75.127.4) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Thu, 24 Mar
 2022 18:36:23 +0100
Message-ID: <239eeeea-af04-7163-61ca-436c6632c2a8@foss.st.com>
Date: Thu, 24 Mar 2022 18:36:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Mathieu Poirier
 <mathieu.poirier@linaro.org>
References: <20220124102524.295783-1-arnaud.pouliquen@foss.st.com>
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
In-Reply-To: <20220124102524.295783-1-arnaud.pouliquen@foss.st.com>
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE1.st.com
 (10.75.127.4)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-24_06,2022-03-24_01,2022-02-23_01
Cc: julien.massot@iot.bzh, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v9 00/11] Restructure the rpmsg_char
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hi Bjorn,

On 1/24/22 11:25, Arnaud Pouliquen wrote:
> Updates from V8 [1]:
> - rebase on 5.17-rc1 + rpmsg char cdev release fixes[2][3]
> - updates based on Bjorn Andersson's comments:
>   - remove rpmsg_create_default_ept API, set directly the ept->priv in rpmsg_chrdev_probe
>     function.
>   - rework commit message in [8/9]rpmsg: char: Introduce the "rpmsg-raw" channel
> 
> Patchset description:
> 
> The current rpmsg_char module implements a /dev/rpmsg_ctrl interface that provides the ability to
> instantiate char devices (/dev/rpmsgX) associated with an rpmsg endpoint for communication with the
> remote processor.
> This implementation fits with QCOM rpmsg backend but not with the magement by chanel implemented
> in the generic rpmsg virtio backend.
> This series restructures the rpmsg_char driver to decorrelate the control part from the data part
> in order to improve its compatible with the rpmsg virtio backend.
> 
> Objective:
> - Expose a /dev/rpmsg_ctrlX interface for the application that is no longer dedicated to the
>   rpmsg_char but generalized to all rpmsg services. This offers capability to create and destroy
>   rpmsg channels from a user's application initiative (using the new RPMSG_CREATE_DEV_IOCTL and
>   RPMSG_DESTROY_DEV_IOCTL controls).
>   An application will be able to create/establish an rpmsg communication channel to communicate
>   with the remote processor, and not only wait the remote processor initiative.
>   This is interesting for example to establish a temporary communication link for diagnosis,
>   calibration, debugging... or instantiate  new data flows on some user actions.
> - Add capability to probe the rpmsg_char device at the initiative of the remote processor
>  (rpmsg service announcement mechanism).
>   This allows platforms based on the rpmsg virtio backend to create the /dev/rpmgX interface with
>   a rpmsg name service announcement.
> 
> Subsets:
>   - Extract the control part of the char dev and create the rpmsg_ctrl.c file (patches 1 to 6)
>   - Introduce the "rpmsg-raw" channel in rpmsg_char(patches 7 to 10)
>   - Introduce the RPMSG_CREATE_DEV_IOCTL IOCTL and RPMSG_DESTROY_DEV_IOCTL to instantiate RPMsg
>     devices (patch 11)
>     The application can then create or release a channel by specifying:
>        - the name service of the device to instantiate.   
>        - the source address.
>        - the destination address.
> 
> This series has be applied and tested on 'commit e783362eb54c ("Linux 5.17-rc1") +
> rpmsg_char cdev release fixes [2][3]
> 
> [1] https://lkml.org/lkml/2021/12/7/186
> [2] https://lkml.org/lkml/2022/1/10/1129
> [3] https://lkml.org/lkml/2022/1/10/1130
> 
> Arnaud Pouliquen (11):
>   rpmsg: char: Export eptdev create and destroy functions
>   rpmsg: Create the rpmsg class in core instead of in rpmsg char
>   rpmsg: Move the rpmsg control device from rpmsg_char to rpmsg_ctrl


>   arm: configs: Configs that had RPMSG_CHAR now get RPMSG_CTRL
>   RISC-V: configs: Configs that had RPMSG_CHAR now get RPMSG_CTRL
>   arm64: defconfig: Config that had RPMSG_CHAR now gets RPMSG_CTRL

Thank you for merging this series!

I can't see in the "for next" branch[1] the 3 patches above that update configs
Are you expecting a specific action from me?   

[1]https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git

Regards,
Arnaud

>   rpmsg: Update rpmsg_chrdev_register_device function
>   rpmsg: char: Refactor rpmsg_chrdev_eptdev_create function
>   rpmsg: char: Add possibility to use default endpoint of the rpmsg
>     device
>   rpmsg: char: Introduce the "rpmsg-raw" channel
>   rpmsg: ctrl: Introduce new RPMSG_CREATE/RELEASE_DEV_IOCTL controls
> 
>  arch/arm/configs/qcom_defconfig   |   1 +
>  arch/arm64/configs/defconfig      |   1 +
>  arch/riscv/configs/defconfig      |   1 +
>  arch/riscv/configs/rv32_defconfig |   1 +
>  drivers/rpmsg/Kconfig             |   8 +
>  drivers/rpmsg/Makefile            |   1 +
>  drivers/rpmsg/qcom_glink_native.c |   2 +-
>  drivers/rpmsg/qcom_smd.c          |   2 +-
>  drivers/rpmsg/rpmsg_char.c        | 231 +++++++++++-----------------
>  drivers/rpmsg/rpmsg_char.h        |  46 ++++++
>  drivers/rpmsg/rpmsg_core.c        |  15 +-
>  drivers/rpmsg/rpmsg_ctrl.c        | 243 ++++++++++++++++++++++++++++++
>  drivers/rpmsg/rpmsg_internal.h    |  10 +-
>  drivers/rpmsg/virtio_rpmsg_bus.c  |   2 +-
>  include/uapi/linux/rpmsg.h        |  10 ++
>  15 files changed, 419 insertions(+), 155 deletions(-)
>  create mode 100644 drivers/rpmsg/rpmsg_char.h
>  create mode 100644 drivers/rpmsg/rpmsg_ctrl.c
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
