Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 759722DAE7
	for <lists+linux-stm32@lfdr.de>; Wed, 29 May 2019 12:37:30 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2E2EFC35E09
	for <lists+linux-stm32@lfdr.de>; Wed, 29 May 2019 10:37:30 +0000 (UTC)
Received: from mail-vs1-f68.google.com (mail-vs1-f68.google.com
 [209.85.217.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5084AC35E03
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 May 2019 10:37:29 +0000 (UTC)
Received: by mail-vs1-f68.google.com with SMTP id y6so1436096vsb.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 May 2019 03:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tjnCyAMKOLgkdZookUva/jit8+LoVCiTGzc0TNGq/oA=;
 b=wOZ28q0Dbsa83UgZEqBAyC7OuWb0kt0Le7tZXn7K4Cvh6Qd+xStSW7Yy8L8potaaWt
 vCbmGvPV8IcOQ/DvUiQ+adosG5dqCgOU0cxAlWaHwgdAWEQOwpa7mZd3r2dQfTTa/2Xp
 xfPvIdlyNqkUFyFUY7m71UUGC1xzQFWh/BD7nQZZSeEY2xfK/LMN48ajDbNJGFbWO1VN
 bLgEW84wPlSshhv5X9kGiTUuNdGdVICyMUMKraO5xgLstqh0aOGGWLQgBSCCB89yzogY
 Q9AQwpTs7/7RAYNEQnseubioA2ZJ7re36Nw2eitt4gpv7aqrecWSSXkKxIZOQg4hewD7
 y3bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tjnCyAMKOLgkdZookUva/jit8+LoVCiTGzc0TNGq/oA=;
 b=iU2J4ebPjZnRJiLacxTHPualx6SIMDHJsPf8xylEopIW0nOFR75hBkUfnsyfYKSfhU
 tvEtLgyrPTEagXJHjVW1xtTuO15Cac16YUQcXHS6l+XFv32vEw4dwVwL/QqAkXxI29i6
 MPu4MqyTIal7uPoYqhtvloXESZzjhgVUEKnfjMg27qt0ELrQJ6IWgn3GUvxrW7VILhOa
 +QYxob9l06cRPhL2LZlFZYsWFa7lRCE9uk+YlpXg9fITimEMyaecGcnWtqBB2KuVFbnj
 2zPV1ut3X/JB5JyF1ipgTmEWNz4ziuGUufm8F4xGTtqoHLtdEEhZp8BcC6aFfZXygC+U
 9iZQ==
X-Gm-Message-State: APjAAAWhgPgWZB/bTAG6kXSjWdDgyHfcBL04hMuaOffoyJpV9NVCzPPo
 mAdYcA3nymW5mFskPcntT3B4vHNMDlyYHBR9/gI9nQ==
X-Google-Smtp-Source: APXvYqx8zt/2mUaOcclrGUfqtNcoqVnj8CT/3HypSvAAWyzH7F3cDGM/H+pIvoe/h4PMDjOkbfsFLwZh6e2SC0ttcNo=
X-Received: by 2002:a67:fa51:: with SMTP id j17mr38251200vsq.89.1559126247816; 
 Wed, 29 May 2019 03:37:27 -0700 (PDT)
MIME-Version: 1.0
References: <1556264798-18540-1-git-send-email-ludovic.Barre@st.com>
 <1556264798-18540-4-git-send-email-ludovic.Barre@st.com>
 <CAPDyKFrxp3Y3AudNvkkSRaph2Fe-A-F6Cs0jfy9RUja76GYeiA@mail.gmail.com>
 <a6a74431-50a6-6298-b77d-9d27a77fd6cc@st.com>
In-Reply-To: <a6a74431-50a6-6298-b77d-9d27a77fd6cc@st.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 29 May 2019 12:36:50 +0200
Message-ID: <CAPDyKFqzNy3hDzovSxb6pd37u7SxWqYoJeu9+tf_qDF7gs0euA@mail.gmail.com>
To: Ludovic BARRE <ludovic.barre@st.com>
Cc: DTML <devicetree@vger.kernel.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH V2 3/5] mmc: mmci: fix clear of busy
	detect status
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

On Wed, 29 May 2019 at 11:20, Ludovic BARRE <ludovic.barre@st.com> wrote:
>
> hi Ulf
>
> On 5/27/19 8:17 PM, Ulf Hansson wrote:
> > On Fri, 26 Apr 2019 at 09:46, Ludovic Barre <ludovic.Barre@st.com> wrote:
> >>
> >> From: Ludovic Barre <ludovic.barre@st.com>
> >>
> >> The "busy_detect_flag" is used to read/clear busy value of
> >> mmci status. The "busy_detect_mask" is used to manage busy irq of
> >> mmci mask.
> >> For sdmmc variant, the 2 properties have not the same offset.
> >> To clear the busyd0 status bit, we must add busy detect flag,
> >> the mmci mask is not enough.
> >>
> >> Signed-off-by: Ludovic Barre <ludovic.barre@st.com>
> >
> > Ludovic, again, apologies for the delay.
> >
> >> ---
> >>   drivers/mmc/host/mmci.c | 3 ++-
> >>   1 file changed, 2 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
> >> index a040f54..3cd52e8 100644
> >> --- a/drivers/mmc/host/mmci.c
> >> +++ b/drivers/mmc/host/mmci.c
> >> @@ -1517,7 +1517,8 @@ static irqreturn_t mmci_irq(int irq, void *dev_id)
> >>                   * to make sure that both start and end interrupts are always
> >>                   * cleared one after the other.
> >>                   */
> >> -               status &= readl(host->base + MMCIMASK0);
> >> +               status &= readl(host->base + MMCIMASK0) |
> >> +                       host->variant->busy_detect_flag;
> >
> > I think this is not entirely correct, because it would mean we check
> > for busy even if we haven't unmasked the busy IRQ via the
> > variant->busy_detect_mask.
>
> if the variant is busy_detect false:
>   => no problem because the busy_detect_flag or busy_detect_mask is not
>      defined.

Right.

>
> if variant is busy_detect true:
> the busy handle is split in 3 steps (see mmci_cmd_irq):
> step 1: detection of busy line => unmasked the busy irq end
> step 2: in busy wait => ignore cmd irq while current busy flag is
> enabled.
> step 3: end of busy => clear and mask busy irq
>
> To detect the first step (see mmci_cmd_irq: which unmasks the busy irq)
> we need to know the current busy state. Actually, the status register is
> re-read in mmci_cmd_irq, why not used the status read in mmci_irq and in
> parameter ?

Right, I see your point.

On the other hand, that re-read of the status registers should really
not be needed. Maybe it's a leftover from my initial version of the
code, but in any case we should remove that.

>
> Regards,
> Ludo
>
> >
> > I suggest to store a new bool in the host (call it
> > "busy_detect_unmasked" or whatever makes sense to you), to track
> > whether we have unmasked the busy IRQ or not. Then take this flag into
> > account, before ORing the value of host->variant->busy_detect_flag,
> > according to above.
> >
> >>                  if (host->variant->busy_detect)
> >>                          writel(status & ~host->variant->busy_detect_mask,
> >>                                 host->base + MMCICLEAR);
> >> --
> >> 2.7.4

Kind regards
Uffe
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
