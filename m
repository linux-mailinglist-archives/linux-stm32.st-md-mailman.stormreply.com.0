Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 155F372545C
	for <lists+linux-stm32@lfdr.de>; Wed,  7 Jun 2023 08:35:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BC3B1C65E70;
	Wed,  7 Jun 2023 06:35:03 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 20582C65048
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Jun 2023 06:35:01 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2b1a4250b07so80091361fa.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 06 Jun 2023 23:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686119701; x=1688711701;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=GDLhbIj1h1brePs46a8+9RVwoL3klUcsVNRfX5GYZHU=;
 b=f+4fDFosW9vw+ywjmYnEr0xgmF/taWie23nQww982PJApOEAKYXdl/oqboBfDEL/xJ
 HCyDxeVUOG66QN9GUNGUfqs6vZzkPmU3K8Bs1v7okPvHW197gxdLXBab3To9UiQsl6U1
 FwvLmMB4mjIPN4yxUfhZR3fwZgX6GWKqScUBn28K36UDqtwgyL1KA0OrZYbgZDqM6dDH
 4aSnwdV5uUUxUduonTIj1rOtYhwhQLtCRmpOVwTDrR5TZQdu+Nqc1QczEGi62jrmVMHU
 ecuNlkE2o1HCadiYU000ULSL+DiFiOfBR4grYwxxY0rgAizA1datInUlNvvmya3k5GdI
 W1Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686119701; x=1688711701;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GDLhbIj1h1brePs46a8+9RVwoL3klUcsVNRfX5GYZHU=;
 b=CO5r/Q8fZTcbeOleYqnYW5NuxK9t+UNE56SpeSqv66W8LNqNepFS653t1d6CKF6aUa
 6KXoaTmjVKsfNFphJZrGnoWeyTMxONOnv4NSdHImRX5dh4yagw8ITQitQ2dWfHRzb383
 aSw+zTRvN0+0xt4G09gXysYijy4HsMneGFaLFvKDaoNPMw4vYrzTpYHp1NYlUZEiVHPq
 J/PtK1wthG9bBzNLjDhpAaaL3omrYt/VoUvAxnQHwt260CJSxRZwtA25/J5R/UDpZh94
 qgDmafzUVm2GT/FBawtBEpwcEwrO8sklrJa9CrmUoAOYvMhbTrM08C0Pk5bspzuIDzdM
 fCkw==
X-Gm-Message-State: AC+VfDzP7Vwfbo/8+bel7hm3i1prxLvbjXnAwzRNU2T02twIV2h9GS8Y
 pSVmfUkVeG0/QZZaPGDZi4O86VRkFMmrT2Z3HRa3Uw==
X-Google-Smtp-Source: ACHHUZ4qNZTRuYZfvCX9IX8YM10d8EPKEN5e8MFW2FKTx2mNeEnMkCQbqpMClq9fy9Dfjnp6o+QbK7+ZVYdMDETfezA=
X-Received: by 2002:a05:651c:102b:b0:2a8:adc4:a928 with SMTP id
 w11-20020a05651c102b00b002a8adc4a928mr2042361ljm.18.1686119701151; Tue, 06
 Jun 2023 23:35:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230526010748.1222-1-masahisa.kojima@linaro.org>
 <20230526010748.1222-4-masahisa.kojima@linaro.org>
 <0d3e0370-eb76-010f-3d30-9acc9b59645c@siemens.com>
 <CAFA6WYPnWJNPvhT2JDkO-qXRUaJoxBGZEvSfhxcRynV7=VSdQA@mail.gmail.com>
 <CAMj1kXFM45PCTU--+CCed6Cq_N5XqDG6tTu6fnQTSCpW2BWA5A@mail.gmail.com>
 <4ff09002-e871-38b9-43ec-227a64bac731@siemens.com>
In-Reply-To: <4ff09002-e871-38b9-43ec-227a64bac731@siemens.com>
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Date: Wed, 7 Jun 2023 09:34:25 +0300
Message-ID: <CAC_iWjJJ5E9Q1or5yTiDynzv_WAYH-g+N24aRdu9rvcsbWqnrg@mail.gmail.com>
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Sumit Garg <sumit.garg@linaro.org>, linux-efi@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Ard Biesheuvel <ardb@kernel.org>, op-tee@lists.trustedfirmware.org,
 linux-arm-kernel@lists.infradead.org,
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

Hi Jan,

[...]

> >>>>
> > ...
> >>>
> >>> I think we have a probe ordering issue with this driver:
> >>> efivarfs_fill_super() may be called before the TEE bus was probed, thus
> >>> with the default efivar ops still registered. And that means
> >>> efivar_supports_writes() will return false, and the fs declares itself
> >>> as readonly. I've seen systemd mounting it r/o initialling, and you need
> >>> to remount the fs to enable writability.
> >>>
> >>> Is there anything that could be done to re-order things reliably, probe
> >>> the tee bus earlier etc.?
> >>
> >> This driver has a dependency on user-space daemon: tee-supplicant to
> >> be running for RPMB access. So once you start that daemon the
> >> corresponding device will be enumerated on the TEE bus and this driver
> >> probe will be invoked. So I would suggest you to load this daemon very
> >> early in the boot process or better to make it a part of initramfs.
> >>
> >
> > That is not the point, really.
> >
> > If this dependency exists, the code should be aware of that, and made
> > to work correctly in spite of it. Requiring a module to be part of
> > initramfs is not a reasonable fix.
>
> In fact, I've tested a non-modularized build as well, just to exclude
> that issue. The daemon dependency is more likely the problem here.
>
> >
> > IIUC, this also means that the efivar ops are updated while there is
> > already a client. This seems less than ideal as well

As Sumit pointed out, the 'device' won't be available from OP-TEE
until the supplicant is up and running and as a result, the module
_probe() function won't run.  Unfortunately, this isn't something we
can avoid since the supplicant is responsible for the RPMB writes.
The only thing I can think of is moving parts of the supplicant to the
kernel and wiring up the RPC calls for reading/writing data to the
eMMC subsystem.  There was another discussion here [0] requesting the
same thing for different reasons. But unless I am missing something
this won't solve the problem completely either.  You still have a
timing dependency of "when did the RT callbacks change" -- "when was
my efivarfs mounted".

Thanks
/Ilias
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
