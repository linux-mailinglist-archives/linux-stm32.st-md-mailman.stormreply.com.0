Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0684B1AD9EE
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Apr 2020 11:31:39 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C6AE1C36B0E;
	Fri, 17 Apr 2020 09:31:38 +0000 (UTC)
Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com
 [209.85.217.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 85E3BC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Apr 2020 09:31:36 +0000 (UTC)
Received: by mail-vs1-f66.google.com with SMTP id 184so772700vsu.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Apr 2020 02:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ci5hRVmjulAYrmfkyZuf4AJKD86QhaAVQJ/VV77WqoQ=;
 b=d68y2crmC1HbkvnMjQT/eWTRcxtHmWS9rILk33LCB9VweLLePg4jcXJi5kRwNkg21O
 GOxYU5OcvPUyFlwKb13An0vKKJd3Ls0kOTdhB5dd26Kn5LBPOh/i6ahtoylXaYyoxBuk
 ZOfVTis8aK5SSn1ctoSQrAMWq3D6943dRoQcoLQXgBWVIxsoCvWCwqddoG02WKfp9s3e
 oEJDprW5WL5tzFeSreG3a9Hr9O+p4uPqPNh7YOZTidLPuFzqfG6VYoM0G+weVuBdmmGT
 ReGjRdRuM+OD0xZ+7AO43qX6iZnKQF4bEz7l4Ix3mL4eaqSvxpAnTPbK1GQEimpq0vIY
 jEwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ci5hRVmjulAYrmfkyZuf4AJKD86QhaAVQJ/VV77WqoQ=;
 b=D3+B8zChhq7CBe+eWnjNpBh5+rWUOmEHTJbEDJmuwuJz/XkhJea6m0vGNFvq+L3UCp
 PLtIU9k9KWuxhGPlPV3HI5O9ZTGI+9JhWIUNfP89QToGVcF29CpQXrLK05rsxzmNRIfK
 MdIXtdD72igAtneakm7x52NOG7p7HtPjawN1L9k8F3leImWLZMkat1WLpBx2LAVzdtQb
 Z++m4G34FgijiEOdhtemaSVatvmhpARBw4n1J3PjRVP/TJtCaAQkInIOJblGnkSMoCUt
 2R+7bkkHXBSZ1gniHSMU2IeQfnh44jDslQ6hTtpCJh12xFxTW6RUWNhBoacZu5L3ZjXt
 rVeg==
X-Gm-Message-State: AGi0PuZq15Trnnh4QcqJeBrzSDpTGshTvPiMs1iDJkObRBLkzs2cP3my
 Sz/lEmDNM0c8a+Otic5W19Yi1CMpdfesVxvymZHv5w==
X-Google-Smtp-Source: APiQypLY46DGg3PN3KuNcbkFlSLFXabZFqXY+yuTgvqOWw9NiSNZtZojeFE0mb5c64prIq2CaKoIhi9LDSNBVE46VhM=
X-Received: by 2002:a67:11c4:: with SMTP id 187mr1463592vsr.34.1587115895484; 
 Fri, 17 Apr 2020 02:31:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200416163649.336967-1-marex@denx.de>
 <20200416163649.336967-2-marex@denx.de>
In-Reply-To: <20200416163649.336967-2-marex@denx.de>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 17 Apr 2020 11:30:59 +0200
Message-ID: <CAPDyKFpf5E6AmnLNt=6kmnYK3JzsrMgeY+7XSFb=8HsMeyaQ8A@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 Russell King <linux@armlinux.org.uk>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH V2 2/3] mmc: Return 1 from
 mmc_regulator_set_vqmmc() if switch skipped
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
> Adjust mmc_regulator_set_vqmmc() to return 1 if the voltage switch was
> skipped because the regulator voltage was already correct. This allows
> drivers to detect such condition and possibly skip various voltage
> switching extras.
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

Kind regards
Uffe


> ---
> V2: - Rename variable curr_voltage to current_uV
>     - Update mmc_regulator_set_vqmmc() to handle the fact that
>       mmc_regulator_set_voltage_if_supported() can return value > 0
> ---
>  drivers/mmc/core/regulator.c | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/mmc/core/regulator.c b/drivers/mmc/core/regulator.c
> index b6febbcf8978..96b1d15045d6 100644
> --- a/drivers/mmc/core/regulator.c
> +++ b/drivers/mmc/core/regulator.c
> @@ -136,6 +136,8 @@ static int mmc_regulator_set_voltage_if_supported(struct regulator *regulator,
>                                                   int min_uV, int target_uV,
>                                                   int max_uV)
>  {
> +       int current_uV;
> +
>         /*
>          * Check if supported first to avoid errors since we may try several
>          * signal levels during power up and don't want to show errors.
> @@ -143,6 +145,14 @@ static int mmc_regulator_set_voltage_if_supported(struct regulator *regulator,
>         if (!regulator_is_supported_voltage(regulator, min_uV, max_uV))
>                 return -EINVAL;
>
> +       /*
> +        * The voltage is already set, no need to switch.
> +        * Return 1 to indicate that no switch happened.
> +        */
> +       current_uV = regulator_get_voltage(regulator);
> +       if (current_uV == target_uV)
> +               return 1;
> +
>         return regulator_set_voltage_triplet(regulator, min_uV, target_uV,
>                                              max_uV);
>  }
> @@ -198,9 +208,10 @@ int mmc_regulator_set_vqmmc(struct mmc_host *mmc, struct mmc_ios *ios)
>                  * voltage in two steps and try to stay close to vmmc
>                  * with a 0.3V tolerance at first.
>                  */
> -               if (!mmc_regulator_set_voltage_if_supported(mmc->supply.vqmmc,
> -                                               min_uV, volt, max_uV))
> -                       return 0;
> +               ret = mmc_regulator_set_voltage_if_supported(mmc->supply.vqmmc,
> +                                                       min_uV, volt, max_uV);
> +               if (ret >= 0)
> +                       return ret;
>
>                 return mmc_regulator_set_voltage_if_supported(mmc->supply.vqmmc,
>                                                 2700000, volt, 3600000);
> --
> 2.25.1
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
