Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B10662ECF
	for <lists+linux-stm32@lfdr.de>; Mon,  9 Jan 2023 19:24:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 216D3C6904C;
	Mon,  9 Jan 2023 18:24:04 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ED70EC03FE0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Jan 2023 18:24:02 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id fc4so22283471ejc.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 09 Jan 2023 10:24:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WuawNslRJtsC33cN3DASsrMzq8m1GQBJdWGYFmYOzJw=;
 b=EvX5z8BtDHA/tpP4TdClX6p9QyU7vTeuCoFpfbsvBch8crM2wOTQdD0N+LWid1Y4Hi
 sdb17cI8noDMjRV3oaXGCHXRn9C5PAasKWX+ddcgZavXrzVlC9Z/8IJ7/jTmgNWbZzQx
 nHu2+lTunBFMOSMcN4lJwnotIT/JIEIK7qJd0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WuawNslRJtsC33cN3DASsrMzq8m1GQBJdWGYFmYOzJw=;
 b=mYxmpMRtSMoIjzkIUrYF/29qVsMf0xIZKdDVl+8bR59fz4q3dJiXE2FWs3CkgxiyLo
 UsPME21nZ+h8wxTPliEU7Ce10fbN48agbDd/HSxZA8zQrHtaEskt+zESR7Kct0eKtxMr
 Evyc5qlJ968tpMc8tvTWNxzPi/sBglohvDi0pmHsgJQP0VXeqbZvoQ1+wt7FjKFklRXB
 8AYM1DDXd/Y4wqJbJGmaJAsz7HrOGQ48bYcvy5Z4IyPByhK54Nq7I1WBVh0FoLM51d5z
 HAzYc3QiqdilRFLNKZqHlSWGfbSOF3gWmJkuWh5USrHj3PAGRNTzk3MWbw+HzwJQbHwb
 MJ4w==
X-Gm-Message-State: AFqh2koJkZmY0vV6IdPeQBRijpWYLymfLuJVFICHkgFpHqm+pfnfUPFK
 Rjh313qccnA4jk3UfZV3Tpb5JA==
X-Google-Smtp-Source: AMrXdXu9XapodJ1buz2gI4WFDCokc5RQLSW2MgnTRMY3L/mjPS/hd0a93SqhLVB/LYFYpnZDilgwZA==
X-Received: by 2002:a17:906:9d04:b0:84d:3822:2fc7 with SMTP id
 fn4-20020a1709069d0400b0084d38222fc7mr6672405ejc.77.1673288642599; 
 Mon, 09 Jan 2023 10:24:02 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.pdxnet.pdxeng.ch
 (host-80-180-23-57.retail.telecomitalia.it. [80.180.23.57])
 by smtp.gmail.com with ESMTPSA id
 kz22-20020a17090777d600b007c1633cea13sm4093653ejc.12.2023.01.09.10.24.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 10:24:02 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Mon,  9 Jan 2023 19:23:51 +0100
Message-Id: <20230109182356.141849-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20230109182356.141849-1-dario.binacchi@amarulasolutions.com>
References: <20230109182356.141849-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>, devicetree@vger.kernel.org,
 Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Mark Brown <broonie@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 michael@amarulasolutions.com,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Subject: [Linux-stm32] [PATCH v6 1/5] dt-bindings: arm: stm32: add
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
