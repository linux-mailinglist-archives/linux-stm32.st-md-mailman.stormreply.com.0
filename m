Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 49019673252
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Jan 2023 08:21:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0BDDAC6904C;
	Thu, 19 Jan 2023 07:21:17 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 89192C6334A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Jan 2023 07:21:15 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id z5so908978wrt.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Jan 2023 23:21:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:organization:references:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=sOs8bQD9F6vMUPoMMlH0+D1lAaueC4ZgIBokJQnOoEo=;
 b=LyOB+NUS2loSPGvywS6q2JTxx+QV/V7RAlJ1e2rlqx9t3Ekf+fP0SKHqB4UBF1Alcb
 +9jHjYipwJSvsZgt9CoSAzkUJuTTXWQ09jEntTema1BIcZethpG+tMxX7X9aAkolenah
 DLrdIJmcSmEIF6vdYgXBV2FeYGIx5vZ2gurB9SeTci839nqNyRWN2sEiDR5MEyF2ltFL
 zh8gOEY/JyjmU3jNfppcc+SoutySEK/QzJqLnd3pFDIzlZ9CAoRCIBGEq9ug3Ps7StLA
 k+ZiQy+qM+CwiihdmGqh5xgqnYtd9E4Ad3CfUn+P57GgQI/X4lL1DHGu6oYtOZ6TFy5e
 bCDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sOs8bQD9F6vMUPoMMlH0+D1lAaueC4ZgIBokJQnOoEo=;
 b=xrhCABoWZhAvNLUWetIPzURFG0ain3e73Q1D5bYChOT0Qz56g/9c02wIlr3eGX9zwt
 HHHokl7SI77yzXOZc05ov0Rf66dTgWwxvscxet3USjvXnDrP/H+7CwH54h7DDbOhYDM0
 5nE3m59vEjtC/lfC/91wmZCrfr3KZ6ibT1wqINb6YYdBampIpmRyYJttAPTigVGrbcqQ
 HhLjb37MRmIqJ1rtZvooxOPNvoZNwbESsj6BbtUyckKmSUvcp0BYBKxcwMmbXfefgz8p
 s66UTGOwfabCA2+U7y5JzsX5xynwqBT0abyDxeC3DsdQgB3yucYj6Uw0Ki/0A2V8TCiv
 VuMA==
X-Gm-Message-State: AFqh2kqMB/q4jHH8oRo2tenbwbEyYzSBUp8zBNxuCoxOFFth4yiPwG8/
 tlCuf+bqGQPivWkuJcyWNKhh8Q==
X-Google-Smtp-Source: AMrXdXsVXFK6J3FI/oNC9B2qh8iRRbulOB/J3Gh4vyDVzfdXvWdeQZr51O5qsgmn1ZDrVvMY0QWzVA==
X-Received: by 2002:adf:f70d:0:b0:2bc:7d67:90e with SMTP id
 r13-20020adff70d000000b002bc7d67090emr7926446wrp.32.1674112875116; 
 Wed, 18 Jan 2023 23:21:15 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:3936:d49c:4a01:ee1e?
 ([2a01:e0a:982:cbb0:3936:d49c:4a01:ee1e])
 by smtp.gmail.com with ESMTPSA id
 f16-20020a5d50d0000000b002755e301eeasm15178119wrt.100.2023.01.18.23.21.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Jan 2023 23:21:14 -0800 (PST)
Message-ID: <a9059443-f125-f6dc-4686-8212165cd431@linaro.org>
Date: Thu, 19 Jan 2023 08:21:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goat?=
 =?UTF-8?Q?er?= <clg@kaod.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, Kamal Dasu <kdasu.kdev@gmail.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Han Xu <han.xu@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Serge Semin <fancer.lancer@gmail.com>, Haibo Chen <haibo.chen@nxp.com>,
 Yogesh Gaur <yogeshgaur.83@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Heiko Stuebner <heiko@sntech.de>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Li-hao Kuo <lhjeff911@gmail.com>,
 Michal Simek <michal.simek@xilinx.com>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Maxime Ripard <mripard@kernel.org>, =?UTF-8?B?77+9ZWNraQ==?=
 <rafal@milecki.pl>, Vaishnav Achath <vaishnav.a@ti.com>,
 Parshuram Thombare <pthombar@cadence.com>, Leilk Liu
 <leilk.liu@mediatek.com>, Gabor Juhos <juhosg@openwrt.org>,
 Bert Vermeulen <bert@biot.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Marek Vasut <marex@denx.de>, Birger Koblitz <mail@birger-koblitz.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Anson Huang <Anson.Huang@nxp.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Kuldeep Singh <singh.kuldeep87k@gmail.com>,
 Pragnesh Patel <pragnesh.patel@sifive.com>,
 Christophe Kerello <christophe.kerello@foss.st.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Erwan Leray <erwan.leray@foss.st.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org, linux-mediatek@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20230118173932.358153-1-krzysztof.kozlowski@linaro.org>
 <20230118173932.358153-2-krzysztof.kozlowski@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230118173932.358153-2-krzysztof.kozlowski@linaro.org>
