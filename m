Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F36B7A0379
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Sep 2023 14:13:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 53BD2C65E4F;
	Thu, 14 Sep 2023 12:13:17 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B300FC65E42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Sep 2023 12:13:15 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-500913779f5so1481198e87.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Sep 2023 05:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694693595; x=1695298395;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=vAsYiYV8tZEJujkaxJ088mOxaTtmj4YYmIGTa7ifbAU=;
 b=k2RqF0Jl9NobNiVYk1eJJhNKlNRDWs1PmI5SHCpaHmFxN9yMm41/YT7DTnnSdDQ6mw
 /CDTAJ9/sjW+dJlmBqmjL7+kXX0wO7LHo9RXYcDXjGNxAIwvXugvDA0mR4J/Z5qXl7gv
 7uzqkYTI8iLCJ6plulTj1Ktl8+I64MbN98Vr8PWBene+DyDYxi+KL/EvIXo2qcSj4dm3
 Di2lqNZOkAN/QQt2up6ZH5ZNy/h5Uqo0S2FeeZGSnbZU45TJfmNqiscMPbU6m0XXv0Q1
 aWFeBIbOkPsN0YbVmrpOLahA6os7UW7JkGysCuWtEG6X7lGB/vLrnNMmYcvAKJwzLHQh
 lloA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694693595; x=1695298395;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vAsYiYV8tZEJujkaxJ088mOxaTtmj4YYmIGTa7ifbAU=;
 b=IGT3X9GHFObJHBaL9QD5IOc0bxFajUnJ63a34E22ZZQSroQ6CYNhoIMnVTH3pseloy
 +AJn0FDvw3eiFTjvRbI82o4/WSZ+bHr01hj4nC9aUnodWVpPS2n38hoe3AUX+50wSpFF
 QcxQ/1e6GX+zod9Grs27GN0hHsOIqrQ3IHBDQNYLWJSUgSKEfZuWkdDOdrtiGTR/MrsB
 IO7cxhhvA/lBlk6gI5OWPo0C5Zqht6DdvP2bQ67wVUoOFmK8zlfhJhfzNlGMrvsJJae2
 RaQdqYbjAWvUOCknLVbnO6NX9QHmpCAWESvfNMAeY5QT2WV/b+5SdDDnQZv4sUdVwvBg
 /3jg==
X-Gm-Message-State: AOJu0YwlDrIgKHIRhKUgEwQuqDQXr01XxRfY6bD+oWyLaptHDdNrOrzF
 lSYsuj0q+9ujlnSmHIqrn/Y=
X-Google-Smtp-Source: AGHT+IHJQlpkWJPHB3PuWrwV6GkiZ4fG9hPIJaNch03+5NJJ1+qqAh4Z3XjEdSE2rPlt0z+Nw8Lv4Q==
X-Received: by 2002:a05:6512:1048:b0:500:a0a3:80ff with SMTP id
 c8-20020a056512104800b00500a0a380ffmr5741069lfb.58.1694693594533; 
 Thu, 14 Sep 2023 05:13:14 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 w30-20020a05651204de00b00502a770394dsm254986lfq.100.2023.09.14.05.13.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 05:13:14 -0700 (PDT)
Date: Thu, 14 Sep 2023 15:13:10 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <tgurnug3ftp53gui6wwz25lo77b52clgmoqvgq5dcps2fi2xv5@uzzqvtoogy3i>
References: <ZP8yEFWn0Ml3ALWq@shell.armlinux.org.uk>
 <E1qfir2-007TPt-Uw@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1qfir2-007TPt-Uw@rmk-PC.armlinux.org.uk>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Eric Dumazet <edumazet@google.com>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>, Jose Abreu <joabreu@synopsys.com>,
 Samin Guo <samin.guo@starfivetech.com>, NXP Linux Team <linux-imx@nxp.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Alexei Starovoitov <ast@kernel.org>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>, bpf@vger.kernel.org,
 Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next 6/6] net: stmmac: qos-eth: use
 dwmac_set_tx_clk_gmii()
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

On Mon, Sep 11, 2023 at 04:29:36PM +0100, Russell King (Oracle) wrote:
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  .../stmicro/stmmac/dwmac-dwc-qos-eth.c        | 37 ++++++-------------
>  1 file changed, 11 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
> index 61ebf36da13d..a8fae37b9858 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
> @@ -22,6 +22,7 @@
>  #include <linux/stmmac.h>
>  
>  #include "stmmac_platform.h"
> +#include "stmmac_plat_lib.h"
>  #include "dwmac4.h"
>  
>  struct tegra_eqos {
> @@ -181,32 +182,10 @@ static void dwc_qos_remove(struct platform_device *pdev)
>  static void tegra_eqos_fix_speed(void *priv, unsigned int speed, unsigned int mode)
>  {
>  	struct tegra_eqos *eqos = priv;
> -	unsigned long rate = 125000000;
> -	bool needs_calibration = false;
>  	u32 value;
>  	int err;
>  
> -	switch (speed) {
> -	case SPEED_1000:
> -		needs_calibration = true;
> -		rate = 125000000;
> -		break;
> -
> -	case SPEED_100:
> -		needs_calibration = true;
> -		rate = 25000000;
> -		break;
> -
> -	case SPEED_10:
> -		rate = 2500000;
> -		break;
> -
> -	default:
> -		dev_err(eqos->dev, "invalid speed %u\n", speed);
> -		break;
> -	}
> -
> -	if (needs_calibration) {
> +	if (speed == SPEED_1000 || speed == SPEED_100) {
>  		/* calibrate */
>  		value = readl(eqos->regs + SDMEMCOMPPADCTRL);
>  		value |= SDMEMCOMPPADCTRL_PAD_E_INPUT_OR_E_PWRD;
> @@ -246,9 +225,15 @@ static void tegra_eqos_fix_speed(void *priv, unsigned int speed, unsigned int mo
>  		writel(value, eqos->regs + AUTO_CAL_CONFIG);
>  	}
>  
> -	err = clk_set_rate(eqos->clk_tx, rate);
> -	if (err < 0)
> -		dev_err(eqos->dev, "failed to set TX rate: %d\n", err);
> +	err = dwmac_set_tx_clk_gmii(eqos->clk_tx, speed);
> +	if (err == -ENOTSUPP) {

> +		dev_err(eqos->dev, "invalid speed %dMbps\n", speed);

%u?

> +		err = dwmac_set_tx_clk_gmii(eqos->clk_tx, SPEED_1000);
> +	} else if (err) {
> +		dev_err(eqos->dev,

> +			"failed to set tx rate for speed %dMbps: %pe\n",

ditto

-Serge(y)

> +			speed, ERR_PTR(err));
> +	}
>  }
>  
>  static int tegra_eqos_init(struct platform_device *pdev, void *priv)
> -- 
> 2.30.2
> 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
