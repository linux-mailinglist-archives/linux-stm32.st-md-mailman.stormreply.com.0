Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D2FCE913DC5
	for <lists+linux-stm32@lfdr.de>; Sun, 23 Jun 2024 21:50:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 84897C71287;
	Sun, 23 Jun 2024 19:50:16 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3CA75C6C83A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 23 Jun 2024 19:50:09 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 3DEFC866F6;
 Sun, 23 Jun 2024 21:50:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1719172208;
 bh=lTH2JKNMoCk7EJQOLYfn4JfWc0XLg/28atW28DHUCWI=;
 h=From:To:Cc:Subject:Date:From;
 b=cC2zHgEwl+UjGEYnx/R7rb0juIOh61/Q6FFfopt0QDq0GL4Rse5riLtOHJtYVH49O
 SFvTLvzpQwoLbA3M2K+wE7RjRNJqX6BjXNIJC97x2RU2U8w4YfS+1vf/Clug0NOT3x
 /QlQgrb2hoEflWuQ1uQ8iXXk1xHNglreGID7kP71NeSe47S2gKjyNLARfHLL3Zbs5j
 vt5orQoTVdgMsUFA+XUuCUjokq/1x0gUS/9yheHAt7wkQ2/wzSAaQaGAU7CNJoO4u0
 ZP/xAnCxPpOJtkiTEg8lPu+5Nb+Ufh/BntYXwru8iHSAPqNY3VKiviAmDv07qF66NT
 t97cG+ROO8e6Q==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Date: Sun, 23 Jun 2024 21:49:17 +0200
Message-ID: <20240623194954.79988-1-marex@denx.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Richard Cochran <richardcochran@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, kernel@dh-electronics.com
Subject: [Linux-stm32] [PATCH] ARM: dts: stm32: Deduplicate rproc mboxes and
	IRQs
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
 arch/arm/boot/dts/st/stm32mp151.dtsi                        | 4 ++++
 arch/arm/boot/dts/st/stm32mp157a-icore-stm32mp1.dtsi        | 2 --
 arch/arm/boot/dts/st/stm32mp157a-microgea-stm32mp1.dtsi     | 2 --
 arch/arm/boot/dts/st/stm32mp157c-ed1.dts                    | 4 ----
 arch/arm/boot/dts/st/stm32mp157c-emstamp-argon.dtsi         | 4 ----
 arch/arm/boot/dts/st/stm32mp157c-odyssey-som.dtsi           | 4 ----
 arch/arm/boot/dts/st/stm32mp157c-phycore-stm32mp15-som.dtsi | 4 ----
 arch/arm/boot/dts/st/stm32mp15xx-dhcom-som.dtsi             | 4 ----
 arch/arm/boot/dts/st/stm32mp15xx-dhcor-som.dtsi             | 4 ----
 arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi                   | 4 ----
 arch/arm/boot/dts/st/stm32mp15xx-osd32.dtsi                 | 4 ----
 11 files changed, 4 insertions(+), 36 deletions(-)

