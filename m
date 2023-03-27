Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9546CAFB6
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Mar 2023 22:16:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E441EC6A5F2;
	Mon, 27 Mar 2023 20:16:49 +0000 (UTC)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
 [209.85.166.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4CA35C01E98
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Mar 2023 20:16:48 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id k17so4442938iob.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Mar 2023 13:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1679948207;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=naF6lvSQb9TRc8Fh22LBxD4avClkKSEDkyx9CDmChC0=;
 b=CxSVI6/XYwWD1PMufblibS7y0Jl3dfs4ZwMdKkJFfdb6WmW7yVJffiah3hYVF5VaDZ
 M5g3fL/txQlETgSWwwXvtjv8LPmDpoHAu/vhSjKeJjtfcceikIoTr+YeObcooC+tZP2c
 iW/vA9JTskbIaRD5v2OLWtM9aaRF2TZB75q/g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679948207;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=naF6lvSQb9TRc8Fh22LBxD4avClkKSEDkyx9CDmChC0=;
 b=DD+qLcfNoA7tdPghD/Z8Jil+pOfdRsN8vQj5x1rhsAHJioqMfuwq0EPpaGT/jwTKow
 orIozLA+iG3uibzd0XHcEiFjnJ6g3QKxx+nXTJA6e00Lw2yBHbf7obEWxRAA+vHtrs6J
 eZYosYq2s2Fit9nrou+xkoKCRtBh+4GfOy4DYKdfEkZSVdkEhrmk8ipyyRBfJyVNcaSl
 nHVVLNifNFae9aRDIxb8GCaBFEKeNIlOxuc2cONZ1xr+Ac7AjeYjB+TrhwRpQ0RrKBpm
 4q45Eb9RA4d4Iy1YGtrEEG95boLdERABEo1d3Mr1aGS0Qlc8gjBAOGPYvdaD1c6KZqVI
 /FUg==
X-Gm-Message-State: AO0yUKVj63SmeVopbVte5sdlTNbAOnncnI5QkseaY6nUBlVzT83R/1an
 1WeZ76C+okHNtbRHREfITfEsfg==
X-Google-Smtp-Source: AK7set8BKUE0k2yqKIwOZ7LQxWzIh8H8MHkfhDWKLbsA5N7LFJXFTP9lyZONEBlLhRe5TuBLZmPYng==
X-Received: by 2002:a05:6602:408b:b0:758:9e69:13f1 with SMTP id
 bl11-20020a056602408b00b007589e6913f1mr13224545iob.9.1679948207250; 
 Mon, 27 Mar 2023 13:16:47 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.pdxnet.pdxeng.ch
 (host-87-0-102-254.retail.telecomitalia.it. [87.0.102.254])
 by smtp.gmail.com with ESMTPSA id
 u26-20020a02b1da000000b003a958f51423sm5594759jah.167.2023.03.27.13.16.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Mar 2023 13:16:46 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Mon, 27 Mar 2023 22:16:26 +0200
Message-Id: <20230327201630.3874028-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20230327201630.3874028-1-dario.binacchi@amarulasolutions.com>
References: <20230327201630.3874028-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, devicetree@vger.kernel.org,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sebastian Reichel <sre@kernel.org>, michael@amarulasolutions.com,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Subject: [Linux-stm32] [PATCH v9 1/5] dt-bindings: arm: stm32: add
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
more specific compatible") it is required to provide at least 2 compatibles
string for syscon node.
This patch documents the new compatible for stm32f4 SoC to support
global/shared CAN registers access for bxCAN controllers.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Acked-by: Rob Herring <robh@kernel.org>

---

Changes in v9:
- Fix commit description formatting. No semantic changes have been made.

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
