Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A16B89D4189
	for <lists+linux-stm32@lfdr.de>; Wed, 20 Nov 2024 18:49:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 65E27C7A854;
	Wed, 20 Nov 2024 17:49:45 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AB603C78F65
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Nov 2024 08:27:32 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-20c6f492d2dso15972885ad.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 18 Nov 2024 00:27:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731918451; x=1732523251;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gkSbdNRIUJlQANFk/zwDmvqLsXhMldYS43rY4RRFAzE=;
 b=BCVveko4DShCw2AxxOfS/hrI8puhxfqq85qKVeh0AhusXIfUcCqr5ryz0GS1k0rLvg
 8ByGcCzT9lzRouDrs4w+e1l1p3xYfxub0PWWkxVh9B1isMj8ccEq110+R+ldAv77k25N
 r4+ngvMeYUVhY4ChwJCN5dXkCCRIVLVz6PgDwgPu6JpO2MVdmniAZkDogbCWkw33+Q5y
 GuFwfrLWzcTlu4MVR7mHQIYFb9Fi8cPLA3tbqxsEOSBkSjML/zw8hv7ppq6ylxlHO8DJ
 hskIZGhhDC66WFrROA4d2gCZC0OHpyQmMfLRJ7a8KyYZtJuX0u/2zOwWO2uTQt0Re+Iy
 JfZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731918451; x=1732523251;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gkSbdNRIUJlQANFk/zwDmvqLsXhMldYS43rY4RRFAzE=;
 b=UsQq9EnIYmMpDoQB3RhgxkR8S+DnTcsMUpshzQFhy2pXSp3EWdyR02d+eAzapgpgCM
 U8ry08D4natKHVtdg4EaotFpgKewwAxXekL3XLs9dxbZLSnKIHomsMc944FLM8fDMaq0
 4h0l3Gd/4CRajXbJU3rgnA+uWw2fWpPolwEWDmP8x8X6Z8KJQyDdy+N8bdwIAVGQ40GP
 IKDyR86z3NnUPnGIJa2Lo/WnmUMnACK0+PYRbxvlCMWPEUGOy15wBjp1PdH4QaFhLBgn
 L5WAeusTlkPtHIo3d2KW5ArrdiLpzWFNqioSIjrSGScEmoODg8iIvx5UD54ARbJIIDqj
 yjFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVm1zAwDzty5mWJssRg0It2t+M0QCRgdaIa8dCMSfSIvDmqikxn44Q3OUu8fK4TaeF78F5AhQUL2vSl0g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxKxwi9UOKJWuytsd6htjuCmDmIQtF7LcHcD3cmSl0NLYQEtqaL
 eW9nRzT+zeFNibX3vRd9Nw5DaPshy7JZbjmgBNJU5Whqy/uWwaSj
X-Google-Smtp-Source: AGHT+IEvoyj4wxb7J7Wh84n7jGX2+vtLnvotel8z2KtjVjP3hhCMcqWSJASSXlB0gPXXOqon5nxuTg==
X-Received: by 2002:a17:902:ec8f:b0:20c:a692:cf1e with SMTP id
 d9443c01a7336-211d0ed9a12mr171662035ad.43.1731918451221; 
 Mon, 18 Nov 2024 00:27:31 -0800 (PST)
Received: from yclu-ubuntu.. (60-250-196-139.hinet-ip.hinet.net.
 [60.250.196.139]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-211d0ebbf9esm51883815ad.45.2024.11.18.00.27.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2024 00:27:30 -0800 (PST)
From: Joey Lu <a0987203069@gmail.com>
To: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mcoquelin.stm32@gmail.com, richardcochran@gmail.com
Date: Mon, 18 Nov 2024 16:27:04 +0800
Message-Id: <20241118082707.8504-1-a0987203069@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 20 Nov 2024 17:49:43 +0000
Cc: devicetree@vger.kernel.org, ychuang3@nuvoton.com,
 Joey Lu <a0987203069@gmail.com>, netdev@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, joabreu@synopsys.com,
 schung@nuvoton.com, peppe.cavallaro@st.com, yclu4@nuvoton.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 0/3] Add support for Nuvoton MA35D1 GMAC
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

 .../bindings/net/nuvoton,ma35d1-dwmac.yaml    | 173 +++++++++++++++++
 .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
 .../boot/dts/nuvoton/ma35d1-iot-512m.dts      |  12 ++
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      |  10 +
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       |  52 +++++
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 ++
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-nuvoton.c   | 180 ++++++++++++++++++
 8 files changed, 440 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
