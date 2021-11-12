Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 73BA144E19B
	for <lists+linux-stm32@lfdr.de>; Fri, 12 Nov 2021 06:39:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3AC51C5EC71;
	Fri, 12 Nov 2021 05:39:10 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 01972C5EC72
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Nov 2021 05:39:09 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id
 n15-20020a17090a160f00b001a75089daa3so6419254pja.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Nov 2021 21:39:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=y7lfOFFMzKe+kiTUn4fLEQP7ZxMtSNXXkb4oUnjFYrE=;
 b=Uut0dc0q27gGEIx7ezk23/w2XG4rJfYHhE2oWggCCsYaAnJCBmwLRTj9oX5bmB5rN1
 waLtj6A1dBZwvUCD98FlX59U4XCMDysMvyEwso+d8tyylbljugbujgFEtsXg2HA5UUNX
 ffRsMLCan8qlMSkQRMVAmpE4ARai1Kd0MWCK0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y7lfOFFMzKe+kiTUn4fLEQP7ZxMtSNXXkb4oUnjFYrE=;
 b=kWJtsT8UdFmhm6TnBaMibvG7tGvxqiUrFl2qRLHLCrhSNdUz2yUBYKDrSsubeq+Fit
 agkTXMN52cy9oog/jRMcq5gY9ex83bayp6EgcAW3ch2j9bo/qLBtoHi0Oj21RmM6WkId
 Xzbx19V+DLTPfdtozrgZwzk1lcXtd/MOeKv20cKHNRdzXzeUY4bTlU/IBKPS7rly07fp
 5brez77eGFQKyqVT4B7HI9NfuUXeXiBHaffhLo6e+9GuTDyd0pF9dOVBv9z7ZgFNyD8C
 HA7QjJWHZM32o51O3icvF0gN3MFB/4zWRU0IhaGWdMaGzE5b8vDB/iIYfq7p0z7BP79F
 9Hhw==
X-Gm-Message-State: AOAM533ip9fA66lyw8IdNJCgqbINNEx9n1FX83T2DlrPRle/PNQXvQlQ
 E92/YHhQT2GHAtLqxFNXolKSGjjFMoYkpw==
X-Google-Smtp-Source: ABdhPJxvpPfjHFmX6h1llLBSmbiKNzUM2EMJL/tdlZxM0sd1VXO3uhl5VV3vwQ5PPsM+cP3kzXCxGg==
X-Received: by 2002:a17:902:ec8f:b0:142:11aa:3974 with SMTP id
 x15-20020a170902ec8f00b0014211aa3974mr5227566plg.30.1636695547706; 
 Thu, 11 Nov 2021 21:39:07 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a0a9:de19:8cdf:97cf:a6b1])
 by smtp.gmail.com with ESMTPSA id v38sm3764345pgl.38.2021.11.11.21.39.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Nov 2021 21:39:07 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Fri, 12 Nov 2021 11:08:55 +0530
Message-Id: <20211112053856.18412-2-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211112053856.18412-1-jagan@amarulasolutions.com>
References: <20211112053856.18412-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Matteo Lisi <matteo.lisi@engicam.com>,
 Jagan Teki <jagan@amarulasolutions.com>, linux-amarula@amarulasolutions.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 2/3] dt-bindings: arm: stm32: Add Engicam
	i.Core STM32MP1 C.TOUCH 2.0 10.1" OF
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

10.1" OF is a capacitive touch 10.1" Open Frame panel solutions.

i.Core STM32MP1 needs to mount on top of C.TOUCH 2.0 carrier with
pluged 10.1" OF for creating complete i.Core STM32MP1 C.TOUCH 2.0
10.1" Open Frame board.

Add bindings for it.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v2:
- Fix line-length warning 

 Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
index bcaf7be3ab37..b07720ea9611 100644
--- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
+++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
@@ -77,6 +77,7 @@ properties:
         items:
           - enum:
               - engicam,icore-stm32mp1-ctouch2       # STM32MP1 Engicam i.Core STM32MP1 C.TOUCH 2.0
+              - engicam,icore-stm32mp1-ctouch2-of10  # STM32MP1 Engicam i.Core STM32MP1 C.TOUCH 2.0 10.1" OF
               - engicam,icore-stm32mp1-edimm2.2      # STM32MP1 Engicam i.Core STM32MP1 EDIMM2.2 Starter Kit
           - const: engicam,icore-stm32mp1            # STM32MP1 Engicam i.Core STM32MP1 SoM
           - const: st,stm32mp157
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
