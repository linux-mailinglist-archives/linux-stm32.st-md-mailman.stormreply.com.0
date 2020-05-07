Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 94EBA1C87D0
	for <lists+linux-stm32@lfdr.de>; Thu,  7 May 2020 13:15:20 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5F48EC3F93B;
	Thu,  7 May 2020 11:15:20 +0000 (UTC)
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 712F4C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 May 2020 11:15:19 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id o18so2373598pgg.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 07 May 2020 04:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=LPVqop7eYhlKO1AOSFfnjZfL6zhGOb1jJx61piurnL8=;
 b=tRS3YV17LbENu+VpnAc6CsLvuTRwOuDXc5iJ+rNe7z1ZO6/Sggfny1+zIo8dgIBpZl
 kg+jH7StyEUzti01YgpBJvS50xXVsSZk3qBOmgrdfdK/6mJRSYp9xCTa9h8RTdgk+zNR
 MOGHWMYooC5XgYl2CVraN6sJlD4oyzkNOJ9qfqDgN0PBukAP0vj1efJfVDp/2rElpjnz
 aPHvuRIN45z334PdXh+xEyNJR9cLcN0kv8bjI7cdDr+f9JnUN6DCrIgnToM8gTA9sXTt
 duS1BlGzDgKWYzGKSaOp1DKNfzojLz4Dnecot1rd0U6jMcjqBnEEmoQLRuAtBF4kGyVD
 YFuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=LPVqop7eYhlKO1AOSFfnjZfL6zhGOb1jJx61piurnL8=;
 b=fX4q2TlYzVpeEInTR9yt/ar5d/LTSYofr0si5CYgQLmmI+0BO7si4loEyuhQMIvHpx
 6ypt1WgavIx1TL6ROAcQ7tiIVqC7nBnZjMPf0UjMr61MRQQJNDAZoPlz3W8SiJL5w4DF
 8qEHIp4Wat4jPO4/hU70SdGvML1P63nW7yQDmKDEcGvCw1ALS9Xzjb04PUw8s+CGgzbp
 GOAVHbsyAJrEyuGJTzNjod716F1gINUPwALTwk7gRSLeVFJpzYpaQzTlQQk3C7yeVZIh
 q7bWKTf6B13hblQ7UWphDch0aOyr11NLJn0jNpo+eKxc9Lk2C9k30rTW4AASzikKjian
 uDOg==
X-Gm-Message-State: AGi0Pub+JLmDo5FitS8sOfnOXjPtE9MvzLQeC0H69vF9xBbEiXaQ10qT
 V7FjcmSu1XD6wVO1V8rI+NM=
X-Google-Smtp-Source: APiQypIPageHHo5o6CT94w6iXvoqpKWIPl0+2Om0RAPGaNvLr57cPx3lh7dN6T0Lq0Wney2FP8ukbg==
X-Received: by 2002:a62:7555:: with SMTP id q82mr13021927pfc.136.1588850117599; 
 Thu, 07 May 2020 04:15:17 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([103.206.190.146])
 by smtp.gmail.com with ESMTPSA id t74sm4729687pfc.64.2020.05.07.04.15.15
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 07 May 2020 04:15:17 -0700 (PDT)
From: dillon.minfei@gmail.com
To: mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
 philippe.schenker@toradex.com
Date: Thu,  7 May 2020 19:15:12 +0800
Message-Id: <1588850112-24297-1-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: dillon min <dillon.minfei@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH V2 2/4] ARM: dts: stm32: Add pin map for I2C3
	controller on stm32f4
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

From: dillon min <dillon.minfei@gmail.com>

This patch adds the pin configuration for I2C3 controller on
stm32f4.

Signed-off-by: dillon min <dillon.minfei@gmail.com>
---
 arch/arm/boot/dts/stm32f4-pinctrl.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/stm32f4-pinctrl.dtsi b/arch/arm/boot/dts/stm32f4-pinctrl.dtsi
index 392fa14..051f336 100644
--- a/arch/arm/boot/dts/stm32f4-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stm32f4-pinctrl.dtsi
@@ -316,6 +316,18 @@
 				};
 			};
 
+			i2c3_pins: i2c3-0 {
+				pins {
+					pinmux = <STM32_PINMUX('C', 9, AF4)>,
+						/* I2C3_SDA */
+						 <STM32_PINMUX('A', 8, AF4)>;
+						/* I2C3_SCL */
+					bias-disable;
+					drive-open-drain;
+					slew-rate = <3>;
+				};
+			};
+
 			dcmi_pins: dcmi-0 {
 				pins {
 					pinmux = <STM32_PINMUX('A', 4, AF13)>, /* DCMI_HSYNC */
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
