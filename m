Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 904A03FB724
	for <lists+linux-stm32@lfdr.de>; Mon, 30 Aug 2021 15:44:17 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 38DD5C597AD;
	Mon, 30 Aug 2021 13:44:17 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 40E86C57B51
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Aug 2021 13:44:15 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id c12so26025129ljr.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Aug 2021 06:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kOYXhGaqQ6MRJEfF+E0ER+xBLRcBgZV7cWZXRVeFtj4=;
 b=oSzgQNH2PwxCqBTmQ00Scj9XVNl4PjTfZ++xtN2IEitrBIFKHRNOL0Nw67BOqqLDXc
 ActdqjZTwLU+LZHafZglw2/Ka0Otxu1mSTzy+f7Iy3+t336Rl1FhjMz2TVigE0AiEfMe
 sJwAOqAQwp9MrtcdCua2tE/O2fbPeJIJfuZ5yIh6gTpYFU8ZYLHM96NUBCjy6ffwMpVb
 uT2td0pEGA0MAXd9lc/rMbDlvrPemi+GAcO1VH4u67DOlWf4posmy4rjN9xZEewHg12T
 9cfnXrYjqrFceBAQli3kRcG6SJrpB64dhbVykWoa0BUH1uuNw3Xod+WsHj2D6vQZ4dTs
 W+jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kOYXhGaqQ6MRJEfF+E0ER+xBLRcBgZV7cWZXRVeFtj4=;
 b=KLKG7waZV7IToP9wjrHn9yz4awW446xOTP+O/4DCTCzpoxbmK1oqQJIjbHkoBr8/5j
 0ku3n3XXrX5P3J7labFnIopfISbzlLnXBQPf+8jgQFwiDVy8h6RYzfkexFWKeQgXobkX
 Vrkd2czQj1P5kAcz+o/yl5AgHWb/hyK7/ZK4RHhmqlxpGQpMwE0da/4Lt39R8mE09W4H
 CeNx2Yh1vNyw4BgFrgAc3CMM7gWSNx8pWc3WHo7qQPNKFa2BhiYvrI6+VzZ70ZiX4Z8a
 0nUj7l0MVU0/YGAVHqbdXxN+ovPzCptUOQzJaEN6RzNvoFz/o4hJ3uQVZ2EXJlXNlN8O
 pB7w==
X-Gm-Message-State: AOAM530ZuMYQJnI67IlTH9465FpSvlur9vxQ+OPCifO6JT6+eNux5uV6
 F9Qrc2O55BnO3GvU+Kb5JKppa48bBW99JgbJrLDGrg==
X-Google-Smtp-Source: ABdhPJzSbjrfR6nWoj1MvF5PjDjLKW0SfuR+5h1BG6O5DQ4hi8nvSRGwK/6dSx4oy0x4iF+t9nGT3L28hehyyLhGsjQ=
X-Received: by 2002:a2e:bd09:: with SMTP id n9mr20595594ljq.76.1630331054549; 
 Mon, 30 Aug 2021 06:44:14 -0700 (PDT)
MIME-Version: 1.0
References: <ccb2dad1-c8c1-9f19-92c4-7faf2b787e6d@foss.st.com>
In-Reply-To: <ccb2dad1-c8c1-9f19-92c4-7faf2b787e6d@foss.st.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 30 Aug 2021 15:43:38 +0200
Message-ID: <CAPDyKFqMJmJRLNYF=gWvAEH8wtJzrxrZ9KLz62t4XNsD84vr=Q@mail.gmail.com>
To: Yann Gautier <yann.gautier@foss.st.com>
Cc: DTML <devicetree@vger.kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Russell King <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] Question about MMC_PM_KEEP_POWER in MMCI driver
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

On Wed, 25 Aug 2021 at 16:34, Yann Gautier <yann.gautier@foss.st.com> wrote:
>
> Hi,
>
> In drivers/mmc/host/mmci.c, MMC_PM_KEEP_POWER is unconditionally enabled.
> This prevents correct low-power sequence on STM32MP157C-DK2 board which
> embeds a Wifi chip brcm,bcm4329-fmac (this wifi part has not yet been
> sent upstream).

Exactly why doesn't this work with the STM32MP157C-DK2 board?

>
> This MMC_PM_KEEP_POWER can be taken from DT with the property
> keep-power-in-suspend. This is what is done for other MMC drivers.

The DT property is what should have been used for mmci as well.

>
> I wonder what should be the best solution for this.
>
> 1) Remove MMC_PM_KEEP_POWER from the driver, and modify all SoC device
> tree files embedding a arm,pl18x with adding keep-power-in-suspend;
> property (except stm32mp151.dtsi file).
> This can be easy to do (~10 files to modify). But that could be more
> board dependent, if an SDIO chip is plugged on this MMC IP.
> And the name keep-power-in-suspend can be misleading as it only applies
> to SDIO.
>
> 2) Remove MMC_PM_KEEP_POWER from the driver, and modify board DT files
> with the property. This could be a difficult task to find all those
> boards. And this should be applied only for SDIO configs.
>
> 3) Just modify the driver to apply this capability for all MMCI chips
> but STM32. This could be done in the dedicated file, in
> sdmmc_variant_init() function. But some boards based on STM32MP15 chip
> might want to keep this capability.

I would suggest option 3).

As a matter of fact, we also allow MMC_PM_KEEP_POWER to become set
when parsing the DTB via calling mmc_of_parse(). So just changing the
default value (don't set MMC_PM_KEEP_POWER) for the stm32 variant,
would do the trick I think.

Kind regards
Uffe
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
