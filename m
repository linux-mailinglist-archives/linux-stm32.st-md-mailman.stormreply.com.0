Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C085372D9BA
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Jun 2023 08:15:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 743CCC6A617;
	Tue, 13 Jun 2023 06:15:43 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CA8F7C6A60E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Jun 2023 18:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686595136;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PDNy4tlrStiRvaxnMXQiYuj7Ms4xtJijYK3hHSTiCgM=;
 b=QUteqYgljyiQU5qnMpQE1fdm1x1Bo/I9WIc7ju8uRqc8yaXAymCaiBzkZiJqFemYQUreWY
 cTSuayHPVTQyS0S5HAaXEeBA0cT5grqVbsNu3I4g8b10uyUxB37KjHdYazIvQFaPJJwuZq
 L7Qg5a7zAO6ICapes7/KMYcvZWnyvWU=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-619-9S5--LVXPU-OKUVhv3EQHw-1; Mon, 12 Jun 2023 14:38:50 -0400
X-MC-Unique: 9S5--LVXPU-OKUVhv3EQHw-1
Received: by mail-oi1-f199.google.com with SMTP id
 5614622812f47-39cd38e0831so1177676b6e.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Jun 2023 11:38:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686595129; x=1689187129;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PDNy4tlrStiRvaxnMXQiYuj7Ms4xtJijYK3hHSTiCgM=;
 b=AsjEOgG7GZvHnVDi1SIpql6ooefqBMAegxnf+XsTXn+wcMf1asT7MhPDfmWCIVvPx5
 2PQY6xuCi+gloP8mE2uvC9Z8y3DOyL+xd9FL10FpiT8yFXoTMBUV8K1KvbxsmNv7IyH2
 hMqkzIzTAg5MTcpnLz1cdvjLgCGrIUNPf8xfcpjaY6zKEIfwN93fO9mHlzFAblsg6quz
 emaw1gt1jQSiQlCFPHOveKt5pNBz7JKc6FDPmx7J8KN8WqOIlEjptogDT16b5Kg6CAyk
 zb1Ak41IZuPoGiAcvo1vS444DUEOpsXRP6oASfE9PzYY5nR8n6O3b+vXUoEXzqtqcMQq
 NgNQ==
X-Gm-Message-State: AC+VfDyEu76vWmdKZHEzRSKrWdG4yN5xX8bmDCJ2bBlpBoF9Ylt56Abf
 FajaWGzw57KO7OHt9ezpd5RYYNEm06H4rcX3EwjlvlASvLaOX8im9tOehoCjwH0idG/8Iq95ovp
 dtMHSZQW1T2mPjli68grxUqMsGjTPJuQMMeEwS0/k
X-Received: by 2002:a05:6808:2090:b0:398:e4c:d5c2 with SMTP id
 s16-20020a056808209000b003980e4cd5c2mr6244364oiw.9.1686595129330; 
 Mon, 12 Jun 2023 11:38:49 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ658SXpBYoZENXQUCSYrl2GfGIsHYqLLYyBLRDeoekAAyN1j6b2/N1aFPTIPKR17gwesdJaxg==
X-Received: by 2002:a05:6808:2090:b0:398:e4c:d5c2 with SMTP id
 s16-20020a056808209000b003980e4cd5c2mr6244337oiw.9.1686595129080; 
 Mon, 12 Jun 2023 11:38:49 -0700 (PDT)
Received: from halaney-x13s ([2600:1700:1ff0:d0e0::45])
 by smtp.gmail.com with ESMTPSA id
 t7-20020a815f07000000b0054f9e7fed7asm2663490ywb.137.2023.06.12.11.38.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jun 2023 11:38:48 -0700 (PDT)
Date: Mon, 12 Jun 2023 13:38:39 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Message-ID: <20230612183839.zcn5glnhptptmbt4@halaney-x13s>
References: <20230612092355.87937-1-brgl@bgdev.pl>
 <20230612092355.87937-9-brgl@bgdev.pl>
MIME-Version: 1.0
In-Reply-To: <20230612092355.87937-9-brgl@bgdev.pl>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Mailman-Approved-At: Tue, 13 Jun 2023 06:15:41 +0000
Cc: Eric Dumazet <edumazet@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Jose Abreu <joabreu@synopsys.com>, Andy Gross <agross@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>, linux-arm-msm@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 "David S . Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH 08/26] net: stmmac: dwmac-qcom-ethqos: use
 a helper variable for &pdev->dev
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

