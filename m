Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D1A47C055
	for <lists+linux-stm32@lfdr.de>; Tue, 21 Dec 2021 14:03:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EAD80C5E2D4;
	Tue, 21 Dec 2021 13:03:29 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7D98DC5E2C3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Dec 2021 13:03:28 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id by39so2504979ljb.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Dec 2021 05:03:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3G/BObKbKRIOe1mMzk7sCK8sxyQHVHo40L2JB+EWsAY=;
 b=czHS4kyyDyP20l0ewMvyj7YQnV76B0bch+ifwRYOwFFH+D9RrbHcJRnYeyfJ1JK/1q
 1kvZUABK7/gF69M1nreEGgeibF4k/xOCrhFJBNZQyIjPoZc025SQ3N3q3keu2QodgjTJ
 9/c5iQaxtt9wL2Y0ettvMx8epmUbtlcxKIqbWiY14LcHsba1/kvooGmrRqkBTia7ktTu
 TLujjCn4fW+eIX1LVNCiS3zIhXhQfuOIMg+F481Wt+BkT3G1Aw8RU8jyXn+pXFEARea5
 Nj223ib9MDvjpoHq/y7l327QVGlNPvNZuo5xQArtarsdv2iYgIBXJw2QQOZTN+tgLjQU
 sLtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3G/BObKbKRIOe1mMzk7sCK8sxyQHVHo40L2JB+EWsAY=;
 b=0LIfn8VO/R0h//+aOSfuSyNuYG5V/qQN0C7ZLiBZkBUp83lWgAOFwUyFSnczmkRFRG
 qF9ySk4hmJ+FC0+H2+NUb5rQLPNEX4MSKmA/p7r7Ydy+EwL4LhKUTAUmU2ZGvGfboplT
 5y242u2f0Bk/kciqIoC8pxUPfKRvAoR4CTQPn6nfIjU7Qrsu+C5I+wrXYw+eL909hcHE
 HvCXgL/0Q8hlTe+PlOLjWIgCDOlt/F31p5AhM7/M95+idKMp4gXeW2o2vt8Yea2uOsLQ
 TaDdlOKA1JybdOMEIEROU9wyy3V2yG8dAz003ANtVB/E5l7bwLg0ajUJpGTCWitK7hbm
 yCgw==
X-Gm-Message-State: AOAM531ojmTab1vm55Pbe+6mQmdU1vGzLTeKsuTL0h++iLrG4DMFGzwl
 tRTcDKNNW+xMwC3R7L7lNRLumQldViMG9TeIIfbjTA==
X-Google-Smtp-Source: ABdhPJwvQP9tqrxLGsc3TuojfLjegR0SCKRBNpS9rqz0smQOxq9ihVHc7XNdA3hS4OBlM91URcuqQ2eoH27g9wEdTeQ=
X-Received: by 2002:a05:651c:1507:: with SMTP id
 e7mr2648216ljf.300.1640091807738; 
 Tue, 21 Dec 2021 05:03:27 -0800 (PST)
MIME-Version: 1.0
References: <20211215141727.4901-1-yann.gautier@foss.st.com>
 <20211215141727.4901-4-yann.gautier@foss.st.com>
 <05ab7b52-190e-048f-3803-7bed51e2b09c@denx.de>
 <67c6d0be-078b-0726-698d-096c5e77b4ab@foss.st.com>
In-Reply-To: <67c6d0be-078b-0726-698d-096c5e77b4ab@foss.st.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 21 Dec 2021 14:02:51 +0100
Message-ID: <CAPDyKFpGoa1QbGgjjaH_pDpqSLky+urE76AuA+vhGnmrb9pggQ@mail.gmail.com>
To: Yann Gautier <yann.gautier@foss.st.com>
Cc: Marek Vasut <marex@denx.de>, Ludovic Barre <ludovic.barre@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-mmc@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, u.kleine-koenig@pengutronix.de,
 Vladimir Zapolskiy <vz@mleia.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 3/4] mmc: mmci: stm32: clear DLYB_CR after
	sending tuning command
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

On Thu, 16 Dec 2021 at 10:49, Yann Gautier <yann.gautier@foss.st.com> wrote:
>
> On 12/16/21 10:13 AM, Marek Vasut wrote:
> > On 12/15/21 15:17, Yann Gautier wrote:
> >> During test campaign, and especially after several unbind/bind sequences,
> >> it has been seen that the SD-card on SDMMC1 thread could freeze.
> >> The freeze always appear on a CMD23 following a CMD19.
> >> Checking SDMMC internal registers shows that the tuning command (CMD19)
> >> has failed.
> >> The freeze is then due to the delay block involved in the tuning
> >> sequence.
> >> To correct this, clear the delay block register DLYB_CR register after
> >> the tuning commands.
> >>
> >> Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
> >> Signed-off-by: Yann Gautier <yann.gautier@foss.st.com>
> >> ---
> >>   drivers/mmc/host/mmci_stm32_sdmmc.c | 2 ++
> >>   1 file changed, 2 insertions(+)
> >>
> >> diff --git a/drivers/mmc/host/mmci_stm32_sdmmc.c
> >> b/drivers/mmc/host/mmci_stm32_sdmmc.c
> >> index fdaa11f92fe6..a75d3dd34d18 100644
> >> --- a/drivers/mmc/host/mmci_stm32_sdmmc.c
> >> +++ b/drivers/mmc/host/mmci_stm32_sdmmc.c
> >> @@ -441,6 +441,8 @@ static int sdmmc_dlyb_phase_tuning(struct
> >> mmci_host *host, u32 opcode)
> >>           return -EINVAL;
> >>       }
> >> +    writel_relaxed(0, dlyb->base + DLYB_CR);
> >> +
> >>       phase = end_of_len - max_len / 2;
> >>       sdmmc_dlyb_set_cfgr(dlyb, dlyb->unit, phase, false);
> >
> > Shouldn't this have a Fixes: tag and be CC stable ?
> > This seems like a bugfix, no ?
>
> Hi Marek,
>
> You're right, I should have added:
> Fixes: 1103f807a3b9 ("mmc: mmci_sdmmc: Add execute tuning with delay block")
>
> Ulf, could you manage that, or should I push a new version?

Patch applied for fixes and by adding a stable tag too, thanks!

Kind regards
Uffe
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
