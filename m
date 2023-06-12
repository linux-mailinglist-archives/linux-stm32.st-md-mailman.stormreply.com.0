Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7606E72BC1E
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Jun 2023 11:24:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4040AC6B459;
	Mon, 12 Jun 2023 09:24:55 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 19614C6B457
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Jun 2023 09:24:54 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-3f6d7abe9a4so29305915e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Jun 2023 02:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1686561894; x=1689153894;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O/BwPT61gNb/fpvsQAhaitGbvL3MEPuuuuNNy2pTzoE=;
 b=KHKdjQnx0PTEmRzkJeZY3O856gAgS3Hdc359skiRzSs2ciEHOPaOFgjUVc/wO0JOvu
 8QRdBnSv+EpJxtw+vLXcuZ2cXgNGtF894/O/Z/fQDBOMUUO//qoKGVyNWVnPGZblfP7S
 9fuhxIDMQebFvrJhPuZ4btq9pjjepa44vnED5QD5aXI9zMok4d/PF4D+0jEWDMXfujCn
 oPpYG9VmBg5YBg8Rw5qGxzf6uNUd6/FJit9UvVSVn7GOGDFdSxBGLyVDpcVg6UUUn4Py
 1unlaSr7kVEPk0ryxuCCi9hRPqDELZuCqySYJWzNODdIiuQcCRL71x4NS7A49Xm3HIc2
 nw5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686561894; x=1689153894;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O/BwPT61gNb/fpvsQAhaitGbvL3MEPuuuuNNy2pTzoE=;
 b=U5r3lcyTa/QBVehZewAmHJNVLRT4z35ANdVgRm+DNkQLA02gZuu/cHcjb7VaGv+AWf
 EFzVyJ5TIr+A2jZchceIgUuM2LVdls0X5ubOz9U3JPN1teObCNatxYRdF6al0xzWOeTq
 bjpzyryBbIoP0R7c7sUmYBOzvQMPwtJMg6JC7dXZxpwVNXc3LCH8bEve5m17hKK7qzvr
 jpjyuhxPOp5sNLHi4A5Dis1VaP1FQPrMS/PLBxlXqQO6hieNTDNqxCjOO3z1GJirDWk6
 4XjERrs8bMuAdxz8mxSO71d8J8zyTw255H5w5qdZVdJCWGP6KJ+ASa6KRGThTd9mzHQR
 sUGg==
X-Gm-Message-State: AC+VfDyV/XGMBza5Zszcpt1J9mdqo+rKtStf3jr8KsH2z8yrEgFD77x6
 UvJOUi3u4h/JzrDlHxEtkHBQCA==
X-Google-Smtp-Source: ACHHUZ4E3nyef5IaWSpbvQhPsPLIUwzbLrCVEH1BYy2PCoLie+du+ZB9jNZyHE7R35n0ahbM/lttWA==
X-Received: by 2002:a05:600c:299:b0:3f6:444:b344 with SMTP id
 25-20020a05600c029900b003f60444b344mr5600857wmk.34.1686561893854; 
 Mon, 12 Jun 2023 02:24:53 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:a222:bbe9:c688:33ae])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a7bcc8e000000b003f727764b10sm10892044wma.4.2023.06.12.02.24.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jun 2023 02:24:53 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Vinod Koul <vkoul@kernel.org>, Bhupesh Sharma <bhupesh.sharma@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>
Date: Mon, 12 Jun 2023 11:23:48 +0200
Message-Id: <20230612092355.87937-20-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230612092355.87937-1-brgl@bgdev.pl>
References: <20230612092355.87937-1-brgl@bgdev.pl>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 19/26] dt-bindings: net: snps,
	dwmac: add compatible for sa8775p ethqos
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

Add the compatible string for the MAC controller on sa8775p platforms.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 Documentation/devicetree/bindings/net/snps,dwmac.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 363b3e3ea3a6..ddf9522a5dc2 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -67,6 +67,7 @@ properties:
         - loongson,ls2k-dwmac
         - loongson,ls7a-dwmac
         - qcom,qcs404-ethqos
+        - qcom,sa8775p-ethqos
         - qcom,sc8280xp-ethqos
         - qcom,sm8150-ethqos
         - renesas,r9a06g032-gmac
@@ -582,6 +583,7 @@ allOf:
               - ingenic,x1600-mac
               - ingenic,x1830-mac
               - ingenic,x2000-mac
+              - qcom,sa8775p-ethqos
               - qcom,sc8280xp-ethqos
               - snps,dwmac-3.50a
               - snps,dwmac-4.10a
@@ -638,6 +640,7 @@ allOf:
               - ingenic,x1830-mac
               - ingenic,x2000-mac
               - qcom,qcs404-ethqos
+              - qcom,sa8775p-ethqos
               - qcom,sc8280xp-ethqos
               - qcom,sm8150-ethqos
               - snps,dwmac-4.00
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
