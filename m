Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E3790F64A
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Jun 2024 20:46:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 828D8C7128D;
	Wed, 19 Jun 2024 18:46:09 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 598E3C7128D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jun 2024 18:46:02 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-35dc1d8867eso77991f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jun 2024 11:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1718822762; x=1719427562;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Q803tOePwccb1h2zDMiIz3ozPcAah2s1cv6FSztbWf0=;
 b=hQaBfUkX/CpGSuaxIkRyTF6yai3yTNXfewjNm/PnfOcFt19mCzwFO2adHJI0eknCc3
 gndDwR/GXqOxdVfxu6KoQo/kehkxCgdXUwMx3MYIzG/CokQfUe1iNJoXRzxNgGsFNP+U
 oSKItrea39iOq3lVSZKSmIf489MjrKWxlkmOAgOx7bovX8uZH8P/0EtIphKs7Yowz+0g
 TeJ24Lkc2s9rX4h466fJsexKaSuwI8eDdStph6ithsmqbPya2KZ4Ii1xmnYg47zB79dx
 dsXE1Nh/9Ndr8oo8hRxakFtM7Yt3OU7a2SXYlopg4tusMgdXZcPBgTV23iHRidI3Kzjt
 EaAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718822762; x=1719427562;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Q803tOePwccb1h2zDMiIz3ozPcAah2s1cv6FSztbWf0=;
 b=MDRIzSnRXDBIiPyh/jJmYnB0Kto3afIwz2amiM0eh661ZyU3tgoeeKT/8arsPW5jze
 WzXvv1T8eti2A2D40i7kG0kdXR3HmeSusNzaNJJnYA5XK1ijPgjH790VHG50x82eySNX
 unp1Vx/IfIt21GPfHGDqxPB3G+9aiDk9TUtHQI5SDE7WHY3XxYuCsNqsC76abPC0Es4r
 8SduTATOORYs9GT/Ju3YEoVB22+dJLQxtHoXqNT5L7ytTBe6WxQmvFftXArZ71LW4QHw
 pCJ3N4C4ShgmzPo3N467dL3QZlNxM8omsT7YYNxfA/nrZAlhg74RAyD7TVtZdry4r7yl
 TvlQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCdXbVg+1ocdF036i+wGPmKKfW5+p2XpAT1ZthDlEXOYKCuU44KVFYz4RZ9BOqUZvwtC7MkSCcCVk3/8hBQ0uk9e8Ob/rTJ2kmBavjaxksZZwRAeuu48DT
X-Gm-Message-State: AOJu0Yy4lsIB/bijrjS8Rsl2J5vIOp0iGu14u0EneX5hVG5xzWcP+HKO
 rGyp4PYjkOX7vDR2x9e9ZfHxa6DaDjl1DiGssUUQ3ktDDIi5oBZRc+QcNdStYsY=
X-Google-Smtp-Source: AGHT+IFWT+3bRELnyfZyXWx5RSUNx7IO660yuwGioJQSIgOSEIf5ViL1XqpqGrTP8TUu85sQWpkvPA==
X-Received: by 2002:a5d:43c9:0:b0:35f:d6e:f7bd with SMTP id
 ffacd0b85a97d-36317b79cabmr2407085f8f.29.1718822761741; 
 Wed, 19 Jun 2024 11:46:01 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:991f:deb8:4c5d:d73d])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36098c8c596sm7594156f8f.14.2024.06.19.11.46.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jun 2024 11:46:01 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Vinod Koul <vkoul@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>
Date: Wed, 19 Jun 2024 20:45:41 +0200
Message-ID: <20240619184550.34524-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 0/8] net: support 2.5G ethernet in
	dwmac-qcom-ethqos
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The following series introduces various related changes that allow
supporting 2.5G ethernet on the sa8775p-ride board.

First two patches add support for the new SGMII mode in PHY core and the
dwmac-qcom-ethqos driver. Next three introduce support for a new PHY
model to the aquantia driver (while at it: fix two issues I noticed).

Final three provide a way to work around a DMA reset issue on the
sa8775p-ride board where RX clocks from the PHY are not available during
the reset.

Bartosz Golaszewski (8):
  net: phy: add support for overclocked SGMII
  net: stmmac: qcom-ethqos: add support for 2.5G overlocked SGMII mode
  net: phy: aquantia: add missing include guards
  net: phy: aquantia: add support for aqr115c
  net: phy: aquantia: wait for FW reset before checking the vendor ID
  net: stmmac: provide the link_up() callback
  net: stmmac: provide the open() callback
  net: stmmac: qcom-ethqos: add a DMA-reset quirk for sa8775p-ride-r3

 .../stmicro/stmmac/dwmac-qcom-ethqos.c        | 44 +++++++++++++++++
 .../net/ethernet/stmicro/stmmac/stmmac_main.c |  6 +++
 drivers/net/phy/aquantia/aquantia.h           |  6 +++
 drivers/net/phy/aquantia/aquantia_firmware.c  |  4 ++
 drivers/net/phy/aquantia/aquantia_main.c      | 47 +++++++++++++++++--
 drivers/net/phy/phy-core.c                    |  1 +
 drivers/net/phy/phylink.c                     | 13 ++++-
 include/linux/phy.h                           |  4 ++
 include/linux/stmmac.h                        |  2 +
 9 files changed, 121 insertions(+), 6 deletions(-)

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
