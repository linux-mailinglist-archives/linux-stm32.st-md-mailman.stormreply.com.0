Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2314472545E
	for <lists+linux-stm32@lfdr.de>; Wed,  7 Jun 2023 08:36:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DD4FEC6905A;
	Wed,  7 Jun 2023 06:35:59 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 68B7BC65048
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Jun 2023 06:35:58 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-2b1adf27823so66301341fa.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 06 Jun 2023 23:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686119758; x=1688711758;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=6EFrOABaDLpt7VYlTUqL5NsJz5X4d5SpsRmR/+h4/eU=;
 b=zrmWamvQ3NIx3kxQvmqEpNBeEnJAHQDUu/bZmuRldmyopAs7kcnSeLHNBrfMgs/DUf
 LwvpEhjtVbMAC914DwVypWF0zQRTS61IThhfy5X5jdVAR2RW0hofwanKWuI4YB/WS70x
 qkcxSl/G/TwpnvHZOaZEUFwk57mkb6YyQoykP59tiGCLEh8FW67mwzCe1ObItq9Old0O
 vOp30KmxVKJWFt0vEU4bFHcomlqfau0R2V4/WkKEpRJT2gSyEZqPrwhU0q9GDHTbUAsh
 8khzqmfVHqMz8EuRkkVIrwmMYYQs3vppRPChSv7KPSGfKu9HjpOFFHwXhL03K0AavwJe
 y+ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686119758; x=1688711758;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6EFrOABaDLpt7VYlTUqL5NsJz5X4d5SpsRmR/+h4/eU=;
 b=jdqc33PUISeqBqY4hrPnnjWf+BLR/hKW+U6xjrdQXU71l8jIeo8R6wcVx9vpL8jXdF
 2/ZUSs1PnwernWDf8CpBGRjDDLCRG4rDJ+jngzFRhCKVWb/M4TTaL06HojdllOVpMSSY
 VDSirVEdlyC+3gQK3N/Vk7SxAjZz327WwPyOvne2eg50Ro6gL9CZg3fpHcKcAHvRNPxm
 j44EqlTGLjw1SYRWZlpDMDP6HDHAlC/Trr+iUiVoTrTfRaJAoQajiTYuOQIJBU2ly0Ii
 8dCOlqfuNKWi3guUXuiPzPVkxZYT1QNaoFdHfbQMMHS+khhonJS3GUaAr1cpTtFErxpU
 XCQw==
X-Gm-Message-State: AC+VfDzQN6uX+PyYrm36+lwSMNDWMoJLq92EGOGtGiPVKAPDURO/SJqS
 mQfRO9Aa0rDdwHNgjrwMVbHBIukW1NOxQFvubfVfyfZjfWxHLBox4io=
X-Google-Smtp-Source: ACHHUZ50P4GwMwpVy/3E1kfflfT7/u++IWVGt8rvCPVQv9ibu4LaVmw1D0lXhPSu99Kuo+IyTcRTb+mYR4WbUz61hcE=
X-Received: by 2002:a2e:9096:0:b0:2ad:dd7e:6651 with SMTP id
 l22-20020a2e9096000000b002addd7e6651mr2194957ljg.43.1686119757684; Tue, 06
 Jun 2023 23:35:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230526010748.1222-1-masahisa.kojima@linaro.org>
 <20230526010748.1222-4-masahisa.kojima@linaro.org>
 <0d3e0370-eb76-010f-3d30-9acc9b59645c@siemens.com>
 <CAFA6WYPnWJNPvhT2JDkO-qXRUaJoxBGZEvSfhxcRynV7=VSdQA@mail.gmail.com>
 <CAMj1kXFM45PCTU--+CCed6Cq_N5XqDG6tTu6fnQTSCpW2BWA5A@mail.gmail.com>
 <4ff09002-e871-38b9-43ec-227a64bac731@siemens.com>
 <CAC_iWjJJ5E9Q1or5yTiDynzv_WAYH-g+N24aRdu9rvcsbWqnrg@mail.gmail.com>
In-Reply-To: <CAC_iWjJJ5E9Q1or5yTiDynzv_WAYH-g+N24aRdu9rvcsbWqnrg@mail.gmail.com>
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Date: Wed, 7 Jun 2023 09:35:21 +0300
Message-ID: <CAC_iWjLm-2GVOn4QpoLBiCYLM1+zuQHttzEvrpNo1qt9AqXaUQ@mail.gmail.com>
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

On Wed, 7 Jun 2023 at 09:34, Ilias Apalodimas
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
>

Forgot to attach the link... apologies for the noise.
[0] https://lore.kernel.org/all/CAC_iWjLOhUvp5ggCCkHN5MRNfB_h6FZ2Z14yrtR3aqGn0Ovxig@mail.gmail.com/

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
