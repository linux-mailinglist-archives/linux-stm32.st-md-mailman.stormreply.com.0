Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0CGJII1G2mkrzggAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sat, 11 Apr 2026 15:03:09 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 16ABF3E00A2
	for <lists+linux-stm32@lfdr.de>; Sat, 11 Apr 2026 15:03:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 66A44C8F270;
	Sat, 11 Apr 2026 13:03:08 +0000 (UTC)
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A7408C8F26F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 11 Apr 2026 13:03:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C073011371B; Sat, 11 Apr 2026 15:03:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
 s=dkim; t=1775912586; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=tY+MWIgerZDZMC5nEmhhWGHXS7tYtHnjGnyCGjmdwdA=;
 b=Tv/MiZoz2mDF6OhoVBBgkhaOmCNXJLfj4Me2rHdSLas+bEnY9T0hBDofBHW43DKF6glu+0
 Ihb3tdMKB2Wsr2Sd4jj0mlnsSy4ME5teogtgdL3pNR0uqsp1usSD6dnZPjOsRjfpPhceGC
 0z7PkANosekLZ6D+8ApI0Vj1/djYbhwSJtfORIQSMvJGSQp/OEpGwNDNxyIRs1c2LKf1H+
 0JWJsZHq9ABlW4LeIHNx/hv5wwmYFwZZkaNHSrPJlf2swiYb/t8/DLsFejI2I6RLI6dSZd
 dSI1toTwf9P2W7OwZxD0Rsw3cJAnUi4KQu/CGpBV2w0/vD2qpXMrbt8c2sc/+A==
From: Marek Vasut <marex@nabladev.com>
To: linux-arm-kernel@lists.infradead.org
Date: Sat, 11 Apr 2026 15:02:35 +0200
Message-ID: <20260411130300.19603-1-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Cc: Marek Vasut <marex@nabladev.com>, Conor Dooley <conor+dt@kernel.org>,
 Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH] arm64: dts: st: Fix SAI addresses on
	stm32mp251
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS(0.00)[m:linux-arm-kernel@lists.infradead.org,m:marex@nabladev.com,m:conor+dt@kernel.org,m:robh@kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:mcoquelin.stm32@gmail.com,m:krzk+dt@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[marex@nabladev.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	GREYLIST(0.00)[pass,meta];
	DKIM_TRACE(0.00)[nabladev.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.770];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marex@nabladev.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[nabladev.com,kernel.org,vger.kernel.org,gmail.com,st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 16ABF3E00A2
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spam: Yes

The second field of SAI register addresses should be within 0x3f0 bytes
from the start of the SAI register addresses, the second field describes
the ID registers which are at that addrses. Currently, the second field
does not match RM, fix it.

Fixes: bf26d75a95f1 ("arm64: dts: st: add sai support on stm32mp251")
Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Olivier Moysan <olivier.moysan@foss.st.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
---
 arch/arm64/boot/dts/st/stm32mp251.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index 673fbc5632e69..9c63fdb5a885a 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -1202,7 +1202,7 @@ spi5: spi@40280000 {
 
 			sai1: sai@40290000 {
 				compatible = "st,stm32mp25-sai";
-				reg = <0x40290000 0x4>, <0x4029a3f0 0x10>;
+				reg = <0x40290000 0x4>, <0x402903f0 0x10>;
 				ranges = <0 0x40290000 0x400>;
 				#address-cells = <1>;
 				#size-cells = <1>;
@@ -1236,7 +1236,7 @@ sai1b: audio-controller@40290024 {
 
 			sai2: sai@402a0000 {
 				compatible = "st,stm32mp25-sai";
-				reg = <0x402a0000 0x4>, <0x402aa3f0 0x10>;
+				reg = <0x402a0000 0x4>, <0x402a03f0 0x10>;
 				ranges = <0 0x402a0000 0x400>;
 				#address-cells = <1>;
 				#size-cells = <1>;
@@ -1270,7 +1270,7 @@ sai2b: audio-controller@402a0024 {
 
 			sai3: sai@402b0000 {
 				compatible = "st,stm32mp25-sai";
-				reg = <0x402b0000 0x4>, <0x402ba3f0 0x10>;
+				reg = <0x402b0000 0x4>, <0x402b03f0 0x10>;
 				ranges = <0 0x402b0000 0x400>;
 				#address-cells = <1>;
 				#size-cells = <1>;
@@ -1362,7 +1362,7 @@ usart1: serial@40330000 {
 
 			sai4: sai@40340000 {
 				compatible = "st,stm32mp25-sai";
-				reg = <0x40340000 0x4>, <0x4034a3f0 0x10>;
+				reg = <0x40340000 0x4>, <0x403403f0 0x10>;
 				ranges = <0 0x40340000 0x400>;
 				#address-cells = <1>;
 				#size-cells = <1>;
-- 
2.53.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
