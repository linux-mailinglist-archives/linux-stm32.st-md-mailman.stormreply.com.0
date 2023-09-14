Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B157A0774
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Sep 2023 16:37:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D8259C6A5EF;
	Thu, 14 Sep 2023 14:37:18 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BB901C65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Sep 2023 14:37:17 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-5029e4bfa22so1780276e87.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Sep 2023 07:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694702237; x=1695307037;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=0kK+0I3XIPPrGhkB0om7mc8r7QRJGhz7r+ekae91Iis=;
 b=MclHkU2VtTujNH5aqhQLJLK80SJkwkVdWmmqpgxSS5iHsfdRhw1/o81VvnLTbouzSD
 cZ8AJZcfvQXbde236FB8CTQgog1Nf0qCqSSI/zG59BDBdnzlhFmRioSKY2n1+Xq1AXUb
 duvISTB26ToxAGjZbJGIgliLVykYYyhtDZ6eGQxZaUAj3SX33Dy70DtwOrkCAsetj5a8
 WnxQZ/QiNc6KCNcUnuny0ThxwjkNBOG/nraQtklw//bVBAio8NTgWnp5v6zl5zEpZpDn
 24dKw4xUPBz8bJWAocygdDz6iHdHntg8LKlDwqLr5jAsJ3VbKnGMmVJigeW2vxRlGAtI
 z7yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694702237; x=1695307037;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0kK+0I3XIPPrGhkB0om7mc8r7QRJGhz7r+ekae91Iis=;
 b=OFLVIk/MNpawlgfobWiDT0OBto5m8atS6hNXksJEJ1/P83ME3pX944quCLCPNn0Ti6
 x9n0m3o5QpDDDbc199tRHxgSFTw1oKAjzkrG6KeTN5lRJt8rhmNsIGU4w/Jfh00aTYaV
 dCTdTr3lKPRTgsWAECssd6FK4Xg97RRLxtag0EZ9FeVV/kRiIxkLulUw6c6wDJ9an4s3
 /AISI5+dAznJBGN/vFR2OWIUhUu5CSeEueQ7jsNMbTUqGY9aH+Hgcsq3ZPd2oFQKaJXG
 dSqVi0sdE1TF5WJMBx9Kv+jDFkD49T2s0XhWqHhobZmrcDdxL/LO/u1vxhcYCZpSaJxb
 PC0w==
X-Gm-Message-State: AOJu0YyUkYC+IDfti4Tp79gHPN5wiZY7gJzo3+Z7YeA0pNR3Iolp1RKO
 Ed1B7mAiM8mqpO6ztc5H1z0=
X-Google-Smtp-Source: AGHT+IHTmVRi837uQB0y/sPX3uJQ+hm834yJYSetnbihr9kUbQUqybyp46P9VrQu9i5XR2Nx0h4Cgw==
X-Received: by 2002:a19:2d54:0:b0:4fe:d0f:1f1e with SMTP id
 t20-20020a192d54000000b004fe0d0f1f1emr3971532lft.25.1694702236523; 
 Thu, 14 Sep 2023 07:37:16 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 er20-20020a05651248d400b004fe2503e31bsm295007lfb.157.2023.09.14.07.37.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 07:37:16 -0700 (PDT)
Date: Thu, 14 Sep 2023 17:37:13 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <7vhtvd25qswsju34lgqi4em5v3utsxlvi3lltyt5yqqecddpyh@c5yvk7t5k5zz>
References: <ZQMPnyutz6T23E8T@shell.armlinux.org.uk>
 <E1qgmkp-007Z4s-GL@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1qgmkp-007Z4s-GL@rmk-PC.armlinux.org.uk>
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
Subject: Re: [Linux-stm32] [PATCH net-next 4/6] net: stmmac: rk: use
 stmmac_set_tx_clk_gmii()
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

On Thu, Sep 14, 2023 at 02:51:35PM +0100, Russell King (Oracle) wrote:
> Use stmmac_set_tx_clk_gmii().
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  .../net/ethernet/stmicro/stmmac/dwmac-rk.c    | 60 +++++--------------
>  1 file changed, 16 insertions(+), 44 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> index d920a50dd16c..5731a73466eb 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> @@ -1081,28 +1081,14 @@ static void rk3568_set_gmac_speed(struct rk_priv_data *bsp_priv, int speed)
>  {
>  	struct clk *clk_mac_speed = bsp_priv->clks[RK_CLK_MAC_SPEED].clk;
>  	struct device *dev = &bsp_priv->pdev->dev;
> -	unsigned long rate;
> -	int ret;
> -
> -	switch (speed) {
> -	case 10:
> -		rate = 2500000;
> -		break;
> -	case 100:
> -		rate = 25000000;
> -		break;
> -	case 1000:
> -		rate = 125000000;
> -		break;
> -	default:
> -		dev_err(dev, "unknown speed value for GMAC speed=%d", speed);
> -		return;
> -	}
> -
> -	ret = clk_set_rate(clk_mac_speed, rate);
> -	if (ret)
> -		dev_err(dev, "%s: set clk_mac_speed rate %ld failed %d\n",
> -			__func__, rate, ret);
> +	int err;
> +
> +	err = stmmac_set_tx_clk_gmii(clk_mac_speed, speed);
> +	if (err == -ENOTSUPP)

> +		dev_err(dev, "invalid speed %uMbps\n", speed);
> +	else if (err)
> +		dev_err(dev, "failed to set tx rate for speed %uMbps: %pe\n",

These type specifiers should have been '%d' since the speed variable
is of the signed integer type here.

-Serge(y)

> +			speed, ERR_PTR(err));
>  }
>  
>  static const struct rk_gmac_ops rk3568_ops = {
> @@ -1387,28 +1373,14 @@ static void rv1126_set_rgmii_speed(struct rk_priv_data *bsp_priv, int speed)
>  {
>  	struct clk *clk_mac_speed = bsp_priv->clks[RK_CLK_MAC_SPEED].clk;
>  	struct device *dev = &bsp_priv->pdev->dev;
> -	unsigned long rate;
> -	int ret;
> -
> -	switch (speed) {
> -	case 10:
> -		rate = 2500000;
> -		break;
> -	case 100:
> -		rate = 25000000;
> -		break;
> -	case 1000:
> -		rate = 125000000;
> -		break;
> -	default:
> -		dev_err(dev, "unknown speed value for RGMII speed=%d", speed);
> -		return;
> -	}
> -
> -	ret = clk_set_rate(clk_mac_speed, rate);
> -	if (ret)
> -		dev_err(dev, "%s: set clk_mac_speed rate %ld failed %d\n",
> -			__func__, rate, ret);
> +	int err;
> +
> +	err = stmmac_set_tx_clk_gmii(clk_mac_speed, speed);
> +	if (err == -ENOTSUPP)
> +		dev_err(dev, "invalid speed %dMbps\n", speed);
> +	else if (err)
> +		dev_err(dev, "failed to set tx rate for speed %dMbps: %pe\n",
> +			speed, ERR_PTR(err));
>  }
>  
>  static void rv1126_set_rmii_speed(struct rk_priv_data *bsp_priv, int speed)
> -- 
> 2.30.2
> 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
