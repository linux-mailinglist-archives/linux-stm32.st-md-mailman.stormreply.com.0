Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 05DC66732A7
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Jan 2023 08:41:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 77E1AC6904C;
	Thu, 19 Jan 2023 07:41:56 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 95DAAC69048
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Jan 2023 07:41:54 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30J4AIkV025282; Thu, 19 Jan 2023 08:41:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=jL/MbEBfkVAq5ZMy1e9+noLbvk1MZWNuOQ2c+Fz8nz0=;
 b=BX5ioQOOwo8TiUALeHu96ZUvFqNIHMHC983BbAfFTiaXFGm04nFWgpxOs1Q7wy8bd1tT
 iacyKZPEi3RiNxjrVN23olXkUMvfN1LPcgEkOJgqBS13VE4H31+IPZjKsZJYTAOAlkMT
 wVL+gSSJR/+ua+zPPFyqR+rcwK/c8ePcyJhBfcKCqe7NVkmg0bsxcWYHrl5vTZSYL8jJ
 tM9o3ECjI5clfhz0HeAB4Gu+1cmmSklmH4q2DKtaUl+ZfNNyWLjnc2/8bm5Gj8t00Toz
 vt5LmHTqJz6oq9ZHq4VnRcItZY7fnlvBIqaAKdyh8+tU4QSDXG7WCok/Mg8ZAujzrnsd Aw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3n5mc4y1dj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Jan 2023 08:41:42 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 38C35100039;
 Thu, 19 Jan 2023 08:41:39 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 22EC520F562;
 Thu, 19 Jan 2023 08:41:39 +0100 (CET)
Received: from [10.201.21.26] (10.201.21.26) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Thu, 19 Jan
 2023 08:41:36 +0100
Message-ID: <39af6fac-3e8e-4929-43b3-eb0b7af0ab30@foss.st.com>
Date: Thu, 19 Jan 2023 08:41:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Mark Brown
 <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
 <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, Chin-Ting Kuo
 <chin-ting_kuo@aspeedtech.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goat?=
 =?UTF-8?Q?er?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Kamal Dasu <kdasu.kdev@gmail.com>, Broadcom internal
 kernel review list <bcm-kernel-feedback-list@broadcom.com>, Han Xu
 <han.xu@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Thierry Reding
 <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Andy
 Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad
 Dybcio <konrad.dybcio@linaro.org>,
 Serge Semin <fancer.lancer@gmail.com>, Haibo Chen <haibo.chen@nxp.com>,
 Yogesh Gaur <yogeshgaur.83@gmail.com>, Linus
 Walleij <linus.walleij@linaro.org>,
 Heiko Stuebner <heiko@sntech.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Li-hao Kuo <lhjeff911@gmail.com>,
 Michal Simek <michal.simek@xilinx.com>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?B?77+9ZWNraQ==?= <rafal@milecki.pl>, Vaishnav Achath
 <vaishnav.a@ti.com>, Parshuram Thombare <pthombar@cadence.com>, Leilk Liu
 <leilk.liu@mediatek.com>, Gabor Juhos <juhosg@openwrt.org>, Bert Vermeulen
 <bert@biot.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Marek Vasut
 <marex@denx.de>, Birger Koblitz <mail@birger-koblitz.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Anson Huang <Anson.Huang@nxp.com>, Chris Packham
 <chris.packham@alliedtelesis.co.nz>, Kuldeep Singh
 <singh.kuldeep87k@gmail.com>, Pragnesh Patel <pragnesh.patel@sifive.com>,
 Christophe Kerello <christophe.kerello@foss.st.com>, Erwan Leray
 <erwan.leray@foss.st.com>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 <linux-spi@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-sunxi@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
 <linux-aspeed@lists.ozlabs.org>, <openbmc@lists.ozlabs.org>,
 <linux-mediatek@lists.infradead.org>, <linux-tegra@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-rockchip@lists.infradead.org>,
 <linux-riscv@lists.infradead.org>,
 <linux-stm32@st-md-mailman.stormreply.com>
References: <20230118173932.358153-1-krzysztof.kozlowski@linaro.org>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20230118173932.358153-1-krzysztof.kozlowski@linaro.org>
X-Originating-IP: [10.201.21.26]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-18_05,2023-01-18_01,2022-06-22_01
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hi Krzysztof

On 1/18/23 18:39, Krzysztof Kozlowski wrote:
> Cleanup by removing unneeded quotes from refs and redundant blank lines.
> No functional impact except adjusting to preferred coding style.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

[...]

> diff --git a/Documentation/devicetree/bindings/spi/st,stm32-qspi.yaml b/Documentation/devicetree/bindings/spi/st,stm32-qspi.yaml
> index 1eb17f7a4d86..8bba965a9ae6 100644
> --- a/Documentation/devicetree/bindings/spi/st,stm32-qspi.yaml
> +++ b/Documentation/devicetree/bindings/spi/st,stm32-qspi.yaml
> @@ -11,7 +11,7 @@ maintainers:
>    - Patrice Chotard <patrice.chotard@foss.st.com>
>  
>  allOf:
> -  - $ref: "spi-controller.yaml#"
> +  - $ref: spi-controller.yaml#
>  
>  properties:
>    compatible:


For stm32-qspi 
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
