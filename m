Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E60A47C009
	for <lists+linux-stm32@lfdr.de>; Tue, 21 Dec 2021 13:51:59 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4223DC5E2D4;
	Tue, 21 Dec 2021 12:51:59 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com
 [209.85.219.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EF4A4C5E2C3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Dec 2021 12:51:57 +0000 (UTC)
Received: by mail-qv1-f41.google.com with SMTP id kk22so12333048qvb.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Dec 2021 04:51:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CXUVbYOFX+qNt7zC1+Gzh0+PjSFhu0u9+OwdjiLHOzQ=;
 b=UJRyU/CSOSo4FW1JHkICm91S5AAZl0cyDSajGwejRa+c69+ET8ml/hNN45a7x2O2xp
 3UUfFYtTl7lOOfEsrpYY+m5WWT6DYzcaybdfsgCfDLUG9j0f4wh0+1BJlw1GZw+jo7bA
 litxXgfn2ytNz/mRE+T64ubenrG9Pf0vBD+zOpOPBzF7+ZdCiM+3DDEr2DdDaSmpLKd9
 SsUlCM/dwhWjYwEpx1XfEcGxmGlxYgYrTgAT5WMcJTfh9Ldrxmxlq4uztVHJUgptCtir
 ECoVeMaI/FKKK5VNdr05w/cMlR3jY2OVVLocm2Cidr5z2Im7gA/cdncxUC4Zn2bLWFbs
 Xgxw==
X-Gm-Message-State: AOAM533MjzhlX4qSF4z3HOp0aVEHpNbeenDc3QCBnGGRAToMm2zfPlEa
 Jw4O3xS1wWCRD9VrVCUXzw==
X-Google-Smtp-Source: ABdhPJzo1zRafFgA1Rs/dx78OvoHKnIPrB8GViOOzCeTRGNIK14UPySnci9L369mX/rxt06+xfJBpg==
X-Received: by 2002:a05:6214:20af:: with SMTP id
 15mr2236132qvd.95.1640091116951; 
 Tue, 21 Dec 2021 04:51:56 -0800 (PST)
Received: from xps15.. ([24.55.105.145])
 by smtp.googlemail.com with ESMTPSA id f21sm16840871qte.52.2021.12.21.04.51.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 04:51:56 -0800 (PST)
From: Rob Herring <robh@kernel.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>
Date: Tue, 21 Dec 2021 08:51:45 -0400
Message-Id: <20211221125145.1195234-1-robh@kernel.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH] dt-bindings: display: st,
	stm32-dsi: Fix panel node name in example
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

With 'unevaluatedProperties' support enabled, the st,stm32-dsi binding
has a new warning:

Documentation/devicetree/bindings/display/st,stm32-dsi.example.dt.yaml: dsi@5a000000: Unevaluated properties are not allowed ('panel-dsi@0' was unexpected)

The documented child node name is 'panel', so update the example.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/display/st,stm32-dsi.yaml | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/st,stm32-dsi.yaml b/Documentation/devicetree/bindings/display/st,stm32-dsi.yaml
index ce1ef93cce93..54f67cb51040 100644
--- a/Documentation/devicetree/bindings/display/st,stm32-dsi.yaml
+++ b/Documentation/devicetree/bindings/display/st,stm32-dsi.yaml
@@ -110,7 +110,7 @@ examples:
               };
         };
 
-        panel-dsi@0 {
+        panel@0 {
               compatible = "orisetech,otm8009a";
               reg = <0>;
               reset-gpios = <&gpioe 4 GPIO_ACTIVE_LOW>;
@@ -125,4 +125,3 @@ examples:
     };
 
 ...
-
-- 
2.32.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
