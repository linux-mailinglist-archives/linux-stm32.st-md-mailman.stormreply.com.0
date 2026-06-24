Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ILAYEtfNPGr7sQgAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Jun 2026 08:42:31 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 074646C3181
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Jun 2026 08:42:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=FqJxdpIm;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=gmail.com (policy=none)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A2130C8F263;
	Thu, 25 Jun 2026 06:42:30 +0000 (UTC)
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5F7A2C87ED0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Jun 2026 08:46:59 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id
 98e67ed59e1d1-37d7c265ca5so660113a91.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Jun 2026 01:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782290818; x=1782895618;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=skj2iu380j1PKL/xdlE3SsAEeiyHxzabmaPPRXEHU2s=;
 b=FqJxdpImFeChotXPZIMI5dYvjkWrEVxbOioKsVQ8KJ4XJaqxlyK9D77lu9VnxwRAVf
 LCIDx/RjdJeqDBlsI9bsnejE+9QMFOsGe6rTYYp7la9PubREgnxeP2mERboZIh+VC2+t
 3LR5TGqI3o4ElA2d0uYX5XkDXPLDWoMW9eOxcZ9mVPIP/D0PiCAmj2T9gRBohgtOJIR4
 j3bmacc7ZzARF/+BDEkNPdfeya5XnsFmAxpb529pSH9mk3g3msMPDJmDGuXK5VCN9jqI
 M9tsXGFrc/6wIK/ZO8rENK5vYSu7rh95yMMsS3OvjbStAbBf/fEw6JZnkf9mQclFbb2H
 VdEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782290818; x=1782895618;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=skj2iu380j1PKL/xdlE3SsAEeiyHxzabmaPPRXEHU2s=;
 b=dDEY4SaCL7cljvT4hVTyk8/IlpROGAku6x+HO3MKJ9fGhblNy37Q97lZeYb9OJEnM8
 UrBK22V2Qwhr/Z+cPqOp9/ufc11WGsZMWpGdtGTJp6IKw9eFBDkISWWopqdcquQQ/8So
 uAEwQBjtrfYJD/rr56MG1QsuK1kC48FdwMTYeYNOjkbcZi3av3St75uO1+I3a3w2WB9g
 9pJD8slne+iskbsmOfa0z+v4htmVaF0nBCrkD/nB2cysO06zRm1JnCbyGgCiOQOKMKqd
 ksGpKgrj2VZ4+n0Fu5LO+3VdNtgcHy5HEudoT1qrDeJNLnueh38Ykkdvouvz6pMm+Mj3
 Ysmg==
X-Forwarded-Encrypted: i=1;
 AHgh+Rp89NSN9i5HyBTRvNCqd6hIE5VcvxBHr+Pgl0qq445ijgUDa/rN0Wv5JFTrU9sTeoIKpovOL/3xnqoBKg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yzom3xsOqQc2s4spY/QtVTybEK67OyUryhqRt5lTo1Dn63go/a6
 C1lc7jSuy2KsD5j+mmUEPCzupMbxCanMI72IuSE8P/Dq8uCSQOiB4w7B
X-Gm-Gg: AfdE7clnXq79w4qMRLZ+plZSGkpm41yw4xF+p9MW0mzbDDhCm/fXNGROpy3kHGF7q7o
 JU2Q/E6gk1Uz+UxzKUQYZjPp/woAmFSXa/JKG1sRGzttfHc8wJpuSf0Lm1mcBovN/spLQLABz3T
 xlfKNCvwrS5ug3TlNMu8m8Nq/F8burrrs1Qyp0Rs2Cb+14MfAuIfCqWe3gfm3oAxj6yjgX4jN2f
 CCy0XGc5OOxLOo7v5+oUo5kkm1AVb5zm8g1dzgbzNzxLwhqz8kfDpzYirISzZQ0wbj/Ym0ZNJtt
 xX8892PyuczFiaw7PMwMRSLPVZxqtR1RFYgX2DNACVmsljBuWCbYsMAANLPxJmo6xDRWAoI/4vi
 wlG5/uAImdUldP7VRA1rem/nGbtKhlyKB7h0vU0QXwFmidTNS3StsnkRjtOwC2bVirj/snXHUMk
 G5C0X1PAy/sqMccUAH+KqrK+Kv
X-Received: by 2002:a17:90b:48d1:b0:36d:8e6f:8d9e with SMTP id
 98e67ed59e1d1-37de428c345mr2433079a91.20.1782290817925; 
 Wed, 24 Jun 2026 01:46:57 -0700 (PDT)
Received: from [192.168.1.101] ([218.194.36.79])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-37de3d152f4sm2138146a91.14.2026.06.24.01.46.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2026 01:46:57 -0700 (PDT)
From: Yanan He <grumpycat921013@gmail.com>
Date: Wed, 24 Jun 2026 16:44:40 +0800
MIME-Version: 1.0
Message-Id: <20260624-rv1126-alientek-dlrv1126-v1-3-5aef608a3f64@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782290789; l=790;
 i=grumpycat921013@gmail.com; s=20260618; h=from:subject:message-id;
 bh=7ocGNYRnYoq9maF2qAH3laNWa/8XOoI4f7GpRXsmMt4=;
 b=uzOAy6qn4x5/EXYbBgpWhNj60Kg44wCLTm0qHhvgeTMI+w1MXiBW2yw05av0FmzEnKcNPFl/2
 lhmTEwFcLUWDNbN0W8PzbS2ebsv35H1x8pduzk0iFDXlOiBZFmhJT3E
X-Developer-Key: i=grumpycat921013@gmail.com; a=ed25519;
 pk=oWrY8KwXIunZWlYBV76NG2A3V4p1bJ+aD45Mr56ErTw=
X-Mailman-Approved-At: Thu, 25 Jun 2026 06:42:29 +0000
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Yanan He <grumpycat921013@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 3/7] dt-bindings: net: rockchip-dwmac: Allow 9
	clocks
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
X-Rspamd-Queue-Id: 074646C3181

RV1126 has a separate GMAC Ethernet output clock used as the external
PHY reference clock. This clock is described in addition to the existing
GMAC clocks.

Signed-off-by: Yanan He <grumpycat921013@gmail.com>
---
 Documentation/devicetree/bindings/net/rockchip-dwmac.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml b/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
index 80c252845349..86a7e83675ae 100644
--- a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
@@ -71,7 +71,7 @@ properties:
 
   clocks:
     minItems: 4
-    maxItems: 8
+    maxItems: 9
 
   clock-names:
     contains:

-- 
2.54.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
