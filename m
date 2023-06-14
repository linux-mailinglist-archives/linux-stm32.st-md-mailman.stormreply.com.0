Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CA79972FAFC
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Jun 2023 12:32:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8EC0DC6B443;
	Wed, 14 Jun 2023 10:32:05 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 84F10C6B454
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Jun 2023 10:32:04 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id
 d75a77b69052e-3f9b1f43bd0so18408751cf.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Jun 2023 03:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686738723; x=1689330723;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Bk5KTXO8tGRkVKak2dEfcHSu4PyVlCkfKJkrfYPVHyA=;
 b=XvUMgbgt3tZfZoM0Qg4P6ZznuGBCmG+3ewIJiR77hnwu+5apM6jGgR+2Cz35KEU0kh
 EXUzkR14nC90XXe9JYrEE2Q6wtyzFsp6vijbZ78JxmfLIlngyw2XFex2U1Ynwfu5MxaO
 g3RA2tPUyttReMvNN0gUQ54g070Iew+zflhUC4pCBeKpGZ+zhz2Iaheo5HhvB83fm8Mm
 ja9dTROH8FEOp/6tcOepc1mf+A0r3bn8e3EXlE7ZQK5x7KknHnL50Om/qY5yof0hcf8F
 g8E0mPB2bBujtDaSZOxDMzMRe/5Yszqpw7f4XUUuAH3shrLGRC3nRHygY0jXna5h5F8Y
 tEIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686738723; x=1689330723;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Bk5KTXO8tGRkVKak2dEfcHSu4PyVlCkfKJkrfYPVHyA=;
 b=dGH4mml8lKr3sx3UhpZIhUkpzvgHBg2GmHIlm+k6Un9RHZjqSgTKrhq1TpFFBFDrn9
 q1vRu8SqSGGp712FoLnTWfz6Qy6XpurfiPVNmMDXVsgVd3hCi568QY0cZ1v1Wpp9NKxG
 ufaCSGDfsSLZW5DFewLxYHV6q/q7Ljcrxmln/Kt8mp/73KCV6xiuq98PUP6+XTbC3/Cm
 wu0Hnh4qo/Q+xXCmwJosrZQQRblEo24pX58RCIqgT6Xm00ke9KW8XrvAKjAlKT/jxcVY
 oya75aF0iHJw4imVCc1y2dX8IzFqJr0oXdUx/hXFSl1Ow+Wqrfc7GVYp82suFreET+mh
 XFvA==
X-Gm-Message-State: AC+VfDxFp6A7sDzb0gc1LLYknoRV+CnKjuiRYQxnr/XpcMgCx9hdoB4m
 iShNvPso+PJEQWpflkb2+FMg+Oa7lkm7LYjOsLMdBA==
X-Google-Smtp-Source: ACHHUZ6WGpvvy5YTbPx2DKWT/5s0zb051L42eJ/xFYh1BZ6zGKLEOUsGaJH18B0DhavSJ889KalaPEaW4whvvpH3dXQ=
X-Received: by 2002:ac8:5ac1:0:b0:3f2:384:9292 with SMTP id
 d1-20020ac85ac1000000b003f203849292mr2153503qtd.34.1686738723505; Wed, 14 Jun
 2023 03:32:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230613150148.429828-1-yann.gautier@foss.st.com>
In-Reply-To: <20230613150148.429828-1-yann.gautier@foss.st.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 14 Jun 2023 12:31:27 +0200
Message-ID: <CAPDyKFpOOm-PR5NiggT6NqiXgbz6qGQ46-y26XZNi1S2-B=VYw@mail.gmail.com>
To: Yann Gautier <yann.gautier@foss.st.com>
Cc: Marek Vasut <marex@denx.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] mmc: mmci: stm32: set feedback clock when
	using delay block
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

On Tue, 13 Jun 2023 at 17:02, Yann Gautier <yann.gautier@foss.st.com> wrote:
>
> The feedback clock is used only for SDR104 & HS200 modes, and when
> delay block is used (frequency is higher than 50 MHz). The tuning
> procedure is then only required for those modes. Skip the procedure
> for other modes.
> The setting of this feedback clock is done just after enabling delay
> block, and before configuring it.
>
> Signed-off-by: Yann Gautier <yann.gautier@foss.st.com>
> Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/mmci_stm32_sdmmc.c | 29 ++++++++++++++++++-----------
>  1 file changed, 18 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/mmc/host/mmci_stm32_sdmmc.c b/drivers/mmc/host/mmci_stm32_sdmmc.c
> index 60bca78a72b19..953d1be4e379c 100644
> --- a/drivers/mmc/host/mmci_stm32_sdmmc.c
> +++ b/drivers/mmc/host/mmci_stm32_sdmmc.c
> @@ -293,18 +293,8 @@ static void mmci_sdmmc_set_clkreg(struct mmci_host *host, unsigned int desired)
>         clk |= host->clk_reg_add;
>         clk |= ddr;
>
> -       /*
> -        * SDMMC_FBCK is selected when an external Delay Block is needed
> -        * with SDR104 or HS200.
> -        */
> -       if (host->mmc->ios.timing >= MMC_TIMING_UHS_SDR50) {
> +       if (host->mmc->ios.timing >= MMC_TIMING_UHS_SDR50)
>                 clk |= MCI_STM32_CLK_BUSSPEED;
> -               if (host->mmc->ios.timing == MMC_TIMING_UHS_SDR104 ||
> -                   host->mmc->ios.timing == MMC_TIMING_MMC_HS200) {
> -                       clk &= ~MCI_STM32_CLK_SEL_MSK;
> -                       clk |= MCI_STM32_CLK_SELFBCK;
> -               }
> -       }
>
>         mmci_write_clkreg(host, clk);
>  }
> @@ -511,10 +501,27 @@ static int sdmmc_execute_tuning(struct mmc_host *mmc, u32 opcode)
>  {
>         struct mmci_host *host = mmc_priv(mmc);
>         struct sdmmc_dlyb *dlyb = host->variant_priv;
> +       u32 clk;
> +
> +       if ((host->mmc->ios.timing != MMC_TIMING_UHS_SDR104 &&
> +            host->mmc->ios.timing != MMC_TIMING_MMC_HS200) ||
> +           host->mmc->actual_clock <= 50000000)
> +               return 0;
>
>         if (!dlyb || !dlyb->base)
>                 return -EINVAL;
>
> +       writel_relaxed(DLYB_CR_DEN, dlyb->base + DLYB_CR);
> +
> +       /*
> +        * SDMMC_FBCK is selected when an external Delay Block is needed
> +        * with SDR104 or HS200.
> +        */
> +       clk = host->clk_reg;
> +       clk &= ~MCI_STM32_CLK_SEL_MSK;
> +       clk |= MCI_STM32_CLK_SELFBCK;
> +       mmci_write_clkreg(host, clk);
> +
>         if (sdmmc_dlyb_lng_tuning(host))
>                 return -EINVAL;
>
> --
> 2.25.1
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
