Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3568547F1
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Feb 2024 12:16:46 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 59387C57194;
	Wed, 14 Feb 2024 11:16:46 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com
 [209.85.128.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E733FCFAC50
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Feb 2024 11:16:44 +0000 (UTC)
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-6078f656914so13787637b3.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Feb 2024 03:16:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707909404; x=1708514204;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=uj6mDAYoRHzkcy8dqG4hUvzPf2kuoVsNIBmDePLCGTA=;
 b=dXVSLH2EFCmW63I+XKHPif88INwHvV4ptWFMYK4n3PZtrXs6MSyUt88III/g7DR2/4
 nlpwlX2pPVSHKUTSM08YAJUHbDjmoU85G+CDcQwSXr6gcP0I0+Z58HkU0EimXaiDifYD
 OzIfGMlAOAZlD8kTHlzBDwKD6S2j2jRoX8IOb0UcRSxCX2Tt5Be6MePb8K+KjtKm4aP7
 V1+Wr70Mf3tePTdiA52fUskHVMlt5GlhG4Uwq70cu7jXPwzaSzvCaL1GpO04l7gAi7Vw
 zVrfhSC8vstIz9oOHzHcLH9LBMYrlVJfBt6Jf1N94ndJL4YH9W152ormuqppGh2+uIjc
 ES5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707909404; x=1708514204;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uj6mDAYoRHzkcy8dqG4hUvzPf2kuoVsNIBmDePLCGTA=;
 b=Ra89etRKpi/reesi9EAvfDElzZ3oLD/VupOfAudXXIS4kz9zbo3iLuXeeArYvdDnyW
 mZ8xaLCJx5X2B7tIHX3c8TR9Y1Tz8nR6RO0Yuv1YJw3ADcJhlgGBLBM/82oh9Ss+IoEt
 /9vQsxKfoQysPHHXXSnWe7gjdy/sTp8ev7Vix93AyNrL4+IsUETWGM8M+N+C6Ocwa0ie
 vbkJA0/qZSTvb1O8eTNT1O/lOiM6MtRRhiZxPHHVeyvJMl6+t9iilRaLQoOlYJ+W9eV0
 7jRFzJhcFNnrOXKxNObzIPKqDigS4O2KSGt+kZ1+F9fjZ7ha4AloQlBZL2BgNRNK7y6Q
 KjWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5jEek6+oBl77aH7IF/CNi8yCPL9bNSr4rVuFSu8RsvBuZTBWdkxKA0yafyWrlWndC+zUw6vpZb+lFdg4PZBre+alNlVxJYv+FFH7S879sh2rwX2dXjdxY
X-Gm-Message-State: AOJu0Yzm6pIKV/6aNbV9p2MACcPeLIfMSk5+1AaAr1j5+oaRtRdG4vPy
 UCD4MDRYKQmoUhxtk9cjrWkcM1OE62ylW3fQJh4075EN8u9+3NkzXNTIDI0JxLoE+xadKAxUaLi
 RSA/FMdzI5THcFRoZqX5bkMTXwAnk1vENYmZkcw==
X-Google-Smtp-Source: AGHT+IGR6d9+WdNJXu0uxM+Xlzc9aogCPu7mnmTFb0vI1BVAlCSxaoGjJYxY6TTrV91065vIGhvBhfdccdgYl7fPDE8=
X-Received: by 2002:a25:b29f:0:b0:dc7:6f13:61d1 with SMTP id
 k31-20020a25b29f000000b00dc76f1361d1mr2242861ybj.20.1707909403782; Wed, 14
 Feb 2024 03:16:43 -0800 (PST)
MIME-Version: 1.0
References: <20240207143951.938144-1-christophe.kerello@foss.st.com>
In-Reply-To: <20240207143951.938144-1-christophe.kerello@foss.st.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 14 Feb 2024 12:16:07 +0100
Message-ID: <CAPDyKFpsABh4qsJv7sJiSZGWiBPM+umN2kp7teUYqdReC2a-zw@mail.gmail.com>
To: Christophe Kerello <christophe.kerello@foss.st.com>
Cc: linus.walleij@linaro.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] mmc: mmci: stm32: fix DMA API overlapping
	mappings warning
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

