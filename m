Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OoVOD9fNPGr6sQgAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Jun 2026 08:42:31 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F17146C3180
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Jun 2026 08:42:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=FC61CnJx;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=gmail.com (policy=none)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8AB63C7C7CB;
	Thu, 25 Jun 2026 06:42:30 +0000 (UTC)
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DE1DBC87ED0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Jun 2026 08:46:51 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id
 98e67ed59e1d1-37c6cd1ac98so713867a91.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Jun 2026 01:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782290810; x=1782895610;
 darn=st-md-mailman.stormreply.com; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=nE3XF9TJ3rEGOneChwFEqNNIrveo5+lTJId+Q3nPPQA=;
 b=FC61CnJxOrWGK/9CBgB1Ko5D4jQXOun90TvCeL9S4PR/MF2Pfr7jtDlqRP1Rfaiwpb
 vPVLFEHTkWb1bW0LiAbN7Vw/9asntychFNuwjIdniVcXQn7Y8fyZ2BewaZ/JE1k9qOAL
 lDO632Jb+o57qHW4sq0VMd6Hs0zv7ZimJp3P+IK4PZP2nJJhT80JJ9rmQ2fgGqRFMik/
 8s7uM5MT79SzA+/KGydRr9vMyd7DmLvE7AzPsuroJ4cpJYZESz7aSWcO5pyyJggRRx4I
 KE1zpt6DZJcmKvFTu2UYGU/bUEHPwyc98/UgpOQeR8bIqThuT34EcTru5ILNc2ZeAMaG
 6e6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782290810; x=1782895610;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=nE3XF9TJ3rEGOneChwFEqNNIrveo5+lTJId+Q3nPPQA=;
 b=ei7r5wKcipv3DCRPqYB1xFY3ZK8R56Muo/RrI1myMAxhl0XoE3FAB4n8OVws5zU2VC
 UqLWzucb2uxOaXPbMG/6abqEgQ1q8i/OJMLBDLJkYFo/fsJsXORix2aQJhpOZnb8rwf1
 B/mkL9nWVVZyaOE4O4+LglhKdLNLDLMn7NM5uTtuhBg8ZVlTOZ950WECHndEGuqT7DsP
 aJkVxkoCbg3RPsprRHpJhwPPX0F2kQ5oLuAgaJ5oZP9ZqfF6sKcLNMiyPrzOvuJkB7pj
 xxEFe2gFdRNF0JkNhULXzvjhPqFXs+cS7JMjXsNk8ueyqRlyxCsUNyuSCRan8YeHU57i
 Accg==
X-Forwarded-Encrypted: i=1;
 AHgh+RqguNjxIU17MTROITiYFUNNFdB3BrFzYlh6+5S1P4plOXMFQReLvIHSPcwKH4WC7g/yQlYZpGiAZq2huQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzjdvZiI019MsCxxT1kqjuYy/5Av3h4XSZ5+BiqZnhzE8a+qysd
 VpiCVr8IX30a3yo1eprN7E9SfwC7qawt8Gezb1R/oC5VWke1HF1l49zJ
X-Gm-Gg: AfdE7ckb4uuTMk9twLn4FWjjCT5s7/G80P6eBnC2D8OPBakBbwMT1UPRa6E8A0dP6iz
 AdNtFZw/jLVajFcOp1Md8bFtWnXgOMWUvE4Wzo9uqrV/SDTr7bSWmq5d+n0Y4F4lSADdgNlxJec
 FFhzAkjbvJqnpTcCUAr7SiHOI+Bh+/f3a2Uz9k7vZg7lLo2ipCEB18vSvDnlj0Ci59UXkhi0cGB
 WvJl2V+r3RIkhul9crLhquFO0QxNqpeq5q1uZPkyBAeiwROJ3ajfWui5LyY3xCDQj5M3YqrYtyJ
 sOGgiAlIBsvB7OTCgNaHAPDi9/CcGWPlVoIFYCiSk26USWavP/OkRHAoMQGfQB4JxRv6F5a4Z1E
 MjtwmCJ+JMs/7Ld76LX38Kik5FgN2pKrmzuRE4v7hU1Tvb7StgeozUoXZA56szGtQoax3jn954V
 KFMIOJVO/izzCkSStcwUZm3R/F
X-Received: by 2002:a17:90b:278b:b0:37c:6975:2e3d with SMTP id
 98e67ed59e1d1-37dd0d3de38mr6759149a91.8.1782290810525; 
 Wed, 24 Jun 2026 01:46:50 -0700 (PDT)
Received: from [192.168.1.101] ([218.194.36.79])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-37de3d152f4sm2138146a91.14.2026.06.24.01.46.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2026 01:46:50 -0700 (PDT)
From: Yanan He <grumpycat921013@gmail.com>
Date: Wed, 24 Jun 2026 16:44:39 +0800
MIME-Version: 1.0
Message-Id: <20260624-rv1126-alientek-dlrv1126-v1-2-5aef608a3f64@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782290789; l=1084;
 i=grumpycat921013@gmail.com; s=20260618; h=from:subject:message-id;
 bh=hEAydHqntdYMnlyAwKWZtU7FCzzrJfeB5kFdTHg3eh8=;
 b=LQo6M34edM3nvXNVY+lWG19FP/SsEWFUfLZegDFVnSHuVJWMtsEo9BN8H+BQsQz7HVsHAPF9k
 ntrv/WOTO4JAdqu8mcEVaIdImKoX5QNJcMKn9i+mijaj9U60D4syALM
X-Developer-Key: i=grumpycat921013@gmail.com; a=ed25519;
 pk=oWrY8KwXIunZWlYBV76NG2A3V4p1bJ+aD45Mr56ErTw=
X-Mailman-Approved-At: Thu, 25 Jun 2026 06:42:29 +0000
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Yanan He <grumpycat921013@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 2/7] dt-bindings: arm: rockchip: Add Alientek
	DLRV1126
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
X-Rspamd-Queue-Id: F17146C3180

The board consists of a DLRV1126 carrier board and a CLRV1126F core
module based on the Rockchip RV1126 SoC.

Signed-off-by: Yanan He <grumpycat921013@gmail.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 1a9dde18626d..9058f2a461d5 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -162,6 +162,13 @@ properties:
           - const: coolpi,pi-4b
           - const: rockchip,rk3588s
 
+      - description: Alientek CLRV1126F SoM based boards
+        items:
+          - enum:
+              - alientek,dlrv1126
+          - const: alientek,clrv1126f
+          - const: rockchip,rv1126
+
       - description: Edgeble Neural Compute Module 2(Neu2) SoM based boards
         items:
           - const: edgeble,neural-compute-module-2-io   # Edgeble Neural Compute Module 2 IO Board

-- 
2.54.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
