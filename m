Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 453E0AA9898
	for <lists+linux-stm32@lfdr.de>; Mon,  5 May 2025 18:19:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F0524C78F67;
	Mon,  5 May 2025 16:19:42 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 88E17C78F63
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 May 2025 16:19:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C7AEB5C54F3;
 Mon,  5 May 2025 16:17:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 657EDC4CEEF;
 Mon,  5 May 2025 16:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746461979;
 bh=W9CwbGba2l/4DV2mVSRkgzCbSIJIRxSkUrO2huXF8pw=;
 h=From:To:Cc:Subject:Date:From;
 b=Sa1Ug5sfnyga80HsoJ3Dewm7UKCoPdgGsO7QDheok4L6aeRNgvNq8CU/eaJ32XUjC
 w0vS8QmkoS0EFJGqZ28Ocry/JxgHOk1lif2f82y1o89pU+z0jgzHzs4T7cZhnTr5Qu
 XCW4KpNe3hUwBjf+dgcnINMt9+plVz1Tzz/kf3rQoEW7qlcvdSZ2MmZ8h2YmKIU+cT
 EuvOMsS3OzMqzfa3Ks/7l1WbNtWJI5iQ1lvjXR+NGMZg8QKkZkDf0agpueInltaJvU
 oKz2mKHm52N4mXzcb5HOyPB+mwDz5GV242hxFTyQnZN2CmJNGQB0shbbnbvo8F3UMr
 64Fa8a3bhsHZw==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Mon,  5 May 2025 11:19:32 -0500
Message-ID: <20250505161933.1432791-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH] dt-bindings: clock: Drop st,stm32h7-rcc.txt
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

The binding is already covered by st,stm32-rcc.yaml.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/clock/st,stm32h7-rcc.txt         | 71 -------------------
 1 file changed, 71 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/st,stm32h7-rcc.txt

diff --git a/Documentation/devicetree/bindings/clock/st,stm32h7-rcc.txt b/Documentation/devicetree/bindings/clock/st,stm32h7-rcc.txt
deleted file mode 100644
index cac24ee10b72..000000000000
--- a/Documentation/devicetree/bindings/clock/st,stm32h7-rcc.txt
+++ /dev/null
@@ -1,71 +0,0 @@
-STMicroelectronics STM32H7 Reset and Clock Controller
-=====================================================
-
-The RCC IP is both a reset and a clock controller.
-
-Please refer to clock-bindings.txt for common clock controller binding usage.
-Please also refer to reset.txt for common reset controller binding usage.
-
-Required properties:
-- compatible: Should be:
-  "st,stm32h743-rcc"
-
-- reg: should be register base and length as documented in the
-  datasheet
-
-- #reset-cells: 1, see below
-
-- #clock-cells : from common clock binding; shall be set to 1
-
-- clocks: External oscillator clock phandle
-  - high speed external clock signal (HSE)
-  - low speed external clock signal (LSE)
-  - external I2S clock (I2S_CKIN)
-
-Optional properties:
-- st,syscfg: phandle for pwrcfg, mandatory to disable/enable backup domain
-  write protection (RTC clock).
-
-Example:
-
-	rcc: reset-clock-controller@58024400 {
-		compatible = "st,stm32h743-rcc", "st,stm32-rcc";
-		reg = <0x58024400 0x400>;
-		#reset-cells = <1>;
-		#clock-cells = <1>;
-		clocks = <&clk_hse>, <&clk_lse>, <&clk_i2s_ckin>;
-
-		st,syscfg = <&pwrcfg>;
-};
-
-The peripheral clock consumer should specify the desired clock by
-having the clock ID in its "clocks" phandle cell.
-
-Example:
-
-		timer5: timer@40000c00 {
-			compatible = "st,stm32-timer";
-			reg = <0x40000c00 0x400>;
-			interrupts = <50>;
-			clocks = <&rcc TIM5_CK>;
-		};
-
-Specifying softreset control of devices
-=======================================
-
-Device nodes should specify the reset channel required in their "resets"
-property, containing a phandle to the reset device node and an index specifying
-which channel to use.
-The index is the bit number within the RCC registers bank, starting from RCC
-base address.
-It is calculated as: index = register_offset / 4 * 32 + bit_offset.
-Where bit_offset is the bit offset within the register.
-
-For example, for CRC reset:
-  crc = AHB4RSTR_offset / 4 * 32 + CRCRST_bit_offset = 0x88 / 4 * 32 + 19 = 1107
-
-Example:
-
-	timer2 {
-		resets	= <&rcc STM32H7_APB1L_RESET(TIM2)>;
-	};
-- 
2.47.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
