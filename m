Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA2C955E06
	for <lists+linux-stm32@lfdr.de>; Sun, 18 Aug 2024 19:30:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 25F48C6DD66;
	Sun, 18 Aug 2024 17:30:26 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CD780C6DD9F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 18 Aug 2024 17:30:24 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4280b3a7efaso27306775e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 18 Aug 2024 10:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724002224; x=1724607024;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4LJzGmSDXl8HNs+ZJgf58xM3uvdTJPYEdQtiLGgE/Vo=;
 b=Yt3cb9ChUlomc5MCiFyOpahjXnNwq16O5SuCsZB+jimW05jzONRerZpJtRRVKwy1bY
 uDc2Ay4MjwGh5aPXeFfLTX6eMgWlIl4Mb8A8pm+BOqH+FqclhSZIrUmTTxLoFAlGGjEq
 vAO6B7bxXM3VFmm+OH/0AZUYczVWs9voGEMsTvVqNc3VmgIv3ILZwAUsFDL8Wm2yQzzv
 kXkd1kxMKqWIIzlihyINAEc+3DZlIU4UkTOjSaSLV0OOk9IJBpU4zPQ7lrXRDJERcrCC
 s+Ei9+6LeeIFG6NfPfHDni9ol9M59KXwE+nczoDSRzLx0NdVUoXqERP8nmsm3FX2O+LC
 LkKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724002224; x=1724607024;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4LJzGmSDXl8HNs+ZJgf58xM3uvdTJPYEdQtiLGgE/Vo=;
 b=K8rkIufY9bdZjIzg5GB+k0k9kw7f8YEKqhjKZ0IB//WGMGsMZcuUqJ5HYoj320E2XI
 P/MfIiEggevEwbSSxTpiYl5Ojudu+A+bI1E92BB9jB9vz0SI93MM22nldBtwt7XVzosB
 /HuyUlLcLnOoaIS22uWbnoJiYlAcgqGvaugVbTqUpA+uqQittfDX3DZQzwKX3ucRRSpD
 BvSmebGqhncsZyODTZAY6hYt1bhj94zF3hWNPlQBX98aI1FCdDNlOHyHSvds40QWLmvh
 omdGRidnR3CjJ7BQJ4PrX9a+V+sraerfmQTvBzkfbx/UPFgAK2HR5zur6DMbmHEXppZ/
 oV7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqDYLyaYoSZeJd76oPHYcHz/Hk/03BBmy/aglpOP7UCEO68s0O+suoj4I0ZTuxF0yTRz8kyuSVN0cFag==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyLftmnf2QJ/exWrbpQPPgFoWS6jgtpA4LQHezmQNVHkPd00Lc1
 dgHVHyjcVLiJOkdkpzgHq2BU2mnE5oiX/YW0ooMyHcLmrODKamszuXx34ptPy48=
X-Google-Smtp-Source: AGHT+IGekL2+ttve0hynRqEEzbgRWcWynLHa1J/EMMNb3eGD6VlpT3jMglNMhKBlzMDg3B561e5RkQ==
X-Received: by 2002:a05:600c:5254:b0:429:d43e:dbb9 with SMTP id
 5b1f17b1804b1-429ed7cc4d4mr55016825e9.23.1724002224225; 
 Sun, 18 Aug 2024 10:30:24 -0700 (PDT)
Received: from krzk-bin.. ([178.197.215.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-429ded7d5a9sm134999915e9.43.2024.08.18.10.30.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Aug 2024 10:30:23 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Serge Semin <fancer.lancer@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Heiko Stuebner <heiko@sntech.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Magnus Damm <magnus.damm@gmail.com>, patches@opensource.cirrus.com,
 Elaine Zhang <zhangqing@rock-chips.com>,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 linux-mips@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Date: Sun, 18 Aug 2024 19:30:13 +0200
Message-ID: <20240818173014.122073-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240818173014.122073-1-krzysztof.kozlowski@linaro.org>
References: <20240818173014.122073-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [Linux-stm32] [PATCH 4/5] dt-bindings: clock: rockchip,
	rk3588-cru: drop unneeded assigned-clocks
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

assigned-clocks property is redundant, because core dtschema allows them
if clocks are provided.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/clock/rockchip,rk3588-cru.yaml        | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/rockchip,rk3588-cru.yaml b/Documentation/devicetree/bindings/clock/rockchip,rk3588-cru.yaml
index 74cd3f3f229a..4ff175c4992b 100644
--- a/Documentation/devicetree/bindings/clock/rockchip,rk3588-cru.yaml
+++ b/Documentation/devicetree/bindings/clock/rockchip,rk3588-cru.yaml
@@ -42,10 +42,6 @@ properties:
       - const: xin24m
       - const: xin32k
 
-  assigned-clocks: true
-
-  assigned-clock-rates: true
-
   rockchip,grf:
     $ref: /schemas/types.yaml#/definitions/phandle
     description: >
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
