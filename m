Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E0DC9677EF5
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Jan 2023 16:13:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A6B50C69057;
	Mon, 23 Jan 2023 15:13:29 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5FEF2C69056
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Jan 2023 15:13:28 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id e3so11097500wru.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Jan 2023 07:13:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iisYcPXooI57UtkAF+HOVcsh+51Ufy433rxJDACay30=;
 b=rI16xsFZkU0eDWMTKFE0Ksxp73pnRnnVBuMI8tFbs3EAC+MtLCqM+X8v/vyycGcC5O
 USAChlzuDrcJtFWE5zuLInbgnGCpGbxV8/dQRqPYk53NiBrGIVppJYgEQ2zfRv7+YKSa
 YgXA+r7Uufexm6x2hExkt/4SgVNyVq8GFmMZhbUftDEvVH7LmMktBcLLpFBqx5/chHt2
 TeE20n5vBOYzlQtPwurLAxPiVEG5XNohtEKAMDt/NqKy4AnRpg/zhqZY49jckFfZ1deg
 CtvZBVIzioBWs9VynvZ2UYazAhmLq1ctmNt+zbnVQ5BlNz377YWULvNPKig7igJrEKyo
 vs5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iisYcPXooI57UtkAF+HOVcsh+51Ufy433rxJDACay30=;
 b=nOrmChWHbBe0T2sJaQNP5U31HXvgjFQVt6oGTBu1bpNczVxWfEVAs2jBGosWnB44cS
 FpzVHoF33lZqSKouoK3YVNjV2bbt0Y/0Qoj+d3nApztQVDZlkZAFPuQxYU/c9EIjUK2m
 reslOgkjfsKdAtj0iBf2cylY85bao3OieUJRoJ2MuovjY/yZIErTPwROHuZVQ3wIE84V
 /mYT8N7JGek48CdJMiaXPqloUVlqPwzO1enVKlw+BPFoWYBtblAT5Ap7FQmCz6+6L9rL
 RM0LmicdXk5bTeHI9sVCIJXfENW21vRb3um8k2pQ/AUlnxyhkiTvW1oQzUPBK30+AC4q
 9Ohw==
X-Gm-Message-State: AFqh2ko4v74fJP9wdCN+fufGTBzif6KUW/aVFQENRrU2ClT6gYlPxypL
 aDnBAW7eHkkd7S9CMvIHiwYj/w==
X-Google-Smtp-Source: AMrXdXt0/G7OJJgG09MWKAInBglkrtPYNcF28o6o5Fy6XNeVCLITjCuzgG4Lr6rNnIfwWhChDqTogg==
X-Received: by 2002:a05:6000:3c2:b0:2bd:d45c:3929 with SMTP id
 b2-20020a05600003c200b002bdd45c3929mr23730627wrg.54.1674486807943; 
 Mon, 23 Jan 2023 07:13:27 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144]) by smtp.gmail.com with ESMTPSA id
 n1-20020a5d67c1000000b002bc7f64efa3sm34737922wrw.29.2023.01.23.07.13.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 07:13:27 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Lubomir Rintel <lkundrak@v3.sk>, - <devicetree@vger.kernel.org>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Michal Simek <michal.simek@xilinx.com>, Chester Lin <clin@suse.com>,
 Fugang Duan <fugang.duan@nxp.com>, Magnus Damm <magnus.damm@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Pragnesh Patel <pragnesh.patel@sifive.com>,
 Le Ray <erwan.leray@foss.st.com>, Peter Korsgaard <jacmet@sunsite.dk>,
 Tomer Maimon <tmaimon77@gmail.com>, linux-serial@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Date: Mon, 23 Jan 2023 16:12:57 +0100
Message-Id: <20230123151302.368277-8-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230123151302.368277-1-krzysztof.kozlowski@linaro.org>
References: <20230123151302.368277-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [Linux-stm32] [PATCH 08/13] dt-bindings: serial: fsl-lpuart: drop
	rs485 properties
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

The binding references rs485 schema, so there is no need to list its
properties.  Simplify a bit by removing unneeded entries.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/serial/fsl-lpuart.yaml | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml b/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
index 74f75f669e77..b1e81a6451a6 100644
--- a/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
+++ b/Documentation/devicetree/bindings/serial/fsl-lpuart.yaml
@@ -64,9 +64,6 @@ properties:
       - const: rx
       - const: tx
 
-  rs485-rts-active-low: true
-  linux,rs485-enabled-at-boot-time: true
-
 required:
   - compatible
   - reg
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
