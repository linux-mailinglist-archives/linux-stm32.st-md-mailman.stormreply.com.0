Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7995D327311
	for <lists+linux-stm32@lfdr.de>; Sun, 28 Feb 2021 16:43:49 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 414D4C56635;
	Sun, 28 Feb 2021 15:43:49 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 202D3C56638
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 28 Feb 2021 15:43:46 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id u11so8278624plg.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 28 Feb 2021 07:43:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OhHoaAc908YGCrOivRRjATckooWceYbaO17T4MROb8E=;
 b=hWTIya6fV8QafabjWHwFKCFrder2AqZhaL9y3XRoT8m+KYpxrofvTyQMW5xMC9D/jf
 +LFWmV4wh2UQGc5e8FGTUV3uR1GJ2tsZSi/doqlp8YJxks69FeV3hGx13N8+/G12nT0S
 laBlSYeBJj82znYZoxhH0vhLyOrVAOf/cdjLU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OhHoaAc908YGCrOivRRjATckooWceYbaO17T4MROb8E=;
 b=FQZH0J4hAzTLjj41o16z/wvV3dDQyqnNjAmvtkyd9jLVta0NKoXRiwyReLcNuk5+T1
 oe+lb1WP9P8TmNeJZCobxjj8y3MFaxjCAje/vt77z0vols0GrZoytF3iM3dJ+ak8h/Xb
 noAeyYwLcr19bxGVp4Abmde8Cc/1MZmnhgGs6qXet4t0ke+zuToi79DbYaOpmVQTUUEQ
 lkQJaL3YEiCCrTc6zyLW59N1i9o2G7/6iaWt/dF9dTcozw+kGgJF3QCM1bl1YHPbIe8j
 +/UkOHTvfdwDeG6mC6s9t0LXs6juIwJ07POSXbmVzI+q2Sk6TRQmZ5wa3f82Rg4g5b/z
 laSA==
X-Gm-Message-State: AOAM530juAJtsYmEw5uIYV+sRDtI3AgjjcD3JKy3IFcnqWiFzwBZUQpV
 AtjaGpfQAa2YByY0lECwyKMIWQ==
X-Google-Smtp-Source: ABdhPJxYnlP3oakIHukHfbf/OdhxGzvpAbg0ms/Mom97T/YMvB+mEJrLmVG4JMawtHjQkNc2rhtvQg==
X-Received: by 2002:a17:902:7286:b029:e3:cec5:f0cb with SMTP id
 d6-20020a1709027286b02900e3cec5f0cbmr11608677pll.70.1614527024617; 
 Sun, 28 Feb 2021 07:43:44 -0800 (PST)
Received: from ub-XPS-13-9350.domain.name ([103.161.30.225])
 by smtp.gmail.com with ESMTPSA id j3sm13522133pgk.24.2021.02.28.07.43.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Feb 2021 07:43:44 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Rob Herring <robh+dt@kernel.org>
Date: Sun, 28 Feb 2021 21:13:14 +0530
Message-Id: <20210228154323.76911-2-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210228154323.76911-1-jagan@amarulasolutions.com>
References: <20210228154323.76911-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jagan Teki <jagan@amarulasolutions.com>, linux-amarula@amarulasolutions.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 01/10] dt-bindings: arm: stm32: Add Engicam
	MicroGEA STM32MP1 MicroDev 2.0
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

MicroGEA STM32MP1 is a STM32MP157A based Micro SOM.

MicroDev 2.0 is a general purpose miniature carrier board with CAN,
LTE and LVDS panel interfaces.

MicroGEA STM32MP1 needs to mount on top of this MicroDev 2.0 board
for creating complete MicroGEA STM32MP1 MicroDev 2.0 Carrier board.

Add bindings for it.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v3:
- updated commit message
Changes for v2:
- none

 Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
index e7525a3395e5..56b7e0b800b3 100644
--- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
+++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
@@ -64,6 +64,13 @@ properties:
           - const: st,stm32mp157c-ev1
           - const: st,stm32mp157c-ed1
           - const: st,stm32mp157
+
+      - description: Engicam MicroGEA STM32MP1 SoM based Boards
+        items:
+          - const: engicam,microgea-stm32mp1-microdev2.0
+          - const: engicam,microgea-stm32mp1
+          - const: st,stm32mp157
+
       - description: Octavo OSD32MP15x System-in-Package based boards
         items:
           - enum:
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
