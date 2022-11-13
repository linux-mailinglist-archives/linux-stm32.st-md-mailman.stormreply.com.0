Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D8A627187
	for <lists+linux-stm32@lfdr.de>; Sun, 13 Nov 2022 19:13:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5B2FAC65068;
	Sun, 13 Nov 2022 18:13:33 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 868C9C640E9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 13 Nov 2022 18:13:32 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id kt23so23404686ejc.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 13 Nov 2022 10:13:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Wd7qt9Y69GxtzzaG+0eDdZVNxTR8osN5UREXRUPZGYY=;
 b=r4iRi3u3f673NIkdZ3T0jiFFltpdfE82+xUBTwgsXeRfYRzz5dKJLaHp/2urJCzPW1
 k4KBqywiSJFEzrXn3j3cvHI/fDcXloQk2SvCmNcGPM0Ccb15eq8kA3HuHdsUzdyUtEtB
 /phHo37+5AHff6OgCqKs86m06FwqfzZPH94jY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Wd7qt9Y69GxtzzaG+0eDdZVNxTR8osN5UREXRUPZGYY=;
 b=KMtC5vc1X2lyaNnK6AWzO8IZnWTA/L0uiZRGXzpZI3k5eUXNw7ytTjD4WfZURS0PF/
 X5DQE1+1smKWVDZz5/ey16nmOTU9HOmy1MTuLR7ac2aX9czgbHD4k3OyYhukGSb9VlTV
 /lTUVYXXsOxN/dKxRjEvOFhQR0BQ7DAHNxGe3t0tMZFmpPHlirHGs0kRiO+T9KJeOGEe
 zv67uI6kalWFFUAvwX6MZEFfzFGJPKlfytN2TQgOKw995mPQ7Nwfzdhc90VouBFVVE1u
 /yPki/bvJdNm0pkxJ+JJSW/dAkgvFO1gTaN/q+4aI/tOhMi6mI7GTkh+XS7bfel3qksB
 Q41A==
X-Gm-Message-State: ANoB5pnS4Gt23Bz/2fRjW4w+GFktFsNpL8N1KQSpN6vFe1PPPySFM81R
 5Xg5tWbW857o5/KOIFIXFxaS/g==
X-Google-Smtp-Source: AA0mqf5ypUuQCkeRTRnTtRxOKEv2lhLWcI1Iy947SsUT60EQ/RiXX+gSReXE0XtvWGZwWA7W+YvnLg==
X-Received: by 2002:a17:906:6843:b0:7ae:65e4:7204 with SMTP id
 a3-20020a170906684300b007ae65e47204mr7780374ejs.579.1668363212177; 
 Sun, 13 Nov 2022 10:13:32 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-40-103-33.business.telecomitalia.it. [79.40.103.33])
 by smtp.gmail.com with ESMTPSA id
 iy6-20020a170907818600b0078de26f66b9sm3225487ejc.114.2022.11.13.10.13.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Nov 2022 10:13:31 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Sun, 13 Nov 2022 19:13:18 +0100
Message-Id: <20221113181322.1627084-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20221113181322.1627084-1-dario.binacchi@amarulasolutions.com>
References: <20221113181322.1627084-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, devicetree@vger.kernel.org,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 michael@amarulasolutions.com,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Subject: [Linux-stm32] [RESEND RFC PATCH v5 1/5] dt-bindings: arm: stm32:
	add compatible for syscon gcan node
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

Changes in v5:
- Add Rob Herring's Acked-by tag.

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
