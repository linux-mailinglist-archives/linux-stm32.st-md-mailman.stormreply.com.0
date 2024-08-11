Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9B594E1C6
	for <lists+linux-stm32@lfdr.de>; Sun, 11 Aug 2024 17:17:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D9CACC78006;
	Sun, 11 Aug 2024 15:17:49 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 24F55C71287
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 11 Aug 2024 15:17:43 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-5ba482282d3so4392495a12.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 11 Aug 2024 08:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1723389462; x=1723994262;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nOrrFPO2+Eu1RsdiiDnsQDZT+Eoua4cGMzFbuz7CsgI=;
 b=ui2w/b+l8lNSQk3HluvQiQq11fUsrWfj6Oh0c7pMVIriy6JCOLY4I+hORDrhQ81plx
 01UN0VYdNJcoSAM/GIPROtT1lYoWLzu1+ON3D9n0GB8DqDtwo6s2baFsKeSn8huW0a8/
 G2xK2MIECNuukoztqzIO+enYi/QRfzGV+5k3zW+9aURKGOyB5CA5bqBdGPX24mF+0CBB
 861L31tXknaf+UHt8FQpMmf9SXw/8urIYvhPdSb63sS6P8eJgWM/uzGsvUoiEGbrm3fs
 8xn3Km0DoVhNHx858eI6ZEUJASoZhtOM/zdlB8VAETxorg50K+riWqDONltcO8nNohek
 GfAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723389462; x=1723994262;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nOrrFPO2+Eu1RsdiiDnsQDZT+Eoua4cGMzFbuz7CsgI=;
 b=rofQlj9Z/zr+yjCvA9WmbrIGPRzS+pfGu31o0cXysr2P75ro9r1CF4ryXwZE0fvA8g
 4+lJk6A5orYrhvgbPehG5tZlS+KaB1CyZk0yC5SN46AhAiI8NMk3rols6cNeK0vAvkrG
 BwrfpPJ9rNeTa2X+v3hqCGxFhEL3SiN7vGsXDNo9/W6fivUX5cKumt+kbVH3KQUn/4xA
 FRRSl8emqw8Y52k6HbsuMv18ixVnCR8CuIGgx8Di/hC48PBuDB1KrktAgLJmEu4WgSDZ
 ieb94pLi0HgkalMMUWzhwoZsy9nc0MSHB3ifgUQSbSnBDF7PRRckSE1DHbp5Z5IHcbxr
 E6XQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvdpcH7cOACK9FQyvnK6PTsntf2TbKiMtXi2cMj/zLtGLaTq2KvDIMhEw2dnCXOUGzxPhwUJwv4vwrL5j1XiZXO4alaKg5xECRVrypeLHU0PnFv4eQvMBT
X-Gm-Message-State: AOJu0YzcuNkXGgMAUHCb6g+EOpH2OFieDCa8hQlvi+PDOu8ulGUhlGqj
 W4ZpFFh8h9xg/1raxE/hJfh+rla1p39inxom4a+WFg3NMvm+bpKrMvXK8ns4V+E=
X-Google-Smtp-Source: AGHT+IFMkuh2pshcMEllN4JDzZBehDboH1YV/ev7+K4CsgIw5JNm3uxhpSKfKT45jnx67W0QXEExTw==
X-Received: by 2002:a17:907:6d11:b0:a7d:3672:a594 with SMTP id
 a640c23a62f3a-a80aa67acbamr477098766b.61.1723389462194; 
 Sun, 11 Aug 2024 08:17:42 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.137]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a80bb0904f5sm157030666b.18.2024.08.11.08.17.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Aug 2024 08:17:41 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Sun, 11 Aug 2024 17:17:37 +0200
Message-ID: <20240811151737.106194-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [Linux-stm32] [PATCH] dt-bindings: nvmem: st,
	stm32-romem: add missing "unevaluatedProperties" on child nodes
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

All nodes need an explicit additionalProperties or unevaluatedProperties
unless a $ref has one that's false.  Fixing this for STM32
Factory-programmed data binding needs referencing fixed layout schema
for children.  Add reference to the NVMEM deprecated cells for the
schema to be complete.

This fixes dt_binding_check warning:

  st,stm32-romem.yaml: ^.*@[0-9a-f]+$: Missing additionalProperties/unevaluatedProperties constraint

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/nvmem/st,stm32-romem.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/nvmem/st,stm32-romem.yaml b/Documentation/devicetree/bindings/nvmem/st,stm32-romem.yaml
index 92bfe25f0571..3b2aa605a551 100644
--- a/Documentation/devicetree/bindings/nvmem/st,stm32-romem.yaml
+++ b/Documentation/devicetree/bindings/nvmem/st,stm32-romem.yaml
@@ -17,6 +17,7 @@ maintainers:
 
 allOf:
   - $ref: nvmem.yaml#
+  - $ref: nvmem-deprecated-cells.yaml#
 
 properties:
   compatible:
@@ -32,6 +33,8 @@ properties:
 patternProperties:
   "^.*@[0-9a-f]+$":
     type: object
+    $ref: layouts/fixed-cell.yaml
+    unevaluatedProperties: false
 
     properties:
       st,non-secure-otp:
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
