Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 11BE4B3391B
	for <lists+linux-stm32@lfdr.de>; Mon, 25 Aug 2025 10:33:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C9992C36B29;
	Mon, 25 Aug 2025 08:33:36 +0000 (UTC)
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 970C7C36B1F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Aug 2025 08:33:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1756110764; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=kTMmXLlHWeI675VeqekD7vXC+t4fMmn7jLk1NYxdGU5BC4uNsKOCfcSuXamUuxjfdjJYYAbLV/LwlooDWcYBQhlnLQdXke2eX5g3NXC4iYHlwmP2ehpyg0qE6dlxP+EVr3ES8ozjaXOOuCcW5fi1lBCel4ODwGryyJsyLDjrrvY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1756110764;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=ZsbXUJR6MfF1epvff0gLOK9X/43yG7Ki5VmTbs9QBuM=; 
 b=V2Gvaf7zHZrvxMPGxT+e4IyRb5l/A6x2vs7jFDC1vGUeGVGiUm9m7kT/GNl2bBDXqnQUs4y7HTDeyAt4lA8HN2sLIYeHvUAzfDn/6uIZNFGnjVXKfshlsABmrt6T2sIIR5nKeOCrslCZ7G/1H6DEToKezhAC3ZXVaBKuDnEEV4U=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1756110764; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=ZsbXUJR6MfF1epvff0gLOK9X/43yG7Ki5VmTbs9QBuM=;
 b=YFojpnysCPQhfARz6PrsrbJjbfmBu+rqnl+DB3m8Dgk2kYK97kTACquI7W6hY6dN
 hPwyNGN0b7sKSRxVPqUjlBNeegTXTdQw8kDxN2eLYKDVldmBwbr/cVpbzV5iQEDdcMY
 KTMZQ0w6J9EnoB0r517lNA2YGrwszAWuUUvCp7t0=
Received: by mx.zohomail.com with SMTPS id 1756110762879601.7323474914235;
 Mon, 25 Aug 2025 01:32:42 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Mon, 25 Aug 2025 10:28:36 +0200
MIME-Version: 1.0
Message-Id: <20250825-byeword-update-v3-16-947b841cdb29@collabora.com>
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
Subject: [Linux-stm32] [PATCH v3 16/20] PCI: rockchip: Switch to
	FIELD_PREP_WM16* macros
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

The Rockchip PCI driver, like many other Rockchip drivers, has its very
own definition of HIWORD_UPDATE.

Remove it, and replace its usage with either FIELD_PREP_WM16, or two new
header local macros for setting/clearing a bit with the high mask, which
use FIELD_PREP_WM16_CONST internally. In the process, ENCODE_LANES
needed to be adjusted, as FIELD_PREP_WM16* shifts the value for us.

That this is equivalent was verified by first making all FIELD_PREP_WM16
instances FIELD_PREP_WM16_CONST, then doing a static_assert() comparing
it to the old macro (and for those with parameters, static_asserting for
the full range of possible values with the old encode macro).

What we get out of this is compile time error checking to make sure the
value actually fits in the mask, and that the mask fits in the register,
and also generally less icky code that writes shifted values when it
actually just meant to set and clear a handful of bits.

Acked-by: Bjorn Helgaas <bhelgaas@google.com>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/pci/controller/pcie-rockchip.h | 35 +++++++++++++++++-----------------
 1 file changed, 18 insertions(+), 17 deletions(-)

diff --git a/drivers/pci/controller/pcie-rockchip.h b/drivers/pci/controller/pcie-rockchip.h
index 72a2c045f6fe95cb43f01a2841a5ca0f597c85d4..3e82a69b9c006e52d134278651c5a420a1f195c2 100644
--- a/drivers/pci/controller/pcie-rockchip.h
+++ b/drivers/pci/controller/pcie-rockchip.h
@@ -12,6 +12,7 @@
 #define _PCIE_ROCKCHIP_H
 
 #include <linux/clk.h>
+#include <linux/hw_bitfield.h>
 #include <linux/kernel.h>
 #include <linux/pci.h>
 #include <linux/pci-ecam.h>
@@ -21,10 +22,10 @@
  * The upper 16 bits of PCIE_CLIENT_CONFIG are a write mask for the lower 16
  * bits.  This allows atomic updates of the register without locking.
  */
-#define HIWORD_UPDATE(mask, val)	(((mask) << 16) | (val))
-#define HIWORD_UPDATE_BIT(val)		HIWORD_UPDATE(val, val)
+#define HWORD_SET_BIT(val)		(FIELD_PREP_WM16_CONST((val), 1))
+#define HWORD_CLR_BIT(val)		(FIELD_PREP_WM16_CONST((val), 0))
 
