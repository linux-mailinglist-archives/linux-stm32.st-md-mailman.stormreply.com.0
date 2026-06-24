Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9e5jDNfNPGr4sQgAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Jun 2026 08:42:31 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C16F16C317F
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Jun 2026 08:42:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=rC5mJeHV;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=gmail.com (policy=none)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6F23EC5F1F7;
	Thu, 25 Jun 2026 06:42:30 +0000 (UTC)
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 48F8EC87ED0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Jun 2026 08:46:45 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id
 98e67ed59e1d1-37d55e8d3e3so460796a91.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Jun 2026 01:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782290804; x=1782895604;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=80huAu9bkh6KHgzBZGFLSxb8JVOVhcXYtQUMYEe1cbA=;
 b=rC5mJeHVb1mojMPmWF/YecEvcaUD8NTnQZppSR4ewaXFSKw8usWZPO1uNwqTwIuOk2
 f4NZbshH+bM4jBCw1r8oeYe6xtVgySnp43xn/2cbWiJehJv+dyJVVU5CVoiHQSqN+LLl
 KA0Js9TiwVSlLKzyuYKZGhByB2dpw4Z0AcIARKNf59ZUo9TvbJMNFDBlLWgK5SJOplUj
 ShpHYNs4rRFLPzI7LYCyi0BGWLiZh7lIaUoE3/wVArH9XGb2kZ52840mGAZzQ1c9oY5W
 bPoAWtuusaaLhp6B2Nl8MSXPMxpc43y9qhM5wAkmlU0TTC4qdEnuWFmsa9eYh/d0zY9X
 zlag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782290804; x=1782895604;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=80huAu9bkh6KHgzBZGFLSxb8JVOVhcXYtQUMYEe1cbA=;
 b=pfP/yPb7aoSqR7Tu78Cwt2nACtGojlB4aeYLyXwo35rrhATf/GJJGINHt61Wtmm2LE
 zBuUEmxvuZhvZZ+tYnM1q19fVpMktMBirXIjRNDn+Zrkon3EQ6apCFlS3B3s788Kj2VL
 2z9hvP/iE9LxbDidFvvhvf4o9M5MFO9kIX9ndYXCYQUwXzdQ+g8wf1HPqLZmyEfde4q5
 eWyARByUHc/PTO/VEcr+Wd3tYdpxwjRn8o1bthTuxkLcY3eatozhHGMTZ6mC0tfESG8n
 OYjlmrkkK+ugS1Hy6Haq79o2VPNsrIXDxdrAVYgkRiZLljVcNOIL3bHNAAeodIc2zCxb
 tMgQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RqKgzAXNP51zpKDFGb4If6XasEpq2c5Qq7X8TgQE8IcFz6MnFZpkxsdtsMYyM4qQfbjkPYdjV6QQg9jpQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxXSzj3KVs9voCpTSa/EMaUD95QPp7OUMfHPH+vta5xuHc9z4FD
 wALR2XWGC+P33hyE0WzZ2yU063xufkdfrNnM3VsfOUp0oSJXzGYFK0L/
X-Gm-Gg: AfdE7cn488E7V3rifoJHK9Ey70CVPp9HnFxGcU0TbBaFVOEyBkBVBJZPoFkA9oJQGW3
 GJMKKwDWCE+Ngf81v1CGPmnf9+dIFlBDKHFWH1sz6i7AaxElBP3xAGdmmBUAhONmBC9LngcurPZ
 zp8+twdRauHwJ2cDZrpFj8HCzTAusw3hyNAV5W0+GP90I46DmStyAiIPuQWlINU8P8ntXNtvQnk
 gZP53hv9nfTJUAqOaaYeJdKm1VCvRLQlyT0ZvejPBU0Dq4u6gNHnIdr8geaOo7w80fkfY41gHPV
 MNxjadQ7CVF0j0TBEWRLLU6SHKJ8G/qjY0caprNCPXhmioNpU5PXSeaLVDUA2rnNeIvYxnFsRfA
 gOvhIsFI9CwYVQbMA4+6xmJ93pL0JeUjpWtTPmMVcBn0uIoJ2J+XN4BayHnUXSEj/sQNJ7c4Nni
 x0pEDn46t6d9m7xocto2hvtBQv2cTUDuE1efw=
X-Received: by 2002:a17:90b:3d8f:b0:37d:9874:935f with SMTP id
 98e67ed59e1d1-37dcd701ea1mr6306406a91.11.1782290803441; 
 Wed, 24 Jun 2026 01:46:43 -0700 (PDT)
Received: from [192.168.1.101] ([218.194.36.79])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-37de3d152f4sm2138146a91.14.2026.06.24.01.46.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2026 01:46:42 -0700 (PDT)
From: Yanan He <grumpycat921013@gmail.com>
Date: Wed, 24 Jun 2026 16:44:38 +0800
MIME-Version: 1.0
Message-Id: <20260624-rv1126-alientek-dlrv1126-v1-1-5aef608a3f64@gmail.com>
References: <20260624-rv1126-alientek-dlrv1126-v1-0-5aef608a3f64@gmail.com>
In-Reply-To: <20260624-rv1126-alientek-dlrv1126-v1-0-5aef608a3f64@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 David Wu <david.wu@rock-chips.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782290789; l=883;
 i=grumpycat921013@gmail.com; s=20260618; h=from:subject:message-id;
 bh=Jsh+4vP/f+Y7qzRXW4NmYmHJSetmziSvku7ESza+DQU=;
 b=Z9Lt///3m84yBAmd5Rx6elPweLgGZVP5itDksYZtTAsSRkl/mztlr90ckF6yRI06aMkezej95
 wSJvTw1mqiAB++WxygtHTIGc9+5JEekbHz0QDhcyHEO0zxJqsmdeR9j
X-Developer-Key: i=grumpycat921013@gmail.com; a=ed25519;
 pk=oWrY8KwXIunZWlYBV76NG2A3V4p1bJ+aD45Mr56ErTw=
X-Mailman-Approved-At: Thu, 25 Jun 2026 06:42:29 +0000
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Yanan He <grumpycat921013@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/7] dt-bindings: vendor-prefixes: add alientek
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:heiko@sntech.de,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:david.wu@rock-chips.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:devicetree@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:grumpycat921013@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,sntech.de,lunn.ch,davemloft.net,google.com,redhat.com,rock-chips.com,gmail.com,foss.st.com];
	FORGED_SENDER(0.00)[grumpycat921013@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[grumpycat921013@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,gmail.com,st-md-mailman.stormreply.com];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt,netdev];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C16F16C317F

Add a vendor prefix for Alientek, a board and module vendor used by the
ATK-DLRV1126 board.

Link: https://en.alientek.com
Signed-off-by: Yanan He <grumpycat921013@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 28784d66ae7b..a23508a61373 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -88,6 +88,8 @@ patternProperties:
     description: ALFA Network Inc.
   "^algoltek,.*":
     description: AlgolTek, Inc.
+  "^alientek,.*":
+    description: Guangzhou Xingyi Intelligent Technology Co., Ltd.
   "^allegro,.*":
     description: Allegro DVT
   "^allegromicro,.*":

-- 
2.54.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
