Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 878E270772E
	for <lists+linux-stm32@lfdr.de>; Thu, 18 May 2023 03:13:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4107DC6B44D;
	Thu, 18 May 2023 01:13:18 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 365E8C6B44A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 May 2023 01:13:17 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 46B6B86277;
 Thu, 18 May 2023 03:13:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1684372396;
 bh=EdvmS/plxXIm29imhL2sK5+HAfap9knMC+N1/paBj6s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WFWp3HJFVc8OyQjy/0XJWdlqvysM1jZrqnFIdiD0mqHmHPnBkz/3SQVaaybvHf2Qj
 aeWyQREe0cq5nt5R9mSz6NpxUUN4irWxsbv+CbqhpyafZtjy5CiMbYgD5xG3tqPnF0
 BKuTCe9s/SQhIDk2apOFchUCx071/F508PW6ljmQYUkKQ7St1EselBzj3258MW2ai3
 4/RLEfGt9Zt+gixbL+PVyoQhIrYCfBkCZJVrWHWqoqeegtvQ0h2Pu7pRJoDXdxRFI4
 u2lzFL/yamP1JWc9MJOgLRoA4HAKmO4V7ylwgr7ZLNfjONgv17eGyPZAQfG9Gf34nL
 p4zJ6ZXN2q7Yg==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Date: Thu, 18 May 2023 03:12:46 +0200
Message-Id: <20230518011246.438097-5-marex@denx.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230518011246.438097-1-marex@denx.de>
References: <20230518011246.438097-1-marex@denx.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Richard Cochran <richardcochran@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, kernel@dh-electronics.com
Subject: [Linux-stm32] [PATCH 5/5] ARM: dts: stm32: Deduplicate rproc mboxes
	and IRQs
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

Pull mboxes, mbox-names, interrupt-parent, interrupts properties of the
m4_rproc into stm32mp151.dtsi to deduplicate multiple copies of the same
in multiple board files. Worse, those copies were starting to get out of
sync, so this should prevent any such issues in the future.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Richard Cochran <richardcochran@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: kernel@dh-electronics.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-stm32@st-md-mailman.stormreply.com
---
 arch/arm/boot/dts/stm32mp151.dtsi                        | 4 ++++
 arch/arm/boot/dts/stm32mp157c-ed1.dts                    | 4 ----
 arch/arm/boot/dts/stm32mp157c-emstamp-argon.dtsi         | 4 ----
 arch/arm/boot/dts/stm32mp157c-odyssey-som.dtsi           | 4 ----
 arch/arm/boot/dts/stm32mp157c-phycore-stm32mp15-som.dtsi | 4 ----
 arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi             | 4 ----
 arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi             | 4 ----
 arch/arm/boot/dts/stm32mp15xx-dkx.dtsi                   | 4 ----
 arch/arm/boot/dts/stm32mp15xx-osd32.dtsi                 | 4 ----
 9 files changed, 4 insertions(+), 32 deletions(-)

