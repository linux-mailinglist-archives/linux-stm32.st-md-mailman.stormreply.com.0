Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7F87A083F
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Sep 2023 16:59:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 423E9C6A5EF;
	Thu, 14 Sep 2023 14:59:26 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 98657C65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Sep 2023 14:59:25 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-2b962535808so17577911fa.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Sep 2023 07:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694703565; x=1695308365;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=P04WG88Wo2c56ytR9EOBbiCvX5TYufst4cyL+X2QRd0=;
 b=Cp8y6Wxzx+NWNZLSaE2iLMJY+bk8xkDYpwAVLCvk8Y3vqjox7KwMVDYzM1A1I8twyu
 JIiRStylK1rzPK1DCXK3Yb8rbQJgnCsTr+zNz2HbXCBT5Y1LcPJohfHr7MzJE35+BY5T
 i9RXKBdbK4IwByrAsCB5iOslJ4/nilYjPDPEUolgDjj7MJsTm+jhBW1afvR9R7RWtsZi
 g7RgGBDtYiN4XjTZiMSOHk41aLRHs2TwhqoD68+fNwVL2JW6hV8PYNoTXxMghzuaiRpf
 ffuLQR373zuZvU1PVpg5b35XA4f0A06u166pVXaXZEoeaDGeVzMzg4JxBNWvurMN6sGM
 0PMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694703565; x=1695308365;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P04WG88Wo2c56ytR9EOBbiCvX5TYufst4cyL+X2QRd0=;
 b=mBharKqYiTB01c7JF5YEcOrGGMG5o2z5iPxecTKu5iu1N27DeFfxcPOrYnhAdRr6kF
 omjL755d6RlBaWLHJ43Nc2+UM4okpUoZ7hfGC6F7Nz3BglVKgkZJqOr5UAyuhWEeZnt3
 wGVDnnswpFkhzgFoi5vOWJ4vjGjopH/cAQVcZWrtX/D5sXGIjTG0BEIffap7G+wUcXWK
 HWNK7kqk7XQ1Vs0lIJfQIP48xp+ybWhniShYbNM6Sq78SctMEpD4zhqjqr62eh7RIyUk
 nHnYlVEVHcCyq+jeUaSEOTSv8XmuQEK2pu4G/Jxl6yimLbV0nPP0qNLQNCkRfTkQZBQE
 E5xw==
X-Gm-Message-State: AOJu0YxtKmY3wpRPpAHKmKJDb2PWh0Ny+IqReOmMgpS2I57P0k26kI9O
 9gSqhHxTdVYnQvD67lp8bYM=
X-Google-Smtp-Source: AGHT+IGNNdFQMH/+tzgStqRvc1g1A12yjXACKfBcU/EzQoqxviIszf08YeT78xSUiI8hQqNSlEEJaA==
X-Received: by 2002:a05:6512:559:b0:500:a00e:1415 with SMTP id
 h25-20020a056512055900b00500a00e1415mr4057629lfl.35.1694703564544; 
 Thu, 14 Sep 2023 07:59:24 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
 by smtp.gmail.com with ESMTPSA id
 n22-20020ac242d6000000b004fbc6a8ad08sm304185lfl.306.2023.09.14.07.59.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 07:59:24 -0700 (PDT)
Date: Thu, 14 Sep 2023 17:59:21 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <dzkuxule24yqekmor73rmmhtsg2vlqsupt7xtag4t3mzazksl7@dqpe5qmccsre>
References: <ZQMPnyutz6T23E8T@shell.armlinux.org.uk>
 <E1qgmkf-007Z4f-6i@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1qgmkf-007Z4f-6i@rmk-PC.armlinux.org.uk>
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
Subject: Re: [Linux-stm32] [PATCH net-next 2/6] net: stmmac: imx: use
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

On Thu, Sep 14, 2023 at 02:51:25PM +0100, Russell King (Oracle) wrote:
> Use stmmac_set_tx_clk_gmii().
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Serge Semin <fancer.lancer@gmail.com>

-Serge(y)

> ---
>  .../net/ethernet/stmicro/stmmac/dwmac-imx.c   | 26 +++++--------------
>  1 file changed, 7 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
> index df34e34cc14f..cb56f9523acc 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
> @@ -186,7 +186,6 @@ static void imx_dwmac_fix_speed(void *priv, unsigned int speed, unsigned int mod
>  {
>  	struct plat_stmmacenet_data *plat_dat;
>  	struct imx_priv_data *dwmac = priv;
> -	unsigned long rate;
>  	int err;
>  
>  	plat_dat = dwmac->plat_dat;
> @@ -196,24 +195,13 @@ static void imx_dwmac_fix_speed(void *priv, unsigned int speed, unsigned int mod
>  	    (plat_dat->mac_interface == PHY_INTERFACE_MODE_MII))
>  		return;
>  
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
> -		return;
> -	}
> -
> -	err = clk_set_rate(dwmac->clk_tx, rate);
> -	if (err < 0)
> -		dev_err(dwmac->dev, "failed to set tx rate %lu\n", rate);
> +	err = stmmac_set_tx_clk_gmii(dwmac->clk_tx, speed);
> +	if (err == -ENOTSUPP)
> +		dev_err(dwmac->dev, "invalid speed %uMbps\n", speed);
> +	else if (err)
> +		dev_err(dwmac->dev,
> +			"failed to set tx rate for speed %uMbps: %pe\n",
> +			speed, ERR_PTR(err));
>  }
>  
>  static void imx93_dwmac_fix_speed(void *priv, unsigned int speed, unsigned int mode)
> -- 
> 2.30.2
> 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
