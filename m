Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 726A89DF8F2
	for <lists+linux-stm32@lfdr.de>; Mon,  2 Dec 2024 03:37:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1A1D5C6B47E;
	Mon,  2 Dec 2024 02:37:10 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9E665CFAC50
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Dec 2024 02:37:02 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-724fc1aaa91so3350618b3a.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 01 Dec 2024 18:37:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733107021; x=1733711821;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bDFs4/7sYxUQAdmK+DmPfpiIkb/3lOGS37ALBYfbAeQ=;
 b=IgfdMMrSW5vWs/Ox8827JSm4ImlnY2dPeauWyV1eaBuuzSLQz3BV881/CyPcBE3NZ0
 aTSos0q3DD+5NlNvOEPArIdfPlI8q9sQdE/uOJXdQFSYZUXIt1pWKS+/C2NwneQLJxDd
 qq1JmAyGYUz6jnkjf4foI3fLJqQ5i4SxToOa7opEeJn0EChD72SSmxc9ASXzLOoMq4Re
 nKChQLVZ/q8Mz2TpypWN0NGmdagtinDyFf1Gj1/PSLsvP5vFjV4ko0h6kAS61xdgAADi
 flI0JWtPnaBKD1ktW+nA47nSE1EwwQqvQPfSSH9l0/KLVYGq3MCNma6BhKPcHtXyLeH5
 6wWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733107021; x=1733711821;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bDFs4/7sYxUQAdmK+DmPfpiIkb/3lOGS37ALBYfbAeQ=;
 b=VYX8tpm/dmSuDlZUKrHDdBM1LWKePfbQ4GJnHnpFmz2TQuSLZRLbQ6wQk0B45ycgDX
 LZA492YELj6VHgt2ndgl1bgv2uXzf8EjOT2tr1xGhaWKE+yHfs0SWvot6VpFd3ue5Z+j
 zav4DiZY0/PrC2j5OHQVzl0iNJpEpMWSjVJpGInAI+eFhVskftAMkyPURwYwfQGt6nOo
 92sbHotSMyKshCchiMGr0DKAPawu9PKUd3tWhzWhY8mXIalUg51Mqb+ZbTzIJyS2E12t
 +zIdr6LqOYr8ATXs6xysZYX7+Quk3XWEOC9y5l0ATUJc0rOgDM17NcHaO86FxEaODw+6
 VxoQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpuIHOJS+zrQzxIp94sqIcsD74PrbqrcsJTaeXZJ1GiwncAQ+02KFKCX00TtwedZalbHSy65I57e3x9w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwhPgGA++LUOcyVsDZNHu51CAi57U2quOh667BCWL4ZyzCBUqBZ
 8JXT1riqbHBvFAsQ6ZU8cuQRzW92WH06zwQSaalH+rTGI5nGRcjO
X-Gm-Gg: ASbGncvqN2eizbo6L4LbVnuFkrYsC3tXUAQF2rEX2HUtMHt9gkmBltatGSaliIFUi8Q
 p/ERJKpYKgIWOu6CATQIgeAL0SU61/P/aTIcpEX9Eup4a0jMlX2iaB2QEDGPgvTY3t2fdTClkEo
 f7+X/CaOJKW7b8pIz09GUtF53myDAimvE6NkzVblgV58KFRJGICZBabixfcoOcS2QowmE4zvGK+
 cZbDEx9RJeLbURULMjaQKAglKw9/OodpKkn/XHLQs9kM6ocNrpdejsLRyAG55tBryTvEiLkvvCK
 ZOSQVI3JC75bfnI=
X-Google-Smtp-Source: AGHT+IGLWJOBt6A4ZzleNpaTexfFquv9ndvXCA2owoRgs9f4h1shTttjNxjyQrv9s0g8p/Xs1tMZ1A==
X-Received: by 2002:a17:902:d491:b0:215:4e40:e4b0 with SMTP id
 d9443c01a7336-2154e40e808mr142897375ad.9.1733107021039; 
 Sun, 01 Dec 2024 18:37:01 -0800 (PST)
