Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0914AB40937
	for <lists+linux-stm32@lfdr.de>; Tue,  2 Sep 2025 17:41:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BDC38C3FACE;
	Tue,  2 Sep 2025 15:40:59 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DE0E0C3FACC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Sep 2025 15:40:57 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-b00f6705945so22101866b.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 02 Sep 2025 08:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756827657; x=1757432457;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wB2hOz6NFjWbWAhm1PV1EJGvhxwPuieGYAKDStpXw6s=;
 b=qnCK7a45fs7d3GDvAoPDfpVlvCv2pW9q4fiKAxD4Giq2RIsdnSXhvIep+fLjg8Yq+h
 p40Bs6Uc4QVN8KgFPOlxHppINrVsPIULym2lI2eT1sAIWLVjM9gBpPaywJ+jwfaEqNyF
 9so+c3qpDzslLx/gdkXe9TLN10zRcWDp2BIIXvXei+vjkRQbO9G6K3zFQPQb0db40hcq
 U/w/82W+gZhZOuPljEQ3+SrOBVWpThSP8bxHCsVEmXpuEVjP6ZzJYEwkIwnWKQHY+zOL
 5/xIv/NxBQvsoSCTwTqyJ7kSiK4Jr83TDx9HSCcOLLRp7CyHWMi3cPk/GS2DFF2F+wys
 LCUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756827657; x=1757432457;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wB2hOz6NFjWbWAhm1PV1EJGvhxwPuieGYAKDStpXw6s=;
 b=njIQpOOkOBssw6pc3fhMklw7cKK5KedMUN8jleridTvvgBBPjqBzyprpiMd8JwC66S
 lZkQDZY6FDXP46cWiZvgHSn7e01tZaHc3TBR8B5cPWASV97S6V99iklWpSjrdgyuS55I
 l/kPOsG5CDof++p2uSmWuoo3/wqtChPCvs99ssV9DjFdiZuNPWbYf7zFxSodBQkXu2u/
 FEMTl9NuzzcjsNKS51RDft4AgJ3PWdWRvhmwQFG8iKQOb4ncfwBCaKLmwc9RTiLKyrv2
 ogn8+xy36xfkOCi1aYhVCsSJ/vqcgLnBHkhaiqNjosgHzV2xOM5DsMU1O70hEXk9wBlS
 m7Lg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnavhff08DPGZ7JTHzWKW7cHPxYpOyS5KGo/AXtDDr8jGHAEzi61z8fQ0Gw3jit/KQkTEnJc518AoDdQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwSMxaTg1BR9SM5gTyX4D2Yh2tyzxN221b2XvbFVRFtGAU9H3Dw
 N0/Tu9ErkwHhjhR5PV/Z7nXu1OlMIAqwY8Hk3CWWik1CT51gvcSmjqAYzI4QofNeiYM=
X-Gm-Gg: ASbGncsIi897UPyWs2L/7usOTesO1ECAsFrVVmR8qcLkmLRDilY2xy2AmqicH2gG96x
 Bf26kxT5TpdoIs8QKF9IkVDDxJPLi6heVZqGhCvpL0D9qpBPgnYgPT5XOhSd9QQ1r/ffhJfY/21
 lrolrutBIGy8VyvPkTUZNQmDiCGyx9H0cV8ZYOZ6G2mt8dRXYQdR/m1/Fro6XtxDsuOt6QWtokS
 QtLtx2HhjKessqCrmqeE2BWog8cGBc5Fdy7ekAEiDSa9he0PM9mGXRENIujNT8UKXswLwfe2sYt
 E7ImDC93k91JsSmyLQaHb7NePkYgVHgT5sbITd2ffFSUGgIDp4oYb8I0x9SCGZ4DeZRwXbw7VLS
 Gx1sRpTLT+F0s7V3zLxhoXEnyIsr2dlgBNw==
X-Google-Smtp-Source: AGHT+IEWMtUipiwvP55o7SnFFNedcIB9J8Y92SnsL3bGTAtWU6+jlkNHHkULu5G9fMF+Xt5W8a2bmQ==
X-Received: by 2002:a17:907:3cc3:b0:afc:ebfd:c285 with SMTP id
 a640c23a62f3a-aff0edc4d6cmr819502266b.1.1756827657134; 
 Tue, 02 Sep 2025 08:40:57 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b0438102debsm418746666b.66.2025.09.02.08.40.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Sep 2025 08:40:56 -0700 (PDT)
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
Date: Tue,  2 Sep 2025 17:40:52 +0200
Message-ID: <20250902154051.263156-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=968;
 i=krzysztof.kozlowski@linaro.org; 
 h=from:subject; bh=sFLVskm/GZvqeQI/f+rrxfYgvGE1+3DHh+EYMzpJNhc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBotxAEs7Pi4pRQzSl+H723I8RHNxnqQ8YsTSkC4
 vkxAmnxXj+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaLcQBAAKCRDBN2bmhouD
 1+k/D/0UuXc2i9vi5ZJEk2QSnLsML7RPV42gQabAHH1WKmWnL4CAxBu79LPPNM4a7I1ooZ1jhtF
 Mr0HfnWsGPBrGmp8I1/uv/bXwxzHoXkai/Nz6y8C7yM+JNberjHA+TiBdQVzwbVM3RrI3EPANB3
 lWmBIcSxHKokKT6EaVY1AKnmFgurZZ6y0eBstHMsdJ6ELNsyPVyS6BaAUipo++or72IL3/XbP8t
 o30+Rbvby6HDByLMYbdefwjD4wAzJUzz8Y4uN+rOxXGvErZC3E1bvX2mJG5WVYkRRwTSN+cWw3R
 YUEAJdS3sN0m7TIPexcrKhSmyvNL+7CebE/kX8UNOcms6KyQpmTkmoiwlKEITwCuKHu7rqCcloj
 kXbG0f20Poz5QjpvoBJMOu13+2qCJcWhUCRNVXOGGHVR1EEKa71BYZzwH+6eM1Di4nxFa901haa
 MPJ/wDC6mZ5vqxoKG1aMzF8c5gTYUdO8z/1pyNpGzkwLLdQdFo+k33FRQmngLKLdN3TmFgHHaya
 RVG8d1yntleXzsQP6HRY2mICIMlwAy2wmRJpiusUUYtjnOE96Z3zIcA3TBfTXlXA92EGeJtuUKv
 O16pHUiaXsjIP1644k6rtwNhNVpYEVZ1NJokD2I0xZ5+2h1/Xa7D3vHI9tqIkagc3GnIv4q92i7
 pJ52l3zbCm7aBLQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [Linux-stm32] [PATCH v2 1/2] dt-bindings: net: altr,
	socfpga-stmmac: Constrain interrupts
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

STMMAC on SoCFPGA uses exactly one interrupt in in-kernel DTS and common
snps,dwmac.yaml binding is flexible, so define precise constraint for
this device.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. Minor typo in commit msg.
---
 .../devicetree/bindings/net/altr,socfpga-stmmac.yaml       | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml b/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml
index 3a22d35db778..fc445ad5a1f1 100644
--- a/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml
+++ b/Documentation/devicetree/bindings/net/altr,socfpga-stmmac.yaml
@@ -62,6 +62,13 @@ properties:
       - const: stmmaceth
       - const: ptp_ref
 
+  interrupts:
+    maxItems: 1
+
+  interrupt-names:
+    items:
+      - const: macirq
+
   iommus:
     minItems: 1
     maxItems: 2
-- 
2.48.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
