Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A62D33CFC1
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Mar 2021 09:24:11 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BC024C57B5A;
	Tue, 16 Mar 2021 08:24:10 +0000 (UTC)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DA402C5662E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Mar 2021 08:07:05 +0000 (UTC)
From: Kurt Kanzenbach <kurt@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1615882024;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=198ieZWxanXzo3MI5NPBYscFn1y4OHFktIS2kgql4S4=;
 b=o/Z+3OWO8kg/LVbMlEGoDRyYI4UHYdH6oX/gUZq8/xRO6n/rMZ5rEiOCdq85/OZQnNlpEr
 Kk4SjyHjn2Qk9A6mC37Tb+Byqw7Zjqh5Dx+RSnWdXrxe+B6J/CwyW5Q2Gos5jXFGptuxcK
 VLPtMXDWhcx05GlSZlCIOVxfLRhdtge/Pr3oFoWy848jtD1aqFTwtN0Ncmjqgy+aqdCnPp
 Rns6e56hH4WXBjFGXxohiPK6UWyJx6FZGTWzSfbNkfxfttmUJbWaMugyreTD0FSkvLVCxZ
 9qirw2QnTfgehaNkqT7wp37a6wupPQkBoczpHJtWxMKI21TDeuvASeASx5pkCA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1615882024;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=198ieZWxanXzo3MI5NPBYscFn1y4OHFktIS2kgql4S4=;
 b=ySLL3EPN3xVdgSM8NIirnqA5E8Yba7rtaOX1cKM4+gEMQfzwsc90/lYYqyP9ID9nUjP/hc
 q4vELQeNVw+JwXBQ==
To: Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>
Date: Tue, 16 Mar 2021 09:06:44 +0100
Message-Id: <20210316080644.19809-1-kurt@linutronix.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 16 Mar 2021 08:24:09 +0000
Cc: devicetree@vger.kernel.org, Kurt Kanzenbach <kurt@linutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] ARM: dts: stm32: Add PTP clock to Ethernet
	controller
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

Add the PTP clock to the Ethernet controller. Otherwise, the driver uses the
main clock to derive the PTP frequency which is not necessarily the correct one.

Tested with linuxptp on Olimex STMP1-OLinuXino-LIME2.

Signed-off-by: Kurt Kanzenbach <kurt@linutronix.de>
---
 arch/arm/boot/dts/stm32mp151.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp151.dtsi b/arch/arm/boot/dts/stm32mp151.dtsi
index 3c75abacb374..d1f596ea2fd5 100644
--- a/arch/arm/boot/dts/stm32mp151.dtsi
+++ b/arch/arm/boot/dts/stm32mp151.dtsi
@@ -1421,11 +1421,13 @@
 				      "mac-clk-tx",
 				      "mac-clk-rx",
 				      "eth-ck",
+				      "ptp_ref",
 				      "ethstp";
 			clocks = <&rcc ETHMAC>,
 				 <&rcc ETHTX>,
 				 <&rcc ETHRX>,
 				 <&rcc ETHCK_K>,
+				 <&rcc ETHPTP_K>,
 				 <&rcc ETHSTP>;
 			st,syscon = <&syscfg 0x4>;
 			snps,mixed-burst;
-- 
2.20.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
