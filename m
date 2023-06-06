Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB16723A7D
	for <lists+linux-stm32@lfdr.de>; Tue,  6 Jun 2023 09:51:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EDB51C6905A;
	Tue,  6 Jun 2023 07:51:46 +0000 (UTC)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com
 [209.85.217.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6F711C65E4C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Jun 2023 07:51:45 +0000 (UTC)
Received: by mail-vs1-f47.google.com with SMTP id
 ada2fe7eead31-43b28754c88so2997759137.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 06 Jun 2023 00:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686037904; x=1688629904;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qEb8brDaVgEf6xNJnniCPIjPebxe7oNg6yfvYJTINhE=;
 b=zN1OwuYLYtfiOXTEJ1n9kDh922zCa5AkwC7gHObCBmiHZik39QnJ+ROITrspCVlzuT
 YCJfrvXNBqRFXIHfImLkzYi2qMdfRttx2ZEF3U2DRyvMIR/P8VXcWTXHAn5WxnLbwXH4
 /eTDKXJTmtViURLDpFr+hmoH+P47MsCb/pRFZJCMC3fkl3J7QqOl58m+RTX/CGThRxZJ
 IenCUv/YXAvAZ4xMO5Mz7aaM3Hz8uSkAPvgD0bLuPJmvHeRsHdlguS0XJZm1koQM0oR0
 ZxYCGdzSm3eWZ/hYQVuOt1890nf2Kgm+TKQgs+bnZmVFtAE1BcGwnTsv84wSKMAhPS+r
 CPWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686037904; x=1688629904;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qEb8brDaVgEf6xNJnniCPIjPebxe7oNg6yfvYJTINhE=;
 b=DAbVzQx0PzwwQ2uGDcCid2sSCltELMA1QxkcrcqellfY3U6HCeucSh+VkXt9OnXnsN
 WIertgEUvhkiwLnOCYLA6djzBsrTFL1dJLViZjI4ulm+uZR3/ueyKEghdefAUFoTi7bw
 khwQYuL/GniTuQTUEmK6Nigt6xJMn0j24/mJkG0gFud50Vzc0748rLgVHRTZd8fDjp0B
 JL+OneHlvB+Wy7RgCGveC8jyqx9sB6celv8ohctvRV8aaLb8dQZKHzgw4H2dylfh5s0P
 Y+OxykKKGVIZegKrpFMP9WvHWZYoVr9o3eAujBk2I1oMh4oNCmo6osnC7hVChrT8FkoZ
 35SQ==
X-Gm-Message-State: AC+VfDze5EL0zmRtQremjMCQHwzM+nptIefYr8o1hmu80tAEIvQSG+6I
 Zh95QnUmKCeikO4gDKoTNkr0C60U0IM3tn74MO//dw==
X-Google-Smtp-Source: ACHHUZ7KvWctFlyoIZEP7ZNjUZQJG5qt/dW7yUAl1wU6fao7ISI+t/dotyHHlAYIJ8EkqA7yYwNMsCjKcRb/X0+++F0=
X-Received: by 2002:a05:6102:3110:b0:436:4f07:fbe with SMTP id
 e16-20020a056102311000b004364f070fbemr775393vsh.15.1686037904296; Tue, 06 Jun
 2023 00:51:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230526010748.1222-1-masahisa.kojima@linaro.org>
 <20230526010748.1222-4-masahisa.kojima@linaro.org>
 <0d3e0370-eb76-010f-3d30-9acc9b59645c@siemens.com>
 <CAFA6WYPnWJNPvhT2JDkO-qXRUaJoxBGZEvSfhxcRynV7=VSdQA@mail.gmail.com>
 <CAMj1kXFM45PCTU--+CCed6Cq_N5XqDG6tTu6fnQTSCpW2BWA5A@mail.gmail.com>
In-Reply-To: <CAMj1kXFM45PCTU--+CCed6Cq_N5XqDG6tTu6fnQTSCpW2BWA5A@mail.gmail.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Tue, 6 Jun 2023 13:21:33 +0530
Message-ID: <CAFA6WYNjn=7tKy2nZ6JuxWMDVzW+Yyxj8F6Kob-2ebEkCjUB4A@mail.gmail.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: linux-efi@vger.kernel.org, Jan Kiszka <jan.kiszka@siemens.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, "Su,
 Bao Cheng \(RC-CN DF FA R&D\)" <baocheng.su@siemens.com>,
 Masahisa Kojima <masahisa.kojima@linaro.org>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v5 3/3] efi: Add tee-based EFI variable
	driver
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

