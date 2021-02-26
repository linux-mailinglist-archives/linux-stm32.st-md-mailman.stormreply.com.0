Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A46325DD9
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Feb 2021 08:03:30 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5B500C57B61;
	Fri, 26 Feb 2021 07:03:30 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8E448C57B62
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Feb 2021 07:03:28 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id s23so5555091pji.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Feb 2021 23:03:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ydvIgxOmjmtqfE+xKiN5KcJPEjgA9fZIcPJEUX/WuAM=;
 b=B1UBaSFh2mk74rH1StciX/kRrgwOc+4VAV1DfySJFKUYhoImWg1F/x69MMylGtk5YY
 irFCXgVxF9p8AOhjKWu7vzjoXaYcFjeKszsO+9HyOE23kk/3zNC/0HuFAq7WIl8p3Sj2
 DiFhN3JUeD9rKVTzwk48bdl7jM2MbuKEwoFx8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ydvIgxOmjmtqfE+xKiN5KcJPEjgA9fZIcPJEUX/WuAM=;
 b=msvNv8E5nbN/NBP0OTaDzo6+vRlJFNkC1uIL+oJnGwMXs0BVhhOGNIJBmYWdv68ogj
 qMOjRGOmFC2XfrUhjUIshS4EhSbmw9prAfMczxaih4S1940UDznV8TdvD/whW95MdIdh
 wG1N0Wb9f2BqEkgGnvOC2Uk6XfT87ysbUNuBQ1Uclbr8p6k3GMeG0zj6ZsZf3WuCNoVE
 PfM5OCaAyOrKqEfaFVv1XyDNpMTL1igJ2xtu679ACQ+xxpJEqOSeowXaXDuf9ATgBeml
 6Jbuxm4kIAaV9CEdjiwlF1un0lQQW1CWxL8xSuZnZ1XkFi7JZw7eGlVO5ZVp5/d5Ql4N
 ppdA==
X-Gm-Message-State: AOAM5322lU/PZcLb6YI8+hCjCruCzz2ZdIh5USGZ+zfObxWcgwOheKwa
 v4NOJinA/8jzQVQwBet0hy39QQ==
X-Google-Smtp-Source: ABdhPJw5sSWi/Lr2Jhk69jCnXKBWOfVI+hjw2QCEtcG8QS5n5oApjApq7NeRIFFCdvsWr6uJlONUog==
X-Received: by 2002:a17:902:7006:b029:e3:dd4d:85ac with SMTP id
 y6-20020a1709027006b02900e3dd4d85acmr1755908plk.41.1614323007007; 
 Thu, 25 Feb 2021 23:03:27 -0800 (PST)
Received: from ub-XPS-13-9350.domain.name ([103.161.30.220])
 by smtp.gmail.com with ESMTPSA id f7sm7592156pjh.45.2021.02.25.23.03.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 23:03:26 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Rob Herring <robh+dt@kernel.org>
Date: Fri, 26 Feb 2021 12:32:55 +0530
Message-Id: <20210226070304.8028-2-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210226070304.8028-1-jagan@amarulasolutions.com>
References: <20210226070304.8028-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jagan Teki <jagan@amarulasolutions.com>, linux-amarula@amarulasolutions.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 01/10] dt-bindings: arm: stm32: Add Engicam
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

MicroGEA STM32MP1 is an EDIMM SoM based on STM32MP157A from Engicam.

MicroDev 2.0 is a general purpose miniature carrier board with CAN,
LTE and LVDS panel interfaces.

MicroGEA STM32MP1 needs to mount on top of this MicroDev 2.0 board
for creating complete MicroGEA STM32MP1 MicroDev 2.0 Carrier board.

Add bindings for it.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
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
