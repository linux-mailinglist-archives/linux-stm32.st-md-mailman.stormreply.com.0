Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3592167324B
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Jan 2023 08:20:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D0293C6904C;
	Thu, 19 Jan 2023 07:20:40 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 42EDFC6334A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Jan 2023 07:20:39 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 f12-20020a7bc8cc000000b003daf6b2f9b9so2909230wml.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Jan 2023 23:20:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:organization:references:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=EonMWt4N08H4pcq7W9DgoBt7pacxKJTS9n8ZU1ACaR4=;
 b=c5k888DHCMgwj2p4c7VKB+53hbN8QqUUGD+eq4cBJ9SFiF/Lcsd2MBJc6I+F/CglPN
 TSHD5ijJMGyCKkf8ZgRZxEUVgGHTVq6170KaXg7gnYBHlJvVAyAjam/Hp/T4I6RiVuB7
 TWHXbsgI7BqheCpGU6MPZOhYHQVXZxIK54s9NeSXWMSgxU+TkALp6He4GOjDEgd4BlE6
 822Cuvr+uUPA/zcB3X5loJ7MfWIgMGisEfZlN2ZcSvT7UenCQkSEYtIf6HjfoZmaBYwk
 acTxloUojf3EbUtOlGH+zsgWf4s2kiqpP7Hc6FrBklnpn+KcNBmD7rGwm7CjmVkBmUdO
 jPuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EonMWt4N08H4pcq7W9DgoBt7pacxKJTS9n8ZU1ACaR4=;
 b=5QyGDlB4q6DSLDN18vH7rcwDVLLGc8O5pQDQzBVii4ygp32bXdBcF0WuEDXMmCeiPD
 /j9/9HHMQKahUQYREkn3Ca70S/cPoQvGmko+n4skDFFlnpfo+93DFMHFQBTaN/6OiU1a
 s3vs8gnqZ3g1l60I8CqYBPhK9miWOJET0PeJmBi8IxT/6TthyxiPgL3yzLO6rus39ACY
 k+v2ITsyYF2ffwC8vxYL+6hNs7UEP63cNVxM+6Bwl0mWscDyCKxqC6MViCR/p6odUW2l
 4Br58DcMDF9JAsIdf6bE8/3BhoqAxtP1QRit1mmpRAWFM7puVEq7n/MJkvQLGK+Vq+51
 Stjg==
X-Gm-Message-State: AFqh2koXzW3kbIpAEuX+uJMBEwwYvSplUiMokF3wrJKz/rxbw9vRpqaE
 VAD74rF9B1PbxVkSeno4JKxLdg==
X-Google-Smtp-Source: AMrXdXvWsSpXnziYInRsyzHlCtWTCvH0LOIewncRqr3HS2r29MSj6gXsgc/2gLu1d+ZnN7zjC8CbUA==
X-Received: by 2002:a05:600c:4f8d:b0:3d3:3d1b:6354 with SMTP id
 n13-20020a05600c4f8d00b003d33d1b6354mr5351090wmq.3.1674112838626; 
 Wed, 18 Jan 2023 23:20:38 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:3936:d49c:4a01:ee1e?
 ([2a01:e0a:982:cbb0:3936:d49c:4a01:ee1e])
 by smtp.gmail.com with ESMTPSA id
 l23-20020a05600c1d1700b003db0dbbea53sm4488667wms.30.2023.01.18.23.20.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Jan 2023 23:20:38 -0800 (PST)
Message-ID: <ad80f09b-3e05-ac71-b471-2b0279eb5ae6@linaro.org>
Date: Thu, 19 Jan 2023 08:20:35 +0100
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
Organization: Linaro Developer Services
In-Reply-To: <20230118173932.358153-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [Linux-stm32] [PATCH 1/2] spi: dt-bindings: drop unneeded quotes
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
> Cleanup by removing unneeded quotes from refs and redundant blank lines.
> No functional impact except adjusting to preferred coding style.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   .../bindings/spi/allwinner,sun4i-a10-spi.yaml  |  2 +-
>   .../bindings/spi/allwinner,sun6i-a31-spi.yaml  |  2 +-
>   .../bindings/spi/amlogic,meson-gx-spicc.yaml   |  6 +++---
>   .../bindings/spi/amlogic,meson6-spifc.yaml     |  6 +++---

For meson changes:

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