diff --git a/arch/arm/boot/dts/stm32mp151.dtsi b/arch/arm/boot/dts/stm32mp151.dtsi
index accbeef4df6da..97d54bf0dcc30 100644
--- a/arch/arm/boot/dts/stm32mp151.dtsi
+++ b/arch/arm/boot/dts/stm32mp151.dtsi
@@ -1824,6 +1824,10 @@ m4_rproc: m4@10000000 {
 			reg = <0x10000000 0x40000>,
 			      <0x30000000 0x40000>,
 			      <0x38000000 0x10000>;
+			interrupt-parent = <&exti>;
+			interrupts = <68 IRQ_TYPE_EDGE_RISING>;
+			mbox-names = "vq0", "vq1", "shutdown", "detach";
+			mboxes = <&ipcc 0>, <&ipcc 1>, <&ipcc 2>, <&ipcc 3>;
 			resets = <&rcc MCU_R>;
 			st,syscfg-holdboot = <&rcc 0x10C 0x1>;
 			st,syscfg-tz = <&rcc 0x000 0x1>;
diff --git a/arch/arm/boot/dts/stm32mp157c-ed1.dts b/arch/arm/boot/dts/stm32mp157c-ed1.dts
index 8beb901be5065..3b40c2d8c3d9e 100644
--- a/arch/arm/boot/dts/stm32mp157c-ed1.dts
+++ b/arch/arm/boot/dts/stm32mp157c-ed1.dts
@@ -304,10 +304,6 @@ &iwdg2 {
 &m4_rproc {
 	memory-region = <&retram>, <&mcuram>, <&mcuram2>, <&vdev0vring0>,
 			<&vdev0vring1>, <&vdev0buffer>;
-	mboxes = <&ipcc 0>, <&ipcc 1>, <&ipcc 2>, <&ipcc 3>;
-	mbox-names = "vq0", "vq1", "shutdown", "detach";
-	interrupt-parent = <&exti>;
-	interrupts = <68 1>;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/stm32mp157c-emstamp-argon.dtsi b/arch/arm/boot/dts/stm32mp157c-emstamp-argon.dtsi
index 82061c9186338..a5c86bba46aea 100644
--- a/arch/arm/boot/dts/stm32mp157c-emstamp-argon.dtsi
+++ b/arch/arm/boot/dts/stm32mp157c-emstamp-argon.dtsi
@@ -366,10 +366,6 @@ &iwdg2 {
 &m4_rproc {
 	memory-region = <&retram>, <&mcuram>, <&mcuram2>, <&vdev0vring0>,
 			<&vdev0vring1>, <&vdev0buffer>;
-	mboxes = <&ipcc 0>, <&ipcc 1>, <&ipcc 2>, <&ipcc 3>;
-	mbox-names = "vq0", "vq1", "shutdown", "detach";
-	interrupt-parent = <&exti>;
-	interrupts = <68 1>;
 	interrupt-names = "wdg";
 	recovery;
 	status = "okay";
diff --git a/arch/arm/boot/dts/stm32mp157c-odyssey-som.dtsi b/arch/arm/boot/dts/stm32mp157c-odyssey-som.dtsi
index cf74852514906..31d7bfe8bf8c9 100644
--- a/arch/arm/boot/dts/stm32mp157c-odyssey-som.dtsi
+++ b/arch/arm/boot/dts/stm32mp157c-odyssey-som.dtsi
@@ -230,10 +230,6 @@ &iwdg2 {
 &m4_rproc {
 	memory-region = <&retram>, <&mcuram>, <&mcuram2>, <&vdev0vring0>,
 			<&vdev0vring1>, <&vdev0buffer>;
-	mboxes = <&ipcc 0>, <&ipcc 1>, <&ipcc 2>, <&ipcc 3>;
-	mbox-names = "vq0", "vq1", "shutdown", "detach";
-	interrupt-parent = <&exti>;
-	interrupts = <68 1>;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/stm32mp157c-phycore-stm32mp15-som.dtsi b/arch/arm/boot/dts/stm32mp157c-phycore-stm32mp15-som.dtsi
index 4e8b2d2b30c7a..f68aaf6aa9fb5 100644
--- a/arch/arm/boot/dts/stm32mp157c-phycore-stm32mp15-som.dtsi
+++ b/arch/arm/boot/dts/stm32mp157c-phycore-stm32mp15-som.dtsi
@@ -405,10 +405,6 @@ &m_can2 {
 &m4_rproc {
 	memory-region = <&retram>, <&mcuram>, <&mcuram2>, <&vdev0vring0>,
 			<&vdev0vring1>, <&vdev0buffer>;
-	mboxes = <&ipcc 0>, <&ipcc 1>, <&ipcc 2>, <&ipcc 3>;
-	mbox-names = "vq0", "vq1", "shutdown", "detach";
-	interrupt-parent = <&exti>;
-	interrupts = <68 1>;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
index 7bf13183437c5..a38009f8456b8 100644
--- a/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
+++ b/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
@@ -414,10 +414,6 @@ &iwdg2 {
 &m4_rproc {
 	memory-region = <&retram>, <&mcuram>, <&mcuram2>, <&vdev0vring0>,
 			<&vdev0vring1>, <&vdev0buffer>;
-	mboxes = <&ipcc 0>, <&ipcc 1>, <&ipcc 2>, <&ipcc 3>;
-	mbox-names = "vq0", "vq1", "shutdown", "detach";
-	interrupt-parent = <&exti>;
-	interrupts = <68 1>;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi
index f0351f599a508..8c30cecacaf86 100644
--- a/arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi
+++ b/arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi
@@ -227,10 +227,6 @@ &iwdg2 {
 &m4_rproc {
 	memory-region = <&retram>, <&mcuram>, <&mcuram2>, <&vdev0vring0>,
 			<&vdev0vring1>, <&vdev0buffer>;
-	mboxes = <&ipcc 0>, <&ipcc 1>, <&ipcc 2>, <&ipcc 3>;
-	mbox-names = "vq0", "vq1", "shutdown", "detach";
-	interrupt-parent = <&exti>;
-	interrupts = <68 1>;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi b/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
index 0f1110e42c939..cc3eb755663fd 100644
--- a/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
+++ b/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
@@ -467,10 +467,6 @@ ltdc_ep0_out: endpoint@0 {
 &m4_rproc {
 	memory-region = <&retram>, <&mcuram>, <&mcuram2>, <&vdev0vring0>,
 			<&vdev0vring1>, <&vdev0buffer>;
-	mboxes = <&ipcc 0>, <&ipcc 1>, <&ipcc 2>, <&ipcc 3>;
-	mbox-names = "vq0", "vq1", "shutdown", "detach";
-	interrupt-parent = <&exti>;
-	interrupts = <68 1>;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/stm32mp15xx-osd32.dtsi b/arch/arm/boot/dts/stm32mp15xx-osd32.dtsi
index a43965c86fe8b..6532726502c32 100644
--- a/arch/arm/boot/dts/stm32mp15xx-osd32.dtsi
+++ b/arch/arm/boot/dts/stm32mp15xx-osd32.dtsi
@@ -210,10 +210,6 @@ &ipcc {
 &m4_rproc {
 	memory-region = <&retram>, <&mcuram>, <&mcuram2>, <&vdev0vring0>,
 			<&vdev0vring1>, <&vdev0buffer>;
-	mboxes = <&ipcc 0>, <&ipcc 1>, <&ipcc 2>, <&ipcc 3>;
-	mbox-names = "vq0", "vq1", "shutdown", "detach";
-	interrupt-parent = <&exti>;
-	interrupts = <68 1>;
 	status = "okay";
 };
 
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
