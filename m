Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 124D5141ED
	for <lists+linux-stm32@lfdr.de>; Sun,  5 May 2019 20:41:30 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7E6CDC5F1E7
	for <lists+linux-stm32@lfdr.de>; Sun,  5 May 2019 18:41:29 +0000 (UTC)
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C4AEFC0D23A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 May 2019 05:31:49 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id w22so858576pgi.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 02 May 2019 22:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=o2KnYtWi5SLktJn2op8zkW2H4ncbiGRKRjw+VMEkUnU=;
 b=HMBjz4VxsRY0GQSmLRIjcd/LPfpLc9xSHhYK+CETWHZGNTwq8RwHcbROkiHwm+6Ghi
 EDy0OWzoxVBy78gHvt5bKH9BZYqXNeXa3khB1qmIh/wgfyptgf1NEurtoc+Y9Ey4uEsW
 HVOWDx7mFk+nhWnVsunMPSj+1aYqaVbeRyUloYlht+SgOoLtw3TSpsDEFOn1rdSh0mRN
 l7RUjBmSJ+Yg04dgR7S12gOyQzgSYKqHCTkXY0rL5w+3tvpAPh9yWZT8QVEJivWTJPee
 N1umIS//rg3Drebciyt+JRxHGe2eUrLIPVHz1ys0xSsXqm2TndPy1/gDWRybFpTVpCfl
 V8kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=o2KnYtWi5SLktJn2op8zkW2H4ncbiGRKRjw+VMEkUnU=;
 b=gnEnZYvGUnewzzOxWPbaEGwlfSSB+wZ3pVUHdZx22btAXNbnJTnX7ebwHuvZaTDbt4
 0zUBd+Rx7M8jzeT7MErmiCTDE245fLAZVRcrnJe/3xL3csM2RHJL4slQmZY0aJIF2U7N
 uHVFJlQwUmX58yF738WtZwrACP+AOMf1bKCI2aAlHPbeIsx74wpFsBM8Ks4bRwQQ7PQW
 r3/I2sI9DyMv60y1Mswzgr7zwHZXxLbLcQQe2kwllSwnxRc9upwu+QQ+/EgKARkCu2Xr
 AmFs+qyONmwWVUlJD0TWflcd6MndnNCr7QMnNC6pF1iUVDdaPgAoDQk/hcsSLKUYgZzv
 h51A==
X-Gm-Message-State: APjAAAXve9D2YHEjX6MDKHLeAttnWR4BFFo8GCl9cLQ7XyPJOiXbO9up
 CiZKPAIV3t8ew87809HkuC2X
X-Google-Smtp-Source: APXvYqxABA9lxDSm2LKatJUanyxVDJb7MJrFiBSyTE90tiesPer2oZLAcR7IjsvsZ4bxW1EYHkaDog==
X-Received: by 2002:a63:6fc1:: with SMTP id k184mr8099288pgc.239.1556861508351; 
 Thu, 02 May 2019 22:31:48 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:72c7:3835:31df:f367:f70b:ed86])
 by smtp.gmail.com with ESMTPSA id l15sm1152226pgb.71.2019.05.02.22.31.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 02 May 2019 22:31:47 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: mcoquelin.stm32@gmail.com,
	alexandre.torgue@st.com,
	robh+dt@kernel.org
Date: Fri,  3 May 2019 11:01:22 +0530
Message-Id: <20190503053123.6828-3-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190503053123.6828-1-manivannan.sadhasivam@linaro.org>
References: <20190503053123.6828-1-manivannan.sadhasivam@linaro.org>
X-Mailman-Approved-At: Sun, 05 May 2019 18:41:28 +0000
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 2/3] ARM: dts: stm32mp157: Add missing pinctrl
	definitions
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Add missing pinctrl definitions for STM32MP157 MPU.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm/boot/dts/stm32mp157-pinctrl.dtsi | 62 +++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
index 85c417d9983b..0b5bcf6a7c97 100644
--- a/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stm32mp157-pinctrl.dtsi
@@ -241,6 +241,23 @@
 				};
 			};
 
+			i2c1_pins_b: i2c1-2 {
+				pins {
+					pinmux = <STM32_PINMUX('F', 14, AF5)>, /* I2C1_SCL */
+						 <STM32_PINMUX('F', 15, AF5)>; /* I2C1_SDA */
+					bias-disable;
+					drive-open-drain;
+					slew-rate = <0>;
+				};
+			};
+
+			i2c1_pins_sleep_b: i2c1-3 {
+				pins {
+					pinmux = <STM32_PINMUX('F', 14, ANALOG)>, /* I2C1_SCL */
+						 <STM32_PINMUX('F', 15, ANALOG)>; /* I2C1_SDA */
+				};
+			};
+
 			i2c2_pins_a: i2c2-0 {
 				pins {
 					pinmux = <STM32_PINMUX('H', 4, AF4)>, /* I2C2_SCL */
@@ -258,6 +275,23 @@
 				};
 			};
 
+			i2c2_pins_b: i2c2-2 {
+				pins {
+					pinmux = <STM32_PINMUX('Z', 0, AF3)>, /* I2C2_SCL */
+						 <STM32_PINMUX('H', 5, AF4)>; /* I2C2_SDA */
+					bias-disable;
+					drive-open-drain;
+					slew-rate = <0>;
+				};
+			};
+
+			i2c2_pins_sleep_b: i2c2-3 {
+				pins {
+					pinmux = <STM32_PINMUX('Z', 0, ANALOG)>, /* I2C2_SCL */
+						 <STM32_PINMUX('H', 5, ANALOG)>; /* I2C2_SDA */
+				};
+			};
+
 			i2c5_pins_a: i2c5-0 {
 				pins {
 					pinmux = <STM32_PINMUX('A', 11, AF4)>, /* I2C5_SCL */
@@ -599,6 +633,34 @@
 					bias-disable;
 				};
 			};
+
+			uart4_pins_b: uart4-1 {
+				pins1 {
+					pinmux = <STM32_PINMUX('D', 1, AF8)>; /* UART4_TX */
+					bias-disable;
+					drive-push-pull;
+					slew-rate = <0>;
+				};
+				pins2 {
+					pinmux = <STM32_PINMUX('B', 2, AF8)>; /* UART4_RX */
+					bias-disable;
+				};
+			};
+
+			uart7_pins_a: uart7-0 {
+				pins1 {
+					pinmux = <STM32_PINMUX('E', 8, AF7)>; /* UART4_TX */
+					bias-disable;
+					drive-push-pull;
+					slew-rate = <0>;
+				};
+				pins2 {
+					pinmux = <STM32_PINMUX('E', 7, AF7)>, /* UART4_RX */
+						 <STM32_PINMUX('E', 10, AF7)>, /* UART4_CTS */
+						 <STM32_PINMUX('E', 9, AF7)>; /* UART4_RTS */
+					bias-disable;
+				};
+			};
 		};
 
 		pinctrl_z: pin-controller-z@54004000 {
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
