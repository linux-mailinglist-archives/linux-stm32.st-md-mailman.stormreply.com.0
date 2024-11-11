Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E00A9C3D68
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Nov 2024 12:35:48 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C9D4DC78F62;
	Mon, 11 Nov 2024 11:35:47 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5A13CC71292
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Nov 2024 11:35:40 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 1B97888FC4;
 Mon, 11 Nov 2024 12:35:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1731324939;
 bh=GlzTFJ3IMZj9tO6/VpaH4/1od6HePRgJ3wA01MIwe5k=;
 h=From:To:Cc:Subject:Date:From;
 b=Z/6WPIui5FHu6d4dlpqRxa1mXFsPdY0WE5eWCtnfUHLbd4vimQYyGLWuSH0utzmVR
 4gXcCrWMVrL243NELmUX26yr8OZOFNU+c20b4g2CfQJhy+L0YdfJ/3YElt/ShqkLoA
 73jUOoNsvGfYon7cA1VApQx9hsOm56xZDDV1mhLnvy5V/Ii6NU9sznvqR0ZfU4ahWo
 ipVjZpjQjXMTHd2QLV0fNT0fZYD3Jip9SM+eEqifVWJQErXy4cuO14sbT3ICKwMTpS
 opYkegPhANgeS9BjNrgzNsRzPAPHsWOpEVyq5fH3LYevdmOBan66hviM4YyGcmLWlu
 cAEUmVguBDkKA==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Date: Mon, 11 Nov 2024 12:34:21 +0100
Message-ID: <20241111113524.10727-1-marex@denx.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>,
 Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 imx@lists.linux.dev, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, devicetree@vger.kernel.org,
 kernel@dh-electronics.com, NXP Linux Team <linux-imx@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Peng Fan <peng.fan@nxp.com>
Subject: [Linux-stm32] [PATCH] MAINTAINERS: Update entry for DH electronics
	DHSOM SoMs and boards
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

Update the MAINTAINERS entry to cover all DH electronics DHSOM
SoMs and boards. The DHSOM is the name which covers all modules,
DHCOM is the SODIMM seated SoM, DHCOR is the solder on module.
Use glob pattern to match on every DT file which contains either
of those three module substrings in lowercase.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: kernel@dh-electronics.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-stm32@st-md-mailman.stormreply.com
---
 MAINTAINERS | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1cf1ac44398ae..40b23e71f72dd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6633,19 +6633,14 @@ L:	linux-rtc@vger.kernel.org
 S:	Maintained
 F:	drivers/rtc/rtc-sd2405al.c
 
-DH ELECTRONICS IMX6 DHCOM/DHCOR BOARD SUPPORT
+DH ELECTRONICS DHSOM SOM AND BOARD SUPPORT
 M:	Christoph Niedermaier <cniedermaier@dh-electronics.com>
-L:	kernel@dh-electronics.com
-S:	Maintained
-F:	arch/arm/boot/dts/nxp/imx/imx6*-dhcom-*
-F:	arch/arm/boot/dts/nxp/imx/imx6*-dhcor-*
-
-DH ELECTRONICS STM32MP1 DHCOM/DHCOR BOARD SUPPORT
 M:	Marek Vasut <marex@denx.de>
 L:	kernel@dh-electronics.com
 S:	Maintained
-F:	arch/arm/boot/dts/st/stm32mp1*-dhcom-*
-F:	arch/arm/boot/dts/st/stm32mp1*-dhcor-*
+N:	dhcom
+N:	dhcor
+N:	dhsom
 
 DIALOG SEMICONDUCTOR DRIVERS
 M:	Support Opensource <support.opensource@diasemi.com>
-- 
2.45.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
