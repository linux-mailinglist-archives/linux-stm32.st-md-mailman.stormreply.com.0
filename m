Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6575659AC92
	for <lists+linux-stm32@lfdr.de>; Sat, 20 Aug 2022 10:30:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9E321C640FE;
	Sat, 20 Aug 2022 08:30:05 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 94166C035BC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 20 Aug 2022 08:30:04 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id j21so7266121ejs.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 20 Aug 2022 01:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=RS+9z5xIA7IJQfYdhvS13wGTMb0Y1SSjn5eINN5tz5M=;
 b=KYglLr5IT5Q6SjG1hpSADMsfLqBTmSm2RePc/Mk+1a6/IuYwltxIMjKHELWXq0raEi
 vJ8dtvWbLa7e3oCV42BvkGk1Rzu+b3b+GMAbinrVoPbJWAX7hYPbCjLZyV57Y30zDrxX
 PMdQHOv6kMqvF2mbnxdajLqBjL3wVvx85kgpo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=RS+9z5xIA7IJQfYdhvS13wGTMb0Y1SSjn5eINN5tz5M=;
 b=XElOWOG1jVnh/6iegk4bGYLRPkBHFzXsD/rBcRm1fjnm28o0/8qEBqwLI/z6R8Hk97
 l3YBx+QgDaFekSLW1866Khb4EHTdKqJLgkUi5n1mE2AeUpJWYQA/5je/24QJ2PjIMyUR
 /z783qFDf9VyYgp7nvRa2CqMK/cF2/4liE7zDDwSZDFtt8iu+kZyxTBHw6FXy4M+T395
 xvl9ZQ89fm8aLg9Is+wXJjXboZQwrtRyrsysNz+HdwScEXgK8J11IdTfO1Kp+z7h9DRW
 UKNyhulfX8UTvf69EDNqLrEXPEJ4ESMLLeDk0BWcSJoRIs3XXYba7ozBR0a7blGsuUlJ
 aWQw==
X-Gm-Message-State: ACgBeo0AfXyA5zb4xmjpLjqcPKFrJnjXh+7H+FyxKvIT6oMkZ/VaW01s
 6qGnfFwP3SFfgxXWaCQf4E3K9w==
X-Google-Smtp-Source: AA6agR4A8pPFIlY6qv6Yh7WGjQYbnonjfl0k2GshtoUrZurNwTFSfhBwDqSTiHrxzWK3LnU0zmuwtQ==
X-Received: by 2002:a17:907:60c7:b0:731:14e2:af10 with SMTP id
 hv7-20020a17090760c700b0073114e2af10mr7085806ejc.92.1660984204133; 
 Sat, 20 Aug 2022 01:30:04 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-31-31-9.retail.telecomitalia.it. [79.31.31.9])
 by smtp.gmail.com with ESMTPSA id
 gx14-20020a1709068a4e00b0072b33e91f96sm3336112ejc.190.2022.08.20.01.30.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Aug 2022 01:30:03 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Date: Sat, 20 Aug 2022 10:29:32 +0200
Message-Id: <20220820082936.686924-1-dario.binacchi@amarulasolutions.com>
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
Subject: [Linux-stm32] [RFC PATCH v2 0/4] can: bxcan: add support for ST
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

 .../bindings/net/can/st,stm32-bxcan.yaml      |  136 +++
 MAINTAINERS                                   |    7 +
 arch/arm/boot/dts/stm32f4-pinctrl.dtsi        |   31 +
 arch/arm/boot/dts/stm32f429.dtsi              |   30 +
 drivers/net/can/Kconfig                       |    1 +
 drivers/net/can/Makefile                      |    1 +
 drivers/net/can/bxcan/Kconfig                 |   34 +
 drivers/net/can/bxcan/Makefile                |    4 +
 drivers/net/can/bxcan/bxcan-core.c            |  200 ++++
 drivers/net/can/bxcan/bxcan-core.h            |   33 +
 drivers/net/can/bxcan/bxcan-drv.c             | 1043 +++++++++++++++++
 11 files changed, 1520 insertions(+)
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
