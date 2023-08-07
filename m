Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8095A772EAF
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Aug 2023 21:31:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 42397C6B469;
	Mon,  7 Aug 2023 19:31:36 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 165F5C65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Aug 2023 19:31:34 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-3179ed1dfbbso4262715f8f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 07 Aug 2023 12:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1691436693; x=1692041493;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eAPKS4SAXmZKxicJb9ydkGPtaas2WIonOZ7to+HEfxA=;
 b=tOmh3T/d1Kx4g5+xfWbagK8zeGuje07up/l4PO1tcHXwuVmvIvKezEFEUOszEceBwv
 WLoDiMbUQkX8jTprThvfI+94af++yK1HBv5TLq1zf5liFa6GUHWuLrbyYBO0KyAAx0sW
 G2YMRuSYtUZkPA6TUkDb0scVx1tV5W+yGsHfFKU+iwvrWydYuU/0Yd+dyq0Z6CgdXhCl
 kxKph2hAcWnEy/TuTREzxTULR40oj+9vctCBPlWjIp1S+PjMazFOy9kN+l9V1dn6ae0X
 x8M6Hk9pZxtjeD89oR/plTnS6CIGysZeXPcQ6k/Tppw434ibY95fOMnSJJIDiU5GfYxO
 OpuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691436693; x=1692041493;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eAPKS4SAXmZKxicJb9ydkGPtaas2WIonOZ7to+HEfxA=;
 b=ZyEW5CCZBxUsWqezwuv80b1MDY3cv3pK8UneoYDwN2bLlEmzHiz/9tP8A0ltiDF3TX
 YdjgqjxwrYM5l2QwzmEzrFGRpyk9BOttn0/4Bt8PO40JVzqT7nfVs2T1Eo8ciypeqUeN
 bV5tdM7oTB8tEC0QZYBEl4Z1Gd8GpQttiTjgZAnMF6T0FvmLmMvpJ7H48hyAx0yPfJ5V
 mC53+stNJsHozoLadtyybcXYfRnzlQTPVXTKHNPEq0g9csUP1SNUFXRU1Ym4bn5aXoix
 oOY+bToqXDyMr/l3hudshyfIflKpDZn6NWgdF0nArtN5DYo1kQc+vuGE+9TDfdTmOf2g
 CNYA==
X-Gm-Message-State: AOJu0YyKuwNAmAUDzqhecuvcwzFvFxXTbjxAHL2g2TJbZeCyff9PtYFN
 zDCHlrt2cmSWJTJu5IokacJB4A==
X-Google-Smtp-Source: AGHT+IFftT9bB5ixmjqvw1q7hvp1QMCeUhqraDuekV0noaWoXd5f9+2RWAbtpR5sMmr8DxPlkMO5oQ==
X-Received: by 2002:a5d:6683:0:b0:317:67fa:eeb4 with SMTP id
 l3-20020a5d6683000000b0031767faeeb4mr7411809wru.57.1691436693519; 
 Mon, 07 Aug 2023 12:31:33 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:b3d6:9e6:79d9:37cd])
 by smtp.gmail.com with ESMTPSA id
 l7-20020a7bc347000000b003fbdbd0a7desm15985654wmj.27.2023.08.07.12.31.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 12:31:33 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Andrew Halaney <ahalaney@redhat.com>, Alex Elder <elder@linaro.org>,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>
Date: Mon,  7 Aug 2023 21:31:01 +0200
Message-Id: <20230807193102.6374-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230807193102.6374-1-brgl@bgdev.pl>
References: <20230807193102.6374-1-brgl@bgdev.pl>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/2] dt-bindings: net: snps,
	dwmac: document the snps, shared-mdio property
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Two MACs may share one MDIO lines to their respective PHYs. In this case
one of the MACs is the logical "owner" of the bus, while the other can be
considered a secondary controller. Add a new property that allows one
MAC node to reference the MDIO node on a different MAC over a phandle.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 Documentation/devicetree/bindings/net/snps,dwmac.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index ddf9522a5dc2..f9c2285674d1 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -500,6 +500,12 @@ properties:
     required:
       - compatible
 
+  snps,shared-mdio:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the mdio node defined on a different MAC node which this
+      device shares.
+
   stmmac-axi-config:
     type: object
     unevaluatedProperties: false
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
