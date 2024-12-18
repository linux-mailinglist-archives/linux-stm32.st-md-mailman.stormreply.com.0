Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 970A59F652E
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Dec 2024 12:45:01 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 18B55C78018;
	Wed, 18 Dec 2024 11:45:01 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 60250C6DD9D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Dec 2024 11:44:53 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id
 98e67ed59e1d1-2ee6dd1dd5eso4933259a91.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Dec 2024 03:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734522292; x=1735127092;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cyj8Ap7K1BZAQuE1yfehu91/jP7Zjmb2nNdeir2Wyz8=;
 b=LWp8WDfPy8qQi6Au8mPlQqk+SLp2FVY35sf5SVe3HVZX1S5j58sRcKR7ZJ1fzp7fk7
 j62TcL1NdjiCE35whwRAI2PDItUvGLr1lHPnFczAoNNERoysGcIHmN5NgKQyUY1AIpPz
 5frQvEuppuw070JOGYUpGzXvXvkst7Bx0U4bHI5jYzC9/mcEcRHDjCbLZXUSCypvPv5a
 yKZIrFrRsPQyR3bXyWV2i8mObgZ2DY2F6QkxRUPiY7RM1vOqyNkHXH19LF0RzASnmeh1
 klCK+G+A8hR4Ys6iEqxrN1MDQPpLCS1LPKK1MbpGIwDVExz0+GoPgNvHgrOYLyuXkcHl
 qHLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734522292; x=1735127092;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cyj8Ap7K1BZAQuE1yfehu91/jP7Zjmb2nNdeir2Wyz8=;
 b=g/is8x0URzCGOdDwpN/OEFQURFbzkFc+u2qPb/Kb21fOwVjgluMfbhf8OWPZk2p0sf
 hTjPSyeKx2zsk2wDl8sAMvq4V095P8CuohrN8A3jFIOG91ZK+z6T6SdJSngV8A15U70g
 Vu7pbtJvwdyl2NBFerhRkGlOdX0oQMMVu2LAsRsCaUnbC0kvM1fUCy5qHN3Au3NI2EFC
 dTWOqjfsFYFqSnsH0cmjPzLz4H5+ZrMKch/0R3r3wRBNlBhOcZvHo1XP4zkYRfjz0mBi
 sgb8uKiWlyR42sXBUdsDfeJ/EApTZ8AFzoijKhBkpU33YGFswlJmEHX27pV+KEL3RJ5U
 8rCg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMIyfns2uVPSwv37IgUGOT1TlR5sLl7ioyw3JnrmwMXHn71O5uud3Cnao4iXKo+Lv6yqxqcpTK/dfpOQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxzwuXNcdz7ehDZ4dkayg5jiAESTq8ouotYMAjhXM0HNwb6VAxg
 bh9e05uLE/jcnh0JmWqllWziIfNp4XyYNlIEnl+/Bv3ZqGFVqk0i
X-Gm-Gg: ASbGnctIq0ZR6r3JVh0a7mywFuwKbR+ZrC7b6M5Ys6L/WGeOzofNDkY32U8g/nR9r2e
 tlJZVfksMocchji2N38F66P6u0ErQF1q1oYnUDtaCVsqPZCmRg4lA73fh+EhUEdw10OhHMyqF4Z
 UQ1Djtw6LiNUmrtxcYj9vvt4YZSLeiYI3pcpMc41TLkvICriBHru3w6mvHX+znfK63k+tET8Boo
 Morv/z5tWVJQFAqBXK+VTQI5EC54F8KfEVZCHYTEpQJ5/8HB7Qxta3HllRK2cndqnzOIARBw0ZA
 eJg7JC2iBwnZa2nItI8bUQ==
X-Google-Smtp-Source: AGHT+IFRyIbN8ECWy6DzsuI2osZG7JECHco2/VwojjYl5BcOV/Bt3FlomuUurW8aE5vh8OivSmLSeA==
X-Received: by 2002:a17:90b:5251:b0:2ee:4b8f:a59c with SMTP id
 98e67ed59e1d1-2f2e91fe20bmr3243768a91.22.1734522291709; 
 Wed, 18 Dec 2024 03:44:51 -0800 (PST)
Received: from yclu-ubuntu.. (60-250-196-139.hinet-ip.hinet.net.
 [60.250.196.139]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2f2ed62cddbsm1324362a91.15.2024.12.18.03.44.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 03:44:51 -0800 (PST)
From: Joey Lu <a0987203069@gmail.com>
To: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mcoquelin.stm32@gmail.com, richardcochran@gmail.com
Date: Wed, 18 Dec 2024 19:44:39 +0800
Message-Id: <20241218114442.137884-1-a0987203069@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, ychuang3@nuvoton.com,
 Joey Lu <a0987203069@gmail.com>, netdev@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, joabreu@synopsys.com,
 schung@nuvoton.com, peppe.cavallaro@st.com, yclu4@nuvoton.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v5 0/3] Add support for Nuvoton MA35D1 GMAC
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

v5:
  - Update nuvoton,ma35d1-dwmac.yaml
    - Remove the properties already defined in snps,dwmac.yaml.
  - Update dwmac-nuvoton driver
    - Add a comment to explain the override of PMT flag.

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

 .../bindings/net/nuvoton,ma35d1-dwmac.yaml    | 126 ++++++++++++
 .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
 .../boot/dts/nuvoton/ma35d1-iot-512m.dts      |  12 ++
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      |  10 +
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       |  54 ++++++
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 ++
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-nuvoton.c   | 182 ++++++++++++++++++
 8 files changed, 397 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/nuvoton,ma35d1-dwmac.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-nuvoton.c

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
