Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 09EA923F9A6
	for <lists+linux-stm32@lfdr.de>; Sun,  9 Aug 2020 01:36:47 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C6EC3C3FAD6;
	Sat,  8 Aug 2020 23:36:46 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 265A6C3FAD4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  8 Aug 2020 23:36:45 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C1995206C3;
 Sat,  8 Aug 2020 23:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596929803;
 bh=iMAbjkb444Fs60V9JgSpamSFR5MPp1FyaSoD1MkeyFc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YbIoF6IoJOKUTaN8bV9Ycp/tofdKTp5Xz835SavrA6RjphauJYmG4TbkzFAMuHTCd
 bExa5wDItpzeOu4kzp7U8HMpuK8pi9IR6fndy4VpAM2JEOK2/4CzdAJBxO37bfP4XQ
 CiZoTrK4AayOCtzwrdD9yxgMwsSVC9mgHmYPgbRU=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Sat,  8 Aug 2020 19:35:10 -0400
Message-Id: <20200808233542.3617339-41-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200808233542.3617339-1-sashal@kernel.org>
References: <20200808233542.3617339-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>, devicetree@vger.kernel.org,
 Manivannan Sadhasivam <mani@kernel.org>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH AUTOSEL 5.8 41/72] ARM: dts: stm32: Fix spi4
	pins in stm32mp15-pinctrl
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

From: Patrick Delaunay <patrick.delaunay@st.com>

[ Upstream commit 4fe663890ac5b3b099f458b20cce13fe8efec12b ]

Move spi4_pins_a nodes from pinctrl_z to pinctrl as the associated pins
are not in BANK Z.

Fixes: 498a7014989d ("ARM: dts: stm32: Add missing pinctrl entries for STM32MP15")

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm/boot/dts/stm32mp15-pinctrl.dtsi | 28 ++++++++++++------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
index 49132921feeb9..cc505458da2fd 100644
--- a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
@@ -1654,6 +1654,20 @@ pins2 {
 		};
 	};
 
+	spi4_pins_a: spi4-0 {
+		pins {
+			pinmux = <STM32_PINMUX('E', 12, AF5)>, /* SPI4_SCK */
+				 <STM32_PINMUX('E', 6, AF5)>;  /* SPI4_MOSI */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <1>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('E', 13, AF5)>; /* SPI4_MISO */
+			bias-disable;
+		};
+	};
+
 	usart2_pins_a: usart2-0 {
 		pins1 {
 			pinmux = <STM32_PINMUX('F', 5, AF7)>, /* USART2_TX */
@@ -1776,18 +1790,4 @@ pins2 {
 			bias-disable;
 		};
 	};
-
-	spi4_pins_a: spi4-0 {
-		pins {
-			pinmux = <STM32_PINMUX('E', 12, AF5)>, /* SPI4_SCK */
-				 <STM32_PINMUX('E', 6, AF5)>;  /* SPI4_MOSI */
-			bias-disable;
-			drive-push-pull;
-			slew-rate = <1>;
-		};
-		pins2 {
-			pinmux = <STM32_PINMUX('E', 13, AF5)>; /* SPI4_MISO */
-			bias-disable;
-		};
-	};
 };
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
