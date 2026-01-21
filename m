Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eHjtISuUcGlyYgAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Jan 2026 09:54:03 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F77853E9D
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Jan 2026 09:54:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B6DD8C349C4;
	Wed, 21 Jan 2026 08:54:02 +0000 (UTC)
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2E68BC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Jan 2026 08:54:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8227210DEDB; Wed, 21 Jan 2026 09:53:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
 s=dkim; t=1768985640; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=r18FX95Gy1+St6A2bMtsgn3QcT2950JmTo6var6SRro=;
 b=NRwYxfegIgmMjNoGAqpQ3d7lv2FlY2RYnm04ddvp79w/R5pxKSNTWnA7nuJeMcIWuUJcqz
 IABC4/0PubVKshMgwJeCJQAAQyURYr6nur+0LGZ9CzMO1DF8TVjbzf+X3Cmm4g7SX4WOZG
 A0WpnLLbyBK3pypCuDWSglBxmdTetNoc2lxhaGunC1oh3HXg2wIJ36yBgNESbtNiiaGiHM
 qGmnVFMlosCpNcl3sQ3vlDdilqPTs4uLckD2N3fDHUbp9kbvPPWtDeh3M1JdPyn1bLqgE/
 ITl2jpf2MAREAMtBNo9H0XY5KWZPjpO5x14IJgYVEIOeguk/VrQCO3YYQfW1qg==
From: Marek Vasut <marex@nabladev.com>
To: linux-arm-kernel@lists.infradead.org
Date: Wed, 21 Jan 2026 09:53:19 +0100
Message-ID: <20260121085347.10368-1-marex@nabladev.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Marek Vasut <marex@nabladev.com>, Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, kernel@dh-electronics.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Raphael Gallais-Pou <rgallaispou@gmail.com>, Rob Herring <robh@kernel.org>
Subject: [Linux-stm32] [PATCH 1/3] dt-bindings: eeprom: at25: Document
	Microchip 25AA010A
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
	R_DKIM_REJECT(1.00)[nabladev.com:s=dkim];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS(0.00)[m:linux-arm-kernel@lists.infradead.org,m:cniedermaier@dh-electronics.com,m:marex@nabladev.com,m:conor+dt@kernel.org,m:neil.armstrong@linaro.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:kernel@dh-electronics.com,m:mcoquelin.stm32@gmail.com,m:krzk+dt@kernel.org,m:rgallaispou@gmail.com,m:robh@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[marex@nabladev.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[dh-electronics.com,nabladev.com,kernel.org,linaro.org,st-md-mailman.stormreply.com,vger.kernel.org,gmail.com];
	DKIM_TRACE(0.00)[nabladev.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marex@nabladev.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 1F77853E9D
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spam: Yes

The Microchip 25AA010A is a 1 Kbit SPI EEPROM with 16 Byte page.
Product page is at https://www.microchip.com/en-us/product/25AA010A

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Amelie Delaunay <amelie.delaunay@foss.st.com>
Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Raphael Gallais-Pou <rgallaispou@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: kernel@dh-electronics.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
---
 Documentation/devicetree/bindings/eeprom/at25.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/eeprom/at25.yaml b/Documentation/devicetree/bindings/eeprom/at25.yaml
index e1599ce109165..bb78e12b8823b 100644
--- a/Documentation/devicetree/bindings/eeprom/at25.yaml
+++ b/Documentation/devicetree/bindings/eeprom/at25.yaml
@@ -31,6 +31,7 @@ properties:
               - fujitsu,mb85rs1mt
               - fujitsu,mb85rs256
               - fujitsu,mb85rs64
+              - microchip,25aa010a
               - microchip,at25160bn
               - microchip,25lc040
               - st,m95m02
-- 
2.51.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
