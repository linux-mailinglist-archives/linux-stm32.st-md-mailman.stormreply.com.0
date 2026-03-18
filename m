Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2FSAEcGDumnrXQIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Mar 2026 11:51:45 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0232BA3BA
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Mar 2026 11:51:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 80346C8F26A;
	Wed, 18 Mar 2026 10:51:44 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2D00FC8F262
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Mar 2026 10:51:42 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ore@pengutronix.de>)
 id 1w2oUn-0001WN-F1; Wed, 18 Mar 2026 11:51:25 +0100
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac]
 helo=dude04)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <ore@pengutronix.de>) id 1w2oUn-000tSU-0P;
 Wed, 18 Mar 2026 11:51:25 +0100
Received: from ore by dude04 with local (Exim 4.98.2)
 (envelope-from <ore@pengutronix.de>) id 1w2oUn-00000003RIw-07Gb;
 Wed, 18 Mar 2026 11:51:25 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Wed, 18 Mar 2026 11:51:21 +0100
Message-ID: <20260318105123.819807-6-o.rempel@pengutronix.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260318105123.819807-1-o.rempel@pengutronix.de>
References: <20260318105123.819807-1-o.rempel@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Oleksij Rempel <o.rempel@pengutronix.de>, kernel@pengutronix.de,
 David Jander <david@protonic.nl>, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v1 5/7] ARM: dts: stm32: stm32mp15x-mecio1-io:
	Move gpio-line-names to board files
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
X-Spamd-Result: default: False [3.29 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DMARC_NA(0.00)[pengutronix.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,foss.st.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:devicetree@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:o.rempel@pengutronix.de,m:kernel@pengutronix.de,m:david@protonic.nl,m:linux-stm32@st-md-mailman.stormreply.com,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[o.rempel@pengutronix.de,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[o.rempel@pengutronix.de,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	NEURAL_HAM(-0.00)[-0.884];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stormreply.com:email,stormreply.com:url,stm-ict-prod-mailman-01.stormreply.prv:helo,protonic.nl:email,pengutronix.de:email,pengutronix.de:mid,0.0.0.8:email]
X-Rspamd-Queue-Id: DB0232BA3BA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: David Jander <david@protonic.nl>

Move the gpio-line-names properties out of the common mecio1-io.dtsi file
and into the specific board dts files.

The pinout originally defined in the common include file belonged to the
mecio1r0 (Revision 0) hardware. This is moved 1:1 into the
stm32mp151c-mecio1r0.dts file without any modifications.

A large number of GPIO pins are swapped on the mecio1r1 (Revision 1)
hardware, so a new, board-specific gpio-line-names mapping is added to
stm32mp153c-mecio1r1.dts to reflect those hardware changes.

Fixes: 8267753c891c ("ARM: dts: stm32: Add MECIO1 and MECT1S board variants")
Cc: <stable@vger.kernel.org>
Signed-off-by: David Jander <david@protonic.nl>
Co-developed-by: Oleksij Rempel <o.rempel@pengutronix.de>
Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
 arch/arm/boot/dts/st/stm32mp151c-mecio1r0.dts | 64 +++++++++++++++
 arch/arm/boot/dts/st/stm32mp153c-mecio1r1.dts | 80 +++++++++++++++++++
 .../arm/boot/dts/st/stm32mp15x-mecio1-io.dtsi | 63 ---------------
 3 files changed, 144 insertions(+), 63 deletions(-)

diff --git a/arch/arm/boot/dts/st/stm32mp151c-mecio1r0.dts b/arch/arm/boot/dts/st/stm32mp151c-mecio1r0.dts
index 4e795ad42928..06ab77465816 100644
--- a/arch/arm/boot/dts/st/stm32mp151c-mecio1r0.dts
+++ b/arch/arm/boot/dts/st/stm32mp151c-mecio1r0.dts
@@ -96,3 +96,67 @@ &ethernet0 {
 	assigned-clock-rates = <125000000>; /* Clock PLL3 to 625Mhz in tf-a. */
 	st,eth-clk-sel;
 };
+
+&gpiod {
+	gpio-line-names = "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "STP_RESETN", "STP_ENABLEN", "HPOUT0", "HPOUT0_ALERTN";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_hog_d_mecsbc>;
+};
+
+&gpioe {
+	gpio-line-names = "HPOUT0_RESETN", "HPOUT1", "HPOUT1_ALERTN", "",
+			  "", "", "HPOUT1_RESETN",
+			  "LPOUT0", "LPOUT0_ALERTN", "LPOUT0_RESETN",
+			  "LPOUT1", "LPOUT1_ALERTN", "LPOUT1_RESETN",
+			  "LPOUT2", "LPOUT2_ALERTN", "LPOUT2_RESETN";
+};
+
+&gpiof {
+	gpio-line-names = "LPOUT3", "LPOUT3_ALERTN", "LPOUT3_RESETN",
+			  "LPOUT4", "LPOUT4_ALERTN", "LPOUT4_RESETN",
+			  "", "",
+			  "", "", "", "",
+			  "", "", "", "";
+};
+
+&gpiog {
+	gpio-line-names = "LPOUT5", "LPOUT5_ALERTN", "", "LPOUT5_RESETN",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "";
+};
+
+&gpioh {
+	gpio-line-names = "", "", "", "",
+			  "", "", "", "",
+			  "GPIO0_RESETN", "", "", "",
+			  "", "", "", "";
+};
+
+&gpioi {
+	gpio-line-names = "", "", "", "",
+			  "", "", "", "",
+			  "HPDCM0_SLEEPN", "HPDCM1_SLEEPN", "GPIO1_RESETN", "",
+			  "", "", "", "";
+};
+
+&gpioj {
+	gpio-line-names = "HSIN10", "HSIN11", "HSIN12", "HSIN13",
+			  "HSIN14", "HSIN15", "", "",
+			  "", "", "", "",
+			  "", "RTD_RESETN", "", "";
+};
+
+&gpiok {
+	gpio-line-names = "", "", "HSIN0", "HSIN1",
+			  "HSIN2", "HSIN3", "HSIN4", "HSIN5";
+};
+
+&gpioz {
+	gpio-line-names = "", "", "", "HSIN6",
+			  "HSIN7", "HSIN8", "HSIN9", "";
+};
+
diff --git a/arch/arm/boot/dts/st/stm32mp153c-mecio1r1.dts b/arch/arm/boot/dts/st/stm32mp153c-mecio1r1.dts
index d32816093e47..2b3989303cd1 100644
--- a/arch/arm/boot/dts/st/stm32mp153c-mecio1r1.dts
+++ b/arch/arm/boot/dts/st/stm32mp153c-mecio1r1.dts
@@ -90,6 +90,86 @@ &clk_hse {
 	clock-frequency = <24000000>;
 };
 
+&gpioa {
+	gpio-line-names = "", "", "", "",
+			  "", "", "", "",
+			  "", "", "GPIO1_RESETN", "",
+			  "", "", "", "LPOUT5";
+};
+
+&gpiob {
+	gpio-line-names = "", "", "", "",
+			  "LPOUT4_RESETN", "", "", "",
+			  "", "LPOUT4_ALERTN", "", "",
+			  "", "", "", "";
+};
+
+&gpioc {
+	gpio-line-names = "", "", "", "",
+			  "", "", "", "",
+			  "", "LPOUT4", "", "",
+			  "", "", "", "";
+};
+
+&gpiod {
+	gpio-line-names = "LPOUT2", "", "LPOUT3_RESETN", "",
+			  "LPOUT2_ALERTN", "", "MECIO_ADDR0", "",
+			  "HPOUT1_ALERTN", "HPOUT1_RESETN", "", "",
+			  "", "", "HPOUT0", "HPOUT1";
+};
+
+&gpioe {
+	gpio-line-names = "LPOUT0_RESETN", "", "", "",
+			  "", "LPOUT3", "LPOUT5_ALERTN", "",
+			  "", "", "", "",
+			  "", "", "", "HSIN_RESETN";
+};
+
+&gpiof {
+	gpio-line-names = "LPOUT5_RESETN", "", "", "HPOUT0_ALERTN",
+			  "", "LPOUT1", "", "",
+			  "", "", "", "",
+			  "", "", "", "";
+};
+
+&gpiog {
+	gpio-line-names = "", "", "", "HPOUT0_RESETN",
+			  "", "", "LPOUT3_ALERTN", "",
+			  "", "", "GPIO0_RESETN", "",
+			  "", "", "", "LPOUT2_RESETN";
+};
+
+&gpioh {
+	gpio-line-names = "", "", "", "",
+			  "", "", "", "",
+			  "", "LPOUT0", "", "",
+			  "", "LPOUT0_ALERTN", "STP_ENABLEN", "STP_RESETN";
+};
+
+&gpioi {
+	gpio-line-names = "", "", "", "",
+			  "", "", "", "",
+			  "", "", "SPE_RESETN", "",
+			  "HPDCM0_SLEEPN", "", "", "";
+};
+
+&gpioj {
+	gpio-line-names = "", "", "", "",
+			  "", "", "", "MECIO_ADDR1",
+			  "", "", "", "",
+			  "", "", "", "LPOUT1_RESETN";
+};
+
+&gpiok {
+	gpio-line-names = "", "", "RTD_RESETN", "",
+			  "", "LPOUT1_ALERTN", "", "";
+};
+
+&gpioz {
+	gpio-line-names = "", "", "", "",
+			  "HPDCM1_SLEEPN", "", "", "";
+};
+
 &m_can1 {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&m_can1_pins_b>;
diff --git a/arch/arm/boot/dts/st/stm32mp15x-mecio1-io.dtsi b/arch/arm/boot/dts/st/stm32mp15x-mecio1-io.dtsi
index e50e9ae085e8..69a502ec36d4 100644
--- a/arch/arm/boot/dts/st/stm32mp15x-mecio1-io.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15x-mecio1-io.dtsi
@@ -173,69 +173,6 @@ phy0: ethernet-phy@8 {
 	};
 };
 
-&gpiod {
-	gpio-line-names = "", "", "", "",
-			  "", "", "", "",
-			  "", "", "", "",
-			  "STP_RESETN", "STP_ENABLEN", "HPOUT0", "HPOUT0_ALERTN";
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_hog_d_mecsbc>;
-};
-
-&gpioe {
-	gpio-line-names = "HPOUT0_RESETN", "HPOUT1", "HPOUT1_ALERTN", "",
-			  "", "", "HPOUT1_RESETN",
-			  "LPOUT0", "LPOUT0_ALERTN", "LPOUT0_RESETN",
-			  "LPOUT1", "LPOUT1_ALERTN", "LPOUT1_RESETN",
-			  "LPOUT2", "LPOUT2_ALERTN", "LPOUT2_RESETN";
-};
-
-&gpiof {
-	gpio-line-names = "LPOUT3", "LPOUT3_ALERTN", "LPOUT3_RESETN",
-			  "LPOUT4", "LPOUT4_ALERTN", "LPOUT4_RESETN",
-			  "", "",
-			  "", "", "", "",
-			  "", "", "", "";
-};
-
-&gpiog {
-	gpio-line-names = "LPOUT5", "LPOUT5_ALERTN", "", "LPOUT5_RESETN",
-			  "", "", "", "",
-			  "", "", "", "",
-			  "", "", "", "";
-};
-
-&gpioh {
-	gpio-line-names = "", "", "", "",
-			  "", "", "", "",
-			  "GPIO0_RESETN", "", "", "",
-			  "", "", "", "";
-};
-
-&gpioi {
-	gpio-line-names = "", "", "", "",
-			  "", "", "", "",
-			  "HPDCM0_SLEEPN", "HPDCM1_SLEEPN", "GPIO1_RESETN", "",
-			  "", "", "", "";
-};
-
-&gpioj {
-	gpio-line-names = "HSIN10", "HSIN11", "HSIN12", "HSIN13",
-			  "HSIN14", "HSIN15", "", "",
-			  "", "", "", "",
-			  "", "RTD_RESETN", "", "";
-};
-
-&gpiok {
-	gpio-line-names = "", "", "HSIN0", "HSIN1",
-			  "HSIN2", "HSIN3", "HSIN4", "HSIN5";
-};
-
-&gpioz {
-	gpio-line-names = "", "", "", "HSIN6",
-			  "HSIN7", "HSIN8", "HSIN9", "";
-};
-
 &i2c2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c2_pins_a>;
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
