Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D177A5319
	for <lists+linux-stm32@lfdr.de>; Mon, 18 Sep 2023 21:27:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F30BDC6B46F;
	Mon, 18 Sep 2023 19:27:57 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3854BC6A5F2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Sep 2023 19:27:56 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-502153ae36cso7858638e87.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Sep 2023 12:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695065275; x=1695670075;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=YUNA23giNsy9yXBhE6+Kf6gNULsVNoBVOIJ8OFSJNNc=;
 b=Dd1oS+80EbJTStKDKdwlFG6SUyg+gRNmnVb4Nwu5fXlMlpzgC7SEhs/A0iPFWl1ZPe
 15Gzwj/piG+YHlziUY25PvfOVFEhM+mJq2qEbOU2Zyq08ne/gRr3fqMBb0tuVgJpMdeQ
 XQDr9MP0d6XsKyeLs3CgBFv3G7LP+UyHvI/lGBJaW63J1R+Ig9Q6MU6UBgKQb8xRm0nE
 wcVIKjsmZyTSGbzhHh0koSMAH69i4WFJzmZXSnXp8qnzuRlZcnPwBcxWvICPwcQL5Hsf
 X/qfWw/TtrvXiw7VH2DtadznFQKYnl3t7ohnherH1h6CBbnDyLWGivouGZDjz/yEaTbL
 VC7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695065275; x=1695670075;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YUNA23giNsy9yXBhE6+Kf6gNULsVNoBVOIJ8OFSJNNc=;
 b=mw7Dq1ZzT9EiJGEmknIKKY/KuSa6BPSQn1gbOs2FuBh15KTMEuuxctGLbgkRj7GJxt
 Wz/32rdcVIt+S28YthYTCWesXHrkX/rG98UHOFqIseXNEXWWv6Qx17y9Nt0KT2mWkT1z
 IU16l++k7pFYDsZEBKsu2lD+Ms5SjjtJv1TbrYFV5C4C1wNtVmCPiTBDtZ9Tqlbs14Vh
 nP2npb+SDsCzB0/IYU/pKLpMfbedZLsgAOunXH3mdyX+980SPLFbwwUU2Ms8im8TxPNk
 i/b9W4xpSdQxkvhrfYU0DfGZNuPmZokznAGXMl5CHPYlFRKF3MhpVorfn2dyogXJRN0Q
 TtvQ==
X-Gm-Message-State: AOJu0YzxP1rwJeXj1EdFrhhmr5b1wJzDGuuT7b3kURQ0J/VTjBGc4JB3
 4q7CTNEBoD80xPnqTP/KMAg=
X-Google-Smtp-Source: AGHT+IHj4oSlgl2LSDqV5ANHoqz74jHZgqunRahPHglIvps97t3ij8W0vmwiuA1EgpsdIxEnzqZXEg==
X-Received: by 2002:a05:6512:962:b0:501:c3ee:62ec with SMTP id
 v2-20020a056512096200b00501c3ee62ecmr7844316lft.12.1695065275122; 
 Mon, 18 Sep 2023 12:27:55 -0700 (PDT)
Received: from mobilestation ([85.140.3.118]) by smtp.gmail.com with ESMTPSA id
 v22-20020ac25936000000b005009920b6afsm1941264lfi.9.2023.09.18.12.27.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 12:27:54 -0700 (PDT)
Date: Mon, 18 Sep 2023 22:27:50 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Jisheng Zhang <jszhang@kernel.org>
Message-ID: <3zzbxnzkhlucscfx5h4h6k3lyhqln2nwmcsgb3dvzn6xqkhhdw@nrpekwfahkua>
References: <20230916075829.1560-1-jszhang@kernel.org>
 <20230916075829.1560-2-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230916075829.1560-2-jszhang@kernel.org>
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
Subject: Re: [Linux-stm32] [PATCH net-next v2 01/23] net: stmmac:
 dwmac-anarion: use devm_stmmac_probe_config_dt()
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

On Sat, Sep 16, 2023 at 03:58:07PM +0800, Jisheng Zhang wrote:
> Simplify the driver's probe() function by using the devres
> variant of stmmac_probe_config_dt().
> 
> The remove_new() callback now needs to be switched to
> stmmac_pltfr_remove_no_dt().
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-anarion.c | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-anarion.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-anarion.c
> index 58a7f08e8d78..0df3a2ad0986 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-anarion.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-anarion.c
> @@ -115,7 +115,7 @@ static int anarion_dwmac_probe(struct platform_device *pdev)
>  	if (IS_ERR(gmac))
>  		return PTR_ERR(gmac);
>  
> -	plat_dat = stmmac_probe_config_dt(pdev, stmmac_res.mac);
> +	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
>  	if (IS_ERR(plat_dat))
>  		return PTR_ERR(plat_dat);
>  
> @@ -124,13 +124,7 @@ static int anarion_dwmac_probe(struct platform_device *pdev)
>  	anarion_gmac_init(pdev, gmac);
>  	plat_dat->bsp_priv = gmac;
>  
> -	ret = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
> -	if (ret) {
> -		stmmac_remove_config_dt(pdev, plat_dat);
> -		return ret;
> -	}
> -
> -	return 0;
> +	return stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);

Just a general note, IMO it's better from maintainability point of
view to use the pattern:

	ret = func();
	if (ret)
		return ret;

	return 0;

Thus should you need to add any functions call after or before the
func() method invocation with possible clean-up-on-error code the
change patch will look a bit simpler and more readable.

-Serge(y)

>  }
>  
>  static const struct of_device_id anarion_dwmac_match[] = {
> @@ -141,7 +135,7 @@ MODULE_DEVICE_TABLE(of, anarion_dwmac_match);
>  
>  static struct platform_driver anarion_dwmac_driver = {
>  	.probe  = anarion_dwmac_probe,
> -	.remove_new = stmmac_pltfr_remove,
> +	.remove_new = stmmac_pltfr_remove_no_dt,
>  	.driver = {
>  		.name           = "anarion-dwmac",
>  		.pm		= &stmmac_pltfr_pm_ops,
> -- 
> 2.40.1
> 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
