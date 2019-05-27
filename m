Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 314482B9FB
	for <lists+linux-stm32@lfdr.de>; Mon, 27 May 2019 20:17:47 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 81C9DC5F1F9
	for <lists+linux-stm32@lfdr.de>; Mon, 27 May 2019 18:17:46 +0000 (UTC)
Received: from mail-vs1-f68.google.com (mail-vs1-f68.google.com
 [209.85.217.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8FA2EC5F1F7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 May 2019 18:17:43 +0000 (UTC)
Received: by mail-vs1-f68.google.com with SMTP id m1so11108897vsr.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 May 2019 11:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Wk2hdUXANFYl1/k0tGnBJuWme842kQgEugYRrAdMJgU=;
 b=dS4IbOdhgZVSQqWE7W9HLkrZGQvhZ5abk5sQyiNlaHVjv85/1nWeAywC/QDyez/NL5
 z5AsU7MavE++ZEHOw8BPtuFl6Sl4UofmOw2JMe8ShMocnqtby87XNUKx/Ynr/IiV5k4S
 orzYRSZzC7PdIRMNlk5aBCIXPnUpTfvSyJn5JPRMiFhwEko33ECMK7cuh70/+y6un1gJ
 rrPyBdC2KSR4FFZ/fXnMog2IOWRqmbwXXzgLgWBhbyphDpZn+xro+tYx+/W4yNXgHXah
 3/mzTz1Ffet/YgR4K1+Noi+2C8Qr5Gf16oP/oHeUde/Cw3BPJYfSTbmqpKYSPiHHrZ9H
 ELeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Wk2hdUXANFYl1/k0tGnBJuWme842kQgEugYRrAdMJgU=;
 b=Gr0KYimIXn93bPLldAr48q4JsVPSKCZSY7hB338pUHF7tB1TV1cYEluEx9Cskw1d5N
 2Odptpx0JM6WTOJsa8W33Oduy3t9p3tlx0NgaNf4lfW8cGU/NziEKR6gKlNrk7/TqXzJ
 1qkl4daRuH5vsyH6d5vsWHKfVvEOQVVaBIu0ZkWPaY3y1fGugA30fH2D0vjVe1CONcm6
 gE7N3s2xjeW9oY06yHSTFXedoclgz2JWzNRJ4QaLZUWw1w874GvlYkjc4LuMxb25pKrV
 SuXs1TOrcgz1QM9tbhTJrs1yS2Sl4LLvz12ofAET3DchrBOGHnjQ7dvvjpAtuAKAogm7
 LjUw==
X-Gm-Message-State: APjAAAW35NaPEOWR/8wylIy0SsF7LNGQ9FmPuI6+Y2Kf/75Alt23fvzN
 lEByzGUmY3LeFpzICi0y+35/Mpopbf754CL3I9vGug==
X-Google-Smtp-Source: APXvYqzuKcW/79QkdRTF5rt129CfhCTBkDjwdQNIeah8lsnBs26cDYoRW6a2C+MEJfPi6wzVzRHznUMCZcNZHRlI5d8=
X-Received: by 2002:a67:3046:: with SMTP id w67mr51182171vsw.165.1558981062356; 
 Mon, 27 May 2019 11:17:42 -0700 (PDT)
MIME-Version: 1.0
References: <1556264798-18540-1-git-send-email-ludovic.Barre@st.com>
 <1556264798-18540-4-git-send-email-ludovic.Barre@st.com>
In-Reply-To: <1556264798-18540-4-git-send-email-ludovic.Barre@st.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 27 May 2019 20:17:05 +0200
Message-ID: <CAPDyKFrxp3Y3AudNvkkSRaph2Fe-A-F6Cs0jfy9RUja76GYeiA@mail.gmail.com>
To: Ludovic Barre <ludovic.Barre@st.com>
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

On Fri, 26 Apr 2019 at 09:46, Ludovic Barre <ludovic.Barre@st.com> wrote:
>
> From: Ludovic Barre <ludovic.barre@st.com>
>
> The "busy_detect_flag" is used to read/clear busy value of
> mmci status. The "busy_detect_mask" is used to manage busy irq of
> mmci mask.
> For sdmmc variant, the 2 properties have not the same offset.
> To clear the busyd0 status bit, we must add busy detect flag,
> the mmci mask is not enough.
>
> Signed-off-by: Ludovic Barre <ludovic.barre@st.com>

Ludovic, again, apologies for the delay.

> ---
>  drivers/mmc/host/mmci.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
> index a040f54..3cd52e8 100644
> --- a/drivers/mmc/host/mmci.c
> +++ b/drivers/mmc/host/mmci.c
> @@ -1517,7 +1517,8 @@ static irqreturn_t mmci_irq(int irq, void *dev_id)
>                  * to make sure that both start and end interrupts are always
>                  * cleared one after the other.
>                  */
> -               status &= readl(host->base + MMCIMASK0);
> +               status &= readl(host->base + MMCIMASK0) |
> +                       host->variant->busy_detect_flag;

I think this is not entirely correct, because it would mean we check
for busy even if we haven't unmasked the busy IRQ via the
variant->busy_detect_mask.

I suggest to store a new bool in the host (call it
"busy_detect_unmasked" or whatever makes sense to you), to track
whether we have unmasked the busy IRQ or not. Then take this flag into
account, before ORing the value of host->variant->busy_detect_flag,
according to above.

>                 if (host->variant->busy_detect)
>                         writel(status & ~host->variant->busy_detect_mask,
>                                host->base + MMCICLEAR);
> --
> 2.7.4
>

Kind regards
Uffe
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
