Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E373C6727CF
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Jan 2023 20:05:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8848CC6904C;
	Wed, 18 Jan 2023 19:05:10 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2E941C69049
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Jan 2023 19:05:09 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id x5so6996490qti.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Jan 2023 11:05:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TOwQfemle8oAtk5HhkSGbIU5cG/VOJmaf2KabL9UxvM=;
 b=ExXnmJxmyomeJT8MjvCi/qyu3Oh16ro1QOVbQ6EZlhZX4d0wOmo4ip+eUY0Pr9+hL7
 EhGxsCek6ApOcTLKn0EZ5/1DqFRLDEpOIawUQ1TcHKgx8yYHxlf1MN4QR12TkScNKCEZ
 6hav5UsMto5nRNMEW+GxVkBEu/CqVrQsM+Z6IsiMMD3q5kSWYknR8dSH89rGSIa7dqW4
 TfAPmTOXOT+McbunGXjvurN7UiLoAHJGngGWQRb17llo/yzEbJ7SIJHejkbGvM9WtVFE
 yOp0US400T7f6/zSOTWoN9EM/ATvTpKBGDeRTe151F7OP3xGq++ofdqgRFgeIyQkwvDV
 Vr4A==
X-Gm-Message-State: AFqh2krVftRMYkDR3CNah7dbdQqVajSvkEk7P9DplluTGAZT6Ph+2EhU
 vIIcWphrqTl3f9YoQMeM+LN3OQvml6A3KAhIWnc=
X-Google-Smtp-Source: AMrXdXvTjLYZHXdko95yB/gNcGLCPgjcEyJzc5lQ9NkNYwwhTzwT3QfVYS5b8BipTy1ryB2PvoXjIg==
X-Received: by 2002:ac8:1490:0:b0:3b3:a377:d721 with SMTP id
 l16-20020ac81490000000b003b3a377d721mr8907375qtj.41.1674068707717; 
 Wed, 18 Jan 2023 11:05:07 -0800 (PST)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com.
 [209.85.219.173]) by smtp.gmail.com with ESMTPSA id
 s5-20020ac85285000000b003b642afbff0sm2389489qtn.1.2023.01.18.11.05.05
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Jan 2023 11:05:07 -0800 (PST)
Received: by mail-yb1-f173.google.com with SMTP id 66so4135034yba.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Jan 2023 11:05:05 -0800 (PST)
X-Received: by 2002:a25:d88c:0:b0:77a:b5f3:d0ac with SMTP id
 p134-20020a25d88c000000b0077ab5f3d0acmr846222ybg.202.1674068694405; Wed, 18
 Jan 2023 11:04:54 -0800 (PST)
MIME-Version: 1.0
References: <20230118173932.358153-1-krzysztof.kozlowski@linaro.org>
 <20230118173932.358153-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230118173932.358153-2-krzysztof.kozlowski@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 18 Jan 2023 20:04:42 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWZOsrBwJrST=49v6JFqCyq_gT0kfA-QS7TS4oigZtM-w@mail.gmail.com>
Message-ID: <CAMuHMdWZOsrBwJrST=49v6JFqCyq_gT0kfA-QS7TS4oigZtM-w@mail.gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bert Vermeulen <bert@biot.com>, Heiko Stuebner <heiko@sntech.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Linus Walleij <linus.walleij@linaro.org>, Gabor Juhos <juhosg@openwrt.org>,
 Thierry Reding <thierry.reding@gmail.com>, Haibo Chen <haibo.chen@nxp.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 =?UTF-8?B?4oCaZWNraQ==?= <rafal@milecki.pl>, linux-riscv@lists.infradead.org,
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
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Han Xu <han.xu@nxp.com>,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, Li-hao Kuo <lhjeff911@gmail.com>,
 Andrew Jeffery <andrew@aj.id.au>, Birger Koblitz <mail@birger-koblitz.de>,
 Bjorn Andersson <andersson@kernel.org>, Kamal Dasu <kdasu.kdev@gmail.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 linux-spi@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Yogesh Gaur <yogeshgaur.83@gmail.com>, Mark Brown <broonie@kernel.org>,
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

On Wed, Jan 18, 2023 at 6:39 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> Cleanup examples:
>  - use 4-space indentation (for cases when it is neither 4 not 2 space),
>  - drop redundant blank lines,
>  - use lowercase hex.
>
> No functional impact except adjusting to preferred coding style.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

>  .../devicetree/bindings/spi/renesas,rspi.yaml |  22 +--

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
