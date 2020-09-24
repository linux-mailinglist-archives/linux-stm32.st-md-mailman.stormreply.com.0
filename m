Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C99276C96
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Sep 2020 11:01:16 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CA7CDC424B1;
	Thu, 24 Sep 2020 09:01:15 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5079FC3FAD8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Sep 2020 09:01:12 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08O8vg0u024428; Thu, 24 Sep 2020 11:01:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=oxvd4rChL3hL2/3RaqvA0YXKeUyrfWvcv0iFW/5fUzY=;
 b=NLPfCDt5dGuIyJIQvou+YZLMem9SI5s3sVa7oisXT4UOmPoiCkp3XIpq34z+L+yAYhIC
 3SeYOtTe8doMupJ/WjgoD4fnaL1FJPo+XyLeULHlNUzn35rCIavperpzuI+MR9nxAw79
 VgLzszyK8d4wGQeADqqqu32803dblq+B95MsiH1m2JMKow8ZyFZIl/5TezkKc6laqk/I
 O5HpE655PZTQgJc6dR4S2jv4A7OogrkkzjZiP46+Z8CATTrbvf307y0bfiLY0Qu6UK0m
 kzAeWAX7K28n85eIe53Tz34q5MsExYc5iYgKWmHjKsnMjhtXuzegjHQywLdX2YXN79cA eA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 33n748cs6b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Sep 2020 11:01:02 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 129C810003A;
 Thu, 24 Sep 2020 11:01:02 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E6C422A4D64;
 Thu, 24 Sep 2020 11:01:01 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG3NODE2.st.com (10.75.127.8)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 24 Sep 2020 11:01:01
 +0200
From: Amelie Delaunay <amelie.delaunay@st.com>
To: Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, Russell King
 <linux@armlinux.org.uk>, Heikki Krogerus <heikki.krogerus@linux.intel.com>
Date: Thu, 24 Sep 2020 11:00:48 +0200
Message-ID: <20200924090049.9041-6-amelie.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200924090049.9041-1-amelie.delaunay@st.com>
References: <20200924090049.9041-1-amelie.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-24_05:2020-09-24,
 2020-09-24 signatures=0
Cc: devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 5/6] ARM: dts: stm32: add STUSB1600 Type-C
	using I2C4 on stm32mp15xx-dkx
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

This patch adds support for STUSB1600 USB Type-C port controller, used on
I2C4 on stm32mp15xx-dkx.
The default configuration on this board, on Type-C connector, is:
- Dual Power Role (DRP), so set power-role to "dual";
- Vbus limited to 500mA, so set power-opmode to "default" (it means 500mA
  in USB 2.0).
power-opmode is used to reconfigure the STUSB1600 advertising of current
capability when its NVM is not in line with the board layout.
On stm32mp15xx-dkx, Vbus power source of STUSB1600 is 5V_VIN (so add the
vin fixed 5V regulator too). So power operation mode depends on the power
supply used. To avoid any power issues, it is better to limit Vbus to 500mA
on this board.
ALERT# is the interrupt pin of STUSB1600. It needs an external pull-up, and
signal is active low.

USB OTG controller ID and Vbus signals are not connected on stm32mp15xx-dkx
boards, so disconnection are not detected.
Without DWC2 usb-role-switch:
- if you unplug the USB cable from the Type-C port, you have to manually
disconnect the USB gadget:
echo disconnect > /sys/devices/platform/soc/49000000.usb-otg/udc/49000000.usb-otg/soft_connect
- Then you can plug the USB cable again in the Type-C port, and manually
reconnect the USB gadget:
echo connect > /sys/devices/platform/soc/49000000.usb-otg/udc/49000000.usb-otg/soft_connect
With DWC2 usb-role-switch, USB gadget is dynamically disconnected or connected.

Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
---
No changes in v3.
No changes in v2.
---
 arch/arm/boot/dts/stm32mp15-pinctrl.dtsi |  7 +++++
 arch/arm/boot/dts/stm32mp15xx-dkx.dtsi   | 38 ++++++++++++++++++++++++
 2 files changed, 45 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
index b5a66429670c..fe782afaf010 100644
--- a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
@@ -1573,6 +1573,13 @@
 		};
 	};
 
+	stusb1600_pins_a: stusb1600-0 {
+		pins {
+			pinmux = <STM32_PINMUX('I', 11, ANALOG)>;
+			bias-pull-up;
+		};
+	};
+
 	uart4_pins_a: uart4-0 {
 		pins1 {
 			pinmux = <STM32_PINMUX('G', 11, AF6)>; /* UART4_TX */
diff --git a/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi b/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
index a5307745719a..589065223bf0 100644
--- a/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
+++ b/arch/arm/boot/dts/stm32mp15xx-dkx.dtsi
@@ -80,6 +80,14 @@
 		dais = <&sai2a_port &sai2b_port &i2s2_port>;
 		status = "okay";
 	};
+
+	vin: vin {
+		compatible = "regulator-fixed";
+		regulator-name = "vin";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+	};
 };
 
 &adc {
@@ -230,6 +238,30 @@
 	/delete-property/dmas;
 	/delete-property/dma-names;
 
+	stusb1600@28 {
+		compatible = "st,stusb1600";
+		reg = <0x28>;
+		interrupts = <11 IRQ_TYPE_EDGE_FALLING>;
+		interrupt-parent = <&gpioi>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&stusb1600_pins_a>;
+		status = "okay";
+		vdd-supply = <&vin>;
+
+		connector {
+			compatible = "usb-c-connector";
+			label = "USB-C";
+			power-role = "dual";
+			power-opmode = "default";
+
+			port {
+				con_usbotg_hs_ep: endpoint {
+					remote-endpoint = <&usbotg_hs_ep>;
+				};
+			};
+		};
+	};
+
 	pmic: stpmic@33 {
 		compatible = "st,stpmic1";
 		reg = <0x33>;
@@ -631,6 +663,12 @@
 	phy-names = "usb2-phy";
 	usb-role-switch;
 	status = "okay";
+
+	port {
+		usbotg_hs_ep: endpoint {
+			remote-endpoint = <&con_usbotg_hs_ep>;
+		};
+	};
 };
 
 &usbphyc {
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
