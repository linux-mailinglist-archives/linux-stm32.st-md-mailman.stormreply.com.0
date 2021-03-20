Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6860B3429B9
	for <lists+linux-stm32@lfdr.de>; Sat, 20 Mar 2021 02:56:36 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0C73AC58D5B;
	Sat, 20 Mar 2021 01:56:36 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B6FB3C57B7A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 20 Mar 2021 01:56:33 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id v8so3756790plz.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Mar 2021 18:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=3ShiRqmN0JVa7UhRNey/XzmB81pk8gwokmcnEoRtZ68=;
 b=lnoO8EC47b1zev1YAg9sLSZDt1rQHZQoUIj/W3gCgf+drSwZ+9MYBho+okxDktJsm8
 hHyDWAZYIvN4i0qlDyd3McRuEw1EolhomoTxxuaIvuLpoaLiowy05aun5VSTcJJKG6r9
 jBGC/88rD3WhGq3s6f7CpGNGaUAct3Fx1yXFnOgXBsEb8NBuB23OKUdlOc3pD+O4hyPd
 fuKUztdmDf7QT8agMlCXPH0Z/3raGueZN1nlMAJwmsdCNQMc0/L86nOSLTxl+tODMKU1
 1cFVomOWc7XCBJI7RKjjaV/ONtrKPrIkbchoh1jeMKKkVj85jSXUwMW7tAiZYe6hCcrB
 BA5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=3ShiRqmN0JVa7UhRNey/XzmB81pk8gwokmcnEoRtZ68=;
 b=PjitlPILkylbxNd6D/xu8ShfOOykd62zJkkngdDrHcGRM3Otgo0ob3nu1d8T6pWnNv
 R4YIG5Lno2UNxWpu2LzM19y9FbtvmGOdlqsrvH2l4gWalQySChxxS8YEAnOl0WlKrTwb
 32NKwoXHzSXMKiZcS3Te+L+4/g9/j2oKpjNdsZgp5ZrbHcycF57Cf/N9dIicO+uc7Gbx
 HJl7x9GRIh4Nx17Dy+u/l/gjR/m2diCmNDBQFZsDdD3hV0hXY416YGXMht3WcFulr7iI
 lo8e35T+b6kmQKoYt1OZZqmaWgoEnvTUV8rcQHTzYE6xDp/XSsXQcEWxp2r6IESc9tx1
 zYgg==
X-Gm-Message-State: AOAM5332w8tEgZnHyNAYzxjXykH2XcfaU0P748usY+8wMiuJLgCaXCoB
 lwwGLy7Z2hh/vnBTB1h2OTQ=
X-Google-Smtp-Source: ABdhPJwdmLZ9tPsAf4H46sMWQthR3e7xLPl69X/OObl2TUeDve+jHfupOIAJ8yGrtV6h3MSoHoleZw==
X-Received: by 2002:a17:90b:fce:: with SMTP id
 gd14mr1345409pjb.64.1616205392029; 
 Fri, 19 Mar 2021 18:56:32 -0700 (PDT)
Received: from localhost.localdomain ([204.44.111.4])
 by smtp.gmail.com with ESMTPSA id y7sm5755904pgp.23.2021.03.19.18.56.26
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 19 Mar 2021 18:56:31 -0700 (PDT)
From: dillon.minfei@gmail.com
To: alexandre.torgue@foss.st.com, rong.a.chen@intel.com, robh+dt@kernel.org,
 a.fatoum@pengutronix.de, mcoquelin.stm32@gmail.com,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux@armlinux.org.uk, vladimir.murzin@arm.com, afzal.mohd.ma@gmail.com,
 gregkh@linuxfoundation.org, erwan.leray@foss.st.com,
 linux-serial@vger.kernel.org, lkp@intel.com
Date: Sat, 20 Mar 2021 09:56:16 +0800
Message-Id: <1616205383-24114-1-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 1.9.1
Cc: dillon min <dillon.minfei@gmail.com>
Subject: [Linux-stm32] [PATCH v4 0/9] ARM: STM32: add art-pi(stm32h750xbh6)
	board support
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

From: dillon min <dillon.minfei@gmail.com>

