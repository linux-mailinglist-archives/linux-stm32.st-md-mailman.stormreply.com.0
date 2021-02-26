Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 108B3325DDE
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Feb 2021 08:03:52 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CDD3EC57B61;
	Fri, 26 Feb 2021 07:03:51 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 853B4C57B59
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Feb 2021 07:03:50 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id w18so5646849pfu.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Feb 2021 23:03:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=D/d2tckrMVKCx/WifVyWum2XtWgDvcfG6jZTIiFStpk=;
 b=HPQRuoGEIWqGl2DIghlM8yyibdziQxu2W9nXbjkJT/Toxlh5BHol8NZchUBIrY3mI7
 zpMlnOtwGXZkVul94RZ/qnEFIpUMTZGvLsp+60760e1XaB2mx2W4ZZQM6A2y0eQwNZVC
 8zUlsMOnAC+ADZBsWhpBTN6QQv355mYhVTmCc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=D/d2tckrMVKCx/WifVyWum2XtWgDvcfG6jZTIiFStpk=;
 b=Fv7gtQGqVAsklnBSDUW4RUh3jTvrthpkEdYq/2NywkdQMugc0IQSY9HhUy98nBJU+Z
 /icpV5Op4OJdRZUsyh7dFdn9Imtn8ZtoAL4Grz4EgibJU+ScvMJ7kP9bY8ipQKw+m75Z
 CmVOrjVfDKs76ek2Ltl3ec7M3amP8+42Dejmu9KAjr85yfGMY+k+k98G1gOju/2nUSzK
 eXjeiEiik+BxCnoO89qZpwQA4Utia3vZO/HABGw+4jB1g6Mg29fNyGTnj7GwR53KgJQo
 Cd9S7Q+o8hfK6YPvOz/BeOwn5C7RQ/hFZPu0RnXyQ3M/rAIJwxK/AznQhLJRMWCEt3UK
 mrmw==
X-Gm-Message-State: AOAM530FTbVBUzqsZ5xau1QLZx0Kpp+5J9XLPi80MmeNk/U7c8JW57UJ
 GSH2ZBQBfXsQdd0vFBsPIimz9Q==
X-Google-Smtp-Source: ABdhPJzpzKTJP4NydabR1Y9PJh1zQsv+pWAx6CRm8aJv29M8B6kKBN6CG5AIai0EiZbYVbE4K1rpdQ==
X-Received: by 2002:a05:6a00:851:b029:1b3:fbb3:faed with SMTP id
 q17-20020a056a000851b02901b3fbb3faedmr1816039pfk.18.1614323029166; 
 Thu, 25 Feb 2021 23:03:49 -0800 (PST)
Received: from ub-XPS-13-9350.domain.name ([103.161.30.220])
 by smtp.gmail.com with ESMTPSA id f7sm7592156pjh.45.2021.02.25.23.03.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 23:03:48 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Rob Herring <robh+dt@kernel.org>
Date: Fri, 26 Feb 2021 12:33:00 +0530
Message-Id: <20210226070304.8028-7-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210226070304.8028-1-jagan@amarulasolutions.com>
References: <20210226070304.8028-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jagan Teki <jagan@amarulasolutions.com>, linux-amarula@amarulasolutions.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 06/10] dt-bindings: arm: stm32: Add Engicam
	i.Core STM32MP1 C.TOUCH 2.0
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

i.Core STM32MP1 is an EDIMM SoM based on STM32MP157A from Engicam.

C.TOUCH 2.0 is a general purpose carrier board with capacitive
touch interface support.

i.Core STM32MP1 needs to mount on top of this Carrier board for
creating complete i.Core STM32MP1 C.TOUCH 2.0 board.

Add bindings for it.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v2:
- new patch

 Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
index 255d3ba50c63..3e45516403ce 100644
--- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
+++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
@@ -65,6 +65,12 @@ properties:
           - const: st,stm32mp157c-ed1
           - const: st,stm32mp157
 
+      - description: Engicam i.Core STM32MP1 SoM based Boards
+        items:
+          - const: engicam,icore-stm32mp1-ctouch2    # STM32MP1 Engicam i.Core STM32MP1 C.TOUCH 2.0
+          - const: engicam,icore-stm32mp1            # STM32MP1 Engicam i.Core STM32MP1 SoM
+          - const: st,stm32mp157
+
       - description: Engicam MicroGEA STM32MP1 SoM based Boards
         items:
           - enum:
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
