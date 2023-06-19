Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0123F735C7A
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Jun 2023 18:55:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BC428C6B454;
	Mon, 19 Jun 2023 16:55:51 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9F1BFC6B442
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Jun 2023 16:55:50 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id
 af79cd13be357-763a2e39b88so63220285a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Jun 2023 09:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1687193749; x=1689785749;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HXhpNMq77ixD+XgN0GcYbuylNiGuY9CxnraNzjgz9ZY=;
 b=PouTpA+2eidqrl2NfeWbcV1LWEd+x0sWxTYQqZBmR29e20+aBqMcRvmbdsZHxk/2Kq
 RlWwI7B6oc4NIV+fZrj9r54OOU1KWGPD93E/gAX81LmHhbzAz0pjOmQ9MyzQOqhaQ325
 8/nMG/HMKeVZlzv/TM7cOrnvPqkTZAVZWRW5c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687193749; x=1689785749;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HXhpNMq77ixD+XgN0GcYbuylNiGuY9CxnraNzjgz9ZY=;
 b=YCqOePLtyfc7RQy16i1LnowgijoRu7RstPkSEX1hJi9sNtkl7gvKA6MocurGg6x4m/
 m7pAd7fyYDB4SKB5LKELbmw8TgW35EE6zxKaSE8aNwKXMafoZY9WKZW1cyNKmpicrtY5
 JuV4KaMjiXE911Rgrx4gleFfwXDYhIR82KCXtFsdiDWwJ/qws4C7qr2Fgfbn8rCmjs9v
 Dr37y80X0OGO/168Giyd1r5/kZ0j4XELCf/j6+508zLAhuWbVJM4gWtEq3sRPxmmuyDh
 trpk24pZB1wxabbX/LWcQ2UJraPEjVMRaRMHXVFdifda56zWBhYdXI3ZAVdbgf4DPJUX
 c4xA==
X-Gm-Message-State: AC+VfDzRorMBu5EE5kUsUbJOp3WiYptdgW3EbbW7p39G64jguYQ/EmyE
 i5hnJmukvvr6+eUSQdy77LhO4g==
X-Google-Smtp-Source: ACHHUZ6AP48wP9d8GIHmSV3eR8tx7WohjgeTcIWdUh34I5pP/yusbF5PhwUo6SmU/aUFLMfgqX8keg==
X-Received: by 2002:a05:620a:cd2:b0:762:52a1:4687 with SMTP id
 b18-20020a05620a0cd200b0076252a14687mr4387025qkj.22.1687193749648; 
 Mon, 19 Jun 2023 09:55:49 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.pdxnet.pdxeng.ch
 (host-79-25-27-4.retail.telecomitalia.it. [79.25.27.4])
 by smtp.gmail.com with ESMTPSA id
 p23-20020a05620a15f700b0075d49ce31c3sm109103qkm.91.2023.06.19.09.55.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jun 2023 09:55:49 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Mon, 19 Jun 2023 18:55:23 +0200
Message-Id: <20230619165525.1035243-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20230619165525.1035243-1-dario.binacchi@amarulasolutions.com>
References: <20230619165525.1035243-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 David Airlie <airlied@gmail.com>, Yannick Fertre <yannick.fertre@foss.st.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 michael@amarulasolutions.com,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 4/6] dt-bindings: display: stm32-ltdc: add
	optional st, fb-bpp property
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

Boards that use the STM32F{4,7} series have limited amounts of RAM. The
added property allows to size, within certain limits, the memory footprint
required by the framebuffer.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 .../devicetree/bindings/display/st,stm32-ltdc.yaml          | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/st,stm32-ltdc.yaml b/Documentation/devicetree/bindings/display/st,stm32-ltdc.yaml
index d6ea4d62a2cf..1c3a3653579f 100644
--- a/Documentation/devicetree/bindings/display/st,stm32-ltdc.yaml
+++ b/Documentation/devicetree/bindings/display/st,stm32-ltdc.yaml
@@ -42,6 +42,12 @@ properties:
       - for internal dpi input of the MIPI DSI host controller.
       Note: These 2 endpoints cannot be activated simultaneously.
 
+  st,fb-bpp:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      bit depth of framebuffer (8, 16 or 32)
+    maxItems: 1
+
 required:
   - compatible
   - reg
-- 
2.32.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
