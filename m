Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E2FAA7280
	for <lists+linux-stm32@lfdr.de>; Fri,  2 May 2025 14:47:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CF18BC78025;
	Fri,  2 May 2025 12:47:07 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 09571C78018
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 May 2025 12:47:07 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-43d0618746bso12273925e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 02 May 2025 05:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746190026; x=1746794826;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NTvVEJqnGfLFRy9sKyuYj96g6OZUs8NrtUQSQQTNG/A=;
 b=MJJmKoANXSVqi6jW/47beRCp9ljPyTiDjqPGRn9ipdPYshE9mGUvWAkBMdb7CyeYOr
 K6VEFWMbPYHnN2ortGRN5BCiY5H+FT29dfVwdK36R5Md5jhVAeKj5rJx73tVEFi9dxWX
 EGrTELRb1TzoNsFO5QpJu1HLJ8IG0KZSF2JSq8f4euL2llAlffS32SCrqmPi6qNmnr4W
 vvMFpM61RLScUBuSAMZ6WJ/fbsCkvVwD+E01K7B7uLbAYLZYxgdObSl9YWdAyqeNEnc2
 ry2nYflWh66SISpocrC/7vUANq8UOwFGYk4PEUCcrTb6Ak//uWcJjJfkuCsPZfKlT+c+
 o6DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746190026; x=1746794826;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NTvVEJqnGfLFRy9sKyuYj96g6OZUs8NrtUQSQQTNG/A=;
 b=YPbWaiOY6yn4Ea4iXOkgjItLI+hlc7yYh7Dt3DfXx+PUIH1LbRQV9vGYZuSz6gKL/g
 kGCmVStH15lTxkhpOisKR5P1kDwumKGF8ksQqYrtcLwMMszNUQW7HzQ1O4FX0jshhQ7q
 qdM0PiqET7LwQxdEIxpn3NO9rESJ2noT1acqYjBy624dA4k9xB+3Pm7IujdFdDA9BUid
 y97vYmLx4XuXa9Hr6qLWwfRmBxGqP6E9pjakJK8hSaoeAHkqGret6EuNYQXNAzKSPu4n
 rDA78QyFMggdHKuvHsyutcEQ2oC/L8DtCLAb9EKUn4+aLZPOB6tX/RN+ocKwjp75qdEr
 lY3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZ1dMxFv+JvpE5KiSa9UyBnh/BVxdXzTWBXMQ2A/07ol78EVqdGqcTNBg4J2n0nBMs2kGjbzsl+yIq8Q==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy2ZAPd4c8B9ZDgXBVFQ+6Yzy5bjAvJ/eHB1GbQ4ORLG97ms1al
 xAkxp1e8ghjzcypOV1RQN+DENfOSNMFi/5ZxALyUJfkhg80JJi65
X-Gm-Gg: ASbGncsAZeAF8nY2o61WuYRRl2X4/iah3ydfLxCc8ZDm+wMfX8OzAyCLCV5fDFyFjqu
 Qv+3Wd3FGs/k+cBsgmNVQXrWIqIbBgR83K4vibiyfFbOCtsxU141xKynVFmxRFnG5h7uye8wfS7
 Z6SHSb4VQPpKXITNZpABlO3ized8hEMxzw+w8EhSC7l/t8NBrxeTdamegKjWtWVDuol+MdAdirV
 wgT7G7XBu++PmCd+7NL/ZL+pedV+MeDredNyr56kU3nczSDTGOf6wm7qrQITJ6U/h4vrL2DHPj/
 K7uf2htEWO2iqj7XtG0RHxNeJ1pfj2rXcgRqbgwcqCSJhgg5yTbiQxN1cnTGJYKfbDLoRTwuv/0
 =
X-Google-Smtp-Source: AGHT+IGligrngWzegbeijlkgnA144Fj0oT7CnzNyCMXUijz4fcNIQm7z8dwBSQY1cErpDIrT8CTnwg==
X-Received: by 2002:a05:600c:a016:b0:43c:fffc:7886 with SMTP id
 5b1f17b1804b1-441bbeafc6emr23873365e9.8.1746190026203; 
 Fri, 02 May 2025 05:47:06 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:10cf:e432:b2b:bf99])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a099b0f16fsm2059134f8f.77.2025.05.02.05.47.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 May 2025 05:47:05 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Chris Brandt <chris.brandt@renesas.com>
Date: Fri,  2 May 2025 13:46:26 +0100
Message-ID: <20250502124627.69644-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250502124627.69644-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250502124627.69644-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 1/2] dt-bindings: timer: renesas,
	ostm: Document RZ/V2N (R9A09G056) support
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Document support for the Renesas OS Timer (OSTM) found on the Renesas
RZ/V2N (R9A09G056) SoC. The OSTM IP on RZ/V2N is identical to that on
other RZ families, so no driver changes are required as `renesas,ostm`
will be used as fallback compatible.

Also update the bindings to require the "resets" property for RZ/V2N
by inverting the logic: all SoCs except RZ/A1 and RZ/A2 now require
the "resets" property.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Hi Geert,
I've restored the Reviewed-by tag from v1 with your suggestions applied.
I hope you're okay with this.
Cheers, Prabhakar
 
v1->v2:
- Inveted the logic in the dt-bindings to require the "resets" property
- Updated commit message
- Added a Reviewed-by tag from Geert.
---
 .../devicetree/bindings/timer/renesas,ostm.yaml      | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/timer/renesas,ostm.yaml b/Documentation/devicetree/bindings/timer/renesas,ostm.yaml
index 9ba858f094ab..0983c1efec80 100644
--- a/Documentation/devicetree/bindings/timer/renesas,ostm.yaml
+++ b/Documentation/devicetree/bindings/timer/renesas,ostm.yaml
@@ -26,6 +26,7 @@ properties:
           - renesas,r9a07g043-ostm # RZ/G2UL and RZ/Five
           - renesas,r9a07g044-ostm # RZ/G2{L,LC}
           - renesas,r9a07g054-ostm # RZ/V2L
+          - renesas,r9a09g056-ostm # RZ/V2N
           - renesas,r9a09g057-ostm # RZ/V2H(P)
       - const: renesas,ostm        # Generic
 
@@ -54,12 +55,11 @@ required:
 if:
   properties:
     compatible:
-      contains:
-        enum:
-          - renesas,r9a07g043-ostm
-          - renesas,r9a07g044-ostm
-          - renesas,r9a07g054-ostm
-          - renesas,r9a09g057-ostm
+      not:
+        contains:
+          enum:
+            - renesas,r7s72100-ostm
+            - renesas,r7s9210-ostm
 then:
   required:
     - resets
-- 
2.49.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
