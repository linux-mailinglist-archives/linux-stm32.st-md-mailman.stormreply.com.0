Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4165C955E03
	for <lists+linux-stm32@lfdr.de>; Sun, 18 Aug 2024 19:30:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0046BC6DD66;
	Sun, 18 Aug 2024 17:30:20 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 593A1C6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 18 Aug 2024 17:30:19 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-428e1915e18so26297775e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 18 Aug 2024 10:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724002219; x=1724607019;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=X3MSSxP9rHAkbncpX6jbhl/iQ23LwfwRpJkBsCTawB4=;
 b=Qp5dC726w0hsPFkzFlBrgmTnlz2BlG591GPHrAhlYZDswCiEd6U/IB4U+Sb0L1Mvzu
 dsh/i1khkcTGTHGeUsoXWfRFFAUzTktEAqyDGa2DnPtPuj+ib6n9abInKMqbgMf/rC2V
 g7tiIW0jF5qoNLTt2a91ozQMYQjBn5VEdhi0EROi07M8v3+0hyUr+LQf9v/V52g/pR/U
 et2SQ40k+olYbQDgAe5XDMEuzkrm+EWo5EpuZ1XNFRDxoqwL3YwlQ4D4EjLJ+6y6UtnI
 cCCcV0XWX1pipEPjdw00hpyXtZ/7Ex0Gq1tReyHzoq1BU0jNbxWeNiU7lKkqw1n8ymYT
 l8dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724002219; x=1724607019;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=X3MSSxP9rHAkbncpX6jbhl/iQ23LwfwRpJkBsCTawB4=;
 b=fb1OHIrRAlIfePLFjvjCB3KDq7jkCwc+gFrbOCLmP0gvpD9VG/jqtKDnHQiYy4L+bf
 veO9lfXLqzCeSbznatFxEqAFsgpRWa2oxv5gTHxGVUaiiIhu8T7X/6AEe03iZGzKP3kj
 Do95R0eULnrJkUdLTor3PCX5khIDjc8Q1wPp+CM4M+e9JaMRG6kl2i7fpQ5o1D9uF+l6
 p/h0UA7ydZXlqZz7VAKUMIPr6qlYx6DRcnAviqbUJFQhYI0di6vqk9zYIUaAEehMtIrb
 0H8aTQEqX41nt412vSbah5Zwcs86ZszpTgE2KrUVvpGYUvd8HGSUJ/JVQfJxy+Oo7lhh
 xNfA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/p1JGKhgWl8ibXEa7vdm7h5dZnfoTo0WS5iLUHmtS/T9AyWbWPlaLy+oMmq6SUeOkZtYQT8gD4AiBoBss6oYOm4HUUIc8B8JK6Qfl0ub6o7+yqMqAGQoe
X-Gm-Message-State: AOJu0YyzuPSEjH9eoH3oFIqzBPanlO8EMwduWY3i/i1k0XQBI6SSWbIn
 huSGGN5Yp4mXUGgKklfb+OESlT8ifJiTMfunrI5VmZsZMJCtVjw+d/aCI0+HLAs=
X-Google-Smtp-Source: AGHT+IEPnFkHPz/DzJcjmR5QH1BJYBppD43D0BqAvj9I5k6ZQrBB3ZrienBffgoL+lY/tHnzKwzdTg==
X-Received: by 2002:a7b:cc85:0:b0:428:f650:6a4e with SMTP id
 5b1f17b1804b1-429ed7e43ccmr55679215e9.23.1724002218616; 
 Sun, 18 Aug 2024 10:30:18 -0700 (PDT)
Received: from krzk-bin.. ([178.197.215.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-429ded7d5a9sm134999915e9.43.2024.08.18.10.30.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Aug 2024 10:30:18 -0700 (PDT)
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
Date: Sun, 18 Aug 2024 19:30:10 +0200
Message-ID: <20240818173014.122073-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [Linux-stm32] [PATCH 1/5] dt-bindings: clock: baikal,
	bt1-ccu-div: add top-level constraints
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
for clocks and clock-names.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/clock/baikal,bt1-ccu-div.yaml     | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/baikal,bt1-ccu-div.yaml b/Documentation/devicetree/bindings/clock/baikal,bt1-ccu-div.yaml
index bd4cefbb1244..30252c95700c 100644
--- a/Documentation/devicetree/bindings/clock/baikal,bt1-ccu-div.yaml
+++ b/Documentation/devicetree/bindings/clock/baikal,bt1-ccu-div.yaml
@@ -134,9 +134,13 @@ properties:
   "#reset-cells":
     const: 1
 
-  clocks: true
+  clocks:
+    minItems: 3
+    maxItems: 4
 
-  clock-names: true
+  clock-names:
+    minItems: 3
+    maxItems: 4
 
 additionalProperties: false
 
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
