Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD59B338C0
	for <lists+linux-stm32@lfdr.de>; Mon, 25 Aug 2025 10:30:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4BB64C36B29;
	Mon, 25 Aug 2025 08:30:16 +0000 (UTC)
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DFE54C36B1F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Aug 2025 08:30:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1756110562; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=MhHgpkvRlopW1CT7s31I4NnkC3rx+KDANguWhuG70gIeX0rBidrILzWCXLcqa0JyGFwHVqCYUP5bQYHDH3vLZd9A99VJboAVwIk54RXS4dWtjErMn3HdH3glQjMv5eX1SpAKBMrGlF1oAsFC/82HkBSB0ssue9W6Dv4RQJWk4Yk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1756110562;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=2pdvZHRr2nT21IPkzNkyEqDph85oX2bzBrlA9adkQMQ=; 
 b=UEhzdtyb781N9LG9VI0TglsH9jeg/H31ieRA5jdJMDarfK+RwC+iugemiFFJT7Fg6Z8H+K1fhQt9n1l6wv68IB+Cd5CD02lQcDL1AWBh+ohFq4xiApyherT04/NX5Ge2Ma0FBIfx48T39P880WEOojD7P8cIhFkeR9Izdt4839A=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1756110562; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=2pdvZHRr2nT21IPkzNkyEqDph85oX2bzBrlA9adkQMQ=;
 b=LMaT0rmPjjFC6J4S5RhNJAr8GD1hTvcNt98ehghIuP1gR1cPNN4PVcvrQAiU1Ou1
 MxprMybncH3rbKPNA/OKNTqOFuMWIiXv7PCiN0EQc/Dz9SXtw1CwBVHBWINErhZ/E94
 aEWib7vqqUq/m7XfviHOKgrGltOKy+t+8YZC0xs8=
Received: by mx.zohomail.com with SMTPS id 1756110560002994.5273037503601;
 Mon, 25 Aug 2025 01:29:20 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Mon, 25 Aug 2025 10:28:22 +0200
MIME-Version: 1.0
Message-Id: <20250825-byeword-update-v3-2-947b841cdb29@collabora.com>
References: <20250825-byeword-update-v3-0-947b841cdb29@collabora.com>
In-Reply-To: <20250825-byeword-update-v3-0-947b841cdb29@collabora.com>
To: Yury Norov <yury.norov@gmail.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
 Jaehoon Chung <jh80.chung@samsung.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
 Shreeya Patel <shreeya.patel@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Shawn Lin <shawn.lin@rock-chips.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
 MyungJoo Ham <myungjoo.ham@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, Qin Jian <qinjian@cqplus1.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
X-Mailer: b4 0.14.2
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 linux-pm@vger.kernel.org, netdev@vger.kernel.org, llvm@lists.linux.dev,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-sound@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-phy@lists.infradead.org, kernel@collabora.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH v3 02/20] mmc: dw_mmc-rockchip: switch to
 FIELD_PREP_WM16 macro
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

The era of hand-rolled HIWORD_UPDATE macros is over, at least for those
drivers that use constant masks.

Switch to the new FIELD_PREP_WM16 macro in hw_bitfield.h, which has
error checking. Instead of redefining the driver's HIWORD_UPDATE macro
in this case, replace the two only instances of it with the new macro,
as I could test that they result in an equivalent value.

Acked-by: Ulf Hansson <ulf.hansson@linaro.org>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/mmc/host/dw_mmc-rockchip.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/mmc/host/dw_mmc-rockchip.c b/drivers/mmc/host/dw_mmc-rockchip.c
index d2aec6cf9773dcb057d1bf3785ace586a7955f12..82dd906bb002cb8327691ac1ef4818561c9ac7e6 100644
--- a/drivers/mmc/host/dw_mmc-rockchip.c
+++ b/drivers/mmc/host/dw_mmc-rockchip.c
@@ -6,6 +6,7 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/clk.h>
+#include <linux/hw_bitfield.h>
 #include <linux/mmc/host.h>
 #include <linux/of_address.h>
 #include <linux/mmc/slot-gpio.h>
@@ -24,8 +25,6 @@
 #define ROCKCHIP_MMC_DELAYNUM_OFFSET	2
 #define ROCKCHIP_MMC_DELAYNUM_MASK	(0xff << ROCKCHIP_MMC_DELAYNUM_OFFSET)
 #define ROCKCHIP_MMC_DELAY_ELEMENT_PSEC	60
-#define HIWORD_UPDATE(val, mask, shift) \
-		((val) << (shift) | (mask) << ((shift) + 16))
 
 static const unsigned int freqs[] = { 100000, 200000, 300000, 400000 };
 
@@ -148,9 +147,11 @@ static int rockchip_mmc_set_internal_phase(struct dw_mci *host, bool sample, int
 	raw_value |= nineties;
 
 	if (sample)
-		mci_writel(host, TIMING_CON1, HIWORD_UPDATE(raw_value, 0x07ff, 1));
+		mci_writel(host, TIMING_CON1,
+			   FIELD_PREP_WM16(GENMASK(11, 1), raw_value));
 	else
-		mci_writel(host, TIMING_CON0, HIWORD_UPDATE(raw_value, 0x07ff, 1));
+		mci_writel(host, TIMING_CON0,
+			   FIELD_PREP_WM16(GENMASK(11, 1), raw_value));
 
 	dev_dbg(host->dev, "set %s_phase(%d) delay_nums=%u actual_degrees=%d\n",
 		sample ? "sample" : "drv", degrees, delay_num,

-- 
2.51.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