Subject: Re: [Linux-stm32] [PATCH 2/2] spi: dt-bindings: cleanup examples -
 indentation, lowercase hex
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 18/01/2023 18:39, Krzysztof Kozlowski wrote:
> Cleanup examples:
>   - use 4-space indentation (for cases when it is neither 4 not 2 space),
>   - drop redundant blank lines,
>   - use lowercase hex.
> 
> No functional impact except adjusting to preferred coding style.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   .../bindings/spi/amlogic,meson-gx-spicc.yaml  |  26 +--
>   .../bindings/spi/amlogic,meson6-spifc.yaml    |  22 +--

For meson changes:

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

>   .../bindings/spi/aspeed,ast2600-fmc.yaml      |  24 +--
>   .../bindings/spi/brcm,spi-bcm-qspi.yaml       | 156 +++++++++---------
>   .../bindings/spi/cdns,qspi-nor.yaml           |   4 +-
>   .../bindings/spi/nvidia,tegra210-quad.yaml    |  42 ++---
>   .../bindings/spi/qcom,spi-qcom-qspi.yaml      |   1 -
>   .../devicetree/bindings/spi/renesas,rspi.yaml |  22 +--
>   .../bindings/spi/spi-sunplus-sp7021.yaml      |   4 +-
>   .../devicetree/bindings/spi/st,stm32-spi.yaml |   1 -
>   10 files changed, 150 insertions(+), 152 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/spi/amlogic,meson-gx-spicc.yaml b/Documentation/devicetree/bindings/spi/amlogic,meson-gx-spicc.yaml
> index e5eca3a6f132..4e28e6e9d8e0 100644
> --- a/Documentation/devicetree/bindings/spi/amlogic,meson-gx-spicc.yaml
> +++ b/Documentation/devicetree/bindings/spi/amlogic,meson-gx-spicc.yaml
> @@ -100,17 +100,17 @@ unevaluatedProperties: false
>   examples:
>     - |
>       spi@c1108d80 {
> -          compatible = "amlogic,meson-gx-spicc";
> -          reg = <0xc1108d80 0x80>;
> -          interrupts = <112>;
> -          clocks = <&clk81>;
> -          clock-names = "core";
> -          #address-cells = <1>;
> -          #size-cells = <0>;
> -
> -          display@0 {
> -              compatible = "lg,lg4573";
> -              spi-max-frequency = <1000000>;
> -              reg = <0>;
> -          };
> +        compatible = "amlogic,meson-gx-spicc";
> +        reg = <0xc1108d80 0x80>;
> +        interrupts = <112>;
> +        clocks = <&clk81>;
> +        clock-names = "core";
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        display@0 {
> +            compatible = "lg,lg4573";
> +            spi-max-frequency = <1000000>;
> +            reg = <0>;
> +        };
>       };
> diff --git a/Documentation/devicetree/bindings/spi/amlogic,meson6-spifc.yaml b/Documentation/devicetree/bindings/spi/amlogic,meson6-spifc.yaml
> index 806043fed4d1..8e769ccda97f 100644
> --- a/Documentation/devicetree/bindings/spi/amlogic,meson6-spifc.yaml
> +++ b/Documentation/devicetree/bindings/spi/amlogic,meson6-spifc.yaml
> @@ -40,15 +40,15 @@ unevaluatedProperties: false
>   examples:
>     - |
>       spi@c1108c80 {
> -          compatible = "amlogic,meson6-spifc";
> -          reg = <0xc1108c80 0x80>;
> -          clocks = <&clk81>;
> -          #address-cells = <1>;
> -          #size-cells = <0>;
> -
> -          flash: flash@0 {
> -              compatible = "spansion,m25p80", "jedec,spi-nor";
> -              reg = <0>;
> -              spi-max-frequency = <40000000>;
> -          };
> +        compatible = "amlogic,meson6-spifc";
> +        reg = <0xc1108c80 0x80>;
> +        clocks = <&clk81>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        flash: flash@0 {
> +            compatible = "spansion,m25p80", "jedec,spi-nor";
> +            reg = <0>;
> +            spi-max-frequency = <40000000>;
> +        };
>       };

<snip>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
