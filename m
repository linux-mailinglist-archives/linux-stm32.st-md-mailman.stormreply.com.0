Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5554FB15FC2
	for <lists+linux-stm32@lfdr.de>; Wed, 30 Jul 2025 13:48:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0E6BBC3F92E;
	Wed, 30 Jul 2025 11:48:20 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7FC6BC36B29
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Jul 2025 09:35:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 61E4044987;
 Wed, 30 Jul 2025 09:35:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26518C4CEFA;
 Wed, 30 Jul 2025 09:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753868121;
 bh=aA06HY/lOSd3mPr1XSqrpLr6Pd2WiKly7Q4jhNILr0k=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=X20Qu+oAGYALAZW8LlI1Jp8MQCufmMbh8UsHOAntPiRCfIo1vVPagWzlUeHRzM2ib
 jT+xdrw78SNuwjwUb32cbcH3mgxpAoXOZ4Zg1j7NWUooGA/ZzGBOiH9W1L4GWjRWFE
 B/+oPbMaoJ/wt9VhCc9QhlTLuuet2qAKY9aLNueH8qcl65h6W6ooJqVilX5yoB1mc8
 zFhYhT2q7996B2D9NvA675YD22D615U/u5YdtI7LVxBEYGg2dY0FpjSl9cAboL4RVk
 4+8DZ3a/6AahKCAFKmzPsmsdjdV/g3ZCQmkNFHI+3Z7iMJIgQJNyHvl7PPoaU4c/bH
 BKWc4j/OR9R6Q==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Wed, 30 Jul 2025 11:33:30 +0200
MIME-Version: 1.0
Message-Id: <20250730-topic-dma_genise_cookie-v1-3-b505c1238f9f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753868049; l=2282;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=hT9/eTcrm4TFika8xoyExyqhdwm/y3dhh9PjlVi8zDo=;
 b=rFCrLSTCp6a2Uf6sMUaFPcqvBgaQoklHtJ66/j+p46U6SPZphS90PFnkwzDJjknQfkSaPRA61
 hdswKqRCxQHBYk8hSzo3z4zQMrQXXMGPR2fTI1C8CqBTvD4QZfE497x
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
Subject: [Linux-stm32] [PATCH RFC 3/6] dmaengine: qcom: gpi: Accept protocol
	ID hints
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

Client drivers may now pass hints to dmaengine drivers. GPI DMA's only
consumers (GENI SEs) need to pass a protocol (I2C, I3C, SPI, etc.) ID
to the DMA engine driver, for it to take different actions.

Currently, that's done through passing that ID through device tree,
with each Serial Engine expressed NUM_PROTOCOL times, resulting in
terrible dt-bindings that are full of useless copypasta.

To help get rid of that, accept the driver cookie instead, while
keeping backwards compatibility.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/dma/qcom/gpi.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
index 51d19494099dae09f4579ba8c3eddfa0487bf487..de9e564dc21b2230c9446dfb881135003721a750 100644
--- a/drivers/dma/qcom/gpi.c
+++ b/drivers/dma/qcom/gpi.c
@@ -17,6 +17,8 @@
 #include "../dmaengine.h"
 #include "../virt-dma.h"
 
+#include <linux/soc/qcom/geni-se.h>
+
 #define TRE_TYPE_DMA		0x10
 #define TRE_TYPE_IMMEDIATE_DMA	0x11
 #define TRE_TYPE_GO		0x20
@@ -2109,15 +2111,19 @@ static int gpi_find_avail_gpii(struct gpi_dev *gpi_dev, u32 seid)
 /* gpi_of_dma_xlate: open client requested channel */
 static struct dma_chan *gpi_of_dma_xlate(struct of_phandle_args *args,
 					 struct of_dma *of_dma,
-					 void *data)
+					 void *proto)
 {
 	struct gpi_dev *gpi_dev = (struct gpi_dev *)of_dma->of_dma_data;
 	u32 seid, chid;
 	int gpii;
 	struct gchan *gchan;
 
-	if (args->args_count < 3) {
-		dev_err(gpi_dev->dev, "gpii require minimum 2 args, client passed:%d args\n",
+	/* The protocol ID has been historically stored in the third cell */
+	if (!proto && args->args_count < 3)
+		return NULL;
+
+	if (args->args_count < 2) {
+		dev_err(gpi_dev->dev, "gpii requires minimum 2 args, client passed:%d args\n",
 			args->args_count);
 		return NULL;
 	}
@@ -2145,7 +2151,8 @@ static struct dma_chan *gpi_of_dma_xlate(struct of_phandle_args *args,
 	}
 
 	gchan->seid = seid;
-	gchan->protocol = args->args[2];
+	/* The protocol ID is in the teens range, simply ignore the higher bits */
+	gchan->protocol = (u32)((u64)proto);
 
 	return dma_get_slave_channel(&gchan->vc.chan);
 }

-- 
2.50.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
