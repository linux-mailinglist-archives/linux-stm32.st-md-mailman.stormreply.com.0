Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E40D672E8E7
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Jun 2023 18:59:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AA2ECC6A61A;
	Tue, 13 Jun 2023 16:59:52 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B9013C5E2C2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jun 2023 16:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686675590;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=j04GnjVnV6VhU15tbBAUt5ncRnXCPvNX2dvFYsA/gBk=;
 b=iHw6EAIePH85NMkgoWE0GEqFT7RjDlWvkKcgh0VkANARIlCsC/L06u542yBsECCVHHKrQ1
 d56rSxi3Pv8HLM27+BnwFvs1lT66NBQxlYp+Gnk78lcR0tp82vltrCeyAh54Lh2BQHbr+T
 85hD0/7E1JfvVe3B7dBqOUcyXw6vm/8=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-14-24wqXvrwPQy0m-7yzoPxNw-1; Tue, 13 Jun 2023 12:59:49 -0400
X-MC-Unique: 24wqXvrwPQy0m-7yzoPxNw-1
Received: by mail-yw1-f198.google.com with SMTP id
 00721157ae682-561ceb5b584so93717087b3.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jun 2023 09:59:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686675587; x=1689267587;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j04GnjVnV6VhU15tbBAUt5ncRnXCPvNX2dvFYsA/gBk=;
 b=Aady1fuK96cjqyf/9rm0SoTcz4Aof7KEYpBfWwd7LQZmrVZ3Bplg24lhj1fwuV0YDS
 S2ic92r4trjMRm+FgMQAYV2uhe/TmmpprlUQpoaZNepTbYpAAhWs5hIHMh8Ks4PwfL0X
 nUNX7r6FyrmT+oC52rJwsGEyLXmVjR7T4cZbMjkAN4gqLf3C3cswyHIk4laB+ZCXPrTn
 gF7ub04oqQUodDJG71S7CGbyqKpAV+K672OO7+kwkCqbh4BeCv05AJO3BBTEGRNrKb8W
 b0O0y4YgI8D04Z3TuvUaSECe4G3fMnxY7jN6o7JBnFUXV69Xk6Q2uL7SEYsrsA+mCqDA
 XAzw==
X-Gm-Message-State: AC+VfDxRrO0ZEMtRkPgF6RI8MdSNMq/imNshRrp20hIYPmdSmx8x94Gu
 knGVUSAVhoTy76+iGfXWRiv1VfSqUbZkbIrFnNjlDyEKAINNafUAbJ7IF8J9WfHtL60r1gcc24t
 059utySw0Kq6Lv4yniUE43gvAIvp8VxLN9bl+TVFa
X-Received: by 2002:a81:738b:0:b0:565:e48d:32cf with SMTP id
 o133-20020a81738b000000b00565e48d32cfmr2533644ywc.7.1686675587355; 
 Tue, 13 Jun 2023 09:59:47 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7O9u46bkmq9uCzDtwjiCxY77/JvONfFU/2txtnkFyT64oc8V6fa+eQ8cwyObh374VppqoV4w==
X-Received: by 2002:a81:738b:0:b0:565:e48d:32cf with SMTP id
 o133-20020a81738b000000b00565e48d32cfmr2533610ywc.7.1686675587072; 
 Tue, 13 Jun 2023 09:59:47 -0700 (PDT)
Received: from halaney-x13s ([2600:1700:1ff0:d0e0::45])
 by smtp.gmail.com with ESMTPSA id
 s7-20020a0de907000000b005688f7596ccsm1699074ywe.78.2023.06.13.09.59.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jun 2023 09:59:46 -0700 (PDT)
Date: Tue, 13 Jun 2023 11:59:43 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Message-ID: <20230613165943.zjr4b4p44jhl2dtx@halaney-x13s>
References: <20230612092355.87937-1-brgl@bgdev.pl>
 <20230612092355.87937-17-brgl@bgdev.pl>
