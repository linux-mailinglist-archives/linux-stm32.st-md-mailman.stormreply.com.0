Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1976793C3
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Jan 2023 10:16:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B1E46C65E72;
	Tue, 24 Jan 2023 09:16:10 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6717AC01E98
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Jan 2023 09:16:09 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id l8so10896115wms.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Jan 2023 01:16:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UzZ68G+EqUxB4ReB2DFPbvUfCZJuRkKJfwx6QbLkd9s=;
 b=qNLZBMKp8jlCOQ6VKoGcz89327mXO1daazZJmZx/ApU597Tmv2aOx1yJ/P2hFuY+WR
 G8c4X1Ja7OmMvMvuTHgs0ofb3Oz7677dr7zhph17CTZZe8ZmSkN5hUFbp6VMp4D4q+zt
 3dRDBMyhC57ofxBd1bmOI21HP1e/+J5pMLmMg5mvgOvsniS+bb40e+fWYpBw6W8nWpzv
 26xvebR5JbrPN0jFLk/DY2MTnlxQtv7WEqkm2LbpTJwh6kq8CEc6S71SDj6qqyaMUfTl
 NDY30jEE0zySKmWS1q+CjCIpx01C0lAOMzOLu0Dzsdw4GD5oW3vneq44bX0/szF7+Bl9
 WTZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UzZ68G+EqUxB4ReB2DFPbvUfCZJuRkKJfwx6QbLkd9s=;
 b=Y3+/PGFj5+N1OBqX9nISkbhM6r9yiMm5wyPJhAFn7FGAl1N+EPjBL6kUBvpccriDAP
 u2Dw77SJMkmj9/2ukKZUD7Ye2i1aezm8A8VLgTe5dYZMZCCbzoDlUwDexhX8tR0vJ/pn
 tkkHO9PpBtCXLR5pDutg8fZuqDUkCDOYMGUhWdxwwKX0lbrP98P71bWq2cP422EbnSFj
 l6aYq2JL/U1o05aAmR4xRz5acYTeR+MZ6NBZYKUY9zPBx/skecDyAycFHpjF/cy3+6tz
 7d5LifoGSY8F3Clmz2VL9IxrIy8IYPYHAmaEjxQgSuqI8RtkfT8sf0RucVZXRuKYuBhp
 Mj3Q==
X-Gm-Message-State: AFqh2koc4G39WNJ0Er+54eH5uF0/WziHx7r3YnOf/71pGAObQJwfn8oG
 rP7wQBky5Pfq2jm6EckwJCdBXg==
X-Google-Smtp-Source: AMrXdXsKFwbW1DrSBlwbOeumT8HcjGuNecHBwhrXcJJzSlSBKZ+BDJR+H1Po1PDNqEw25ivpfYz9PQ==
X-Received: by 2002:a05:600c:198a:b0:3db:114:a6a0 with SMTP id
 t10-20020a05600c198a00b003db0114a6a0mr27455259wmq.21.1674551768883; 
 Tue, 24 Jan 2023 01:16:08 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144]) by smtp.gmail.com with ESMTPSA id
 j25-20020a05600c1c1900b003c71358a42dsm17882131wms.18.2023.01.24.01.16.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 01:16:07 -0800 (PST)
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
Date: Tue, 24 Jan 2023 10:15:50 +0100
Message-Id: <20230124091602.44027-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [Linux-stm32] [PATCH v2 00/12] dt-bindings: serial: cleanup and
	improvements
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

Hi,

Changes since v1:
1. Drop "dt-bindings: serial: restrict possible child node names"
   patch from this series, because it requires more discussion.
   I don't know yet how to solve the errors.
2. Add tags.
v1: https://lore.kernel.org/linux-devicetree/20230123151302.368277-1-krzysztof.kozlowski@linaro.org/T/#t

Best regards,
Krzysztof

Krzysztof Kozlowski (12):
  dt-bindings: serial: amlogic,meson-uart: allow other serial properties
  dt-bindings: serial: 8250: correct Nuvoton NPCM850 compatible
  dt-bindings: serial: pl011: allow ARM Primecell properties
  dt-bindings: serial: correct ref to serial.yaml
  dt-bindings: serial: cdsn,uart: add power-domains
  dt-bindings: serial: 8250_omap: drop rs485 properties
  dt-bindings: serial: fsl-imx-uart: drop common properties
  dt-bindings: serial: fsl-lpuart: drop rs485 properties
  dt-bindings: serial: fsl-lpuart: allow other serial properties
  dt-bindings: serial: st,stm32-uart: drop common properties
  dt-bindings: serial: drop unneeded quotes
  dt-bindings: serial: example cleanup

 .../devicetree/bindings/serial/8250.yaml      |  9 ++++---
 .../devicetree/bindings/serial/8250_omap.yaml | 23 +++++++---------
 .../bindings/serial/amlogic,meson-uart.yaml   | 15 ++++++-----
 .../devicetree/bindings/serial/cdns,uart.yaml | 19 +++++++++++---
 .../bindings/serial/fsl,s32-linflexuart.yaml  |  2 +-
 .../bindings/serial/fsl-imx-uart.yaml         | 11 ++------
 .../bindings/serial/fsl-lpuart.yaml           |  6 ++---
 .../bindings/serial/fsl-mxs-auart.yaml        |  2 +-
 .../devicetree/bindings/serial/pl011.yaml     |  1 +
 .../bindings/serial/renesas,em-uart.yaml      | 10 +++----
 .../bindings/serial/renesas,hscif.yaml        | 26 +++++++++----------
 .../bindings/serial/renesas,sci.yaml          | 24 ++++++++---------
 .../bindings/serial/renesas,scif.yaml         | 24 ++++++++---------
 .../bindings/serial/renesas,scifa.yaml        | 22 ++++++++--------
 .../bindings/serial/renesas,scifb.yaml        | 12 ++++-----
 .../devicetree/bindings/serial/serial.yaml    | 18 ++++++-------
 .../bindings/serial/sifive-serial.yaml        |  6 ++---
 .../bindings/serial/st,stm32-uart.yaml        |  7 -----
 .../bindings/serial/xlnx,opb-uartlite.yaml    |  6 ++---
 19 files changed, 120 insertions(+), 123 deletions(-)

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
