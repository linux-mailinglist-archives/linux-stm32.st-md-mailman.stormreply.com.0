Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E64772BC1F
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Jun 2023 11:24:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5659EC6B457;
	Mon, 12 Jun 2023 09:24:58 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6DCB9C6B454
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Jun 2023 09:24:55 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-3f738f579ceso29735105e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Jun 2023 02:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1686561895; x=1689153895;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SXzZMEQkDaBAvE+ZbovBT4hal5Pn3NRrTeiS658EjW4=;
 b=DcuBFu7i8zRSQw8hKkh2pX678LFY4uXhQRa0m1zoChLoD/0S5zPhOg/N/5fCRqhJYj
 Z/zKl/ZA0YUpKlj3nfmm8WK7dbqp8Lz1GnBwSjRkWnCXmulByIqXZmyk9SecLTKdlKEp
 7XqAqh8l0T6g6hWUOB56/w+7mdIuq30uxJryTPArpeMbN91hdnLaykpbwvvQbF3VlWr5
 jvy48WfJVMGchgt+8J6Gp6hkKaiYTL3TgU2oDk+hfhvv+QDEuUdfV1axYsnXyQAb2/ox
 iKo4fug4hayVecTmLj6RFSmpadhjLeynFjSieMx2ZlRUmPe9LmSJZ1bM+o0ZfZ4+FOxq
 cyUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686561895; x=1689153895;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SXzZMEQkDaBAvE+ZbovBT4hal5Pn3NRrTeiS658EjW4=;
 b=FpITRmUnR7FuVSzI0CXWAOL0eElU8vhlyAOmuqtaBGj1ZboXvGZv8tNgCfHc0idslF
 O1VObMJh7GD5j9xYv7GCSlghO3MbGgK1T+U0/0tAmR8dIv42y79JwQTGLA4ZhtwuyKY3
 wcl28JyFVnjG3yWbWq9MaxK3YniQemE5DqVuINrEgHYdS/cLmnifCgrh3gBl+IxjzR4H
 yQhcF7LIRcyQ88sjExAz0PWWRwnQ3U3EmWaZBrzZokF6k5MT/Z5M4cekWVbeox84AR7D
 reUSB1gAMCOruT7VRRDq7QVkB63Kp/KsH4MC6GQthJz1Aup6MPxlWGRPfotHMaE0oTXK
 APlA==
X-Gm-Message-State: AC+VfDwMTSdDMIqYGQs+nAfVyN/0SQHDAguEVBOi65cqj2ps6w6hXclR
 R+kK8k0kmReqwD4dj19GCySptA==
X-Google-Smtp-Source: ACHHUZ5UO/S8nDahmNKq8Vygdbss9quzKdAcp5DFednq7JQ+xTXMbpCVJCWEy9AyLcubMF3PwjgMDw==
X-Received: by 2002:a1c:7713:0:b0:3f6:784:9617 with SMTP id
 t19-20020a1c7713000000b003f607849617mr5402370wmi.11.1686561895166; 
 Mon, 12 Jun 2023 02:24:55 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:a222:bbe9:c688:33ae])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a7bcc8e000000b003f727764b10sm10892044wma.4.2023.06.12.02.24.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jun 2023 02:24:54 -0700 (PDT)
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
Date: Mon, 12 Jun 2023 11:23:49 +0200
Message-Id: <20230612092355.87937-21-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230612092355.87937-1-brgl@bgdev.pl>
References: <20230612092355.87937-1-brgl@bgdev.pl>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 20/26] dt-bindings: net: qcom,
	ethqos: add description for sa8775p
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

Add the compatible for the MAC controller on sa8775p platforms. This MAC
works with a single interrupt so add minItems to the interrupts property.
The fourth clock's name is different here so change it. Enable relevant
PHY properties.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../devicetree/bindings/net/qcom,ethqos.yaml       | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
index 60a38044fb19..b20847c275ce 100644
--- a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
+++ b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
@@ -20,6 +20,7 @@ properties:
   compatible:
     enum:
       - qcom,qcs404-ethqos
+      - qcom,sa8775p-ethqos
       - qcom,sc8280xp-ethqos
       - qcom,sm8150-ethqos
 
@@ -32,11 +33,13 @@ properties:
       - const: rgmii
 
   interrupts:
+    minItems: 1
     items:
       - description: Combined signal for various interrupt events
       - description: The interrupt that occurs when Rx exits the LPI state
 
   interrupt-names:
+    minItems: 1
     items:
       - const: macirq
       - const: eth_lpi
@@ -49,11 +52,20 @@ properties:
       - const: stmmaceth
       - const: pclk
       - const: ptp_ref
-      - const: rgmii
+      - enum:
+          - rgmii
+          - phyaux
 
   iommus:
     maxItems: 1
 
+  phys: true
+
+  phy-supply: true
+
+  phy-names:
+    const: serdes
+
 required:
   - compatible
   - clocks
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