MIME-Version: 1.0
In-Reply-To: <20230612092355.87937-17-brgl@bgdev.pl>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
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
Subject: Re: [Linux-stm32] [PATCH 16/26] net: stmmac: dwmac-qcom-ethqos:
 prepare the driver for more PHY modes
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

On Mon, Jun 12, 2023 at 11:23:45AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> In preparation for supporting SGMII, let's make the code a bit more
> generic. Add a new callback for MAC configuration so that we can assign
> a different variant of it in the future.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>

> ---
>  .../stmicro/stmmac/dwmac-qcom-ethqos.c        | 31 ++++++++++++++++---
>  1 file changed, 26 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index 21f329d2f7eb..2f96f2c11278 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -92,12 +92,14 @@ struct ethqos_emac_driver_data {
>  struct qcom_ethqos {
>  	struct platform_device *pdev;
>  	void __iomem *rgmii_base;
> +	int (*configure_func)(struct qcom_ethqos *ethqos);
>  
>  	unsigned int rgmii_clk_rate;
>  	struct clk *rgmii_clk;
>  	struct clk *phyaux_clk;
>  	struct phy *serdes_phy;
>  	unsigned int speed;
> +	int phy_mode;
>  
>  	const struct ethqos_emac_por *por;
>  	unsigned int num_por;
> @@ -332,13 +334,11 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos)
>  {
>  	struct device *dev = &ethqos->pdev->dev;
>  	int phase_shift;
> -	int phy_mode;
>  	int loopback;
>  
>  	/* Determine if the PHY adds a 2 ns TX delay or the MAC handles it */
> -	phy_mode = device_get_phy_mode(dev);
> -	if (phy_mode == PHY_INTERFACE_MODE_RGMII_ID ||
> -	    phy_mode == PHY_INTERFACE_MODE_RGMII_TXID)
> +	if (ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_ID ||
> +	    ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_TXID)
>  		phase_shift = 0;
>  	else
>  		phase_shift = RGMII_CONFIG2_TX_CLK_PHASE_SHIFT_EN;
> @@ -485,7 +485,7 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos)
>  	return 0;
>  }
>  
> -static int ethqos_configure(struct qcom_ethqos *ethqos)
> +static int ethqos_configure_rgmii(struct qcom_ethqos *ethqos)
>  {
>  	struct device *dev = &ethqos->pdev->dev;
>  	volatile unsigned int dll_lock;
> @@ -561,6 +561,11 @@ static int ethqos_configure(struct qcom_ethqos *ethqos)
>  	return 0;
>  }
>  
> +static int ethqos_configure(struct qcom_ethqos *ethqos)
> +{
> +	return ethqos->configure_func(ethqos);
> +}
> +
>  static void ethqos_fix_mac_speed(void *priv, unsigned int speed)
>  {
>  	struct qcom_ethqos *ethqos = priv;
> @@ -660,6 +665,22 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
>  		goto out_config_dt;
>  	}
>  
> +	ethqos->phy_mode = device_get_phy_mode(dev);
> +	switch (ethqos->phy_mode) {
> +	case PHY_INTERFACE_MODE_RGMII:
> +	case PHY_INTERFACE_MODE_RGMII_ID:
> +	case PHY_INTERFACE_MODE_RGMII_RXID:
> +	case PHY_INTERFACE_MODE_RGMII_TXID:
> +		ethqos->configure_func = ethqos_configure_rgmii;
> +		break;
> +	case -ENODEV:
> +		ret = -ENODEV;
> +		goto out_config_dt;
> +	default:
> +		ret = -EINVAL;
> +		goto out_config_dt;
> +	}
> +
>  	ethqos->pdev = pdev;
>  	ethqos->rgmii_base = devm_platform_ioremap_resource_byname(pdev, "rgmii");
>  	if (IS_ERR(ethqos->rgmii_base)) {
> -- 
> 2.39.2
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
