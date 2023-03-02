Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6386E6A8668
	for <lists+linux-stm32@lfdr.de>; Thu,  2 Mar 2023 17:32:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 01362C6A601;
	Thu,  2 Mar 2023 16:32:19 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CF808C6A5FE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 Mar 2023 13:35:44 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id s11so3682312edy.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 02 Mar 2023 05:35:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677764144;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Yf0MtNAXJR5sVHoDdZUb8vL+9/OJhXtHzJtQPPYmfMs=;
 b=DcqS7t4f8C7YXe9qA9b023TC/KQa23JP80zD6x99lNkqgnAUVcaBeTkTTAzvUn+kNE
 OXcDjv55WZwrX3G+2guV57T8ScuRdsVAktXwwzDwQatGS4TmdXsQhYkA1v0YzYXvC4ew
 nuORNmqbYsoXRQgLeNh+tB3AiQyvm+6CFMICcHK+NJ9hdda1QeqKAoImPOG4PSKi3xFc
 ERlANB7GZV6M7lrzofS5p67IYszjvhmZ23Xel4oejt46jCEsUFExnqK7F9cmULqydUwJ
 GahAZ8c1rdjws95m1ZvcZRwhqcK4jvcXT0tRkexs19ZWZlV2SMuNmA3aCMeMubk15w30
 xTIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677764144;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Yf0MtNAXJR5sVHoDdZUb8vL+9/OJhXtHzJtQPPYmfMs=;
 b=mJ/RrxUrZd7Dybfuxq3gT31YpkVdaJrScFZbRoEMtjfpFD0Iacjt1WFj3drsAs2sYk
 cduZIP2UbDQyUuEXBMfOLUFRP+WPmdGSoXU6L767f+PqTo/Oqj2VDztObheyTtczeKfI
 qk2K8rnQ9r3AsPqXz0vZbkpmEJyUgNNVG4/PSRp5RC0E2G4wm0KQXtfGQzo0d7bu8e8O
 2vb01TK34eHek3Q6uTMrXM112c1BayL0v5l+29ha76xzo11aALFH6P45db016xnsOKaM
 bFHU8y+tM8Lmvv8PfitsQIJVwKOOlkYv02lfd7YzqcZdde3VzkgGmAPglQT8WBsZH1Sd
 2E8Q==
X-Gm-Message-State: AO0yUKVy6MHrunvWTrhtNpSbk9X5cMlk4wum4E2w5QDpIz4Xpg1GhSl/
 ffnuIU6LHc/++uiRrPenJDM=
X-Google-Smtp-Source: AK7set+tqNctmfdtXnkHqCokcKpzLNkCvdOXorc3HJXnrnmzL61/Ua+XESxTzkZ7Eairo+enHtTY1Q==
X-Received: by 2002:a17:906:6445:b0:8f7:48fe:319d with SMTP id
 l5-20020a170906644500b008f748fe319dmr2016089ejn.17.1677764144306; 
 Thu, 02 Mar 2023 05:35:44 -0800 (PST)
Received: from localhost.localdomain ([95.183.227.97])
 by smtp.gmail.com with ESMTPSA id
 a26-20020a170906191a00b008e56a0d546csm7011833eje.123.2023.03.02.05.35.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 05:35:43 -0800 (PST)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Date: Thu,  2 Mar 2023 16:35:28 +0300
Message-Id: <20230302133528.124113-1-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 02 Mar 2023 16:32:17 +0000
Cc: devicetree@vger.kernel.org, Yassine Oudjana <y.oudjana@protonmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org,
 Yassine Oudjana <yassine.oudjana@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] dt-bindings: display: mediatek: Compatible
	list cleanup
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

From: Yassine Oudjana <y.oudjana@protonmail.com>

