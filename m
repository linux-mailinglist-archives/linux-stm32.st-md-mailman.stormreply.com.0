Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FCBD3C8EBA
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Jul 2021 21:47:07 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EA476C597B1;
	Wed, 14 Jul 2021 19:47:06 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 51FC2C597AF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Jul 2021 19:47:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 441C5613E6;
 Wed, 14 Jul 2021 19:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626292022;
 bh=I1DmAdR9u5njnYcZbLpVClZurswpeRSJXmt5cRg5LE8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kUzAEuA+1QPZAyY/8tctbjLxAIzAsKftSufkdVjy1y4Cy3/eC1DBCTxChoZR/9swg
 3YDzKg929piepE91bC2NVPCIDnv9Hms42q68rt0AHas2+DaxOu5JR7HB6e182H9qMQ
 dqdxz23cPUF/e3lwTV7ChjAcpFLXIQgNCwU64N0mko2KBi07HGK24c+Q3id7Awwr1K
 RUhYFFHK9s5926+fC38Wb0gt3SkWDuCurG3MPmYESiIyd6llCNKUTBIjR8Q1HC6lSp
 6B/Umyq+XZEpvM5wHj5/SAIKVGTHUcpY2+24eKXJxLqGgKT4XlLHR45k0LiHh5remg
 +K/4GHdeAeYjg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Wed, 14 Jul 2021 15:46:10 -0400
Message-Id: <20210714194625.55303-25-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210714194625.55303-1-sashal@kernel.org>
References: <20210714194625.55303-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>, devicetree@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH AUTOSEL 4.19 25/39] ARM: dts: stm32: fix timer
	nodes on STM32 MCU to prevent warnings
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

From: Alexandre Torgue <alexandre.torgue@foss.st.com>

[ Upstream commit 2388f14d8747f8304e26ee870790e188c9431efd ]

Prevent warning seen with "make dtbs_check W=1" command:

Warning (avoid_unnecessary_addr_size): /soc/timers@40001c00: unnecessary
address-cells/size-cells without "ranges" or child "reg" property

Reviewed-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm/boot/dts/stm32f429.dtsi | 8 --------
 arch/arm/boot/dts/stm32f746.dtsi | 8 --------
 arch/arm/boot/dts/stm32h743.dtsi | 4 ----
 3 files changed, 20 deletions(-)

diff --git a/arch/arm/boot/dts/stm32f429.dtsi b/arch/arm/boot/dts/stm32f429.dtsi
index b16bf00977d5..fdaf43290006 100644
--- a/arch/arm/boot/dts/stm32f429.dtsi
+++ b/arch/arm/boot/dts/stm32f429.dtsi
@@ -263,8 +263,6 @@ timer@11 {
 		};
 
 		timers13: timers@40001c00 {
-			#address-cells = <1>;
-			#size-cells = <0>;
 			compatible = "st,stm32-timers";
 			reg = <0x40001C00 0x400>;
 			clocks = <&rcc 0 STM32F4_APB1_CLOCK(TIM13)>;
@@ -278,8 +276,6 @@ pwm {
 		};
 
 		timers14: timers@40002000 {
-			#address-cells = <1>;
-			#size-cells = <0>;
 			compatible = "st,stm32-timers";
 			reg = <0x40002000 0x400>;
 			clocks = <&rcc 0 STM32F4_APB1_CLOCK(TIM14)>;
@@ -558,8 +554,6 @@ timer@8 {
 		};
 
 		timers10: timers@40014400 {
-			#address-cells = <1>;
-			#size-cells = <0>;
 			compatible = "st,stm32-timers";
 			reg = <0x40014400 0x400>;
 			clocks = <&rcc 0 STM32F4_APB2_CLOCK(TIM10)>;
@@ -573,8 +567,6 @@ pwm {
 		};
 
 		timers11: timers@40014800 {
-			#address-cells = <1>;
-			#size-cells = <0>;
 			compatible = "st,stm32-timers";
 			reg = <0x40014800 0x400>;
 			clocks = <&rcc 0 STM32F4_APB2_CLOCK(TIM11)>;
diff --git a/arch/arm/boot/dts/stm32f746.dtsi b/arch/arm/boot/dts/stm32f746.dtsi
index f48d06a80d1d..ccd87e833049 100644
--- a/arch/arm/boot/dts/stm32f746.dtsi
+++ b/arch/arm/boot/dts/stm32f746.dtsi
@@ -258,8 +258,6 @@ timer@11 {
 		};
 
 		timers13: timers@40001c00 {
-			#address-cells = <1>;
-			#size-cells = <0>;
 			compatible = "st,stm32-timers";
 			reg = <0x40001C00 0x400>;
 			clocks = <&rcc 0 STM32F7_APB1_CLOCK(TIM13)>;
@@ -273,8 +271,6 @@ pwm {
 		};
 
 		timers14: timers@40002000 {
-			#address-cells = <1>;
-			#size-cells = <0>;
 			compatible = "st,stm32-timers";
 			reg = <0x40002000 0x400>;
 			clocks = <&rcc 0 STM32F7_APB1_CLOCK(TIM14)>;
@@ -521,8 +517,6 @@ timer@8 {
 		};
 
 		timers10: timers@40014400 {
-			#address-cells = <1>;
-			#size-cells = <0>;
 			compatible = "st,stm32-timers";
 			reg = <0x40014400 0x400>;
 			clocks = <&rcc 0 STM32F7_APB2_CLOCK(TIM10)>;
@@ -536,8 +530,6 @@ pwm {
 		};
 
 		timers11: timers@40014800 {
-			#address-cells = <1>;
-			#size-cells = <0>;
 			compatible = "st,stm32-timers";
 			reg = <0x40014800 0x400>;
 			clocks = <&rcc 0 STM32F7_APB2_CLOCK(TIM11)>;
diff --git a/arch/arm/boot/dts/stm32h743.dtsi b/arch/arm/boot/dts/stm32h743.dtsi
index 637beffe5067..729ff6264776 100644
--- a/arch/arm/boot/dts/stm32h743.dtsi
+++ b/arch/arm/boot/dts/stm32h743.dtsi
@@ -422,8 +422,6 @@ trigger@2 {
 		};
 
 		lptimer4: timer@58002c00 {
-			#address-cells = <1>;
-			#size-cells = <0>;
 			compatible = "st,stm32-lptimer";
 			reg = <0x58002c00 0x400>;
 			clocks = <&rcc LPTIM4_CK>;
@@ -438,8 +436,6 @@ pwm {
 		};
 
 		lptimer5: timer@58003000 {
-			#address-cells = <1>;
-			#size-cells = <0>;
 			compatible = "st,stm32-lptimer";
 			reg = <0x58003000 0x400>;
 			clocks = <&rcc LPTIM5_CK>;
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
