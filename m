Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 264DCB24F3F
	for <lists+linux-stm32@lfdr.de>; Wed, 13 Aug 2025 18:16:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DDBABC36B16;
	Wed, 13 Aug 2025 16:16:29 +0000 (UTC)
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 86AE9C36B15
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Aug 2025 16:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 sang-engineering.com; h=from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 s=k1; bh=JOIOq894v+zaK4XV37kMzgRxg3LpyHPgMP/RL2Mj3a4=; b=gQgD4H
 D9eZ10uOMPdefygxiftpeI0O9E4P2jdt5Ft+P6+nRtsbPFJo/Rx7oP5R4qfkLOlk
 K8yTgsKitD2MGbLSdu7nsxjvMIzS4QRN6PDl/lbizFjApUYmaqz0FU1/+UYXoJHr
 kfREh1l1caSGge8T+0wGQD9Q8LrToK/Mt10h7u14NxdhGIQr9CG+MqtDfcTBCIOh
 scvODsgiNRQbNO/DX8xchORmLrWw13AXbSHx1ceMwnmtnr5AQ4Yqi8fbgjgH+cEz
 W+QTokqZBfvPTn0uK0cUMiu6aKSevxnWHJuTMBTDNSQ5F8jlJEmKsQnaf8WCp+Y6
 M9lCqwuXQ+wny+cw==
Received: (qmail 695008 invoked from network); 13 Aug 2025 18:16:13 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 13 Aug 2025 18:16:13 +0200
X-UD-Smtp-Session: l3s3148p1@Tie5eUE8HNttKLKq
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-kernel@vger.kernel.org
Date: Wed, 13 Aug 2025 18:14:55 +0200
Message-ID: <20250813161517.4746-10-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250813161517.4746-1-wsa+renesas@sang-engineering.com>
References: <20250813161517.4746-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-samsung-soc@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Samuel Holland <samuel@sholland.org>, imx@lists.linux.dev,
 Fabio Estevam <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-sunxi@lists.linux.dev, Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Chen-Yu Tsai <wens@csie.org>, Mark Brown <broonie@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Shawn Guo <shawnguo@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 09/21] mfd: remove unneeded 'fast_io'
	parameter in regmap_config
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

When using MMIO with regmap, fast_io is implied. No need to set it
again.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
No dependencies, can be applied directly to the subsystem tree. Buildbot is
happy, too.

 drivers/mfd/exynos-lpass.c    | 1 -
 drivers/mfd/fsl-imx25-tsadc.c | 1 -
 drivers/mfd/stm32-lptimer.c   | 1 -
 drivers/mfd/sun4i-gpadc.c     | 1 -
 4 files changed, 4 deletions(-)

diff --git a/drivers/mfd/exynos-lpass.c b/drivers/mfd/exynos-lpass.c
index 44797001a432..9bb2687c2835 100644
--- a/drivers/mfd/exynos-lpass.c
+++ b/drivers/mfd/exynos-lpass.c
@@ -101,7 +101,6 @@ static const struct regmap_config exynos_lpass_reg_conf = {
 	.reg_stride	= 4,
 	.val_bits	= 32,
 	.max_register	= 0xfc,
-	.fast_io	= true,
 };
 
 static void exynos_lpass_disable_lpass(void *data)
diff --git a/drivers/mfd/fsl-imx25-tsadc.c b/drivers/mfd/fsl-imx25-tsadc.c
index 0aab6428e042..467b1a23faeb 100644
--- a/drivers/mfd/fsl-imx25-tsadc.c
+++ b/drivers/mfd/fsl-imx25-tsadc.c
@@ -17,7 +17,6 @@
 #include <linux/regmap.h>
 
 static const struct regmap_config mx25_tsadc_regmap_config = {
-	.fast_io = true,
 	.max_register = 8,
 	.reg_bits = 32,
 	.val_bits = 32,
diff --git a/drivers/mfd/stm32-lptimer.c b/drivers/mfd/stm32-lptimer.c
index 09073dbc9c80..123659178cc2 100644
--- a/drivers/mfd/stm32-lptimer.c
+++ b/drivers/mfd/stm32-lptimer.c
@@ -19,7 +19,6 @@ static const struct regmap_config stm32_lptimer_regmap_cfg = {
 	.val_bits = 32,
 	.reg_stride = sizeof(u32),
 	.max_register = STM32_LPTIM_MAX_REGISTER,
-	.fast_io = true,
 };
 
 static int stm32_lptimer_detect_encoder(struct stm32_lptimer *ddata)
diff --git a/drivers/mfd/sun4i-gpadc.c b/drivers/mfd/sun4i-gpadc.c
index 3029d48e982c..bf2f6fdaf8bf 100644
--- a/drivers/mfd/sun4i-gpadc.c
+++ b/drivers/mfd/sun4i-gpadc.c
@@ -72,7 +72,6 @@ static const struct regmap_config sun4i_gpadc_regmap_config = {
 	.reg_bits = 32,
 	.val_bits = 32,
 	.reg_stride = 4,
-	.fast_io = true,
 };
 
 static const struct of_device_id sun4i_gpadc_of_match[] = {
-- 
2.47.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