On Mon, Jun 12, 2023 at 11:23:37AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Shrink code and avoid line breaks by using a helper variable for
> &pdev->dev.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  .../stmicro/stmmac/dwmac-qcom-ethqos.c        | 48 ++++++++++---------
>  1 file changed, 26 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index 28d2514a8795..e19d142630d3 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -123,25 +123,26 @@ static void rgmii_updatel(struct qcom_ethqos *ethqos,
>  static void rgmii_dump(void *priv)
>  {
>  	struct qcom_ethqos *ethqos = priv;
> +	struct device *dev = &ethqos->pdev->dev;
>  
> -	dev_dbg(&ethqos->pdev->dev, "Rgmii register dump\n");
> -	dev_dbg(&ethqos->pdev->dev, "RGMII_IO_MACRO_CONFIG: %x\n",
> +	dev_dbg(dev, "Rgmii register dump\n");
> +	dev_dbg(dev, "RGMII_IO_MACRO_CONFIG: %x\n",
>  		rgmii_readl(ethqos, RGMII_IO_MACRO_CONFIG));
> -	dev_dbg(&ethqos->pdev->dev, "SDCC_HC_REG_DLL_CONFIG: %x\n",
> +	dev_dbg(dev, "SDCC_HC_REG_DLL_CONFIG: %x\n",
>  		rgmii_readl(ethqos, SDCC_HC_REG_DLL_CONFIG));
> -	dev_dbg(&ethqos->pdev->dev, "SDCC_HC_REG_DDR_CONFIG: %x\n",
> +	dev_dbg(dev, "SDCC_HC_REG_DDR_CONFIG: %x\n",
>  		rgmii_readl(ethqos, SDCC_HC_REG_DDR_CONFIG));
> -	dev_dbg(&ethqos->pdev->dev, "SDCC_HC_REG_DLL_CONFIG2: %x\n",
> +	dev_dbg(dev, "SDCC_HC_REG_DLL_CONFIG2: %x\n",
>  		rgmii_readl(ethqos, SDCC_HC_REG_DLL_CONFIG2));
> -	dev_dbg(&ethqos->pdev->dev, "SDC4_STATUS: %x\n",
> +	dev_dbg(dev, "SDC4_STATUS: %x\n",
>  		rgmii_readl(ethqos, SDC4_STATUS));
> -	dev_dbg(&ethqos->pdev->dev, "SDCC_USR_CTL: %x\n",
> +	dev_dbg(dev, "SDCC_USR_CTL: %x\n",
>  		rgmii_readl(ethqos, SDCC_USR_CTL));
> -	dev_dbg(&ethqos->pdev->dev, "RGMII_IO_MACRO_CONFIG2: %x\n",
> +	dev_dbg(dev, "RGMII_IO_MACRO_CONFIG2: %x\n",
>  		rgmii_readl(ethqos, RGMII_IO_MACRO_CONFIG2));
> -	dev_dbg(&ethqos->pdev->dev, "RGMII_IO_MACRO_DEBUG1: %x\n",
> +	dev_dbg(dev, "RGMII_IO_MACRO_DEBUG1: %x\n",
>  		rgmii_readl(ethqos, RGMII_IO_MACRO_DEBUG1));
> -	dev_dbg(&ethqos->pdev->dev, "EMAC_SYSTEM_LOW_POWER_DEBUG: %x\n",
> +	dev_dbg(dev, "EMAC_SYSTEM_LOW_POWER_DEBUG: %x\n",
>  		rgmii_readl(ethqos, EMAC_SYSTEM_LOW_POWER_DEBUG));
>  }
>  
> @@ -242,6 +243,7 @@ static const struct ethqos_emac_driver_data emac_v3_0_0_data = {
>  
>  static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
>  {
> +	struct device *dev = &ethqos->pdev->dev;
>  	unsigned int val;
>  	int retry = 1000;
>  
> @@ -279,7 +281,7 @@ static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
>  		retry--;
>  	} while (retry > 0);
>  	if (!retry)
> -		dev_err(&ethqos->pdev->dev, "Clear CK_OUT_EN timedout\n");
> +		dev_err(dev, "Clear CK_OUT_EN timedout\n");
>  
>  	/* Set CK_OUT_EN */
>  	rgmii_updatel(ethqos, SDCC_DLL_CONFIG_CK_OUT_EN,
> @@ -296,7 +298,7 @@ static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
>  		retry--;
>  	} while (retry > 0);
>  	if (!retry)
> -		dev_err(&ethqos->pdev->dev, "Set CK_OUT_EN timedout\n");
> +		dev_err(dev, "Set CK_OUT_EN timedout\n");
>  
>  	/* Set DDR_CAL_EN */
>  	rgmii_updatel(ethqos, SDCC_DLL_CONFIG2_DDR_CAL_EN,
> @@ -322,12 +324,13 @@ static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
>  
>  static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos)
>  {
> +	struct device *dev = &ethqos->pdev->dev;
>  	int phase_shift;
>  	int phy_mode;
>  	int loopback;
>  
>  	/* Determine if the PHY adds a 2 ns TX delay or the MAC handles it */
> -	phy_mode = device_get_phy_mode(&ethqos->pdev->dev);
> +	phy_mode = device_get_phy_mode(dev);
>  	if (phy_mode == PHY_INTERFACE_MODE_RGMII_ID ||
>  	    phy_mode == PHY_INTERFACE_MODE_RGMII_TXID)
>  		phase_shift = 0;
> @@ -468,7 +471,7 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos)
>  			      loopback, RGMII_IO_MACRO_CONFIG);
>  		break;
>  	default:
> -		dev_err(&ethqos->pdev->dev,
> +		dev_err(dev,
>  			"Invalid speed %d\n", ethqos->speed);

nit: You could put this on the prior line now

With that in place, feel free to add:

    Reviewed-by: Andrew Halaney <ahalaney@redhat.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
