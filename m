Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D52756BBE8C
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Mar 2023 22:11:01 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 91FBFC69053;
	Wed, 15 Mar 2023 21:11:01 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4921FC6904F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Mar 2023 21:11:00 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id cn21so50531366edb.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Mar 2023 14:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1678914660;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WuawNslRJtsC33cN3DASsrMzq8m1GQBJdWGYFmYOzJw=;
 b=Hm4Jn73YCvnNFAAptrzyqMve7nU/PmLdlqQ0AVEJwPboIH0zEKaOnv8wO7gglsKXcx
 WX8I0FXCivA8E6ZCRvj+ONY+7poyRpgTsW+HbDAZQ+6NOPq95YIOlhSQrkcTNWzzqR7j
 VOEeIGZSGElSdKcekINhcDP7tY65lziwvVfrI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678914660;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WuawNslRJtsC33cN3DASsrMzq8m1GQBJdWGYFmYOzJw=;
 b=ZlXi7/KLbiqs0mdtAw8ZBgn9hWH2aHxCrtjmTF549bmrTfQB/hU1IcEniZ2NKU9Kgl
 Bx3S1L0Fc5BueArNoed8fjBR2OgdsFSql1WKMf4YhDz54EwK0I4DxJyK802z8s1vPiSJ
 vbFkEwp5Vlhg2En2WLEiNL4sFUpAN+8srzXe3ORKUYK/HlqjDEPLc0BFASvBhKMQa7Kk
 M9rYBknBohD/o6cs1ZOAHYEN2YK85vN4ui1QcLqbaFgN5V7GstRBWT+ejOWD2qnbgGsF
 tsMtTkpd6c5OlMwdMX6EBlxNnQtJo58tAVwZXNrbZMCeRazG4gFcIbI7kwKlgS20GK6d
 Khvg==
X-Gm-Message-State: AO0yUKWyJ9mqWTVLbZx9/e37tpfSfFrnUI9KwmH4H2yTe90ukkajVlcL
 QOz/ULbq1xFybP1ta6r+JaFDnQ==
X-Google-Smtp-Source: AK7set/HsncufAKHkG0YqxX7s7PSud+PvzcNbyfIIX8XKDKEbQVS95BgIh70VhfY/KPT2TYhLvUVEw==
X-Received: by 2002:a17:907:742:b0:92e:b1dd:cff2 with SMTP id
 xc2-20020a170907074200b0092eb1ddcff2mr5202283ejb.28.1678914659863; 
 Wed, 15 Mar 2023 14:10:59 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-87-0-96-89.retail.telecomitalia.it. [87.0.96.89])
 by smtp.gmail.com with ESMTPSA id
 o15-20020a170906600f00b0092b5384d6desm2965366ejj.153.2023.03.15.14.10.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Mar 2023 14:10:59 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Wed, 15 Mar 2023 22:10:36 +0100
Message-Id: <20230315211040.2455855-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20230315211040.2455855-1-dario.binacchi@amarulasolutions.com>
References: <20230315211040.2455855-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, devicetree@vger.kernel.org,
 Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh+dt@kernel.org>,
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
