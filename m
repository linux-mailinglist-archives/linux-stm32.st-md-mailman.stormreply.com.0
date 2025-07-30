Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FFD5B15FC0
	for <lists+linux-stm32@lfdr.de>; Wed, 30 Jul 2025 13:48:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C97C7C3F94F;
	Wed, 30 Jul 2025 11:48:12 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AFAA9C36B29
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Jul 2025 09:34:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1788343A64;
 Wed, 30 Jul 2025 09:34:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4047CC4CEF5;
 Wed, 30 Jul 2025 09:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753868086;
 bh=0jkmJjmaLP26q19mUDnS43dqbcQIG+Aa08NpifOstZ4=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=TmAAKvXdDoW/CWU1bIrTKUHmmGHqTa0gGirkycgOKiG3JXRxCzMoHt4wQgCSEdVXb
 k0ZYLvbZ1Rm7AMx287Y/rx3Xm++nXEEiO0Ym2huhAik83Lp1RDv8KzUQQJcyQmy8HK
 ZM1ohBTvCRjQPrK7tnkcrFn9xfDjJk8lD4ut7utYa26O/JjpOeSh6Cxkj0QcLPmTTB
 FHer34d0RC/ZQDNB4Q1ZXx/PwPZ9GsTTlMMkqM3kWuRVTZ00KEye8E6Ozt7ZVDO6L+
 2r+IcE5ef1D7VvGRBXVajkGwc77mBT3LUq3lgJ+TvwR7yslcDnbodWWo5EuzEocsI2
 AqqUn5a3MGaLA==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Wed, 30 Jul 2025 11:33:28 +0200
MIME-Version: 1.0
Message-Id: <20250730-topic-dma_genise_cookie-v1-1-b505c1238f9f@oss.qualcomm.com>
References: <20250730-topic-dma_genise_cookie-v1-0-b505c1238f9f@oss.qualcomm.com>
In-Reply-To: <20250730-topic-dma_genise_cookie-v1-0-b505c1238f9f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753868049; l=1740;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=yNIS2ZIXL38n6NlfTncthlTW/cDDGkytjzcrGiY6noU=;
 b=jRMGBRYh5z3VhrE2hOQ/tsahlnmmCcC5+6eD5S7UtXRq/sQbsboibgpVNMlio7nRvIevSuKgV
 G2e4Ba2obqDAiq+P7fA3mJTvqy4/YFtc8YKHIuHXwOfKw1XAd4F1c9N
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
Subject: [Linux-stm32] [PATCH RFC 1/6] dt-bindings: dma: qcom,
 gpi: Retire passing the protocol ID
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

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

This is a software construct that has no business being expressed in
dt-bindings. Drivers can be constructed to retrieve the protocol ID at
runtime or hardcode them per protocol.

Remove it, as a pre-requisite for further simplifying the GENI
bindings.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/dma/qcom,gpi.yaml | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
index bbe4da2a11054f0d272017ddf5d5f7e47cf7a443..745613b93b210afd38946030f7477e91e08c907a 100644
--- a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
+++ b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
@@ -61,14 +61,13 @@ properties:
     maxItems: 13
 
   "#dma-cells":
-    const: 3
+    const: 2
     description: >
       DMA clients must use the format described in dma.txt, giving a phandle
       to the DMA controller plus the following 3 integer cells:
       - channel: if set to 0xffffffff, any available channel will be allocated
         for the client. Otherwise, the exact channel specified will be used.
       - seid: serial id of the client as defined in the SoC documentation.
-      - client: type of the client as defined in dt-bindings/dma/qcom-gpi.h
 
   iommus:
     maxItems: 1
@@ -98,7 +97,7 @@ examples:
     #include <dt-bindings/dma/qcom-gpi.h>
     gpi_dma0: dma-controller@800000 {
         compatible = "qcom,sdm845-gpi-dma";
-        #dma-cells = <3>;
+        #dma-cells = <2>;
         reg = <0x00800000 0x60000>;
         iommus = <&apps_smmu 0x0016 0x0>;
         dma-channels = <13>;

-- 
2.50.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
