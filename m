Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A018B40938
	for <lists+linux-stm32@lfdr.de>; Tue,  2 Sep 2025 17:41:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D4542C3FACF;
	Tue,  2 Sep 2025 15:41:00 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A1617C3FACC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Sep 2025 15:40:59 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-61eacd38e75so300941a12.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 02 Sep 2025 08:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756827659; x=1757432459;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=biM7Bjny+oEtW4RIbzxutTWTNB6Z2cdc0+Z2iihTXdU=;
 b=it7PjChfu2zTDIAZ3ZngO6p3+xqEyzEX5YIysV1n+PQd0TqGrNAYfFHBoQzOM1hR0J
 Bb4MkBhTfXxromSmvnclceFWVX/BSn58LGPFzDfXQ6xroq7eBUgC9HoZgamurFhpU2Yw
 XX0hqDWVJnO7ATvBOSm/JP28DwEhHQMIv6n4ltezi/TMaeWHpKqhBtluB+8kq/FyBMAj
 FSxm/Vo/8d8pZ+GkvdgvjlYObgVwPs2Eb2HLxzUMkMpxlrRhCMcJPJ52FRqfqyzdjvLN
 VQc3wHkF+7wBo9gbpA0kaAwqKIV0/ZauCOHpQrafVAgEJgAUKu+nBgxRPMFC2BmJWnCT
 KTuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756827659; x=1757432459;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=biM7Bjny+oEtW4RIbzxutTWTNB6Z2cdc0+Z2iihTXdU=;
 b=pGBVFIlDJ+a7giF7amnlEdp9qHnMHBYyASXJ8sxlMAVyqt+3DvMlzW0vecTdkcacHD
 0HJ2BOY++Hr5GMjo+m2UCUrRpBroVz4H/mnFVAzHqc8warKuuEnWpU5iHRnFze+bf10Y
 soD0kOkF/kdFSR2aCTjWyRZ+Tq6S9Tx5jEFS15feB9q+sDml7wQPbyJHzSsaiV6Ynh9t
 dyneddE455Vw9qGuj8bIBoe+ZUl61sNGihlKisf+wbuSlM8/CVJS+VJmeuiD8iOg4wyR
 z1nktHg+nX4bIzssw5ukuI2caVGmlQWSSRt3whHlReMA1th2DzXLOT77HdEupwk8K/81
 MNkg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVW7+/R5qp45G0SDTAaVDJPFA8iI3TwMIM5BXztNlamN8PDJnYpCJoG6fcmekdKzUWNMIqgAKSd5ZF5mg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw5NnjHBfi9yeb2NMNomU5GH89dn8yygF10C8jTZ+PQjTwVqnIH
 pOskrpKc7H4gxrMGUAx32IrYvIXilI3/MNgXvcMZSrSsvIIkTvrOIRNDl14tFis/pQs=
X-Gm-Gg: ASbGncu6K5DuSRsb6vCl0/uEugXG9o5bD4FVwlzrsvX5yuBicDYQdH5fvFg4CcJsyJH
 623kaXs+rAKlUkEY4hnrQKVRdHVRC+kMG5onoLBkO4iXACRadU4ACLeRgONLD5d5sSp0al4YtT6
 rzsQx0mptNycGEnVxTdpLuPC/XMUW366k37cOhj1aV6BOsPnvF392xBV89ZzEVNAQWbhwZAXRTw
 NycuaTevm+E+AuZJ+2eS2NnPtyOEvTk5t/SPill69NDaxAy6uLqX11mLVaz1rnY2tYm8VURfiwb
 SvIwKSltzjB+uKa2ajQrxowNd7Wz+tMz7gGeAVZng/aChK7TPiMSiv94Cz/un/AD94nDwbQBIV4
 Z6FTcnvikPmuT0mZgU32Xo10hBbl+wfQMHA==
X-Google-Smtp-Source: AGHT+IHqvfJxZqJi2NLaX1BO2h75+SQL5o+3GXCX6kDD5SLJWDWl9iQlkkXuKU07JA390ij54jHTOw==
X-Received: by 2002:a17:906:161b:b0:b04:3333:7e64 with SMTP id
 a640c23a62f3a-b04333384c4mr332760066b.4.1756827658993; 
 Tue, 02 Sep 2025 08:40:58 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b0438102debsm418746666b.66.2025.09.02.08.40.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Sep 2025 08:40:58 -0700 (PDT)
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
Date: Tue,  2 Sep 2025 17:40:53 +0200
Message-ID: <20250902154051.263156-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250902154051.263156-3-krzysztof.kozlowski@linaro.org>
References: <20250902154051.263156-3-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1188;
 i=krzysztof.kozlowski@linaro.org; 
 h=from:subject; bh=DD9yXaeypA2hr9FO3qZZJC8IuicCgOmdBNpfeVcWoM0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBotxAE2AXqGVkkvcoMa6jmHyX5xtJs6fM/mG12F
 ql3xWH2zgmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaLcQBAAKCRDBN2bmhouD
 104RD/9almm968xEPzjvlHGWaEROIstSx2O4TtT+LEnIzl7A7LlYbWUS1bQsIK2CPEsYTNsT5NU
 bxVJoFKk5YoPO3EubhPUUgfdCfiLbkA0AdQwi+sEsXd7HRh6fRyzxZND7F5zC07LZsS0UfpPZpD
 nECB2+rLdtwaN3qCuLT0YlPBFgNeGrf7j8tRuCtVg3VyL8cu9Dw0Xn+/l6K0Tw1z2Sy6x9qY/LL
 uxrDCVCHFkv99Z99VRTIeRo/C20Fr6xq6/NUatv72p5vFaGujQpJLIgXEopsTV62Pr8ljFLfabD
 tecCrVnC6YN4rhQRd4cN4iSYmKbgan5OIlnSneFdXA26T8gunnV9pq8flDPk+C3Pe0UQF5dEgrd
 0hrv/TLGmDsJuxK7375AwcweBBgfao8BlJkWRQoieTDkuI1SkYPbfy+bImFD7FyWLIEuSpiesP/
 KG4Heoz8S8AdFqjFJ8AWAp4z1fhS28qO7ZkOX2mHVujftP3JxueVaIvQ4daAP9PSySXjmrCmPco
 phxcZ753X5HLZ02B+63d30c9Iew0UnRuor9xudACczVOG+PUngW0Kxsj9tX+I6cKZyHUT+akTmV
 Z7OkHSHslLZopuyqVL8FLpyyJkv9aME8QmyaHYmymzjwPjCsK50Ii+ARGaCL42LVETwBhjo227f
 OwbKy7oAP+avSig==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [Linux-stm32] [PATCH v2 2/2] dt-bindings: net: renesas,
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

Renesas RZN1 GMAC uses three interrupts in in-kernel DTS and common
snps,dwmac.yaml binding is flexible, so define precise constraint for
this device.

Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. Minor typo in commit msg.
2. one->three interrupts in commit msg
3. Rb tag
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
