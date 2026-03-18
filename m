Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CNsbEL2DumnrXQIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Mar 2026 11:51:41 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4372BA390
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Mar 2026 11:51:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D6A87C87ED8;
	Wed, 18 Mar 2026 10:51:40 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 38148C87ECE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Mar 2026 10:51:39 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ore@pengutronix.de>)
 id 1w2oUn-0001WP-Ey; Wed, 18 Mar 2026 11:51:25 +0100
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac]
 helo=dude04)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <ore@pengutronix.de>) id 1w2oUn-000tSY-0X;
 Wed, 18 Mar 2026 11:51:25 +0100
Received: from ore by dude04 with local (Exim 4.98.2)
 (envelope-from <ore@pengutronix.de>) id 1w2oUn-00000003RJI-0IbV;
 Wed, 18 Mar 2026 11:51:25 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Wed, 18 Mar 2026 11:51:23 +0100
Message-ID: <20260318105123.819807-8-o.rempel@pengutronix.de>
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
Subject: [Linux-stm32] [PATCH v1 7/7] ARM: dts: stm32: stm32mp15x-mecio1-io:
	Move expander gpio-line-names to board files
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
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,foss.st.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[o.rempel@pengutronix.de,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:devicetree@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:o.rempel@pengutronix.de,m:kernel@pengutronix.de,m:david@protonic.nl,m:linux-stm32@st-md-mailman.stormreply.com,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	DMARC_NA(0.00)[pengutronix.de];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[o.rempel@pengutronix.de,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.884];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	DBL_PROHIBIT(0.00)[0.0.0.21:email,0.0.0.20:email];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stormreply.com:email,stormreply.com:url,stm-ict-prod-mailman-01.stormreply.prv:helo,protonic.nl:email,pengutronix.de:email,pengutronix.de:mid]
X-Rspamd-Queue-Id: 2B4372BA390
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: David Jander <david@protonic.nl>

Move the gpio-line-names properties for the I2C GPIO expanders (gpio0
and gpio1) out of the common mecio1-io.dtsi file and into the specific
board dts files.

The layout originally defined in the common include file belonged to the
mecio1r1 (Revision 1) hardware. This layout is moved 1:1 into the
stm32mp153c-mecio1r1.dts file.

The mecio1r0 (Revision 0) hardware utilizes a completely different
pinout for these expanders. A new, accurate mapping reflecting the
Revision 0 schematics is added to stm32mp151c-mecio1r0.dts.

Fixes: 8267753c891c ("ARM: dts: stm32: Add MECIO1 and MECT1S board variants")
Cc: stable@vger.kernel.org
Signed-off-by: David Jander <david@protonic.nl>
Co-developed-by: Oleksij Rempel <o.rempel@pengutronix.de>
Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
 arch/arm/boot/dts/st/stm32mp151c-mecio1r0.dts  | 14 ++++++++++++++
 arch/arm/boot/dts/st/stm32mp153c-mecio1r1.dts  | 14 ++++++++++++++
 arch/arm/boot/dts/st/stm32mp15x-mecio1-io.dtsi |  8 --------
 3 files changed, 28 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/st/stm32mp151c-mecio1r0.dts b/arch/arm/boot/dts/st/stm32mp151c-mecio1r0.dts
index 06ab77465816..862782d20d10 100644
--- a/arch/arm/boot/dts/st/stm32mp151c-mecio1r0.dts
+++ b/arch/arm/boot/dts/st/stm32mp151c-mecio1r0.dts
@@ -97,6 +97,20 @@ &ethernet0 {
 	st,eth-clk-sel;
 };
 
