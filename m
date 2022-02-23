Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 015184C2448
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Feb 2022 08:05:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4F6BEC5F1D7;
	Thu, 24 Feb 2022 07:05:10 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A1788C5A4FD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Feb 2022 21:28:36 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id p9so41703538wra.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Feb 2022 13:28:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=0YK7APaDiTPWfwD2QnORHvmLB5q84+dKOtRyftB0uhU=;
 b=WLpMmO9MRwflWvya8gR3yu5MLwDjHJMy/NtZOfH2MBKCM06xKgAT5PR2Hg4RjD5Dxx
 s2E3/6DOu4nwZzrSKn3vRbQlfCZw1dERZ61z5btlsd4dlCeFb0TCKG0tX9IK7wDNLfZl
 Tb4HdBt3/V8qyBysfwma4TVc4qpcDnR2bvEN+Fp3MPTh2aU0yNROilTWQvLGSu6ziSlt
 sY6r/7rPqpCRLYlh91U7sf6fBdsKqkI053dIvZnMegjpnC5kEEInWv3hhVcJVlzd/0S/
 niDpi+JsS4Whm0jkbOmlJviRTSZbKF4zmojmIJoeGo+xZXP7HUCUlRZRFPpaLGJeZnxI
 /7ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0YK7APaDiTPWfwD2QnORHvmLB5q84+dKOtRyftB0uhU=;
 b=0PjVO17MqujCHI7dvqzgZicnpLGbGuPRzHyMPM7d++a7UGdgiemlDEhex20gMcq6Ew
 avQsCb7sx+HybsRhziQbwKgrnOApO8SM31th4MVisa/4jN8+/MyadP8qBl0B/zG1/DcP
 VmsKoHVMONhCplkYc1aCU5TJmDf9FcS0FUIlCwytn/ogALulmuLJ7491cLPKoG4HXkdH
 3ebuhb468hEysbltOzRsr85loai+wkF/X06fQF4rWiez37ReBC/qF4+jZmuW5Hx9KThA
 IL0n659zeKiomzp4yWIxKhmA6cmQeAflRzk4FSC8m0gCJnd3oNBnGc/ty1L7B/qOTAeV
 VTUw==
X-Gm-Message-State: AOAM532bZ/k9qrzBBeCsefWibj2K3doznClm9mmUstNLRG1oquoZHmeF
 BE4ZG4DHq1sbqiKfBJES1/s=
X-Google-Smtp-Source: ABdhPJw7LZnXitIO3MYp14pRCaZMOD4GDLd8Ot3GC4uDtFYcc2pmomZdcQPO+2XrPQeSWhK4rxU1zA==
X-Received: by 2002:a05:6000:12cc:b0:1ed:b776:a86b with SMTP id
 l12-20020a05600012cc00b001edb776a86bmr1130345wrx.307.1645651715942; 
 Wed, 23 Feb 2022 13:28:35 -0800 (PST)
Received: from [192.168.2.122] (p578f0c28.dip0.t-ipconnect.de. [87.143.12.40])
 by smtp.gmail.com with ESMTPSA id
 i15sm713311wmq.23.2022.02.23.13.28.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Feb 2022 13:28:35 -0800 (PST)
Message-ID: <ab97c2a5-7705-eae8-9bc2-908e7a9cb709@gmail.com>
Date: Wed, 23 Feb 2022 22:28:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Content-Language: en-US
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
References: <20220124102524.295783-1-arnaud.pouliquen@foss.st.com>
From: Philipp Rossak <embed3d@gmail.com>
In-Reply-To: <20220124102524.295783-1-arnaud.pouliquen@foss.st.com>
X-Mailman-Approved-At: Thu, 24 Feb 2022 07:05:09 +0000
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hi Arnaud,

thanks for working on this! I'm currently testing/using this patch 
series on my imx7d project because it adds the capability that the 
remote processor can register it's endpoints dynamically (as mentioned 
in the objectives).