-#define ENCODE_LANES(x)			((((x) >> 1) & 3) << 4)
+#define ENCODE_LANES(x)			((((x) >> 1) & 3))
 #define MAX_LANE_NUM			4
 #define MAX_REGION_LIMIT		32
 #define MIN_EP_APERTURE			28
@@ -32,21 +33,21 @@
 
 #define PCIE_CLIENT_BASE		0x0
 #define PCIE_CLIENT_CONFIG		(PCIE_CLIENT_BASE + 0x00)
-#define   PCIE_CLIENT_CONF_ENABLE	  HIWORD_UPDATE_BIT(0x0001)
-#define   PCIE_CLIENT_CONF_DISABLE       HIWORD_UPDATE(0x0001, 0)
-#define   PCIE_CLIENT_LINK_TRAIN_ENABLE	  HIWORD_UPDATE_BIT(0x0002)
-#define   PCIE_CLIENT_LINK_TRAIN_DISABLE  HIWORD_UPDATE(0x0002, 0)
-#define   PCIE_CLIENT_ARI_ENABLE	  HIWORD_UPDATE_BIT(0x0008)
-#define   PCIE_CLIENT_CONF_LANE_NUM(x)	  HIWORD_UPDATE(0x0030, ENCODE_LANES(x))
-#define   PCIE_CLIENT_MODE_RC		  HIWORD_UPDATE_BIT(0x0040)
-#define   PCIE_CLIENT_MODE_EP            HIWORD_UPDATE(0x0040, 0)
-#define   PCIE_CLIENT_GEN_SEL_1		  HIWORD_UPDATE(0x0080, 0)
-#define   PCIE_CLIENT_GEN_SEL_2		  HIWORD_UPDATE_BIT(0x0080)
+#define   PCIE_CLIENT_CONF_ENABLE		HWORD_SET_BIT(0x0001)
+#define   PCIE_CLIENT_CONF_DISABLE		HWORD_CLR_BIT(0x0001)
+#define   PCIE_CLIENT_LINK_TRAIN_ENABLE		HWORD_SET_BIT(0x0002)
+#define   PCIE_CLIENT_LINK_TRAIN_DISABLE	HWORD_CLR_BIT(0x0002)
+#define   PCIE_CLIENT_ARI_ENABLE		HWORD_SET_BIT(0x0008)
+#define   PCIE_CLIENT_CONF_LANE_NUM(x)		FIELD_PREP_WM16(0x0030, ENCODE_LANES(x))
+#define   PCIE_CLIENT_MODE_RC			HWORD_SET_BIT(0x0040)
+#define   PCIE_CLIENT_MODE_EP			HWORD_CLR_BIT(0x0040)
+#define   PCIE_CLIENT_GEN_SEL_1			HWORD_CLR_BIT(0x0080)
+#define   PCIE_CLIENT_GEN_SEL_2			HWORD_SET_BIT(0x0080)
 #define PCIE_CLIENT_LEGACY_INT_CTRL	(PCIE_CLIENT_BASE + 0x0c)
-#define   PCIE_CLIENT_INT_IN_ASSERT		HIWORD_UPDATE_BIT(0x0002)
-#define   PCIE_CLIENT_INT_IN_DEASSERT		HIWORD_UPDATE(0x0002, 0)
-#define   PCIE_CLIENT_INT_PEND_ST_PEND		HIWORD_UPDATE_BIT(0x0001)
-#define   PCIE_CLIENT_INT_PEND_ST_NORMAL	HIWORD_UPDATE(0x0001, 0)
+#define   PCIE_CLIENT_INT_IN_ASSERT		HWORD_SET_BIT(0x0002)
+#define   PCIE_CLIENT_INT_IN_DEASSERT		HWORD_CLR_BIT(0x0002)
+#define   PCIE_CLIENT_INT_PEND_ST_PEND		HWORD_SET_BIT(0x0001)
+#define   PCIE_CLIENT_INT_PEND_ST_NORMAL	HWORD_CLR_BIT(0x0001)
 #define PCIE_CLIENT_SIDE_BAND_STATUS	(PCIE_CLIENT_BASE + 0x20)
 #define   PCIE_CLIENT_PHY_ST			BIT(12)
 #define PCIE_CLIENT_DEBUG_OUT_0		(PCIE_CLIENT_BASE + 0x3c)

-- 
2.51.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
