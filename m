Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0026F0D5E
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Apr 2023 22:45:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8FCF4C6A5E6;
	Thu, 27 Apr 2023 20:45:46 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D2DD8C69073
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Apr 2023 20:45:44 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-50674656309so13825722a12.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Apr 2023 13:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1682628344; x=1685220344;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5k9dCctWANQe/yEgS6tS+0M8nlHpydDuo0y2/2pb4aE=;
 b=NQgjyC4xn/Uej85mqcMFusgacST3cB5Z7SBtNd98Z10faKY6VMJ3EhbjgaIlTrwPlN
 AmmDe6Uzg8BXmwDnPtLGQ4zkAlZ9AfSYWf3MQzUi1LSDes0If5aWc7M/CRPMxb5nkk/H
 Un5NIvV4OPhgBJBBZWZ4pOrBPRskv/Z9jCMmU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682628344; x=1685220344;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5k9dCctWANQe/yEgS6tS+0M8nlHpydDuo0y2/2pb4aE=;
 b=fnVvGYNX5x6GNPUDCxSWXEUtfNnx7oUPMLLAFv5TA/9Eum/gwxbAjKqREY50rGm52c
 RpS646sOOlZNH7awUVb8l/seagRQYNE2mfjJPN6UMDBK7PMWu8H+XaqWOFrDQw615Th2
 Jdpwo3C9JbpGqWBgU6vIqIx+RrPOXcEZ5P9P2v3fxpVV4cHjhoIkB6IDu3R8Xy+oD5+j
 8+mRWJO0l/TlB3AFIhGywc4hFxRSG7goVwkuCyWH5i/Y8U7r0+T3Jtjna+Com3+x/qLV
 vZD9P7Sq25I83uYsrqjeuEYTqF799yFiORaEGOGOlHKkECy3PXfCNNU4hBtwfaoFujvN
 wUjg==
X-Gm-Message-State: AC+VfDxyVfRWgLLOIJgZheE8Zo2r9x5CqX+zpiMJBj3Fmj9VYbYNrdSP
 TT8WCjQs33UgUzcobr6Ro7m6mw==
X-Google-Smtp-Source: ACHHUZ7Pu2xm4uXxSJcjBpr1Hhq7iFPzZY8LJppkL07oeAowkmx49KIhfg1j3b4w/tixepn51IrZ7A==
X-Received: by 2002:a17:907:7fa1:b0:94e:fe77:3f47 with SMTP id
 qk33-20020a1709077fa100b0094efe773f47mr4225933ejc.67.1682628344213; 
 Thu, 27 Apr 2023 13:45:44 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-87-5-99-194.retail.telecomitalia.it. [87.5.99.194])
 by smtp.gmail.com with ESMTPSA id
 s12-20020a170906bc4c00b00947ed087a2csm10171360ejv.154.2023.04.27.13.45.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Apr 2023 13:45:43 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Thu, 27 Apr 2023 22:45:35 +0200
Message-Id: <20230427204540.3126234-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh+dt@kernel.org>,
 linux-can@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Marc Kleine-Budde <mkl@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jakub Kicinski <kuba@kernel.org>, michael@amarulasolutions.com,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 "David S. Miller" <davem@davemloft.net>,
 Wolfgang Grandegger <wg@grandegger.com>
Subject: [Linux-stm32] [PATCH v2 0/5] can: bxcan: add support for single
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
ip link set up can[0-2]
candump can[0-2] -L &
cansend can[0-2] 300#AC.AB.AD.AE.75.49.AD.D1


Changes in v2:
- s/fiter/filter/ in the commit message
- Replace struct bxcan_mb::primary with struct bxcan_mb::cfg.
- Move after the patch "can: bxcan: add support for single peripheral configuration".
- Add node gcan3.
- Rename gcan as gcan1.
- Add property "st,can-secondary" to can2 node.
- Drop patch "dt-bindings: mfd: stm32f7: add binding definition for CAN3"
  because it has been accepted.
- Add patch "ARM: dts: stm32f429: put can2 in secondary mode".
- Add patch "dt-bindings: net: can: add "st,can-secondary" property".

Dario Binacchi (5):
  dt-bindings: net: can: add "st,can-secondary" property
  ARM: dts: stm32f429: put can2 in secondary mode
  ARM: dts: stm32: add pin map for CAN controller on stm32f7
  can: bxcan: add support for single peripheral configuration
  ARM: dts: stm32: add CAN support on stm32f746

 .../bindings/net/can/st,stm32-bxcan.yaml      | 19 ++++-
 arch/arm/boot/dts/stm32f429.dtsi              |  1 +
 arch/arm/boot/dts/stm32f7-pinctrl.dtsi        | 82 +++++++++++++++++++
 arch/arm/boot/dts/stm32f746.dtsi              | 47 +++++++++++
 drivers/net/can/bxcan.c                       | 34 +++++---
 5 files changed, 168 insertions(+), 15 deletions(-)

-- 
2.32.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
