Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EBCE73C8EA3
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Jul 2021 21:45:59 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B14B1C597B0;
	Wed, 14 Jul 2021 19:45:59 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9E59EC57B6F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Jul 2021 19:45:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id F074F613F8;
 Wed, 14 Jul 2021 19:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626291956;
 bh=LmVPkIm0f8l/9WobCCvwiNhLVww74R+nQ1iF/4M67Sk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=M1+VXmPLhFbK+53+jgEBkYL9Wk+o19umib+SkQLMlouFuNpZiE0JU0mB46h130ITN
 ixUhBdlzppLw/yL5q+DDr4cYd0yzOowMtQZp475M0KieEsR2VxJiZsTIolNTGlLS4/
 csPbEfc2AWuTEIgWi69Pka43lcEkaI+ym9Fdg5vDFestGXi3wB7a9Mu+GsmMBV+fmn
 /m/KOqAJOKDHPlL2N51k7bI8JkRataLYEXWXpZl+qgJGT17RVL6UxThzU1YHVXvjsj
 FHjB9vOCcKxS4BEHEQQ0aZ8p+fGlKqt5LMow9zWE/Pq94HBR5S5T7T8Pu/uyX01r5U
 tWpvKkip57DQw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Wed, 14 Jul 2021 15:44:52 -0400
Message-Id: <20210714194513.54827-30-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210714194513.54827-1-sashal@kernel.org>
References: <20210714194513.54827-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>, devicetree@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH AUTOSEL 5.4 30/51] ARM: dts: stm32: fix
	gpio-keys node on STM32 MCU boards
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

[ Upstream commit bf24b91f4baf7e421c770a1d9c7d381b10206ac9 ]

Fix following warning observed with "make dtbs_check W=1" command.
It concerns f429 eval and disco boards, f769 disco board.

Warning (unit_address_vs_reg): /gpio_keys/button@0: node has a unit name,
but no reg or ranges property

Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm/boot/dts/stm32429i-eval.dts  | 8 +++-----
 arch/arm/boot/dts/stm32746g-eval.dts  | 6 ++----
 arch/arm/boot/dts/stm32f429-disco.dts | 6 ++----
 arch/arm/boot/dts/stm32f469-disco.dts | 6 ++----
 arch/arm/boot/dts/stm32f769-disco.dts | 6 ++----
 5 files changed, 11 insertions(+), 21 deletions(-)

diff --git a/arch/arm/boot/dts/stm32429i-eval.dts b/arch/arm/boot/dts/stm32429i-eval.dts
index ba08624c6237..4f45e71a1e4d 100644
--- a/arch/arm/boot/dts/stm32429i-eval.dts
+++ b/arch/arm/boot/dts/stm32429i-eval.dts
@@ -112,17 +112,15 @@ blue {
 		};
 	};
 
-	gpio_keys {
+	gpio-keys {
 		compatible = "gpio-keys";
-		#address-cells = <1>;
-		#size-cells = <0>;
 		autorepeat;
-		button@0 {
+		button-0 {
 			label = "Wake up";
 			linux,code = <KEY_WAKEUP>;
 			gpios = <&gpioa 0 0>;
 		};
-		button@1 {
+		button-1 {
 			label = "Tamper";
 			linux,code = <KEY_RESTART>;
 			gpios = <&gpioc 13 0>;
diff --git a/arch/arm/boot/dts/stm32746g-eval.dts b/arch/arm/boot/dts/stm32746g-eval.dts
index 2b1664884ae7..8d64b52838c0 100644
--- a/arch/arm/boot/dts/stm32746g-eval.dts
+++ b/arch/arm/boot/dts/stm32746g-eval.dts
@@ -81,12 +81,10 @@ blue {
 		};
 	};
 
-	gpio_keys {
+	gpio-keys {
 		compatible = "gpio-keys";
-		#address-cells = <1>;
-		#size-cells = <0>;
 		autorepeat;
-		button@0 {
+		button-0 {
 			label = "Wake up";
 			linux,code = <KEY_WAKEUP>;
 			gpios = <&gpioc 13 0>;
diff --git a/arch/arm/boot/dts/stm32f429-disco.dts b/arch/arm/boot/dts/stm32f429-disco.dts
index e19d0fe7dbda..49ae2d72afc9 100644
--- a/arch/arm/boot/dts/stm32f429-disco.dts
+++ b/arch/arm/boot/dts/stm32f429-disco.dts
@@ -79,12 +79,10 @@ green {
 		};
 	};
 
-	gpio_keys {
+	gpio-keys {
 		compatible = "gpio-keys";
-		#address-cells = <1>;
-		#size-cells = <0>;
 		autorepeat;
-		button@0 {
+		button-0 {
 			label = "User";
 			linux,code = <KEY_HOME>;
 			gpios = <&gpioa 0 0>;
diff --git a/arch/arm/boot/dts/stm32f469-disco.dts b/arch/arm/boot/dts/stm32f469-disco.dts
index c6dc6d1a051b..0ce450123dda 100644
--- a/arch/arm/boot/dts/stm32f469-disco.dts
+++ b/arch/arm/boot/dts/stm32f469-disco.dts
@@ -104,12 +104,10 @@ blue {
 		};
 	};
 
-	gpio_keys {
+	gpio-keys {
 		compatible = "gpio-keys";
-		#address-cells = <1>;
-		#size-cells = <0>;
 		autorepeat;
-		button@0 {
+		button-0 {
 			label = "User";
 			linux,code = <KEY_WAKEUP>;
 			gpios = <&gpioa 0 GPIO_ACTIVE_HIGH>;
diff --git a/arch/arm/boot/dts/stm32f769-disco.dts b/arch/arm/boot/dts/stm32f769-disco.dts
index 6f1d0ac8c31c..a4284b761e7f 100644
--- a/arch/arm/boot/dts/stm32f769-disco.dts
+++ b/arch/arm/boot/dts/stm32f769-disco.dts
@@ -75,12 +75,10 @@ red {
 		};
 	};
 
-	gpio_keys {
+	gpio-keys {
 		compatible = "gpio-keys";
-		#address-cells = <1>;
-		#size-cells = <0>;
 		autorepeat;
-		button@0 {
+		button-0 {
 			label = "User";
 			linux,code = <KEY_HOME>;
 			gpios = <&gpioa 0 GPIO_ACTIVE_HIGH>;
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
