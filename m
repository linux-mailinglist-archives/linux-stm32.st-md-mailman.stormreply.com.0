Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9F71872A
	for <lists+linux-stm32@lfdr.de>; Thu,  9 May 2019 10:59:18 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 84085C555A9
	for <lists+linux-stm32@lfdr.de>; Thu,  9 May 2019 08:59:18 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EE0E4C555A7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 May 2019 08:59:16 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x498wb9b026179; Thu, 9 May 2019 10:59:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=jUKe/OmUiifvXJm9ZqC3Jzcpam9I5s409PVofKAxVvo=;
 b=uS+4+egm2/URXvnS4pBeE0YhIFZrHvYRPzKxYQoJKVAUQ874ndYtF0vj/MmzZwEbsgI0
 S5ya5IxAuRveI1M59k6eiPNsy2rZC+atz3SfHZh8aPvVW06XT29OJA1SVPQ0STECGusz
 kLDCBSrjQkkYX8JTxRLImtbdDdyKUSL9EPCB5vOIoNsczmqnwybIQbVvtZLojlRMBIT1
 Bqn11dfeISBOQcDt1AGvs/+DxqAYyo4K+DXo94RN/lZZXF78q4IerFy6A5xgCp2myyRi
 IsxhjCHOL4pVtUw7i+1T3zx39Al9c9zUurHNfpcgxSf8o69o25BByQx+FCpg19dnvudz ig== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2sc9s4a9kr-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Thu, 09 May 2019 10:59:09 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2392F3F;
 Thu,  9 May 2019 08:59:08 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CF974153C;
 Thu,  9 May 2019 08:59:07 +0000 (GMT)
Received: from SAFEX1HUBCAS24.st.com (10.75.90.95) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Thu, 9 May 2019
 10:59:07 +0200
Received: from localhost (10.201.20.5) by webmail-ga.st.com (10.75.90.48) with
 Microsoft SMTP Server (TLS) id 14.3.439.0;
 Thu, 9 May 2019 10:59:07 +0200
From: Amelie Delaunay <amelie.delaunay@st.com>
To: Lee Jones <lee.jones@linaro.org>, Linus Walleij <linus.walleij@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>
Date: Thu, 9 May 2019 10:58:50 +0200
Message-ID: <1557392336-28239-4-git-send-email-amelie.delaunay@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1557392336-28239-1-git-send-email-amelie.delaunay@st.com>
References: <1557392336-28239-1-git-send-email-amelie.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.20.5]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-09_02:, , signatures=0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v6 3/9] dt-bindings: pinctrl: document the
	STMFX pinctrl bindings
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

