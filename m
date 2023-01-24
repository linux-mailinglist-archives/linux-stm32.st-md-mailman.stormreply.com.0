Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B60C96793DE
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Jan 2023 10:19:52 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7590EC64110;
	Tue, 24 Jan 2023 09:19:52 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0AF87C65E71
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Jan 2023 09:19:51 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 f12-20020a7bc8cc000000b003daf6b2f9b9so12331267wml.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Jan 2023 01:19:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XbA6lJheuFk/8xFTT1ePhHPMDBY/JK/4xrBmt+OOi4U=;
 b=gyaMQF7LxN91BqAUGGwqgwsMO2hEdoTGvJ1VHPth0Vl8RgAka5nDpZvB74rufyb+Z0
 xV00CuvPEWQEr09/BVy1JzwjLcVogjv11FrOZXW+ugvwl0cfQHBRj3Bfa0yC15GWAl1t
 jXdQs2B6bMEn/Y1LezZLuXMYjROjGQRcLXxatD01tROgJfIaE5vqoJBuPDvdnubUBmHM
 uG17LU+D1qCJqe3hjfo9MtGoUGnnwKLsjTJUeCxXC2tNvX/cvNTUmEDgAPXYS0cmUL3i
 gTnni68xV+zWuVbwacWcJZ8jbWYQ5xcswPnGiChiZ+46OlyTOlunUIshv6Q7wrqIN36n
 NQcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XbA6lJheuFk/8xFTT1ePhHPMDBY/JK/4xrBmt+OOi4U=;
 b=PpX+tCCvNh2r0ce9akJwCNpN3Xr2Cl2aHevJ5ucOSufCdYhxVDcNRKGRFDUvVg6I9K
 VtRrfxlovKiJ/w7yQn3e3h+YTZN662EltDTPiQv6NcBJNnFSUzt10pOHYVE0MKVk7Dan
 KTaweI0N8kObQehqCMzuo7YYeVpLwFgOgzippglM07YVlxUTzfJiuBmpEyUF/8RONJpD
 RDD6WJjCxDvZ0sZDmXaiMBiwJuOuS8xq401+C/zLBH6pqQSboE9Le1wM5oT7fvDgb2rB
 10lnMQVguU9O7VWfP0V7omSd7e6v+QfhxR6ClsPWigonvB+xX2dLdUZcKTJtJW6gI0Hi
 gRtg==
X-Gm-Message-State: AFqh2kpMSA8drYF4Ga++2tEJufm81i+FwUnjZKuaoekJmPCiH1quxWBw
 pqDWr1dRajkSS9L7JBxu6AHEQA==
X-Google-Smtp-Source: AMrXdXsuCK5QkrJAsWUR9ETP50ULGZWTSxGw8meu3uy8bzB1kS3qzFWy3OBucmJfla4MOZzaKSjqcA==
X-Received: by 2002:a05:600c:6001:b0:3da:f80a:5e85 with SMTP id
 az1-20020a05600c600100b003daf80a5e85mr26600878wmb.26.1674551990693; 
 Tue, 24 Jan 2023 01:19:50 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144]) by smtp.gmail.com with ESMTPSA id
 i22-20020a05600c355600b003a84375d0d1sm13672242wmq.44.2023.01.24.01.19.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 01:19:50 -0800 (PST)
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
 Lubomir Rintel <lkundrak@v3.sk>, Vignesh Raghavendra <vigneshr@ti.com>,
 Michal Simek <michal.simek@xilinx.com>, Chester Lin <clin@suse.com>,
 Fugang Duan <fugang.duan@nxp.com>, Magnus Damm <magnus.damm@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Pragnesh Patel <pragnesh.patel@sifive.com>,
 Le Ray <erwan.leray@foss.st.com>, Peter Korsgaard <jacmet@sunsite.dk>,
 Tomer Maimon <tmaimon77@gmail.com>, linux-serial@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Date: Tue, 24 Jan 2023 10:19:10 +0100
Message-Id: <20230124091916.45054-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124091602.44027-1-krzysztof.kozlowski@linaro.org>
References: <20230124091602.44027-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [Linux-stm32] [PATCH v2 06/12] dt-bindings: serial: 8250_omap: drop
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
 Documentation/devicetree/bindings/serial/8250_omap.yaml | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/serial/8250_omap.yaml b/Documentation/devicetree/bindings/serial/8250_omap.yaml
index 53dc1212ad2e..7db8e5477b03 100644
--- a/Documentation/devicetree/bindings/serial/8250_omap.yaml
+++ b/Documentation/devicetree/bindings/serial/8250_omap.yaml
@@ -70,11 +70,6 @@ properties:
   dsr-gpios: true
   rng-gpios: true
   dcd-gpios: true
-  rs485-rts-delay: true
-  rs485-rts-active-low: true
-  rs485-rx-during-tx: true
-  rs485-rts-active-high: true
-  linux,rs485-enabled-at-boot-time: true
   rts-gpio: true
   power-domains: true
   clock-frequency: true
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
