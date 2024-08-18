Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A393955DFA
	for <lists+linux-stm32@lfdr.de>; Sun, 18 Aug 2024 19:30:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E686DC6DD66;
	Sun, 18 Aug 2024 17:30:01 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6517BC6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 18 Aug 2024 17:29:55 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-371b015572cso953374f8f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 18 Aug 2024 10:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724002195; x=1724606995;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KbwvlIVMV8xryLkD19IewQWLhOQT8FXVqlEUYqJE2Z0=;
 b=sudJT2bG6XX3QXfgnYks2/sdG9qxZwdrOuvBbRzwshMqe0sAd3mfxWbYbAsx83oC3k
 rGrvmV18GskD9gCKXh1QmnvrnH/B4FkIEnN4jgYvxH+cfJoFjRjoBw7ygecM+lk0Qgl1
 e+iLig4FqMbAQiSipUahom5Tcg7yqxJeSiuz0gXkNgviuLBdI0x3lTI6ow2sdt8VqWmh
 swL7xq2eAeAlnj5bSc3SncPI0+4Ds4uktZPKkfhGJMEGiE1fhcvTtLubiwhHVD559JWC
 Iaw0ycE+zFjTeVdL3suDMgYElCgyTapJ8WUrwtZinGZw0lDX4fDUh9ZMeD/YuSyqvR3X
 656Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724002195; x=1724606995;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KbwvlIVMV8xryLkD19IewQWLhOQT8FXVqlEUYqJE2Z0=;
 b=XXuleXL/s20Ghpv7FKntTF/oQaxebtgUJRrX2t2ycWSElpPQnQI7uVMWwGQG7CKcfU
 2thaif0FZ1e3w+RcU9k3hz8tsZoC/WnTfyqEY+GVA7hD9kh7NMOYheNgCiqEqvfOAg3c
 gOwMA+99OhWOaZU7rKraIoqCERnaIaDzv2mlcyvq1FcNN2tXzs2LvtzFaUVBg4tjvDLi
 qeaI/+p/HOKLWh4b2MWvIzljtAadSC56bnKTHFUi+Ys5bbbY/TjcXged+wuWOgI0LSv0
 CATmdrRDx8st8TIWgJwRVdEs9VztmCSHguAvj9Mv2R90F9C6nYkHzzuGKfUrBdlCNkXi
 SL8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCi8Xy1zI9E9ADidXllXcCaIOXCZ1elFZp+hT/wvIOUzxHZiabW7clkEpfJYMWzeBq1mzYUxsGmQpgNQM58sy6OptaFuEsyfRmrM0lPKe4gy6qtLxecm3M
X-Gm-Message-State: AOJu0YxhRJDJpchwKyupX3Sgts5TKKH4Pr6gMW0/Fve43moHdUzEY7cd
 Zj73CjK9abnper2Gv+8TYUxH83jRB5UeuyeH+LkrK6ma5XZsCByCWaiVJz+UcQA=
X-Google-Smtp-Source: AGHT+IFp3b5dXt3VaeULNgHqcg4QFbzuh6p5X7dQPwN9gftdTacq8ZYzKU9ZBjnuXrL9t5XVlwI1Bw==
X-Received: by 2002:a5d:5c88:0:b0:371:a92d:8673 with SMTP id
 ffacd0b85a97d-371a92d87a7mr3528329f8f.44.1724002194776; 
 Sun, 18 Aug 2024 10:29:54 -0700 (PDT)
Received: from krzk-bin.. ([178.197.215.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3718984c0d0sm8486522f8f.38.2024.08.18.10.29.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Aug 2024 10:29:54 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Sun, 18 Aug 2024 19:29:51 +0200
Message-ID: <20240818172951.121983-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [Linux-stm32] [PATCH] dt-bindings: iio: st,
	stm32-adc: add top-level constraints
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

Properties with variable number of items per each device are expected to
have widest constraints in top-level "properties:" block and further
customized (narrowed) in "if:then:".  Add missing top-level constraints
for clock-names.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml b/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml
index ec34c48d4878..ef9dcc365eab 100644
--- a/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml
@@ -54,7 +54,9 @@ properties:
           It's not present on stm32f4.
           It's required on stm32h7 and stm32mp1.
 
-  clock-names: true
+  clock-names:
+    minItems: 1
+    maxItems: 2
 
   st,max-clk-rate-hz:
     description:
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
