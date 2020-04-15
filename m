Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3588C1A9741
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Apr 2020 10:46:38 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D8CD9C36B0C;
	Wed, 15 Apr 2020 08:46:37 +0000 (UTC)
Received: from mail-ua1-f65.google.com (mail-ua1-f65.google.com
 [209.85.222.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9CA60C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Apr 2020 08:46:36 +0000 (UTC)
Received: by mail-ua1-f65.google.com with SMTP id t8so1047387uap.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Apr 2020 01:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pi2eGcMT6rMjNmHfTn+6C3a0PNU3Dbjr1+RHlUDbfdE=;
 b=vJIB27nnx7NInYBYJNGhm545ijOXmPG5PJ+0Vf3NJpyxWQiPFS5/18D0/eVAL57jng
 tlIfro/fzyefa7pzStFQS2+rHWQluG72uKIG4cVLU5AgRMje5I45jxIjNMQeETp8MZH2
 qGQcpw8VturBpfuirdeqr9c124vzXTDw1zlq3NVQ/xx8sHPvrbNZmapL0k4MW7Tg1yrY
 GrFUa4G6pRqtjxufOt86mHF/K7CarQ10IyDcYqRJyR4tfqsDatHAQRNGU/BifK5vfIyW
 8qvfaHXLlcayByo/SR1fJAh9EiBha1jkpc7wZbduXAVsVSoZoj7O8IEMKhUYk/wu6+Pt
 EXFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pi2eGcMT6rMjNmHfTn+6C3a0PNU3Dbjr1+RHlUDbfdE=;
 b=geOzj91S6bNHvx9QV/X+AjG5CefzxiiQyu2hGQ8P6r8lY72QzDKaDuJnDae+H5x12b
 r5Jgs3fxhHOtQkQKZ7uqV2kNil27/zhhcflRz9VHfPudKUZ73J70+XMdZgQrE+qJj7PZ
 xRlqnKTrgAvIjdGwXdU6cGb6S0zgslwK+xoGeN/6MNLgdtmyQ5bdGHMC4DKP35vrTGCY
 SyNaRr/ayJ1TORxwgp1yh0jwtZb3Mjz3Mkxwdlt50EUn8Bat4pDdChA3Ej7kC5V5F6ld
 mcw+MamMSp0teBs9X7ppNVwaZWdt+XRneG2eWtY2ultKsQpyAEj1/uN5IxOt+nyn0VJu
 xrOA==
X-Gm-Message-State: AGi0PuYChkFbZz0NLzIHJFG1RuLLzrVOLo02wECfgxCf6JvN59Nsfbb/
 Lv4GBVHF1gMJQhhXc2o40NcsVLYwxxf9IOwSz+29RA==
X-Google-Smtp-Source: APiQypKSnJq3GtI7I8370QcKOEbJus5EhyZKwcJPbeC4yoZidoU3fP1OuuptUIClEnTd5eWt4D57NVWQjScrvdMRcpQ=
X-Received: by 2002:a9f:25af:: with SMTP id 44mr3566481uaf.104.1586940394324; 
 Wed, 15 Apr 2020 01:46:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200401195722.208157-1-marex@denx.de>
 <20200401195722.208157-3-marex@denx.de>
In-Reply-To: <20200401195722.208157-3-marex@denx.de>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 15 Apr 2020 10:45:58 +0200
Message-ID: <CAPDyKFpzM5NWR3D5uEmNu3hdhtr-vkucWNsCb2npd1eyR+=T_w@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Russell King <linux@armlinux.org.uk>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 3/3] mmc: mmci: Switch to
	mmc_set_signal_voltage()
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

On Wed, 1 Apr 2020 at 21:57, Marek Vasut <marex@denx.de> wrote:
>
> Instead of reimplementing the logic in mmc_set_signal_voltage(),
> use the mmc code function directly.

Again, this isn't about mmc_set_signal_voltage() but about
mmc_regulator_set_vqmmc(). Please update the changelog to reflect
that.

>
> This fixes a real issue on STM32MP1 where, if the eMMC is supplied with
> VccQ=1.8 V, the post voltage switch code will spin indefinitelly waiting
> for the voltage switch to complete, even though no voltage switch really
> happened. But since mmc_set_signal_voltage() would return 0, then the
> condition for calling .post_sig_volt_switch() is not satisfied if the
> switch did not happen.
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
>  drivers/mmc/host/mmci.c | 28 ++++++----------------------
>  1 file changed, 6 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
> index 647567def612..b8c8f0e623de 100644
> --- a/drivers/mmc/host/mmci.c
> +++ b/drivers/mmc/host/mmci.c
> @@ -1861,31 +1861,15 @@ static int mmci_get_cd(struct mmc_host *mmc)
>  static int mmci_sig_volt_switch(struct mmc_host *mmc, struct mmc_ios *ios)
>  {
>         struct mmci_host *host = mmc_priv(mmc);
> -       int ret = 0;
> -
> -       if (!IS_ERR(mmc->supply.vqmmc)) {
> +       int ret;
>
> -               switch (ios->signal_voltage) {
> -               case MMC_SIGNAL_VOLTAGE_330:
> -                       ret = regulator_set_voltage(mmc->supply.vqmmc,
> -                                               2700000, 3600000);
> -                       break;
> -               case MMC_SIGNAL_VOLTAGE_180:
> -                       ret = regulator_set_voltage(mmc->supply.vqmmc,
> -                                               1700000, 1950000);
> -                       break;
> -               case MMC_SIGNAL_VOLTAGE_120:
> -                       ret = regulator_set_voltage(mmc->supply.vqmmc,
> -                                               1100000, 1300000);
> -                       break;
> -               }
> +       ret = mmc_regulator_set_vqmmc(mmc, ios);
>
> -               if (!ret && host->ops && host->ops->post_sig_volt_switch)
> -                       ret = host->ops->post_sig_volt_switch(host, ios);
> +       if (!ret && host->ops && host->ops->post_sig_volt_switch)

I would suggest to add a comment here somewhere, that you explicitly
want to avoid calling the ->post_sig_volt_switch() unless the voltage
really changed. Just to make this clear.

> +               ret = host->ops->post_sig_volt_switch(host, ios);
>
> -               if (ret)
> -                       dev_warn(mmc_dev(mmc), "Voltage switch failed\n");
> -       }
> +       if (ret < 0)
> +               dev_warn(mmc_dev(mmc), "Voltage switch failed\n");
>
>         return ret;
>  }
> --
> 2.25.1
>

Kind regards
Uffe
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