>   .../bindings/spi/aspeed,ast2600-fmc.yaml       |  2 +-
>   .../devicetree/bindings/spi/cdns,qspi-nor.yaml |  2 +-
>   .../devicetree/bindings/spi/cdns,xspi.yaml     |  6 +++---
>   .../bindings/spi/fsl,spi-fsl-qspi.yaml         |  2 +-
>   .../devicetree/bindings/spi/fsl-imx-cspi.yaml  |  2 +-
>   .../bindings/spi/mediatek,spi-mt65xx.yaml      |  2 +-
>   .../spi/mediatek,spi-slave-mt27xx.yaml         |  2 +-
>   .../bindings/spi/mikrotik,rb4xx-spi.yaml       |  2 +-
>   .../bindings/spi/mxicy,mx25f0a-spi.yaml        |  2 +-
>   .../devicetree/bindings/spi/mxs-spi.yaml       |  2 +-
>   .../bindings/spi/nvidia,tegra210-quad.yaml     |  2 +-
>   .../bindings/spi/qcom,spi-qcom-qspi.yaml       |  5 ++---
>   .../bindings/spi/realtek,rtl-spi.yaml          |  2 +-
>   .../bindings/spi/snps,dw-apb-ssi.yaml          |  2 +-
>   .../devicetree/bindings/spi/spi-cadence.yaml   |  2 +-
>   .../devicetree/bindings/spi/spi-fsl-lpspi.yaml |  2 +-
>   .../devicetree/bindings/spi/spi-gpio.yaml      |  4 ++--
>   .../devicetree/bindings/spi/spi-mux.yaml       |  4 ++--
>   .../devicetree/bindings/spi/spi-nxp-fspi.yaml  |  2 +-
>   .../devicetree/bindings/spi/spi-pl022.yaml     | 18 +++++++++---------
>   .../devicetree/bindings/spi/spi-rockchip.yaml  |  2 +-
>   .../devicetree/bindings/spi/spi-sifive.yaml    |  6 +++---
>   .../bindings/spi/spi-sunplus-sp7021.yaml       |  2 +-
>   .../devicetree/bindings/spi/spi-xilinx.yaml    |  2 +-
>   .../bindings/spi/spi-zynqmp-qspi.yaml          |  2 +-
>   .../devicetree/bindings/spi/sprd,spi-adi.yaml  |  5 ++---
>   .../devicetree/bindings/spi/st,stm32-qspi.yaml |  2 +-
>   .../devicetree/bindings/spi/st,stm32-spi.yaml  |  2 +-
>   .../bindings/spi/xlnx,zynq-qspi.yaml           |  2 +-
>   33 files changed, 53 insertions(+), 55 deletions(-)
> 

<snip>

> diff --git a/Documentation/devicetree/bindings/spi/amlogic,meson-gx-spicc.yaml b/Documentation/devicetree/bindings/spi/amlogic,meson-gx-spicc.yaml
> index 53eb6562b979..e5eca3a6f132 100644
> --- a/Documentation/devicetree/bindings/spi/amlogic,meson-gx-spicc.yaml
> +++ b/Documentation/devicetree/bindings/spi/amlogic,meson-gx-spicc.yaml
> @@ -2,8 +2,8 @@
>   # Copyright 2019 BayLibre, SAS
>   %YAML 1.2
>   ---
> -$id: "http://devicetree.org/schemas/spi/amlogic,meson-gx-spicc.yaml#"
> -$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +$id: http://devicetree.org/schemas/spi/amlogic,meson-gx-spicc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>   
>   title: Amlogic Meson SPI Communication Controller
>   
> @@ -41,7 +41,7 @@ properties:
>       maxItems: 2
>   
>   allOf:
> -  - $ref: "spi-controller.yaml#"
> +  - $ref: spi-controller.yaml#
>     - if:
>         properties:
>           compatible:
> diff --git a/Documentation/devicetree/bindings/spi/amlogic,meson6-spifc.yaml b/Documentation/devicetree/bindings/spi/amlogic,meson6-spifc.yaml
> index ac3b2ec300ac..806043fed4d1 100644
> --- a/Documentation/devicetree/bindings/spi/amlogic,meson6-spifc.yaml
> +++ b/Documentation/devicetree/bindings/spi/amlogic,meson6-spifc.yaml
> @@ -2,8 +2,8 @@
>   # Copyright 2019 BayLibre, SAS
>   %YAML 1.2
>   ---
> -$id: "http://devicetree.org/schemas/spi/amlogic,meson6-spifc.yaml#"
> -$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +$id: http://devicetree.org/schemas/spi/amlogic,meson6-spifc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>   
>   title: Amlogic Meson SPI Flash Controller
>   
> @@ -11,7 +11,7 @@ maintainers:
>     - Neil Armstrong <neil.armstrong@linaro.org>
>   
>   allOf:
> -  - $ref: "spi-controller.yaml#"
> +  - $ref: spi-controller.yaml#
>   
>   description: |
>     The Meson SPIFC is a controller optimized for communication with SPI

<snip>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
