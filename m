Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 110A97477E3
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Jul 2023 19:34:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CBDA2C6B45B;
	Tue,  4 Jul 2023 17:34:13 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 611A7C03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Jul 2023 17:34:11 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-992e22c09edso397629566b.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 04 Jul 2023 10:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1688492051; x=1691084051;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+K05sBMM6p7NXDAV8Ux9b1t0k5cRXekoIV2P3Kh76Xw=;
 b=Ny43sP8+pJbMIBVttTOGYImqIAYLCMNJ2B/VwNih8hYxbkGpM+IGUdRmD/s4oLy608
 XgkaiY+R7INN+vBcqqUix+k+vLt+OMHkqVem/7N6yk1fVeuoXnkONc+6YwA62gPov+xa
 8gbmZSuTuWxsFLiU51KL/CuL3wU3GuzCxE1lg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688492051; x=1691084051;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+K05sBMM6p7NXDAV8Ux9b1t0k5cRXekoIV2P3Kh76Xw=;
 b=QjOXuwAzlcCFwLcwDJHTfGUI6K8xBRpgePMLpuImT4UHXNQVDsPF6dVY9EPd94Jv6o
 uRFat46VXLFIgzHbOOHAOJ6bnyFNO+gHT2jOm5ilhOnzobFj23LMvLaHWWKdFtCooyzc
 toRk674TN1cfl+wY8CRzoBfkhX+NS2+iRc18CYreIMi5ACtD6NePLwCL8e6VYS6/rlHV
 j7vDbNcub2vTle1NyojI+wLx0j+MIKa/iC/6XvfjdU8UnZVmtTBTlWzp/crrp6zZm9iA
 5+U4n6FuEC9QUbK7ytCmKC3jsrZnv8YxrYPnO6SSghP+GJwsJUPfi5evpSY+fs5ZVuhN
 C3kw==
X-Gm-Message-State: ABy/qLZtuXYC+kuSS20J5hG2JqnjRz1fWUEjePtxqw73Sxev+YVcZW+9
 a9qwZtXnCHvUc7NDtzhQqn7apQ==
X-Google-Smtp-Source: APBJJlFK3NsyL3nVNojHW421KP10BF589AScgGhWC+ZxmPL0fSDLBXw5Ct7ujEtvQomfAxBlUF/3lw==
X-Received: by 2002:a17:906:35d5:b0:96f:7b4a:2904 with SMTP id
 p21-20020a17090635d500b0096f7b4a2904mr10921853ejb.3.1688492051452; 
 Tue, 04 Jul 2023 10:34:11 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-82-58-49-236.retail.telecomitalia.it. [82.58.49.236])
 by smtp.gmail.com with ESMTPSA id
 v24-20020a1709064e9800b00992ca779f42sm6724645eju.97.2023.07.04.10.34.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jul 2023 10:34:11 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Tue,  4 Jul 2023 19:34:06 +0200
Message-Id: <20230704173407.590544-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/2] ARM: dts: stm32: add pin map for i2c3
	controller on stm32f7
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

Add pin configurations for using i2c3 controller on stm32f7.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 arch/arm/boot/dts/st/stm32f7-pinctrl.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32f7-pinctrl.dtsi b/arch/arm/boot/dts/st/stm32f7-pinctrl.dtsi
index 9f65403295ca..c8dfda7bd04f 100644
--- a/arch/arm/boot/dts/st/stm32f7-pinctrl.dtsi
+++ b/arch/arm/boot/dts/st/stm32f7-pinctrl.dtsi
@@ -171,6 +171,16 @@ pins {
 				};
 			};
 
+			i2c3_pins_a: i2c3-0 {
+				pins {
+					pinmux = <STM32_PINMUX('H', 8, AF4)>, /* I2C3_SDA */
+						 <STM32_PINMUX('H', 7, AF4)>; /* I2C3_SCL */
+					bias-disable;
+					drive-open-drain;
+					slew-rate = <0>;
+				};
+			};
+
 			usbotg_hs_pins_a: usbotg-hs-0 {
 				pins {
 					pinmux = <STM32_PINMUX('H', 4, AF10)>, /* OTG_HS_ULPI_NXT */
-- 
2.32.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
