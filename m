Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AC917AAC160
	for <lists+linux-stm32@lfdr.de>; Tue,  6 May 2025 12:32:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 68040C78F72;
	Tue,  6 May 2025 10:32:01 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3C6A3C78F72
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 May 2025 10:32:00 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-43cf848528aso40662575e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 06 May 2025 03:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746527520; x=1747132320;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dTckXKQzpO52Rq93n5jbcZKVQj0iYTZfc9032uakYfc=;
 b=I3YAQrrjWdBCcc27ISvx6VILHNci9apszK4QJ5JsNqn4e9U5hgCc3ewk1WHHf+f7/2
 bkG1wJxcy16onVe0jlASiG7zxZAioxxW7yltG370Jv+AyJt2yDSkC8PWBPIg6AXWn7zP
 yMAm6P4YTrrVshkFk34QmHVp9oThcehbUS0wuTjJ14j0WMIzsocTtAQ6EnYKEIshbd7G
 WdEWQ3UYuXlPAPvlTlA/5xOILISa4S42eli4dOEK0bh3uRDLI46BWqlDuNhcI/rOZ8/Y
 dmtEWTGvlcwf2llBuDXwY1ik1JtXbJuYQjHiU5rzf19Jhyf9t8uCxnIQiOa1bC8RhobA
 Jf/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746527520; x=1747132320;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dTckXKQzpO52Rq93n5jbcZKVQj0iYTZfc9032uakYfc=;
 b=avoYIWC80zbXMF130dZwx+goSmvrD3i7fljF2AdS1i0gTH4SdsIskXwZ6BCXVZlgpN
 Ujp/kA4SsmNMHGJBtsfjKn/x4C/pM3+T/M/Mff7BaNfr/pl5adTfBWBDqA5b4JCB8kkx
 kli3FyYaXY9Ha3tQnPG5IFEHTSLkJdTusWWY/R4gIauTfjV27CX1h5zUFOE9MG01uaBL
 52ynR3gcuV98q3waT4xScvODAZRtPDYHIJAgaDtq5Mak6v76xu7GcQ2DkC1FAm/LzmuU
 54QB+3q6hQ6o9zLf65RXP0tOTngsG+p9QFzFTybF157vSyW+ez0imqosq9tYGVdFLSXX
 CFRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWge5ctQ+lLONtj/6kFoS0MtZn7inJDPPPYWXzy8mdT2y6AUwcvCeMryxMCdvlkEANolLiPxOA6fxBEzQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzhyQRgwqBI2g9rgFA/wEOf+rRSPyi85OZ9XAEvj4Oy0H8tj056
 tbHbJMatrRReNJpnwubweOkN+tizSirDCTuOAUUMqeHCTRh8M9ow
X-Gm-Gg: ASbGncsUbkDC/z5TchSZAsrTwGAraH6mWXZDgwwfffm0G2NR0P8PE7o6v9WfXC+t11M
 vTMXoydXpGa2mWP17LTlycWIY0dgK3ImJNlrvSX4RJ4du8Eg5CYIri3BPb/f2MwqPD+YHB32iyx
 9wvDOu3N4cV8Zpt838gZM6Smf87x/uu1PJRHZvsJxsx1fPmHlPEZSHxO+HEMPG2WeNN6EjXDOoP
 bCXM/4EflFz03knZrYHRYYS4+6Tk+Z0OJgPut6Pfs4v8IR7nBU+g4fwzfNZA1ugqVTqsl8TUP9z
 pl23q93Tg/WglLxHk8FFjdj6yb29M2VV03HryQ6eSh6/6ASn4TkXSX2dxTqGqFwE3Q==
X-Google-Smtp-Source: AGHT+IEYF4ebhPDncCPOeVL/QRsWIn7j6RZs5f79o8NL0NOsY/ZAcvSRparMypRROyPTgVAEE7v9qg==
X-Received: by 2002:a05:600c:3ba2:b0:43b:c0fa:f9cd with SMTP id
 5b1f17b1804b1-441d0fbd5b8mr21811635e9.7.1746527519383; 
 Tue, 06 May 2025 03:31:59 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:26ec:c7bf:3d4f:d8ea])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-441b89cc469sm166148695e9.6.2025.05.06.03.31.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 May 2025 03:31:58 -0700 (PDT)
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
Date: Tue,  6 May 2025 11:31:51 +0100
Message-ID: <20250506103152.109525-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250506103152.109525-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250506103152.109525-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
 linux-kernel@vger.kernel.org, Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 1/2] dt-bindings: timer: renesas,
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
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
v2->v3:
- Added Acked-by tag from Conor.

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