This patchset intend to add art-pi board support, this board developed
by rt-thread(https://www.rt-thread.org/).

Board resources:
8MiB QSPI flash
16MiB SPI flash
32MiB SDRAM
AP6212 wifi,bt,fm comb

sw context:
- as stm32h750 just has 128k bytes internal flash, so running a fw on
  internal flash to download u-boot/kernel to qspi flash, boot
  u-boot/kernel from qspi flash. this fw is based on rt-thread.
- kernel can be xip on qspi flash or load to sdram
- root filesystem is jffs2(created by buildroot), stored on spi flash

to support the boad, add following changes.
- fix r0-r3, r12 register restore failed after svc call,
- add dts binding
- update yaml doc

changes in v4:
- use unevaluatedProperties: false to fix dtbs_check warrnings instead of
  add 'bluetooth' in st,stm32-uart.yaml

changes in v3:
- fix dtbs_check warrning: (8002cbd78fd5 and 4bc21d3dd678)
  >> arch/arm/boot/dts/stm32h743i-eval.dt.yaml: soc: pin-controller:
     {'type': 'object'} is not allowed for {'#address-cells': [[1]], '#size-cells':
     [[1]], 'ranges': [[0,
  
  >> arch/arm/boot/dts/stm32h743i-eval.dt.yaml: soc: 'i2c@40005C00',
     'i2c@58001C00' do not match any of the regexes: '@(0|[1-9a-f][0-9a-f]*)$',
     '^[^@]+$', 'pinctrl-[0-9]+'
  >> arch/arm/boot/dts/stm32h750i-art-pi.dt.yaml: serial@40004800:
     'bluetooth' does not match any of the regexes: 'pinctrl-[0-9]+'

changes in v2:
- reorganize the pinctrl device tree about
  stm32h7-pinctrl/stm32h743/750-pinctrl
  stm32h7-pinctrl.dtsi --> stm32h743-pinctrl.dtsi --> stm32h743i-disco.dts
                         |                          |-> stm32h743i-eval.dts
                         |-> stm32h750-pinctrl.dtsi --> stm32h750i-art-pi.dts
  same to the stm32f7/f4's pinctrl style
- fix author name/copyright mistake
- add compatible string st,stm32h750-pinctrl to pinctl-stm32h743.c as they
  have same pin alternate functions, update Kconfig description
- make item in stm32h750i-art-pi.dts sort by letter

dillon min (9):
  Documentation: arm: stm32: Add stm32h750 value line doc
  dt-bindings: arm: stm32: Add compatible strings for ART-PI board
  dt-bindings: pinctrl: stm32: Add stm32h750 pinctrl
  ARM: dts: stm32: introduce stm32h7-pinctrl.dtsi to support stm32h750
  ARM: dts: stm32: add stm32h750-pinctrl.dtsi
  ARM: dts: stm32: add support for art-pi board based on stm32h750xbh6
  ARM: stm32: Add a new SOC - STM32H750
  pinctrl: stm32: Add STM32H750 MCU pinctrl support
  dt-bindings: serial: stm32: Use 'unevaluatedProperties' instead of
    'additionalProperties'

 Documentation/arm/index.rst                        |   1 +
 Documentation/arm/stm32/stm32h750-overview.rst     |  34 +++
 .../devicetree/bindings/arm/stm32/stm32.yaml       |   4 +
 .../bindings/pinctrl/st,stm32-pinctrl.yaml         |   1 +
 .../devicetree/bindings/serial/st,stm32-uart.yaml  |   2 +-
 arch/arm/boot/dts/Makefile                         |   1 +
 arch/arm/boot/dts/stm32h7-pinctrl.dtsi             | 274 ++++++++++++++++++
 arch/arm/boot/dts/stm32h743-pinctrl.dtsi           | 307 +--------------------
 arch/arm/boot/dts/stm32h743.dtsi                   | 153 +++++++++-
 arch/arm/boot/dts/stm32h750-pinctrl.dtsi           |  12 +
 arch/arm/boot/dts/stm32h750.dtsi                   |   6 +
 arch/arm/boot/dts/stm32h750i-art-pi.dts            | 229 +++++++++++++++
 arch/arm/mach-stm32/board-dt.c                     |   1 +
 drivers/pinctrl/stm32/Kconfig                      |   2 +-
 drivers/pinctrl/stm32/pinctrl-stm32h743.c          |   3 +
 15 files changed, 725 insertions(+), 305 deletions(-)
 create mode 100644 Documentation/arm/stm32/stm32h750-overview.rst
 create mode 100644 arch/arm/boot/dts/stm32h7-pinctrl.dtsi
 create mode 100644 arch/arm/boot/dts/stm32h750-pinctrl.dtsi
 create mode 100644 arch/arm/boot/dts/stm32h750.dtsi
 create mode 100644 arch/arm/boot/dts/stm32h750i-art-pi.dts

-- 
1.9.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
