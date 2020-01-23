Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 15301146DF7
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Jan 2020 17:13:35 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C7EDBC36B13;
	Thu, 23 Jan 2020 16:13:34 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7B43CC36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Jan 2020 16:13:31 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00NGCWjG000791; Thu, 23 Jan 2020 17:13:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=r3vNXV7b+XrJKd7/p9M1rRMOLGGdPoVfCZx0V4W3LUk=;
 b=VL6jKtfywj8paeFx3J9hWpblaWrpB1T87ekB+Lq/z/uNa7oPtCL01o6L0JXyIDEpW7ko
 Jo8SPZb5EuUXtKWOEmY6VDvoFNe9JkYlY9pX66Ac/9hTMasOa9Q/Ch1m7zHgc7Xuwr+Y
 wdYeqGSTOKV5ssYnkRoofy8jBHrKQDMORBaqvqBffpD2/Pr618JIx3MDzdzLzc21etDN
 LMyLaH8kuasjA1M/77n+iZMkLKtK3rzWqDmiJNYVnhqz4chxo9LtC7ynAzQWs2GRLt+W
 xBZhogJcT7YWSqk+TgNq/nG4+Vr2KFe2ezaPTSnE2Cu7xo6Hq6z6VS89xD0n8+g0hlvZ EA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xkr1ebaym-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Jan 2020 17:13:20 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8C64F10003B;
 Thu, 23 Jan 2020 17:13:18 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7A9A72BC7D5;
 Thu, 23 Jan 2020 17:13:18 +0100 (CET)
Received: from localhost (10.75.127.51) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 23 Jan 2020 17:13:17
 +0100
From: Alain Volmat <alain.volmat@st.com>
To: <wsa@the-dreams.de>, <robh+dt@kernel.org>
Date: Thu, 23 Jan 2020 17:12:50 +0100
Message-ID: <1579795970-22319-6-git-send-email-alain.volmat@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1579795970-22319-1-git-send-email-alain.volmat@st.com>
References: <1579795970-22319-1-git-send-email-alain.volmat@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG8NODE1.st.com (10.75.127.22) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-23_08:2020-01-23,
 2020-01-23 signatures=0
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, pierre-yves.mordret@st.com, alain.volmat@st.com,
 linux-i2c@vger.kernel.org, mcoquelin.stm32@gmail.com, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 5/5] ARM: dts: stm32: add Fast Mode Plus info
	in I2C nodes of stm32mp151
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

Add the syscfg-fmp property in each i2c node in order to allow
Fast Mode Plus speed if clock-frequency >= 1MHz is indicated.

Signed-off-by: Alain Volmat <alain.volmat@st.com>
---
 arch/arm/boot/dts/stm32mp151.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp151.dtsi b/arch/arm/boot/dts/stm32mp151.dtsi
index 2dbf32ca9b36..ecd0a932aa78 100644
--- a/arch/arm/boot/dts/stm32mp151.dtsi
+++ b/arch/arm/boot/dts/stm32mp151.dtsi
@@ -483,6 +483,7 @@
 			resets = <&rcc I2C1_R>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+			st,syscfg-fmp = <&syscfg 0x4 0x1>;
 			wakeup-source;
 			status = "disabled";
 		};
@@ -497,6 +498,7 @@
 			resets = <&rcc I2C2_R>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+			st,syscfg-fmp = <&syscfg 0x4 0x2>;
 			wakeup-source;
 			status = "disabled";
 		};
@@ -511,6 +513,7 @@
 			resets = <&rcc I2C3_R>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+			st,syscfg-fmp = <&syscfg 0x4 0x4>;
 			wakeup-source;
 			status = "disabled";
 		};
@@ -525,6 +528,7 @@
 			resets = <&rcc I2C5_R>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+			st,syscfg-fmp = <&syscfg 0x4 0x10>;
 			wakeup-source;
 			status = "disabled";
 		};
@@ -1477,6 +1481,7 @@
 			resets = <&rcc I2C4_R>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+			st,syscfg-fmp = <&syscfg 0x4 0x8>;
 			wakeup-source;
 			status = "disabled";
 		};
@@ -1513,6 +1518,7 @@
 			resets = <&rcc I2C6_R>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+			st,syscfg-fmp = <&syscfg 0x4 0x20>;
 			wakeup-source;
 			status = "disabled";
 		};
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
