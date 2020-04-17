Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 166E71AD9EF
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Apr 2020 11:31:41 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D2B42C36B0E;
	Fri, 17 Apr 2020 09:31:40 +0000 (UTC)
Received: from mail-vs1-f68.google.com (mail-vs1-f68.google.com
 [209.85.217.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EA52BC36B0F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Apr 2020 09:31:39 +0000 (UTC)
Received: by mail-vs1-f68.google.com with SMTP id t189so763023vst.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Apr 2020 02:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=q0aSjy2QOsrn6AAD6OOfgGlIxwNu+4cSpUbiuSms0Dc=;
 b=xS4HBIu71wfGR/iPAXJMPcODEpgrvBKDhe77V0qBmi/BHbHV2AIiMJ6eNKRzg53euC
 ZJNJQNvLRBxwFtFRzf3YI718Ptc2casxzbzqTm3j1Uj/6tvAwLCe15blFv/zVz+bosAU
 6jsKmbWcTL1+9ppYiBP6M3XKBdxDjpFa4KgpqubzDQMML514rt8yx+WjF0rYD2C013Kc
 Ji5T2YVbBM1Rs9Vk/OZKxsxvuSQPEswYCYB+wqyOMuPe/bblcmSAx/Vej6jjBdVHuf7p
 PXANcz1Fz+bHzmz5nglSoxuICOtYDmi/c6UrRMZv9pG7Wv62pS5qGByGrT2CJV7a4+Lq
 masg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=q0aSjy2QOsrn6AAD6OOfgGlIxwNu+4cSpUbiuSms0Dc=;
 b=hMQHG6mLDxR3mv9LHwbrZ1A9ZmWylm2eZyeVwy6upnrdjiHXjvjA+Q3wjfYWOzOhL9
 MJ2M2sB13IWffrvnd0uQuR6dPwR3NfeTL8M4ZgwRkuyOQejAOFABF5ELfISA/UQVEw03
 JN/s/zhrZSBPhP9k6VGRFBFqlaEl3vY9ZzJyUdcfmR5WnQzetaTod2hn59or4hSkcvnS
 LTluML2Fm8t5s0LkwSZfi4hcgXwQZ6P16M6gYb24VuiAG3l0JIWoFFUDpAuupsTB94DF
 OLm+4XgR2zcf6BGAWgjV527XF1ZMwyvhmEs9b0Rj0/VktCvtin+oRJeyTBY7jdDx+Tr0
 oTbw==
X-Gm-Message-State: AGi0PuatK98jfefHq7wzbIqZnPjuxuBss8LywFCKDLjKZvBaENpQ+ZsD
 +vSH+13tq7m6HmNEuo0u0IapJiOv2NMi0061FcQrIA==
X-Google-Smtp-Source: APiQypIp1ugP42rOqgprumhzqVWrTryT0OlLGRabY/doq9mNiw6w1Qx8z2Pe0Z+flU3goFiuTQLvceVcfXzeb6DeSAQ=
X-Received: by 2002:a67:ead1:: with SMTP id s17mr1471283vso.200.1587115898847; 
 Fri, 17 Apr 2020 02:31:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200416163649.336967-1-marex@denx.de>
 <20200416163649.336967-3-marex@denx.de>
In-Reply-To: <20200416163649.336967-3-marex@denx.de>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 17 Apr 2020 11:31:02 +0200
Message-ID: <CAPDyKFrwqiBFcM71x-89h9HsVMhYGTKkciVZALtPVommc9sEQA@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Russell King <linux@armlinux.org.uk>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH V2 3/3] mmc: mmci: Switch to
	mmc_regulator_set_vqmmc()
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

On Thu, 16 Apr 2020 at 18:37, Marek Vasut <marex@denx.de> wrote:
>
> Instead of reimplementing the logic in mmc_regulator_set_vqmmc(),
> use the mmc code function directly.
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

Applied for next, thanks!

I did some additional amendments  to the commit message, just tell me
if you want some additional changes on top.

Kind regards
Uffe


> ---
> V2: Reword commit message
> ---
>  drivers/mmc/host/mmci.c | 30 ++++++++----------------------
>  1 file changed, 8 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
> index 647567def612..a69d6a0c2e15 100644
> --- a/drivers/mmc/host/mmci.c
> +++ b/drivers/mmc/host/mmci.c
> @@ -1861,31 +1861,17 @@ static int mmci_get_cd(struct mmc_host *mmc)
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
> +               ret = host->ops->post_sig_volt_switch(host, ios);
> +       else if (ret)
> +               ret = 0;
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
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
