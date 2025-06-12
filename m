Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 535CCAD7A3B
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Jun 2025 20:59:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0D8ECC32E8E;
	Thu, 12 Jun 2025 18:59:12 +0000 (UTC)
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3B243C36B29
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Jun 2025 18:59:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1749754704; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=cI/VJOz6iJRVy6Ke4ddXZCY5EqBJ4AL4k4M68S2b0hPiptTEUCC4d0Yb0ZOoNR1V7j1mgV4A0ByOh9G3U04ael5E1s+XDF1yRuc87MQSt2vf8WCID7fbzjeawtGKaYou6TmOTaGo0RcsdXmZKTl+7uEjbUJX4Z9KP3XT4KDeMk8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1749754704;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=XPgEfeDWn7zZb6b80MRD6oKIcz/PXencyibHYlKo4x4=; 
 b=Yx4JZe0B8F8t0N77FWCB7yYsoB6WPCkh0zAWKdfzfvXKM4zPO3zFWCcP6XgdmzTuyhqjAgo2i7BN8OgugnF0Utgbr1hGr+Xrq04t7PxPAj65wRmis7Y8bW1wsQDoIoy8MhRvnBhxNqN58ic1x2aSQbtuwgiaxO/zpxDVAPyR3kk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1749754704; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=XPgEfeDWn7zZb6b80MRD6oKIcz/PXencyibHYlKo4x4=;
 b=CeWXfP7vQMRhmUek6S4U1SCn1IOQDC68dC8eLaOo5bY//WywPJkZbpweBmO1kpSZ
 E/i5O8jSTcGAVgeiSOTuAhOVGveYMHg2STC/3KqlkuAQlVG3nfITu9oLcB/yW/gCwOx
 SFAy9cQt4vKGxq98BDTTG3H359iYcGMLHxvKdzoA=
Received: by mx.zohomail.com with SMTPS id 174975470269822.139624322668624;
 Thu, 12 Jun 2025 11:58:22 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Thu, 12 Jun 2025 20:56:11 +0200
MIME-Version: 1.0
Message-Id: <20250612-byeword-update-v1-9-f4afb8f6313f@collabora.com>
References: <20250612-byeword-update-v1-0-f4afb8f6313f@collabora.com>
In-Reply-To: <20250612-byeword-update-v1-0-f4afb8f6313f@collabora.com>
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
Subject: [Linux-stm32] [PATCH 09/20] phy: rockchip-samsung-dcphy: switch to
 HWORD_UPDATE macro
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

phy-rockchip-samsung-dcphy is actually an exemplary example, where the
similarities to FIELD_PREP were spotted and the driver local macro has
the same semantics as the new HWORD_UPDATE bitfield.h macro.

Still, get rid of FIELD_PREP_HIWORD now that a shared implementation
exists, replacing the two instances of it with HWORD_UPDATE. This gives
us slightly better error checking; the value is now checked to fit in 16
bits.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
index 28a052e17366516d5a99988bec9a52e3f0f09101..71e88635c95371fcc6f0f7227954e1f34dd97fc6 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
@@ -20,12 +20,6 @@
 #include <linux/regmap.h>
 #include <linux/reset.h>
 
-#define FIELD_PREP_HIWORD(_mask, _val)		\
-	(					\
-		FIELD_PREP((_mask), (_val)) |	\
-		((_mask) << 16)			\
-	)
-
 #define BIAS_CON0		0x0000
 #define I_RES_CNTL_MASK		GENMASK(6, 4)
 #define I_RES_CNTL(x)		FIELD_PREP(I_RES_CNTL_MASK, x)
@@ -252,8 +246,8 @@
 
 /* MIPI_CDPHY_GRF registers */
 #define MIPI_DCPHY_GRF_CON0		0x0000
-#define S_CPHY_MODE			FIELD_PREP_HIWORD(BIT(3), 1)
-#define M_CPHY_MODE			FIELD_PREP_HIWORD(BIT(0), 1)
+#define S_CPHY_MODE			HWORD_UPDATE(BIT(3), 1)
+#define M_CPHY_MODE			HWORD_UPDATE(BIT(0), 1)
 
 enum hs_drv_res_ohm {
 	STRENGTH_30_OHM = 0x8,

-- 
2.49.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
