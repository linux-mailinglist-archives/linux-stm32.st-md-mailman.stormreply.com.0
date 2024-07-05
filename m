Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6246892835B
	for <lists+linux-stm32@lfdr.de>; Fri,  5 Jul 2024 10:01:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 16E43C78013;
	Fri,  5 Jul 2024 08:01:40 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 11AEEC71282
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Jul 2024 08:01:33 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 613AE88582;
 Fri,  5 Jul 2024 10:01:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1720166492;
 bh=MnhCLI681gPEUgDUmqb7TFJpXAtehnNsyv1YCshIkLo=;
 h=From:To:Cc:Subject:Date:From;
 b=sYyGfoxp/Gzj9Uti6PU7iQQTZqlmEGvMf1BkfbBzPAgFCKhdAmIGbkTLkOd7w4GUN
 Ar2jwnltYYFKwyyJzuJ31Eu5dDoSQIfo1aec7QnqWWD1vjdhFYAlNcCrey5yXYILLh
 ZmPGIa0W/OZ76BvTVx+tiIZ/Sze82Ie4XYiS7nZ/6EJzT0CN967M+tCPgoawz3oTxM
 PE+j4U3tgKtz3suMWp8t089wdbMJq3GFlkUVPlyZazSCX+RCEM9bAB5PDf00sVGGCs
 8DIF7LJ8p+Phum5Xr2Bmk4j42ZN8KN9LGLm0Y2oVUOK0eykcBRDXJmraowFgz+KgqW
 esEoQ0avWXjxA==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Date: Fri,  5 Jul 2024 10:01:02 +0200
Message-ID: <20240705080118.75899-1-marex@denx.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 kernel@dh-electronics.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH] ARM: dts: stm32: Disable PHY clock output on
	DH STM32MP13xx DHCOR DHSBC board
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

The RTL8211F PHY clock output is not used on DH STM32MP13xx DHCOR DHSBC
board, disable it to improve EMI characteristics.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Christophe Roullier <christophe.roullier@foss.st.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: kernel@dh-electronics.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-stm32@st-md-mailman.stormreply.com
---
 arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dts b/arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dts
index 3cc9ad88d61bc..425deb5641c17 100644
--- a/arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dts
+++ b/arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dts
@@ -96,6 +96,7 @@ ethphy1: ethernet-phy@1 {
 			interrupt-parent = <&gpiog>;
 			interrupts = <12 IRQ_TYPE_LEVEL_LOW>;
 			reg = <1>;
+			realtek,clkout-disable;
 			reset-assert-us = <15000>;
 			reset-deassert-us = <55000>;
 			reset-gpios = <&gpioa 11 GPIO_ACTIVE_LOW>;
@@ -125,6 +126,7 @@ ethphy2: ethernet-phy@1 {
 			interrupt-parent = <&gpiog>;
 			interrupts = <15 IRQ_TYPE_LEVEL_LOW>;
 			reg = <1>;
+			realtek,clkout-disable;
 			reset-assert-us = <15000>;
 			reset-deassert-us = <55000>;
 			reset-gpios = <&gpiog 8 GPIO_ACTIVE_LOW>;
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
