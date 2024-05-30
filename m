Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E47F58D4B87
	for <lists+linux-stm32@lfdr.de>; Thu, 30 May 2024 14:25:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AE766C71290;
	Thu, 30 May 2024 12:25:25 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 239B3C71288
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 May 2024 12:25:24 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44UCOtYN097855;
 Thu, 30 May 2024 07:24:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1717071895;
 bh=3ougd+b3QvtDO46mkd5DBz31DYw12/4p05mASmxs/44=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=ftbv5kUowxbkLRVrOvN4erTAIwP+KleX1uoHMyPiuxSS42nq6eLDxVvRqCPl/zHFm
 F9YNq9O03upqCJN+SmxaQEm86GEsjBtxByllFvS2nA8Of8Jqp/968MZVx3VIKez3nq
 UFk8VDgN3YV6ANco0C9G2WB4U0+v8Q2f2IzK+xNo=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44UCOtVD020577
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 30 May 2024 07:24:55 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 30
 May 2024 07:24:54 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 30 May 2024 07:24:55 -0500
Received: from localhost (kamlesh.dhcp.ti.com [172.24.227.123])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44UCOsxb114961;
 Thu, 30 May 2024 07:24:54 -0500
From: <kamlesh@ti.com>
To: <herbert@gondor.apana.org.au>, <kristo@kernel.org>, <will@kernel.org>
Date: Thu, 30 May 2024 17:54:27 +0530
Message-ID: <20240524-mcrc64-upstream-v3-5-24b94d8e8578@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240524-mcrc64-upstream-v3-0-24b94d8e8578@ti.com>
References: <20240524-mcrc64-upstream-v3-0-24b94d8e8578@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: robh@kernel.org, conor+dt@kernel.org, mcoquelin.stm32@gmail.com,
 devicetree@vger.kernel.org, catalin.marinas@arm.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 Kamlesh Gurudasani <kamlesh@ti.com>, akpm@linux-foundation.org,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org, vigneshr@ti.com
Subject: [Linux-stm32] [PATCH v3 5/6 DONOTMERGE] arm64: dts: ti: k3-am62:
	Add dt node, cbass_main ranges for MCRC64
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

From: Kamlesh Gurudasani <kamlesh@ti.com>

Add the address space for MCRC64 to the ranges property of the
cbass_main node and add dt node for MCRC64 engine

Signed-off-by: Kamlesh Gurudasani <kamlesh@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62-main.dtsi | 7 +++++++
 arch/arm64/boot/dts/ti/k3-am62.dtsi      | 1 +
 2 files changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
index e9cffca073ef..f80fd753382b 100644
--- a/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62-main.dtsi
@@ -216,6 +216,13 @@ crypto: crypto@40900000 {
 		dma-names = "tx", "rx1", "rx2";
 	};
 
+	crc: crc@30300000 {
+		compatible = "ti,am62-mcrc64";
+		reg = <0x00 0x30300000 0x00 0x1000>;
+		clocks = <&k3_clks 116 0>;
+		power-domains = <&k3_pds 116 TI_SCI_PD_EXCLUSIVE>;
+	};
+
 	secure_proxy_sa3: mailbox@43600000 {
 		bootph-pre-ram;
 		compatible = "ti,am654-secure-proxy";
diff --git a/arch/arm64/boot/dts/ti/k3-am62.dtsi b/arch/arm64/boot/dts/ti/k3-am62.dtsi
index f0781f2bea29..edb2cb592ee1 100644
--- a/arch/arm64/boot/dts/ti/k3-am62.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62.dtsi
@@ -66,6 +66,7 @@ cbass_main: bus@f0000 {
 			 <0x00 0x30040000 0x00 0x30040000 0x00 0x00080000>, /* PRUSS-M */
 			 <0x00 0x30101000 0x00 0x30101000 0x00 0x00010100>, /* CSI window */
 			 <0x00 0x30200000 0x00 0x30200000 0x00 0x00010000>, /* DSS */
+			 <0x00 0x30300000 0x00 0x30300000 0x00 0x00001000>, /* MCRC64 */
 			 <0x00 0x31000000 0x00 0x31000000 0x00 0x00050000>, /* USB0 DWC3 Core window */
 			 <0x00 0x31100000 0x00 0x31100000 0x00 0x00050000>, /* USB1 DWC3 Core window */
 			 <0x00 0x40900000 0x00 0x40900000 0x00 0x00030000>, /* SA3UL */

-- 
2.34.1
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
