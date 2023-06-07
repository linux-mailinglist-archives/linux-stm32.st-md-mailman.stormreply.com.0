Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 734EA726402
	for <lists+linux-stm32@lfdr.de>; Wed,  7 Jun 2023 17:18:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EFC7BC6A5E7;
	Wed,  7 Jun 2023 15:18:52 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
 [209.85.219.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C0492C65E58
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Jun 2023 15:18:51 +0000 (UTC)
Received: by mail-qv1-f42.google.com with SMTP id
 6a1803df08f44-6260bb94363so4807136d6.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 07 Jun 2023 08:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686151130; x=1688743130;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=mTsukKw+BIS5VUrX2hZ7HJxEmat0w3WDB9Ehs58lLcs=;
 b=v0JwFjF3phSowDl0fS5dmxunvl8Gs6shwjlrdjCjLHWeHEfCexXx+34/kpgEc33WNb
 rSpSpeSWfD46k1frYJEcDqrMnfp07wcMri9RMpwfn+XB5mmJnJYPYHmcd3NFfAtMlryD
 faKxikZcA6aHNdrRzfCBtEBRdzFB/sGw1G145erEuh2wj67V+trv5+s8mTZJRejq5yrx
 xnhpdVIsfkbPaw+NEszd7QRLR1ujD1o0izxSZmIaORc7sQmc/HxidCWVaa77y+lDUVi1
 szsTZQ0gjktBuy5t39kZIebzTcEYOu2UKui2NpecWUqfc9X54Tfskjtom++ivPCOV60Z
 EX/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686151130; x=1688743130;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mTsukKw+BIS5VUrX2hZ7HJxEmat0w3WDB9Ehs58lLcs=;
 b=k1ins8VZN+Ai/eRe/AQ+XLY25MDG+lhqyPR8aNhHPk3V57hcyICFNalV+453Awd9Tb
 /5+vx2ReTD7qJZYiEx4JRsWJjEQ8Je/3bDGu//Nrw79m/eo1keghIk+npZKKaQHj/8L3
 JJJJuN0I8X1Ljf2vsEcGckv0oMiPSsiKVUkx6hQvv2/xqCwO93icFRC7gT+CMEJg3yJA
 eWGOfgkPYlHY+OZrceoEx2ZP76cm9jrlOHUUjj0WC4pR9uB5DrYlW1PMqo80yN8kdaoF
 DW317PWHvd6Hw3ZdVi2km7dnQ+6dsDphZxTNi+SXo5WWwhy5YkaWIAMu1kNLifNIugUd
 kAag==
X-Gm-Message-State: AC+VfDwvOg8/SwCK04OweSd6KNprUFcSTkg/cLP/1vM6S3nR7pLewSJs
 nJrN1XftjjcB2GUIgVpPoAJdInmCPBfqzdWWfY1eKQ==
X-Google-Smtp-Source: ACHHUZ7+xiReE2OVgwmqBeLUBU6ivvu05+bPglG1UtVJBcEijza5e+I8Q88yQ4qyEMWcCUl/HPxf7/2efC/JIbcQY6c=
X-Received: by 2002:ad4:5bc4:0:b0:625:aa49:ea0a with SMTP id
 t4-20020ad45bc4000000b00625aa49ea0amr3393123qvt.29.1686151130576; Wed, 07 Jun
 2023 08:18:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230526010748.1222-1-masahisa.kojima@linaro.org>
 <20230526010748.1222-4-masahisa.kojima@linaro.org>
 <0d3e0370-eb76-010f-3d30-9acc9b59645c@siemens.com>
 <CAFA6WYPnWJNPvhT2JDkO-qXRUaJoxBGZEvSfhxcRynV7=VSdQA@mail.gmail.com>
 <CAMj1kXFM45PCTU--+CCed6Cq_N5XqDG6tTu6fnQTSCpW2BWA5A@mail.gmail.com>
 <4ff09002-e871-38b9-43ec-227a64bac731@siemens.com>
 <CAC_iWjJJ5E9Q1or5yTiDynzv_WAYH-g+N24aRdu9rvcsbWqnrg@mail.gmail.com>
 <CAFA6WYNFYB1LiOFB_iwTsdD5PmnDdSbtDSH2J4FVFPx3uik8rQ@mail.gmail.com>
 <CAC_iWj+E7-XK6dCeSn4205K0O3EZCLxCaC+adu-14ST6sdudfA@mail.gmail.com>
 <76da826f-b608-6add-5401-6de818b180e3@siemens.com>
In-Reply-To: <76da826f-b608-6add-5401-6de818b180e3@siemens.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Wed, 7 Jun 2023 20:48:38 +0530
Message-ID: <CAFA6WYPCDRjFzsUMU=SNzEt88nT7Fcm1eOFL8z4HiQO+=2JeVA@mail.gmail.com>
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: linux-efi@vger.kernel.org, Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Jens Wiklander <jens.wiklander@linaro.org>, op-tee@lists.trustedfirmware.org,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, "Su,
 Bao Cheng \(RC-CN DF FA R&D\)" <baocheng.su@siemens.com>,
 Masahisa Kojima <masahisa.kojima@linaro.org>, Ard Biesheuvel <ardb@kernel.org>,
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

On Wed, 7 Jun 2023 at 18:10, Jan Kiszka <jan.kiszka@siemens.com> wrote:
>
> On 07.06.23 10:25, Ilias Apalodimas wrote:
> > Hi Sumit,
> >
> > On Wed, 7 Jun 2023 at 10:25, Sumit Garg <sumit.garg@linaro.org> wrote:
> >>
> >> Hi Ilias,
> >>
> >> On Wed, 7 Jun 2023 at 12:05, Ilias Apalodimas
> >> <ilias.apalodimas@linaro.org> wrote:
> >>>
> >>> Hi Jan,
> >>>
> >>> [...]
> >>>
> >>>>>>>>
> >>>>> ...
> >>>>>>>
> >>>>>>> I think we have a probe ordering issue with this driver:
> >>>>>>> efivarfs_fill_super() may be called before the TEE bus was probed, thus
> >>>>>>> with the default efivar ops still registered. And that means
> >>>>>>> efivar_supports_writes() will return false, and the fs declares itself
> >>>>>>> as readonly. I've seen systemd mounting it r/o initialling, and you need
> >>>>>>> to remount the fs to enable writability.
> >>>>>>>
> >>>>>>> Is there anything that could be done to re-order things reliably, probe
> >>>>>>> the tee bus earlier etc.?
> >>>>>>
> >>>>>> This driver has a dependency on user-space daemon: tee-supplicant to
> >>>>>> be running for RPMB access. So once you start that daemon the
> >>>>>> corresponding device will be enumerated on the TEE bus and this driver
> >>>>>> probe will be invoked. So I would suggest you to load this daemon very
> >>>>>> early in the boot process or better to make it a part of initramfs.
> >>>>>>
> >>>>>
> >>>>> That is not the point, really.
> >>>>>
> >>>>> If this dependency exists, the code should be aware of that, and made
> >>>>> to work correctly in spite of it. Requiring a module to be part of
> >>>>> initramfs is not a reasonable fix.
> >>>>
> >>>> In fact, I've tested a non-modularized build as well, just to exclude
> >>>> that issue. The daemon dependency is more likely the problem here.
> >>>>
> >>>>>
> >>>>> IIUC, this also means that the efivar ops are updated while there is
> >>>>> already a client. This seems less than ideal as well
> >>>
> >>> As Sumit pointed out, the 'device' won't be available from OP-TEE
> >>> until the supplicant is up and running and as a result, the module
> >>> _probe() function won't run.  Unfortunately, this isn't something we
> >>> can avoid since the supplicant is responsible for the RPMB writes.
> >>> The only thing I can think of is moving parts of the supplicant to the
> >>> kernel and wiring up the RPC calls for reading/writing data to the
> >>> eMMC subsystem.  There was another discussion here [0] requesting the
> >>> same thing for different reasons. But unless I am missing something
> >>> this won't solve the problem completely either.  You still have a
> >>> timing dependency of "when did the RT callbacks change" -- "when was
> >>> my efivarfs mounted".
> >>
> >> With the RPMB writes wired through the kernel [1], the only dependency
> >> left is when do you load the tee-stmm-efi driver to have real EFI
> >> runtime variables support. IMO, tee-stmm-efi driver should be built-in
> >> to support systems without initramfs. The distro installers may choose
> >> to bundle it in initramfs. Do you still see a timing dependency with
> >> this approach?
> >
> > No I don't, this will work reliably without the need to remount the efivarfs.
> > As you point out you will still have this dependency if you end up
> > building them as modules and you manage to mount the efivarfs before
> > those get inserted.  Does anyone see a reasonable workaround?
> > Deceiving the kernel and making the bootloader set the RT property bit
> > to force the filesystem being mounted as rw is a nasty hack that we
> > should avoid.  Maybe adding a kernel command line parameter that says
> > "Ignore the RTPROP I know what I am doing"?  I don't particularly love
> > this either, but it's not unreasonable.
>
> In the context of https://github.com/OP-TEE/optee_os/issues/6094,
> basically this issue mapped on reboot/shutdown, I would really love to
> see the unhandy tee-supplicant daemon to be overcome.

I have seen this error before and it has been on my todo list. So I
have tried to fix it here [1]. Feel free to test it and let me know if
you see any further issues.

[1] https://lkml.org/lkml/2023/6/7/927

-Sumit

>
> Jan
>
> --
> Siemens AG, Technology
> Competence Center Embedded Linux
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
