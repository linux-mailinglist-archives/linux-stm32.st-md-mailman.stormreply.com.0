Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 87CF0327319
	for <lists+linux-stm32@lfdr.de>; Sun, 28 Feb 2021 16:44:23 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 51F9DC57B6F;
	Sun, 28 Feb 2021 15:44:23 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C2F77C36B37
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 28 Feb 2021 15:44:21 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id e9so9864223pjj.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 28 Feb 2021 07:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=y2r44D+mlU63eqpONY6ZtCXEHeBmJVOHShi6Vj77Qp8=;
 b=qjeVCLpcLxJNtoRnvg6VpGo4yd0Vik283yhpWyslsc2Ex2IdXmNSO943vDnxW671LS
 pmtLU5aZPG9blMVAzgC2T3MvB2Vmw3Y1CV7CkdYqpR70JTyqoFGz6cYFkXNxFc4oMLzh
 6mMyJ818t4rgNp3gzCPFL0YjxyLREZL7CUV6o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y2r44D+mlU63eqpONY6ZtCXEHeBmJVOHShi6Vj77Qp8=;
 b=s8H+2SU8G1YyQBmJMdF1Y12ulhVVHP6/7Xa6u9m2OaRj/SPVKT/XIIh0GFGMbKF7ol
 A9uNr3wzVW3d4TFXwLTXFcfalLeXbVnnqD9kWIkzJucVq6NSQw7O9hQD8Lt8toeH3DEg
 jGVFCZZXY9EpYTzm3ZaXtM3nIEIzpPC8BTJYlPOB/xWAvTSNWzAQM5/pvRP+wpKKDemD
 vRru/yHcoHXTgeVO9hEpB5CcmnNLxeBOgMaOf2kRnLdZoi4uWTy9na77VPkYL51a9qpt
 fgOEYCk/gS2rTKDXP2xJMml34JnraR5sbXJfUiMdwjYjvz/L4uT58dMTayeHgwyNxYm5
 e62w==
X-Gm-Message-State: AOAM533dmQ9pvaIEQe9Cwik6vGLiRbRQGTTyla8toDsJy4DEOAjNhmZS
 Mmh3cxS8+V7X3xLjYGIcT6eFgg==
X-Google-Smtp-Source: ABdhPJwEv08iKd05ZoMnHpQK7jYmGuWwDlfrl9dfUX2nAm4FpZn5eTTV7ys/X6Ma2DX/KuQKAs/+1g==
X-Received: by 2002:a17:903:230b:b029:dd:7cf1:8c33 with SMTP id
 d11-20020a170903230bb02900dd7cf18c33mr11415224plh.31.1614527060455; 
 Sun, 28 Feb 2021 07:44:20 -0800 (PST)
Received: from ub-XPS-13-9350.domain.name ([103.161.30.225])
 by smtp.gmail.com with ESMTPSA id j3sm13522133pgk.24.2021.02.28.07.44.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Feb 2021 07:44:20 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Rob Herring <robh+dt@kernel.org>
Date: Sun, 28 Feb 2021 21:13:22 +0530
Message-Id: <20210228154323.76911-10-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210228154323.76911-1-jagan@amarulasolutions.com>
References: <20210228154323.76911-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jagan Teki <jagan@amarulasolutions.com>, linux-amarula@amarulasolutions.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 09/10] dt-bindings: arm: stm32: Add Engicam
	i.Core STM32MP1 EDIMM2.2 Starter Kit
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

EDIMM2.2 Starter Kit is an EDIMM 2.2 Form Factor Capacitive Evaluation
Board from Engicam.

i.Core STM32MP1 needs to mount on top of this Evaluation board for
creating complete i.Core STM32MP1 EDIMM2.2 Starter Kit.

Add bindings for it.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v3:
- none 

 Documentation/devicetree/bindings/arm/stm32/stm32.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
index 3e45516403ce..01f595b8ae1b 100644
--- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
+++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
@@ -67,7 +67,9 @@ properties:
 
       - description: Engicam i.Core STM32MP1 SoM based Boards
         items:
-          - const: engicam,icore-stm32mp1-ctouch2    # STM32MP1 Engicam i.Core STM32MP1 C.TOUCH 2.0
+          - enum:
+              - engicam,icore-stm32mp1-ctouch2       # STM32MP1 Engicam i.Core STM32MP1 C.TOUCH 2.0
+              - engicam,icore-stm32mp1-edimm2.2      # STM32MP1 Engicam i.Core STM32MP1 EDIMM2.2 Starter Kit
           - const: engicam,icore-stm32mp1            # STM32MP1 Engicam i.Core STM32MP1 SoM
           - const: st,stm32mp157
 
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
