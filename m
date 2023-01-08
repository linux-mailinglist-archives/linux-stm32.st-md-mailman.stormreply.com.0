Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C19FD66167F
	for <lists+linux-stm32@lfdr.de>; Sun,  8 Jan 2023 17:26:02 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7DD1CC69058;
	Sun,  8 Jan 2023 16:26:02 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D78D2C65E5A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  8 Jan 2023 16:26:00 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id v10so7962231edi.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 08 Jan 2023 08:26:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pWlIQBe6KHU2MRGPH98wyw9zelNx3otUU9JeorE0clc=;
 b=fpoXzbnR5B8C60yFJ+Pt+wZEW8FPbU0I9RmwjuH+RZH73dwiLdPHfBPhkcTnwGj5PN
 ps+jMpQ09i9nIMa3jozLRTN33I56ula1MShJdY8K+2ioq+MS0ziQuEjt05gHPVNKivsi
 T0c22foSNhWSf+M22wmxFhASUJH/Ux+EDP1K4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pWlIQBe6KHU2MRGPH98wyw9zelNx3otUU9JeorE0clc=;
 b=s/k57tJNnJi5PddyCzJOKVy4JZhAsCT6oZwfVsc2kbUWVopDg1hWD6PjMLVWBj1oWt
 D8VliVr1QgGtoZ9jY0R1g3BIvP60H1/aKo9zOCl15xvllnRFevKiO0ZzirSg031nfidu
 plf0WcbvbgwpVxFAuqgb9+VBtJ9/9aiXE3c22BzzLURKlKdcfyndrRHg6SW6DzdztTPC
 +adBluLNJZyVE3xnHl39E7dxBk6K1k/uRamLOTEWhwU3WVQwd1myAUCrtYUI+nRrCdP8
 pqaw84T4m1AtxcpUPgYwWXHHedKRChQ2aVRaHA6Qu+H5tWaby523IbZjjvR/Cg1eIjQc
 SO3A==
X-Gm-Message-State: AFqh2krh/saJJ8UDwa47igVm+LyBxJiy9ULCXXIpoL4br0aptIGw3kHl
 U5lYhR7zjF+W/rZd8N4wYUi3uA==
X-Google-Smtp-Source: AMrXdXuHd94B7Bd8lJcWkeEJjjpomBCQONEVdcmyeFpXNtA3MYEpHllzKPYu4VdgP66YRnlJK/h22A==
X-Received: by 2002:a05:6402:25c6:b0:478:5688:7c9f with SMTP id
 x6-20020a05640225c600b0047856887c9fmr64197086edb.29.1673195160525; 
 Sun, 08 Jan 2023 08:26:00 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-80-180-23-57.pool80180.interbusiness.it. [80.180.23.57])
 by smtp.gmail.com with ESMTPSA id
 n3-20020aa7c443000000b00486074b4ce4sm2659614edr.68.2023.01.08.08.25.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 08:26:00 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Sun,  8 Jan 2023 17:25:50 +0100
Message-Id: <20230108162554.8375-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20230108162554.8375-1-dario.binacchi@amarulasolutions.com>
References: <20230108162554.8375-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, devicetree@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Mark Brown <broonie@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>,
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