On Wed, 7 Feb 2024 at 15:40, Christophe Kerello
<christophe.kerello@foss.st.com> wrote:
>
> Turning on CONFIG_DMA_API_DEBUG_SG results in the following warning:
>
> DMA-API: mmci-pl18x 48220000.mmc: cacheline tracking EEXIST,
> overlapping mappings aren't supported
> WARNING: CPU: 1 PID: 51 at kernel/dma/debug.c:568
> add_dma_entry+0x234/0x2f4
> Modules linked in:
> CPU: 1 PID: 51 Comm: kworker/1:2 Not tainted 6.1.28 #1
> Hardware name: STMicroelectronics STM32MP257F-EV1 Evaluation Board (DT)
> Workqueue: events_freezable mmc_rescan
> Call trace:
> add_dma_entry+0x234/0x2f4
> debug_dma_map_sg+0x198/0x350
> __dma_map_sg_attrs+0xa0/0x110
> dma_map_sg_attrs+0x10/0x2c
> sdmmc_idma_prep_data+0x80/0xc0
> mmci_prep_data+0x38/0x84
> mmci_start_data+0x108/0x2dc
> mmci_request+0xe4/0x190
> __mmc_start_request+0x68/0x140
> mmc_start_request+0x94/0xc0
> mmc_wait_for_req+0x70/0x100
> mmc_send_tuning+0x108/0x1ac
> sdmmc_execute_tuning+0x14c/0x210
> mmc_execute_tuning+0x48/0xec
> mmc_sd_init_uhs_card.part.0+0x208/0x464
> mmc_sd_init_card+0x318/0x89c
> mmc_attach_sd+0xe4/0x180
> mmc_rescan+0x244/0x320
>
> DMA API debug brings to light leaking dma-mappings as dma_map_sg and
> dma_unmap_sg are not correctly balanced.
>
> If an error occurs in mmci_cmd_irq function, only mmci_dma_error
> function is called and as this API is not managed on stm32 variant,
> dma_unmap_sg is never called in this error path.
>
> Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>

Applied for fixes and by adding a fixes- and stable-tag, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/mmci_stm32_sdmmc.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>
> diff --git a/drivers/mmc/host/mmci_stm32_sdmmc.c b/drivers/mmc/host/mmci_stm32_sdmmc.c
> index 35067e1e6cd8..f5da7f9baa52 100644
> --- a/drivers/mmc/host/mmci_stm32_sdmmc.c
> +++ b/drivers/mmc/host/mmci_stm32_sdmmc.c
> @@ -225,6 +225,8 @@ static int sdmmc_idma_start(struct mmci_host *host, unsigned int *datactrl)
>         struct scatterlist *sg;
>         int i;
>
> +       host->dma_in_progress = true;
> +
>         if (!host->variant->dma_lli || data->sg_len == 1 ||
>             idma->use_bounce_buffer) {
>                 u32 dma_addr;
> @@ -263,9 +265,30 @@ static int sdmmc_idma_start(struct mmci_host *host, unsigned int *datactrl)
>         return 0;
>  }
>
> +static void sdmmc_idma_error(struct mmci_host *host)
> +{
> +       struct mmc_data *data = host->data;
> +       struct sdmmc_idma *idma = host->dma_priv;
> +
> +       if (!dma_inprogress(host))
> +               return;
> +
> +       writel_relaxed(0, host->base + MMCI_STM32_IDMACTRLR);
> +       host->dma_in_progress = false;
> +       data->host_cookie = 0;
> +
> +       if (!idma->use_bounce_buffer)
> +               dma_unmap_sg(mmc_dev(host->mmc), data->sg, data->sg_len,
> +                            mmc_get_dma_dir(data));
> +}
> +
>  static void sdmmc_idma_finalize(struct mmci_host *host, struct mmc_data *data)
>  {
> +       if (!dma_inprogress(host))
> +               return;
> +
>         writel_relaxed(0, host->base + MMCI_STM32_IDMACTRLR);
> +       host->dma_in_progress = false;
>
>         if (!data->host_cookie)
>                 sdmmc_idma_unprep_data(host, data, 0);
> @@ -676,6 +699,7 @@ static struct mmci_host_ops sdmmc_variant_ops = {
>         .dma_setup = sdmmc_idma_setup,
>         .dma_start = sdmmc_idma_start,
>         .dma_finalize = sdmmc_idma_finalize,
> +       .dma_error = sdmmc_idma_error,
>         .set_clkreg = mmci_sdmmc_set_clkreg,
>         .set_pwrreg = mmci_sdmmc_set_pwrreg,
>         .busy_complete = sdmmc_busy_complete,
> --
> 2.25.1
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
