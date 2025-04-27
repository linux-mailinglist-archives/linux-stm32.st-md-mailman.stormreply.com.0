Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C27E9A9E078
	for <lists+linux-stm32@lfdr.de>; Sun, 27 Apr 2025 09:44:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6D568C7802E;
	Sun, 27 Apr 2025 07:44:10 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CE403C78006
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 27 Apr 2025 07:44:08 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-43d0c18e84eso17154695e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 27 Apr 2025 00:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1745739848; x=1746344648;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=oinzcqCiVbGgyb0iiuzscDKJeJyyI76yLcJfoJ0sjS8=;
 b=ICECR0lehPsf9bZ0UoipdfzEYfDqr/Jem8cPsoBmyLadX/gIhKasrH687j5zpBvUVU
 8P7GBuU/I2dgKf7T3Ovs+5q3b3fga665uXCHFngtCTfVvyZ9pQXd2P//PUqo9dET+0Vr
 dtMOPRuXb3l2soSgBYm83ouTwgCcbMqYOK/SU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745739848; x=1746344648;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oinzcqCiVbGgyb0iiuzscDKJeJyyI76yLcJfoJ0sjS8=;
 b=ftffG1DRlWeOL24Q3PQilfur7wwnPJWZbe6u1txWxJ9EWhUYGaWJU5e1Pt98Tystzd
 bevYqYg/Y/mm15vuX1G2eDI9lFuJumgu7QYKVKP/MrWJqkBLac1S65iLhvlKzzpSFrvM
 B2MGvsX65kNMQ2MDgzRb2UH3L3PQ4S/r+ExJWO6FpHZMNtr4MmLxNkOa3WO04Yofph22
 zHo8j9iU6Mz+cEE1Wg2wVl8zl6kPVEvcOttR7l7LaaPDHCb637B2AGPun/5w+gMSaeMG
 ANj/392kfvgUDVGJlrD750+3evxPJFBq4aJmSA3mb/jRRPlnSALO/ONxOVucUUnOqYsn
 JQoA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUShGIU5RKKrAGqxz3xqNSPQntp37Da85CjsIwxoMwIp5XqqQKfYppLHhVRWn/fQLYasd89DmMozirtw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxMTHCGN/yxb6JUDGSff5Hk38XfX9oE949UrTi6QZgBG9JqzPvx
 Wtd7P70PD/JpMx1oRcqqb11fmd6H/nS9wSZ0q/884jy97/cUk//RkJRCclVmAVw=
X-Gm-Gg: ASbGncuS7iVJ0AtLwJopM3LHP5EUa5bYY5brSvhYbPxhvncCae6d4ZcP0xBvKwc8u3r
 o+AghkVbekQgz8hbKiqWfIaJRAhtaWZV9lAUTNqFR26W6iJPY7cuXt2K+/kmfemuypJNVA45viy
 RZvKI0R8L2PCpIPShLbXGuiBl3WE92g8seR29xrmgCE7OFgIaOAUSYDGOD+Ra7WTKsu+E4gf0VG
 yEu+T/bdMij++dYDo10yj6q9fTEsFpDV2fDcWm+M7ZFSow157HlVrejS9WzbJnxVSHp7j/Comej
 kMMtS8RIfzzN3NZZgGfmyEjqqyYG8oBd5ZltZO4+lQtk5EAPjbc/imknZuBTeAwW2jbLh24mlJt
 /c7tCww==
X-Google-Smtp-Source: AGHT+IG55beBCMeEpoU+v9sBHrbcIgFnVINAwcpqdyMq90VQ1/y+K+5G8xBe1CVGW38gxB0HOPdp+A==
X-Received: by 2002:a05:600c:3148:b0:43c:f44c:72b7 with SMTP id
 5b1f17b1804b1-440a65dd132mr80678905e9.14.1745739848202; 
 Sun, 27 Apr 2025 00:44:08 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.180])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-440a52f8915sm87682015e9.7.2025.04.27.00.44.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Apr 2025 00:44:07 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Sun, 27 Apr 2025 09:43:19 +0200
Message-ID: <20250427074404.3278732-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Cc: Marek Vasut <marex@denx.de>, Roan van Dijk <roan@protonic.nl>,
 Conor Dooley <conor+dt@kernel.org>,
 =?UTF-8?q?Leonard=20G=C3=B6hrs?= <l.goehrs@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, Russell King <linux@armlinux.org.uk>,
 Oleksij Rempel <o.rempel@pengutronix.de>, devicetree@vger.kernel.org,
 Marc Kleine-Budde <mkl@pengutronix.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, David Jander <david@protonic.nl>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/8] Support STM32h747i-disco board
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

The series adds support for STM32h747i-disco board

The board includes an STM32H747XI SoC with the following resources:
 - 2 Mbytes Flash
 - 1 Mbyte SRAM
 - LCD-TFT controller
 - MIPI-DSI interface
 - FD-CAN
 - USB 2.0 high-speed/full-speed
 - Ethernet MAC
 - camera interface

Detailed information can be found at:
https://www.st.com/en/evaluation-tools/stm32h747i-disco.html


Dario Binacchi (8):
  ARM: dts: stm32h7-pinctrl: add _a suffix to u[s]art_pins phandles
  dt-bindings: arm: stm32: add compatible for stm32h747i-disco board
  ARM: stm32: add a new SoC - STM32H747
  clk: stm32h7: rename USART{7,8}_CK to UART{7,8}_CK
  ARM: dts: stm32: add uart8 node for stm32h743 MCU
  ARM: dts: stm32: add pin map for UART8 controller on stm32h743
  ARM: dts: stm32: add an extra pin map for USART1 on stm32h743
  ARM: dts: stm32: support STM32h747i-disco board

 .../devicetree/bindings/arm/stm32/stm32.yaml  |   4 +
 arch/arm/boot/dts/st/Makefile                 |   1 +
 arch/arm/boot/dts/st/stm32h7-pinctrl.dtsi     |  34 ++++-
 arch/arm/boot/dts/st/stm32h743.dtsi           |   8 ++
 arch/arm/boot/dts/st/stm32h743i-disco.dts     |   2 +-
 arch/arm/boot/dts/st/stm32h743i-eval.dts      |   2 +-
 arch/arm/boot/dts/st/stm32h747i-disco.dts     | 136 ++++++++++++++++++
 arch/arm/boot/dts/st/stm32h750i-art-pi.dts    |   6 +-
 arch/arm/mach-stm32/board-dt.c                |   1 +
 include/dt-bindings/clock/stm32h7-clks.h      |   4 +-
 10 files changed, 187 insertions(+), 11 deletions(-)
 create mode 100644 arch/arm/boot/dts/st/stm32h747i-disco.dts

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
