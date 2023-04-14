Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC5D6E1E95
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Apr 2023 10:43:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 33591C6A603;
	Fri, 14 Apr 2023 08:43:09 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 40A27C6A5E6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Apr 2023 08:43:07 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33E7hfNq006573; Fri, 14 Apr 2023 10:42:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=QpPXBtsHkQMuvY0n+wqW+FRbWvmIB4mawMzRJpA2Fyc=;
 b=QpH6BKok8SHoDwYCoSNTKCRyI601Ah8gxDv1zfAoLQXiyEyu3E3DC8a8h+JW4vTh69i3
 lm4+8+OVs6YJxXL8fMOqb4H4+aj9wXj35HMzQ/Ul+K8MN4BRyaLWjVMOfn01racUb23+
 2T5JmyCNbJxdQy9Ox68N4Y4Vd6mfhOPnmgcDlvu9FHerrGKNcbzzCwfUGCZ6XYawrsH5
 ekWDOOw9mK0h8Im42t9Qi9ddDjK9hfpo6GRKGBSiV+HnVK6tAGl7aNaXlyDcGpcev9Yf
 X3OS91Q7t03VG+uUG9qDLhl04e0sJajjoc2L6+oTeiilCwxXK1DWWEjtZ80FtjSciTW/ gQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3pwsgpq3qe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Apr 2023 10:42:58 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 286A7100034;
 Fri, 14 Apr 2023 10:42:13 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 10B8720BE6D;
 Fri, 14 Apr 2023 10:42:13 +0200 (CEST)
Received: from localhost (10.252.1.127) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Fri, 14 Apr
 2023 10:42:11 +0200
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
To: <hminas@synopsys.com>, <gregkh@linuxfoundation.org>, <robh+dt@kernel.org>, 
 <krzysztof.kozlowski+dt@linaro.org>, <alexandre.torgue@foss.st.com>
Date: Fri, 14 Apr 2023 10:41:37 +0200
Message-ID: <20230414084137.1050487-5-fabrice.gasnier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230414084137.1050487-1-fabrice.gasnier@foss.st.com>
References: <20230414084137.1050487-1-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.252.1.127]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-14_03,2023-04-13_01,2023-02-09_01
Cc: devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 4/4] ARM: dts: stm32: add USB OTG UTMI
	clock on stm32mp151
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

It's needed on STM32MP15, when using the integrated full-speed PHY. This
clock is an output of USBPHYC, and the HS USBPHYC is not attached as PHY
in this case (managed directly by dwc2 ggpio glue):

    &usbotg_hs {
    	compatible = "st,stm32mp15-fsotg", "snps,dwc2";
    	pinctrl-names = "default";
    	pinctrl-0 = <&usbotg_hs_pins_a &usbotg_fs_dp_dm_pins_a>;
    	vbus-supply = <&vbus_otg>;
    	status = "okay";
    };

USBPHYC clock output must be used, so it can be properly enabled as a
clock provider.

Without this, currently, when the dualport High-Speed USBPHYC isn't
requested by either USBH or OTG, it remains uninitialized when probing
OTG: OTG configured with full-speed PHY isn't properly clocked, resulting
in error log like:
[    2.383138] dwc2 49000000.usb-otg: dwc2_core_reset: HANG! Soft Reset
timeout GRSTCTL_CSFTRST.

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
Changes in v2:
- "utmi_clk" renamed "utmi" as per Krzysztof comment on dt-bindings
---
 arch/arm/boot/dts/stm32mp151.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/stm32mp151.dtsi b/arch/arm/boot/dts/stm32mp151.dtsi
index 4e437d3f2ed6..63f4c78fcc1d 100644
--- a/arch/arm/boot/dts/stm32mp151.dtsi
+++ b/arch/arm/boot/dts/stm32mp151.dtsi
@@ -1130,8 +1130,8 @@ sdmmc3: mmc@48004000 {
 		usbotg_hs: usb-otg@49000000 {
 			compatible = "st,stm32mp15-hsotg", "snps,dwc2";
 			reg = <0x49000000 0x10000>;
-			clocks = <&rcc USBO_K>;
-			clock-names = "otg";
+			clocks = <&rcc USBO_K>, <&usbphyc>;
+			clock-names = "otg", "utmi";
 			resets = <&rcc USBO_R>;
 			reset-names = "dwc2";
 			interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
