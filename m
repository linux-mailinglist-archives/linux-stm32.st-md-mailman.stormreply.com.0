Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 59BB47A52C3
	for <lists+linux-stm32@lfdr.de>; Mon, 18 Sep 2023 21:12:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0E677C6B46F;
	Mon, 18 Sep 2023 19:12:23 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F1F01C6A5F2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Sep 2023 19:12:21 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2c008d8fd07so24190911fa.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Sep 2023 12:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695064341; x=1695669141;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Ymg444KdzoYqbAJJDaXLrEYL/H+uXP42VM/AMIopDrc=;
 b=EWWS76Z7Lx89vgymYJFUIE2joNs6m+qNYep7FpBx8OKCeftzsMPaQse909wgjjrDs5
 BoUuJXdkbX8BmvOrxwrYkZOBSVAmbEgwkcbl7cM1drPcgpQoypC3icv/MWl0iRhGiHI7
 efkxPtFYfbDxQ/ysFN+SJOD3GpZ4X8YoEsi162L8pZOs28sc9FUtYAFSirJIOZmQ60dA
 LyQOedKTo9E69IK3SGQu7LdjrI3+xNXL63JMMrIt9KUzl6Vu6x9WL7Xbuy6P/T9/Vy98
 kY9PcgZaJpWwKFCXlW3IMGktTyUs1tdJXJluYuSNSYbQgRnw0ifQ/MscFgQwk7WEhkRO
 sakQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695064341; x=1695669141;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ymg444KdzoYqbAJJDaXLrEYL/H+uXP42VM/AMIopDrc=;
 b=ciAxdY8YzH/HbT9/ZQ3U/CAJrqxoiL9SBtiFmAnOA10z1ADHHWgL9snzY+UdNQf0KU
 T+tHcyuBNwvjapLC3BIBTe5x0W84npgDrlhY+nHR6H8i1/jQcdPo5dK6X9Ii9LosxBHH
 +iheXngM/G1l6hmBKXYttE5CQ2yrnPvuwfStb3jBoGyWcM/IGWgaobmS2e2GPay613IU
 gqorAceGPwjFoUugUyQZsxrYBzOGSkxAhuZ036wKReFCCXqFWzNyswV/aApYUJfHHHfA
 3n3dbmKZ6Ur36K2ijEEw1ubB4vg0icIFLbl7a9475zBNeNA2D6G9gexzNt24tOue9mxz
 V14w==
X-Gm-Message-State: AOJu0YxvPaK7cew3RkMLjs3JlK6of6cJp8ehE/jrpeYe9AZOUuRQnvHc
 9hjicpiFxu14+IL+P7PY7Aw=
X-Google-Smtp-Source: AGHT+IFjg/ob0U+8PEhUDzZxfqbyJQBZc1GsvUR1GE+uNr8GDm+7qXSDDyadXaGQKQJr0ryj693ksg==
X-Received: by 2002:a2e:700d:0:b0:2bf:6852:9339 with SMTP id
 l13-20020a2e700d000000b002bf68529339mr8798200ljc.3.1695064340742; 
 Mon, 18 Sep 2023 12:12:20 -0700 (PDT)
Received: from mobilestation ([85.140.3.118]) by smtp.gmail.com with ESMTPSA id
 y15-20020a2e978f000000b002bce38190a3sm2221659lji.34.2023.09.18.12.11.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 12:12:20 -0700 (PDT)
Date: Mon, 18 Sep 2023 22:11:26 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Jisheng Zhang <jszhang@kernel.org>
Message-ID: <d3vpg5jcgfoe5qpreh2hnworsa2ly3ufrgqi4mcxx2yzfs7eoy@w2hgimsg64hp>
References: <20230916075829.1560-1-jszhang@kernel.org>
 <20230916075829.1560-3-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230916075829.1560-3-jszhang@kernel.org>
Cc: Emil Renner Berthing <kernel@esmil.dk>, linux-tegra@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Thierry Reding <thierry.reding@gmail.com>,
 linux-amlogic@lists.infradead.org,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Jerome Brunet <jbrunet@baylibre.com>, Samuel Holland <samuel@sholland.org>,
 Kevin Hilman <khilman@baylibre.com>, Russell King <linux@armlinux.org.uk>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Jose Abreu <joabreu@synopsys.com>, Samin Guo <samin.guo@starfivetech.com>,
 NXP Linux Team <linux-imx@nxp.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-sunxi@lists.linux.dev,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Vladimir Zapolskiy <vz@mleia.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, "David S . Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next v2 02/23] net: stmmac:
 dwmac-dwc-qos-eth: use devm_stmmac_probe_config_dt()
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

Hi Jisheng

On Sat, Sep 16, 2023 at 03:58:08PM +0800, Jisheng Zhang wrote:
> Simplify the driver's probe() function by using the devres
> variant of stmmac_probe_config_dt().
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  .../ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c   | 15 +++------------
>  1 file changed, 3 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
> index 61ebf36da13d..ec924c6c76c6 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
> @@ -435,15 +435,14 @@ static int dwc_eth_dwmac_probe(struct platform_device *pdev)
>  	if (IS_ERR(stmmac_res.addr))
>  		return PTR_ERR(stmmac_res.addr);
>  
> -	plat_dat = stmmac_probe_config_dt(pdev, stmmac_res.mac);
> +	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
>  	if (IS_ERR(plat_dat))
>  		return PTR_ERR(plat_dat);
>  
>  	ret = data->probe(pdev, plat_dat, &stmmac_res);
>  	if (ret < 0) {

>  		dev_err_probe(&pdev->dev, ret, "failed to probe subdriver\n");
> -
> -		goto remove_config;
> +		return ret;

just "return dev_err_probe()".

-Serge(y)

>  	}
>  
>  	ret = dwc_eth_dwmac_config_dt(pdev, plat_dat);
> @@ -458,25 +457,17 @@ static int dwc_eth_dwmac_probe(struct platform_device *pdev)
>  
>  remove:
>  	data->remove(pdev);
> -remove_config:
> -	stmmac_remove_config_dt(pdev, plat_dat);
>  
>  	return ret;
>  }
>  
>  static void dwc_eth_dwmac_remove(struct platform_device *pdev)
>  {
> -	struct net_device *ndev = platform_get_drvdata(pdev);
> -	struct stmmac_priv *priv = netdev_priv(ndev);
> -	const struct dwc_eth_dwmac_data *data;
> -
> -	data = device_get_match_data(&pdev->dev);
> +	const struct dwc_eth_dwmac_data *data = device_get_match_data(&pdev->dev);
>  
>  	stmmac_dvr_remove(&pdev->dev);
>  
>  	data->remove(pdev);
> -
> -	stmmac_remove_config_dt(pdev, priv->plat);
>  }
>  
>  static const struct of_device_id dwc_eth_dwmac_match[] = {
> -- 
> 2.40.1
> 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
