Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qOEGM72DumnrXQIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Mar 2026 11:51:41 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 79DBE2BA39E
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Mar 2026 11:51:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 208A4C8F267;
	Wed, 18 Mar 2026 10:51:41 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EBD01C87ED2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Mar 2026 10:51:39 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ore@pengutronix.de>)
 id 1w2oUn-0001WK-F0; Wed, 18 Mar 2026 11:51:25 +0100
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac]
 helo=dude04)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <ore@pengutronix.de>) id 1w2oUn-000tSO-06;
 Wed, 18 Mar 2026 11:51:25 +0100
Received: from ore by dude04 with local (Exim 4.98.2)
 (envelope-from <ore@pengutronix.de>) id 1w2oUm-00000003RIS-41UW;
 Wed, 18 Mar 2026 11:51:24 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Wed, 18 Mar 2026 11:51:18 +0100
Message-ID: <20260318105123.819807-3-o.rempel@pengutronix.de>
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
Subject: [Linux-stm32] [PATCH v1 2/7] ARM: dts: stm32: stm32mp15x-mecio1-io:
	Fix ADC sampling times
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
X-Spamd-Result: default: False [2.99 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[pengutronix.de];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:devicetree@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:o.rempel@pengutronix.de,m:kernel@pengutronix.de,m:david@protonic.nl,m:linux-stm32@st-md-mailman.stormreply.com,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,foss.st.com];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[o.rempel@pengutronix.de,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[o.rempel@pengutronix.de,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.900];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 79DBE2BA39E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: David Jander <david@protonic.nl>

Increase the minimum ADC sample times for all configured channels on
ADC1 and ADC2 to ensure measurement accuracy meets specifications.

The default 5us sample time is insufficient for the internal sampling
capacitor to fully charge. Increase the default time to 20us to relax
the input impedance requirements.

Additionally, the phint0_ain and phint1_ain channels require a much
longer sampling period due to their specific circuit design. Increase
their sample times to 200us. Remove stale comments regarding clock
cycles that no longer match the updated timings.

Fixes: 8267753c891c ("ARM: dts: stm32: Add MECIO1 and MECT1S board variants")
Cc: <stable@vger.kernel.org>
Signed-off-by: David Jander <david@protonic.nl>
Co-developed-by: Oleksij Rempel <o.rempel@pengutronix.de>
Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
 .../arm/boot/dts/st/stm32mp15x-mecio1-io.dtsi | 32 +++++++++----------
 1 file changed, 15 insertions(+), 17 deletions(-)

diff --git a/arch/arm/boot/dts/st/stm32mp15x-mecio1-io.dtsi b/arch/arm/boot/dts/st/stm32mp15x-mecio1-io.dtsi
index 1ce01bac9814..1b1299770ca0 100644
--- a/arch/arm/boot/dts/st/stm32mp15x-mecio1-io.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15x-mecio1-io.dtsi
@@ -104,80 +104,79 @@ &adc1 {
 
 	channel@0 {
 		reg = <0>;
-		/* 16.5 ck_cycles sampling time */
-		st,min-sample-time-ns = <5000>;
+		st,min-sample-time-ns = <20000>;
 		label = "p24v_stp";
 	};
 
 	channel@1 {
 		reg = <1>;
-		st,min-sample-time-ns = <5000>;
+		st,min-sample-time-ns = <20000>;
 		label = "p24v_hpdcm";
 	};
 
 	channel@2 {
 		reg = <2>;
-		st,min-sample-time-ns = <5000>;
+		st,min-sample-time-ns = <20000>;
 		label = "ain0";
 	};
 
 	channel@3 {
 		reg = <3>;
-		st,min-sample-time-ns = <5000>;
+		st,min-sample-time-ns = <20000>;
 		label = "hpdcm1_i2";
 	};
 
 	channel@5 {
 		reg = <5>;
-		st,min-sample-time-ns = <5000>;
+		st,min-sample-time-ns = <20000>;
 		label = "hpout1_i";
 	};
 
 	channel@6 {
 		reg = <6>;
-		st,min-sample-time-ns = <5000>;
+		st,min-sample-time-ns = <20000>;
 		label = "ain1";
 	};
 
 	channel@9 {
 		reg = <9>;
-		st,min-sample-time-ns = <5000>;
+		st,min-sample-time-ns = <20000>;
 		label = "hpout0_i";
 	};
 
 	channel@10 {
 		reg = <10>;
-		st,min-sample-time-ns = <5000>;
+		st,min-sample-time-ns = <200000>;
 		label = "phint0_ain";
 	};
 
 	channel@13 {
 		reg = <13>;
-		st,min-sample-time-ns = <5000>;
+		st,min-sample-time-ns = <200000>;
 		label = "phint1_ain";
 	};
 
 	channel@15 {
 		reg = <15>;
-		st,min-sample-time-ns = <5000>;
+		st,min-sample-time-ns = <20000>;
 		label = "hpdcm0_i1";
 	};
 
 	channel@16 {
 		reg = <16>;
-		st,min-sample-time-ns = <5000>;
+		st,min-sample-time-ns = <20000>;
 		label = "lsin";
 	};
 
 	channel@18 {
 		reg = <18>;
-		st,min-sample-time-ns = <5000>;
+		st,min-sample-time-ns = <20000>;
 		label = "hpdcm0_i2";
 	};
 
 	channel@19 {
 		reg = <19>;
-		st,min-sample-time-ns = <5000>;
+		st,min-sample-time-ns = <20000>;
 		label = "hpdcm1_i1";
 	};
 };
@@ -187,14 +186,13 @@ &adc2 {
 
 	channel@2 {
 		reg = <2>;
-		/* 16.5 ck_cycles sampling time */
-		st,min-sample-time-ns = <5000>;
+		st,min-sample-time-ns = <20000>;
 		label = "ain2";
 	};
 
 	channel@6 {
 		reg = <6>;
-		st,min-sample-time-ns = <5000>;
+		st,min-sample-time-ns = <20000>;
 		label = "ain3";
 	};
 };
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
