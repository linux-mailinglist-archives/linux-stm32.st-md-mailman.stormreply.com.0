Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B3C6EC14D
	for <lists+linux-stm32@lfdr.de>; Sun, 23 Apr 2023 19:25:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0C58CC65E70;
	Sun, 23 Apr 2023 17:25:41 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2A757C035BB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 23 Apr 2023 17:25:39 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-3f19afc4fd8so6737365e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 23 Apr 2023 10:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1682270738; x=1684862738;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uL5yPRaPsceCGbvCtDdOlsKWMRHlRugtX8iMSJPTZDk=;
 b=mH0TBJ+YAOpAbtbc1vKOUVVwzrk15k/GVhEPrxPHJvV1gC4gYIpH8Jn37Y1287nzdZ
 uyd2mE82dzvqUKHv5JESijMtiCwVlPHGKy7Hv+b1CD7YGIbgTTrPAjzad6wzxpbgYCaS
 2mzyqaG6llYkQOqYL7XWP6exZu4mULi+zs/JE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682270738; x=1684862738;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uL5yPRaPsceCGbvCtDdOlsKWMRHlRugtX8iMSJPTZDk=;
 b=eW/frhlAbMPD5Tn6OrkJnU1bunIMbH4r0ixuP53sggomXViqnEtFPy61ZA4EjE2paZ
 hQWDlj5Eo0GyuurFWTOL4gmQhi6aVpmbqRgWA8muNZzOgjqFSKUl5J4FDx99GKXGnVM4
 XOM+Y981I88z0vbYpB7wK2WO32cTDIeabzgsf629WSsZhaWM2+sk2MmRQQMzMyo88YUO
 3Oms7U1pQcxZffUMFj1YYp3Y7S0jV8YftPeInVPUd2Gv7KNwf5lFSsJLXRZMBOaAv3RF
 aBInA0JRLBp7xP2AGFPal48r7FUgpt4WArrxBcRHDM40XCYKEO/CpicK67WoVfRwIQFu
 dG+A==
X-Gm-Message-State: AAQBX9eTsOPwv8JUBz1YD9RnP1IgnxUmUEwk1fME7eiFuRz40sNY4JNj
 LfR4jQ1EXRKZ98KbZatAEAf4PA==
X-Google-Smtp-Source: AKy350YCZkiNToumnXq7+bIHyotRHqEZokos7hy69QN8FWGz3YKB3GeKCYoy3JtFDIpfTe7nhp6uOA==
X-Received: by 2002:a7b:c84d:0:b0:3f1:7129:6b25 with SMTP id
 c13-20020a7bc84d000000b003f171296b25mr6361534wml.18.1682270738546; 
 Sun, 23 Apr 2023 10:25:38 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([37.159.119.249])
 by smtp.gmail.com with ESMTPSA id
 j32-20020a05600c1c2000b003f173987ec2sm13511653wms.22.2023.04.23.10.25.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Apr 2023 10:25:38 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Sun, 23 Apr 2023 19:25:24 +0200
Message-Id: <20230423172528.1398158-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Lee Jones <lee@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Rob Herring <robh+dt@kernel.org>, linux-can@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Marc Kleine-Budde <mkl@pengutronix.de>, linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jakub Kicinski <kuba@kernel.org>, michael@amarulasolutions.com,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 "David S. Miller" <davem@davemloft.net>,
 Wolfgang Grandegger <wg@grandegger.com>
Subject: [Linux-stm32] [PATCH 0/4] can: bxcan: add support for single
	peripheral configuration
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


The series adds support for managing bxCAN controllers in single peripheral
configuration.
Unlike stm32f4 SOCs, where bxCAN controllers are only in dual peripheral
configuration, stm32f7 SOCs contain three CAN peripherals, CAN1 and CAN2
in dual peripheral configuration and CAN3 in single peripheral
configuration:
- Dual CAN peripheral configuration:
 * CAN1: Primary bxCAN for managing the communication between a secondary
   bxCAN and the 512-byte SRAM memory.
 * CAN2: Secondary bxCAN with no direct access to the SRAM memory.
   This means that the two bxCAN cells share the 512-byte SRAM memory and
   CAN2 can't be used without enabling CAN1.
- Single CAN peripheral configuration:
 * CAN3: Primary bxCAN with dedicated Memory Access Controller unit and
   512-byte SRAM memory.

The driver has been tested on the stm32f769i-discovery board with a
kernel version 5.19.0-rc2 in loopback + silent mode:

ip link set can[0-2] type can bitrate 125000 loopback on listen-only on
ip link set up can0
candump can[0-2] -L &
cansend can[0-2] 300#AC.AB.AD.AE.75.49.AD.D1



Dario Binacchi (4):
  dt-bindings: mfd: stm32f7: add binding definition for CAN3
  ARM: dts: stm32: add CAN support on stm32f746
  ARM: dts: stm32: add pin map for CAN controller on stm32f7
  can: bxcan: add support for single peripheral configuration

 arch/arm/boot/dts/stm32f7-pinctrl.dtsi | 82 ++++++++++++++++++++++++++
 arch/arm/boot/dts/stm32f746.dtsi       | 39 ++++++++++++
 drivers/net/can/bxcan.c                | 20 ++++++-
 include/dt-bindings/mfd/stm32f7-rcc.h  |  1 +
 4 files changed, 139 insertions(+), 3 deletions(-)

-- 
2.32.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
