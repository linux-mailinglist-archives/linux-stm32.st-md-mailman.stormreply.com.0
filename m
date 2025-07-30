Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 08FD7B15FBF
	for <lists+linux-stm32@lfdr.de>; Wed, 30 Jul 2025 13:48:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AFB10C3F949;
	Wed, 30 Jul 2025 11:48:12 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B47FBC36B29
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Jul 2025 09:34:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 19747601D5;
 Wed, 30 Jul 2025 09:34:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B05A0C4CEE7;
 Wed, 30 Jul 2025 09:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753868067;
 bh=CIVuQYfavwb/2ra5GsD9SGItvqbBHNthKR9qvQvzOGI=;
 h=From:Subject:Date:To:Cc:From;
 b=mn3mWr7aA9V5VQdmoPI1MDwUFqmYcbYou3spQN0mTpS2xY/Q2IAmer8ElcJzAHti+
 KDI3Je9i5rYwxmc1Uu6frvKz5aCvEdeIaJV5v0eUbJgOtZmLFLXve2bcmizzIvgMEn
 zQqsAseUiBNcc0woER4J692Ev/4bp7WTpJQJ+R/ErEE5f9CVblx7OIN1CZA/zM/LZx
 ZgtSmBLu8mJcqqTFok+wdPrjTWQ4KU23lsYRxK+U5FL/RLAIYBgwxmTvJMoFOzaETL
 y6mDyNH5gHTpUEo+vdF56kw6vXYSq/gBDMHez4n+nx7iA96Ye8h3ttmX3XshWhq+mw
 OFIlGH+1lL8JQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Wed, 30 Jul 2025 11:33:27 +0200
Message-Id: <20250730-topic-dma_genise_cookie-v1-0-b505c1238f9f@oss.qualcomm.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAOfmiWgC/x3MTQqAIBBA4avErBO0P6mrRETpaEOkoRFBePek5
 bd474WIgTDCULwQ8KZI3mWIsgC1Lc4iI50NFa9aLkXDLn+SYvpYZouOIs7K+52QdZ1WK5emNrq
 HXJ8BDT3/eZxS+gB+aeXZaQAAAA==
X-Change-ID: 20250714-topic-dma_genise_cookie-66dcb07f3fd9
To: Vinod Koul <vkoul@kernel.org>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, 
 Ludovic Desroches <ludovic.desroches@microchip.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Paul Cercueil <paul@crapouillou.net>, 
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Viresh Kumar <vireshk@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Frank Li <Frank.Li@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Taichi Sugaya <sugaya.taichi@socionext.com>, 
 Takao Orito <orito.takao@socionext.com>, 
 =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
 Manivannan Sadhasivam <mani@kernel.org>, Daniel Mack <daniel@zonque.org>, 
 Haojian Zhuang <haojian.zhuang@gmail.com>, 
 Robert Jarzmik <robert.jarzmik@free.fr>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 =?utf-8?q?Am=C3=A9lie_Delaunay?= <amelie.delaunay@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Laxman Dewangan <ldewangan@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Peter Ujfalusi <peter.ujfalusi@gmail.com>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>, Michal Simek <michal.simek@amd.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>, 
 Viken Dadhaniya <quic_vdadhani@quicinc.com>, 
 Andi Shyti <andi.shyti@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753868049; l=5799;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=CIVuQYfavwb/2ra5GsD9SGItvqbBHNthKR9qvQvzOGI=;
 b=va5fmQm0vcHgbpGnfydpzko+HQU0+0iHNYCXm7WHYjVRwugQO/jlg6FABqOs3xChvtQiLtHfX
 nwgfqitX8ihAL4cqD4UZZ9Xblo1yiqYPkj39iyy4q4XnXfktK7X59k3
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Mailman-Approved-At: Wed, 30 Jul 2025 11:48:10 +0000
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, imx@lists.linux.dev,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-actions@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 dmaengine@vger.kernel.org, Marijn Suijten <marijn.suijten@somainline.org>,
 linux-spi@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 asahi@lists.linux.dev
Subject: [Linux-stm32] [RFC PATCH 0/6] Allow DMA consumers to pass a cookie
 to providers' of_xlate
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

The DMA subsystem attempts to make it theoretically possible to pair
any DMA block with any user. While that's convenient from a
codebase sanity perspective, some blocks are more intertwined.

One such case is the Qualcomm GENI, where each wrapper contains a
number of Serial Engine instances, each one of which can be programmed
to support a different protocol (such as I2C, I3C, SPI, UART, etc.).

The GPI DMA it's designed together with, needs to receive the ID of the
protocol that's in use, to adjust its behavior accordingly. Currently,
that's done through passing that ID through device tree, with each
Serial Engine expressed NUM_PROTOCOL times, resulting in terrible
dt-bindings that are full of useless copypasta.

Currently, the DT looks like:

i2c@foobar {
	compatible = "qcom,geni-i2c";
	dmas = <&gpi_dma1 0 0 QCOM_GPI_I2C>,
	       <&gpi_dma1 1 0 QCOM_GPI_I2C>;
	// actual hw description
};

