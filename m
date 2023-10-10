Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E547BFF38
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Oct 2023 16:27:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 51924C6B442;
	Tue, 10 Oct 2023 14:27:58 +0000 (UTC)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com
 [209.85.219.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 457F0C6A61D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Oct 2023 14:27:56 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id
 3f1490d57ef6-d81d09d883dso6208328276.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Oct 2023 07:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696948075; x=1697552875;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dT77dimH38lNkEOjl8IbLPxRcBLVK2X43aS4AEihWpM=;
 b=kWR9V9Oa+m5dI29JSNjMt+8kLunLFkmzghM4oa5yEfxiQXWJ84uvM6apz7ZPgxCMAe
 qPVbJVD3AQh6BjtldTnVGQ1gGi3GSEt5zSgJ3UPJRDpzNFc4SkjhU87nMLG7ycJ28YTr
 oskqzWQjZdDbz6YwZkRh1a1DCOPzGycwhNWXygWqsBD66P0xVDTu22wkc9mWDk1wTDgx
 QVlBXlt/IUeSQ6y23dURpjWqy6sNANaJNPmFGiymP5qrW6MreX5E9nQJunky8e57ftum
 o4i1i97YmLG4kxy/3IlwnLr9F/oQAumjodFbQBimSrOm0s05yFToUqMEq7QRWE70kX7x
 VpGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696948075; x=1697552875;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dT77dimH38lNkEOjl8IbLPxRcBLVK2X43aS4AEihWpM=;
 b=jeUa7AT4yd54l8+chq7BXpoNUu1Ql+TgpL2IcExY/3dA1/7/VBdH7nmP3EjdG7PVEZ
 y5WqPKKeWtXNkmV7jCHyNhUlMdWa0yhhuWACeUs7CRaYeqPF5EA3ufGbFgvskyNHXNyB
 QJC72w3+k3+itTh4rWTQ/7vg21yCJwY2ha+HW8rz51KRUodWYPJRznrWfPPX4MvC5q8r
 HXH9k0F0ZpkL1vggVS4mWAevnrR11J5ip2+nhJp1OfvWph6SYZyqmfbbN09Y+f5Af6L1
 JVrU3DLYKc+YRjeRU50tGn1eEBL4iJBlZSJpz2hUQLhxs2ZG7QmjsMCNkpsQ72MLuFmF
 xq8w==
X-Gm-Message-State: AOJu0YxJpBcp0GJnuxKyzREGSzO66zmB+7u6cYtI+ibHEuBGn6lXrvKq
 dG0bp1aNkQ4zEUhhl9MwR2hw3f2oCxUJnXxQ9WtdoQ==
X-Google-Smtp-Source: AGHT+IGWrxLtQd056lvR1T3hdr2BKFoq4kFj36v28+Mx5Z06v6657RWnOLDen1pD9HpMm5ZtwX8ltnK12vixWnT1Ra0=
X-Received: by 2002:a25:24cd:0:b0:d81:cdda:729c with SMTP id
 k196-20020a2524cd000000b00d81cdda729cmr16448284ybk.23.1696948075130; Tue, 10
 Oct 2023 07:27:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230928135644.1489691-1-ben.wolsieffer@hefring.com>
In-Reply-To: <20230928135644.1489691-1-ben.wolsieffer@hefring.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 10 Oct 2023 16:27:19 +0200
Message-ID: <CAPDyKFqha53z1wvB8FTXkivE0akoyCbcmU4DCh2qJhBtAbKwtQ@mail.gmail.com>
To: Ben Wolsieffer <ben.wolsieffer@hefring.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-mmc@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2] mmc: mmci: use peripheral flow control
	for STM32
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

On Thu, 28 Sept 2023 at 15:57, Ben Wolsieffer
<ben.wolsieffer@hefring.com> wrote:
>
> From: Ben Wolsieffer <Ben.Wolsieffer@hefring.com>
>
> The STM32 SDMMC peripheral (at least for the STM32F429, STM32F469 and
> STM32F746, which are all the currently supported devices using periphid
> 0x00880180) requires DMA to be performed in peripheral flow controller
> mode. From the STM32F74/5 reference manual, section 35.3.2:
>
> "SDMMC host allows only to use the DMA in peripheral flow controller
> mode. DMA stream used to serve SDMMC must be configured in peripheral
> flow controller mode"
>
> This patch adds a variant option to control peripheral flow control and
> enables it for the STM32 variant.
>
> Signed-off-by: Ben Wolsieffer <Ben.Wolsieffer@hefring.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Applied for next, thanks!

Kind regards
Uffe


> ---
> Changes in v2: use bool instead of u8:1
>
>  drivers/mmc/host/mmci.c | 3 ++-
>  drivers/mmc/host/mmci.h | 2 ++
>  2 files changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
> index 769b34afa835..90e32f18abbc 100644
> --- a/drivers/mmc/host/mmci.c
> +++ b/drivers/mmc/host/mmci.c
> @@ -249,6 +249,7 @@ static struct variant_data variant_stm32 = {
>         .f_max                  = 48000000,
>         .pwrreg_clkgate         = true,
>         .pwrreg_nopower         = true,
> +       .dma_flow_controller    = true,
>         .init                   = mmci_variant_init,
>  };
>
> @@ -1012,7 +1013,7 @@ static int _mmci_dmae_prep_data(struct mmci_host *host, struct mmc_data *data,
>                 .dst_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES,
>                 .src_maxburst = variant->fifohalfsize >> 2, /* # of words */
>                 .dst_maxburst = variant->fifohalfsize >> 2, /* # of words */
> -               .device_fc = false,
> +               .device_fc = variant->dma_flow_controller,
>         };
>         struct dma_chan *chan;
>         struct dma_device *device;
> diff --git a/drivers/mmc/host/mmci.h b/drivers/mmc/host/mmci.h
> index 253197f132fc..34d9897c289b 100644
> --- a/drivers/mmc/host/mmci.h
> +++ b/drivers/mmc/host/mmci.h
> @@ -332,6 +332,7 @@ enum mmci_busy_state {
>   * @opendrain: bitmask identifying the OPENDRAIN bit inside MMCIPOWER register
>   * @dma_lli: true if variant has dma link list feature.
>   * @stm32_idmabsize_mask: stm32 sdmmc idma buffer size.
> + * @dma_flow_controller: use peripheral as flow controller for DMA.
>   */
>  struct variant_data {
>         unsigned int            clkreg;
> @@ -378,6 +379,7 @@ struct variant_data {
>         u8                      dma_lli:1;
>         u32                     stm32_idmabsize_mask;
>         u32                     stm32_idmabsize_align;
> +       bool                    dma_flow_controller;
>         void (*init)(struct mmci_host *host);
>  };
>
> --
> 2.42.0
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
