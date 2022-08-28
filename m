Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C00D25A3DBC
	for <lists+linux-stm32@lfdr.de>; Sun, 28 Aug 2022 15:33:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6869DC5EC6B;
	Sun, 28 Aug 2022 13:33:39 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9C028C03FE1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 28 Aug 2022 13:33:37 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id nc14so6090053ejc.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 28 Aug 2022 06:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=DNUvT1ZZ3fFrLVQIyi9us/iFYLs4Qz0Ypyc3D33P4jw=;
 b=RwRoWd9AYF8OGCjv58SePtwQnPalN5pnfcu2PcXDc0X7SEZ27f2l6auvNoy6bXv/f3
 s1Jz5d6OXF0ydCOHiLCPggZ95FgKN7QL6W+ILfKCFECPetB1kiMS2E8RRcVVgX0n6TZj
 CPBbEDkleISRtbCLdgimRmsY6T0ErgmyzHeAA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=DNUvT1ZZ3fFrLVQIyi9us/iFYLs4Qz0Ypyc3D33P4jw=;
 b=FMBnef7qQmVlCJIhxttIWoXbrJPgfw1zYaGOXZb10+8sq78aNu8YEy29sfqFCA7AAR
 6wtntwYCycW00LsCOs4djQ33GlYaVYKEQAKPQlrcgKNdu4x/nWjqVbBR3NS6MAGO2n7M
 CuFiujzu6yLgWLNNVeBEperk2F/7eWBkR7Xk1M2cQtP0W3KpNvfX8Bui7BD7XFBANOA3
 wwXnvaX7Ofi/v8wX0kVo6cZ0IUGxTf51hC2A5NGwPi3YgjgHma75iNhRGZWUXziLNJxd
 qt8nSCNZIqq/run4b4KKw5NAIlwIIpGz19hERSWOiEqtcEmfoTG+8hS83wgw/UpkusWe
 UGGg==
X-Gm-Message-State: ACgBeo1qMwWFJk3xhNOw9wFHcWY1meSuNxWz4GN9FzTaXupd+RvDBNNU
 BWUGiUGfyHAfFcDyMmJ165xQZQ==
X-Google-Smtp-Source: AA6agR589FF7S2UjahMF8q4laiggfgapRLShsh241BpWLPPW6mBtYh3v02vIrAfWhFEGX8XoEZ4PZQ==
X-Received: by 2002:a17:907:6d24:b0:731:7720:bb9b with SMTP id
 sa36-20020a1709076d2400b007317720bb9bmr10836381ejc.717.1661693617054; 
 Sun, 28 Aug 2022 06:33:37 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-31-31-9.retail.telecomitalia.it. [79.31.31.9])
 by smtp.gmail.com with ESMTPSA id
 u26-20020a1709064ada00b007313a25e56esm3247669ejt.29.2022.08.28.06.33.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Aug 2022 06:33:36 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Sun, 28 Aug 2022 15:33:25 +0200
Message-Id: <20220828133329.793324-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Cc: linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Eric Dumazet <edumazet@google.com>, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Rob Herring <robh+dt@kernel.org>, linux-can@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Paolo Abeni <pabeni@redhat.com>, Marc Kleine-Budde <mkl@pengutronix.de>,
 Wolfgang Grandegger <wg@grandegger.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jakub Kicinski <kuba@kernel.org>, michael@amarulasolutions.com,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 "David S. Miller" <davem@davemloft.net>,
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Subject: [Linux-stm32] [RFC PATCH v3 0/4] can: bxcan: add support for ST
	bxCAN controller
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

The series adds support for the basic extended CAN controller (bxCAN)
found in many low- to middle-end STM32 SoCs.

The driver design (one core module and one driver module) was inspired
by other ST drivers (e. g. drivers/iio/adc/stm32-adc.c,
drivers/iio/adc/stm32-adc-core.c) where device instances share resources.
The shared resources functions are implemented in the core module, the
device driver in a separate module.

