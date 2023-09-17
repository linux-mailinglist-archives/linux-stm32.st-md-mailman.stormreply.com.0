Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 69CB17A35E9
	for <lists+linux-stm32@lfdr.de>; Sun, 17 Sep 2023 16:42:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 038F3C6B474;
	Sun, 17 Sep 2023 14:42:19 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 204C8C6B473
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 17 Sep 2023 14:42:18 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-2c00b37ad84so3039151fa.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 17 Sep 2023 07:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1694961737; x=1695566537;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t8OnI6u0cEOFTJYu1llDUXyx2auo+am+q/WLsax6FAQ=;
 b=NI7CumDZGjGsJ75MNFNuV8DPhINpyxcthGMUHxkxKeLBZ+AfBxIrKPQGmtDLUiMNGv
 nPM91pQZW+QfgrfMHv0hBWH7472/I7fhmJvfxrNQQ0rhLNzwZpzZThMxc+5Ts5uDV9VV
 0N/7fY/2katYRa7VwqLcjMIBdd+zwmJrRLIDZAcSaceKPveOSVF32RJTggle/SaaDzma
 DAdpcCT1rDMjbXTwz/HX0xJVAb/wUCk4MSU3VYUbW8UgEs0VSL++Q7teHXpw/wquRC2u
 fG7krpGhzxC75G+kP8jfh6coc5CmKkKAlBuPMhUEqWvOwVnybEk9XyX+GCyb91WSQLDS
 I+Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694961737; x=1695566537;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t8OnI6u0cEOFTJYu1llDUXyx2auo+am+q/WLsax6FAQ=;
 b=iuZsyyqCpigSAsaYQNZxhmjCpD7Hxt8e0NrwvjxcH+15zZ2XD+jE+MT/7rUre/qiba
 jsH4nzq2mRZmquYDI68iS2N2GvtKcKX1xBOnxvlJntrXQmqvSDB19i6UD5yk18SSZJEv
 U+2o2QVlnA2AV26DZEy6DjBaktXj/XM8hvk2+LWnmxwT8sS4f0k0huNFHBfgWLGw4Ipz
 Zbb5Jdug/PEI1TknDxGBE1YuOAmLVdlNZ7gJrEYCBR88hoKPojVN8Qq4L6n6bnwEgmm2
 to3F+7MY3cFDtWr+X70u3TFSHV6appg3MdvoWTz3mH/kJN0lubl+QvdFHXm/LhGei4zM
 Volg==
X-Gm-Message-State: AOJu0YyH7rqjEKnabYjdjbM6+BvegZAEWOZNEV+mStSOSThnBxnV3lqF
 iQN/5XKbYHdPmdFiwEDw8ZQ=
X-Google-Smtp-Source: AGHT+IGCwEla40TgXmbfl+4SNqk+BjMa1n4H5XAPcLrxUPNV78F+jE9Mq3MjRLIpRqip9g6ySlXEyA==
X-Received: by 2002:a05:651c:1245:b0:2c0:d44:6162 with SMTP id
 h5-20020a05651c124500b002c00d446162mr250029ljh.12.1694961736917; 
 Sun, 17 Sep 2023 07:42:16 -0700 (PDT)
Received: from jernej-laptop.localnet (APN-123-246-155-gprs.simobil.net.
 [46.123.246.155]) by smtp.gmail.com with ESMTPSA id
 gz2-20020a170906f2c200b009ae05f9eab3sm624439ejb.65.2023.09.17.07.42.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Sep 2023 07:42:16 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Vladimir Zapolskiy <vz@mleia.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Emil Renner Berthing <kernel@esmil.dk>,
 Samin Guo <samin.guo@starfivetech.com>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Russell King <linux@armlinux.org.uk>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jisheng Zhang <jszhang@kernel.org>
Date: Sun, 17 Sep 2023 16:42:12 +0200
Message-ID: <2701959.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <20230916075829.1560-19-jszhang@kernel.org>
References: <20230916075829.1560-1-jszhang@kernel.org>
 <20230916075829.1560-19-jszhang@kernel.org>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] Re: [PATCH net-next v2 18/23] net: stmmac:
 dwmac-sun8i: use devm_stmmac_probe_config_dt()
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

Dne sobota, 16. september 2023 ob 09:58:24 CEST je Jisheng Zhang napisal(a):
> Simplify the driver's probe() function by using the devres
> variant of stmmac_probe_config_dt().
> 
> The calling of stmmac_pltfr_remove() now needs to be switched to
> stmmac_pltfr_remove_no_dt().
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c index
> 01e77368eef1..63a7e5e53d7b 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> @@ -1224,7 +1224,7 @@ static int sun8i_dwmac_probe(struct platform_device
> *pdev) if (ret)
>  		return -EINVAL;
> 
> -	plat_dat = stmmac_probe_config_dt(pdev, stmmac_res.mac);
> +	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
>  	if (IS_ERR(plat_dat))
>  		return PTR_ERR(plat_dat);
> 
> @@ -1244,7 +1244,7 @@ static int sun8i_dwmac_probe(struct platform_device
> *pdev)
> 
>  	ret = sun8i_dwmac_set_syscon(&pdev->dev, plat_dat);
>  	if (ret)
> -		goto dwmac_deconfig;
> +		return ret;
> 
>  	ret = sun8i_dwmac_init(pdev, plat_dat->bsp_priv);
>  	if (ret)
> @@ -1295,8 +1295,6 @@ static int sun8i_dwmac_probe(struct platform_device
> *pdev) sun8i_dwmac_exit(pdev, gmac);
>  dwmac_syscon:
>  	sun8i_dwmac_unset_syscon(gmac);
> -dwmac_deconfig:
> -	stmmac_remove_config_dt(pdev, plat_dat);
> 
>  	return ret;
>  }
> @@ -1314,7 +1312,7 @@ static void sun8i_dwmac_remove(struct platform_device
> *pdev) clk_put(gmac->ephy_clk);
>  	}
> 
> -	stmmac_pltfr_remove(pdev);
> +	stmmac_pltfr_remove_no_dt(pdev);
>  	sun8i_dwmac_unset_syscon(gmac);
>  }




_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
