Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2233B199E6A
	for <lists+linux-stm32@lfdr.de>; Tue, 31 Mar 2020 20:53:58 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D4702C36B0B;
	Tue, 31 Mar 2020 18:53:57 +0000 (UTC)
Received: from mail-vk1-f195.google.com (mail-vk1-f195.google.com
 [209.85.221.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E46A6C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Mar 2020 18:53:55 +0000 (UTC)
Received: by mail-vk1-f195.google.com with SMTP id s194so5999721vkb.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Mar 2020 11:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MLn8R7yFW0PIVTjWQSh2J/UN24TkXxBZBuS0EHdyeRc=;
 b=lDCxx/HIRV6TOpKPkZVzHmuAXwgrj7mRBJIxIb+e6C8khnrLL3vvFFdHN9HCXdHA4E
 dQedAigbBqjh+wjkwAcbpaae0rA7/tc+pYBkgBRXc/UxpZpdova5D2vzWjlANz8I21//
 myXgl1y4OTdgkPFKW4jgTZ7BoqJxRU2pxXUKNIJA/5myuhXp1MrFdNWpfLjFXpesi139
 yAkBHE2PBEokgwFBaL6/3KmRJfOzt8h6u92hKk+pCc4VlJVghaod7hk6l2q9gYLJLqPg
 +YN38+xSNgmZj8aPVt2iPpMKbiAMoJUpDvY0f2W4tX9sJ5NrJZ4wPLtiaNK14V6pw017
 LhRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MLn8R7yFW0PIVTjWQSh2J/UN24TkXxBZBuS0EHdyeRc=;
 b=ex72FkRlHa1yTdvac0gBYNVRUr9mUG/7zcJPsS0RJHOvmUGBCW+qwijewoIFWtgDfx
 wFztxaiaCa5VenEqLFiiyw+q8i9LgH0f645LgvbR6gwkDKPLggi4hCWdF/iEb3g9YoDw
 WJTMP55cQe+jIZ9WMQvsyVwHaZTJ1OAANvYMbvcVSrkgzgCfnDRiF55dQ+V+l19kJdNW
 qA6KKL5SCTDBcJulS6okftz0VeHC65jakRMTs1doS3/PKb9OWZzvoUw1O5FR0yOfBa4w
 Xd1KMcqEca7487UqBsk6JVpOnu5pHFIFDjXH8plHduxDpD8am0D2XrlIqTK9Hvgw6lya
 gbcw==
X-Gm-Message-State: AGi0PuaB5bHP/MR+IM8y7LYCTMoCyh6tVEfcmUvUwbKrrZ+Cy4ChJyOv
 A+YY3sM/T6CS53KpuB+xfXa6ITFoW6mEidJSOZxMqA==
X-Google-Smtp-Source: APiQypLRBTeeIhQeAknNXJt/1aVHFrpSI9qB4xSQ6cl6yKQ5B5KQN84Thv5rujm9HBaHwmYi/gooxxi4YtYEpV/0+Tg=
X-Received: by 2002:a1f:5003:: with SMTP id e3mr12921560vkb.59.1585680834444; 
 Tue, 31 Mar 2020 11:53:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200331155254.100952-1-marex@denx.de>
In-Reply-To: <20200331155254.100952-1-marex@denx.de>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 31 Mar 2020 20:53:18 +0200
Message-ID: <CAPDyKFrypbDEuDaGWySjC6j_qKbXpVHoubhh8e9jS24JSzBg3Q@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Russell King <linux@armlinux.org.uk>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] mmc: mmci: Only call
 .post_sig_volt_switch if voltage switch happened
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

On Tue, 31 Mar 2020 at 17:53, Marek Vasut <marex@denx.de> wrote:
>
> Call the post voltage switch handler only if the voltage switch actually
> happened. It is well possible that the regulator is already set correctly
> and no voltage switch happened, so there is no need to take any further
> action.
>
> This fixes a real issue on STM32MP1 where, if the eMMC is supplied with
> VccQ=1.8 V, the post voltage switch code will spin indefinitelly waiting
> for the voltage switch to complete, even though no voltage switch really
> happened.

Whether this is a common problem or not, I think in a first step we
should manage this in the common mmc_regulator_set_vqmmc().

Then on top of that, convert mmci into using the mmc_regulator_set_vqmmc() API.

Can please try this approach instead?

Kind regards
Uffe

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
> ---
>  drivers/mmc/host/mmci.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
> index 647567def612..11c2f417cbe8 100644
> --- a/drivers/mmc/host/mmci.c
> +++ b/drivers/mmc/host/mmci.c
> @@ -1861,10 +1861,12 @@ static int mmci_get_cd(struct mmc_host *mmc)
>  static int mmci_sig_volt_switch(struct mmc_host *mmc, struct mmc_ios *ios)
>  {
>         struct mmci_host *host = mmc_priv(mmc);
> -       int ret = 0;
> +       int old_voltage, new_voltage, ret = 0;
>
>         if (!IS_ERR(mmc->supply.vqmmc)) {
>
> +               old_voltage = regulator_get_voltage(mmc->supply.vqmmc);
> +
>                 switch (ios->signal_voltage) {
>                 case MMC_SIGNAL_VOLTAGE_330:
>                         ret = regulator_set_voltage(mmc->supply.vqmmc,
> @@ -1880,7 +1882,10 @@ static int mmci_sig_volt_switch(struct mmc_host *mmc, struct mmc_ios *ios)
>                         break;
>                 }
>
> -               if (!ret && host->ops && host->ops->post_sig_volt_switch)
> +               new_voltage = regulator_get_voltage(mmc->supply.vqmmc);
> +
> +               if (!ret && old_voltage != new_voltage &&
> +                   host->ops && host->ops->post_sig_volt_switch)
>                         ret = host->ops->post_sig_volt_switch(host, ios);
>
>                 if (ret)
> --
> 2.25.1
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