Received: from yclu-ubuntu.. (60-250-196-139.hinet-ip.hinet.net.
 [60.250.196.139]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2159ebee334sm2306375ad.67.2024.12.01.18.36.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Dec 2024 18:37:00 -0800 (PST)
From: Joey Lu <a0987203069@gmail.com>
To: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mcoquelin.stm32@gmail.com, richardcochran@gmail.com
Date: Mon,  2 Dec 2024 10:36:40 +0800
Message-Id: <20241202023643.75010-1-a0987203069@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, ychuang3@nuvoton.com,
 Joey Lu <a0987203069@gmail.com>, netdev@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, joabreu@synopsys.com,
 schung@nuvoton.com, peppe.cavallaro@st.com, yclu4@nuvoton.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 0/3] Add support for Nuvoton MA35D1 GMAC
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

This patch series is submitted to add GMAC support for Nuvoton MA35D1
SoC platform. This work involves implementing a GMAC driver glue layer
based on Synopsys DWMAC driver framework to leverage MA35D1's dual GMAC
interface capabilities.

Overview:
  1. Added a GMAC driver glue layer for MA35D1 SoC, providing support for
  the platform's two GMAC interfaces.
  2. Added device tree settings, with specific configurations for our
  development boards:
    a. SOM board: Configured for two RGMII interfaces.
    b. IoT board: Configured with one RGMII and one RMII interface.
  3. Added dt-bindings for the GMAC interfaces.

v4:
  - Update nuvoton,ma35d1-dwmac.yaml
    - Remove unnecessary property 'select'.
    - Remove unnecessary compatible entries and fix items.
    - Specify number of entries for 'reg'.
    - Remove already defined property 'phy-handle'.
    - Update example.
    - Modify the property internal path delay to match the driver.
  - Update dtsi
    - Move 'status' to be the last property.
  - Update dwmac-nuvoton driver
    - Use .remove instead of .remove_new.
    - Use dev_err_probe instead.

v3:
  - Update nuvoton,ma35d1-dwmac.yaml
    - Fix for dt_binding_check warnings/errors.
    - Add compatible in snps,dwmac.yaml.
  - Update dtsi
    - Update dtsi to follow examples in yaml.
  - Update dwmac-nuvoton driver
    - Fix for auto build test warnings.
    - Invalid path delay arguments will be returned.

v2:
  - Update nuvoton,ma35d1-dwmac.yaml
    - Rename file to align with the compatible property.
    - Add an argument to syscon to replace mac-id,
      with corresponding descriptions.
    - Use tx-internal-delay-ps and rx-internal-delay-ps properties for
      configurable path delay with corresponding descriptions,
      allowing selection between GMAC internal and PHY.
    - Add all supported phy-mode options.
    - Remove unused properties.
  - Update dtsi
    - Modify syscon configuration to include an argument for
      GMAC interface selection.
  - Update dwmac-nuvoton driver
    - Remove redundant device information print statements.
    - Remove non-global parameters.
    - Retrieve GMAC interface selection from the syscon argument.
    - Parse Tx and Rx path delays by correct properties.
    - Update configurations to support Wake-on-LAN.

Joey Lu (3):
  dt-bindings: net: nuvoton: Add schema for Nuvoton MA35 family GMAC
  arm64: dts: nuvoton: Add Ethernet nodes
  net: stmmac: dwmac-nuvoton: Add dwmac glue for Nuvoton MA35 family

 .../bindings/net/nuvoton,ma35d1-dwmac.yaml    | 134 +++++++++++++
 .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
 .../boot/dts/nuvoton/ma35d1-iot-512m.dts      |  12 ++
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      |  10 +
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       |  54 ++++++
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 ++
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-nuvoton.c   | 179 ++++++++++++++++++
 8 files changed, 402 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
