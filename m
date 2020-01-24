Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6101485AC
	for <lists+linux-stm32@lfdr.de>; Fri, 24 Jan 2020 14:13:17 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BB389C36B0C;
	Fri, 24 Jan 2020 13:13:16 +0000 (UTC)
Received: from mail-vk1-f194.google.com (mail-vk1-f194.google.com
 [209.85.221.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 773EDC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Jan 2020 13:13:14 +0000 (UTC)
Received: by mail-vk1-f194.google.com with SMTP id i4so594990vkc.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Jan 2020 05:13:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0pCJ51fgs/0G4N/AkTYuiiJRhKjkqBJy/ABL+0E/bFk=;
 b=P6IMwHE8uT8RMdr1P8rDQpRrJ5PNR4L4H7E0i7DQXVdviFO6LD475vzz1mjKOK1iuK
 aJERxWGDezcMiHDHs58NUqcgXYF2j4dEMNFJtigubdbAwW7CH95WNAXL9vXEb13GgBPs
 00sCtxzu+hBjYlqlOLeDYcXG887pbfo1S0Nmjo47abdHXdfRBJQ/2HfQeO8R2jInTfPp
 fARl9XjAr32zEKJOQtTZBpNlkVYlB+yb7xrkmvb0YRgdOKav0ImuGbK0XGBLOcZ9YXF/
 2YtVULLz2da5RU43io9ze0nwFBk/FX2ubwO8cG0aRikoB5nDS5N0LxFQvbKWHNVJ+8xr
 e31Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0pCJ51fgs/0G4N/AkTYuiiJRhKjkqBJy/ABL+0E/bFk=;
 b=q4FhXUNYsq692GD7qV/6fn3TjdJNWH4ytMUU5T+NtpXX+K1PYpkG1/KdnT/UFRUzMf
 dgr9qr3aMBOfuM8stxSzLpQKpBxebSVMO6Gsy+ywwsC4CBHnFb5qE9spd2GmopnVw1gM
 GeuXQirHVmKgqmTbj5TveoP1FUmgLfieNR/PNzso6rYFmEAR+OhHqLw/dCZlXMPhtLM8
 YnlkEzLn96sjHfA/vWaT3OsKnN/j86xs/UB7Z0GBBMlizIOxyYVSLqzXVesz5sX5P72a
 9FAc8whd2ZwjrtCl9MRndDzd5pAtY/xxx9+LBXkRC3wq25n7rxUrN5c1d4KlkP/ImjiR
 WcWg==
X-Gm-Message-State: APjAAAWRpwoWMdvVf+/M+SkFitg8vbq9xGEyD+SlUD78YKXeG8eOQFPR
 G5kkpvamq5/HLfI5n/IIHnPxYTHgaY5B4noIXQzW3g==
X-Google-Smtp-Source: APXvYqwvweHW+//fi2a64HFcGs84CB60rRh0VyQGFxeZ6xd6bTwXqvSw/Zs/SJ/+x6Yw0TF8Gdlx6/fNzadVplvj68g=
X-Received: by 2002:a1f:914b:: with SMTP id t72mr1847120vkd.101.1579871593005; 
 Fri, 24 Jan 2020 05:13:13 -0800 (PST)
MIME-Version: 1.0
References: <20200110134823.14882-1-ludovic.barre@st.com>
 <20200110134823.14882-8-ludovic.barre@st.com>
In-Reply-To: <20200110134823.14882-8-ludovic.barre@st.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 24 Jan 2020 14:12:36 +0100
Message-ID: <CAPDyKFqt6SuQh8V1_2-2HzBixR2HTKM+1FKgYuNA1zytc22W7g@mail.gmail.com>
To: Ludovic Barre <ludovic.barre@st.com>
Cc: DTML <devicetree@vger.kernel.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 7/9] mmc: mmci: add volt_switch callbacks
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
> This patch adds 2 voltage switch callbacks in mmci_host_ops:
> -prep_volt_switch allows to prepare voltage switch before to
>  sent the SD_SWITCH_VOLTAGE command (cmd11).
> -volt_switch callback allows to define specific action after
>  regulator set voltage.

I am fine with adding these callbacks, however I strongly suggest to
have a reference to "signal voltage" in the name of the callbacks. As
to avoid confusion for what there are used for.

Perhaps ->post_sig_volt_switch() and ->pre_sig_volt_switch() can work?

>
> Signed-off-by: Ludovic Barre <ludovic.barre@st.com>
> ---
>  drivers/mmc/host/mmci.c | 8 ++++++++
>  drivers/mmc/host/mmci.h | 2 ++
>  2 files changed, 10 insertions(+)
>
> diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
> index 00b473f57047..d76a59c06cb0 100644
> --- a/drivers/mmc/host/mmci.c
> +++ b/drivers/mmc/host/mmci.c
> @@ -22,6 +22,7 @@
>  #include <linux/mmc/pm.h>
>  #include <linux/mmc/host.h>
>  #include <linux/mmc/card.h>
> +#include <linux/mmc/sd.h>
>  #include <linux/mmc/slot-gpio.h>
>  #include <linux/amba/bus.h>
>  #include <linux/clk.h>
> @@ -1207,6 +1208,9 @@ mmci_start_command(struct mmci_host *host, struct mmc_command *cmd, u32 c)
>                 writel_relaxed(clks, host->base + MMCIDATATIMER);
>         }
>
> +       if (host->ops->prep_volt_switch && cmd->opcode == SD_SWITCH_VOLTAGE)
> +               host->ops->prep_volt_switch(host);
> +
>         if (/*interrupt*/0)
>                 c |= MCI_CPSM_INTERRUPT;
>
> @@ -1820,6 +1824,7 @@ static int mmci_get_cd(struct mmc_host *mmc)
>
>  static int mmci_sig_volt_switch(struct mmc_host *mmc, struct mmc_ios *ios)
>  {
> +       struct mmci_host *host = mmc_priv(mmc);
>         int ret = 0;
>
>         if (!IS_ERR(mmc->supply.vqmmc)) {
> @@ -1839,6 +1844,9 @@ static int mmci_sig_volt_switch(struct mmc_host *mmc, struct mmc_ios *ios)
>                         break;
>                 }
>
> +               if (!ret && host->ops && host->ops->volt_switch)
> +                       ret = host->ops->volt_switch(host, ios);
> +
>                 if (ret)
>                         dev_warn(mmc_dev(mmc), "Voltage switch failed\n");
>         }
> diff --git a/drivers/mmc/host/mmci.h b/drivers/mmc/host/mmci.h
> index ddcdfb827996..c04a144259a2 100644
> --- a/drivers/mmc/host/mmci.h
> +++ b/drivers/mmc/host/mmci.h
> @@ -377,6 +377,8 @@ struct mmci_host_ops {
>         void (*set_clkreg)(struct mmci_host *host, unsigned int desired);
>         void (*set_pwrreg)(struct mmci_host *host, unsigned int pwr);
>         bool (*busy_complete)(struct mmci_host *host, u32 status, u32 err_msk);
> +       void (*prep_volt_switch)(struct mmci_host *host);
> +       int (*volt_switch)(struct mmci_host *host, struct mmc_ios *ios);
>  };
>
>  struct mmci_host {
> --
> 2.17.1
>

Kind regards
Uffe
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
