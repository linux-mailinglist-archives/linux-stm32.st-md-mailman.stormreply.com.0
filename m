Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 910114AC4B7
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Feb 2022 17:01:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 587B9C5AB61;
	Mon,  7 Feb 2022 16:01:22 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A1BD3C0614D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Feb 2022 16:01:21 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 213EhamF031133;
 Thu, 3 Feb 2022 18:14:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=oJsVc/G0V4FvZjE6ehLE8WHxeNAr1eqH/qcfE5+Oq3A=;
 b=oyACJjYaOyVVCeGQn+TtxgMMN1USwMEfUUu2w6r7s6lWpStqSrXgV0Cc1uSEHgPJ3Pi+
 yx6heCSTxVm1Tp45yzT/vXnfV85xBSFDfHbCeWAMjCphrrE7lf0BPyXN0v+rw86EeQAx
 CLR+NrvIpCbx4/Ivv7fADOoAcRfCdmv9hU+XL0h4O6ClTfJljtJLQyfGM4zto9J8xTZW
 FpZRNtzTGuobNCgcuXUQjhpYcZ3GpJYRN0V46pebbRP9RrUAkWzlJdCPuQczKM8aCnoV
 DiprXZ6ZoReE608wfeGr3p32/u1BtgLKg2mx3KSA8M0xmMBEVz5d66PQk0+vXK0+/89a Fg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3e01qkcyq6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Feb 2022 18:14:32 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E8F8A10002A;
 Thu,  3 Feb 2022 18:14:31 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E0F2222F7AB;
 Thu,  3 Feb 2022 18:14:31 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Thu, 3 Feb 2022 18:14:31
 +0100
From: Erwan Le Ray <erwan.leray@foss.st.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Thu, 3 Feb 2022 18:11:14 +0100
Message-ID: <20220203171114.10888-17-erwan.leray@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220203171114.10888-1-erwan.leray@foss.st.com>
References: <20220203171114.10888-1-erwan.leray@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-03_06,2022-02-03_01,2021-12-02_01
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Marcin Sloniewski <marcin.sloniewski@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Jagan Teki <jagan@amarulasolutions.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 16/16] ARM: dts: stm32: keep uart nodes
	behavior on stm32mp15xx-dhcor-avenger96
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

DMA configuration is added to uart nodes in stm32mp15x device tree.
Delete uart4 DMA property in stm32mp15xx-dhcor-avenger96 board device
tree to keep console in irq mode, as DMA support for console has been
removed from the driver by commit e359b4411c28 ("serial: stm32: fix
threaded interrupt handling").
Delete also usart2 and uart7 DMA property to keep current behavior.

Signed-off-by: Erwan Le Ray <erwan.leray@foss.st.com>

diff --git a/arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi b/arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi
index 6885948f3024..61e17f44ce81 100644
--- a/arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi
+++ b/arch/arm/boot/dts/stm32mp15xx-dhcor-avenger96.dtsi
@@ -376,6 +376,8 @@
 	label = "LS-UART1";
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart4_pins_b>;
+	/delete-property/dmas;
+	/delete-property/dma-names;
 	status = "okay";
 };
 
@@ -385,6 +387,8 @@
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart7_pins_a>;
 	uart-has-rtscts;
+	/delete-property/dmas;
+	/delete-property/dma-names;
 	status = "okay";
 };
 
@@ -394,6 +398,8 @@
 	pinctrl-0 = <&usart2_pins_a>;
 	pinctrl-1 = <&usart2_sleep_pins_a>;
 	st,hw-flow-ctrl;
+	/delete-property/dmas;
+	/delete-property/dma-names;
 	status = "okay";
 
 	bluetooth {
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
