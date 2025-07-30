Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C94EAB15FC4
	for <lists+linux-stm32@lfdr.de>; Wed, 30 Jul 2025 13:48:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 88665C3F932;
	Wed, 30 Jul 2025 11:48:22 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3680BC36B29
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Jul 2025 09:35:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2476D440BB;
 Wed, 30 Jul 2025 09:35:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CE23C4CEF5;
 Wed, 30 Jul 2025 09:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753868155;
 bh=N00UN43mM8ni3MxsfDldCEpbhEFJB1eKWpki3YYPYWs=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=noqZGFAgIK4mo6I1FeATvcM2ik9vQma41t4JUvtFkKPX2Zyetn8mtfxVbZd45yE/l
 U1Y7mJtuU7SJ7CnstPsB9K/3qhjUv1e7CgSaHl0J3j/ea3QCIEAkIqNTLELSBwDe8I
 skZfM0x2hjLgrbULs/BH/jFJJPXLUcH/woib6J09xkCPOzz4f3nW4fUwsJqGElA1rN
 C7eOoveWThhAUrn9GaIC+eUJQKFKxUe8xiu3UMeUP8xalqL+GLbOclrk1AaQgpePos
 AeZ3QIghSLLNWwhAzXVCWOcVbFBTZ5AqTwazkUJgoNOyvosM2ZHoaMGIraYa5LXHU2
 S5rwqKIyuCchA==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Wed, 30 Jul 2025 11:33:32 +0200
MIME-Version: 1.0
Message-Id: <20250730-topic-dma_genise_cookie-v1-5-b505c1238f9f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753868049; l=1173;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=3qGrKkb0vUuJZdQ+qYHRcWxsslKGyEP5yydY522z8YA=;
 b=aICFJMG7AM48jTVVIFcvL8HDUChGXUjvlcmEfMfL9VNkZkzvMxo+3E1Pz4CGquWLPcm5h3n8G
 X5nW37uxlajC9Yv3uV+k462eLSjMMB00KSWeicS1u5fh7SmWNRlnhIs
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
Subject: [Linux-stm32] [PATCH RFC 5/6] spi: geni-qcom: Hint GENI protocol ID
	to GPI DMA
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

With the API in place, request the correct protocol ID with the GPI DMA
to avoid having to hardcode this obvious information in the device
tree.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/spi/spi-geni-qcom.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
index 768d7482102adec9b7178077724dc3976a2760c8..0ea157ac06e12012e1a36218bf3a4058a9db6048 100644
--- a/drivers/spi/spi-geni-qcom.c
+++ b/drivers/spi/spi-geni-qcom.c
@@ -623,14 +623,14 @@ static int spi_geni_grab_gpi_chan(struct spi_geni_master *mas)
 {
 	int ret;
 
-	mas->tx = dma_request_chan(mas->dev, "tx");
+	mas->tx = dma_request_chan_w_data(mas->dev, "tx", (void *)GENI_SE_SPI);
 	if (IS_ERR(mas->tx)) {
 		ret = dev_err_probe(mas->dev, PTR_ERR(mas->tx),
 				    "Failed to get tx DMA ch\n");
 		goto err_tx;
 	}
 
-	mas->rx = dma_request_chan(mas->dev, "rx");
+	mas->rx = dma_request_chan_w_data(mas->dev, "rx", (void *)GENI_SE_SPI);
 	if (IS_ERR(mas->rx)) {
 		ret = dev_err_probe(mas->dev, PTR_ERR(mas->rx),
 				    "Failed to get rx DMA ch\n");

-- 
2.50.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
