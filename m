Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0051AD9ED
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Apr 2020 11:31:37 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B6CC2C36B0E;
	Fri, 17 Apr 2020 09:31:36 +0000 (UTC)
Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com
 [209.85.217.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2FDF2C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Apr 2020 09:31:34 +0000 (UTC)
Received: by mail-vs1-f66.google.com with SMTP id z1so745198vsn.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Apr 2020 02:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LteAXIIsrp1CuT0bJHfTfTXVVjJ2aQC98EY5Gd5exSE=;
 b=a90SQsS+roE5+U+X4bxzqK0mpeiSMkioucChZFQIp90eE4W6v8cw/F7FmXrdJGxXho
 PFJzBkUeXcVvnka/NofI8TI4oLpXT7J/6FYfLOeiCHnHWRU9TwvXA0sZs/jXUT28HWFT
 ZoY89T5KEBOI0cgG4edFgzvjK07sR3qCftOej1NF5FosfdAP+nmRTbQ+pJCZGRCoKGgF
 3FqxFZ0OM353lAy/l/xcOy4OBiDDSKH80SeigpG3mBtIFCHIfy64A4blNkmZZMImYExz
 xKyT8AxIlEkedMXawuAcesLmaKt+QOIyoNy0CmNrr6gogLlzhYZPqY/0RyaHFoW0WjIs
 zHUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LteAXIIsrp1CuT0bJHfTfTXVVjJ2aQC98EY5Gd5exSE=;
 b=UWPVhtYoGCwm+l07xJxCTatJM4xRvfPpfaCbVyEdf3a2fEpiO0zanTJxVz0tIMlF8c
 2EquKP6wuuFlssZJFRITIMz5N3utUyr1LE8L8wQByG3nJJ7uLa7jjjYlwz2EGiEtjkd3
 JSrSy+NnJtd+TEpDg9ymCF0GbuluyDxw8EASaUwLM2sBAk79zdRTvD6yArjLBG0++9Md
 ZGxFLEK7O23oUNQw8l4kr+F9BHxiCsthpjsgV25Ttw3nU6mg8YdXkAX+xbx0Kb+ggwl2
 ptfpTppBTWXxdI1FpX6WHfvRhZwf7ES2RA+zu+Hdd2olLfP3f/nteefL09HByuUowO4A
 uneg==
X-Gm-Message-State: AGi0PuZfnFGMzL0xYlvn0YQg58EMv1z2VVEMkiZCSxlMreLHBAKXYRsL
 mrWluwnKUXKnZ2r6sX+nsmqD566IIOve1PQRc0rPZw==
X-Google-Smtp-Source: APiQypL2WzeLmIOCanhciVl3me04EqW3Y3QAwA9q/jllkerSQWRBY8QgsJ3vJn8SDIZXQibjU1bnf2OS8n+A0G1WOZo=
X-Received: by 2002:a67:8b09:: with SMTP id n9mr1450579vsd.191.1587115892956; 
 Fri, 17 Apr 2020 02:31:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200416163649.336967-1-marex@denx.de>
In-Reply-To: <20200416163649.336967-1-marex@denx.de>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 17 Apr 2020 11:30:57 +0200
Message-ID: <CAPDyKFqztJDfTrc+1q9mdyf0f2s=gE91J3eM92rzmm+FJNBW9A@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Russell King <linux@armlinux.org.uk>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH V2 1/3] mmc: Prepare all code for
 mmc_regulator_set_vqmmc() returning > 0
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

On Thu, 16 Apr 2020 at 18:36, Marek Vasut <marex@denx.de> wrote:
>
> Patch all drivers which use mmc_regulator_set_vqmmc() and prepare them for
> the fact that mmc_regulator_set_vqmmc() can return a value > 0, which would
> happen if the signal voltage switch did NOT happen, because the voltage was
> already set correctly.
>
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alexandre Torgue <alexandre.torgue@st.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Ludovic Barre <ludovic.barre@st.com>
> Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Patrice Chotard <patrice.chotard@st.com>
> Cc: Patrick Delaunay <patrick.delaunay@st.com>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Cc: linux-stm32@st-md-mailman.stormreply.com
> To: linux-mmc@vger.kernel.org

Applied for next, thanks!

I took the liberty to re-work and simplify some of the code, please
have a look at my next branch to make sure I didn't screw something
up.

Kind regards
Uffe

