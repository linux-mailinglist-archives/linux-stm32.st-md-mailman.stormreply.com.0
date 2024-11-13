Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D5E9D4181
	for <lists+linux-stm32@lfdr.de>; Wed, 20 Nov 2024 18:49:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 06BFDC7A844;
	Wed, 20 Nov 2024 17:49:45 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5305EC7803C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Nov 2024 05:20:00 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-72410cc7be9so5650705b3a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Nov 2024 21:20:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731475199; x=1732079999;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Iwuqnvj/nbrL3+EwHhwq8mWZzBCYb5TWiIcYxHRcvLE=;
 b=jUUqmMVczuqRKMkFdK1bxyXJXVvuvTglbN2Nd9pwyN50vqROQfWuyfNBAcvTizh8uS
 F0PzHoEja90PrT+TShPOUawG7ZhU1PG/p2QrpaVJy8r5FHsD/Tmrg6To28sYqyS/pUGC
 xNc3fXNKCdbkL5F8mxwqUM5hVRvTvRwxb3XQUBmZPEEkAklpTMgX4RExUe5xxnmu9Fjl
 pev/QWhpi2Ab/rHnZ86EP7gB6hmf3YdHDwZqqAd7e6RXkfIHTFNscw6zU2r88kDo4FTc
 YFxgIxDTcuW9KyDFF6t4jgcXgdK8B8ZC6q6l6FzyMbbix10/NXKVe4InwWQtlcUnl8Y6
 C82A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731475199; x=1732079999;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Iwuqnvj/nbrL3+EwHhwq8mWZzBCYb5TWiIcYxHRcvLE=;
 b=QCHPeXcpwCHuh+2pJMTVfGMxQIQVRoqXi7ZGPad3IXwdvYMq9kVlOmPDZ1FhjMpQKB
 M4hO7QbHl64/upQPCyK9RpbpRu1dX63wge9EafJB24um7gKXQO0NAnDDJuy55rbCvWiw
 FUiNybo9syMpeb9eFjyTb/efHGG3Tn3HwOSFUs5Ezvq+dpPnKy1JBzkW2O+MnJNTpqf9
 i9gOWlbeif5RskMRe3j0UW3biAQwRgH+eunRKFCzwKZalx/AgOqnC18J76n2zmz8RjII
 6ou5zTYAMsnA6XVzfFZ8SCRG6qZ2wy8oIRNQmnixUZMZ7aRmTIN6z3xTIH1/QWghswhI
 bemQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlSNBawjI1lcvMYZal7rVP6OI8CICNIbG9UZ5iCXf1dfbL7zvrj71Ta1fJ7R6m/JLLYzaLjAjZEPU8Gw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YygIMeARHBxQdkbVZz3bRGm5JL6+5UJ9ZlgSMVIhW1SL8Hr7UtQ
 Q018AxLH/LWStbwtrKwx39UTqRBUetDjm4EnBtvCMq3vzXqZuc/Y
X-Google-Smtp-Source: AGHT+IHHLuQHdAS2u9WN0pIMIXl2KNf3Ujr3Tnj71CU1NlZaH8WrIseMiurWt5EYjyMM3qTV3eIdXA==
X-Received: by 2002:a05:6a00:2385:b0:71e:7887:81ac with SMTP id
 d2e1a72fcca58-72413349148mr23941105b3a.16.1731475198540; 
 Tue, 12 Nov 2024 21:19:58 -0800 (PST)
Received: from yclu-ubuntu.. (60-250-192-107.hinet-ip.hinet.net.
 [60.250.192.107]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-724079aaa01sm12644376b3a.100.2024.11.12.21.19.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Nov 2024 21:19:57 -0800 (PST)
From: Joey Lu <a0987203069@gmail.com>
To: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mcoquelin.stm32@gmail.com, richardcochran@gmail.com
Date: Wed, 13 Nov 2024 13:18:54 +0800
Message-Id: <20241113051857.12732-1-a0987203069@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 20 Nov 2024 17:49:43 +0000
Cc: devicetree@vger.kernel.org, ychuang3@nuvoton.com,
 Joey Lu <a0987203069@gmail.com>, netdev@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, joabreu@synopsys.com,
 schung@nuvoton.com, yclu4@nuvoton.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 0/3] Add support for Nuvoton MA35D1 GMAC
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
  dt-bindings: net: nuvoton: Add schema for MA35 family GMAC
  arm64: dts: nuvoton: Add Ethernet nodes
  net: stmmac: dwmac-nuvoton: Add dwmac support for MA35 family

 .../bindings/net/nuvoton,ma35d1-dwmac.yaml    | 170 +++++++++++++++++
 .../boot/dts/nuvoton/ma35d1-iot-512m.dts      |  12 ++
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      |  10 +
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       |  52 +++++
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 ++
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-nuvoton.c   | 179 ++++++++++++++++++
 7 files changed, 435 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
