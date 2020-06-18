Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 155741FF2A0
	for <lists+linux-stm32@lfdr.de>; Thu, 18 Jun 2020 15:07:18 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CCCE7C36B23;
	Thu, 18 Jun 2020 13:07:17 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 33A6BC36B14
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Jun 2020 13:07:14 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05ID3ERd009888; Thu, 18 Jun 2020 15:07:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=F1ks9VYjpvP05Of9CUD3DC+d0dNYqSzdgBJGWySKuj0=;
 b=d+ISS4mv/dq48tUeqUnycN/ahs453L892x1wpss62YITWDE1KX1rJorn7sgVq7c1sPQt
 A8RtqpMEUMlMmfp/dNYiosfdxRRG5ZNXZdOoCwHAZx4AGZ40xkM97LNcdJBJnLqb1xoR
 uYilZOHUYJxY9B4zOoOFJdylqSvT0du4X00Q49GzhhVeuk40qo6b1yq+XytLofsZfTg5
 Vr9wo5OIrItw3NZpZd2iQIhYh/jwUUdFDzCiUasCqr0cNPLEhhrMdhx7tFk4tT6R5uzv
 dexvChLiBHy+6w1NL0KddZKqV2HehgRR8ffIWMIXB0eBSx7xa3hLRyomqu1dAAYcM3ZR /w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31q6jmjyux-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Jun 2020 15:07:02 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6CCDC100038;
 Thu, 18 Jun 2020 15:07:00 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 603062AAA6C;
 Thu, 18 Jun 2020 15:07:00 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG3NODE1.st.com (10.75.127.7)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 18 Jun 2020 15:06:59
 +0200
From: Erwan Le Ray <erwan.leray@st.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@st.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>
Date: Thu, 18 Jun 2020 15:06:48 +0200
Message-ID: <20200618130651.29836-3-erwan.leray@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200618130651.29836-1-erwan.leray@st.com>
References: <20200618130651.29836-1-erwan.leray@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG7NODE1.st.com (10.75.127.19) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-18_12:2020-06-18,
 2020-06-18 signatures=0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v2 2/5] ARM: dts: stm32: add usart3 node to
	stm32mp15xx-dkx boards
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

Adds usart3 node to stm32mp15xx-dkx and usart3 alias to stm32mp157a-dk1
and stm32mp157c-dk2 boards. usart3 pins are connected to GPIO Expansion
connector. usart3 is disabled by default.

Signed-off-by: Erwan Le Ray <erwan.leray@st.com>

diff --git a/arch/arm/boot/dts/stm32mp157a-dk1.dts b/arch/arm/boot/dts/stm32mp157a-dk1.dts
index d03d4cd2606a..65ee61b7667a 100644
--- a/arch/arm/boot/dts/stm32mp157a-dk1.dts
+++ b/arch/arm/boot/dts/stm32mp157a-dk1.dts
@@ -18,6 +18,7 @@
 	aliases {
 		ethernet0 = &ethernet0;
 		serial0 = &uart4;
+		serial1 = &usart3;
 	};
 
 	chosen {
diff --git a/arch/arm/boot/dts/stm32mp157c-dk2.dts b/arch/arm/boot/dts/stm32mp157c-dk2.dts
index 9a8a26710ac1..fb690a817e28 100644
--- a/arch/arm/boot/dts/stm32mp157c-dk2.dts
+++ b/arch/arm/boot/dts/stm32mp157c-dk2.dts
@@ -19,6 +19,7 @@
 	aliases {
 		ethernet0 = &ethernet0;
 		serial0 = &uart4;
+		serial1 = &usart3;
 	};
 
 	chosen {
diff --git a/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi b/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
index e5fdbc149bf4..243aa4b2063d 100644
--- a/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
+++ b/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
@@ -591,6 +591,15 @@
 	status = "okay";
 };
 
+&usart3 {
+	pinctrl-names = "default", "sleep", "idle";
+	pinctrl-0 = <&usart3_pins_c>;
+	pinctrl-1 = <&usart3_sleep_pins_c>;
+	pinctrl-2 = <&usart3_idle_pins_c>;
+	uart-has-rtscts;
+	status = "disabled";
+};
+
 &usbh_ehci {
 	phys = <&usbphyc_port0>;
 	status = "okay";
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
