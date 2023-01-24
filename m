Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C576793EC
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Jan 2023 10:20:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CDCF8C69054;
	Tue, 24 Jan 2023 09:20:06 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B825FC69049
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Jan 2023 09:20:05 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id g10so10916545wmo.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Jan 2023 01:20:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m0imGc0Sj0+U1qO38/MoeN3izcir/X2ZEBTXpN0rl4g=;
 b=CPxobIJe+YATUdVShDwFvEedr8RMcP704WVL8YG02+Iob0qOMVsaRzVKgi/UdLdUU3
 gS99+M49vYEyE6B2zC4wRJtJhQIUSmiBd8zU6TIBGHNjVnJUo1H4lqAFBjIRqxCa8/7u
 fW312YrEhd1LmL0WPkyAzqoyhbByHBITKwH5alfMEAx5a9x0A597UHvOZQLbIaDL42em
 cq2UdXfIR27iQAwIvwr1bMS9F1FTaDC6ukF2UuD8a7tlgDMLK65G1rzQxDx0cWgDwhpl
 JdZJQHpPGxMCwbPyYFgUZNehhlIXemwcN7Ju1kIVbk4fZ14iRf3CnJ9BTzuUH4OuAe5E
 rdGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m0imGc0Sj0+U1qO38/MoeN3izcir/X2ZEBTXpN0rl4g=;
 b=i05MvqLoU2xkncdupJZYg+/73+/hZiVF+/MCCmuieA9mE3tZJEZ6enOPpWocA7pock
 l4pQBaobyEdQSuSp19urXeStvGDy72i6rIgUTt6jXjwEsUkkqLF7pZBLc05E/Z3U1qIM
 yf8yoCFI95XjfyZkSvTpqQSMq6CRxQ79s3Lg3FzWEPmYh04wzCQlihv65icIgCtXlNh9
 Vmx1Dnez1c3rLlepsG1fKFsJI3WGG15NUEeNQvPAGl/F26J4KxPUyzjr4sQIIszJYooF
 UVOmS5nuT+BGbbEi6PTq5pFBC7H9e1lH7Gudt/mtXEX4u6RX3eESoFnJXfTA3E95pV78
 w+3A==
X-Gm-Message-State: AFqh2krKvOcF3jMhFQb/VOWPoERSKOU+mxSGyJ3Ii2Obo8tu5mfPtBXd
 ZmEI8rrfGXrXOOqY8f4djcxYvw==
X-Google-Smtp-Source: AMrXdXvoKzAQYXHhE3iqhd9K3QqtBf5s1S6xQrft6zrb083L8IWCVu9+Yf4WKPAw9wUuVyhtxaOK/g==
X-Received: by 2002:a05:600c:540a:b0:3db:a3a:45ac with SMTP id
 he10-20020a05600c540a00b003db0a3a45acmr26791698wmb.32.1674552005467; 
 Tue, 24 Jan 2023 01:20:05 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144]) by smtp.gmail.com with ESMTPSA id
 i22-20020a05600c355600b003a84375d0d1sm13672242wmq.44.2023.01.24.01.20.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 01:20:04 -0800 (PST)
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
Date: Tue, 24 Jan 2023 10:19:14 +0100
Message-Id: <20230124091916.45054-8-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124091602.44027-1-krzysztof.kozlowski@linaro.org>
References: <20230124091602.44027-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [Linux-stm32] [PATCH v2 10/12] dt-bindings: serial: st,
	stm32-uart: drop common properties
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

The binding references serial and rs485 schemas, so there is no need to
list their properties.  Simplify a bit by removing unneeded entries.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/serial/st,stm32-uart.yaml          | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml b/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
index 85876c668f6d..1df8ffe95fc6 100644
--- a/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/st,stm32-uart.yaml
@@ -35,8 +35,6 @@ properties:
     description: enable hardware flow control (deprecated)
     $ref: /schemas/types.yaml#/definitions/flag
 
-  uart-has-rtscts: true
-
   rx-tx-swap: true
 
   dmas:
@@ -60,11 +58,6 @@ properties:
 
   wakeup-source: true
 
-  rs485-rts-delay: true
-  rs485-rts-active-low: true
-  linux,rs485-enabled-at-boot-time: true
-  rs485-rx-during-tx: true
-
   rx-threshold:
     description:
       If value is set to 1, RX FIFO threshold is disabled.
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
