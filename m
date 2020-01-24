Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B92311485CC
	for <lists+linux-stm32@lfdr.de>; Fri, 24 Jan 2020 14:17:14 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5287EC36B0C;
	Fri, 24 Jan 2020 13:17:14 +0000 (UTC)
Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com
 [209.85.217.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 77E65C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Jan 2020 13:17:11 +0000 (UTC)
Received: by mail-vs1-f66.google.com with SMTP id p6so1143677vsj.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Jan 2020 05:17:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CY7ltUl+oKffieFB5UMThEtSPwanbFsXqyW/QH4Ukh0=;
 b=e9RWc7TAC74AHptTQcr8hXxfjxpt3Z0iET5zEidjYPqHYng8MtDugSWQvHKeBShScB
 l6F6DVcE6itNBO5dTXEyCYIfAVhN1GUphQxrbM+HQQ1AZM9Ux6fIPYPoEm8cno+PCdHM
 ywFYIdhzHaHkJb1RvQ21xmiMRinXHLswPI1c5LPyYNEEeq9qdLhEjGE2VnozomaoTw4w
 /N+NeLRtuOvmaAAWa2oqq5efgDFjwsh7yeAgIFg3BF/bfUF9AkwLqx1s/b9ao84vQphT
 H3SzbTiol/MbELYfxNcjJx5ZBft9+XrklMQ07BCznmvRb2ufC1wZSC8dY9hurMidqeZ+
 p6Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CY7ltUl+oKffieFB5UMThEtSPwanbFsXqyW/QH4Ukh0=;
 b=B40pCaghwgu4dYOLUM3h77ML8ppztLn+Eyw+kfybvb9L56LupaN5CM7oXlzKVCHSEq
 YL4PZDTvN5aLJWACm61eXErGURF7WvBIx/txSC9FJ0tYz+SrBf88/sZTnxIUPK/MdHIp
 XcOQHYKBGaWpKphPXDicZ71ZVoJYkTCDSEV3zchRcSLBC/nR9xJoXMNIKi6LHO3lpIc6
 rDVZcxDWJYq2hVUEcSxX/a5pA+2Y/tg1dDapcOFL2OjZ0Hd54OIKspVmiFjdRhagraiv
 Cvz5qOSHvlUe64WNG6M57c3dnSWoMAzYxrlbbVbiLo1yLrJA0loPBXk4Qi2MKdSHldfw
 E8KA==
X-Gm-Message-State: APjAAAWnneGVR8Vbewhoyhgx913zE4cV+5J13cDRdE0K9THn3KNPqBMZ
 XJwZNGG4QBnxBO2BGu631L2x6xCzAGvIUCo/LayUGg==
X-Google-Smtp-Source: APXvYqxuazxpyOLmT7wp2Bb5Qs3z0UkG3lAUPzIzMHC3yzutOc4zmH0KV20Nsdhmyiq1SYfbmAs1J3r1bPtSYgQDFEE=
X-Received: by 2002:a67:314e:: with SMTP id x75mr1897330vsx.35.1579871830131; 
 Fri, 24 Jan 2020 05:17:10 -0800 (PST)
MIME-Version: 1.0
References: <20200110134823.14882-1-ludovic.barre@st.com>
 <20200110134823.14882-9-ludovic.barre@st.com>
In-Reply-To: <20200110134823.14882-9-ludovic.barre@st.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 24 Jan 2020 14:16:34 +0100
Message-ID: <CAPDyKFp1Qsb3yCoTJevHF+SEt5thVVriLfL-4UZSYsNTc0rdMQ@mail.gmail.com>
To: Ludovic Barre <ludovic.barre@st.com>
Cc: DTML <devicetree@vger.kernel.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 8/9] mmc: mmci: sdmmc: add voltage switch
	functions
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
> To prepare the voltage switch procedure, the VSWITCHEN bit must be
> set before sending the cmd11.
> To confirm completion of voltage switch, the VSWEND flag must be
> checked.
>
> Signed-off-by: Ludovic Barre <ludovic.barre@st.com>
> ---
>  drivers/mmc/host/mmci.h             |  4 +++
>  drivers/mmc/host/mmci_stm32_sdmmc.c | 40 ++++++++++++++++++++++++++++-
>  2 files changed, 43 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/mmci.h b/drivers/mmc/host/mmci.h
> index c04a144259a2..3634f98ad2d8 100644
> --- a/drivers/mmc/host/mmci.h
> +++ b/drivers/mmc/host/mmci.h
> @@ -165,6 +165,7 @@
>  /* Extended status bits for the STM32 variants */
>  #define MCI_STM32_BUSYD0       BIT(20)
>  #define MCI_STM32_BUSYD0END    BIT(21)
> +#define MCI_STM32_VSWEND       BIT(25)
>
>  #define MMCICLEAR              0x038
>  #define MCI_CMDCRCFAILCLR      (1 << 0)
> @@ -182,6 +183,9 @@
>  #define MCI_ST_SDIOITC         (1 << 22)
>  #define MCI_ST_CEATAENDC       (1 << 23)
>  #define MCI_ST_BUSYENDC                (1 << 24)
> +/* Extended clear bits for the STM32 variants */
> +#define MCI_STM32_VSWENDC      BIT(25)
> +#define MCI_STM32_CKSTOPC      BIT(26)
>
>  #define MMCIMASK0              0x03c
>  #define MCI_CMDCRCFAILMASK     (1 << 0)
> diff --git a/drivers/mmc/host/mmci_stm32_sdmmc.c b/drivers/mmc/host/mmci_stm32_sdmmc.c
> index 10059fa19f4a..9f43cf947c5f 100644
> --- a/drivers/mmc/host/mmci_stm32_sdmmc.c
> +++ b/drivers/mmc/host/mmci_stm32_sdmmc.c
> @@ -263,7 +263,9 @@ static void mmci_sdmmc_set_pwrreg(struct mmci_host *host, unsigned int pwr)
>         struct mmc_ios ios = host->mmc->ios;
>         struct sdmmc_dlyb *dlyb = host->variant_priv;
>
> -       pwr = host->pwr_reg_add;
> +       /* adds OF options and preserves voltage switch bits */
> +       pwr = host->pwr_reg_add |
> +               (host->pwr_reg & (MCI_STM32_VSWITCHEN | MCI_STM32_VSWITCH));
>
>         sdmmc_dlyb_input_ck(dlyb);
>
> @@ -454,6 +456,40 @@ static int sdmmc_execute_tuning(struct mmc_host *mmc, u32 opcode)
>         return sdmmc_dlyb_phase_tuning(host, opcode);
>  }
>
> +static void sdmmc_prep_vswitch(struct mmci_host *host)
> +{
> +       /* clear the voltage switch completion flag */
> +       writel_relaxed(MCI_STM32_VSWENDC, host->base + MMCICLEAR);
> +       /* enable Voltage switch procedure */
> +       mmci_write_pwrreg(host, host->pwr_reg | MCI_STM32_VSWITCHEN);
> +}
> +
> +static int sdmmc_vswitch(struct mmci_host *host, struct mmc_ios *ios)
> +{
> +       unsigned long flags;
> +       u32 status;
> +       int ret = 0;
> +
> +       if (ios->signal_voltage == MMC_SIGNAL_VOLTAGE_180) {
> +               spin_lock_irqsave(&host->lock, flags);
> +               mmci_write_pwrreg(host, host->pwr_reg | MCI_STM32_VSWITCH);
> +               spin_unlock_irqrestore(&host->lock, flags);
> +
> +               /* wait voltage switch completion while 10ms */
> +               ret = readl_relaxed_poll_timeout(host->base + MMCISTATUS,
> +                                                status,
> +                                                (status & MCI_STM32_VSWEND),
> +                                                10, 10000);
> +
> +               writel_relaxed(MCI_STM32_VSWENDC | MCI_STM32_CKSTOPC,
> +                              host->base + MMCICLEAR);
> +               mmci_write_pwrreg(host, host->pwr_reg &
> +                                 ~(MCI_STM32_VSWITCHEN | MCI_STM32_VSWITCH));
> +       }

Don't you need to manage things when resetting to
MMC_SIGNAL_VOLTAGE_330, which for example happens during a card
removal or at system suspend/resume?

> +
> +       return ret;
> +}
> +
>  static struct mmci_host_ops sdmmc_variant_ops = {
>         .validate_data = sdmmc_idma_validate_data,
>         .prep_data = sdmmc_idma_prep_data,
> @@ -465,6 +501,8 @@ static struct mmci_host_ops sdmmc_variant_ops = {
>         .set_clkreg = mmci_sdmmc_set_clkreg,
>         .set_pwrreg = mmci_sdmmc_set_pwrreg,
>         .busy_complete = sdmmc_busy_complete,
> +       .prep_volt_switch = sdmmc_prep_vswitch,
> +       .volt_switch = sdmmc_vswitch,
>  };
>
>  void sdmmc_variant_init(struct mmci_host *host)
> --
> 2.17.1
>

Kind regards
Uffe
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
