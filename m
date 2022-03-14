Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7249D4D857E
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Mar 2022 13:54:35 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 26C6FC60462;
	Mon, 14 Mar 2022 12:54:35 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6E3FEC01577
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Mar 2022 12:54:33 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id bu29so27059620lfb.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Mar 2022 05:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SJW5UzXbWqblOUIDOicmN3LCNPHApo6s3xMdWkut47A=;
 b=XMzW+JSZ/fOOTze1SbOH4fs8ltfFQsUvsARJL3EyIkyDg8omzyfZGOhGzbEj+a9iO5
 PhX7VG4KqO2ut7qupCR4Z8fEluknej6DQQ7nG5bSEKi2yBU0i5Bp/A0OwkcqchTE4v3x
 W384QP+k37FfUJqodGEnUHJhARJXnS27uEs6F9L0CqhllCj7Cmpat2UXbNK3mEGb+UsK
 oTE1NcRtfpm0MofmOukzlyHuLBRPT5Z2oyIUuKtBYsNVenBj86zREBTjBbK/PpNLcMgq
 2UblPO09w6zgdBqzKAsD731b4OIStx4+F4IBsTCWCpGIEyjCQw6WB5JsaxXvJU9Jkbxd
 xMWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SJW5UzXbWqblOUIDOicmN3LCNPHApo6s3xMdWkut47A=;
 b=IGSiekK7P3UWzb3sewW/WdNj+QPMg5STPIYVARIFZ5OHRcy6tmoZ6bGQXhrGk0by3f
 XJB+s7+4H9Cy/MyiCBRdRraAtRBcth5tiWD4+CzQXE+nkyFOLMyzjOEeLVv4KZ0DNZuh
 J2ZkPxG85zWXPFj6YyOGqnkiH2hwyM/prcepbHZFgVE6oQRtMZBg5nV5JOMcVil7cqMW
 jd57YkmOBdAK37hRZq2Kgt7F1OY/3FjQ7nRiBR8jUD2jA2Ft6EkYixFmbdszH+7zU2Lq
 ehftNcJXipG7zTOhKbdlEibHEBu+tVtH5KV0DnPXf+qWjZ3EnV0QRV5zI+JDXt9+IaZC
 C7kQ==
X-Gm-Message-State: AOAM5318TF2E/BECoDTac4Ys7yZRLoMz1KqLNh3OXTtBtM6FkHMF2l8b
 gdFrbDf+OIO8oLykJUk8LOZA7GuzAWzouHaVfztYLQ==
X-Google-Smtp-Source: ABdhPJxTOfHPAHyXeeT/OyllRH9kctADfXCNVznhH0Yy4OslxqRxOaFJxK3S5H+TSovNZQcnxfBiBNV+ZNeuBn2YiIE=
X-Received: by 2002:ac2:5f0b:0:b0:448:1e32:4531 with SMTP id
 11-20020ac25f0b000000b004481e324531mr13160298lfq.167.1647262472696; Mon, 14
 Mar 2022 05:54:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220314095225.53563-1-yann.gautier@foss.st.com>
 <CAPDyKFqObiC2fwZJ_0JArbVhnFZHV6bA0XJg0diwPgmRx1Bntg@mail.gmail.com>
 <cfeeaa0e-7d52-9267-d46f-62eb91363b60@foss.st.com>
In-Reply-To: <cfeeaa0e-7d52-9267-d46f-62eb91363b60@foss.st.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 14 Mar 2022 13:53:56 +0100
Message-ID: <CAPDyKFr86QyN1sAaYR1WhfnNg2S6j2sr5dr=bn9L69r-QfXw7w@mail.gmail.com>
To: Yann Gautier <yann.gautier@foss.st.com>
Cc: Ludovic Barre <ludovic.barre@foss.st.com>, Marek Vasut <marex@denx.de>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Grzegorz Szymaszek <gszymaszek@short.pl>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
 kernel@dh-electronics.com, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH RESEND] mmc: mmci: manage
	MMC_PM_KEEP_POWER per variant config
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

On Mon, 14 Mar 2022 at 13:20, Yann Gautier <yann.gautier@foss.st.com> wrote:
>
> On 3/14/22 12:17, Ulf Hansson wrote:
> > On Mon, 14 Mar 2022 at 10:53, Yann Gautier <yann.gautier@foss.st.com> wrote:
> >>
> >> Add a disable_keep_power field in variant_data struct. The
> >> MMC_PM_KEEP_POWER flag will be enabled if disable_keep_power is not set.
> >> It is only set to true for stm32_sdmmc variants.
> >>
> >> The issue was seen on STM32MP157C-DK2 board, which embeds a wifi chip.
> >> It doesn't correctly support low power, and we need to unbind the wifi
> >> driver before a suspend sequence. But the wifi chip firmware is then
> >> lost, and the communication with SDIO fails if MMC_PM_KEEP_POWER is
> >> enabled.
> >
> > So the platform supports to maintain the power for the embedded wifi
> > chip during system suspend, but the SDIO func driver (for the WiFi
> > chip) doesn't implement its part correctly. Did I get that right?
> >
> > In that case, it sounds to me like we should try to fix the support
> > for power management in the SDIO func driver instead, no?
> > I am happy to help with guidance/review if that is needed. What SDIO
> > func driver is this about?
> >
> > Kind regards
> > Uffe
> >
>
> Hi Ulf,
>
> I blindly pushed the patch without rechecking it.
> I rephrased it in our downstream to better explain the issue:
>
> The issue was seen on STM32MP157C-DK2 board, which embeds a wifi chip.
> It doesn't correctly support low power on this board. The Wifi chip
> awaits an always-on regulator, but it was connected to v3v3 which is off
> in low-power sequence. MMC_PM_KEEP_POWER should then be disabled.
>
> If it's OK for you, I'll resend the patch with the updated commit message.

Yes, that works fine for me!

[...]

Kind regards
Uffe
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
