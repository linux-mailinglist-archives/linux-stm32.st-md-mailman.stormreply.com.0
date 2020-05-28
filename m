Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E8CAF1E5CCC
	for <lists+linux-stm32@lfdr.de>; Thu, 28 May 2020 12:15:06 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8DC4FC36B22;
	Thu, 28 May 2020 10:15:06 +0000 (UTC)
Received: from mail-vk1-f196.google.com (mail-vk1-f196.google.com
 [209.85.221.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4D197C36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 May 2020 10:15:03 +0000 (UTC)
Received: by mail-vk1-f196.google.com with SMTP id s192so3672193vkh.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 May 2020 03:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aFpDBbrHEeT5xAI+qYBx9rcH60UUN2udEsNMOSyFQ7M=;
 b=RIkaLL9VqsXXK1DHiTafAsYpzTRa0aIHMBATB83QXKiWmXmFatDm6fRrBRPe76rlvT
 Dwr9cm3HrMFlp0Y6/cjmzbQb4qRKsuVWnVre09ea8X3RQh/lfPZx7WFtUREXt3Fmo31s
 GzD7atxAtpLEqIMLweIlNFnpeAIuHQf6Y91JhXIabRlTW8FQFd+tOSYDa8S2i70qslLo
 8y8PfetflXzmIhltE4AIzd3QqJjU84cJTuEl51YsH/FZMdvQWPV8V8BphrgQLkCoRjle
 tufz7VAftw3Yu2ULboRGcmfof7SCqWa3kHQlSyqdNL3dWofLne0S94MHuVyyDGhEEQUi
 /bWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aFpDBbrHEeT5xAI+qYBx9rcH60UUN2udEsNMOSyFQ7M=;
 b=BZdgQi5HQZTEU5PfbPRy5v92sd8BOIfSGU2dt0TvkLaH5MEuLbClpCCfkqudkHaMkh
 NQAivvI4Zn1/PFv72t6ZureTaXc3Y9bN+lwYqQHC0sDG5XtS7eX79qssfoAbXBQEwb16
 lOf/x+oM6FQmL5JZa2HiLq1AcAIifOsMIFqn2DTykPyjpExVpkRXdvTcbEphhbwJ0KRM
 LsNTU7VX87Svq+C1WdvQPKVnOngqOwbaZ3H5YgsMmUC5b7JryYjYZa411qNXz1y38w8B
 YXABxSKA+m7dNABRIiq7nPsK3sRdAp1clen24y1uZalGkhjoQQorJEEwUy6deCeXoeCm
 FXBg==
X-Gm-Message-State: AOAM532ZwQiPblwQoaTQ069i/DhhHq6bvAK/vKs2R5aJW26FRawUCzTU
 6i47Xn5/HWEl8cGZsEN4o6ofFNvaIjIAja7BHwyzbQ==
X-Google-Smtp-Source: ABdhPJz8enCJHhd0jfdJ+DBmNgKKBHckVDKWeCVKVJF6gzV7WcLLPi1FCACEAj6Hvns2GZzF5yYelsjvOCKbyjqzjTc=
X-Received: by 2002:a1f:4845:: with SMTP id v66mr1493594vka.43.1590660902066; 
 Thu, 28 May 2020 03:15:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200526155103.12514-1-ludovic.barre@st.com>
 <20200526155103.12514-2-ludovic.barre@st.com>
In-Reply-To: <20200526155103.12514-2-ludovic.barre@st.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 28 May 2020 12:14:25 +0200
Message-ID: <CAPDyKFosrfuZGHZhDyVmst67_-RT6G6R4h=M4qedTzdOiB+HaA@mail.gmail.com>
To: Ludovic Barre <ludovic.barre@st.com>
Cc: DTML <devicetree@vger.kernel.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 1/2] mmc: mmci_sdmmc: fix DMA API warning
	overlapping mappings
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

On Tue, 26 May 2020 at 17:51, Ludovic Barre <ludovic.barre@st.com> wrote:
>
> Turning on CONFIG_DMA_API_DEBUG_SG results in the following warning:
> WARNING: CPU: 1 PID: 20 at kernel/dma/debug.c:500 add_dma_entry+0x16c/0x17c
> DMA-API: exceeded 7 overlapping mappings of cacheline 0x031d2645
> Modules linked in:
> CPU: 1 PID: 20 Comm: kworker/1:1 Not tainted 5.5.0-rc2-00021-gdeda30999c2b-dirty #49
> Hardware name: STM32 (Device Tree Support)
> Workqueue: events_freezable mmc_rescan
> [<c03138c0>] (unwind_backtrace) from [<c030d760>] (show_stack+0x10/0x14)
> [<c030d760>] (show_stack) from [<c0f2eb28>] (dump_stack+0xc0/0xd4)
> [<c0f2eb28>] (dump_stack) from [<c034a14c>] (__warn+0xd0/0xf8)
> [<c034a14c>] (__warn) from [<c034a530>] (warn_slowpath_fmt+0x94/0xb8)
> [<c034a530>] (warn_slowpath_fmt) from [<c03bca0c>] (add_dma_entry+0x16c/0x17c)
> [<c03bca0c>] (add_dma_entry) from [<c03bdf54>] (debug_dma_map_sg+0xe4/0x3d4)
> [<c03bdf54>] (debug_dma_map_sg) from [<c0d09244>] (sdmmc_idma_prep_data+0x94/0xf8)
> [<c0d09244>] (sdmmc_idma_prep_data) from [<c0d05a2c>] (mmci_prep_data+0x2c/0xb0)
> [<c0d05a2c>] (mmci_prep_data) from [<c0d073ec>] (mmci_start_data+0x134/0x2f0)
> [<c0d073ec>] (mmci_start_data) from [<c0d078d0>] (mmci_request+0xe8/0x154)
> [<c0d078d0>] (mmci_request) from [<c0cecb44>] (mmc_start_request+0x94/0xbc)
>
> DMA api debug brings to light leaking dma-mappings, dma_map_sg and
> dma_unmap_sg are not correctly balanced.
>
> If a request is prepared, the dma_map/unmap are done in asynchronous
> call pre_req (prep_data) and post_req (unprep_data). In this case
> the dma-mapping is right balanced.
>
> But if the request was not prepared, the data->host_cookie is
> define to zero and the dma_map/unmap must be done in the request.
> The dma_map is called by mmci_dma_start (prep_data), but there is
> no dma_unmap in this case.
>
> This patch adds dma_unmap_sg when the dma is finalized and
> the data cookie is zero (request not prepared).
>
> Signed-off-by: Ludovic Barre <ludovic.barre@st.com>

Applied for next by adding a fixes tag and a stable tag, thanks!

Fixes: 46b723dd867d ("mmc: mmci: add stm32 sdmmc variant")

Kind regards
Uffe


> ---
>  drivers/mmc/host/mmci_stm32_sdmmc.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/mmc/host/mmci_stm32_sdmmc.c b/drivers/mmc/host/mmci_stm32_sdmmc.c
> index 14f99d8aa3f0..2965b1c062e1 100644
> --- a/drivers/mmc/host/mmci_stm32_sdmmc.c
> +++ b/drivers/mmc/host/mmci_stm32_sdmmc.c
> @@ -188,6 +188,9 @@ static int sdmmc_idma_start(struct mmci_host *host, unsigned int *datactrl)
>  static void sdmmc_idma_finalize(struct mmci_host *host, struct mmc_data *data)
>  {
>         writel_relaxed(0, host->base + MMCI_STM32_IDMACTRLR);
> +
> +       if (!data->host_cookie)
> +               sdmmc_idma_unprep_data(host, data, 0);
>  }
>
>  static void mmci_sdmmc_set_clkreg(struct mmci_host *host, unsigned int desired)
> --
> 2.17.1
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
