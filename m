Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B055219414C
	for <lists+linux-stm32@lfdr.de>; Thu, 26 Mar 2020 15:28:48 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 79840C36B0B;
	Thu, 26 Mar 2020 14:28:48 +0000 (UTC)
Received: from mail-ua1-f65.google.com (mail-ua1-f65.google.com
 [209.85.222.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 905FBC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Mar 2020 14:28:46 +0000 (UTC)
Received: by mail-ua1-f65.google.com with SMTP id d23so1927431uak.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Mar 2020 07:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dpR7Oxz1qNUziJu9EkZNTQU3ukjyRpCe41037a5byCM=;
 b=A5cZNsK5c5uZutnm0OIXGS+KX7eNfN7wqt28zszCZAhqy6YCJE5AXwTRTNuYDXqs6O
 kVy906+0sjz7Ea81h3wXaysYdR1rk2YkZaFasf8szBzhyoNf2RhFmIDZJ7itRAwGsL6p
 WNZ1EWZMpmNa1RW0Y3ztF9PD6W/8Tg1LWwKb/Dsx6bkaaASYPLcIsKa1lSndDFWS+ybG
 vY5Q33UTJBetKrYcvjeakGfoc+euPMjtKyS/THQ2N6reNORXrSfKGjJesQFgGTNoI4U1
 wHF6ka30AIQAMrzkrofwUZOiYP3y0tSwom2KGfmjP0/uZtxcc0DRdQQw0w++JfPFBHFp
 PX6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dpR7Oxz1qNUziJu9EkZNTQU3ukjyRpCe41037a5byCM=;
 b=rbtDvHT2qh1FjcYnC2bWJWIQ8kJTDK9HVAdTtJiQ1a4DNSiA09IzAvBkX5/gQ33nqy
 W1Ev8iLeU8yLvht1VujDc3OT1WqAoGWZ7070NPtfb2eNcbnqA3aqXNtQmr571eZ+4TvT
 PKww76PZIxsHOm3heL9tS+3pbbcQ5LyIkdXxr9v7NwhBPnuqdBb0UgVNhFANe8o5wFee
 f7LtjxC6GUgYA2mPHI36uHFODaTalHjIO4uUE9F1bB6Bms9YWT0sjF0BEcfiNlALW2Bv
 1NhjRaYM+oZCxuO5IfQRO5Hu+th0KTxuxGQkbp3Bdstlql0j1x54a6zw5Pf5xFCwWz79
 cyVQ==
X-Gm-Message-State: ANhLgQ0t2/6wG3cST7zviPfzEhkiLyD4n3T7RQ/Gtg2dLEPhGH5i3Bvr
 523KXwuBjLpewc9HKWBSyrBJkXFWs9Nj1ovyGg/PBA==
X-Google-Smtp-Source: ADFU+vtSP1ZWeFS0v/IYE0yhokN9YWSHWu7abe9/C6yo19lM7d8FYypGhqrHHkutkPFQ/tySL6jnvOiMocB0QKtvN6g=
X-Received: by 2002:ab0:6204:: with SMTP id m4mr6628927uao.15.1585232925473;
 Thu, 26 Mar 2020 07:28:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200325143409.13005-1-ludovic.barre@st.com>
 <20200325143409.13005-2-ludovic.barre@st.com>
In-Reply-To: <20200325143409.13005-2-ludovic.barre@st.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 26 Mar 2020 15:28:09 +0100
Message-ID: <CAPDyKFo-Lgikwf=PUAd1naXxiyn=z425sTXX9O39__Xi39oUYQ@mail.gmail.com>
To: Ludovic Barre <ludovic.barre@st.com>
Cc: DTML <devicetree@vger.kernel.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH V2 1/2] mmc: mmci_sdmmc: fix clear
	busyd0end irq flag
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

On Wed, 25 Mar 2020 at 15:34, Ludovic Barre <ludovic.barre@st.com> wrote:
>
> The busyd0 line transition can be very fast. The busy request
> may be completed by busy_d0end without wait the busy_d0 steps.
> The busyd0end irq flag must be cleared even if no busy_status.
>
> Signed-off-by: Ludovic Barre <ludovic.barre@st.com>

Applied for next, by adding a fixes+stable tag, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/mmci_stm32_sdmmc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mmc/host/mmci_stm32_sdmmc.c b/drivers/mmc/host/mmci_stm32_sdmmc.c
> index f76e82f8f12f..d33e62bd6153 100644
> --- a/drivers/mmc/host/mmci_stm32_sdmmc.c
> +++ b/drivers/mmc/host/mmci_stm32_sdmmc.c
> @@ -358,11 +358,11 @@ static bool sdmmc_busy_complete(struct mmci_host *host, u32 status, u32 err_msk)
>         if (host->busy_status) {
>                 writel_relaxed(mask & ~host->variant->busy_detect_mask,
>                                base + MMCIMASK0);
> -               writel_relaxed(host->variant->busy_detect_mask,
> -                              base + MMCICLEAR);
>                 host->busy_status = 0;
>         }
>
> +       writel_relaxed(host->variant->busy_detect_mask, base + MMCICLEAR);
> +
>         return true;
>  }
>
> --
> 2.17.1
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
