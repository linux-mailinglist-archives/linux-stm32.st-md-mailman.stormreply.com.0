Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C15324E98EF
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Mar 2022 16:05:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 72F73C5C842;
	Mon, 28 Mar 2022 14:05:32 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com
 [209.85.128.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 86E1AC57B6F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Mar 2022 14:05:30 +0000 (UTC)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-2ea1b9b3813so44705887b3.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Mar 2022 07:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=r8CZApPDPuUnS9l1TU1XjaohxmYpHjLbbVg8Sjb9/IU=;
 b=hEnL8NnTd1X3kQVRaVF2r1Gs4O1JWM+UyhPZKFirD+nwh88IvMtueVuTNU0QbfG6gZ
 0wIXKD82+RchPkepMeaXVlPoMdtNhYBcXGyY7TRZdq9HAz3J5DPYvC1KxFPFN7Ahyc7u
 LpF1j31cRAtpS91wYjry39PdUYf/ulRs4+gsBvgaHW91RjCcdZff3zCr66BetH293y4k
 A0AZ3KoCdRPKSjDk/JSf6TN7irFlKHE8b1rv6pqI+mvNRMiUmC5vd4vzUP/BDSlsy1T0
 2OxcKQg/lWD2wGCksK073dkWhYaIQIWKiaLT3w56a6jHm4IhQJq++RozHipIavK68+hk
 uvtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=r8CZApPDPuUnS9l1TU1XjaohxmYpHjLbbVg8Sjb9/IU=;
 b=bvQ1tkR2VpGQ9XmSr7J34zZpvRdIR1QZngRcAMKmxP/sCfjUV5nD2K0yXpVGxj8a1l
 aTNi52R8XRe5LrwFtbCR4V+Thz5xAiPgUvJbUIVtcP2W4MH5oWME5N7JF3J2pp3XA80F
 Tyv6l6Dt2QD2gENZw0gO2Lqcjn77r2TNoH5NKcfXUlj48waDEpwHDAhyoUecLx+tHI9M
 2aRnglEM4Q6LdcFOD5hiYv+0e2RYKD6/RSDCjxKwRufk1HVlt61JB8yq7sB9Kz3RQWJX
 Qj0o7WoGHKoLMFKhv0SI66bjLpmHlCUpszYNJEp/r+DRtr0X0tiGxxQrKxgw15gUA/FA
 8Jng==
X-Gm-Message-State: AOAM533mPKEcO5Vs3eFmYfIxnOn1flPyP3x6f0l/tvLagIcagT6wshCV
 JZZiF5t2SPlSPHkMfEo5VzaxCssCpLOUld83qHGXcQ==
X-Google-Smtp-Source: ABdhPJwP1VmXqDvTCTUI3qjDLG6Wty/aA06/s8fpPL2mZpmlqUDdfe5p9HBHNYyTKVOSuFwAsPxr6ozjZ6hwxp1nwlA=
X-Received: by 2002:a0d:df05:0:b0:2e5:d2c2:675c with SMTP id
 i5-20020a0ddf05000000b002e5d2c2675cmr25340860ywe.495.1648476329398; Mon, 28
 Mar 2022 07:05:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220317111944.116148-1-yann.gautier@foss.st.com>
 <20220317111944.116148-2-yann.gautier@foss.st.com>
In-Reply-To: <20220317111944.116148-2-yann.gautier@foss.st.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 28 Mar 2022 16:04:52 +0200
Message-ID: <CAPDyKFpHUWodb_j8pF-tGV9JRMBEEAgsS7gouJ0rQLsJuxkTdQ@mail.gmail.com>
To: Yann Gautier <yann.gautier@foss.st.com>
Cc: Ludovic Barre <ludovic.barre@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/2] mmc: mmci: stm32: correctly check all
	elements of sg list
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

On Thu, 17 Mar 2022 at 12:19, Yann Gautier <yann.gautier@foss.st.com> wrote:
>
> Use sg and not data->sg when checking sg list elements. Else only the
> first element alignment is checked.
> The last element should be checked the same way, for_each_sg already set
> sg to sg_next(sg).
>
> Fixes: 46b723dd867d ("mmc: mmci: add stm32 sdmmc variant")
>
> Signed-off-by: Yann Gautier <yann.gautier@foss.st.com>

This one, applied for fixes, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/mmci_stm32_sdmmc.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/mmc/host/mmci_stm32_sdmmc.c b/drivers/mmc/host/mmci_stm32_sdmmc.c
> index 9c13f2c31365..4566d7fc9055 100644
> --- a/drivers/mmc/host/mmci_stm32_sdmmc.c
> +++ b/drivers/mmc/host/mmci_stm32_sdmmc.c
> @@ -62,8 +62,8 @@ static int sdmmc_idma_validate_data(struct mmci_host *host,
>          * excepted the last element which has no constraint on idmasize
>          */
>         for_each_sg(data->sg, sg, data->sg_len - 1, i) {
> -               if (!IS_ALIGNED(data->sg->offset, sizeof(u32)) ||
> -                   !IS_ALIGNED(data->sg->length, SDMMC_IDMA_BURST)) {
> +               if (!IS_ALIGNED(sg->offset, sizeof(u32)) ||
> +                   !IS_ALIGNED(sg->length, SDMMC_IDMA_BURST)) {
>                         dev_err(mmc_dev(host->mmc),
>                                 "unaligned scatterlist: ofst:%x length:%d\n",
>                                 data->sg->offset, data->sg->length);
> @@ -71,7 +71,7 @@ static int sdmmc_idma_validate_data(struct mmci_host *host,
>                 }
>         }
>
> -       if (!IS_ALIGNED(data->sg->offset, sizeof(u32))) {
> +       if (!IS_ALIGNED(sg->offset, sizeof(u32))) {
>                 dev_err(mmc_dev(host->mmc),
>                         "unaligned last scatterlist: ofst:%x length:%d\n",
>                         data->sg->offset, data->sg->length);
> --
> 2.25.1
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
