Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A571FAF4A
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Jun 2020 13:33:45 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6E45DC36B11;
	Tue, 16 Jun 2020 11:33:45 +0000 (UTC)
Received: from mail-vk1-f194.google.com (mail-vk1-f194.google.com
 [209.85.221.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 69EEFC36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Jun 2020 11:33:44 +0000 (UTC)
Received: by mail-vk1-f194.google.com with SMTP id y23so1624159vkd.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Jun 2020 04:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=d3xurtsGxG5+pBj/Wd/EiagOHM+i8tFxNIlSk/FHDFA=;
 b=VK0MaGVKyzGVAsortmOAkqQBfDxQ17xbC+E5ynMMCx+V6YoKoddQvXDG6GVU74fLDE
 3AOFqiB9yyL/7Bx9YbSZLLalzmmfXNKl6UgP0RgUNX3H7O8go3qlIWEaicPbap/w/fXa
 4Dhyg/QJIX3D4Sla8YWYe2UxMKRASkzm3vhhJ92d+92UAs26cKGtLdQHKIY+0/lLV17o
 EXPHDXICY8O7sHOyRdGyfYzx8DP/K2SXD3XSK5Ng/Eqjth22KJy3v6SHvbp8TdknSgHv
 DfOVaqgwFbXbUHUJLXtQCjdgXitPvvjeBqi3BmhG9GCsQleQY/b0GQ/ZXogtXQe8XA02
 3SlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d3xurtsGxG5+pBj/Wd/EiagOHM+i8tFxNIlSk/FHDFA=;
 b=R4PkqSONmGoRxsQR4sAlcb/GzTs9NnQj80bJtEP21zFy7IxlaTu+QQPT3bOxO4Epr3
 C9p5b1ftko2ttuFWonvmyjGYmfPfi/sXVFkTTVe7Eherephsf1xEV5J6C8SL4C4Pf8K9
 qHcJZTgCWVLoJPLh2W15fZnwYNP5Y70nHUy8Q1tHw1Awz0N3EAvAC3NRwQ2DtrkIRFuQ
 Ob1xR5nPTDNJFJLwsFIl6sFY18KAstU5h9mH97UgnIlRVP5sxkydg1P8vWX8EjDpspIz
 Z+9KosDYbJoUh60d6hDVjaoH1ylNdXA/lvy2WFmDaa0p1On/bwHkxrbGXqAU+3ZsO1y8
 9qkw==
X-Gm-Message-State: AOAM5304d1BHcMk5a/4IF7lkt9k6RRMPyeW25QFymztiEfO3I62zEMKz
 WQ9xRX27UaEpphsQZWvqq5neWfPNvLLJ6PWhBX6hTA==
X-Google-Smtp-Source: ABdhPJwISf1vfOjyjum1tJCBaNteiqD3S1uRqKWFGycL6f89hwszildCgajIP6J3PoKnXdvffL4CBueNZTWeqBkPb0Y=
X-Received: by 2002:ac5:cc44:: with SMTP id l4mr1143248vkm.43.1592307223208;
 Tue, 16 Jun 2020 04:33:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200611132839.4515-1-ludovic.barre@st.com>
In-Reply-To: <20200611132839.4515-1-ludovic.barre@st.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 16 Jun 2020 13:33:06 +0200
Message-ID: <CAPDyKFpeEdvFWj98LRHtckVRzzz1TaHcYR5AFJSMujuRCDoVgw@mail.gmail.com>
To: Ludovic Barre <ludovic.barre@st.com>
Cc: DTML <devicetree@vger.kernel.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] mmc: mmci: add sdio datactrl mask for
	sdmmc revisions
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

On Thu, 11 Jun 2020 at 15:28, Ludovic Barre <ludovic.barre@st.com> wrote:
>
> This patch adds datactrl_mask_sdio for sdmmc revisions.
> sdmmc revisions used same bit of previous ST variant.
>
> Signed-off-by: Ludovic Barre <ludovic.barre@st.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/mmci.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
> index a69d6a0c2e15..b5a41a7ce165 100644
> --- a/drivers/mmc/host/mmci.c
> +++ b/drivers/mmc/host/mmci.c
> @@ -267,6 +267,7 @@ static struct variant_data variant_stm32_sdmmc = {
>         .datalength_bits        = 25,
>         .datactrl_blocksz       = 14,
>         .datactrl_any_blocksz   = true,
> +       .datactrl_mask_sdio     = MCI_DPSM_ST_SDIOEN,
>         .stm32_idmabsize_mask   = GENMASK(12, 5),
>         .busy_timeout           = true,
>         .busy_detect            = true,
> @@ -292,6 +293,7 @@ static struct variant_data variant_stm32_sdmmcv2 = {
>         .datalength_bits        = 25,
>         .datactrl_blocksz       = 14,
>         .datactrl_any_blocksz   = true,
> +       .datactrl_mask_sdio     = MCI_DPSM_ST_SDIOEN,
>         .stm32_idmabsize_mask   = GENMASK(16, 5),
>         .dma_lli                = true,
>         .busy_timeout           = true,
> --
> 2.17.1
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
