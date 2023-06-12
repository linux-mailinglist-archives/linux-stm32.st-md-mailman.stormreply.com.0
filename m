Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E6572CDD1
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Jun 2023 20:23:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A339DC6A617;
	Mon, 12 Jun 2023 18:23:04 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 70E42C6A60F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Jun 2023 18:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686594182;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WuZqmtvd4WjoknFOrkLRYxUsHp5/t5pNlhuMb2dd9d8=;
 b=Ptgnm/zcPxh2qyvS8qltOjVRhNbDAAvI7EAtTH2NJb1Ha/K2xYBYiyD/YrumENKo1HBem3
 gj4fMo5afQ4d4ESDS6UJutNcjBWPi3onKqQoSd+olWlMqzlkCIZNbO2NCSXCJMp5IRYPlx
 tr/Kzf+m3cz+BSKhYKzD2MtmbK/2tr8=
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com
 [209.85.160.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-223-iq_xPEk8MEulVPbPC7RoPg-1; Mon, 12 Jun 2023 14:23:01 -0400
X-MC-Unique: iq_xPEk8MEulVPbPC7RoPg-1
Received: by mail-oa1-f70.google.com with SMTP id
 586e51a60fabf-1a66bf3a386so1710574fac.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Jun 2023 11:23:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686594180; x=1689186180;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WuZqmtvd4WjoknFOrkLRYxUsHp5/t5pNlhuMb2dd9d8=;
 b=BZ5Iar3o/t+1R77YGA5HQcGCz0RO4kFSsiT48YXq7tYuP1B1Nw04jyxt7bQH8WXN+2
 TfJDV/vsKzolODoW03tTPAvK8RIXtQWK4h5Tb8oph24oil1TR7RH7qK2KCOxvwkMo6JP
 lPROtZPOqhj2wHcwsZbGRX44US8LYegmWLkJNG0ooYBvifo76hchiWo+w56hFMwLELcj
 IBnOwVtg/UMh1sdJVUu25mCcQCaZDHz9r4snYvNcAs2Ryou4aFPqEC8Kv8WTrFsOg0Xv
 nPMY1+C/zqEgx4cO7Wq5vpFc9WhkvJINqOCM+t2dkR/Sd69ZpR1doBR3xJvM/pobetX9
 S/Ww==
X-Gm-Message-State: AC+VfDxipzqzCqSaCXHx69v7DsX45T5t//u0ukoCdMCC3QtgPV4hKbIV
 +ixViflMZeppAGYCTgKcM8AwsfMnLT0YXeaWh3nbad8nd/nwD0n/ox6Y59sqJMKhNYK+FBLGIkO
 40lmCT0bR0j4AE5HZNhAcH5fKeodPyYKs577oRPif
X-Received: by 2002:a05:6870:3403:b0:1a6:a28b:6e4 with SMTP id
 g3-20020a056870340300b001a6a28b06e4mr1424763oah.37.1686594180231; 
 Mon, 12 Jun 2023 11:23:00 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4ojOAZsqcF6bnSAgTcknWHmKu5ibIbDyN5vE0vwVE23kVcIn47oSmy77InfhxOlx0UQ4BxKw==
X-Received: by 2002:a05:6870:3403:b0:1a6:a28b:6e4 with SMTP id
 g3-20020a056870340300b001a6a28b06e4mr1424739oah.37.1686594179927; 
 Mon, 12 Jun 2023 11:22:59 -0700 (PDT)
Received: from halaney-x13s ([2600:1700:1ff0:d0e0::45])
 by smtp.gmail.com with ESMTPSA id
 r34-20020a05687108a200b001a68feb9440sm1579964oaq.9.2023.06.12.11.22.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jun 2023 11:22:59 -0700 (PDT)
Date: Mon, 12 Jun 2023 13:22:56 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Message-ID: <20230612182256.7cc3goqwid32fdn6@halaney-x13s>
References: <20230612092355.87937-1-brgl@bgdev.pl>
 <20230612092355.87937-6-brgl@bgdev.pl>
MIME-Version: 1.0
In-Reply-To: <20230612092355.87937-6-brgl@bgdev.pl>
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
Subject: Re: [Linux-stm32] [PATCH 05/26] net: stmmac: dwmac-qcom-ethqos:
 shrink clock code with devres
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

On Mon, Jun 12, 2023 at 11:23:34AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> We can use a devm action to completely drop the remove callback and use
> stmmac_pltfr_remove() directly for remove. We can also drop one of the
> goto labels.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

I think using the remove callback seems more direct to a reader, but
that's pretty opinionated. The change itself looks good so:

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>

> ---
>  .../stmicro/stmmac/dwmac-qcom-ethqos.c        | 24 +++++++++----------
>  1 file changed, 11 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index c801838fae2a..2da0738eed24 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -586,6 +586,11 @@ static int ethqos_clks_config(void *priv, bool enabled)
>  	return ret;
>  }
>  
> +static void ethqos_clks_disable(void *data)
> +{
> +	ethqos_clks_config(data, false);
> +}
> +
>  static int qcom_ethqos_probe(struct platform_device *pdev)
>  {
>  	struct device_node *np = pdev->dev.of_node;
> @@ -636,6 +641,10 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto err_mem;
>  
> +	ret = devm_add_action_or_reset(&pdev->dev, ethqos_clks_disable, ethqos);
> +	if (ret)
> +		goto err_mem;
> +
>  	ethqos->speed = SPEED_1000;
>  	ethqos_update_rgmii_clk(ethqos, SPEED_1000);
>  	ethqos_set_func_clk_en(ethqos);
> @@ -653,27 +662,16 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
>  
>  	ret = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
>  	if (ret)
> -		goto err_clk;
> +		goto err_mem;
>  
>  	return ret;
>  
> -err_clk:
> -	ethqos_clks_config(ethqos, false);
> -
>  err_mem:
>  	stmmac_remove_config_dt(pdev, plat_dat);
>  
>  	return ret;
>  }
>  
> -static void qcom_ethqos_remove(struct platform_device *pdev)
> -{
> -	struct qcom_ethqos *ethqos = get_stmmac_bsp_priv(&pdev->dev);
> -
> -	stmmac_pltfr_remove(pdev);
> -	ethqos_clks_config(ethqos, false);
> -}
> -
>  static const struct of_device_id qcom_ethqos_match[] = {
>  	{ .compatible = "qcom,qcs404-ethqos", .data = &emac_v2_3_0_data},
>  	{ .compatible = "qcom,sc8280xp-ethqos", .data = &emac_v3_0_0_data},
> @@ -684,7 +682,7 @@ MODULE_DEVICE_TABLE(of, qcom_ethqos_match);
>  
>  static struct platform_driver qcom_ethqos_driver = {
>  	.probe  = qcom_ethqos_probe,
> -	.remove_new = qcom_ethqos_remove,
> +	.remove_new = stmmac_pltfr_remove,
>  	.driver = {
>  		.name           = "qcom-ethqos",
>  		.pm		= &stmmac_pltfr_pm_ops,
> -- 
> 2.39.2
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
