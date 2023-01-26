Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E7D67C183
	for <lists+linux-stm32@lfdr.de>; Thu, 26 Jan 2023 01:25:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 94426C69057;
	Thu, 26 Jan 2023 00:25:39 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EBF19C69055
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Jan 2023 00:25:37 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 909F6616F6;
 Thu, 26 Jan 2023 00:25:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39A33C433D2;
 Thu, 26 Jan 2023 00:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674692736;
 bh=rcUgsNadKKTYCHHFUAWb2M6WYShRxFqUqgbGPO0Ctyo=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=USfPHSeVEkf75rA9BZhlvuBgt3C7xXOJz8CoJRO6VnKLCjKvOAvSuVOAAHVjwSZuH
 JX2uNAzawrEKpN+IqKJBN8lZGMGtxJCIlcga2OR/Jokxood0zP+0bznprQUUG8DKwD
 QQ4K8QcBAABfVqaYdZkX1GDNvLDUpOqo8lT76FcMgCjtCOTzSgIuGkJP+fXUzUf6dD
 100h5T1y3ypmPfXHYY5ic0/FD44fBeYBRbgvrs6b+RGsQdN+Y9IGXhlnFK4zWS8fRh
 7XQZeHxve4rzsEvNEN1VoemmfZArPIZ/VVHfPgRMbQaX3uomO1YRRPxzlGNr8JKnr3
 01bMP8uE6lW7Q==
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, 
 =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, 
 Kamal Dasu <kdasu.kdev@gmail.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Han Xu <han.xu@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
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
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Li-hao Kuo <lhjeff911@gmail.com>, 
 Michal Simek <michal.simek@xilinx.com>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?=EF=BF=BDecki?= <rafal@milecki.pl>, 
 Vaishnav Achath <vaishnav.a@ti.com>, 
 Parshuram Thombare <pthombar@cadence.com>, 
 Leilk Liu <leilk.liu@mediatek.com>, Gabor Juhos <juhosg@openwrt.org>, 
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
 linux-stm32@st-md-mailman.stormreply.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230124083342.34869-1-krzysztof.kozlowski@linaro.org>
References: <20230124083342.34869-1-krzysztof.kozlowski@linaro.org>
Message-Id: <167469271489.2661317.15374060752399847689.b4-ty@kernel.org>
Date: Thu, 26 Jan 2023 00:25:14 +0000
MIME-Version: 1.0
X-Mailer: b4 0.12.0
Cc: Rob Herring <robh@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v2 1/2] spi: dt-bindings: drop unneeded
	quotes
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

On Tue, 24 Jan 2023 09:33:41 +0100, Krzysztof Kozlowski wrote:
> Cleanup by removing unneeded quotes from refs and redundant blank lines.
> No functional impact except adjusting to preferred coding style.
> 
> 

Applied to

   broonie/spi.git for-next

Thanks!

[1/2] spi: dt-bindings: drop unneeded quotes
      commit: 99a7fa0e75a3a595a577fb5efa4b84a491f664a2
[2/2] spi: dt-bindings: cleanup examples - indentation, lowercase hex
      commit: ee8d422c91d87ebe230769b2cb89f087e56b560a

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
