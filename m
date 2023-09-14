Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD9F7A0365
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Sep 2023 14:10:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2124DC65E4F;
	Thu, 14 Sep 2023 12:10:57 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 95784C65E42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Sep 2023 12:10:55 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2bfbd7d49e7so13610611fa.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Sep 2023 05:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694693455; x=1695298255;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=7aKtSNYkSgQY2J6i547Jd7QXH1uxzB1IpES5c19CajI=;
 b=sThOgZjNsveAha4RYJpxCz3ULYdYlil9Zxim2m02cwnt7DiBiDRKv/oJaFRcn+/6EH
 nSSvYKSGh3Yd9GgpafCGlZWFvruoLil0oH7DeKsfVRNRhErEfo+o1LZYqhTjSaHg0Mrw
 chePTpw3vHshR2++nkZvPf24Y5snzumw83bHkH7Ox3afEqv/pTlz7URYDuBZcReFXT8D
 ycUcGbSYvTNoN4FWnSPf2MhEhzgUNmQBkCaobHwNAf8SHriIBndk84b/CA9DsdBgbkm7
 Om8TNpUiMCGXe64Ak0U3apkj3xoTo0NBE0GqNo1is7S4Jg+oqmEt3cx1mWJC0ACIpMye
 oZEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694693455; x=1695298255;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7aKtSNYkSgQY2J6i547Jd7QXH1uxzB1IpES5c19CajI=;
 b=v0t2FJVQc/71vP33RvhtL/kcGCiUBMtnvyIakNHZgEWvzTmTjlRL33Xru+kjjTPvcw
 EV9XdRhinjo1FsYBd6PptJr50Uwi/ezeB2HeyOtDY4B8PhYuCWoGxnIKGuOwxoRpXFdQ
 0TUq7ct22fSAxcIp39hggPIk3y1DnClY3xU40YMfRygFopHiVgOWhY3Q99vxvZaP0Z71
 cfSIgycpqay7CqF6lhLvxzMFxumrWfzJ9CcZo35k6a/CWEdCFvBxEs2gyzq2lr/3FTei
 Q0hOrwchQmv56KrTDxKf/ZVSq3AlxiahecA7MlfuS9m5neXhHrRIdOeOOYR3sSNwiRb+
 6+fw==
X-Gm-Message-State: AOJu0Yw9QBoSiz4jqJDqBWA87baYEcBrrCwXITYsw5EbCoM9YWpGeO/K
 zWaylWRUR+kTy1I7H4Ij0Lo=
X-Google-Smtp-Source: AGHT+IGihqamIC850c7IDzep4Y7BNXFBsVsUMYyKlHuV9pJ93oyclkxhqDUhCoOKgKB8oHTAh18lTg==
X-Received: by 2002:a2e:9992:0:b0:2bf:a0d1:b112 with SMTP id
 w18-20020a2e9992000000b002bfa0d1b112mr5100013lji.39.1694693454513; 
 Thu, 14 Sep 2023 05:10:54 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 w12-20020a2e998c000000b002b9e346a152sm259058lji.96.2023.09.14.05.10.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 05:10:54 -0700 (PDT)
Date: Thu, 14 Sep 2023 15:10:51 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <c5hcpyvk75oaqp7xmrx2ql7m4aa3xgk6oifx6y5c33slkeujmh@leiy6uvhft5k>
References: <ZP8yEFWn0Ml3ALWq@shell.armlinux.org.uk>
 <E1qfiqx-007TPm-QD@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1qfiqx-007TPm-QD@rmk-PC.armlinux.org.uk>
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
Subject: Re: [Linux-stm32] [PATCH net-next 5/6] net: stmmac: starfive: use
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

On Mon, Sep 11, 2023 at 04:29:31PM +0100, Russell King (Oracle) wrote:
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  .../ethernet/stmicro/stmmac/dwmac-starfive.c  | 29 +++++--------------
>  1 file changed, 8 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
> index 9289bb87c3e3..3dc04017e3d3 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
> @@ -14,6 +14,7 @@
>  #include <linux/regmap.h>
>  
>  #include "stmmac_platform.h"
> +#include "stmmac_plat_lib.h"
>  
>  #define STARFIVE_DWMAC_PHY_INFT_RGMII	0x1
>  #define STARFIVE_DWMAC_PHY_INFT_RMII	0x4
> @@ -27,29 +28,15 @@ struct starfive_dwmac {
>  static void starfive_dwmac_fix_mac_speed(void *priv, unsigned int speed, unsigned int mode)
>  {
>  	struct starfive_dwmac *dwmac = priv;
> -	unsigned long rate;
>  	int err;
>  
> -	rate = clk_get_rate(dwmac->clk_tx);
> -
> -	switch (speed) {
> -	case SPEED_1000:
> -		rate = 125000000;
> -		break;
> -	case SPEED_100:
> -		rate = 25000000;
> -		break;
> -	case SPEED_10:
> -		rate = 2500000;
> -		break;
> -	default:
> -		dev_err(dwmac->dev, "invalid speed %u\n", speed);
> -		break;
> -	}
> -
> -	err = clk_set_rate(dwmac->clk_tx, rate);
> -	if (err)
> -		dev_err(dwmac->dev, "failed to set tx rate %lu\n", rate);
> +	err = dwmac_set_tx_clk_gmii(dwmac->clk_tx, speed);
> +	if (err == -ENOTSUPP)

> +		dev_err(dwmac->dev, "invalid speed %dMbps\n", speed);

%u?

> +	else if (err)
> +		dev_err(dwmac->dev,

> +			"failed to set tx rate for speed %dMbps: %pe\n",

ditto

-Serge(y)

> +			speed, ERR_PTR(err));
>  }
>  
>  static int starfive_dwmac_set_mode(struct plat_stmmacenet_data *plat_dat)
> -- 
> 2.30.2
> 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
