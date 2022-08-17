Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C9159813A
	for <lists+linux-stm32@lfdr.de>; Thu, 18 Aug 2022 12:04:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0FF82C640F7;
	Thu, 18 Aug 2022 10:04:15 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5D608C03FCB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Aug 2022 14:36:21 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id a7so24930302ejp.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Aug 2022 07:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=v2QQ7Uff4GoH2848IKCxUQX2XDpeKAuPtOB6PZeLpak=;
 b=BUBqid1m+LsLr2gz85xHUy+sqUiJRXFfzq8DQbh9692q8D5hYkQR/AXZMx2yNvg2BF
 kpYK78ofw8qiX49x58to7+p26d/YmXLzidby5943Y2BYBEZVdBAkkDu1k1+81Xgpiz2L
 a/EI5qETsF1LBhveYT/3UZCqwVmWXcJoNCoMg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=v2QQ7Uff4GoH2848IKCxUQX2XDpeKAuPtOB6PZeLpak=;
 b=GCjOS4P9pzM+M3IovH4tRSKsGySHQ5YrsH88tUbbAM+6fvgq/Jp1gS5/6JOr/NcFzq
 uL3mSlfRF6lVlmPb2Jw0ZR2TTr3KWJMkwQWbeNAZ8twp3d7GMSVIuixGNutx04+0e3Kp
 OOMubUM7JTeWQz/QyF68dgI5DLDG8sYxlYODAEhrTgIxgdpYmAdoY1+al/9W6HpkRgvW
 GaAoDP6AS5Nlr7hH6ixkl8+RfOLlkpo5iq3K28P+Op9f4vrEQ0fTRqyPd9teLsqKc9w4
 2oOufLz6sBK9Kmtxm0QH7oDUHDbkB4iJMyQTU3zLXbis8eY9wSMQRJJKdkINkgwkFluF
 /3dw==
X-Gm-Message-State: ACgBeo0mjG0pmtMF+hu2fAHUigUtmzPqYcPur2Isd51sWNjC4iv/NbXY
 2ToPinBcKPXaYv4jInqM0Fnl4g==
X-Google-Smtp-Source: AA6agR5YUv4QupDUzNnqnMMjKDP7wWxVCPQSvpHYL5+qDVNTthgT+NTs0hhCQiAsRsgJXzTy1/nXVQ==
X-Received: by 2002:a17:907:7609:b0:730:d70a:1efc with SMTP id
 jx9-20020a170907760900b00730d70a1efcmr16930699ejc.766.1660746980935; 
 Wed, 17 Aug 2022 07:36:20 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-31-31-9.retail.telecomitalia.it. [79.31.31.9])
 by smtp.gmail.com with ESMTPSA id
 o9-20020aa7c7c9000000b0043cab10f702sm10711982eds.90.2022.08.17.07.36.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Aug 2022 07:36:20 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Wed, 17 Aug 2022 16:35:25 +0200
Message-Id: <20220817143529.257908-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 18 Aug 2022 10:04:14 +0000
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
Subject: [Linux-stm32] [RFC PATCH 0/4] can: bxcan: add support for ST bxCAN
	controller
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


Dario Binacchi (4):
  dt-bindings: net: can: add STM32 bxcan DT bindings
  ARM: dts: stm32: add CAN support on stm32f429
  ARM: dts: stm32: add pin map for CAN controller on stm32f4
  can: bxcan: add support for ST bxCAN controller

 .../devicetree/bindings/net/can/st,bxcan.yaml | 139 +++
 arch/arm/boot/dts/stm32f4-pinctrl.dtsi        |  32 +
 arch/arm/boot/dts/stm32f429.dtsi              |  30 +
 drivers/net/can/Kconfig                       |   1 +
 drivers/net/can/Makefile                      |   1 +
 drivers/net/can/bxcan/Kconfig                 |  34 +
 drivers/net/can/bxcan/Makefile                |   4 +
 drivers/net/can/bxcan/bxcan-core.c            | 201 ++++
 drivers/net/can/bxcan/bxcan-core.h            |  33 +
 drivers/net/can/bxcan/bxcan-drv.c             | 980 ++++++++++++++++++
 10 files changed, 1455 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/can/st,bxcan.yaml
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
