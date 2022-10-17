Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CA55C6013B5
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Oct 2022 18:43:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 746B5C64106;
	Mon, 17 Oct 2022 16:43:00 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BD515C63325
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Oct 2022 16:42:58 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id q9so26375882ejd.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Oct 2022 09:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Wd7qt9Y69GxtzzaG+0eDdZVNxTR8osN5UREXRUPZGYY=;
 b=C7yaISHJJcjy28PH08rE9s8ZZMVFQnz7iwYDYhUOyd2+8umUQLF5R8KUzLYBLf9qn8
 sV3zeXmLsZ9B64sXKubPI8W2vfW3ajHbu0dIeFHmLhyfKLe0Pg/J7z7q3L+Y5ihj4zFV
 QusK5ocBPrEGQzkkNJqA42ezRnJzep1IOShKI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Wd7qt9Y69GxtzzaG+0eDdZVNxTR8osN5UREXRUPZGYY=;
 b=bqXDmn67Lx7Kj/yJtCTgEzBE8GzGdgJmwmPurr5UJzViMzG8pxhs/xSO0LdgFRZQrz
 XPuO4fylPQrvMSleI6hnCjEBCBq9yGz0mILCf1vPU65g5n9topVOFTtPEN1E7vtGTI1H
 DVkA4DR2OwEdNPklenAReXJS1LovluB221AF85VNJKwcY6CZICqn58PX7JlLnBXJykpk
 2uQ2NJbxB1dPi3ygLxSgGlWXziyOsGx2MqysFrcyVOf52IarP41WbiJ8ZJoHBCgSQOEb
 UZA6noqEQTh7gH4ESsix3P1nbhJeKF4fp4Uu+/UASWXuVGY4Uvt3Kc8wA+yZODMlQmWA
 s3ug==
X-Gm-Message-State: ACrzQf31xz075Ny6EW5kLeinLQPCqoN0+vZZM7EEPaQqzBL0pA+Zun+a
 //6IsJCrF4d5fzwUGz6dZExziQ==
X-Google-Smtp-Source: AMsMyM4i2eQhL+b75XqgI4zjogiDW6a8WKKC350BSeJHcgZHSdfB0jvKpLawJ13a87kC+eW+0iXL/g==
X-Received: by 2002:a17:907:a42c:b0:78e:fd1:61b4 with SMTP id
 sg44-20020a170907a42c00b0078e0fd161b4mr9508774ejc.289.1666024978405; 
 Mon, 17 Oct 2022 09:42:58 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-95-244-101-110.retail.telecomitalia.it. [95.244.101.110])
 by smtp.gmail.com with ESMTPSA id
 a24-20020a1709063a5800b0078128c89439sm6437388ejf.6.2022.10.17.09.42.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Oct 2022 09:42:58 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Mon, 17 Oct 2022 18:42:27 +0200
Message-Id: <20221017164231.4192699-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20221017164231.4192699-1-dario.binacchi@amarulasolutions.com>
References: <20221017164231.4192699-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh+dt@kernel.org>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Mark Brown <broonie@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, michael@amarulasolutions.com,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Subject: [Linux-stm32] [RFC PATCH v5 1/5] dt-bindings: arm: stm32: add
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
