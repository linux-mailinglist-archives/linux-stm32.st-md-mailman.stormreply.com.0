Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 01DDBB1C290
	for <lists+linux-stm32@lfdr.de>; Wed,  6 Aug 2025 10:59:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 128FFC3F931;
	Wed,  6 Aug 2025 08:59:21 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BD17CC36B11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Aug 2025 08:59:19 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mkl@pengutronix.de>) id 1ujZzT-00023T-78
 for linux-stm32@st-md-mailman.stormreply.com; Wed, 06 Aug 2025 10:59:19 +0200
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b]
 helo=bjornoya.blackshift.org)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <mkl@pengutronix.de>) id 1ujZzS-00CBCs-34
 for linux-stm32@st-md-mailman.stormreply.com;
 Wed, 06 Aug 2025 10:59:18 +0200
Received: from dspam.blackshift.org (localhost [127.0.0.1])
 by bjornoya.blackshift.org (Postfix) with SMTP id 9E51A451D8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 06 Aug 2025 08:59:18 +0000 (UTC)
Received: from hardanger.blackshift.org (unknown [172.20.34.65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by bjornoya.blackshift.org (Postfix) with ESMTPS id 8355F451D86;
 Wed, 06 Aug 2025 08:59:16 +0000 (UTC)
Received: from hardanger.blackshift.org (localhost [::1])
 by hardanger.blackshift.org (OpenSMTPD) with ESMTP id 00ed67c6;
 Wed, 6 Aug 2025 08:59:15 +0000 (UTC)
From: Marc Kleine-Budde <mkl@pengutronix.de>
Date: Wed, 06 Aug 2025 10:59:12 +0200
MIME-Version: 1.0
Message-Id: <20250806-stm32mp15-m_can-add-reset-v1-1-9d81f9c29d65@pengutronix.de>
X-B4-Tracking: v=1; b=H4sIAF8Zk2gC/x3MTQqDMBBA4avIrDuQn2qLVylS0smos0iUjIgg3
 r3B5bd47wTlIqzQNycU3kVlyRX20QDNIU+MEqvBGdeat+lQt+RdWm2L6UshY4gRCytvSDTS8+W
 s/wUPtV8Lj3Lc789wXX+e+odgawAAAA==
X-Change-ID: 20250806-stm32mp15-m_can-add-reset-ccfc47213ba3
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.15-dev-e44bb
X-Developer-Signature: v=1; a=openpgp-sha256; l=1268; i=mkl@pengutronix.de;
 h=from:subject:message-id; bh=/UzzYtavlagWyGGtegXWanhdJH6wLaCLupCcryhZtHg=;
 b=owEBbQGS/pANAwAKAQx0Zd/5kJGcAcsmYgBokxlgVg8zS2uNYYWdg1S46Cypmh+yR3HopVysb
 +06kIcnXIKJATMEAAEKAB0WIQSf+wzYr2eoX/wVbPMMdGXf+ZCRnAUCaJMZYAAKCRAMdGXf+ZCR
 nOfyB/0ev9RiEJlbXX/m469X//l77QlSs4AudFDZQX1cvyMLVeUwBYvT1kJ26UI6wIW2RTc1Ntx
 mFhprYlW4a6KmvMZ2CW5GCKRnhziKFn2Zvlk8ll6dVAb+QerxknCiv6CrD98PKRG79UzWcUOZWb
 Nu6TDg5xjooAsu6SByoVFwojnFckxQ0Wm1iEqZJJIQss1hxbGgJ4gFXGOUkmDtmF/3RCCwISwn6
 RKElfRPKK7coK+aF9Cymz+1MLOobBT9/ngQ3MbJM5YI7BwYTnb913KHqMG7SJm1UtgCoPR5O0k+
 dAEPydAYN9EyctqPSTwrldXtpi9EdTzCGsjkvYp7+r1VFLvh
X-Developer-Key: i=mkl@pengutronix.de; a=openpgp;
 fpr=C1400BA0B3989E6FBC7D5B5C2B5EE211C58AEA54
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Marc Kleine-Budde <mkl@pengutronix.de>, kernel@pengutronix.de,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] ARM: dts: stm32: add resets property to m_can
 nodes in the stm32mp153
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

On the STM32MP153 the m_cam IP cores (a.k.a. FDCAN) have an external
shared reset in the RCC. Add the reset to both m_can nodes.

Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
---
 arch/arm/boot/dts/st/stm32mp153.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp153.dtsi b/arch/arm/boot/dts/st/stm32mp153.dtsi
index 4640dafb1598..92794b942ab2 100644
--- a/arch/arm/boot/dts/st/stm32mp153.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp153.dtsi
@@ -40,6 +40,7 @@ m_can1: can@4400e000 {
 		interrupt-names = "int0", "int1";
 		clocks = <&rcc CK_HSE>, <&rcc FDCAN_K>;
 		clock-names = "hclk", "cclk";
+		resets = <&rcc FDCAN_R>;
 		bosch,mram-cfg = <0x0 0 0 32 0 0 2 2>;
 		access-controllers = <&etzpc 62>;
 		status = "disabled";
@@ -54,6 +55,7 @@ m_can2: can@4400f000 {
 		interrupt-names = "int0", "int1";
 		clocks = <&rcc CK_HSE>, <&rcc FDCAN_K>;
 		clock-names = "hclk", "cclk";
+		resets = <&rcc FDCAN_R>;
 		bosch,mram-cfg = <0x1400 0 0 32 0 0 2 2>;
 		access-controllers = <&etzpc 62>;
 		status = "disabled";

---
base-commit: 1a32f7427eb3d1248bc64cd745b93f88cc838933
change-id: 20250806-stm32mp15-m_can-add-reset-ccfc47213ba3

Best regards,
--  
Marc Kleine-Budde <mkl@pengutronix.de>


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