+&gpio0 {
+	gpio-line-names = "HSIN0_BIAS", "HSIN1_BIAS", "HSIN2_BIAS", "HSIN3_BIAS",
+			  "HSIN4_BIAS", "", "STP_VREF0_LVL", "HSIN_VREF0_LVL",
+			  "STP0_FB_BIAS", "STP1_FB_BIAS", "STP2_FB_BIAS", "STP3_FB_BIAS",
+			  "", "", "", "";
+};
+
+&gpio1 {
+	gpio-line-names = "HSIN5_BIAS", "HSIN6_BIAS", "HSIN7_BIAS", "HSIN8_BIAS",
+			  "HSIN9_BIAS", "", "STP_VREF1_LVL", "HSIN_VREF1_LVL",
+			  "STP4_FB_BIAS", "STP5_FB_BIAS", "STP6_FB_BIAS", "",
+			  "", "", "LSIN8_BIAS", "LSIN9_BIAS";
+};
+
 &gpiod {
 	gpio-line-names = "", "", "", "",
 			  "", "", "", "",
diff --git a/arch/arm/boot/dts/st/stm32mp153c-mecio1r1.dts b/arch/arm/boot/dts/st/stm32mp153c-mecio1r1.dts
index 2b3989303cd1..739cc18c3d3a 100644
--- a/arch/arm/boot/dts/st/stm32mp153c-mecio1r1.dts
+++ b/arch/arm/boot/dts/st/stm32mp153c-mecio1r1.dts
@@ -90,6 +90,20 @@ &clk_hse {
 	clock-frequency = <24000000>;
 };
 
+&gpio0 {
+	gpio-line-names = "HSIN0_BIAS", "HSIN1_BIAS", "HSIN2_BIAS", "HSIN3_BIAS",
+			  "", "", "HSIN_VREF0_LVL", "HSIN_VREF1_LVL",
+			  "HSIN4_BIAS", "HSIN5_BIAS", "HSIN6_BIAS", "HSIN7_BIAS",
+			  "", "", "", "";
+};
+
+&gpio1 {
+	gpio-line-names = "HSIN8_BIAS", "HSIN9_BIAS", "HSIN10_BIAS", "HSIN11_BIAS",
+			  "", "", "HSIN_VREF2_LVL", "HSIN_VREF3_LVL",
+			  "HSIN12_BIAS", "HSIN13_BIAS", "HSIN14_BIAS", "HSIN15_BIAS",
+			  "", "", "LSIN8_BIAS", "LSIN9_BIAS";
+};
+
 &gpioa {
 	gpio-line-names = "", "", "", "",
 			  "", "", "", "",
diff --git a/arch/arm/boot/dts/st/stm32mp15x-mecio1-io.dtsi b/arch/arm/boot/dts/st/stm32mp15x-mecio1-io.dtsi
index 1808289f8193..1a4f5a523eb3 100644
--- a/arch/arm/boot/dts/st/stm32mp15x-mecio1-io.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15x-mecio1-io.dtsi
@@ -184,10 +184,6 @@ gpio0: gpio@20 {
 		reg = <0x20>;
 		gpio-controller;
 		#gpio-cells = <2>;
-		gpio-line-names = "HSIN0_BIAS", "HSIN1_BIAS", "HSIN2_BIAS", "HSIN3_BIAS",
-				  "", "", "HSIN_VREF0_LVL", "HSIN_VREF1_LVL",
-				  "HSIN4_BIAS", "HSIN5_BIAS", "HSIN6_BIAS", "HSIN7_BIAS",
-				  "", "", "", "";
 	};
 
 	gpio1: gpio@21 {
@@ -195,10 +191,6 @@ gpio1: gpio@21 {
 		reg = <0x21>;
 		gpio-controller;
 		#gpio-cells = <2>;
-		gpio-line-names = "HSIN8_BIAS", "HSIN9_BIAS", "HSIN10_BIAS", "HSIN11_BIAS",
-				  "", "", "HSIN_VREF2_LVL", "HSIN_VREF3_LVL",
-				  "HSIN12_BIAS", "HSIN13_BIAS", "HSIN14_BIAS", "HSIN15_BIAS",
-				  "", "", "LSIN8_BIAS", "LSIN9_BIAS";
 	};
 };
 
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
