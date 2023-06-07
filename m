Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E166725781
	for <lists+linux-stm32@lfdr.de>; Wed,  7 Jun 2023 10:26:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1CB97C65E70;
	Wed,  7 Jun 2023 08:26:18 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 244A7C65048
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Jun 2023 08:26:17 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-2b1afe57bdfso66229131fa.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 07 Jun 2023 01:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686126376; x=1688718376;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=meqyLpIa2eoOfIkaFe10EGZNXQ4rVkSgK0+HDZ26xns=;
 b=ZF9p5u4hM9PFz+rRCKYlZoTUlbcYIxDgpTVxuZuiVVFOg/LdolKhBWBUAUQKQRa46+
 3DYQkg0hk5CEIO3iWRBEJF4S7DRTfWuXV/UW32si/8CbDvnNN5pQgt/of+kV67Y3jaPP
 rt4eHEz6FN/vj8pIB6s0uXTdAV6eeaIBamyD1Z5PmuVIkcC0r2W8LHJBo5VktSGZM3Am
 3kc67vWS9Ghitg9knI+ULF6FuPOzg1dsiQHth+lH2XdKZSn/a/APkBgq00uutbLXV5Ht
 t1B5ezcUGlevGxUyo6SMZ1jKBThmmMhZn3adfo363b35EgjK9jxhaZlij6GXxsLBwpja
 fhZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686126376; x=1688718376;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=meqyLpIa2eoOfIkaFe10EGZNXQ4rVkSgK0+HDZ26xns=;
 b=YkI9OB6q4bbgzL9FAU6Rcyu7aGGrRWfwt6mfHxr8PUI/vwISzn+Xz2nB8s3IzEzZko
 fTwD8JvnIkRDcKNzr65/XSMQoy+R3eTNdmlV7ASsOd8akhor0s5ESLAb0HAVdMjfbmn2
 jVsZrq/5KUvw6T2rtUbxqoGuaop4v+XS6281U0kpPb+K8iJSc1bS4skE2DtmPwkLrJHp
 YKEQdz0hfA2PSyX8IId4ayzwj67oCsh3O8D5M/ySCooTsISsBQeKiIe9DAS83rc2VCcw
 eucX7sNwo9Kpec8HVqdW4Y7TfIprzhc+eVnTjV1BeT6mwVbzVr10QIsRf7LiNyB9wDLY
 juUg==
X-Gm-Message-State: AC+VfDz+AgOtGIKaNRJAmLxwBHRjGrAOpJlQHW32jnVLjCJqTPO/HQDA
 VcmayItbPVBTGtDVgib4BrcX8xr2L91uxFSdNd8fpw==
X-Google-Smtp-Source: ACHHUZ6rY7hwhROngrX3S6mKYk8pyY2vNRuLKLBfVKmc4MLTyNTLbfrhXuBN2UniToyQLzyYEgTqSFvqaZji+YzCtio=
X-Received: by 2002:a2e:8517:0:b0:2a7:75aa:40c with SMTP id
 j23-20020a2e8517000000b002a775aa040cmr2037906lji.10.1686126376194; Wed, 07
 Jun 2023 01:26:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230526010748.1222-1-masahisa.kojima@linaro.org>
 <20230526010748.1222-4-masahisa.kojima@linaro.org>
 <0d3e0370-eb76-010f-3d30-9acc9b59645c@siemens.com>
 <CAFA6WYPnWJNPvhT2JDkO-qXRUaJoxBGZEvSfhxcRynV7=VSdQA@mail.gmail.com>
 <CAMj1kXFM45PCTU--+CCed6Cq_N5XqDG6tTu6fnQTSCpW2BWA5A@mail.gmail.com>
 <4ff09002-e871-38b9-43ec-227a64bac731@siemens.com>
 <CAC_iWjJJ5E9Q1or5yTiDynzv_WAYH-g+N24aRdu9rvcsbWqnrg@mail.gmail.com>
 <CAFA6WYNFYB1LiOFB_iwTsdD5PmnDdSbtDSH2J4FVFPx3uik8rQ@mail.gmail.com>
