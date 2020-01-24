Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C254B1485A4
	for <lists+linux-stm32@lfdr.de>; Fri, 24 Jan 2020 14:10:43 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8B556C36B0C;
	Fri, 24 Jan 2020 13:10:43 +0000 (UTC)
Received: from mail-ua1-f66.google.com (mail-ua1-f66.google.com
 [209.85.222.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 06973C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Jan 2020 13:10:41 +0000 (UTC)
Received: by mail-ua1-f66.google.com with SMTP id o42so740042uad.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Jan 2020 05:10:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tgn2//ZSCDORj0Cvv0XkC07XnrcMfFKutZKQkSYkRvE=;
 b=P1ptjq0UUFrZNorymbhq7kV35sq5owXkbsBz2Z/uV8WPXbLJ5uQ3B2ViXLKowV1t4n
 OGYAGWrDff83Df/xTZf6Xqz3amQPxOoz7twXZ1HrfcrTe1Hl3DddpV09/DCq0+zbGT9D
 +OR/KWLfC9esWVC9q3c30jXezsCPLhxQlXG9FrCNNZEmNGDeKmlsFjjoxRlSi+T6NHgN
 PbazLUQyVyQqaQ+h7um1L7ztpGIO/Y7jLDI1VuxnTSl01wRpC5taw+kkIGuyPHzFbBnY
 mBJbKacELjl+Nh1DBnOdg/B2VVARdL1SLJSNfdkTWrbkDj2vwBV1aeO3NgMJI49WPKfc
 hGiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tgn2//ZSCDORj0Cvv0XkC07XnrcMfFKutZKQkSYkRvE=;
 b=geQJyfcShUfYCU3BMv2oFr2W25y6ljo7k751iXjIGnJtqSfgD+2xg7fsFc5XFmMjjV
 g5DdKoxkBE3gravHmTV9HmJpDFbtzkpU2jlDmWtTfT1lGzjoqcFz0jBWu4PQX5S7NGqB
 M8QI72HZshX9CvyQePT5lpRiRHlLoHNkVXf+J6vBEmG4FgdoesceW1EmQlewgOiyuMbT
 vIXmBurRzmA/eoaVpOWAUNqV9KB3C+JSo1KTT5KxIt+wZ8Km5QDzE/wyoeaswaGeP45Q
 kkoEGozWGvWeq1WqwdE2c8X716UYtxqzAFHKY57HYomF9UmGiXSUZ9V6e6sU4OOo9VNK
 3mDg==
X-Gm-Message-State: APjAAAXNT0cQPCa8njH9xwedRMx8aBIksS1cww7NKtKRdOx1+yTarJhz
 2TTw/Wg6NjXyTmb5+qHOTIqk+V5ZHVMJ/UvW1mDsAw==
X-Google-Smtp-Source: APXvYqwVP13ejaA0SZhnfERB+1opa8r8kAAKrFN61gAqwPEvErTSb83VmAPiMo2c8U3Uv0fsr6pZWSU0PpeB8z5BJt4=
X-Received: by 2002:ab0:740e:: with SMTP id r14mr1740357uap.104.1579871439759; 
 Fri, 24 Jan 2020 05:10:39 -0800 (PST)
MIME-Version: 1.0
References: <20200110134823.14882-1-ludovic.barre@st.com>
 <20200110134823.14882-7-ludovic.barre@st.com>
In-Reply-To: <20200110134823.14882-7-ludovic.barre@st.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 24 Jan 2020 14:10:03 +0100
Message-ID: <CAPDyKFq25C6W3df5LRsYAcV71rM0YYx9xd=isURKVkbCiN+fBw@mail.gmail.com>
To: Ludovic Barre <ludovic.barre@st.com>
Cc: DTML <devicetree@vger.kernel.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 6/9] mmc: mmci: sdmmc: add execute tuning
	with delay block
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

On Fri, 10 Jan 2020 at 14:49, Ludovic Barre <ludovic.barre@st.com> wrote:
>
> The hardware delay block is used to align the sampling clock on
> the data received by SDMMC. It is mandatory for SDMMC to
> support the SDR104 mode. The delay block is used to generate
> an output clock which is dephased from the input clock.
> The phase of the output clock must be programmed by the execute
> tuning interface.
>
> Signed-off-by: Ludovic Barre <ludovic.barre@st.com>
> ---
>  drivers/mmc/host/mmci_stm32_sdmmc.c | 147 ++++++++++++++++++++++++++++
>  1 file changed, 147 insertions(+)
>
> diff --git a/drivers/mmc/host/mmci_stm32_sdmmc.c b/drivers/mmc/host/mmci_stm32_sdmmc.c
> index df08f6662431..10059fa19f4a 100644
> --- a/drivers/mmc/host/mmci_stm32_sdmmc.c
> +++ b/drivers/mmc/host/mmci_stm32_sdmmc.c
> @@ -3,10 +3,13 @@
>   * Copyright (C) STMicroelectronics 2018 - All Rights Reserved
>   * Author: Ludovic.barre@st.com for STMicroelectronics.
>   */
> +#include <linux/bitfield.h>
>  #include <linux/delay.h>
>  #include <linux/dma-mapping.h>
> +#include <linux/iopoll.h>
>  #include <linux/mmc/host.h>
>  #include <linux/mmc/card.h>
> +#include <linux/of_address.h>
>  #include <linux/reset.h>
>  #include <linux/scatterlist.h>
>  #include "mmci.h"
> @@ -14,6 +17,20 @@
>  #define SDMMC_LLI_BUF_LEN      PAGE_SIZE
>  #define SDMMC_IDMA_BURST       BIT(MMCI_STM32_IDMABNDT_SHIFT)
>
> +#define DLYB_CR                        0x0
> +#define DLYB_CR_DEN            BIT(0)
> +#define DLYB_CR_SEN            BIT(1)
> +
> +#define DLYB_CFGR              0x4
> +#define DLYB_CFGR_SEL_MASK     GENMASK(3, 0)
> +#define DLYB_CFGR_UNIT_MASK    GENMASK(14, 8)
> +#define DLYB_CFGR_LNG_MASK     GENMASK(27, 16)
> +#define DLYB_CFGR_LNGF         BIT(31)
> +
> +#define DLYB_NB_DELAY          11
> +#define DLYB_CFGR_SEL_MAX      (DLYB_NB_DELAY + 1)
> +#define DLYB_CFGR_UNIT_MAX     127

[...]

> +static int sdmmc_dlyb_lng_tuning(struct mmci_host *host)
> +{
> +       struct sdmmc_dlyb *dlyb = host->variant_priv;
> +       u32 cfgr;
> +       int i, lng, ret;
> +
> +       for (i = 0; i <= DLYB_CFGR_UNIT_MAX; i++) {
> +               sdmmc_dlyb_set_cfgr(dlyb, i, DLYB_CFGR_SEL_MAX, true);
> +
> +               ret = readl_relaxed_poll_timeout(dlyb->base + DLYB_CFGR, cfgr,
> +                                                (cfgr & DLYB_CFGR_LNGF),
> +                                                1, 1000);

I suggest you introduce a define for this timeout, in the top of the file.

> +               if (ret) {
> +                       dev_warn(mmc_dev(host->mmc),
> +                                "delay line cfg timeout unit:%d cfgr:%d\n",
> +                                i, cfgr);
> +                       continue;
> +               }
> +
> +               lng = FIELD_GET(DLYB_CFGR_LNG_MASK, cfgr);
> +               if (lng < BIT(DLYB_NB_DELAY) && lng > 0)
> +                       break;
> +       }
> +
> +       if (i > DLYB_CFGR_UNIT_MAX)
> +               return -EINVAL;
> +
> +       dlyb->unit = i;
> +       dlyb->max = __fls(lng);
> +
> +       return 0;
> +}
> +
> +static int sdmmc_dlyb_phase_tuning(struct mmci_host *host, u32 opcode)
> +{
> +       struct sdmmc_dlyb *dlyb = host->variant_priv;
> +       int cur_len = 0, max_len = 0, end_of_len = 0;
> +       int phase;
> +
> +       for (phase = 0; phase <= dlyb->max; phase++) {
> +               sdmmc_dlyb_set_cfgr(dlyb, dlyb->unit, phase, false);
> +
> +               if (mmc_send_tuning(host->mmc, opcode, NULL)) {
> +                       cur_len = 0;
> +               } else {
> +                       cur_len++;
> +                       if (cur_len > max_len) {
> +                               max_len = cur_len;
> +                               end_of_len = phase;
> +                       }
> +               }
> +       }
> +
> +       if (!max_len) {
> +               dev_err(mmc_dev(host->mmc), "no tuning point found\n");
> +               return -EINVAL;
> +       }
> +
> +       phase = end_of_len - max_len / 2;
> +       sdmmc_dlyb_set_cfgr(dlyb, dlyb->unit, phase, false);
> +
> +       dev_dbg(mmc_dev(host->mmc), "unit:%d max_dly:%d phase:%d\n",
> +               dlyb->unit, dlyb->max, phase);
> +
> +       return 0;
> +}
> +
> +static int sdmmc_execute_tuning(struct mmc_host *mmc, u32 opcode)
> +{
> +       struct mmci_host *host = mmc_priv(mmc);
> +       struct sdmmc_dlyb *dlyb = host->variant_priv;
> +
> +       if (!dlyb || !dlyb->base)
> +               return -EINVAL;
> +
> +       if (sdmmc_dlyb_lng_tuning(host))
> +               return -EINVAL;
> +
> +       return sdmmc_dlyb_phase_tuning(host, opcode);

What happens to the tuning registers when the controller device
becomes runtime suspended? Would it possible that the values gets lost
and then they need to be restored in runtime resume?

> +}
> +
>  static struct mmci_host_ops sdmmc_variant_ops = {
>         .validate_data = sdmmc_idma_validate_data,
>         .prep_data = sdmmc_idma_prep_data,
> @@ -338,5 +469,21 @@ static struct mmci_host_ops sdmmc_variant_ops = {
>
>  void sdmmc_variant_init(struct mmci_host *host)
>  {
> +       struct device_node *np = host->mmc->parent->of_node;
> +       void __iomem *base_dlyb;
> +       struct sdmmc_dlyb *dlyb;
> +
>         host->ops = &sdmmc_variant_ops;
> +
> +       base_dlyb = devm_of_iomap(mmc_dev(host->mmc), np, 1, NULL);
> +       if (IS_ERR(base_dlyb))
> +               return;
> +
> +       dlyb = devm_kzalloc(mmc_dev(host->mmc), sizeof(*dlyb), GFP_KERNEL);
> +       if (!dlyb)
> +               return;
> +
> +       dlyb->base = base_dlyb;
> +       host->variant_priv = dlyb;
> +       host->mmc_ops->execute_tuning = sdmmc_execute_tuning;
>  }
> --
> 2.17.1
>

Kind regards
Uffe
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
