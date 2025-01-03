Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA1DA0045E
	for <lists+linux-stm32@lfdr.de>; Fri,  3 Jan 2025 07:33:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DCB01C78F66;
	Fri,  3 Jan 2025 06:33:16 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 57FE6C78F65
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 Jan 2025 06:33:09 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id
 98e67ed59e1d1-2ef6c56032eso12356451a91.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 02 Jan 2025 22:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1735885988; x=1736490788;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9JYhGYLehzzVS4jEYnaJXjDH6Mz/6G3WSbJlmci9/3A=;
 b=kJfmOa+dY/8EQPlwFqbFEv79OEjaKdCVUnRmfau/H4OPQnHmiPU7GSsUMg7mdy9Asq
 Jesw2T4LYAJXRuE+59qYextwQdO+qR3uC/AmwXi0/a5P6J+WFau9kxrF5haBhkR0/s4T
 xkTtRbzsnv3fpIZzIzeFzDCfZt1QxR27M3XTQG1jV5fmJJQd36GJwMWO2HKBjinnIxgc
 hL7cNAAEOOziiRsq13cehdL4j5SPQSZH84XTLOSH6UguwJFEIOLZzhcIHogob1ShBhLE
 tUe58Eqd22xNfQx/Go6T7whEVRLJkATXtMD2VWg+daNE54PKQ4++EkFlBWiSxmPziizT
 XQlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735885988; x=1736490788;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9JYhGYLehzzVS4jEYnaJXjDH6Mz/6G3WSbJlmci9/3A=;
 b=jGbm5jW65mMIj7d3NKNYeQfIA8M8kAKSSsTWOfTOU7bp4XJqeTW4WlTLojWxk7rgMr
 O374cQNtu/VE8VNLDmeuW86avwt9wMfoZ4nbkcZ5h6EoCyda3dEZVGrXWk8UKwHhDmOr
 K5uab4yMzytyzM/70haRZYi7O0cZrfGkO0b4AiDVJ5Zl7Moaaz/RrKGO67B2nqrW9KXC
 exTK+XLeenbsQ9HwjyJaJneDbXQIwB06kfRRW/Fkm3CmAYnSN5XZyok7sr8IeMQIbDq1
 fwrUp9XeIuAPp5051KsKgHlab1HziGTeT/y7sCinsOuEfw+O9xloruw37kq9+wa0uh+q
 7Jgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqxfqdxsCihiY4ODSct5Nc97AWx2KHeGq6EYcvwjUyR6biauKQcLgtL6OZwAYKvvFRKSLyDiK5VMmzog==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzjPoWq8bTSKGmV9GV0KX1MvG9YCrBclITQBM5vQE8icRBhcaBN
 Y0yDlacbNhAtlNO8NSGufEeb/MKG4qP5d4pJ70qUAkXKL6o0wYhX
X-Gm-Gg: ASbGncuIUi/4F9s7eJ0mDkl1eOTv9H2vLOa0L/3f51cJNWq512JHBmAa5FFVo0xb/oY
 S/HjkqKSEEaBe5jq1MxlIH3uEv5NsZnYliK3/khC41nQLdkO3kjMve/HSqyxTyb8bsmsuIt9gW3
 wpysSO3k2zp5cqX5zX+mC0UlR/5axEoTbLdu3s8JCq6jf9lJSz8x6CywluDBhlgRK8dPZHk3pVT
 yhdsEwfMmTHlzrmuK/OInjwi9G83tFR6OmEp2gBZJoqe4XTVFRhVYZ0oK4q73GMTzTuWSIX4XIn
 ZbHZu75s0NJRKFPgop7MqA==
X-Google-Smtp-Source: AGHT+IEg9FrZ5YUufYh0MJJtCtJUyPbNJMmGsbwn8DtZhoDwMHr36/JHl3HeB9+5mO4uV2/PACAAPA==
X-Received: by 2002:a17:90b:2e10:b0:2ea:8fee:508d with SMTP id
 98e67ed59e1d1-2f452ec2e82mr73280088a91.30.1735885987768; 
 Thu, 02 Jan 2025 22:33:07 -0800 (PST)
Received: from yclu-ubuntu.. (60-250-196-139.hinet-ip.hinet.net.
 [60.250.196.139]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2f2ee26d89asm29427805a91.46.2025.01.02.22.33.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jan 2025 22:33:07 -0800 (PST)
From: Joey Lu <a0987203069@gmail.com>
To: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mcoquelin.stm32@gmail.com, richardcochran@gmail.com
Date: Fri,  3 Jan 2025 14:32:38 +0800
Message-Id: <20250103063241.2306312-1-a0987203069@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, ychuang3@nuvoton.com,
 Joey Lu <a0987203069@gmail.com>, netdev@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, joabreu@synopsys.com,
 schung@nuvoton.com, peppe.cavallaro@st.com, yclu4@nuvoton.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v6 0/3] Add support for Nuvoton
	MA35D1 GMAC
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

v6:
  - Update dwmac-nuvoton driver
    - Use NVT as the previx for all functions, structs, and defines.
    - Remove unnecessary comments.

v5:
  - Update yaml
    - Remove the properties already defined in snps dwmac.
  - Update dwmac-nuvoton driver
    - Add a comment to explain the override of PMT flag.

v4:
  - Update yaml
    - Remove unnecessary property 'select'.
    - Remove unnecessary compatible entries and fix items.
    - Specify number of entries for 'reg'.
    - Remove already defined property 'phy-handle'.
    - Update example.
    - Modify the property internal path delay to match the driver.
  - Update dtsi
    - Move 'status' to be the last property.
  - Update dwmac-nuvoton driver
    - Use remove instead of remove_new.
    - Use dev_err_probe instead.

v3:
  - Update yaml
    - Fix for dt_binding_check warnings & errors.
    - Add compatible in snps dwmac.
  - Update dtsi
    - Update dtsi to follow examples in yaml.
  - Update dwmac-nuvoton driver
    - Fix for auto build test warnings.
    - Invalid path delay arguments will be returned.

v2:
  - Update yaml
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

 .../bindings/net/nuvoton,ma35d1-dwmac.yaml    | 126 ++++++++++++
 .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
 .../boot/dts/nuvoton/ma35d1-iot-512m.dts      |  12 ++
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      |  10 +
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       |  54 ++++++
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 ++
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-nuvoton.c   | 179 ++++++++++++++++++
 8 files changed, 394 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
