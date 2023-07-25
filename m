Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 51AB87611A4
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Jul 2023 12:54:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 18806C6B45C;
	Tue, 25 Jul 2023 10:54:31 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D359CC6A615
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Jul 2023 10:54:29 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-991ef0b464cso1370231166b.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Jul 2023 03:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690282469; x=1690887269;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lAPnBy51KY5Q8W0jZaxn8YJPMIA4zGpT3GqFQVuAjXs=;
 b=ftj1qHH7PHX8G+ykrJfin4oovgfvLbfYfj7bwo5GgaP4bmYWLh0tcp3FrI1Ja7zqc+
 y4t1CNKaafAqBumyPuxilT1jw0hHJAxXMqHIdTVgEEoEjl1l2tXFBYxe2w6AQ0p+ANZg
 7UTjPky1q/FKXknDniZsGRduKSJ3YExWd/j8s4Tieri3qf+6eA37ktghPiUxP0UQ1hOp
 buFKIjd41TOWT4hX2dvrCJVlcsRxr4UgU5ZyOd+pmNmiHfcaIQ+wpfhueJNGpLCkS+L7
 g1UfkP4g6dKPzH+HGPUWBcDjNivjpM51y36d8k3O2dwF7Yhd2oRLfaa/5OP9dhMwMfOR
 PXNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690282469; x=1690887269;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lAPnBy51KY5Q8W0jZaxn8YJPMIA4zGpT3GqFQVuAjXs=;
 b=evaYA2SL9bNXFLqZ3W7b5XAAxpoN2eTO7fdj0j47wwFVmot3hzZA0AS7wH5l7pGrYJ
 4FPlNnVrvlpMnxg/SvBkjCS+r3KbA7qQy6t31xe1oKFOGnDV+LdIDCI20prgYldrKoHs
 plvSKL+PtSoxvKRA9sR7mA4O1thK5g3Uo4gFftx2wI0jUrlxXgzVNJu5m3y18GryA+eg
 EJa4w9Sk3rNPVi0cXHYKYztp9id0Nd9VDEWdUfZ7H+0OQvw2l/iNn9f3EgDxO9smheed
 /Iwm2l23ILPB1tKiO01Z0I9DCf3Njbty02mLPgytvzO6GxQG+2wTQFMivqDT0lsF83ij
 Hfcg==
X-Gm-Message-State: ABy/qLbANVTn9uiMy6OUG4QqxSzkKhyz6ONy2tS5opwaHM70EHLKR18K
 tGUCv6IQwI6LNFIWE4u6Wuxcww==
X-Google-Smtp-Source: APBJJlHF8N1dX3cLQ6BhBFDlptyqeZ0jbLRdvDgQ93gz6dgJ4jr5wU6kWig1k8fcud6m2UiE+efWow==
X-Received: by 2002:a17:907:77d1:b0:99b:b506:76d with SMTP id
 kz17-20020a17090777d100b0099bb506076dmr1070876ejc.24.1690282469541; 
 Tue, 25 Jul 2023 03:54:29 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.104]) by smtp.gmail.com with ESMTPSA id
 xo22-20020a170907bb9600b0098860721959sm7980597ejc.198.2023.07.25.03.54.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jul 2023 03:54:28 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Saravanan Sekar <sravanhome@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Robin Gong <yibin.gong@nxp.com>, ChiYuan Huang <cy_huang@richtek.com>,
 Pascal Paillet <p.paillet@foss.st.com>, - <patches@opensource.cirrus.com>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Date: Tue, 25 Jul 2023 12:54:21 +0200
Message-Id: <20230725105421.99160-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230725105421.99160-1-krzysztof.kozlowski@linaro.org>
References: <20230725105421.99160-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [Linux-stm32] [PATCH 2/2] regulator: dt-bindings: mps,
	mpq7920: drop incorrect ref to regulator.yaml
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

"regulators" node is just grouping regulators, but itself is not
describing one regulator, thus reference to regulator.yaml schema is
incorrect.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/regulator/mps,mpq7920.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/regulator/mps,mpq7920.yaml b/Documentation/devicetree/bindings/regulator/mps,mpq7920.yaml
index 38475a568451..6de5b027f990 100644
--- a/Documentation/devicetree/bindings/regulator/mps,mpq7920.yaml
+++ b/Documentation/devicetree/bindings/regulator/mps,mpq7920.yaml
@@ -21,7 +21,6 @@ properties:
 
   regulators:
     type: object
-    $ref: regulator.yaml#
 
     description: |
       list of regulators provided by this controller, must be named
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
