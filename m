Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3896C708C
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Mar 2023 19:51:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 650F5C6A602;
	Thu, 23 Mar 2023 18:51:27 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9531AC69053
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Mar 2023 18:51:26 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 v20-20020a05600c471400b003ed8826253aso2204985wmo.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Mar 2023 11:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679597486;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=64169Vvyo0ZZgIoZU5qnXvhyXyFpGQgMQ4mYoA5/rdo=;
 b=MKFxTpTDbyIGV0lMr2M3rwEnb94MOqyxqpRVFxI2yBYnA4kjOcrkc9EjDt16ZRBRWy
 w5rSFgxczBz8qdrzN96STvHlDGVopIivS3LeEiZyg5DMAXizfrS1UIKc6qmJ4fDXrjHf
 AmdbAwv01aP9xSLohMK1BgqJu8jfpfjNztej4hUsOa8vY7m6Rg85LIjFATndeup4LuIV
 k88Dzo7+MtuBG8/0DT+aEoBoZe6Gd9boRLgSaZOHWpP6iPkX3UouDtTIJ+DBZk/TPrHk
 7hxXF5/EwdOZL63ZdZ6P7rTjoz/z4QN/9SHbaREcZS5iE+1GZy1wxUd//NOsYdWGQC+P
 impw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679597486;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=64169Vvyo0ZZgIoZU5qnXvhyXyFpGQgMQ4mYoA5/rdo=;
 b=ziBvseva8oZHAqMVM9PTk52xf08c7ooHtS+JkkZapoCNRfeC02etSZJ0QhQ+M4hKkH
 s2K/xBbYpDwohu3wUxkLFqId0UpIci4zjgM+lHsRbxK/Xl+EuO2eFrwMEgvlAlrUVQbt
 zUrm8QxIFRbX0FQPV3tI3Ewp3mLaYxBj9eieHhDDMUuYHf6Rb0uKXclY3fOo/55f2LBn
 PSEzReqjBQs3WYltCiT2/6ZMZnPoV4L9hrwe4zzyrro+t+yebWGHORd9ecekFM6wrdyh
 DTM2MmPlLAxOxMVbeqQsZTQQKxMdQmkoWgi8T8y8LAFyVi711HBZe6CX85Pby52WDj6p
 KAFw==
X-Gm-Message-State: AO0yUKW2UGFGXFnNKz1Z4gY8bz1AD1gmFex1ssatpqcip9LGCoXboI0Y
 oAdd2YEzLSiNfMDEUNb/AAU=
X-Google-Smtp-Source: AK7set8uRrPGJYJokclypVKb4nC0fwJfb6HDu06Bl+KrlXV0hSQ1uQBNDiwna2u1y3tUW3Bmkkxl1A==
X-Received: by 2002:a7b:c40b:0:b0:3ee:4ee:bf73 with SMTP id
 k11-20020a7bc40b000000b003ee04eebf73mr454458wmi.24.1679597485860; 
 Thu, 23 Mar 2023 11:51:25 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2501:c701:7448:a207:93a2:a1ed])
 by smtp.gmail.com with ESMTPSA id
 k11-20020a05600c0b4b00b003edef091b17sm2649323wmr.37.2023.03.23.11.51.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Mar 2023 11:51:24 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Thu, 23 Mar 2023 18:51:12 +0000
Message-Id: <20230323185112.13855-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Chris Brandt <chris.brandt@renesas.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>, Prabhakar <prabhakar.csengg@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] dt-bindings: timer: renesas: ostm: Document
	RZ/Five SoC
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

The OSTM block on the RZ/Five SoC is identical to one found on the RZ/G2UL
SoC. "renesas,r9a07g043-ostm" compatible string will be used on the
RZ/Five SoC so to make this clear, update the comment to include RZ/Five
SoC.

No driver changes are required as generic compatible string
"renesas,ostm" will be used as a fallback on RZ/Five SoC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 Documentation/devicetree/bindings/timer/renesas,ostm.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/timer/renesas,ostm.yaml b/Documentation/devicetree/bindings/timer/renesas,ostm.yaml
index 7207929e5cd6..8b06a681764e 100644
--- a/Documentation/devicetree/bindings/timer/renesas,ostm.yaml
+++ b/Documentation/devicetree/bindings/timer/renesas,ostm.yaml
@@ -23,7 +23,7 @@ properties:
       - enum:
           - renesas,r7s72100-ostm  # RZ/A1H
           - renesas,r7s9210-ostm   # RZ/A2M
-          - renesas,r9a07g043-ostm # RZ/G2UL
+          - renesas,r9a07g043-ostm # RZ/G2UL and RZ/Five
           - renesas,r9a07g044-ostm # RZ/G2{L,LC}
           - renesas,r9a07g054-ostm # RZ/V2L
       - const: renesas,ostm        # Generic
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
