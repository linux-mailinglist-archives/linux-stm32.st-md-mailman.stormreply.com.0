Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 236CE5305D7
	for <lists+linux-stm32@lfdr.de>; Sun, 22 May 2022 22:24:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CF211C57183;
	Sun, 22 May 2022 20:24:22 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 07772C03FEA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 22 May 2022 20:24:21 +0000 (UTC)
Received: from tr.lan (ip-86-49-12-201.net.upcbroadband.cz [86.49.12.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 520DC83AD0;
 Sun, 22 May 2022 22:24:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1653251060;
 bh=131GYNoIyQYLieRThGtu0zCe5WQnWYOe2hdTsn3NHpo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iOIZgUs+EpiuB42vDjRJKEnSixFNeMHXWAtrdHNEd1fV+3kZJL/mxn6dJqKPPaoKO
 JX/9Q6F16aRyRxLbYJ4b3biElbOVGRHdODKOKyO1wRS362M6aktjFD+01X4jg+BWGL
 sresVWhCJxpRAOWM3d8e9WmqKEQ0WMzEWblFl/lSChtsQpk192nH8Bs8ilhDxnd5Fh
 u/3jccHTmCSuu40JMdcqzrp2d1iyXhXfhajUkgWdMfoPU6ssslsYu39QnSivWkF9j/
 ioTeimbUD9RTdJniWUDOhOlXYd5Zqq3jJIBI57LOhqlq+1ffOzIGWc04wn+GEf+qbo
 xi6lIUa1S7JZA==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Date: Sun, 22 May 2022 22:24:03 +0200
Message-Id: <20220522202404.116369-2-marex@denx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220522202404.116369-1-marex@denx.de>
References: <20220522202404.116369-1-marex@denx.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Cc: Marek Vasut <marex@denx.de>, linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Linux-stm32] [PATCH 2/3] ARM: dts: stm32: Add alternate pinmux for
	RCC pin
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

Add another mux option for RCC pin, this is used on AV96 board
for e.g. sensor clock supply.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com
To: linux-arm-kernel@lists.infradead.org
---
 arch/arm/boot/dts/stm32mp15-pinctrl.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
index a6b766fa9e8d5..9816331e4bb7d 100644
--- a/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stm32mp15-pinctrl.dtsi
@@ -960,6 +960,21 @@ pins {
 		};
 	};
 
+	mco1_pins_a: mco1-0 {
+		pins {
+			pinmux = <STM32_PINMUX('A', 13, AF2)>; /* MCO1 */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <1>;
+		};
+	};
+
+	mco1_sleep_pins_a: mco1-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('A', 13, ANALOG)>; /* MCO1 */
+		};
+	};
+
 	mco2_pins_a: mco2-0 {
 		pins {
 			pinmux = <STM32_PINMUX('G', 2, AF1)>; /* MCO2 */
-- 
2.35.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
