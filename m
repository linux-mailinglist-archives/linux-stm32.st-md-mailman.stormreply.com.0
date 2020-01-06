Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0641312D2
	for <lists+linux-stm32@lfdr.de>; Mon,  6 Jan 2020 14:29:55 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A5A23C36B17;
	Mon,  6 Jan 2020 13:29:55 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4533FC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Jan 2020 13:29:54 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 006DRPGq006070; Mon, 6 Jan 2020 14:29:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=wjQdFwE1hTJLf/l3Bfadi5K3scAmh1frqnNxBbfuOeY=;
 b=tdrHsJCTNJm6YvCLcAKl1AQg8qfwhkFOuqsriNFaVw70kmJuOK1/PBmIFVnQElWVhWWN
 M4WkILKO4rwkowxqAW6DzXpvYxl25V0/m+efnEeIeqO3AyjXaQKF6g6YyHQVzyiRN9j3
 P+/+iUhqbuV1kvSleSJIMbLmv1hbspyN7e4SZatecuDXFYTgcr+zMiTl9VBUxkl6+B2l
 6bnlIFWbs4+RJQ/4O1BG0dXysAJqaYxuxUGegoOLfoE2yRHxfe1KZd2rjbPMXO4RQ50Z
 c/dIdScvNdkySyPd8cZyRq3t66h5ZclGU77xYC2+n89j8fi33PeibfqK0VBCGnI+J/gZ Lw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xakm584up-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Jan 2020 14:29:44 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3D64710002A;
 Mon,  6 Jan 2020 14:29:44 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3037F2D378B;
 Mon,  6 Jan 2020 14:29:44 +0100 (CET)
Received: from localhost (10.75.127.51) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 6 Jan 2020 14:29:43
 +0100
From: Alain Volmat <alain.volmat@st.com>
To: <wsa@the-dreams.de>, <robh+dt@kernel.org>
Date: Mon, 6 Jan 2020 14:28:34 +0100
Message-ID: <1578317314-17197-7-git-send-email-alain.volmat@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1578317314-17197-1-git-send-email-alain.volmat@st.com>
References: <1578317314-17197-1-git-send-email-alain.volmat@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG4NODE1.st.com (10.75.127.10) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2020-01-06_04:2020-01-06,2020-01-06 signatures=0
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, pierre-yves.mordret@st.com,
 linux-i2c@vger.kernel.org, mcoquelin.stm32@gmail.com, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 6/6] ARM: dts: stm32: add wakeup-source in all
	I2C nodes of stm32mp157c
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

Add the wakeup-source property in all i2c nodes of
the SoC stm32mp157c so that those I2C controllers can become
wakeup-source.

Signed-off-by: Alain Volmat <alain.volmat@st.com>
---
 arch/arm/boot/dts/stm32mp151.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp151.dtsi b/arch/arm/boot/dts/stm32mp151.dtsi
index 3dd570b10181..5706c4f41b0b 100644
--- a/arch/arm/boot/dts/stm32mp151.dtsi
+++ b/arch/arm/boot/dts/stm32mp151.dtsi
@@ -483,6 +483,7 @@
 			resets = <&rcc I2C1_R>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+			wakeup-source;
 			status = "disabled";
 		};
 
@@ -496,6 +497,7 @@
 			resets = <&rcc I2C2_R>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+			wakeup-source;
 			status = "disabled";
 		};
 
@@ -509,6 +511,7 @@
 			resets = <&rcc I2C3_R>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+			wakeup-source;
 			status = "disabled";
 		};
 
@@ -522,6 +525,7 @@
 			resets = <&rcc I2C5_R>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+			wakeup-source;
 			status = "disabled";
 		};
 
@@ -1473,6 +1477,7 @@
 			resets = <&rcc I2C4_R>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+			wakeup-source;
 			status = "disabled";
 		};
 
@@ -1508,6 +1513,7 @@
 			resets = <&rcc I2C6_R>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+			wakeup-source;
 			status = "disabled";
 		};
 
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