On Tue, 6 Jun 2023 at 12:28, Ard Biesheuvel <ardb@kernel.org> wrote:
>
> On Tue, 6 Jun 2023 at 08:52, Sumit Garg <sumit.garg@linaro.org> wrote:
> >
> > Hi Jan,
> >
> > On Tue, 6 Jun 2023 at 12:09, Jan Kiszka <jan.kiszka@siemens.com> wrote:
> > >
> > > On 26.05.23 03:07, Masahisa Kojima wrote:
> > > > When the flash is not owned by the non-secure world, accessing the EFI
> > > > variables is straightforward and done via EFI Runtime Variable Services.
> > > > In this case, critical variables for system integrity and security
> > > > are normally stored in the dedicated secure storage and only accessible
> > > > from the secure world.
> > > >
> > > > On the other hand, the small embedded devices don't have the special
> > > > dedicated secure storage. The eMMC device with an RPMB partition is
> > > > becoming more common, we can use an RPMB partition to store the
> > > > EFI Variables.
> > > >
> > > > The eMMC device is typically owned by the non-secure world(linux in
> > > > this case). There is an existing solution utilizing eMMC RPMB partition
> > > > for EFI Variables, it is implemented by interacting with
> > > > TEE(OP-TEE in this case), StandaloneMM(as EFI Variable Service Pseudo TA),
> > > > eMMC driver and tee-supplicant. The last piece is the tee-based
> > > > variable access driver to interact with TEE and StandaloneMM.
> > > >
> > > > So let's add the kernel functions needed.
> > > >
> > > > This feature is implemented as a kernel module.
> > > > StMM PTA has TA_FLAG_DEVICE_ENUM_SUPP flag when registered to OP-TEE
> > > > so that this tee_stmm_efi module is probed after tee-supplicant starts,
> > > > since "SetVariable" EFI Runtime Variable Service requires to
> > > > interact with tee-supplicant.
> > > >
> > > > Acked-by: Sumit Garg <sumit.garg@linaro.org>
> > > > Co-developed-by: Ilias Apalodimas <ilias.apalodimas@linaro.org>
> > > > Signed-off-by: Ilias Apalodimas <ilias.apalodimas@linaro.org>
> > > > Signed-off-by: Masahisa Kojima <masahisa.kojima@linaro.org>
> > > > ---
> > > >  drivers/firmware/efi/Kconfig                 |  15 +
> > > >  drivers/firmware/efi/Makefile                |   1 +
> > > >  drivers/firmware/efi/stmm/mm_communication.h | 236 +++++++
> > > >  drivers/firmware/efi/stmm/tee_stmm_efi.c     | 638 +++++++++++++++++++
> > > >  4 files changed, 890 insertions(+)
> > > >  create mode 100644 drivers/firmware/efi/stmm/mm_communication.h
> > > >  create mode 100644 drivers/firmware/efi/stmm/tee_stmm_efi.c
> > > >
> ...
> > >
> > > I think we have a probe ordering issue with this driver:
> > > efivarfs_fill_super() may be called before the TEE bus was probed, thus
> > > with the default efivar ops still registered. And that means
> > > efivar_supports_writes() will return false, and the fs declares itself
> > > as readonly. I've seen systemd mounting it r/o initialling, and you need
> > > to remount the fs to enable writability.
> > >
> > > Is there anything that could be done to re-order things reliably, probe
> > > the tee bus earlier etc.?
> >
> > This driver has a dependency on user-space daemon: tee-supplicant to
> > be running for RPMB access. So once you start that daemon the
> > corresponding device will be enumerated on the TEE bus and this driver
> > probe will be invoked. So I would suggest you to load this daemon very
> > early in the boot process or better to make it a part of initramfs.
> >
>
> That is not the point, really.
>
> If this dependency exists, the code should be aware of that, and made
> to work correctly in spite of it. Requiring a module to be part of
> initramfs is not a reasonable fix.

I am not sure if I followed you here. Until we have the tee-stmm-efi
module loaded we won't get corresponding EFI operations registered.
The key here is that the underlying OP-TEE device won't be available
until tee-supplicant (see enumeration with PTA_CMD_GET_DEVICES_SUPP)
is running.

Do you have any better ideas regarding how this should be handled?

>
> IIUC, this also means that the efivar ops are updated while there is
> already a client. This seems less than ideal as well

That's true. An ideal situation would be to allow in-kernel RPMB
access APIs for OP-TEE or other kernel drivers to use. With that we
should be able to remove this tee-supplicant dependency. I hope you
are already aware about the earlier efforts to add the RPMB subsystem
to the kernel. But with these real world use-cases emerging like EFI
variables and fTPM, we should be able to convince corresponding
subsystem maintainers.

-Sumit
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
