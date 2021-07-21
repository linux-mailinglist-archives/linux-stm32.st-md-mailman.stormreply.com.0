Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD423D15F4
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Jul 2021 20:13:19 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2EB2DC5A4C0;
	Wed, 21 Jul 2021 18:13:19 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B3EE4C597BD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Jul 2021 18:13:17 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id CF3D681D6C;
 Wed, 21 Jul 2021 20:13:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1626891197;
 bh=oO15nSd8cshgFLkbt5ZxWOqYYzAWa+6VsA+K7ut4Hs8=;
 h=From:To:Cc:Subject:Date:From;
 b=sYV6Kz5zqDKQkU8QIXYQdAmthUnTYpH15pDVFk0VB57x/+cuJSI0yysZAJD/izD3k
 q+kbrgaBgG2sngAn3B5tVRxzAc+JywRO8UlMD8qoeIrOAYG2ktUHH3lIWdZkQK4Dop
 GCoF/2SFt1KWRNAIFQqeYG/3tqAhBcYcjIqdIzD7AqHolcJnGHKBIyZ4DCivePLBOZ
 y83mlk+rdiBVNeRe95Ie98cUNrKfcydbuy/SmBpQ2a5b6jxDMVmqErs4LqRyBqXjq4
 BAe5jF+WO2CzPp5gI59R+sK+cYS77IppGzGGaohPk+yDGaGxYZ3dlFPxYgARijMy+u
 nOsRa8BP9+E4w==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Date: Wed, 21 Jul 2021 20:12:53 +0200
Message-Id: <20210721181253.126823-1-marex@denx.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Cc: cniedermaier@dh-electronics.com, Marek Vasut <marex@denx.de>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH] ARM: dts: stm32: Disable LAN8710 EDPD on DHCOM
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

The LAN8710 Energy Detect Power Down (EDPD) functionality might cause
unreliable cable detection. There are multiple accounts of this in the
SMSC PHY driver patches which attempted to make EDPD reliable, however
it seems there is always some sort of corner case left. Unfortunatelly,
there is no errata documented which would confirm this to be a silicon
bug on the LAN87xx series of PHYs (LAN8700, LAN8710, LAN8720 at least).

Disable EDPD on the DHCOM SoM, just like multiple other boards already
do as well, to make the cable detection reliable.

Fixes: 34e0c7847dcf ("ARM: dts: stm32: Add DH Electronics DHCOM STM32MP1 SoM and PDK2 board")
Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com
To: linux-arm-kernel@lists.infradead.org
---
 arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
index 8349c9099e301..8c41f819f7769 100644
--- a/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
+++ b/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
@@ -140,6 +140,7 @@ phy0: ethernet-phy@1 {
 			reset-gpios = <&gpioh 3 GPIO_ACTIVE_LOW>;
 			reset-assert-us = <500>;
 			reset-deassert-us = <500>;
+			smsc,disable-energy-detect;
 			interrupt-parent = <&gpioi>;
 			interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
 		};
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
