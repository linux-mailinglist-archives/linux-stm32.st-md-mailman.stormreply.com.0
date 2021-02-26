Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D9FB9325DDC
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Feb 2021 08:03:43 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A5069C57B61;
	Fri, 26 Feb 2021 07:03:43 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E63E7C36B37
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Feb 2021 07:03:41 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id e9so5558884pjj.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Feb 2021 23:03:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aGJzdazEBAezDI/x/kli8lfPFd2whfsSNnz3lbP2G6Q=;
 b=SkvveucUnpwE1M1hka/l+cUi84iB++hyRkY7GhDNwqjas/U7pPVuPX1pv/PJNTv5oi
 P8Vri/a8t9fyVCnw+E8sO5Avo6wOrXlJgcMEgs+gwXPKjTt6SCnP98MRMQ+0eh8PmhCk
 R102uFGs1EHJBkFkkVsr5pr52tR+gi31gbJtI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aGJzdazEBAezDI/x/kli8lfPFd2whfsSNnz3lbP2G6Q=;
 b=RYD9UZ/Q+fAhiEdjEp7utrOBtR+BdaZmtmUAb0WhuZNTEzOS0AFE+HcxNKbnUY0gPz
 peYjdR17akSwFM/ixJm0gCw2RqRv+odykvXzYBhLn/ZpktgDKRfAQu2GcUbNOrP80JTz
 2YdF3LkoZ9d1tSlCHj5Z6MnB/gBS/Co6nOXXnnttqx6ogUroVJ/+KfIlVX5ZdRxVKDLh
 5HtQbY9iZSDR3JgSSkPzUHH+xKOrBrILoKNoIPr8Rrf25sOjSpMQDzWETbEzUXmsFcov
 wCk7Lu7n8aznPrq77WQbC2rb0R8so9kteH2LGp/NmZ/GRiYTpNCduN4pbzYDFVT56AM4
 q36Q==
X-Gm-Message-State: AOAM532uBqVzK2ugm13fNICy/kK54F8LC1yQtiGfi8lkrywnt+55PYXM
 OTcFOCEZiYkpdQKd9EY1dt/LTA==
X-Google-Smtp-Source: ABdhPJyGhov9zAa2nevNnKEke0RgyaXb5GJd1RqtnKVBRO2Q2cBgHJ78UHhcn2etB4Nk3CGbS0yKbw==
X-Received: by 2002:a17:902:9304:b029:e4:12f4:bdb0 with SMTP id
 bc4-20020a1709029304b02900e412f4bdb0mr1969411plb.55.1614323020492; 
 Thu, 25 Feb 2021 23:03:40 -0800 (PST)
Received: from ub-XPS-13-9350.domain.name ([103.161.30.220])
 by smtp.gmail.com with ESMTPSA id f7sm7592156pjh.45.2021.02.25.23.03.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 23:03:40 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Rob Herring <robh+dt@kernel.org>
Date: Fri, 26 Feb 2021 12:32:58 +0530
Message-Id: <20210226070304.8028-5-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210226070304.8028-1-jagan@amarulasolutions.com>
References: <20210226070304.8028-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 linux-kernel@vger.kernel.org, Jagan Teki <jagan@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 04/10] dt-bindings: arm: stm32: Add Engicam
	MicroGEA STM32MP1 MicroDev 2.0 7" OF
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

7" OF is a capacitive touch 7" Open Frame panel solutions.

MicroGEA STM32MP1 needs to mount on top of MicroDev 2.0 board with
pluged 7" OF for creating complete MicroGEA STM32MP1 MicroDev 2.0
7" Open Frame Solution board.

Add bindings for it.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v2:
- collect a-b 

 Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
index 56b7e0b800b3..255d3ba50c63 100644
--- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
+++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
@@ -67,7 +67,9 @@ properties:
 
       - description: Engicam MicroGEA STM32MP1 SoM based Boards
         items:
-          - const: engicam,microgea-stm32mp1-microdev2.0
+          - enum:
+              - engicam,microgea-stm32mp1-microdev2.0
+              - engicam,microgea-stm32mp1-microdev2.0-of7
           - const: engicam,microgea-stm32mp1
           - const: st,stm32mp157
 
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