The driver has been tested on the stm32f469i-discovery board with a
kernel version 5.19.0-rc2 in loopback + silent mode:

ip link set can0 type can bitrate 125000 loopback on listen-only on
ip link set up can0
candump can0 -L &
cansend can0 300#AC.AB.AD.AE.75.49.AD.D1

For uboot and kernel compilation, as well as for rootfs creation I used
buildroot:

make stm32f469_disco_sd_defconfig
make

but I had to patch can-utils and busybox as can-utils and iproute are
not compiled for MMU-less microcotrollers. In the case of can-utils,
replacing the calls to fork() with vfork(), I was able to compile the
package with working candump and cansend applications, while in the
case of iproute, I ran into more than one problem and finally I decided
to extend busybox's ip link command for CAN-type devices. I'm still
wondering if it was really necessary, but this way I was able to test
the driver.

Changes in v3:
- Remove 'Dario Binacchi <dariobin@libero.it>' SOB.
- Add description to the parent of the two child nodes.
- Move "patterProperties:" after "properties: in top level before "required".
- Add "clocks" to the "required:" list of the child nodes.
- Remove 'Dario Binacchi <dariobin@libero.it>' SOB.
- Add "clocks" to can@0 node.
- Remove 'Dario Binacchi <dariobin@libero.it>' SOB.
- Remove a blank line.
- Remove 'Dario Binacchi <dariobin@libero.it>' SOB.
- Fix the documentation file path in the MAINTAINERS entry.
- Do not increment the "stats->rx_bytes" if the frame is remote.
- Remove pr_debug() call from bxcan_rmw().

Changes in v2:
- Change the file name into 'st,stm32-bxcan-core.yaml'.
- Rename compatibles:
  - st,stm32-bxcan-core -> st,stm32f4-bxcan-core
  - st,stm32-bxcan -> st,stm32f4-bxcan
- Rename master property to st,can-master.
- Remove the status property from the example.
- Put the node child properties as required.
- Remove a blank line.
- Fix sparse errors.
- Create a MAINTAINERS entry.
- Remove the print of the registers address.
- Remove the volatile keyword from bxcan_rmw().
- Use tx ring algorithm to manage tx mailboxes.
- Use can_{get|put}_echo_skb().
- Update DT properties.

Dario Binacchi (4):
  dt-bindings: net: can: add STM32 bxcan DT bindings
  ARM: dts: stm32: add CAN support on stm32f429
  ARM: dts: stm32: add pin map for CAN controller on stm32f4
  can: bxcan: add support for ST bxCAN controller

 .../bindings/net/can/st,stm32-bxcan.yaml      |  142 +++
 MAINTAINERS                                   |    7 +
 arch/arm/boot/dts/stm32f4-pinctrl.dtsi        |   30 +
 arch/arm/boot/dts/stm32f429.dtsi              |   31 +
 drivers/net/can/Kconfig                       |    1 +
 drivers/net/can/Makefile                      |    1 +
 drivers/net/can/bxcan/Kconfig                 |   34 +
 drivers/net/can/bxcan/Makefile                |    4 +
 drivers/net/can/bxcan/bxcan-core.c            |  200 ++++
 drivers/net/can/bxcan/bxcan-core.h            |   31 +
 drivers/net/can/bxcan/bxcan-drv.c             | 1045 +++++++++++++++++
 11 files changed, 1526 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/can/st,stm32-bxcan.yaml
 create mode 100644 drivers/net/can/bxcan/Kconfig
 create mode 100644 drivers/net/can/bxcan/Makefile
 create mode 100644 drivers/net/can/bxcan/bxcan-core.c
 create mode 100644 drivers/net/can/bxcan/bxcan-core.h
 create mode 100644 drivers/net/can/bxcan/bxcan-drv.c

-- 
2.32.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