Several DT bindings of MediaTek display blocks make unnecessary use of
"oneOf" and "items", and have some enums with only 1 element. Remove
unnecessary "oneOf" and "items", and replace enums that have 1 element
with "const".	

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
---
 .../bindings/display/mediatek/mediatek,aal.yaml  |  3 +--
 .../display/mediatek/mediatek,ccorr.yaml         | 10 ++++------
 .../display/mediatek/mediatek,color.yaml         | 10 ++++------
 .../display/mediatek/mediatek,dither.yaml        |  3 +--
 .../bindings/display/mediatek/mediatek,dsc.yaml  |  4 +---
 .../display/mediatek/mediatek,gamma.yaml         |  7 +++----
 .../display/mediatek/mediatek,merge.yaml         |  8 +++-----
 .../bindings/display/mediatek/mediatek,od.yaml   |  8 +++-----
 .../display/mediatek/mediatek,ovl-2l.yaml        | 10 ++++------
 .../bindings/display/mediatek/mediatek,ovl.yaml  | 16 ++++++----------
 .../display/mediatek/mediatek,postmask.yaml      |  3 +--
 .../bindings/display/mediatek/mediatek,rdma.yaml | 13 +++++--------
 .../display/mediatek/mediatek,split.yaml         |  4 +---
 .../bindings/display/mediatek/mediatek,ufoe.yaml |  4 +---
 .../bindings/display/mediatek/mediatek,wdma.yaml |  4 +---
 15 files changed, 39 insertions(+), 68 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
index 92741486c24d..d8d78abd6c6c 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
@@ -25,8 +25,7 @@ properties:
           - mediatek,mt8173-disp-aal
           - mediatek,mt8183-disp-aal
       - items:
-          - enum:
-              - mediatek,mt2712-disp-aal
+          - const: mediatek,mt2712-disp-aal
           - const: mediatek,mt8173-disp-aal
       - items:
           - enum:
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
index b04820c95b22..e72d2884bb49 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
@@ -21,18 +21,16 @@ description: |
 properties:
   compatible:
     oneOf:
-      - items:
-          - const: mediatek,mt8183-disp-ccorr
-      - items:
-          - const: mediatek,mt8192-disp-ccorr
+      - enum:
+          - mediatek,mt8183-disp-ccorr
+          - mediatek,mt8192-disp-ccorr
       - items:
           - enum:
               - mediatek,mt8188-disp-ccorr
               - mediatek,mt8195-disp-ccorr
           - const: mediatek,mt8192-disp-ccorr
       - items:
-          - enum:
-              - mediatek,mt8186-disp-ccorr
+          - const: mediatek,mt8186-disp-ccorr
           - const: mediatek,mt8192-disp-ccorr
 
   reg:
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
index 62306c88f485..d0ea77fc4b06 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
@@ -22,12 +22,10 @@ description: |
 properties:
   compatible:
     oneOf:
-      - items:
-          - const: mediatek,mt2701-disp-color
-      - items:
-          - const: mediatek,mt8167-disp-color
-      - items:
-          - const: mediatek,mt8173-disp-color
+      - enum:
+          - mediatek,mt2701-disp-color
+          - mediatek,mt8167-disp-color
+          - mediatek,mt8173-disp-color
       - items:
           - enum:
               - mediatek,mt7623-disp-color
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
index 5c7445c174e5..9d74de63fe63 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
@@ -22,8 +22,7 @@ description: |
 properties:
   compatible:
     oneOf:
-      - items:
-          - const: mediatek,mt8183-disp-dither
+      - const: mediatek,mt8183-disp-dither
       - items:
           - enum:
               - mediatek,mt8186-disp-dither
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml
index 49248864514b..37bf6bf4a1ab 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml
@@ -19,9 +19,7 @@ description: |
 
 properties:
   compatible:
-    oneOf:
-      - items:
-          - const: mediatek,mt8195-disp-dsc
+    const: mediatek,mt8195-disp-dsc
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
index a5c6a91fac71..6c2be9d6840b 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
@@ -21,10 +21,9 @@ description: |
 properties:
   compatible:
     oneOf:
-      - items:
-          - const: mediatek,mt8173-disp-gamma
-      - items:
-          - const: mediatek,mt8183-disp-gamma
+      - enum:
+          - mediatek,mt8173-disp-gamma
+          - mediatek,mt8183-disp-gamma
       - items:
           - enum:
               - mediatek,mt8186-disp-gamma
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
index 69ba75777dac..c474ee6fa05b 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
@@ -20,11 +20,9 @@ description: |
 
 properties:
   compatible:
-    oneOf:
-      - items:
-          - const: mediatek,mt8173-disp-merge
-      - items:
-          - const: mediatek,mt8195-disp-merge
+    enum:
+      - mediatek,mt8173-disp-merge
+      - mediatek,mt8195-disp-merge
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,od.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,od.yaml
index 853fcb9db2be..7e6bbf8b5c60 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,od.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,od.yaml
@@ -20,11 +20,9 @@ description: |
 
 properties:
   compatible:
-    oneOf:
-      - items:
-          - const: mediatek,mt2712-disp-od
-      - items:
-          - const: mediatek,mt8173-disp-od
+    enum:
+      - mediatek,mt2712-disp-od
+      - mediatek,mt8173-disp-od
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml
index 4e94f4e947ad..16944a817d63 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml
@@ -21,13 +21,11 @@ description: |
 properties:
   compatible:
     oneOf:
+      - enum:
+          - mediatek,mt8183-disp-ovl-2l
+          - mediatek,mt8192-disp-ovl-2l
       - items:
-          - const: mediatek,mt8183-disp-ovl-2l
-      - items:
-          - const: mediatek,mt8192-disp-ovl-2l
-      - items:
-          - enum:
-              - mediatek,mt8186-disp-ovl-2l
+          - const: mediatek,mt8186-disp-ovl-2l
           - const: mediatek,mt8192-disp-ovl-2l
 
   reg:
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
index 065e526f950e..c606cfb3f834 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
@@ -21,14 +21,11 @@ description: |
 properties:
   compatible:
     oneOf:
-      - items:
-          - const: mediatek,mt2701-disp-ovl
-      - items:
-          - const: mediatek,mt8173-disp-ovl
-      - items:
-          - const: mediatek,mt8183-disp-ovl
-      - items:
-          - const: mediatek,mt8192-disp-ovl
+      - enum:
+          - mediatek,mt2701-disp-ovl
+          - mediatek,mt8173-disp-ovl
+          - mediatek,mt8183-disp-ovl
+          - mediatek,mt8192-disp-ovl
       - items:
           - enum:
               - mediatek,mt7623-disp-ovl
@@ -40,8 +37,7 @@ properties:
               - mediatek,mt8195-disp-ovl
           - const: mediatek,mt8183-disp-ovl
       - items:
-          - enum:
-              - mediatek,mt8186-disp-ovl
+          - const: mediatek,mt8186-disp-ovl
           - const: mediatek,mt8192-disp-ovl
 
   reg:
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,postmask.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,postmask.yaml
index 27de64495401..12ec410bb921 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,postmask.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,postmask.yaml
@@ -21,8 +21,7 @@ description: |
 properties:
   compatible:
     oneOf:
-      - items:
-          - const: mediatek,mt8192-disp-postmask
+      - const: mediatek,mt8192-disp-postmask
       - items:
           - enum:
               - mediatek,mt8186-disp-postmask
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
index 3ade2ece3fed..42059efad45d 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
@@ -23,14 +23,11 @@ description: |
 properties:
   compatible:
     oneOf:
-      - items:
-          - const: mediatek,mt2701-disp-rdma
-      - items:
-          - const: mediatek,mt8173-disp-rdma
-      - items:
-          - const: mediatek,mt8183-disp-rdma
-      - items:
-          - const: mediatek,mt8195-disp-rdma
+      - enum:
+          - mediatek,mt2701-disp-rdma
+          - mediatek,mt8173-disp-rdma
+          - mediatek,mt8183-disp-rdma
+          - mediatek,mt8195-disp-rdma
       - items:
           - enum:
               - mediatek,mt8188-disp-rdma
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml
index 35ace1f322e8..54b7b0531144 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml
@@ -20,9 +20,7 @@ description: |
 
 properties:
   compatible:
-    oneOf:
-      - items:
-          - const: mediatek,mt8173-disp-split
+    const: mediatek,mt8173-disp-split
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml
index b8bb135fe96b..87523b45a210 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml
@@ -21,9 +21,7 @@ description: |
 
 properties:
   compatible:
-    oneOf:
-      - items:
-          - const: mediatek,mt8173-disp-ufoe
+    const: mediatek,mt8173-disp-ufoe
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
index 7d7cc1ab526b..52f233fe1c0f 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
@@ -20,9 +20,7 @@ description: |
 
 properties:
   compatible:
-    oneOf:
-      - items:
-          - const: mediatek,mt8173-disp-wdma
+    const: mediatek,mt8173-disp-wdma
 
   reg:
     maxItems: 1
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