After a few tests, debugging, and checking the openamp specification [1] 
I think that you missed the second ns_announcement that should be sent 
from linux master to the slave after it created the channel/endpoint. 
Without this second announcement the remote processor is not able to 
send messages to the linux master because it doesn't know the 
destination address until it receives a message from the linux master.

Cheers,
Philipp


[1]: 
https://github.com/OpenAMP/open-amp/blob/main/docs/img/coprocessor-rpmsg-ns.png

On 24.01.22 11:25, Arnaud Pouliquen wrote:
> Updates from V8 [1]:
> - rebase on 5.17-rc1 + rpmsg char cdev release fixes[2][3]
> - updates based on Bjorn Andersson's comments:
>    - remove rpmsg_create_default_ept API, set directly the ept->priv in rpmsg_chrdev_probe
>      function.
>    - rework commit message in [8/9]rpmsg: char: Introduce the "rpmsg-raw" channel
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
>    - Introduce the "rpmsg-raw" channel in rpmsg_char(patches 7 to 10)
>    - Introduce the RPMSG_CREATE_DEV_IOCTL IOCTL and RPMSG_DESTROY_DEV_IOCTL to instantiate RPMsg
>      devices (patch 11)
>      The application can then create or release a channel by specifying:
>         - the name service of the device to instantiate.
>         - the source address.
>         - the destination address.
> 
> This series has be applied and tested on 'commit e783362eb54c ("Linux 5.17-rc1") +
> rpmsg_char cdev release fixes [2][3]
> 
> [1] https://lkml.org/lkml/2021/12/7/186
> [2] https://lkml.org/lkml/2022/1/10/1129
> [3] https://lkml.org/lkml/2022/1/10/1130
> 
> Arnaud Pouliquen (11):
>    rpmsg: char: Export eptdev create and destroy functions
>    rpmsg: Create the rpmsg class in core instead of in rpmsg char
>    rpmsg: Move the rpmsg control device from rpmsg_char to rpmsg_ctrl
>    arm: configs: Configs that had RPMSG_CHAR now get RPMSG_CTRL
>    RISC-V: configs: Configs that had RPMSG_CHAR now get RPMSG_CTRL
>    arm64: defconfig: Config that had RPMSG_CHAR now gets RPMSG_CTRL
>    rpmsg: Update rpmsg_chrdev_register_device function
>    rpmsg: char: Refactor rpmsg_chrdev_eptdev_create function
>    rpmsg: char: Add possibility to use default endpoint of the rpmsg
>      device
>    rpmsg: char: Introduce the "rpmsg-raw" channel
>    rpmsg: ctrl: Introduce new RPMSG_CREATE/RELEASE_DEV_IOCTL controls
> 
>   arch/arm/configs/qcom_defconfig   |   1 +
>   arch/arm64/configs/defconfig      |   1 +
>   arch/riscv/configs/defconfig      |   1 +
>   arch/riscv/configs/rv32_defconfig |   1 +
>   drivers/rpmsg/Kconfig             |   8 +
>   drivers/rpmsg/Makefile            |   1 +
>   drivers/rpmsg/qcom_glink_native.c |   2 +-
>   drivers/rpmsg/qcom_smd.c          |   2 +-
>   drivers/rpmsg/rpmsg_char.c        | 231 +++++++++++-----------------
>   drivers/rpmsg/rpmsg_char.h        |  46 ++++++
>   drivers/rpmsg/rpmsg_core.c        |  15 +-
>   drivers/rpmsg/rpmsg_ctrl.c        | 243 ++++++++++++++++++++++++++++++
>   drivers/rpmsg/rpmsg_internal.h    |  10 +-
>   drivers/rpmsg/virtio_rpmsg_bus.c  |   2 +-
>   include/uapi/linux/rpmsg.h        |  10 ++
>   15 files changed, 419 insertions(+), 155 deletions(-)
>   create mode 100644 drivers/rpmsg/rpmsg_char.h
>   create mode 100644 drivers/rpmsg/rpmsg_ctrl.c
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
