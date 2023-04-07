Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BBD86DB5A9
	for <lists+linux-stm32@lfdr.de>; Fri,  7 Apr 2023 23:02:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3EBDBC6B44C;
	Fri,  7 Apr 2023 21:02:15 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 81A70C6B44A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Apr 2023 21:02:13 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 3BFCB85802;
 Fri,  7 Apr 2023 23:02:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1680901332;
 bh=AJ02imYCOxJwPvi0oNZrvixeZ4REKxeDBU6fHomFj48=;
 h=From:To:Cc:Subject:Date:From;
 b=WdbFZYTYB0h/+B7R7+jkPQH1WXeoVFbIiC0Vr2VngOaQWFq5PG4Vj+Z8Uls7+lN1r
 IVh1tnK9n8aiuZwApmNAO0emYsEQYkeJs84mgNo5wumOJ9NmW4knxVShM39S1O4o05
 HlNszHdDauF1/N03Y+qClpV4IRw3qs6rb1avyKeSYLyefs5fuB5Yr9Sig72FikUvoo
 qbfILf0vuzwKk3uE9CpasJuLH7RtVOtLivf38LI0fXej3rn4TcGoxBx/esbE6sqrPK
 8VuKabLSIQSa82ASnVDXazfiB1ceExj6t9SJf3PtD+A7gCRyMD8EU8XTDWQnCjloxY
 lTY2Hxk1jQw5g==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Date: Fri,  7 Apr 2023 23:01:52 +0200
Message-Id: <20230407210152.138549-1-marex@denx.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, kernel@dh-electronics.com
Subject: [Linux-stm32] [PATCH] ARM: dts: stm32: Replace deprecated st,
	hw-flow-ctrl with uart-has-rtscts
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

Replace deprecated st,hw-flow-ctrl with uart-has-rtscts .
No functional change.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Marek Vasut <marex@denx.de>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: kernel@dh-electronics.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-stm32@st-md-mailman.stormreply.com
---
 arch/arm/boot/dts/stm32h750i-art-pi.dts            | 2 +-
 arch/arm/boot/dts/stm32mp157a-stinger96.dtsi       | 4 ++--
 arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/stm32h750i-art-pi.dts b/arch/arm/boot/dts/stm32h750i-art-pi.dts
index f3e70d3b65ac4..44c307f8b09cf 100644
--- a/arch/arm/boot/dts/stm32h750i-art-pi.dts
+++ b/arch/arm/boot/dts/stm32h750i-art-pi.dts
@@ -208,7 +208,7 @@ &usart3 {
 	dmas = <&dmamux1 45 0x400 0x05>,
 	       <&dmamux1 46 0x400 0x05>;
 	dma-names = "rx", "tx";
-	st,hw-flow-ctrl;
+	uart-has-rtscts;
 	status = "okay";
 
 	bluetooth {
diff --git a/arch/arm/boot/dts/stm32mp157a-stinger96.dtsi b/arch/arm/boot/dts/stm32mp157a-stinger96.dtsi
index 3a36f7fe0a2c3..5f85598cc7c6b 100644
--- a/arch/arm/boot/dts/stm32mp157a-stinger96.dtsi
+++ b/arch/arm/boot/dts/stm32mp157a-stinger96.dtsi
@@ -287,7 +287,7 @@ &usart2 {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&usart2_pins_b>;
 	pinctrl-1 = <&usart2_sleep_pins_b>;
-	st,hw-flow-ctrl;
+	uart-has-rtscts;
 	/delete-property/dmas;
 	/delete-property/dma-names;
 	status = "okay";
@@ -297,7 +297,7 @@ &usart2 {
 &uart4 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart4_pins_c>;
-	st,hw-flow-ctrl;
+	uart-has-rtscts;
 	/delete-property/dmas;
 	/delete-property/dma-names;
 	status = "okay";
diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi
index 50af4a27d6be4..8232bbbae379c 100644
--- a/arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi
+++ b/arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi
@@ -452,7 +452,7 @@ &usart2 {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&usart2_pins_a>;
 	pinctrl-1 = <&usart2_sleep_pins_a>;
-	st,hw-flow-ctrl;
+	uart-has-rtscts;
 	/delete-property/dmas;
 	/delete-property/dma-names;
 	status = "okay";
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