diff --git a/arch/arm/boot/dts/st/stm32mp151.dtsi b/arch/arm/boot/dts/st/stm32mp151.dtsi
index 4f878ec102c1f..1804e202eb425 100644
--- a/arch/arm/boot/dts/st/stm32mp151.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp151.dtsi
@@ -1986,6 +1986,10 @@ m4_rproc: m4@10000000 {
 			reg = <0x10000000 0x40000>,
 			      <0x30000000 0x40000>,
 			      <0x38000000 0x10000>;
+			interrupt-parent = <&exti>;
+			interrupts = <68 IRQ_TYPE_EDGE_RISING>;
+			mbox-names = "vq0", "vq1", "shutdown", "detach";
+			mboxes = <&ipcc 0>, <&ipcc 1>, <&ipcc 2>, <&ipcc 3>;
 			resets = <&rcc MCU_R>;
 			reset-names = "mcu_rst";
 			st,syscfg-holdboot = <&rcc 0x10C 0x1>;
diff --git a/arch/arm/boot/dts/st/stm32mp157a-icore-stm32mp1.dtsi b/arch/arm/boot/dts/st/stm32mp157a-icore-stm32mp1.dtsi
index 569a7e940ecc8..69c873f30d7df 100644
--- a/arch/arm/boot/dts/st/stm32mp157a-icore-stm32mp1.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp157a-icore-stm32mp1.dtsi
@@ -175,8 +175,6 @@ &m4_rproc {
 			<&vdev0vring1>, <&vdev0buffer>;
 	mboxes = <&ipcc 0>, <&ipcc 1>, <&ipcc 2>;
 	mbox-names = "vq0", "vq1", "shutdown";
-	interrupt-parent = <&exti>;
-	interrupts = <68 1>;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/st/stm32mp157a-microgea-stm32mp1.dtsi b/arch/arm/boot/dts/st/stm32mp157a-microgea-stm32mp1.dtsi
index a75f50cf71234..9d26368025def 100644
--- a/arch/arm/boot/dts/st/stm32mp157a-microgea-stm32mp1.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp157a-microgea-stm32mp1.dtsi
@@ -127,8 +127,6 @@ &m4_rproc {
 			<&vdev0vring1>, <&vdev0buffer>;
 	mboxes = <&ipcc 0>, <&ipcc 1>, <&ipcc 2>;
 	mbox-names = "vq0", "vq1", "shutdown";
-	interrupt-parent = <&exti>;
-	interrupts = <68 1>;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/st/stm32mp157c-ed1.dts b/arch/arm/boot/dts/st/stm32mp157c-ed1.dts
index 9cf5ed111b52e..a746e3da2f57d 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-ed1.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-ed1.dts
@@ -326,10 +326,6 @@ &iwdg2 {
 &m4_rproc {
 	memory-region = <&retram>, <&mcuram>, <&mcuram2>, <&vdev0vring0>,
 			<&vdev0vring1>, <&vdev0buffer>;
-	mboxes = <&ipcc 0>, <&ipcc 1>, <&ipcc 2>, <&ipcc 3>;
-	mbox-names = "vq0", "vq1", "shutdown", "detach";
-	interrupt-parent = <&exti>;
-	interrupts = <68 1>;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/st/stm32mp157c-emstamp-argon.dtsi b/arch/arm/boot/dts/st/stm32mp157c-emstamp-argon.dtsi
index 4792004cab0cc..1d4380345f157 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-emstamp-argon.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp157c-emstamp-argon.dtsi
@@ -367,10 +367,6 @@ &iwdg2 {
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
diff --git a/arch/arm/boot/dts/st/stm32mp157c-odyssey-som.dtsi b/arch/arm/boot/dts/st/stm32mp157c-odyssey-som.dtsi
index cf74852514906..31d7bfe8bf8c9 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-odyssey-som.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp157c-odyssey-som.dtsi
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
 
diff --git a/arch/arm/boot/dts/st/stm32mp157c-phycore-stm32mp15-som.dtsi b/arch/arm/boot/dts/st/stm32mp157c-phycore-stm32mp15-som.dtsi
index bf0c32027baf7..f823cc453a5c6 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-phycore-stm32mp15-som.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp157c-phycore-stm32mp15-som.dtsi
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
 
diff --git a/arch/arm/boot/dts/st/stm32mp15xx-dhcom-som.dtsi b/arch/arm/boot/dts/st/stm32mp15xx-dhcom-som.dtsi
index 74a11ccc5333f..05795520586d4 100644
--- a/arch/arm/boot/dts/st/stm32mp15xx-dhcom-som.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xx-dhcom-som.dtsi
@@ -416,10 +416,6 @@ &iwdg2 {
 &m4_rproc {
 	memory-region = <&retram>, <&mcuram>, <&mcuram2>, <&vdev0vring0>,
 			<&vdev0vring1>, <&vdev0buffer>;
-	mboxes = <&ipcc 0>, <&ipcc 1>, <&ipcc 2>, <&ipcc 3>;
-	mbox-names = "vq0", "vq1", "shutdown", "detach";
-	interrupt-parent = <&exti>;
-	interrupts = <68 1>;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/st/stm32mp15xx-dhcor-som.dtsi b/arch/arm/boot/dts/st/stm32mp15xx-dhcor-som.dtsi
index 89881a26c6141..309b1aeefffe9 100644
--- a/arch/arm/boot/dts/st/stm32mp15xx-dhcor-som.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xx-dhcor-som.dtsi
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
 
diff --git a/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi b/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
index f7634c51efb26..711a66650955c 100644
--- a/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
@@ -477,10 +477,6 @@ ltdc_ep0_out: endpoint {
 &m4_rproc {
 	memory-region = <&retram>, <&mcuram>, <&mcuram2>, <&vdev0vring0>,
 			<&vdev0vring1>, <&vdev0buffer>;
-	mboxes = <&ipcc 0>, <&ipcc 1>, <&ipcc 2>, <&ipcc 3>;
-	mbox-names = "vq0", "vq1", "shutdown", "detach";
-	interrupt-parent = <&exti>;
-	interrupts = <68 1>;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/st/stm32mp15xx-osd32.dtsi b/arch/arm/boot/dts/st/stm32mp15xx-osd32.dtsi
index 2022a1fa31cab..1db35634e3535 100644
--- a/arch/arm/boot/dts/st/stm32mp15xx-osd32.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xx-osd32.dtsi
@@ -204,10 +204,6 @@ &ipcc {
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
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
