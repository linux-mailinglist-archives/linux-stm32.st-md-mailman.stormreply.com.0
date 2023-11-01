Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8307E1CF6
	for <lists+linux-stm32@lfdr.de>; Mon,  6 Nov 2023 10:08:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EE9C9C6B47E;
	Mon,  6 Nov 2023 09:08:30 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BC9D0C6B44D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Nov 2023 15:15:51 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id
 d75a77b69052e-41ccd38eaa5so8642641cf.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 01 Nov 2023 08:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hefring-com.20230601.gappssmtp.com; s=20230601; t=1698851751; x=1699456551;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i2SsA8lNfsfo5blKrfyRF4NmHE0kd2YJvslu6dle/wI=;
 b=oxmEe+rEj8Tushn0Te0Z1R/JW9Um+zNgwfwy2sPwneEP6x0Xj6/yIrdZ0AjP+Kg/X/
 rCWy6RKGZg4ICxBTQiRtAHGLhbXdflBx7gjxshZIMOjWkYYn7uWMXCJZPnCrw5qmZzpa
 QiJBClEz7SMwa8OdUSmVRs0ujxS64TeYIdKrSyVUo2eBv3Ag+qK7OgBs5zP+iN/9sTd1
 LGdbCtPSZ1fcoFx22FFdIbrFDzUOZ0rQ0vO7loLmdmEdOkJWaQtzSlczGUleoCnjCx9u
 pT/I9t0LHLMNBOznKNSray6A69f+lrbO3jK+UyjImi+EtRnwQjefC+98KbOeUuyZAA3i
 W9Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698851751; x=1699456551;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i2SsA8lNfsfo5blKrfyRF4NmHE0kd2YJvslu6dle/wI=;
 b=MTot7ggCclpEne9OnyMuez5dW5k2gsMVx0ah8R2AphfD5YnVRWf7RHhDcNtjF1arCG
 G1ZqumfYU8MoAfWONJ9Xmje3msF7EetYBUINobOfLZDgG6OefKQJKiyslG/oTcoqtj1a
 zwo0FrRgiRzZe2iwfLyw0xLwLmmBpqTxbnztvmnu3yBHaOPbrP94boYMXunRwkqGy3uU
 ZxFU0mH3x1+A3thkrzOoB9GNgSypjfWtQQff6CTjtEkFogbowKUxPnPRgWWm9j3o10py
 BneXVLOpz3pRqo9iz0O5GJXk+pJi4DkYoEAZAg0NOgJW4SaKj+8BYzgPwLpK0eeRvAYV
 H54w==
X-Gm-Message-State: AOJu0Yxu1pOcEJBa3/H5mC5iCzP9NlO/fLY4UWNCvXUguNh3CL2n4w6u
 2Kj1G8JRYh3Rw1w6MG+md4vsBw==
X-Google-Smtp-Source: AGHT+IHWjvouG9vf5NVO719ZlWW+XphlMNTuSp/67HW9qXaA2To6e351tMMqwrLG7eC9q42SOgiDZQ==
X-Received: by 2002:a05:622a:110:b0:400:9f2c:1211 with SMTP id
 u16-20020a05622a011000b004009f2c1211mr8947000qtw.29.1698851750784; 
 Wed, 01 Nov 2023 08:15:50 -0700 (PDT)
Received: from localhost.localdomain ([50.212.55.89])
 by smtp.gmail.com with ESMTPSA id
 dn5-20020a05622a470500b004181a8a3e2dsm1477165qtb.41.2023.11.01.08.15.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Nov 2023 08:15:50 -0700 (PDT)
From: Ben Wolsieffer <ben.wolsieffer@hefring.com>
To: linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Wed,  1 Nov 2023 11:08:08 -0400
Message-ID: <20231101150811.2747455-4-ben.wolsieffer@hefring.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231101150811.2747455-1-ben.wolsieffer@hefring.com>
References: <20231101150811.2747455-1-ben.wolsieffer@hefring.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 06 Nov 2023 09:08:29 +0000
Cc: Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ben Wolsieffer <ben.wolsieffer@hefring.com>
Subject: [Linux-stm32] [PATCH 3/5] dt-bindings: spi: add stm32f7-spi
	compatible
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

Signed-off-by: Ben Wolsieffer <ben.wolsieffer@hefring.com>
---
 Documentation/devicetree/bindings/spi/st,stm32-spi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml b/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml
index ae0f082bd377..5754d603f34f 100644
--- a/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml
+++ b/Documentation/devicetree/bindings/spi/st,stm32-spi.yaml
@@ -23,6 +23,7 @@ properties:
   compatible:
     enum:
       - st,stm32f4-spi
+      - st,stm32f7-spi
       - st,stm32h7-spi
 
   reg:
-- 
2.42.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
