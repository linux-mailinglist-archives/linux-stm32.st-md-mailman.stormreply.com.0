Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7AB706C9A
	for <lists+linux-stm32@lfdr.de>; Wed, 17 May 2023 17:25:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4271CC6B448;
	Wed, 17 May 2023 15:25:34 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 19044C6A5F2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 May 2023 15:25:33 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 3E49386225;
 Wed, 17 May 2023 17:25:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1684337132;
 bh=Ur95JyMHgvfJx5drKbmIhuJyl8T5HJ0fVbyt7aWoaYw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Jn6c8u0hR9A/P9yPjVE6FzD9WMoEJ5PMIX1hJBMJ0K42BJtee7npDqtyAii2VZi1o
 UOagxF2UHVebDThTjmWDyj8gSwiZZE3ITw+zW3i7/Fwd7Q6MFcf3lpjRjdC+sKCSqH
 XY8J1gZxsZYV2w7PyX0YmM9h5rMtuRzd5w32zMX0NCf75YEFT9XSiEk5Csxz3Z++aB
 xd/MxUKO9skB25d34blCwaapjlvXCoySHB9nZoDGTo1kdyhL5I4+2+6RJ57UMPQT/h
 xC/ELfyOVP+US5V3m77lU/0xwuayOALQhqs/v5yINF+L+/r4og1p4DSIKcLz2chXGz
 LUPPo9gOH95zQ==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Date: Wed, 17 May 2023 17:25:13 +0200
Message-Id: <20230517152513.27922-3-marex@denx.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517152513.27922-1-marex@denx.de>
References: <20230517152513.27922-1-marex@denx.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, kernel@dh-electronics.com
Subject: [Linux-stm32] [PATCH v2 3/3] ARM: dts: stm32: Add nvmem-syscon node
	to TAMP to expose boot count on DHSOM
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

Add nvmem-syscon subnode to expose TAMP_BKPxR register 19 to user space.
This register contains U-Boot boot counter, by exposing it to user space
the user space can reset the boot counter.

Read access example:
"
$ hexdump -vC /sys/bus/nvmem/devices/5c00a000.tamp\:nvmem0/nvmem
00000000  0c 00 c4 b0
"

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Marek Vasut <marex@denx.de>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: devicetree@vger.kernel.org
Cc: kernel@dh-electronics.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-stm32@st-md-mailman.stormreply.com
---
V2: No change
---
 arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi | 11 +++++++++++
 arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi | 11 +++++++++++
 2 files changed, 22 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
index 74735552f4803..b2557bb718f52 100644
--- a/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
+++ b/arch/arm/boot/dts/stm32mp15xx-dhcom-som.dtsi
@@ -537,6 +537,17 @@ &sdmmc3 {
 	status = "okay";
 };
 
+&tamp {
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	/* Boot counter */
+	nvmem {
+		compatible = "nvmem-syscon";
+		reg = <0x14c 0x4>;
+	};
+};
+
 &uart4 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart4_pins_a>;
diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi
index bba19f21e5277..864960387e634 100644
--- a/arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi
+++ b/arch/arm/boot/dts/stm32mp15xx-dhcor-som.dtsi
@@ -269,3 +269,14 @@ &rng1 {
 &rtc {
 	status = "okay";
 };
+
+&tamp {
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	/* Boot counter */
+	nvmem {
+		compatible = "nvmem-syscon";
+		reg = <0x14c 0x4>;
+	};
+};
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
