Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 175F2BF0553
	for <lists+linux-stm32@lfdr.de>; Mon, 20 Oct 2025 11:56:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C59CAC5A4E3;
	Mon, 20 Oct 2025 09:56:11 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B5323C5A4E1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Oct 2025 09:56:10 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-781206cce18so4198160b3a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Oct 2025 02:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760954169; x=1761558969;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GWcuoCKPdDJm2TuKaUOD3wYJ8UpWoogH56aNLChKmO0=;
 b=c97oTSIArCGHWTDAtuzTHE2uPtGus+WoVE4RmgN16SsD8J0ncPsdvUcxOeJO1tWM9q
 llUDUcYGAhX8B/K7dW5jLAHm2IdId1OZ3i9eriZxCZWNC+ffb01YwZqkdFO7z3JFCnmP
 /hdNxGdLSIJXGxIdBstBGWCH8FHSYaKbU9sJhbsmbRDg3aME+kJSeISU8IxQz3Mujz+B
 FWWRux5ojYj0GcKgyKFbGaMGdnIsdJS/wJGfqzX2FxW+LGssjsN4CDm8EruTw95O8WIX
 +sAg2Hf6z6TZumZt1trx7LW/fDyvNDAPpiCYOuQU1nd8i9UN8xSWHlTUP5ebJRtQ/Qj1
 sFUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760954169; x=1761558969;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GWcuoCKPdDJm2TuKaUOD3wYJ8UpWoogH56aNLChKmO0=;
 b=dSCg00cDWFIslU8aZ6gsf8ETJOQ+ZVXs6GOvanOHxh9WkMztl1geg9qD2tXH5XwQKC
 /eTDhoUKqYPpHnTowxP1vKN2h9/k/FPGCBLkcrIU4QLCA6A/h4BdTiZzWMHDjSGH7Mdl
 Nu5RrirRVq/fETY6DBULFvtAHhAwk3bRqjY491iaX5rUSV/UfaoEHY0iSbnryZ3pLIg/
 XbP1ejWwlVmyzT/HYEBj2EHYBLvhL/jwIdrnfFqFj8NrM867/7N/IcjnFmpmn8gqgfgR
 nYVMW5VXWbqTxV0ifjX7UPKJ0cQIkEjW0CpWWtkQV0i2eK4UhH6VTE2mW0KyvV1e3ubD
 KAIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXjbjgMb9eMC4Ok9Nng5IUwXZ/WmcDkoxWz8M0Ugswp7QsfRhtf7nRsWRet9h9ity35BPIIouaxHwfCg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzncljdFfckFjoUq5HniLGnEpzRkxVYeYUithJ8y59uSM64xBfx
 LdroN7/sUjDuaCGsVA/MLLbQ2yiNZ7elBXqQlJGbD4nAkM5MCcdgkPsB
X-Gm-Gg: ASbGncunJJcHkb//YQAOTMcS1tZCrvyVMe5GJ8dG54a2eafkgL+cGaQSJ5DE7R6Vib/
 +BtfTJLi1ncR1t8KWtCyX7R326FIjMMNZP0jxYJfx1F/5fz8OryXUFLmSxVIp+pkNwGEkUHbsZ7
 3w4E0eW5dJL5Ba2u2Csy0WBBIROtws6E4sgpq5DyxJ3S5BdIwKbonqYhVAIeIx34q3N2OzdliGa
 ZCW0Lr24yiuCGbJ+SB02Q/VOgkHyaVDioGyxcmKmLpT7rDCPuJ43aZA5p5UZyoB1ZyC8jEv2/WX
 AbM0LViWwPGNLiWwBp2Ca6tqFbI7IVARIAXsZk7gf5e2Bk5W/41ZMzNSbbrcacgK465Ndn4GW2I
 ssr8AinBw6X37elM3u0mNlDHfLKgl+Xk6QtiRpJiz+n/1l0TBwou2QbksVvpbV31tgXBTg5XLit
 U=
X-Google-Smtp-Source: AGHT+IGIQ+fpkFQuGh96PYvhkgcTsp4EgXDaVgp46X6ZalhlUpsQFY6hZLjZrBA81Ys4H3/NGCVNzA==
X-Received: by 2002:a05:6a21:3382:b0:2ca:f345:5673 with SMTP id
 adf61e73a8af0-334a7a4b585mr15454180637.27.1760954169223; 
 Mon, 20 Oct 2025 02:56:09 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7a2300f254esm7819782b3a.45.2025.10.20.02.56.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Oct 2025 02:56:08 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>,
 Inochi Amaoto <inochiama@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Han Gao <rabenda.cn@gmail.com>, Icenowy Zheng <uwu@icenowy.me>,
 Vivian Wang <wangruikang@iscas.ac.cn>, Yao Zi <ziyao@disroot.org>
Date: Mon, 20 Oct 2025 17:54:57 +0800
Message-ID: <20251020095500.1330057-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.51.1.dirty
In-Reply-To: <20251020095500.1330057-1-inochiama@gmail.com>
References: <20251020095500.1330057-1-inochiama@gmail.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Longbin Li <looong.bin@gmail.com>, sophgo@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 1/3] dt-bindings: net: sophgo,
	sg2044-dwmac: add phy mode restriction
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

As the ethernet controller of SG2044 and SG2042 only supports
RGMII phy. Add phy-mode property to restrict the value.

Also, since SG2042 has internal rx delay in its mac, make
only "rgmii-txid" and "rgmii-id" valid for phy-mode.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 .../bindings/net/sophgo,sg2044-dwmac.yaml       | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
index ce21979a2d9a..0f1523dc0e36 100644
--- a/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
@@ -52,6 +52,13 @@ properties:
   interrupt-names:
     maxItems: 1

+  phy-mode:
+    enum:
+      - rgmii
+      - rgmii-rxid
+      - rgmii-txid
+      - rgmii-id
+
   resets:
     maxItems: 1

@@ -70,6 +77,16 @@ required:

 allOf:
   - $ref: snps,dwmac.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: sophgo,sg2042-dwmac
+    then:
+      phy-mode:
+        enum:
+          - rgmii-txid
+          - rgmii-id

 unevaluatedProperties: false

--
2.51.1.dirty

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
