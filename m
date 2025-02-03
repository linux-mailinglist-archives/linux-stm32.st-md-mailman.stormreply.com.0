Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C33E7A25213
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Feb 2025 06:43:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6250EC78F7B;
	Mon,  3 Feb 2025 05:43:53 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D34CAC7803B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Feb 2025 05:43:45 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-2165cb60719so69267585ad.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 02 Feb 2025 21:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738561424; x=1739166224;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4FGOb/kuuSUyymnQVyBkrBupzFYWT4l1pdvKkJ2J+xI=;
 b=gyTSHndi/Ww4Nvv4gFe6BxWeX+O8utdbPYhIBfdaDrgVmnY4+bdCCsZQF9V71a99/9
 c66dgNsQCtXCXeYIs9rqbizMkIrfookkgbkFH07XOa5M1cD+Ok3cMRHOJ7dUH5ktZNZ7
 0srXmxeJ95sPsc6MhH5xbqqaDp8tUt3jGCUVAu6qnuCozdRou21pB6LY/n6ea5VEjqB7
 pwiahrHuj03w7gEmE8lWryoAvfWJr9vtMAL/ckDYXSVHWrMfQMTd4iztftajRxablXjZ
 a+fAb25F5MbwilZoPpUXpwXOooiA13Mlgh+rw8HKsngrLDfB6UDmIvmvgnN379GLz1g6
 YzrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738561424; x=1739166224;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4FGOb/kuuSUyymnQVyBkrBupzFYWT4l1pdvKkJ2J+xI=;
 b=SouE2cZ4TZTeNWMq0UUm8ZEj+Q94w61SwVnOcPHuuqTVQCOoKlfRS7nMSL5HAPmgf5
 FFc3tguh1VbmtVhrr0ocY5GaRTnyb5Px+uxLgJYzpD3AtdwSztuCi5Jj6Wp2xH+asRr8
 MtGCNdxaeN2QTVlK3uYpIKmD7J4HBB/huZWcv2Ky03/Yc2a0xhTldKvvVK61ndaJ62Me
 huOhpwk1FL3lZRi4+ag+0SkCVtVaHUDOTQkcBPEMkDb5/gjRlQ1MddcC2LZ+ILulTl2n
 lj4JiELo7d7REDGyoz6de2jxWVSYdUxRih1a29ubpi4vXhJt+nddFmisFcOSJymCOUYN
 tA4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRhWlXsPm951ll/nccl/3TIwI/6toZLD3w1P0OAY/YweuaT+Towh3zELv73mYzjXw3x8sw7FvhGuTm/g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz4WZIgRmSbsLIKyQNZD8XW/6W5nLsB42jw4x0MMBbSf8qpo1Zc
 r3uzK0V38LwS+ot31S9VX4ib/r6a2xdWm5dIFNhhDGsaaZR78D4k
X-Gm-Gg: ASbGncuuUzD/rjshwVtTBC459wnGUlG6/TuX9m2cGx07Ib/sGid+RxuHkc624G1pSiK
 6xoRzZnIFmTdHfEpqNwWWQk70ebqLw6ONbn5Sank5vHqrHr574i0GR3XOVc6axlvkcuQmeNFQ+n
 yFCUkJIXkb0fwCUsuqZjga4UX3IkWbxDUIgbvH+d976Ygd5vUPYgJEdjyoqFmRdYe/phMRnpN77
 TOkUdsROQ0Pa8O2JgYeUJnLP/eMMT7FRjxlHhqPCELvZSw4/uaM4vIvlGN7Ks/cMFl5TB3Jpqql
 xb38mBFVC6aNtV08C1JgJHiJTh+qBGANlpN3IxZtMCXJgSxrJwnCtxTG
X-Google-Smtp-Source: AGHT+IFZo0ftKSRImunKlJXQj0l7sQfkYC+YNDQdjmv/qB1QLAW3j7xBuAzdPaBhuWUb5WL8D9R29g==
X-Received: by 2002:a17:902:f546:b0:215:8d49:e2a7 with SMTP id
 d9443c01a7336-21dd7df98f8mr329030855ad.50.1738561424238; 
 Sun, 02 Feb 2025 21:43:44 -0800 (PST)
Received: from yclu-ubuntu.. (60-250-196-139.hinet-ip.hinet.net.
 [60.250.196.139]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21de32ea5fesm66894555ad.132.2025.02.02.21.43.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Feb 2025 21:43:43 -0800 (PST)
From: Joey Lu <a0987203069@gmail.com>
To: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mcoquelin.stm32@gmail.com, richardcochran@gmail.com
Date: Mon,  3 Feb 2025 13:41:57 +0800
Message-Id: <20250203054200.21977-1-a0987203069@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, ychuang3@nuvoton.com,
 Joey Lu <a0987203069@gmail.com>, netdev@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, joabreu@synopsys.com,
 schung@nuvoton.com, peppe.cavallaro@st.com, yclu4@nuvoton.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v8 0/3] Add support for Nuvoton
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

v8:
  - Update dwmac-nuvoton driver
    - Improve the driver.
    - Update the license to GPL.
    - Update the description in Kconfig. 

v7:
  - Update dwmac-nuvoton driver
    - Update probe function to use stmmac_pltfr_probe instead.

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
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 ++
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-nuvoton.c   | 182 ++++++++++++++++++
 8 files changed, 398 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
