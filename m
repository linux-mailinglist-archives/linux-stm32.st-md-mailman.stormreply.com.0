Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C1D5E950F
	for <lists+linux-stm32@lfdr.de>; Sun, 25 Sep 2022 19:52:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 226C6C63326;
	Sun, 25 Sep 2022 17:52:20 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1F185C62D6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 25 Sep 2022 17:52:18 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id z97so6257396ede.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 25 Sep 2022 10:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=J2VF+CVrD0zwhwpgo2IClFZHFW9id6lzY2L2M6stUmY=;
 b=IsEpv7BgRFwftZUui15I0mMWTntFwLZkJSM+RARbYH7mZGdi13p/E+p1fU9pkBBHth
 XL+J79BxWf4L1jEQVEVSHJo8tvUxQ/vvQ/D6wlOF15Y8UGfOr89A9F0exomuZEr++WJB
 8F7nNNpVBvnIvRRvAM8o1pnahIOIohEu5tgXw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=J2VF+CVrD0zwhwpgo2IClFZHFW9id6lzY2L2M6stUmY=;
 b=uuAKVvcgI9C77wTGCVIWZM9O7G6QWkKTApTkL9gwSKDjXU3TbySdZfRbHgticRUXVK
 FalVLujuDNdzKcNi9gkl3ST2SDkGUl+5/hXwpU4Ga6tCHbvZZdV4wdST+6DaZjuRuJtC
 ykOlMNk9ZN8k4sIvftrJqjZefWTdSaw4vb+JyLFrAGxOIL7EfOOAG4zh6Hx9VWg8sQ9J
 PpqINnGLczg9p42/ZGEtH583xCZzPZFmKE+gFeKHEv+zMQGYOt56kqzphvnL+SaVj0gc
 S68JySUbhp78mNDBs0qFrDcLLT4KduLfu5u/FeMftOzWyJ37TzNVyQe33WX5l0fR5L9x
 EDjw==
X-Gm-Message-State: ACrzQf27Q0vsLYld7WInAxRS8DdqWfZaDLzWecAgBdxgRCN0LMzC5G1t
 g2S0gBDeIyjqTA5V6IeDPLx1EQ==
X-Google-Smtp-Source: AMsMyM5s6+LACyNZPTjH1y8ENlpRtfJB3mfaurWNLgjZLo8JJvwWdIRNeyv5qlC9mGhl6V9pwajALg==
X-Received: by 2002:aa7:d5cc:0:b0:456:f5f1:540 with SMTP id
 d12-20020aa7d5cc000000b00456f5f10540mr8364812eds.95.1664128337888; 
 Sun, 25 Sep 2022 10:52:17 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-95-232-92-192.retail.telecomitalia.it. [95.232.92.192])
 by smtp.gmail.com with ESMTPSA id
 f23-20020a056402161700b0045703d699b9sm3252594edv.78.2022.09.25.10.52.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Sep 2022 10:52:17 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Sun, 25 Sep 2022 19:52:05 +0200
Message-Id: <20220925175209.1528960-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220925175209.1528960-1-dario.binacchi@amarulasolutions.com>
References: <20220925175209.1528960-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, devicetree@vger.kernel.org,
 Lee Jones <lee.jones@linaro.org>, linux-stm32@st-md-mailman.stormreply.com,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 michael@amarulasolutions.com,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Subject: [Linux-stm32] [RFC PATCH v4 1/5] dt-bindings: arm: stm32: add
	compatible for syscon gcan node
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

Since commit ad440432d1f9 ("dt-bindings: mfd: Ensure 'syscon' has a
more specific compatible")
It is required to provide at least 2 compatibles string for syscon node.
This patch documents the new compatible for stm32f4 SoC to support
global/shared CAN registers access for bxCAN controllers.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 .../devicetree/bindings/arm/stm32/st,stm32-syscon.yaml          | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
index 6f846d69c5e1..8646350dac44 100644
--- a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
+++ b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
@@ -20,6 +20,7 @@ properties:
               - st,stm32-syscfg
               - st,stm32-power-config
               - st,stm32-tamp
+              - st,stm32f4-gcan
           - const: syscon
       - items:
           - const: st,stm32-tamp
@@ -42,6 +43,7 @@ if:
       contains:
         enum:
           - st,stm32mp157-syscfg
+          - st,stm32f4-gcan
 then:
   required:
     - clocks
-- 
2.32.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
