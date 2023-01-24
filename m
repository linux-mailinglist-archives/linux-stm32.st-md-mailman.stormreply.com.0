Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 871D86792DF
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Jan 2023 09:17:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 118D2C65E72;
	Tue, 24 Jan 2023 08:17:50 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 99BF1C03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Jan 2023 08:17:48 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 bg13-20020a05600c3c8d00b003d9712b29d2so12249872wmb.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Jan 2023 00:17:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OiP0gZn/cpqwNmZsHPi77/HmJt+0GSm02rEXJE0mZuc=;
 b=rz5WOHaNNlWgEXLRbetKeX7R0dRN7zSC9YmNQarI9o4w7Tq5jxfXRqxTsxgHzpx4I9
 0yCwad4pvGwH35vsywIACFAKq4+tmuXHMABvAo0ziD9anYJtCqDdCdcshYllGX+jL33S
 V2jUHNwZjihkw5PkuVs6JSLbPqas8jVCHD1eRQgn0qmI9O5z3akmD8e0KxYGOkHPcExc
 Fs2kH8M96BLXC3Qw6sek5qgvA/pZtumGefcPFbod9+08KQP1qc8bRANz9r4AuZ40tlvZ
 UWZ75isPIPXvR1YDxyxT4wsID9oqc6K65nm1U6AzoDk60eiCoeQHwjb7C+rjvLNcASJE
 as0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OiP0gZn/cpqwNmZsHPi77/HmJt+0GSm02rEXJE0mZuc=;
 b=4k6gnjYo7Ipu+srBfqHGxIGd/KIU2hSwGDdNdOFOT+uDuprf7StL/5UUYiDut82UZQ
 cYhacE3naFezvatU/QaOEdMiHcIpVNdaiMwTMcIq6a3fz6Ij/K4Vc7AjslMtJv93/HSP
 yYcQQzaqTdmWAsq3ImazMXo2wTDe57CdyQee//fv/EALHQxyPE7Q1Tr02YsKgCFAR0Sw
 L7gHJgUxHARyJE1dmJZlDVIX1jUa5xjgEDHL0obUzAxpIbehZA4cycCxaxVys5pZpfsb
 EhZ4uUZSb06uPpGfUYbp+fhjq9PppzZGm4jBM4Pz4fpFiWn4mmYMMiwBo48TN45S5p1S
 22Zw==
X-Gm-Message-State: AFqh2kq/aRgj3ZvMf/vEln0O6zNXpcvUZuvxeLG0DNQ2O22vxP2CBxKW
 hRpXKuydm5XkJ/nQwgin+/AyFQ==
X-Google-Smtp-Source: AMrXdXunRvOxaqJzjCgh5gUlJhksZxNRxnNWUPvYFTObnizcuMzYRwgIcDkar5wVJKqfvWoZ4n/TQw==
X-Received: by 2002:a1c:6a10:0:b0:3da:f665:5b66 with SMTP id
 f16-20020a1c6a10000000b003daf6655b66mr27262779wmc.6.1674548268129; 
 Tue, 24 Jan 2023 00:17:48 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 g16-20020adffc90000000b002882600e8a0sm1298395wrr.12.2023.01.24.00.17.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Jan 2023 00:17:47 -0800 (PST)
Message-ID: <934be0a4-3639-5f72-cf54-b796b32df484@linaro.org>
Date: Tue, 24 Jan 2023 09:17:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
References: <20230118173932.358153-1-krzysztof.kozlowski@linaro.org>
 <20230118173932.358153-2-krzysztof.kozlowski@linaro.org>
 <20230123201751.GA2450665-robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230123201751.GA2450665-robh@kernel.org>
Cc: Bert Vermeulen <bert@biot.com>, Heiko Stuebner <heiko@sntech.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Linus Walleij <linus.walleij@linaro.org>, Gabor Juhos <juhosg@openwrt.org>,
 Thierry Reding <thierry.reding@gmail.com>, Haibo Chen <haibo.chen@nxp.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 =?UTF-8?B?77+9ZWNraQ==?= <rafal@milecki.pl>, linux-riscv@lists.infradead.org,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Jerome Brunet <jbrunet@baylibre.com>, Marek Vasut <marex@denx.de>,
 linux-aspeed@lists.ozlabs.org, Anson Huang <Anson.Huang@nxp.com>,
 Samuel Holland <samuel@sholland.org>, Leilk Liu <leilk.liu@mediatek.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
 Michal Simek <michal.simek@xilinx.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org,
 Chen-Yu Tsai <wens@csie.org>, Andy Gross <agross@kernel.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Joel Stanley <joel@jms.id.au>, linux-arm-msm@vger.kernel.org,
 Orson Zhai <orsonzhai@gmail.com>, linux-amlogic@lists.infradead.org,
 NXP Linux Team <linux-imx@nxp.com>, devicetree@vger.kernel.org,
 Kuldeep Singh <singh.kuldeep87k@gmail.com>, linux-tegra@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Parshuram Thombare <pthombar@cadence.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 openbmc@lists.ozlabs.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Maxime Ripard <mripard@kernel.org>, Vaishnav Achath <vaishnav.a@ti.com>,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goat?= =?UTF-8?Q?er?= <clg@kaod.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Han Xu <han.xu@nxp.com>,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, Li-hao Kuo <lhjeff911@gmail.com>,
 Andrew Jeffery <andrew@aj.id.au>, Birger Koblitz <mail@birger-koblitz.de>,
 Bjorn Andersson <andersson@kernel.org>, Kamal Dasu <kdasu.kdev@gmail.com>,
 linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 linux-spi@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Yogesh Gaur <yogeshgaur.83@gmail.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 linux-sunxi@lists.linux.dev, Pragnesh Patel <pragnesh.patel@sifive.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 23/01/2023 21:17, Rob Herring wrote:
> On Wed, Jan 18, 2023 at 06:39:32PM +0100, Krzysztof Kozlowski wrote:
>> Cleanup examples:
>>  - use 4-space indentation (for cases when it is neither 4 not 2 space),
>>  - drop redundant blank lines,
>>  - use lowercase hex.
>>
>> No functional impact except adjusting to preferred coding style.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>  .../bindings/spi/amlogic,meson-gx-spicc.yaml  |  26 +--
>>  .../bindings/spi/amlogic,meson6-spifc.yaml    |  22 +--
>>  .../bindings/spi/aspeed,ast2600-fmc.yaml      |  24 +--
>>  .../bindings/spi/brcm,spi-bcm-qspi.yaml       | 156 +++++++++---------
>>  .../bindings/spi/cdns,qspi-nor.yaml           |   4 +-
>>  .../bindings/spi/nvidia,tegra210-quad.yaml    |  42 ++---
>>  .../bindings/spi/qcom,spi-qcom-qspi.yaml      |   1 -
>>  .../devicetree/bindings/spi/renesas,rspi.yaml |  22 +--
>>  .../bindings/spi/spi-sunplus-sp7021.yaml      |   4 +-
>>  .../devicetree/bindings/spi/st,stm32-spi.yaml |   1 -
>>  10 files changed, 150 insertions(+), 152 deletions(-)
> 
> [...]
> 
>> diff --git a/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml b/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml
>> index d35c6f7e2dd5..18afdaab946d 100644
>> --- a/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml
>> +++ b/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml
>> @@ -95,7 +95,6 @@ examples:
>>               <&dmamux1 1 40 0x400 0x05>;
>>        dma-names = "rx", "tx";
>>        cs-gpios = <&gpioa 11 0>;
> 
> Looks like the indentation needs adjusting here.
> 

Ack

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