This patch adds documentation of device tree bindings for the
STMicroelectronics Multi-Function eXpander (STMFX) GPIO expander.

Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/pinctrl/pinctrl-stmfx.txt  | 116 +++++++++++++++++++++
 1 file changed, 116 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-stmfx.txt

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-stmfx.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-stmfx.txt
new file mode 100644
index 0000000..c1b4c18
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-stmfx.txt
@@ -0,0 +1,116 @@
+STMicroelectronics Multi-Function eXpander (STMFX) GPIO expander bindings
+
+ST Multi-Function eXpander (STMFX) offers up to 24 GPIOs expansion.
+Please refer to ../mfd/stmfx.txt for STMFX Core bindings.
+
+Required properties:
+- compatible: should be "st,stmfx-0300-pinctrl".
+- #gpio-cells: should be <2>, the first cell is the GPIO number and the second
+  cell is the gpio flags in accordance with <dt-bindings/gpio/gpio.h>.
+- gpio-controller: marks the device as a GPIO controller.
+- #interrupt-cells: should be <2>, the first cell is the GPIO number and the
+  second cell is the interrupt flags in accordance with
+  <dt-bindings/interrupt-controller/irq.h>.
+- interrupt-controller: marks the device as an interrupt controller.
+- gpio-ranges: specifies the mapping between gpio controller and pin
+  controller pins. Check "Concerning gpio-ranges property" below.
+Please refer to ../gpio/gpio.txt.
+
+Please refer to pinctrl-bindings.txt for pin configuration.
+
+Required properties for pin configuration sub-nodes:
+- pins: list of pins to which the configuration applies.
+
+Optional properties for pin configuration sub-nodes (pinconf-generic ones):
+- bias-disable: disable any bias on the pin.
+- bias-pull-up: the pin will be pulled up.
+- bias-pull-pin-default: use the pin-default pull state.
+- bias-pull-down: the pin will be pulled down.
+- drive-open-drain: the pin will be driven with open drain.
+- drive-push-pull: the pin will be driven actively high and low.
+- output-high: the pin will be configured as an output driving high level.
+- output-low: the pin will be configured as an output driving low level.
+
+Note that STMFX pins[15:0] are called "gpio[15:0]", and STMFX pins[23:16] are
+called "agpio[7:0]". Example, to refer to pin 18 of STMFX, use "agpio2".
+
+Concerning gpio-ranges property:
+- if all STMFX pins[24:0] are available (no other STMFX function in use), you
+  should use gpio-ranges = <&stmfx_pinctrl 0 0 24>;
+- if agpio[3:0] are not available (STMFX Touchscreen function in use), you
+  should use gpio-ranges = <&stmfx_pinctrl 0 0 16>, <&stmfx_pinctrl 20 20 4>;
+- if agpio[7:4] are not available (STMFX IDD function in use), you
+  should use gpio-ranges = <&stmfx_pinctrl 0 0 20>;
+
+
+Example:
+
+	stmfx: stmfx@42 {
+		...
+
+		stmfx_pinctrl: stmfx-pin-controller {
+			compatible = "st,stmfx-0300-pinctrl";
+			#gpio-cells = <2>;
+			#interrupt-cells = <2>;
+			gpio-controller;
+			interrupt-controller;
+			gpio-ranges = <&stmfx_pinctrl 0 0 24>;
+
+			joystick_pins: joystick {
+				pins = "gpio0", "gpio1", "gpio2", "gpio3", "gpio4";
+				drive-push-pull;
+				bias-pull-up;
+			};
+		};
+	};
+
+Example of STMFX GPIO consumers:
+
+	joystick {
+		compatible = "gpio-keys";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		pinctrl-0 = <&joystick_pins>;
+		pinctrl-names = "default";
+		button-0 {
+			label = "JoySel";
+			linux,code = <KEY_ENTER>;
+			interrupt-parent = <&stmfx_pinctrl>;
+			interrupts = <0 IRQ_TYPE_EDGE_RISING>;
+		};
+		button-1 {
+			label = "JoyDown";
+			linux,code = <KEY_DOWN>;
+			interrupt-parent = <&stmfx_pinctrl>;
+			interrupts = <1 IRQ_TYPE_EDGE_RISING>;
+		};
+		button-2 {
+			label = "JoyLeft";
+			linux,code = <KEY_LEFT>;
+			interrupt-parent = <&stmfx_pinctrl>;
+			interrupts = <2 IRQ_TYPE_EDGE_RISING>;
+		};
+		button-3 {
+			label = "JoyRight";
+			linux,code = <KEY_RIGHT>;
+			interrupt-parent = <&stmfx_pinctrl>;
+			interrupts = <3 IRQ_TYPE_EDGE_RISING>;
+		};
+		button-4 {
+			label = "JoyUp";
+			linux,code = <KEY_UP>;
+			interrupt-parent = <&stmfx_pinctrl>;
+			interrupts = <4 IRQ_TYPE_EDGE_RISING>;
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+		orange {
+			gpios = <&stmfx_pinctrl 17 1>;
+		};
+
+		blue {
+			gpios = <&stmfx_pinctrl 19 1>;
+		};
+	}
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
