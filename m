Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BFB7673EA5
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Jan 2023 17:24:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3FAFFC6904C;
	Thu, 19 Jan 2023 16:24:38 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DB73BC69048
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Jan 2023 16:24:36 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id br9so4013665lfb.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Jan 2023 08:24:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=8lVOvMoIQ2x2Wf6zy8frHnpB0eXV9ve1xBd2DqHKd8Y=;
 b=a/g9O4xy606aS7gTGUOYByXG9qF6KTMWOZA30DBpya3y/ma8wWSWbZ0GhEnw/5Dd56
 SwWKUvve09j1o3F73iD1XSqxXcz9bXivs5oPpAd58vaExY7Ut/gg8J5SySYtOKeJp85Y
 xmSrmvNHPLNYd+qGYEno2szmpyk9kL3REN4AGFML0pKUuvB9xnBoYaDYyqhUn2RKO/PI
 lFHQZLGbsqrirm06txrQIW/ebbIiz59ba6eAsRY5KjrWXIZ73jywqljunaP/ghJHB5A9
 uKyEtu3Zvgig66EC5x+MjGQiTGePO5AKzyatccaZUr2ktzAcgc0H0B/UBMut22jZ1DsG
 EBCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8lVOvMoIQ2x2Wf6zy8frHnpB0eXV9ve1xBd2DqHKd8Y=;
 b=rs/soJjzftrffKt8F/k+FuNZwn2Mm9iPQtq1HE5m77iyQsYCkICrtsRfTuzK4QbaEK
 md2tOyba8iUcWew/H58Ms0B3yOe/XtFMl3J2dUq8Hlb0lTQ0kQz25nwrlCrtVKOrO8OA
 27LX+K3IGp6aFRpwGJcIfbD/ukPF6OWKEndMXiCI+QaMWVkGyZcUNsXz03AVoaq9kec5
 yivUsQd2dRadMo63SPy+nmzqXHr5Fj2Q2+5Rj1hNoFbDqxPV3O3zBaytfZG/HkAtI6Ye
 qhsoIb2CK78x9/GnVuFKLEvqgIgKmwZNiIdRFWJLMzQPHKDpZcbsiY7Z4kYpeEXEgNh3
 yZzQ==
X-Gm-Message-State: AFqh2krCTRcRaSl51vqevatuL3gAazdtIBiUo5m+AsGcOLav1g6Je1bK
 8fVvpJaPlE5u6dE7ZPDXxqk=
X-Google-Smtp-Source: AMrXdXv7/blNpjVnMJiMaPKfEdqpiTFTh3jtjnRI+SUuGsVsK9TsgKmt9RRC03LAK7v7xiQAHH0RHA==
X-Received: by 2002:a05:6512:25a5:b0:4b5:7338:e2c7 with SMTP id
 bf37-20020a05651225a500b004b57338e2c7mr3358360lfb.53.1674145476128; 
 Thu, 19 Jan 2023 08:24:36 -0800 (PST)
Received: from mobilestation ([95.79.133.202])
 by smtp.gmail.com with ESMTPSA id
 s9-20020ac24649000000b004cb41b43c25sm5884147lfo.197.2023.01.19.08.24.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 08:24:35 -0800 (PST)
Date: Thu, 19 Jan 2023 19:24:31 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <20230119162431.mepdze3xibqjgwsi@mobilestation>
References: <20230118173932.358153-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230118173932.358153-1-krzysztof.kozlowski@linaro.org>
Cc: Bert Vermeulen <bert@biot.com>, Heiko Stuebner <heiko@sntech.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Linus Walleij <linus.walleij@linaro.org>, Gabor Juhos <juhosg@openwrt.org>,
 Thierry Reding <thierry.reding@gmail.com>, Haibo Chen <haibo.chen@nxp.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 =?utf-8?B?77+9ZWNraQ==?= <rafal@milecki.pl>, linux-riscv@lists.infradead.org,
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
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Han Xu <han.xu@nxp.com>,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, Li-hao Kuo <lhjeff911@gmail.com>,
 Andrew Jeffery <andrew@aj.id.au>, Birger Koblitz <mail@birger-koblitz.de>,
 Bjorn Andersson <andersson@kernel.org>, Kamal Dasu <kdasu.kdev@gmail.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Yogesh Gaur <yogeshgaur.83@gmail.com>, Mark Brown <broonie@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 linux-sunxi@lists.linux.dev, Pragnesh Patel <pragnesh.patel@sifive.com>
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

On Wed, Jan 18, 2023 at 06:39:31PM +0100, Krzysztof Kozlowski wrote:
> Cleanup by removing unneeded quotes from refs and redundant blank lines.
> No functional impact except adjusting to preferred coding style.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

[nip]

>  .../bindings/spi/snps,dw-apb-ssi.yaml          |  2 +-

[nip]

> diff --git a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
> index d33b72fabc5d..a132b5fc56e0 100644
> --- a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
> +++ b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
> @@ -10,7 +10,7 @@ maintainers:
>    - Mark Brown <broonie@kernel.org>
>  
>  allOf:
> -  - $ref: "spi-controller.yaml#"
> +  - $ref: spi-controller.yaml#
>    - if:
>        properties:
>          compatible:

For the Synopsys DW SSI bindings:
Reviewed-by: Serge Semin <fancer.lancer@gmail.com>

Thanks
-Serge(y)

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
