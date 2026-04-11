Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IKufF8FG2mkrzggAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sat, 11 Apr 2026 15:04:01 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 029753E00CE
	for <lists+linux-stm32@lfdr.de>; Sat, 11 Apr 2026 15:04:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7EAB0C8F270;
	Sat, 11 Apr 2026 13:04:00 +0000 (UTC)
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 476B6C8F26F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 11 Apr 2026 13:03:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5DB8C113964; Sat, 11 Apr 2026 15:03:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
 s=dkim; t=1775912638; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=Cn2rQUk1tKmpxYp0wGwPKfZn1n0sjn09eGZvl3z2nRk=;
 b=hFKe7xtVoN+yPUb1sjbwm6420K0wWoQerdZW6bPlyzdKvbFUUdqWUX4XzhXgScxa7adfzn
 TS9hbIhXaTjWRKMSije7YuzzFnFH96Vz8U3CGibeoRZgOUtWWPLB3gjjCsbsp94ckuqGKF
 ZF5Vp4Hc15UTSnqVAeXb2eqKE3dNslIdjdJMDUsdmO4SJhbMCKM20oPuZ3lRbnQniNpLnH
 z5R3IcY9CFvpSmZFC26sFMQ2R6hrEIzepIAh6EdKfmsDhWOSn7YVM+KQc3OXThnPsyR1mk
 xUMGFlrKGh2Wi/6c7llTMklrRC68G0cS201N+likmo2Ef4uNWSsLZgabegt5rQ==
From: Marek Vasut <marex@nabladev.com>
To: linux-arm-kernel@lists.infradead.org
Date: Sat, 11 Apr 2026 15:03:24 +0200
Message-ID: <20260411130355.19670-1-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Marek Vasut <marex@nabladev.com>, Conor Dooley <conor+dt@kernel.org>,
 Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, kernel@dh-electronics.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH] ARM: dts: stm32: Enable PHY SSC on DH
	STM32MP13xx DHCOR DHSBC board
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
X-Spamd-Result: default: False [6.29 / 15.00];
	DMARC_POLICY_REJECT(2.00)[nabladev.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[nabladev.com:s=dkim];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-arm-kernel@lists.infradead.org,m:cniedermaier@dh-electronics.com,m:marex@nabladev.com,m:conor+dt@kernel.org,m:robh@kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:kernel@dh-electronics.com,m:mcoquelin.stm32@gmail.com,m:krzk+dt@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[marex@nabladev.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FREEMAIL_CC(0.00)[dh-electronics.com,nabladev.com,kernel.org,vger.kernel.org,gmail.com,st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[nabladev.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[marex@nabladev.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.736];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.1:email,st.com:email,st-md-mailman.stormreply.com:rdns,dh-electronics.com:email,infradead.org:email,nabladev.com:email,nabladev.com:mid]
X-Rspamd-Queue-Id: 029753E00CE
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spam: Yes

Add realtek,rxc-ssc-enable and realtek,sysclk-ssc-enable to both PHY
DT nodes to enable PHY Spread Spectrum on RXC and SYSCLK, CLKOUT is
disabled and therefore does not need SSC enabled.

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: kernel@dh-electronics.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
---
 arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dts b/arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dts
index 9902849ed0406..70d85af467353 100644
--- a/arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dts
+++ b/arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dts
@@ -97,6 +97,8 @@ ethphy1: ethernet-phy@1 {
 			interrupts = <12 IRQ_TYPE_LEVEL_LOW>;
 			reg = <1>;
 			realtek,clkout-disable;
+			realtek,rxc-ssc-enable;
+			realtek,sysclk-ssc-enable;
 			reset-assert-us = <15000>;
 			reset-deassert-us = <55000>;
 			reset-gpios = <&gpioa 11 GPIO_ACTIVE_LOW>;
@@ -146,6 +148,8 @@ ethphy2: ethernet-phy@1 {
 			interrupts = <15 IRQ_TYPE_LEVEL_LOW>;
 			reg = <1>;
 			realtek,clkout-disable;
+			realtek,rxc-ssc-enable;
+			realtek,sysclk-ssc-enable;
 			reset-assert-us = <15000>;
 			reset-deassert-us = <55000>;
 			reset-gpios = <&gpiog 8 GPIO_ACTIVE_LOW>;
-- 
2.53.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
