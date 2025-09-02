Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CF40BB3F9F5
	for <lists+linux-stm32@lfdr.de>; Tue,  2 Sep 2025 11:15:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8BBCEC3FACD;
	Tue,  2 Sep 2025 09:15:42 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 127C8C3FACC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Sep 2025 09:15:42 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-b041264542eso23610366b.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 02 Sep 2025 02:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756804541; x=1757409341;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d8XZj58AfuffXLo74Vy8aYlA//3fYOnrLNQd7UOnLAM=;
 b=N3HOmqhQpTFun3QcrTPQ87L2GGciuGDdEtFWtkP0Zr4JYhyvelZoTNlAmO6pdh+N2c
 5mflBJNiy/9KwQrU3wBMcUk9ipve9Us6WpoLbeMjE5/yx/ambg3GotdjrX+ekW73HHxV
 P7tNA67/ZHdKbW21kaybhgqGesqCWiKOSpbhxUrem8lIhag/R6+w0wHLxr4XXiB4mTfF
 taIM26D5BDvuMS/pGt4QfwNAmdChaG+c2ill5nHV7sGBJ70L41nwIUfU7SOeYq24Pxgs
 fkfA715QGmxSGu0YYg3mE6kbGEDPUJByQGVIHb2vMlj/3V6pEyXD/Xor6eopFr6/rqC3
 sV4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756804541; x=1757409341;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d8XZj58AfuffXLo74Vy8aYlA//3fYOnrLNQd7UOnLAM=;
 b=cI/5uLHP6prjRDlCRi6JSBHRSpXRhw5sSqAlQNyAVefdeFQdHN0J0dRWkqTKbxA5KN
 gnK3lWo6LrCfFc8cfBDxWke5+Pt3uDWSsjqkLqaNw9HDJRNxkXLwOXEcDgk7sMp1sWbu
 HynwbVY1v8W/X1Kr+S2StmHcWFY/VmCvvmrI/rHXsEMJcDPhiFLKoQnft3WYPnlFWyoK
 x1kUmHKWHFOZ8YeREbg+1Z8W+hNmrTUtNzmGsy3FWWAb/YyEoWcl4YCTfzqFbyaFzFpq
 SMxTdMBat8lizjidk5EVtVfubO5Okmd7UGTjGlNU5sx5LdBU4DJLAS30KMNkWCFDpVuN
 Yaaw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUbWgOfhkbU+6FxI+sRBQ+vKoiE3adPOwUjrWE3cjI6/Cejkp3Nq0jdtCdSQpmtwiaUlYlMUlKte1hdA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzpGS1r7+raZQic8ezHA0eKdJ+/m9bcRwnOghXEXxEgT+JbZdh4
 fFSn3lpChrUJTe26jclwDR5WtKNWqJHNXnZ6bv1pr7PiMxymum5jxHTiie3zEr7HHRE=
X-Gm-Gg: ASbGncsaB5rPB+xdNmFt1ChIeStLseorVJ2/75flFhwq+xLEBu63fYBd1XKGEpH5o2o
 kWuIb9MOjFxz5Nc7zzqRyTvLggeMSUXHBA+ZWAKtxzW7u9O6wXtOj2pZcaUIjnJMv8Q6bYxjQNW
 XS6ZYmhdbGH+tXzvSe+RKLmPE2kIUn0B1J4bJQ4ukmOsiTP0CGXZtcZECgaGo11ul5/2MPKwSZr
 +cMRKL23hbEy1IgFbJrdlfpGqRM49ry66yoEuYUsr3eWzK+r+KzskOGY7noKpMJuvIIOOouPzl2
 CbQEmeB0LXWdbm64eOwivj+++DZHN9W7rFRfdCQP1A8fxKdz94FGl/ocRGaEVUlekQ9kGa5mc5m
 QaA2womk9JUL77nnk01ojzu0uUXW6n63oyA==