In-Reply-To: <CAFA6WYNFYB1LiOFB_iwTsdD5PmnDdSbtDSH2J4FVFPx3uik8rQ@mail.gmail.com>
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Date: Wed, 7 Jun 2023 11:25:40 +0300
Message-ID: <CAC_iWj+E7-XK6dCeSn4205K0O3EZCLxCaC+adu-14ST6sdudfA@mail.gmail.com>
To: Sumit Garg <sumit.garg@linaro.org>
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

Hi Sumit,

On Wed, 7 Jun 2023 at 10:25, Sumit Garg <sumit.garg@linaro.org> wrote:
>
> Hi Ilias,
>
> On Wed, 7 Jun 2023 at 12:05, Ilias Apalodimas
> <ilias.apalodimas@linaro.org> wrote:
> >
> > Hi Jan,
> >
> > [...]
> >
> > > >>>>
> > > > ...
> > > >>>
> > > >>> I think we have a probe ordering issue with this driver:
> > > >>> efivarfs_fill_super() may be called before the TEE bus was probed, thus
> > > >>> with the default efivar ops still registered. And that means
> > > >>> efivar_supports_writes() will return false, and the fs declares itself
> > > >>> as readonly. I've seen systemd mounting it r/o initialling, and you need
> > > >>> to remount the fs to enable writability.
> > > >>>
> > > >>> Is there anything that could be done to re-order things reliably, probe
> > > >>> the tee bus earlier etc.?
> > > >>
> > > >> This driver has a dependency on user-space daemon: tee-supplicant to
> > > >> be running for RPMB access. So once you start that daemon the
> > > >> corresponding device will be enumerated on the TEE bus and this driver
> > > >> probe will be invoked. So I would suggest you to load this daemon very
> > > >> early in the boot process or better to make it a part of initramfs.
> > > >>
> > > >
> > > > That is not the point, really.
> > > >
> > > > If this dependency exists, the code should be aware of that, and made
> > > > to work correctly in spite of it. Requiring a module to be part of
> > > > initramfs is not a reasonable fix.
> > >
> > > In fact, I've tested a non-modularized build as well, just to exclude
> > > that issue. The daemon dependency is more likely the problem here.
> > >
> > > >
> > > > IIUC, this also means that the efivar ops are updated while there is
> > > > already a client. This seems less than ideal as well
> >
> > As Sumit pointed out, the 'device' won't be available from OP-TEE
> > until the supplicant is up and running and as a result, the module
> > _probe() function won't run.  Unfortunately, this isn't something we
> > can avoid since the supplicant is responsible for the RPMB writes.
> > The only thing I can think of is moving parts of the supplicant to the
> > kernel and wiring up the RPC calls for reading/writing data to the
> > eMMC subsystem.  There was another discussion here [0] requesting the
> > same thing for different reasons. But unless I am missing something
> > this won't solve the problem completely either.  You still have a
> > timing dependency of "when did the RT callbacks change" -- "when was
> > my efivarfs mounted".
>
> With the RPMB writes wired through the kernel [1], the only dependency
> left is when do you load the tee-stmm-efi driver to have real EFI
> runtime variables support. IMO, tee-stmm-efi driver should be built-in
> to support systems without initramfs. The distro installers may choose
> to bundle it in initramfs. Do you still see a timing dependency with
> this approach?

No I don't, this will work reliably without the need to remount the efivarfs.
As you point out you will still have this dependency if you end up
building them as modules and you manage to mount the efivarfs before
those get inserted.  Does anyone see a reasonable workaround?
Deceiving the kernel and making the bootloader set the RT property bit
to force the filesystem being mounted as rw is a nasty hack that we
should avoid.  Maybe adding a kernel command line parameter that says
"Ignore the RTPROP I know what I am doing"?  I don't particularly love
this either, but it's not unreasonable.

Thanks
/Ilias
>
> [1] Of Course here we need the eMMC and TEE/OPTEE drivers to be built-in too.
>
> -Sumit
>
> >
> > Thanks
> > /Ilias
> > >
> > > Jan
> > >
> > > --
> > > Siemens AG, Technology
> > > Competence Center Embedded Linux
> > >
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
