Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 028605483BC
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Jun 2022 11:54:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AB7A4C60495;
	Mon, 13 Jun 2022 09:54:03 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7BD24C035BC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jun 2022 09:54:02 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.net.upcbroadband.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 05269843F9;
 Mon, 13 Jun 2022 11:54:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1655114042;
 bh=RiLlYAPrC9mrSJlhPBOJqaqG0ryfcEGR0kTg/KnrxIU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=G3XOhcb8WrCtcqotk2+B5vanVXKKPvWngFejEhYRoGyZkB6t2DL1QAkvdcnF/ynHm
 0LdxS5yGBRKPV+Fdy04i7+mKE0FeBk4DrQDX016V1Lip9tsQRMOxaFxfFd+5i/Qnp4
 Fjdc4Rw+um5mR4CWU/T5vkeWPebqJYdJICdlPkoz2To+1oEG/JvfcZh7cbWiY/HIjz
 XVyT+p57WFxgXMi4TzaWi6wjWAzwAqBjTQua+PNTAhOQKGdy6q0P2nGfdFV1Ge8Rk7
 orTol0YQLtnQD6LNuxWtSsdCmeTHqcpEgzgmJmGAtwmyqarA57lQvyf8RiMjZpWhDd
 iqJCcm2hurP0g==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Date: Mon, 13 Jun 2022 11:53:24 +0200
Message-Id: <20220613095328.5661-3-marex@denx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220613095328.5661-1-marex@denx.de>
References: <20220613095328.5661-1-marex@denx.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH 3/7] ARM: dts: stm32: Add alternate pinmux for
	CAN1 pins
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

Add another mux option for CAN1 pins, this is used on DRC Compact board.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com
To: linux-arm-kernel@lists.infradead.org
---
 arch/arm/boot/dts/stm32mp15-pinctrl.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
index feedd84b247ed..6d84fa963e793 100644
--- a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
@@ -1030,6 +1030,26 @@ pins {
 		};
 	};
 
+	m_can1_pins_c: m-can1-2 {
+		pins1 {
+			pinmux = <STM32_PINMUX('H', 13, AF9)>; /* CAN1_TX */
+			slew-rate = <1>;
+			drive-push-pull;
+			bias-disable;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('H', 14, AF9)>; /* CAN1_RX */
+			bias-disable;
+		};
+	};
+
+	m_can1_sleep_pins_c: m_can1-sleep-2 {
+		pins {
+			pinmux = <STM32_PINMUX('H', 13, ANALOG)>, /* CAN1_TX */
+				 <STM32_PINMUX('H', 14, ANALOG)>; /* CAN1_RX */
+		};
+	};
+
 	m_can2_pins_a: m-can2-0 {
 		pins1 {
 			pinmux = <STM32_PINMUX('B', 13, AF9)>; /* CAN2_TX */
-- 
2.35.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
