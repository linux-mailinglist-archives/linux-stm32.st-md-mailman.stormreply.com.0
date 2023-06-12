Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A30E172BCF3
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Jun 2023 11:45:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 518E0C6A60F;
	Mon, 12 Jun 2023 09:45:46 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 08956C06F81
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Jun 2023 09:45:44 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-4f122ff663eso4670069e87.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Jun 2023 02:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686563144; x=1689155144;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DWwcG8B478jMSpAgeoJrfgqQXgVZW1IwS0fWhOn6gk0=;
 b=upBU3IKs93WTyz/V/gEN+RLEp9WIg19EH3y6zBS6ow1ie08c4Ipr7gH1W7uhqwZOZI
 lHfKdssyJ2ly3Fgt/rckwxO3zaArORYq2ZFx8c17CQHCAsSfdrg7KsckJGSP0yKEU0Le
 DR/5IZGAvGTxCdtwx/N/S9z7bWRqufplkmUQ9wk2OEmy9ZahyBakPrxs4eboJOwYkPQE
 anV+zG3p1ay1p4RJxaaMU3uW1z1NCTEFyK2SO42tFuiFuAZu/d0MOqBNMizvH07LrfLg
 VKKf9/6i55Jqj6kFbbj0TPbZhChRYgMDsqpcRE9tkFansq7SNLw3JHSdfqJE6ugpNGZD
 Gt/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686563144; x=1689155144;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DWwcG8B478jMSpAgeoJrfgqQXgVZW1IwS0fWhOn6gk0=;
 b=Ce3YoNV9pd23Bl6xon4SqzdB/++RAmGF7v5uY3mgESEcZSEtHBh5u9K1j7L9RvZiFF
 uVxOFZFgVuyZzXSkzySXJb17m0Nb6ZJvtD1wMpwFK+UEthk1yWLc3tkYPXuhf6sLGWGS
 Nb/h4g0GrkuXxKJRbs7jTFAsFW0shGV9Yk+yHX/eVuRGcY2cKnbMJPaelIvXwBUVc5ae
 r5JQ9Fbbe5oj2ibU6AHkKnOLXaNsWaaFcTDamq89+BI1OKqIbE5kMeVhX4iXlCwVJHjm
 g5KL01vIgg/fiFtwPjwIa3reGcl+D5TwEr72u0hvAhQSD9/xQkOVw7j+oGBT+NUs1TfO
 XRlA==
X-Gm-Message-State: AC+VfDwWOhJlZm44qX4WJYw3/ZJM0C6HW7OdSG0zVoiFkBlNx52kzF5o
 C6juDzVTx4A+gKF7sN4lzErBcA==
X-Google-Smtp-Source: ACHHUZ43/gi+znYlYQvf2z3Zeqhx6w4RHoSruCkErpQAm+KwwannknuxHnOqh55jxAdULPv7Gxv4YA==
X-Received: by 2002:a2e:908f:0:b0:2b1:e943:8abe with SMTP id
 l15-20020a2e908f000000b002b1e9438abemr2380153ljg.47.1686563144165; 
 Mon, 12 Jun 2023 02:45:44 -0700 (PDT)
Received: from [192.168.1.101] (abyj190.neoplus.adsl.tpnet.pl. [83.9.29.190])
 by smtp.gmail.com with ESMTPSA id
 n23-20020a2e86d7000000b002ac78893a9csm1672079ljj.72.2023.06.12.02.45.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jun 2023 02:45:43 -0700 (PDT)
Message-ID: <7fe7078e-404d-28e5-0dd1-53b7f9cd7626@linaro.org>
Date: Mon, 12 Jun 2023 11:45:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Content-Language: en-US
To: Bartosz Golaszewski <brgl@bgdev.pl>, Vinod Koul <vkoul@kernel.org>,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>
References: <20230612092355.87937-1-brgl@bgdev.pl>
 <20230612092355.87937-4-brgl@bgdev.pl>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230612092355.87937-4-brgl@bgdev.pl>
Cc: devicetree@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 03/26] phy: qcom: add the SGMII SerDes PHY
	driver
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



On 12.06.2023 11:23, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Implement support for the SGMII/SerDes PHY present on various Qualcomm
> platforms.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
> +static const struct regmap_config qcom_dwmac_sgmii_phy_regmap_cfg = {
> +	.reg_bits		= 32,
> +	.val_bits		= 32,
> +	.reg_stride		= 4,
> +	.use_relaxed_mmio	= true,
> +	.disable_locking	= true,
The last two are rather brave, no?

Konrad
> +};
> +
> +static int qcom_dwmac_sgmii_phy_probe(struct platform_device *pdev)
> +{
> +	struct qcom_dwmac_sgmii_phy_data *data;
> +	struct device *dev = &pdev->dev;
> +	struct phy_provider *provider;
> +	struct clk *refclk;
> +	void __iomem *base;
> +	struct phy *phy;
> +
> +	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
> +
> +	data->regmap = devm_regmap_init_mmio(dev, base,
> +					     &qcom_dwmac_sgmii_phy_regmap_cfg);
> +	if (IS_ERR(data->regmap))
> +		return PTR_ERR(data->regmap);
> +
> +	phy = devm_phy_create(dev, NULL, &qcom_dwmac_sgmii_phy_ops);
> +	if (IS_ERR(phy))
> +		return PTR_ERR(phy);
> +
> +	refclk = devm_clk_get_enabled(dev, "sgmi_ref");
> +	if (IS_ERR(refclk))
> +		return PTR_ERR(refclk);
> +
> +	provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
> +	if (IS_ERR(provider))
> +		return PTR_ERR(provider);
> +
> +	phy_set_drvdata(phy, data);
> +	platform_set_drvdata(pdev, data);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id qcom_dwmac_sgmii_phy_of_match[] = {
> +	{ .compatible = "qcom,sa8775p-dwmac-sgmii-phy" },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, qcom_dwmac_sgmii_phy_of_match);
> +
> +static struct platform_driver qcom_dwmac_sgmii_phy_driver = {
> +	.probe	= qcom_dwmac_sgmii_phy_probe,
> +	.driver = {
> +		.name	= "qcom-dwmac-sgmii-phy",
> +		.of_match_table	= qcom_dwmac_sgmii_phy_of_match,
> +	}
> +};
> +
> +module_platform_driver(qcom_dwmac_sgmii_phy_driver);
> +
> +MODULE_DESCRIPTION("Qualcomm DWMAC SGMII PHY driver");
> +MODULE_LICENSE("GPL");
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