spi@foobar {
        compatible = "qcom,geni-spi";
        dmas = <&gpi_dma1 0 1 QCOM_GPI_SPI>,
               <&gpi_dma1 1 1 QCOM_GPI_SPI>;
	// actual, identical hw description
};

Which is manageable when there's two of them. Unfortunately, we're
in the double digits range nowadays.

This series attempts to cut down on that through making the last cell
unnecessary, moving the purely-SW data that the current protocol ID is
into the driver.

The mass of_xlate signature change is a little unfortunate, let me know
if it can be avoided somehow..

Attaching the relevant dt-bindings change and converting one platform
over as an example.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Konrad Dybcio (6):
      dt-bindings: dma: qcom,gpi: Retire passing the protocol ID
      dmaengine: Make of_dma_request_slave_channel pass a cookie to of_xlate
      dmaengine: qcom: gpi: Accept protocol ID hints
      i2c: qcom-geni: Hint GENI protocol ID to GPI DMA
      spi: geni-qcom: Hint GENI protocol ID to GPI DMA
      arm64: dts: qcom: x1e80100: Remove GENI protocol ID from DMA cells

 .../devicetree/bindings/dma/qcom,gpi.yaml          |   5 +-
 arch/arm64/boot/dts/qcom/x1e80100.dtsi             | 198 ++++++++++-----------
 drivers/dma/amba-pl08x.c                           |   3 +-
 drivers/dma/apple-admac.c                          |   3 +-
 drivers/dma/at_hdmac.c                             |   6 +-
 drivers/dma/at_xdmac.c                             |   3 +-
 drivers/dma/bcm2835-dma.c                          |   3 +-
 drivers/dma/dma-jz4780.c                           |   3 +-
 drivers/dma/dmaengine.c                            |  20 ++-
 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c     |   3 +-
 drivers/dma/dw/of.c                                |   3 +-
 drivers/dma/ep93xx_dma.c                           |   6 +-
 drivers/dma/fsl-edma-main.c                        |   6 +-
 drivers/dma/img-mdc-dma.c                          |   3 +-
 drivers/dma/imx-dma.c                              |   3 +-
 drivers/dma/imx-sdma.c                             |   3 +-
 drivers/dma/lgm/lgm-dma.c                          |   3 +-
 drivers/dma/milbeaut-hdmac.c                       |   4 +-
 drivers/dma/mmp_pdma.c                             |   3 +-
 drivers/dma/mmp_tdma.c                             |   3 +-
 drivers/dma/moxart-dma.c                           |   3 +-
 drivers/dma/mxs-dma.c                              |   3 +-
 drivers/dma/nbpfaxi.c                              |   3 +-
 drivers/dma/of-dma.c                               |  18 +-
 drivers/dma/owl-dma.c                              |   3 +-
 drivers/dma/pl330.c                                |   3 +-
 drivers/dma/pxa_dma.c                              |   3 +-
 drivers/dma/qcom/bam_dma.c                         |   3 +-
 drivers/dma/qcom/gpi.c                             |  16 +-
 drivers/dma/qcom/qcom_adm.c                        |   3 +-
 drivers/dma/sh/rcar-dmac.c                         |   3 +-
 drivers/dma/sh/rz-dmac.c                           |   3 +-
 drivers/dma/sh/usb-dmac.c                          |   3 +-
 drivers/dma/st_fdma.c                              |   3 +-
 drivers/dma/ste_dma40.c                            |   3 +-
 drivers/dma/stm32/stm32-dma.c                      |   3 +-
 drivers/dma/stm32/stm32-dma3.c                     |   4 +-
 drivers/dma/stm32/stm32-mdma.c                     |   3 +-
 drivers/dma/sun4i-dma.c                            |   3 +-
 drivers/dma/sun6i-dma.c                            |   3 +-
 drivers/dma/tegra186-gpc-dma.c                     |   3 +-
 drivers/dma/tegra20-apb-dma.c                      |   3 +-
 drivers/dma/tegra210-adma.c                        |   3 +-
 drivers/dma/ti/cppi41.c                            |   3 +-
 drivers/dma/ti/edma.c                              |   3 +-
 drivers/dma/ti/k3-udma.c                           |   3 +-
 drivers/dma/uniphier-xdmac.c                       |   3 +-
 drivers/dma/xilinx/xilinx_dma.c                    |   3 +-
 drivers/dma/xilinx/xilinx_dpdma.c                  |   3 +-
 drivers/dma/xilinx/zynqmp_dma.c                    |   3 +-
 drivers/i2c/busses/i2c-qcom-geni.c                 |   4 +-
 drivers/spi/spi-geni-qcom.c                        |   4 +-
 include/linux/dmaengine.h                          |   7 +
 include/linux/of_dma.h                             |  16 +-
 sound/soc/apple/mca.c                              |   2 +-
 sound/soc/renesas/rcar/dma.c                       |   2 +-
 56 files changed, 261 insertions(+), 177 deletions(-)
---
base-commit: 79fb37f39b77bbf9a56304e9af843cd93a7a1916
change-id: 20250714-topic-dma_genise_cookie-66dcb07f3fd9

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
