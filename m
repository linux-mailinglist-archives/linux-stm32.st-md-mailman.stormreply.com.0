Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 81464731850
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Jun 2023 14:14:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 45FB5C6A615;
	Thu, 15 Jun 2023 12:14:37 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CFB2DC6A60E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jun 2023 12:14:35 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-31110aea814so1113915f8f.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jun 2023 05:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1686831275; x=1689423275;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f/jlXshozPayfgGZVovFzvapxjkBArH5oxzJwkbABuE=;
 b=BzuS9RSkb1VuhyVasOCaQQYQZKWLp7tuE6Z6JDP9ohQbiwfAbyhQUcDEHtwbuGnZCS
 /WDNWUTCVyl5kl7QqXN7gKM0tZktsCftZEs3sbvE0YuexJchGh+eCMXTDHvHgsriU+8A
 Zp45TeVO0oB+80O2Uf+5oOssdAurKBceYwmQdlJKALKsGdBj0eYEfylyR1bolyz7rfYY
 8O1yx5KGXUEOIaZp8FUS+nNPB3JF68dno6JjDqq33Qkk3ZAkgFRc2Uqd7REozWHh/2B9
 mYR+I37h1WzVPJJ83n7aVT8U3QRZOhuj8Nhe2qDQBsv6hiEmwMvl1lDvYcvYwZIcWN8d
 /d7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686831275; x=1689423275;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f/jlXshozPayfgGZVovFzvapxjkBArH5oxzJwkbABuE=;
 b=MkRZ3SUR0/lHZjIruqbe0NyfEw/tKBSOK1xS73pzRw5aQEMoYrzqBENnsuiA41L53c
 DiivzKTuxn+xcVQYF1AInbeLaQNwp84u82gyYGCBpydC+P2sw+b89TeZrMATou2FGTaV
 HqiwclsG7qkYLKOtHzuduhfdDW3pefbQtiDip08UIB8XbjuiWvxOhdlQFbnhOiP2yZ+v
 Pb1MJTDIG7AwiC8Roynvn/GZEtB02NW+SoKarsmoAr74gmvkao9TwWbblTj8uljjXR5E
 g7BSJeNnv30cc0jniWQXG3OwtaICAijYHN+Q15/Q2uGNV5HuIPKw7FL5VJzOruX/1nPL
 rPbQ==
X-Gm-Message-State: AC+VfDzf+m4ih+T46QDhKLWq9rfaKW2IBGm0cefZ+iDWLTzPu3W25NVw
 Wa5P4aGyMSGb7vfelX5939cIrw==
X-Google-Smtp-Source: ACHHUZ5LA1QLesLhMCoHz0lhOmmGMBGQ5xhcJQ2gSP2bMgCLnhUviUhuo8lryU0TLfacq14LtZqdFw==
X-Received: by 2002:adf:e984:0:b0:30a:bf2b:e020 with SMTP id
 h4-20020adfe984000000b0030abf2be020mr12408926wrm.45.1686831275297; 
 Thu, 15 Jun 2023 05:14:35 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:2ad4:65a7:d9f3:a64e])
 by smtp.gmail.com with ESMTPSA id
 k17-20020a5d4291000000b003047ea78b42sm20918012wrq.43.2023.06.15.05.14.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jun 2023 05:14:34 -0700 (PDT)
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
Date: Thu, 15 Jun 2023 14:13:58 +0200
Message-Id: <20230615121419.175862-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230615121419.175862-1-brgl@bgdev.pl>
References: <20230615121419.175862-1-brgl@bgdev.pl>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 02/23] dt-bindings: phy: describe the
	Qualcomm SGMII PHY
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

Describe the SGMII/SerDes PHY present on the sa8775p platforms.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../phy/qcom,sa8775p-dwmac-sgmii-phy.yaml     | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/qcom,sa8775p-dwmac-sgmii-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/qcom,sa8775p-dwmac-sgmii-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sa8775p-dwmac-sgmii-phy.yaml
new file mode 100644
index 000000000000..b9107759b2a5
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom,sa8775p-dwmac-sgmii-phy.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/qcom,sa8775p-dwmac-sgmii-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SerDes/SGMII ethernet PHY controller
+
+maintainers:
+  - Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+
+description:
+  The SerDes PHY sits between the MAC and the external PHY and provides
+  separate Rx Tx lines.
+
+properties:
+  compatible:
+    const: qcom,sa8775p-dwmac-sgmii-phy
+
+  reg:
+    items:
+      - description: serdes
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: sgmi_ref
+
+  phy-supply:
+    description:
+      Phandle to a regulator that provides power to the PHY.
+
+  "#phy-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - "#phy-cells"
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,sa8775p-gcc.h>
+    serdes_phy: phy@8901000 {
+        compatible = "qcom,sa8775p-dwmac-sgmii-phy";
+        reg = <0x08901000 0xe10>;
+        clocks = <&gcc GCC_SGMI_CLKREF_EN>;
+        clock-names = "sgmi_ref";
+        #phy-cells = <0>;
+    };
-- 
2.39.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
