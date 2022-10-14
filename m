Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC635FEFFA
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Oct 2022 16:15:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 23B7EC65042;
	Fri, 14 Oct 2022 14:15:45 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E2D69C6411E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Oct 2022 14:15:43 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29EA9xMQ019182;
 Fri, 14 Oct 2022 16:15:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=fGvz6oql+K0UHWPbNDcQlT4m0Yenf1lBjmyoVUBkJPU=;
 b=s2OeqV09NvZF+Bdsr2/Hntae4fH10ejp79CRxi2Rx4iQH+2D+J0vKkRnc8UjsyqncMsP
 mpdFJDioMhP8nOEkwUsUadm0JybEwlVgcQt9FAxDKzx1YPZWmaqfIlJkelGQLz85P+za
 zjHbc8CccE6jI6UW6WwlNC4sMANGjqxWd2ph9o9avLVUymKvVXkheaT443qsgz0Efcmm
 cqDm7actbAtjN8fGEqwzc+QKEpvkNCIkUn+mUpiaMwqFspUOAy4XqExIwIrdxY2iZ/Me
 OKMX4UF+ftkVR16Mh0D0CFOiqoH6l6l2AhayOAapDA9T311l+6+emDIgZdn6mSI+rTLK kA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3k75sd9hyv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Oct 2022 16:15:36 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8F4FB100034;
 Fri, 14 Oct 2022 16:15:31 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8AA8F2309FB;
 Fri, 14 Oct 2022 16:15:31 +0200 (CEST)
Received: from localhost (10.75.127.45) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Fri, 14 Oct
 2022 16:15:29 +0200
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
To: <alexandre.torgue@foss.st.com>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>
Date: Fri, 14 Oct 2022 16:15:00 +0200
Message-ID: <20221014141509.211149-2-fabrice.gasnier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221014141509.211149-1-fabrice.gasnier@foss.st.com>
References: <20221014141509.211149-1-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-14_08,2022-10-14_01,2022-06-22_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 01/10] ARM: dts: stm32: add PWR fixed
	regulators on stm32mp131
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

Add 1v1, 1v8 and 3v3 PWR regulators on stm32mp131. Temporary add them
as fixed regulators, waiting for full SCMI regulators support.

This is a precursor patch to enable USB support on STM32MP13.
Note: USB support requires these regulators to be enabled before
entering kernel.

Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
 arch/arm/boot/dts/stm32mp131.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp131.dtsi b/arch/arm/boot/dts/stm32mp131.dtsi
index dd35a607073d..e0e0e27a9221 100644
--- a/arch/arm/boot/dts/stm32mp131.dtsi
+++ b/arch/arm/boot/dts/stm32mp131.dtsi
@@ -77,6 +77,28 @@ timer {
 		always-on;
 	};
 
+	/* PWR 1v1, 1v8 and 3v3 regulators defined as fixed, waiting for SCMI */
+	reg11: reg11 {
+		compatible = "regulator-fixed";
+		regulator-name = "reg11";
+		regulator-min-microvolt = <1100000>;
+		regulator-max-microvolt = <1100000>;
+	};
+
+	reg18: reg18 {
+		compatible = "regulator-fixed";
+		regulator-name = "reg18";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
+	usb33: usb33 {
+		compatible = "regulator-fixed";
+		regulator-name = "usb33";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+
 	soc {
 		compatible = "simple-bus";
 		#address-cells = <1>;
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
