Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A23B688F960
	for <lists+linux-stm32@lfdr.de>; Thu, 28 Mar 2024 09:02:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 54836C6DD96;
	Thu, 28 Mar 2024 08:02:05 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 389CCC6B444
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 Mar 2024 08:02:04 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 42S20cbJ007927; Thu, 28 Mar 2024 09:01:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding:content-type; s=selector1; bh=B3k9NYQ
 +W0JovX05lxSOFMRWz6YTKcx+T4goM/utJYs=; b=fUZYtRXWdHKLTsnBLtLfC41
 A9d0Z0pqU+WM2pMGPSPYfObG2u0azWHtiu9+Wx+1t2YjW776IKo3CRM5i6msA6aZ
 RWxncsIv76TmXIqnPMB+lpC6C/8VcIzvp4Qkyi0M/CUuoJGYswEgzc+bNP+R6xqj
 wgSe02V9961lRcB8VTHXQZbEI/oDkBafNxHu4Hb2m64s6mR7WaF2ePUGU5KAGNKR
 rtqCap8RKiCExXxXeG83oQS4Jwr19KxNbYOvYwJiWByDkEIV89BAPeGtNOW2Kyh8
 sLrToKtVrmEp4DqB8LRfaVKu5F7Qz1PYDe17+Ima4dGF2nvPpbiAafGtykBPocA=
 =
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3x1pugrc0b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Mar 2024 09:01:40 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 4E9E440044;
 Thu, 28 Mar 2024 09:01:36 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 238F0210743;
 Thu, 28 Mar 2024 09:01:11 +0100 (CET)
Received: from localhost (10.201.20.71) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 28 Mar
 2024 09:01:10 +0100
From: <patrice.chotard@foss.st.com>
To: <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, <alexandre.torgue@foss.st.com>
Date: Thu, 28 Mar 2024 09:01:05 +0100
Message-ID: <20240328080105.3910099-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.201.20.71]
X-ClientProxiedBy: SAFCAS1NODE2.st.com (10.75.90.13) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-28_07,2024-03-27_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH v1] ARM: dts: stm32: Update button on
	stm32mp135f-dk
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

From: Patrice Chotard <patrice.chotard@foss.st.com>

On schematics, 2 buttons are available on stm32mp135-dk board:
  _ button "user1" connected to GPIOA14
  _ button "user2" connected to GPIOA13

Reflect that on device tree.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp135f-dk.dts | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/st/stm32mp135f-dk.dts b/arch/arm/boot/dts/st/stm32mp135f-dk.dts
index 52171214a308..f7e03bc7eccb 100644
--- a/arch/arm/boot/dts/st/stm32mp135f-dk.dts
+++ b/arch/arm/boot/dts/st/stm32mp135f-dk.dts
@@ -48,9 +48,15 @@ optee@dd000000 {
 	gpio-keys {
 		compatible = "gpio-keys";
 
-		button-user {
-			label = "User-PA13";
+		button-user-1 {
+			label = "User-1";
 			linux,code = <BTN_1>;
+			gpios = <&gpioa 14 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
+		};
+
+		button-user-2 {
+			label = "User-2";
+			linux,code = <BTN_2>;
 			gpios = <&gpioa 13 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
 		};
 	};
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
