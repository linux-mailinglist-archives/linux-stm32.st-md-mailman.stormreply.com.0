Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AF8826C9683
	for <lists+linux-stm32@lfdr.de>; Sun, 26 Mar 2023 18:03:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5CE3AC6A602;
	Sun, 26 Mar 2023 16:03:33 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 89007C65E6E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 26 Mar 2023 16:03:32 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id y4so26341864edo.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 26 Mar 2023 09:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1679846612;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WuawNslRJtsC33cN3DASsrMzq8m1GQBJdWGYFmYOzJw=;
 b=lm3usrJkrAsmIhY5NhxHKhUVY5xUCinMtwbqhn383BjqiHdbGRd+y3qyw6p/5o8zGn
 /25+rfBhNPrTFBc6jkGaApquPi3VtarQ9Pr0oxUwkEqeRYowCvfPSP0MkFaviaf1wCT+
 RwqPIidVdZv/z0EgNinYnkCBWsjFY3po5PUp4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679846612;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WuawNslRJtsC33cN3DASsrMzq8m1GQBJdWGYFmYOzJw=;
 b=qL32vZ5TLo/+TRSfXtY7nnYzv4ojEdrulfb2HztD1I3xLCeG9w938d9jh0BJZS4LSU
 iZG2POBtA34wka+lzbF0sp0gkK6NQrkx9sEZ3ZXtUUpE5xWk7/AQoaeOYiRJAvb5NIWl
 WYnoaRQIMoEinEAt0eCcKarBFHWJPWi7a1QIbwbhbsbu+mRosBUD//B9oI3rC9ro3gWV
 dV5xrTWPQbKak97r4rafRDyxAUb/fsDnt4pSf66IXv5zi8fggGm1oX0j2GdsEXAhKW44
 kZhueu3vZZJe5ZS/1Tk92Wo+5A2g1O63xK41lQ+900YigoRQc8hxyhwrJ2PeMdhASI+p
 CJrw==
X-Gm-Message-State: AAQBX9e8oL63V3R6WluPHaWPof2FcVZg68dvWxXKy8L9rMBCJNP6lQUT
 0Dq3yhpykaXo0G1qhMYlfu+OFg==
X-Google-Smtp-Source: AKy350as+tRi3BA2dhFLxdS81jN8x1lgcW9Ng7ynZMWjcriz1sp/xBC13Ft0sKPnwfNlqdzjcrknuQ==
X-Received: by 2002:a17:907:1c09:b0:930:f953:9608 with SMTP id
 nc9-20020a1709071c0900b00930f9539608mr13785177ejc.0.1679846612122; 
 Sun, 26 Mar 2023 09:03:32 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-87-0-102-254.retail.telecomitalia.it. [87.0.102.254])
 by smtp.gmail.com with ESMTPSA id
 m2-20020a50d7c2000000b00501fc87352fsm6869333edj.13.2023.03.26.09.03.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Mar 2023 09:03:31 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Sun, 26 Mar 2023 18:03:21 +0200
Message-Id: <20230326160325.3771891-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20230326160325.3771891-1-dario.binacchi@amarulasolutions.com>
References: <20230326160325.3771891-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, michael@amarulasolutions.com,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 devicetree@vger.kernel.org, Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Subject: [Linux-stm32] [PATCH v8 1/5] dt-bindings: arm: stm32: add
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
