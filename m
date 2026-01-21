Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aIR3FCyUcGlyYgAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Jan 2026 09:54:04 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C0D53EA4
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Jan 2026 09:54:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CBDC5C3F944;
	Wed, 21 Jan 2026 08:54:03 +0000 (UTC)
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A3C76C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Jan 2026 08:54:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4AEA010ED29; Wed, 21 Jan 2026 09:54:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
 s=dkim; t=1768985642; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=bUVTHSFyhpP3KoH2TYsrDt5SMZIodTsOSXs60GNNZeI=;
 b=OO/uCmha/RdjT+PvfzcKCVNGzrlnS3l/vmqC3xZ3ro7B/zGqyk7qn03skq2YOHj/KDl5xT
 fNBpQv4GeuSa7NsTttmlr86GqDGzwhYwyug0dJ1BWuJMsneEPLOB0pEtooXQSN2zj6/KT8
 xeTPYqp6Yd2VdjHPyA+VPJSGS1MjspAC87QMs5MOZ08vEqzawVAAivtF5CvHxAuGq+jgln
 c0kMKH2rdt2MtgGMlH8+77ZWzd3WyREwT0I5kBcXsbOM0gVTbyHzT3oa17qz3gDwUPoYPt
 Z+hTkxBnTig/qWwP0zm/f00ReBRPDly8L8kshGZsh1rTwyM5PUqAa00ywApAsQ==
From: Marek Vasut <marex@nabladev.com>
To: linux-arm-kernel@lists.infradead.org
Date: Wed, 21 Jan 2026 09:53:20 +0100
Message-ID: <20260121085347.10368-2-marex@nabladev.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260121085347.10368-1-marex@nabladev.com>
References: <20260121085347.10368-1-marex@nabladev.com>
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
Subject: [Linux-stm32] [PATCH 2/3] dt-bindings: display/lvds-codec: Document
	OnSemi FIN3385
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
X-Spamd-Result: default: False [5.99 / 15.00];
	DMARC_POLICY_REJECT(2.00)[nabladev.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[nabladev.com:s=dkim];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_CC(0.00)[dh-electronics.com,nabladev.com,kernel.org,linaro.org,st-md-mailman.stormreply.com,vger.kernel.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS(0.00)[m:linux-arm-kernel@lists.infradead.org,m:cniedermaier@dh-electronics.com,m:marex@nabladev.com,m:conor+dt@kernel.org,m:neil.armstrong@linaro.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:kernel@dh-electronics.com,m:mcoquelin.stm32@gmail.com,m:krzk+dt@kernel.org,m:rgallaispou@gmail.com,m:robh@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[marex@nabladev.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	GREYLIST(0.00)[pass,meta];
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
X-Rspamd-Queue-Id: 13C0D53EA4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add compatible string for OnSemi FIN3385, a FlatLink LVDS transmitter.

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
 Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
index 4f7d3e9cf0c22..4f52e35d02537 100644
--- a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
@@ -33,6 +33,7 @@ properties:
     oneOf:
       - items:
           - enum:
+              - onnn,fin3385  # OnSemi FIN3385
               - ti,ds90c185   # For the TI DS90C185 FPD-Link Serializer
               - ti,ds90c187   # For the TI DS90C187 FPD-Link Serializer
               - ti,sn75lvds83 # For the TI SN75LVDS83 FlatLink transmitter
-- 
2.51.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
