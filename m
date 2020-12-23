Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0BB2E20B8
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Dec 2020 20:16:11 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DDBAFC57183;
	Wed, 23 Dec 2020 19:16:10 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 13039C5660F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Dec 2020 19:16:09 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id g15so175407pgu.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Dec 2020 11:16:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ag3dXPpRmREq+I8glreHKVpu+9jqPPChbXkwaws6NbE=;
 b=hL/058JHlypBZDHvEe+eekdzuWVpsJ41/lnrT70OER3no53a69JSe99X/YfWK3OkP2
 aqT4FdoQmjRF/SMZ+8BTQcD8Tk+7P89l5RtlulZWRLN4dzXJqqKnwUVCJxQ+rRxFROuq
 7HaytpoCpIydIigQNMTRIOs4BbsiKzxr7dbt8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ag3dXPpRmREq+I8glreHKVpu+9jqPPChbXkwaws6NbE=;
 b=ftr1t2TAxp2qV63qtA1iHMerotOehTgnfa7CCArLtMbGLmfUpTdniLdxKhq19Brt0I
 Ek8sfiBV87DDimfNyEcQNFJZaJHdLrpbox+NVNBKQRSpJPJml20W2sTxFUd0Xtyetrqb
 MsGL1lbWKaWqRhTF+cANbivaH5gMk5EIQ2+UDum1zefNjqKhQOf5MtsSE3KLK4PtvtDq
 QyhX/050sZlVKDAaeI0liiSrotlY+Hh1JVWdeSATX95WYsR6DCWOilb4jD6/2zaifIwz
 M6youQow7BBKCsi29BgcBRs0VNROpTyTK9EN58HTVYDE9urAbn4QBEous/LJMS7b34aD
 HHtQ==
X-Gm-Message-State: AOAM533EoBoJfUE0azhTgq8q6GqDtKlmeI2O5Ztto9HELkaEdXSu1EXC
 yQAp1AN5gc7AskAGTw6+jjOyEQ==
X-Google-Smtp-Source: ABdhPJzCNa4w84pm49MnxQ3LnfJjvkvDh+ORDt6f8bKAUE2KpoT+FQGvxo1RB99ZzFn7ssetFazWqw==
X-Received: by 2002:a05:6a00:7c5:b029:19e:2965:7a6 with SMTP id
 n5-20020a056a0007c5b029019e296507a6mr25309563pfu.60.1608750967615; 
 Wed, 23 Dec 2020 11:16:07 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a884:29f0:6e54:608c:e1b9])
 by smtp.gmail.com with ESMTPSA id i2sm397640pjd.21.2020.12.23.11.15.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Dec 2020 11:16:07 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Rob Herring <robh+dt@kernel.org>
Date: Thu, 24 Dec 2020 00:43:58 +0530
Message-Id: <20201223191402.378560-2-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201223191402.378560-1-jagan@amarulasolutions.com>
References: <20201223191402.378560-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jagan Teki <jagan@amarulasolutions.com>, linux-amarula@amarulasolutions.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/5] dt-bindings: arm: stm32: Add Engicam
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
