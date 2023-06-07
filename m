Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A2D725588
	for <lists+linux-stm32@lfdr.de>; Wed,  7 Jun 2023 09:25:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3FD08C65E70;
	Wed,  7 Jun 2023 07:25:33 +0000 (UTC)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com
 [209.85.217.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 94F6DC65048
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Jun 2023 07:25:31 +0000 (UTC)
Received: by mail-vs1-f45.google.com with SMTP id
 ada2fe7eead31-43b1cee7e65so1479049137.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 07 Jun 2023 00:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686122730; x=1688714730;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZbZsMTtgivDoJEuH3IaNChHHrvk2Q0PtcwAfQDF1PA8=;
 b=P+xL9+U37Z+N4Mg9/jK1h93OPPuF7gNd5e682jUXmulyGnYN7E2Lt1E0pV3vImjW6i
 E+JGjPeeSkHP8lHcNLCr8FpcXhdFn63NHO3RRD9Uw58Rm8TX3nWeC0ypMRI7EQkHmcKg
 kskP06M+dRD2l41gqVSq+ToUSy/qs/4jcme5Kw6bZbXm4ViBSiUP7+mcI667Q7ddZ3GF
 h8Www7jgcJBNIIFrnpj8wOAzwHTqfKbAT+KMDzQjHnmfEzFOHVwF/QwwEjPzhHBoskeW
 sshaKLWse0H+qPYbgIuRvS35+lpdvSzaAvxWmeStc+QJFjSiUQE8AViznEohsbl1zNBc
 Tlxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686122730; x=1688714730;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZbZsMTtgivDoJEuH3IaNChHHrvk2Q0PtcwAfQDF1PA8=;
 b=I1aU/E8XSApPb2SPLihxA2NROUge5i5N/IlOzq0ohX6DcNFrGDk//h2dMh44B73b3u
 7aJ+B8d8z4UFNAzC7BOvdGLcKuX3lYqgZ2NhOiVaiQATuyxExvN5cXKPmRB2EZ2dEIq2
 q8PF/m0dJi6B5EchtwgRMq2baEnd1ErNfNCra5PJ/l5YYdsFpjqFnARTXfQIYGFHh5bh
 t+Fv3ooXs/YtCi87O9G6YkIVPHx/ET7gjQ0VYUtHgKq4449U+8wRXsAz17ik5iJmx4sI
 lqwvjp4xDFL4QRtT2rJFR10DE7AlcjtZDkPvEYDz0PUcO7GfATatxusaYjwcmmc75jp8
 eBCQ==
X-Gm-Message-State: AC+VfDyU6jVYpRVIa4pd1vc0wQsF+d4Z6FuKQduOeHBc1duD0mHlo8K5
 r33y7g8fBebcdQXv+F7Fv/Z2GSWU67RRSz/NK/owLg==
X-Google-Smtp-Source: ACHHUZ7lv+GHV6l5ITHPctjVPOJkZIdheJ4gOyp3YHUlRvjuZo0mxUxrjHyb3hadANufXU4xhlBUxp357jZhrj1AJB0=
X-Received: by 2002:a67:bd09:0:b0:426:b2d8:17e9 with SMTP id
 y9-20020a67bd09000000b00426b2d817e9mr634816vsq.20.1686122730438; Wed, 07 Jun
 2023 00:25:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230526010748.1222-1-masahisa.kojima@linaro.org>
 <20230526010748.1222-4-masahisa.kojima@linaro.org>
 <0d3e0370-eb76-010f-3d30-9acc9b59645c@siemens.com>
 <CAFA6WYPnWJNPvhT2JDkO-qXRUaJoxBGZEvSfhxcRynV7=VSdQA@mail.gmail.com>
 <CAMj1kXFM45PCTU--+CCed6Cq_N5XqDG6tTu6fnQTSCpW2BWA5A@mail.gmail.com>
 <4ff09002-e871-38b9-43ec-227a64bac731@siemens.com>
 <CAC_iWjJJ5E9Q1or5yTiDynzv_WAYH-g+N24aRdu9rvcsbWqnrg@mail.gmail.com>
In-Reply-To: <CAC_iWjJJ5E9Q1or5yTiDynzv_WAYH-g+N24aRdu9rvcsbWqnrg@mail.gmail.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Wed, 7 Jun 2023 12:55:19 +0530
Message-ID: <CAFA6WYNFYB1LiOFB_iwTsdD5PmnDdSbtDSH2J4FVFPx3uik8rQ@mail.gmail.com>
To: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Cc: linux-efi@vger.kernel.org, Jan Kiszka <jan.kiszka@siemens.com>,
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

Hi Ilias,

On Wed, 7 Jun 2023 at 12:05, Ilias Apalodimas
<ilias.apalodimas@linaro.org> wrote:
>
> Hi Jan,
>
> [...]
>
> > >>>>
> > > ...
> > >>>
> > >>> I think we have a probe ordering issue with this driver:
> > >>> efivarfs_fill_super() may be called before the TEE bus was probed, thus
> > >>> with the default efivar ops still registered. And that means
> > >>> efivar_supports_writes() will return false, and the fs declares itself
> > >>> as readonly. I've seen systemd mounting it r/o initialling, and you need
> > >>> to remount the fs to enable writability.
> > >>>
> > >>> Is there anything that could be done to re-order things reliably, probe
> > >>> the tee bus earlier etc.?
> > >>
> > >> This driver has a dependency on user-space daemon: tee-supplicant to
> > >> be running for RPMB access. So once you start that daemon the
> > >> corresponding device will be enumerated on the TEE bus and this driver
> > >> probe will be invoked. So I would suggest you to load this daemon very
> > >> early in the boot process or better to make it a part of initramfs.
> > >>
> > >
> > > That is not the point, really.
> > >
> > > If this dependency exists, the code should be aware of that, and made
> > > to work correctly in spite of it. Requiring a module to be part of
> > > initramfs is not a reasonable fix.
> >
> > In fact, I've tested a non-modularized build as well, just to exclude
> > that issue. The daemon dependency is more likely the problem here.
> >
> > >
> > > IIUC, this also means that the efivar ops are updated while there is
> > > already a client. This seems less than ideal as well
>
> As Sumit pointed out, the 'device' won't be available from OP-TEE
> until the supplicant is up and running and as a result, the module
> _probe() function won't run.  Unfortunately, this isn't something we
> can avoid since the supplicant is responsible for the RPMB writes.
> The only thing I can think of is moving parts of the supplicant to the
> kernel and wiring up the RPC calls for reading/writing data to the
> eMMC subsystem.  There was another discussion here [0] requesting the
> same thing for different reasons. But unless I am missing something
> this won't solve the problem completely either.  You still have a
> timing dependency of "when did the RT callbacks change" -- "when was
> my efivarfs mounted".

With the RPMB writes wired through the kernel [1], the only dependency
left is when do you load the tee-stmm-efi driver to have real EFI
runtime variables support. IMO, tee-stmm-efi driver should be built-in
to support systems without initramfs. The distro installers may choose
to bundle it in initramfs. Do you still see a timing dependency with
this approach?

[1] Of Course here we need the eMMC and TEE/OPTEE drivers to be built-in too.

-Sumit

>
> Thanks
> /Ilias
> >
> > Jan
> >
> > --
> > Siemens AG, Technology
> > Competence Center Embedded Linux
> >
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
