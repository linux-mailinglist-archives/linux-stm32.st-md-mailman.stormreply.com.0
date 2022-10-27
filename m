Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 09195610061
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Oct 2022 20:38:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 97B4DC04003;
	Thu, 27 Oct 2022 18:38:42 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 13822C03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Oct 2022 18:38:41 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 2A1BF85074;
 Thu, 27 Oct 2022 20:38:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1666895920;
 bh=Tf/cbDZ9Q5Ce6KX+w1BRbC6nv3pnp6lS/BCjql5rArM=;
 h=From:To:Cc:Subject:Date:From;
 b=qqbosoZzh73W1HjiX1RC/1ye/74nqcH+DCdYjwyB7I13wqyZ5fD9QHiMq7TnJxZUg
 4/n0hW0xFFtAfQYSyU2Bh9PLPcBfwjinFuxxK1Tdkrc7ng1pcs6Q60ENNz4zsKB4bX
 CWmvvnptDlqOklVdP4IAFiFe8VX2sxjRsYWHbsCYpDTztozx1GWHdx+n+C++s9Qgc1
 X2BhV8xz9H5HhVZdlhMbM/AEXNhpdDN24NQV8fxGWMP3Tq7lqWaqAsomYXdc7nqchX
 rXNbJIULpBmC9SWPcwiXy4eK/uvt0HR+td1TQCVlFsoaDqw3HEdcUDSbrzP8Xy7jyX
 KO1d/wdWjVb6g==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Date: Thu, 27 Oct 2022 20:38:26 +0200
Message-Id: <20221027183826.43872-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH] ARM: dts: stm32: Rename mdio0 to mdio on
	DHCOR Testbench board
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

Replace "mdio0" node with "mdio" to match mdio.yaml DT schema.

Fixes: c8ce0dd75515b ("ARM: dts: stm32: Add DHCOR based Testbench board")
Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com
To: linux-arm-kernel@lists.infradead.org
---
 arch/arm/boot/dts/stm32mp15xx-dhcor-testbench.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcor-testbench.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcor-testbench.dtsi
index c7dcee4ee3d1d..5fdb74b652aca 100644
--- a/arch/arm/boot/dts/stm32mp15xx-dhcor-testbench.dtsi
+++ b/arch/arm/boot/dts/stm32mp15xx-dhcor-testbench.dtsi
@@ -62,7 +62,7 @@ &ethernet0 {
 	max-speed = <1000>;
 	phy-handle = <&phy0>;
 
-	mdio0 {
+	mdio {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		compatible = "snps,dwmac-mdio";
-- 
2.35.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
