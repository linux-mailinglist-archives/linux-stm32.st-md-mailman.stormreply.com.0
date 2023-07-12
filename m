Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4A674FF49
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Jul 2023 08:30:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 92A4EC6B463;
	Wed, 12 Jul 2023 06:30:51 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 76584C6B45A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Jul 2023 06:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com; 
 s=default2211;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References;
 bh=T0dcoPCLaDYQMrHuXNE7wQ+1ki8yqQNoSM6auWBUDjc=; b=HcUtX5qvnoJrix64OWVAgd7w39
 TokPNlo6ncPjrCuUv31j8KpQyhvOuPHbv80e2ekFkdJAbXVPQOTMC5r7gF3ekGq5DfZD5uRHTd+xj
 7b1WfDpr0jbtZdDGmLgrKlJK2WF++I+cbgHVWDpk4D5v55hlqOCVkeOep4bE5PgzI3VTdS1l23f0m
 5xjo3MeZs4VGuaay39CWKmcs0nm8MSKwqNOnqOM8FAZA1svUiRebP34LS2FA8i0vFMEvke5pRwAQU
 rocoOX4FGahQfzrHdiuXkvYDyk8xJqj54UjeVDA+09Il/cGk2A6diAzfEFcdOB1zMlejKlBi8dHiA
 S7T9lgXw==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
 by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2) (envelope-from <sean@geanix.com>)
 id 1qJTN0-000AMl-90; Wed, 12 Jul 2023 08:30:38 +0200
Received: from [185.17.218.86] (helo=zen..)
 by sslproxy03.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <sean@geanix.com>)
 id 1qJTMz-00020e-Lv; Wed, 12 Jul 2023 08:30:37 +0200
From: Sean Nyekjaer <sean@geanix.com>
To: a.fatoum@pengutronix.de, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Wed, 12 Jul 2023 08:29:46 +0200
Message-Id: <20230712062954.2194505-1-sean@geanix.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-Authenticated-Sender: sean@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.8/26966/Tue Jul 11 09:28:31 2023)
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dantuguf14105@gmail.com, Sean Nyekjaer <sean@geanix.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 1/8] ARM: dts: stm32: Add alternate pinmux
	for i2s pins
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

Add another mux option for i2s pins, this is used on Octavo OSD32MP1-RED board.

Signed-off-by: Sean Nyekjaer <sean@geanix.com>
Reviewed-by: Olivier Moysan <olivier.moysan@foss.st.com>
---
 arch/arm/boot/dts/stm32mp15-pinctrl.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
index e86d989dd351..d79f89f37bc7 100644
--- a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
@@ -686,6 +686,25 @@ pins {
 		};
 	};
 
+	i2s2_pins_b: i2s2-1 {
+		pins {
+			pinmux = <STM32_PINMUX('C',  3, AF5)>, /* I2S2_SDO */
+				 <STM32_PINMUX('B', 12, AF5)>, /* I2S2_WS */
+				 <STM32_PINMUX('B', 13, AF5)>; /* I2S2_CK */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <1>;
+		};
+	};
+
+	i2s2_sleep_pins_b: i2s2-sleep-1 {
+		pins {
+			pinmux = <STM32_PINMUX('C', 3, ANALOG)>, /* I2S2_SDO */
+				 <STM32_PINMUX('B', 12, ANALOG)>, /* I2S2_WS */
+				 <STM32_PINMUX('B', 13, ANALOG)>; /* I2S2_CK */
+		};
+	};
+
 	ltdc_pins_a: ltdc-0 {
 		pins {
 			pinmux = <STM32_PINMUX('G',  7, AF14)>, /* LCD_CLK */
-- 
2.40.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