X-Google-Smtp-Source: AGHT+IH7ISdvmk9LdLXUfb47YUHhoUHT34kW8bHgs46FMafpaBt9DhVN+MYvqleNA7oVddSWHu0KMg==
X-Received: by 2002:a17:906:ef05:b0:afe:872a:aa5d with SMTP id
 a640c23a62f3a-aff0f022fa9mr729067566b.8.1756804541416; 
 Tue, 02 Sep 2025 02:15:41 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aff15fccb15sm877008866b.98.2025.09.02.02.15.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Sep 2025 02:15:40 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Matthew Gerlach <matthew.gerlach@altera.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Romain Gantois <romain.gantois@bootlin.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
Date: Tue,  2 Sep 2025 11:15:28 +0200
Message-ID: <20250902091526.105905-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250902091526.105905-3-krzysztof.kozlowski@linaro.org>
References: <20250902091526.105905-3-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1016;
 i=krzysztof.kozlowski@linaro.org; 
 h=from:subject; bh=pK9+ijRl2j6HN0tN4nwtWsdeKYO080hTPBOS7dCkey8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBotrWxaTzC0t9SB2cO/DTD22p3u2YbOPnNDsqYC
 JeNdd+LesuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaLa1sQAKCRDBN2bmhouD
 1/h2D/9Sc3syBi5afN5lHFwOrNyVsaCUZeb7toIaCPz5fDF/nnBxaDdqMiyBKHv+oWOPmQJcWXl
 J5Q7rx9JPyBEC3B2rKaONy95EOxJaAFqrC2rGq1OL8BlgWGSnl5MUK1xX9pFC6oqM4rSoAxbpUI
 LCikfUeSYsAK+9M9Ej0b59qoAjb3fXf3pK9s/WY118krSdhyuWzfXLWchmkPxsrSSubHCYncveI
 O1qKtkRVG8+hrDE3h5Q0AAQ709zYOi7sh2kcDOxsX1EVdnkuCotvvJy6Hs0nDsxb9NrQ/gQj0fv
 L+2Zq9YiQrrv3XYDZsGx9C5eb1ZT6EhIbqXTCL1s6cECGTHXwANAQa4k5nqe5B/QV7WMyayJ6zu
 iQEiNDEhurJ0corFkb8SQJeov67WpP5pR4+1AOHxcABobdrHitKZ6HkNFivVjRuPEZ/hrk5Ls8H
 97EzieU88wgVgrnZ1l9BDz0xvjQcQELkttmXFIUBSagjLbdvX8074/XpxaelVnEhYtX68CRmpci
 2XBOhGrWS9sSd9ftltSwznhq9BBTVL/taAp4hZdq3uZXfoEEGahSihXA98O0n/oiMOaJJn7Yuoo
 +zS0+m38Zk6zbpnex4B8FJsk2zB2accitUUwpoHH/AtazIZAcxo44rYPPKKLJvBcZR4+GwPQFQX
 GubCOLzxqThca5w==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [Linux-stm32] [PATCH net-next 2/2] dt-bindings: net: renesas,
	rzn1-gmac: Constrain interrupts
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

Renesas RZN1 GMAC uses exactly one interrupt in in-kernel DTS and common
snps,dwmac.yaml binding is flexible, so define precise constrain for
this device.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/net/renesas,rzn1-gmac.yaml       | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/renesas,rzn1-gmac.yaml b/Documentation/devicetree/bindings/net/renesas,rzn1-gmac.yaml
index d9a8d586e260..16dd7a2631ab 100644
--- a/Documentation/devicetree/bindings/net/renesas,rzn1-gmac.yaml
+++ b/Documentation/devicetree/bindings/net/renesas,rzn1-gmac.yaml
@@ -30,6 +30,15 @@ properties:
       - const: renesas,rzn1-gmac
       - const: snps,dwmac
 
+  interrupts:
+    maxItems: 3
+
+  interrupt-names:
+    items:
+      - const: macirq
+      - const: eth_wake_irq
+      - const: eth_lpi
+
   pcs-handle:
     description:
       phandle pointing to a PCS sub-node compatible with
-- 
2.48.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
