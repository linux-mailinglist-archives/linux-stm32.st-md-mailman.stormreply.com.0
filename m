Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A35072CE75
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Jun 2023 20:32:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4C93FC6A617;
	Mon, 12 Jun 2023 18:32:51 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1A949C6A60E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Jun 2023 18:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686594769;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qSuO83O2GJF69D20JvszqVCusWGni7xZeOtz58f06pw=;
 b=P1Gzm0BvCPN7KWcYUorr5D3fvJVkAGDa9p/j/PG+2h5kIVuKTNofQyGirvEUugLLMBzIMD
 dKh5l5KPdtRspWNPJcuP/Lw6dP5PLsH+bj8a72EN8z6l+yTayTnkbnh7L2whfUeMxLP5Fd
 BJOSzaB7QMsxJJpg7uuyEZEfS6GH2bY=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-244-9WXxEuicPGatLSjZsn51-g-1; Mon, 12 Jun 2023 14:32:47 -0400
X-MC-Unique: 9WXxEuicPGatLSjZsn51-g-1
Received: by mail-ot1-f69.google.com with SMTP id
 46e09a7af769-6b29ac99ffaso2282778a34.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Jun 2023 11:32:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686594767; x=1689186767;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qSuO83O2GJF69D20JvszqVCusWGni7xZeOtz58f06pw=;
 b=Tap5Ok8MPokcChLd5tPZH1VdvSInmNiLE+h9P/ELO6XAxyO/I/7T0e4xLhW4swYsWH
 nFBxA6RmT45k4KweO+9+ZJ2BUACDElw6dhrOSUS+JNcXODjzU2Tn5NBZPIGFqAnWLBHY
 MdVwbYgWxPJ+f6IbF9tuF3Q8F40fl8ZBAZkwWbixcqtvHEmwzt8YXloGaxOB53zAELKb
 3glJ6Wa3GtZKO/T0BtsrmJXg88BLGMUsa7niToWhbNphuODSVbNlg6Ja/u9Xo2WRyEVX
 IzygqhImiqibf8MOcpUOA9MPE5c62UCT6rhy+hBV3L+LycefAb892WoLxiZHmAiXBXSy
 /g/Q==
X-Gm-Message-State: AC+VfDyfuA/1DlHNG/iIyh3O55dYM12Lnj21oj16dk6Abs88JSP0V4Kk
 1/hrXn4s3q3FLVmZFdaGA0iNLzJSCBuGaZV6KUjDGwURGjxRCVxepGYM3svXIzxj9QunK4pfcdA
 zSE0gan9WeBOsGVdRZQuHMYGjKH4bPxwo4hv9rGL1
X-Received: by 2002:a05:6830:92:b0:6a5:dd70:38cd with SMTP id
 a18-20020a056830009200b006a5dd7038cdmr6651290oto.2.1686594767178; 
 Mon, 12 Jun 2023 11:32:47 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5HntANaGm+HkD+UPQVxKZBUJkVk1zEqMvLrahjA8N+vIH05i26ddN13SkrcVSLU5flZVuT2A==
X-Received: by 2002:a05:6830:92:b0:6a5:dd70:38cd with SMTP id
 a18-20020a056830009200b006a5dd7038cdmr6651260oto.2.1686594766931; 
 Mon, 12 Jun 2023 11:32:46 -0700 (PDT)
Received: from halaney-x13s ([2600:1700:1ff0:d0e0::45])
 by smtp.gmail.com with ESMTPSA id
 w14-20020a056830060e00b006af9d8af435sm4138880oti.50.2023.06.12.11.32.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jun 2023 11:32:46 -0700 (PDT)
Date: Mon, 12 Jun 2023 13:32:43 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Message-ID: <20230612183243.5rkphsaqofi42bgc@halaney-x13s>
References: <20230612092355.87937-1-brgl@bgdev.pl>
 <20230612092355.87937-7-brgl@bgdev.pl>
MIME-Version: 1.0
In-Reply-To: <20230612092355.87937-7-brgl@bgdev.pl>
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
Subject: Re: [Linux-stm32] [PATCH 06/26] net: stmmac: dwmac-qcom-ethqos:
 rename a label in probe()
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

On Mon, Jun 12, 2023 at 11:23:35AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> The err_mem label's name is unclear. It actually should be reached on
> any error after stmmac_probe_config_dt() succeeds. Name it after the
> cleanup action that needs to be called before exiting.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>

> ---
>  .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index 2da0738eed24..16e856861558 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -615,14 +615,14 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
>  	ethqos = devm_kzalloc(&pdev->dev, sizeof(*ethqos), GFP_KERNEL);
>  	if (!ethqos) {
>  		ret = -ENOMEM;
> -		goto err_mem;
> +		goto out_config_dt;
>  	}
>  
>  	ethqos->pdev = pdev;
>  	ethqos->rgmii_base = devm_platform_ioremap_resource_byname(pdev, "rgmii");
>  	if (IS_ERR(ethqos->rgmii_base)) {
>  		ret = PTR_ERR(ethqos->rgmii_base);
> -		goto err_mem;
> +		goto out_config_dt;
>  	}
>  
>  	data = of_device_get_match_data(&pdev->dev);
> @@ -634,16 +634,16 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
>  	ethqos->rgmii_clk = devm_clk_get(&pdev->dev, "rgmii");
>  	if (IS_ERR(ethqos->rgmii_clk)) {
>  		ret = PTR_ERR(ethqos->rgmii_clk);
> -		goto err_mem;
> +		goto out_config_dt;
>  	}
>  
>  	ret = ethqos_clks_config(ethqos, true);
>  	if (ret)
> -		goto err_mem;
> +		goto out_config_dt;
>  
>  	ret = devm_add_action_or_reset(&pdev->dev, ethqos_clks_disable, ethqos);
>  	if (ret)
> -		goto err_mem;
> +		goto out_config_dt;
>  
>  	ethqos->speed = SPEED_1000;
>  	ethqos_update_rgmii_clk(ethqos, SPEED_1000);
> @@ -662,11 +662,11 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
>  
>  	ret = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
>  	if (ret)
> -		goto err_mem;
> +		goto out_config_dt;
>  
>  	return ret;
>  
> -err_mem:
> +out_config_dt:
>  	stmmac_remove_config_dt(pdev, plat_dat);
>  
>  	return ret;
> -- 
> 2.39.2
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