diff --git a/drivers/mmc/host/dw_mmc-k3.c b/drivers/mmc/host/dw_mmc-k3.c
index 23b6f65b3785..50977ff18074 100644
--- a/drivers/mmc/host/dw_mmc-k3.c
+++ b/drivers/mmc/host/dw_mmc-k3.c
@@ -424,7 +424,7 @@ static int dw_mci_hi3660_switch_voltage(struct
mmc_host *mmc,

        if (!IS_ERR(mmc->supply.vqmmc)) {
                ret = mmc_regulator_set_vqmmc(mmc, ios);
-               if (ret) {
+               if (ret < 0) {
                        dev_err(host->dev, "Regulator set error %d\n", ret);
                        return ret;
                }
diff --git a/drivers/mmc/host/dw_mmc.c b/drivers/mmc/host/dw_mmc.c
index bc5278ab5707..5d1f8a3ec3a5 100644
--- a/drivers/mmc/host/dw_mmc.c
+++ b/drivers/mmc/host/dw_mmc.c
@@ -1546,8 +1546,7 @@ static int dw_mci_switch_voltage(struct mmc_host
*mmc, struct mmc_ios *ios)

        if (!IS_ERR(mmc->supply.vqmmc)) {
                ret = mmc_regulator_set_vqmmc(mmc, ios);
-
-               if (ret) {
+               if (ret < 0) {
                        dev_dbg(&mmc->class_dev,
                                         "Regulator set error %d - %s V\n",
                                         ret, uhs & v18 ? "1.8" : "3.3");



> ---
> V2: Patch only mmc_regulator_set_vqmmc()
> ---
>  drivers/mmc/host/dw_mmc-k3.c         |  2 ++
>  drivers/mmc/host/dw_mmc.c            |  2 ++
>  drivers/mmc/host/meson-gx-mmc.c      |  7 ++++++-
>  drivers/mmc/host/mtk-sd.c            |  2 ++
>  drivers/mmc/host/renesas_sdhi_core.c |  2 ++
>  drivers/mmc/host/sdhci-sprd.c        |  2 ++
>  drivers/mmc/host/sdhci.c             |  6 ++++++
>  drivers/mmc/host/sunxi-mmc.c         | 10 ++++++++--
>  drivers/mmc/host/usdhi6rol0.c        |  2 ++
>  9 files changed, 32 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/mmc/host/dw_mmc-k3.c b/drivers/mmc/host/dw_mmc-k3.c
> index 23b6f65b3785..695e29452367 100644
> --- a/drivers/mmc/host/dw_mmc-k3.c
> +++ b/drivers/mmc/host/dw_mmc-k3.c
> @@ -424,6 +424,8 @@ static int dw_mci_hi3660_switch_voltage(struct mmc_host *mmc,
>
>         if (!IS_ERR(mmc->supply.vqmmc)) {
>                 ret = mmc_regulator_set_vqmmc(mmc, ios);
> +               if (ret > 0)
> +                       ret = 0;
>                 if (ret) {
>                         dev_err(host->dev, "Regulator set error %d\n", ret);
>                         return ret;
> diff --git a/drivers/mmc/host/dw_mmc.c b/drivers/mmc/host/dw_mmc.c
> index bc5278ab5707..3f82170f1d98 100644
> --- a/drivers/mmc/host/dw_mmc.c
> +++ b/drivers/mmc/host/dw_mmc.c
> @@ -1546,6 +1546,8 @@ static int dw_mci_switch_voltage(struct mmc_host *mmc, struct mmc_ios *ios)
>
>         if (!IS_ERR(mmc->supply.vqmmc)) {
>                 ret = mmc_regulator_set_vqmmc(mmc, ios);
> +               if (ret > 0)
> +                       ret = 0;
>
>                 if (ret) {
>                         dev_dbg(&mmc->class_dev,
> diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
> index 35400cf2a2e4..79e15fa6f4fd 100644
> --- a/drivers/mmc/host/meson-gx-mmc.c
> +++ b/drivers/mmc/host/meson-gx-mmc.c
> @@ -1004,6 +1004,8 @@ static int meson_mmc_card_busy(struct mmc_host *mmc)
>
>  static int meson_mmc_voltage_switch(struct mmc_host *mmc, struct mmc_ios *ios)
>  {
> +       int ret;
> +
>         /* vqmmc regulator is available */
>         if (!IS_ERR(mmc->supply.vqmmc)) {
>                 /*
> @@ -1013,7 +1015,10 @@ static int meson_mmc_voltage_switch(struct mmc_host *mmc, struct mmc_ios *ios)
>                  * to 1.8v. Please make sure the regulator framework is aware
>                  * of your own regulator constraints
>                  */
> -               return mmc_regulator_set_vqmmc(mmc, ios);
> +               ret = mmc_regulator_set_vqmmc(mmc, ios);
> +               if (ret > 0)
> +                       ret = 0;
> +               return ret;
>         }
>
>         /* no vqmmc regulator, assume fixed regulator at 3/3.3V */
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index b221c02cc71f..9688797f097d 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -1379,6 +1379,8 @@ static int msdc_ops_switch_volt(struct mmc_host *mmc, struct mmc_ios *ios)
>                 }
>
>                 ret = mmc_regulator_set_vqmmc(mmc, ios);
> +               if (ret > 0)
> +                       ret = 0;
>                 if (ret) {
>                         dev_dbg(host->dev, "Regulator set error %d (%d)\n",
>                                 ret, ios->signal_voltage);
> diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
> index 68432bb0255b..7ffe17bb1e62 100644
> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -237,6 +237,8 @@ static int renesas_sdhi_start_signal_voltage_switch(struct mmc_host *mmc,
>                         MMC_SIGNAL_VOLTAGE_330 ? 0 : -EINVAL;
>
>         ret = mmc_regulator_set_vqmmc(host->mmc, ios);
> +       if (ret > 0)
> +               ret = 0;
>         if (ret)
>                 return ret;
>
> diff --git a/drivers/mmc/host/sdhci-sprd.c b/drivers/mmc/host/sdhci-sprd.c
> index 60c3a4c620f9..2a27af3eceef 100644
> --- a/drivers/mmc/host/sdhci-sprd.c
> +++ b/drivers/mmc/host/sdhci-sprd.c
> @@ -434,6 +434,8 @@ static int sdhci_sprd_voltage_switch(struct mmc_host *mmc, struct mmc_ios *ios)
>
>         if (!IS_ERR(mmc->supply.vqmmc)) {
>                 ret = mmc_regulator_set_vqmmc(mmc, ios);
> +               if (ret > 0)
> +                       ret = 0;
>                 if (ret) {
>                         pr_err("%s: Switching signalling voltage failed\n",
>                                mmc_hostname(mmc));
> diff --git a/drivers/mmc/host/sdhci.c b/drivers/mmc/host/sdhci.c
> index 344a7e0e33fe..a100fb633b40 100644
> --- a/drivers/mmc/host/sdhci.c
> +++ b/drivers/mmc/host/sdhci.c
> @@ -2411,6 +2411,8 @@ int sdhci_start_signal_voltage_switch(struct mmc_host *mmc,
>
>                 if (!IS_ERR(mmc->supply.vqmmc)) {
>                         ret = mmc_regulator_set_vqmmc(mmc, ios);
> +                       if (ret > 0)
> +                               ret = 0;
>                         if (ret) {
>                                 pr_warn("%s: Switching to 3.3V signalling voltage failed\n",
>                                         mmc_hostname(mmc));
> @@ -2434,6 +2436,8 @@ int sdhci_start_signal_voltage_switch(struct mmc_host *mmc,
>                         return -EINVAL;
>                 if (!IS_ERR(mmc->supply.vqmmc)) {
>                         ret = mmc_regulator_set_vqmmc(mmc, ios);
> +                       if (ret > 0)
> +                               ret = 0;
>                         if (ret) {
>                                 pr_warn("%s: Switching to 1.8V signalling voltage failed\n",
>                                         mmc_hostname(mmc));
> @@ -2466,6 +2470,8 @@ int sdhci_start_signal_voltage_switch(struct mmc_host *mmc,
>                         return -EINVAL;
>                 if (!IS_ERR(mmc->supply.vqmmc)) {
>                         ret = mmc_regulator_set_vqmmc(mmc, ios);
> +                       if (ret > 0)
> +                               ret = 0;
>                         if (ret) {
>                                 pr_warn("%s: Switching to 1.2V signalling voltage failed\n",
>                                         mmc_hostname(mmc));
> diff --git a/drivers/mmc/host/sunxi-mmc.c b/drivers/mmc/host/sunxi-mmc.c
> index f87d7967457f..f70a4249b72b 100644
> --- a/drivers/mmc/host/sunxi-mmc.c
> +++ b/drivers/mmc/host/sunxi-mmc.c
> @@ -951,9 +951,15 @@ static void sunxi_mmc_set_ios(struct mmc_host *mmc, struct mmc_ios *ios)
>
>  static int sunxi_mmc_volt_switch(struct mmc_host *mmc, struct mmc_ios *ios)
>  {
> +       int ret;
> +
>         /* vqmmc regulator is available */
> -       if (!IS_ERR(mmc->supply.vqmmc))
> -               return mmc_regulator_set_vqmmc(mmc, ios);
> +       if (!IS_ERR(mmc->supply.vqmmc)) {
> +               ret = mmc_regulator_set_vqmmc(mmc, ios);
> +               if (ret > 0)
> +                       ret = 0;
> +               return ret;
> +       }
>
>         /* no vqmmc regulator, assume fixed regulator at 3/3.3V */
>         if (mmc->ios.signal_voltage == MMC_SIGNAL_VOLTAGE_330)
> diff --git a/drivers/mmc/host/usdhi6rol0.c b/drivers/mmc/host/usdhi6rol0.c
> index 9a0b1e4e405d..72e698071ddf 100644
> --- a/drivers/mmc/host/usdhi6rol0.c
> +++ b/drivers/mmc/host/usdhi6rol0.c
> @@ -1174,6 +1174,8 @@ static int usdhi6_sig_volt_switch(struct mmc_host *mmc, struct mmc_ios *ios)
>         int ret;
>
>         ret = mmc_regulator_set_vqmmc(mmc, ios);
> +       if (ret > 0)
> +               ret = 0;
>         if (ret < 0)
>                 return ret;
>
> --
> 2.25.1
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
