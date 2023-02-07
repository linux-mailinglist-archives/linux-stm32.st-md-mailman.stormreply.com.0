Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DFFE68D56E
	for <lists+linux-stm32@lfdr.de>; Tue,  7 Feb 2023 12:29:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6359CC6A5E9;
	Tue,  7 Feb 2023 11:29:57 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E87B5C6A5E8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Feb 2023 11:29:55 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 bg13-20020a05600c3c8d00b003d9712b29d2so12937379wmb.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 07 Feb 2023 03:29:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WuawNslRJtsC33cN3DASsrMzq8m1GQBJdWGYFmYOzJw=;
 b=KIOjLqQPEN5DxizoNHW2fswA5wMfsrgm6mMpATee8smgZdgB63d23BWnC/OoEMfSXE
 jXzTYQm3a2Al25lU7oM4+CRslKRlw+XC6V+lLCfZpj44X/H+bxVO0MNHJo1jxWzFDt0T
 I4liXF+7Q2QRINjxqKM8g46xZ96C1uuhWG0pU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WuawNslRJtsC33cN3DASsrMzq8m1GQBJdWGYFmYOzJw=;
 b=jvD4Hx5kh+xbsnIQogg4WtmuHzlDbKxPtSAevgSV/GLjMu5H6GHy62TYmbEk+8rqju
 os/eoDGAh7hjtyJZQW5+j4pGfU4Y6Foa9SU/zK7h+UorBlBFRLFOn2FzXEjWzKmpWYIM
 gHxs8+WU5G4aCLgeVI/M570Q2DFF9FWLYEEiH7pZdIQLpnh9dYiSUwHJ1PIiuO2RFdvT
 RmlRw/btOJ+lJZ5zWjO4/VDXieE+D/q0BmupxuWa+uM4XvGasr3coOTYwxnAUaTECT1h
 V9rOOpCIn7G4FU9X97KWnX7jOy36TyWJYkrraOmCGtS9R+HgxuZ8nymODwU7adT/jxZn
 Ww1Q==
X-Gm-Message-State: AO0yUKUDOwJfRxvFRG/+Sk1E87WtUaOj8hl7y6Aj9XlF/LynhR30T6Zx
 0zXWiph/Ep/KTZ8UIZGFrcJ/9w==
X-Google-Smtp-Source: AK7set92Wg87sjRJcNaBUXHicHlGa8epNMOQw+3Yad5vGTuJOGxp7NYkw8cohOoq0auHGIOyq5uBpQ==
X-Received: by 2002:a05:600c:1e8a:b0:3df:e57d:f4ba with SMTP id
 be10-20020a05600c1e8a00b003dfe57df4bamr3425847wmb.7.1675769395613; 
 Tue, 07 Feb 2023 03:29:55 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com
 (mob-5-90-193-20.net.vodafone.it. [5.90.193.20])
 by smtp.gmail.com with ESMTPSA id
 bi5-20020a05600c3d8500b003db012d49b7sm2020827wmb.2.2023.02.07.03.29.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 03:29:55 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Tue,  7 Feb 2023 12:29:22 +0100
Message-Id: <20230207112926.664773-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20230207112926.664773-1-dario.binacchi@amarulasolutions.com>
References: <20230207112926.664773-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Mark Brown <broonie@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sebastian Reichel <sre@kernel.org>, michael@amarulasolutions.com,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Subject: [Linux-stm32] [RESEND PATCH v7 1/5] dt-bindings: arm: stm32: add
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
Acked-by: Rob Herring <robh@kernel.org>

---

(no changes since v5)

Changes in v5:
- Add Rob Herring's Acked-by tag.

 .../devicetree/bindings/arm/stm32/st,stm32-syscon.yaml          | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
index b2b156cc160a..ad8e51aa01b0 100644
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
