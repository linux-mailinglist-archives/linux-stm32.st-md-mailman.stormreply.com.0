Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D8884D39FF3
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Jan 2026 08:33:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 79F7AC87ED3;
	Mon, 19 Jan 2026 07:33:53 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 45F17C555BE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Jan 2026 07:33:51 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-2a0fe77d141so26346035ad.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 18 Jan 2026 23:33:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768808030; x=1769412830;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=T+Mp2cAzIjQk/XVhc3r0i+qdUMWj/sYGX5LNPwYnZpE=;
 b=UtjpbY8XqSPbUgqjpAf/NvkSSyGjQRyQksZ0k4IlIRhMEqBK98TNSbP3tbuRrX6VAz
 IcI0PLea/tW465oPTCh2n4XPZcw77VO+S5zHYTpbcGcWsaXuINr3lNMeJVnvwZFrG059
 YA2G+eIj3aB9PJLKI89Ap7qw/ry3rC0tMdftTRvDOoyZzPCRIIw7EfNnfpK6qZ/bnipQ
 l7fNgqz9KHAK6NIJo1pREB2/MSr3Wd7624SWLEeVHMALpQeF12agrQ6Zlx5Gi4DxQUTI
 944F7XnIk2CAY6mxRuJh6uJrvvhlx7BFTxvZJSj9HxDC1nBsdQD5Cgg7Z/rjl817rdDa
 1/iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768808030; x=1769412830;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T+Mp2cAzIjQk/XVhc3r0i+qdUMWj/sYGX5LNPwYnZpE=;
 b=X3HlGA9lKxXGKZFItbVioO9M45wfEvg6wKddE0FPoH8A/8fG5vOJTfvuY4IUZ3kmNq
 si/Hg5BGTCYnBMTWE+PA7mJJgMurwBQ+FDRRu45rUrSC4cGdpo+zybK+8aDWwputKkWb
 5s0V/oSXPb0NR/fEhrd+Vkc6SAqRlzmT5fY255CFXpqRPQFwLzOYOSMQX9foWiqUnyKl
 kQIPw5EVD5sV7eyVxKSO641LLhyVmEafghUApBmB941D81pJKvgMxjmY5n3veBvlyAUq
 HiHvZECjp8XqKj3PiOh2sd4BBo07Dwxtl2wKkOCLsNtTjrGjL2p/HMWvS3EM0CotBCMu
 zS1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVUZHBH6L4Sdwbxxutn6VZAtbYx8uYYKAc22jDcWkaQWdOGWrAXlDvoHgDORRnYDoP0Ez+VqgL2vwHEg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyXgy4iZiiTGOOC2KEL/MS/4UIN5NHqtknOGf/PF+JpN1tnxSu2
 GYao4rnWGJbSWJ7lEuzRNfdM2jk53GHpnhdupjwUlTqSMoEqfnAsHyXb
X-Gm-Gg: AZuq6aJmqYhRXaEMgctH57yDaF1+Lu+A3oNZiCzM4AUnHcaN4mSezARNvhtmDd+js7G
 O3G38VmHblcrf4butY1gAM55RtsaTwEUvmumFDvhFSchj3ik3Uif/PEow2Yfq+DUBmOtKvxkKpx
 +/4EZVbgkA+r6/y6ybdb09t0nftF/hqOSZIcO1uX/iJplIx6blzP/YkDaiADJ3NUKE6RbYFBoAE
 p+r+eDrCC4gAuWLwId/6oAN5Oq9TxyALuiPo6GGWPWjft3/Ge5XEwzQ1yYgvW+bjoIj/XM9sH+w
 3ETw1Y0oUIELhHDo1uQmcNADYEB1bbtdx4aQuTL37ToCjjydJIg4YT7T6ms4Tj6Ml8ZFP556BSM
 aKz6U2Z3/49We51b56ZEqspcz1Fj8Ghpneq+dmXvEsqEp44Wfwa8RJ7LuSikUkeA+twkVa88GIe
 X7gBqPW1Qlk5tFJ+lOEYxb7uYlryNuCPeFNJmhVhE43KMmWFytVPHcWBS/EwvbDKaKhB1PpULn
X-Received: by 2002:a17:903:350c:b0:29e:9c82:a918 with SMTP id
 d9443c01a7336-2a717535134mr90244535ad.22.1768808029614; 
 Sun, 18 Jan 2026 23:33:49 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net.
 [60.250.196.139]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a71941e3cdsm84863325ad.100.2026.01.18.23.33.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Jan 2026 23:33:49 -0800 (PST)
From: Joey Lu <a0987203069@gmail.com>
To: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mcoquelin.stm32@gmail.com, richardcochran@gmail.com
Date: Mon, 19 Jan 2026 15:33:38 +0800
Message-ID: <20260119073342.3132502-1-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
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
  Changes since v7:
  - Rebased onto the latest net-next.
  - Removed unused symbol.
  - stmmac parent driver now reads hardware features directly to support
    Wake-on-LAN via magic packet, so PMT-related overrides in this driver
    have been removed.
  - Update dwmac-nuvoton driver:
      - Update the license to GPL.
      - Improve the description in Kconfig.

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

yclu4 (3):
  dt-bindings: net: nuvoton: Add schema for Nuvoton MA35 family GMAC
  arm64: dts: nuvoton: Add Ethernet nodes
  net: stmmac: dwmac-nuvoton: Add dwmac glue for Nuvoton  MA35 family

 .../bindings/net/nuvoton,ma35d1-dwmac.yaml    | 126 +++++++++++++
 .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
 .../boot/dts/nuvoton/ma35d1-iot-512m.dts      |  12 ++
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      |  10 +
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       |  54 ++++++
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 ++
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-nuvoton.c   | 174 ++++++++++++++++++
 8 files changed, 390 insertions(+)
 create mode 100755 Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
 mode change 100644 => 100755 arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
 mode change 100644 => 100755 arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
 mode change 100644 => 100755 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
 create mode 100755 drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
