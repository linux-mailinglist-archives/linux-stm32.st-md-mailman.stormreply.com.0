Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C8FA391CE3C
	for <lists+linux-stm32@lfdr.de>; Sat, 29 Jun 2024 19:11:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 60534C6DD9F;
	Sat, 29 Jun 2024 17:11:15 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BDE5AC6B460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 29 Jun 2024 17:11:14 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id A479787FC2;
 Sat, 29 Jun 2024 19:11:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1719681074;
 bh=sXLvVRJlnSoumegu1MRQL7hswbQ2cfgnVfoisYRYjcE=;
 h=From:To:Cc:Subject:Date:From;
 b=yzrJkqWcwQtnPC2aAnWxKnDLVNuQc5Bm6+1ZDXINAszJqxSvO9XMg3t5v1bEUsM8E
 0M8qJ2xZ3GXxEThXylOOKELYESXVJ+on1nnh/zHs91oogU0baJ/4paZBsk1X4tI138
 tp0EiTprSYAJQmK3jI0mUwpa8jdfO7K5ituOaFJzZIz46LVZrOMJIHY2yRwDq0q/gG
 1brdrEuu31V+ewMh9Y5vmA5q5uIo0KO5iUV1vqsxIWeEBeYKEt705V6uJjVWDgrC0D
 zfFqdRgWi+g3SdHVBtSp7tSfpkEggYLWBOgIOVrgin2m7nWONw5E0MYMKXIfiZcQHO
 k5Mb19sfXH8uw==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Date: Sat, 29 Jun 2024 19:10:30 +0200
Message-ID: <20240629171100.20285-1-marex@denx.de>
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
Subject: [Linux-stm32] [PATCH] ARM: dts: stm32: Add ethernet MAC nvmem cells
	to DH STM32MP13xx DHCOR DHSBC board
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

Describe ethernet MAC address nvmem cells in DH STM32MP13xx DHCOR DHSBC
board DT. The MAC address can be fused in BSEC OTP fuses and used to set
up MAC address for both ethernet MACs on this board.

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
 arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dts b/arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dts
index bacb70b4256bc..3cc9ad88d61bc 100644
--- a/arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dts
+++ b/arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dts
@@ -75,6 +75,8 @@ channel@12 {
 };
 
 &ethernet1 {
+	nvmem-cell-names = "mac-address";
+	nvmem-cells = <&ethernet_mac1_address>;
 	phy-handle = <&ethphy1>;
 	phy-mode = "rgmii-id";
 	pinctrl-0 = <&eth1_rgmii_pins_a>;
@@ -102,6 +104,8 @@ ethphy1: ethernet-phy@1 {
 };
 
 &ethernet2 {
+	nvmem-cell-names = "mac-address";
+	nvmem-cells = <&ethernet_mac2_address>;
 	phy-handle = <&ethphy2>;
 	phy-mode = "rgmii-id";
 	pinctrl-0 = <&eth2_rgmii_pins_a>;
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
