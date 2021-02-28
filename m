Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 450EB327316
	for <lists+linux-stm32@lfdr.de>; Sun, 28 Feb 2021 16:44:11 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EF298C57189;
	Sun, 28 Feb 2021 15:44:10 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B9BFAC36B37
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 28 Feb 2021 15:44:09 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id x29so1565478pgk.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 28 Feb 2021 07:44:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rm+iWIkQsOJXa+GFU3e3XMxFTQJDqaymZnY4YDsrYw8=;
 b=QCiiXcBMZPgqhQE6cp1APbZ7+JeRtahxDRaJ+GgOzOmsPECn+MNgO7CWxM4eKtd3ZR
 j3KlLyNNs8KO15EElx7Gk+oB3rxldX7MLuVy4OClIWa2Zp175eOSeJF+p5ZSBPoEPCOu
 PzRELASivO76sq3POy4laLzy1077DgxR4uTHg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rm+iWIkQsOJXa+GFU3e3XMxFTQJDqaymZnY4YDsrYw8=;
 b=mUjOXnPOrhwFzTB1fLNBcABev+PJknbKnvjFTMYhpwKYKSz7QOP2EC9WTg8oA/2AqB
 RGpY26ESjPdwGiAAg6yOP83RZciWxZsyMBDwQBmZPa4SlKPqSgLPRmw3RFuMkp47wIl6
 d3KLDq3bhqc18QoR4LQwXPfLzIPaDTYRLl0K5vuid12fLtxBw2Yl/Fi82mCznH974rMW
 0kQs8mj/pXdnDgcmuOpj7xkol3z3shELZmcY06hi19uErTeG3XImyb84xl3LHdLWG2n0
 t9QBzHuEY1m5Zm10Axetu3j5ynM6+nsRrk99h4v+JFvWpljENbDgLbOiVpHlqpdjt9Jn
 0skg==
X-Gm-Message-State: AOAM532WNMk5FzB2TQb2PujuEYySrmijAiEa7NF8rYCXfu9uRFMZ01ds
 eUGSnfS9bUhOmlwfG/NDlHyBQQ==
X-Google-Smtp-Source: ABdhPJxGafeYO4tUzo5x+Qi+nANpC3U6auTbK1GTueLh4C1TM/nibUaetvyyjsesUnCYDBYjNPjMGg==
X-Received: by 2002:a62:b416:0:b029:1e4:fb5a:55bb with SMTP id
 h22-20020a62b4160000b02901e4fb5a55bbmr11076393pfn.80.1614527048358; 
 Sun, 28 Feb 2021 07:44:08 -0800 (PST)
Received: from ub-XPS-13-9350.domain.name ([103.161.30.225])
 by smtp.gmail.com with ESMTPSA id j3sm13522133pgk.24.2021.02.28.07.44.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Feb 2021 07:44:08 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Rob Herring <robh+dt@kernel.org>
Date: Sun, 28 Feb 2021 21:13:19 +0530
Message-Id: <20210228154323.76911-7-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210228154323.76911-1-jagan@amarulasolutions.com>
References: <20210228154323.76911-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jagan Teki <jagan@amarulasolutions.com>, linux-amarula@amarulasolutions.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 06/10] dt-bindings: arm: stm32: Add Engicam
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
Changes for v3:
- none 

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
