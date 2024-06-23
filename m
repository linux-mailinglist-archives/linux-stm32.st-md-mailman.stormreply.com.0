Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D8684913DA6
	for <lists+linux-stm32@lfdr.de>; Sun, 23 Jun 2024 21:16:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8505DC71287;
	Sun, 23 Jun 2024 19:16:24 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E516DC71280
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 23 Jun 2024 19:16:16 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 14420882B8;
 Sun, 23 Jun 2024 21:16:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1719170176;
 bh=jXBLhmBOJIheEaPZEnvhhjmDxmURMa5l2quDyuLkLEk=;
 h=From:To:Cc:Subject:Date:From;
 b=bp0EV5pS8fm8tMEsXQDYzBxkFQEjZG1qm7RqPPyPYpZSTzXUF5L+FghFWo2Sn4EIF
 2X/uum6VtznupylXZiexz0JJlHoDv9sxGkcFDVU/9WfNhxCUFYDHE3+Z4KCJnjdGXN
 WkEUOOiguYFDruVnGCnWeSS/ocjaoPhLaaRG+NI6vutZEcPjJtgofXnkJbW+2VZmPe
 LqxJCPSjreyeg8qIoMm1Vbnh5bXcqt9EqAuM1KrpiZ22x26ykMRxKdz/fdpPw5xlQW
 rcOqzSnfRXM7yPXYCKDUj9vshmYWH2BPQuxfMRDgDkcXXZ4T0zKgrb1u7mRlvl1Vpe
 bfbbYCDKbfG4g==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Date: Sun, 23 Jun 2024 21:15:57 +0200
Message-ID: <20240623191602.67424-1-marex@denx.de>
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
Subject: [Linux-stm32] [PATCH] ARM: dts: stm32: Add phandle to nvmem efuse
	into STM32MP13xx ethernet DT node
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

The efuses on STM32MP13xx can be populated with ethernet MAC address.
Add the nvmem-cells/nvmem-cell-name DT properties to ethernet MAC DT
nodes to describe the placement of both MAC address fields within the
efuses, so the ethernet MAC driver can access the efuses and populate
the correct MAC address into the hardware.

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
 arch/arm/boot/dts/st/stm32mp131.dtsi | 2 ++
 arch/arm/boot/dts/st/stm32mp133.dtsi | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp131.dtsi b/arch/arm/boot/dts/st/stm32mp131.dtsi
index f41508195eb51..55f4150524f3c 100644
--- a/arch/arm/boot/dts/st/stm32mp131.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp131.dtsi
@@ -1528,6 +1528,8 @@ ethernet1: ethernet@5800a000 {
 					 <&rcc ETH1RX>,
 					 <&rcc ETH1STP>,
 					 <&rcc ETH1CK_K>;
+				nvmem-cell-names = "mac-address";
+				nvmem-cells = <&ethernet_mac1_address>;
 				snps,axi-config = <&stmmac_axi_config_1>;
 				snps,mixed-burst;
 				snps,pbl = <2>;
diff --git a/arch/arm/boot/dts/st/stm32mp133.dtsi b/arch/arm/boot/dts/st/stm32mp133.dtsi
index ae2fbc09e93b9..48b6ddb59badf 100644
--- a/arch/arm/boot/dts/st/stm32mp133.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp133.dtsi
@@ -85,6 +85,8 @@ ethernet2: ethernet@5800e000 {
 			 <&rcc ETH2RX>,
 			 <&rcc ETH2STP>,
 			 <&rcc ETH2CK_K>;
+		nvmem-cell-names = "mac-address";
+		nvmem-cells = <&ethernet_mac2_address>;
 		snps,axi-config = <&stmmac_axi_config_2>;
 		snps,mixed-burst;
 		snps,pbl = <2>;
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
