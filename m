Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A15DC3F8A5F
	for <lists+linux-stm32@lfdr.de>; Thu, 26 Aug 2021 16:46:06 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 446B6C57B7A;
	Thu, 26 Aug 2021 14:46:06 +0000 (UTC)
Received: from mx01.ayax.eu (mx01.ayax.eu [188.137.98.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8291AC424AF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Aug 2021 14:46:01 +0000 (UTC)
Received: from [192.168.192.146] (port=53042 helo=nx64de-df6d00)
 by mx01.ayax.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <gszymaszek@short.pl>)
 id 1mJGdV-0007Jl-4T; Thu, 26 Aug 2021 16:45:45 +0200
Date: Thu, 26 Aug 2021 16:45:43 +0200
From: Grzegorz Szymaszek <gszymaszek@short.pl>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Message-ID: <YSepFyt8o+5lAsrA@nx64de-df6d00>
Mail-Followup-To: Grzegorz Szymaszek <gszymaszek@short.pl>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ahmad Fatoum <a.fatoum@pengutronix.de>,
 Marcin Sloniewski <marcin.sloniewski@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
MIME-Version: 1.0
Content-Disposition: inline
Cc: devicetree@vger.kernel.org, Grzegorz Szymaszek <gszymaszek@short.pl>,
 linux-kernel@vger.kernel.org, Marcin Sloniewski <marcin.sloniewski@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] ARM: dts: stm32: set the DCMI pins on
	stm32mp157c-odyssey
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

The Seeed Odyssey-STM32MP157C board has a 20-pin DVP camera output. The
DCMI pins used on this output are defined in the pin state definition
&pinctrl/dcmi-1, AKA &dcmi_pins_b (added in mainline commit
02814a41529a55dbfb9fbb2a3728e78e70646ea6). Set these pins as the default
pinctrl of the DCMI peripheral in the board device tree.

The pins are not used for any other purpose, so it seems safe to assume
most users will not need to override (delete) what this patch provides.
status defaults to "disabled", so the peripheral will not be
unnecessarily started. And the users who actually intend to make use of
a camera on the DVP port will have this little part of the configuration
ready.

Signed-off-by: Grzegorz Szymaszek <gszymaszek@short.pl>
---
 arch/arm/boot/dts/stm32mp157c-odyssey.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/stm32mp157c-odyssey.dts b/arch/arm/boot/dts/stm32mp157c-odyssey.dts
index be1dd5e9e744..554f5d3bcdc3 100644
--- a/arch/arm/boot/dts/stm32mp157c-odyssey.dts
+++ b/arch/arm/boot/dts/stm32mp157c-odyssey.dts
@@ -22,6 +22,12 @@ chosen {
 	};
 };
 
+&dcmi {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&dcmi_pins_b>;
+	pinctrl-1 = <&dcmi_sleep_pins_b>;
+};
+
 &ethernet0 {
 	status = "okay";
 	pinctrl-0 = <&ethernet0_rgmii_pins_a>;
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
