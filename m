Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 45DFD34DE5B
	for <lists+linux-stm32@lfdr.de>; Tue, 30 Mar 2021 04:29:10 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F24C6C5719E;
	Tue, 30 Mar 2021 02:29:09 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E32BCC5718B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Mar 2021 02:29:06 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id
 j6-20020a17090adc86b02900cbfe6f2c96so6894717pjv.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 29 Mar 2021 19:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=lu4a0Lz+tvaJ+7tvKxJ5rrNZMNtgZSuhMggyHT8ei7Y=;
 b=rk9YOylG0DefTSPGN/Odz2q5+vEbI6WB3FVAKOvZrIZ83K4CuDIGyl72XYJCD+diCg
 Q/ynC83KMQq5ZbPNbeLzLYPFKRZD4NcA8J13fGzlDuF98DiwJ4edHqApzKKlOl6vTg9T
 QVa2iTNguVD8Q3nL+Ug4ni/kfbgzswNKHfZzu1ihC/3RZvyu8RS/j3SLHL3X8UxnI/F0
 WEPoQyFvkltff26M9BxUTSv+EuCDS7m3BOYoQG2DxrCmx+F26KpWOfhiJVBE98V4YQK7
 Sz2SjSDjbW3M4H4SK4e26sLEH3SFSnaxZp3SUxUmQrvqYWrRCqU2mPCeNVZWw/UdIUYu
 KqTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=lu4a0Lz+tvaJ+7tvKxJ5rrNZMNtgZSuhMggyHT8ei7Y=;
 b=opnoheayiW8KaEAtjP/HRPilLnTw+fM66UB3yG+AfYnI6+Ppjt8SYbz2UXvLJe4ywQ
 czKBcT5rE7FmdGhiO2TWOsE/nmLsWyXe4fMSCdpAfBXTrvXTK1pXt8QTyprZYlPJOWgo
 xrCt/mweCb/p0ebv35lnKWeTHJSXIMbbEH72xaZLDOQecC1z85pn2K92KgxzxgvtoLlY
 Ocms0hkt/gU/WGvdcqQkDBZsePOy8vmmpdbmD5Rt6ILUTssAWxHGI6ONPVRYhY23UpYI
 j4H+1+tx3p7ah8t7wVbvrSt3HA0GCitR0ydER9fTmnBYxyG/d6LBMw+SGr2d/aLG2b4d
 G+bg==
X-Gm-Message-State: AOAM530QM51ND3McU44t0FBFYt9QL32ZZzlmUpTjE8RloLv8iqgzhcrB
 ZD/yYlXSOmUS2/ubTM8isUw=
X-Google-Smtp-Source: ABdhPJwh3gFqmwyzNbfqSdUMLgcsziEuxOYiGIZ8EhkeN0eWDe2/COfEvthZaBJk8UeraaKVWfEzxQ==
X-Received: by 2002:a17:90a:7f87:: with SMTP id
 m7mr2011924pjl.64.1617071345387; 
 Mon, 29 Mar 2021 19:29:05 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id i13sm17681385pgi.3.2021.03.29.19.29.01
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 29 Mar 2021 19:29:04 -0700 (PDT)
From: dillon.minfei@gmail.com
To: robh@kernel.org, valentin.caron@foss.st.com, Alexandre.torgue@foss.st.com,
 rong.a.chen@intel.com, a.fatoum@pengutronix.de, mcoquelin.stm32@gmail.com,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux@armlinux.org.uk, afzal.mohd.ma@gmail.com, gregkh@linuxfoundation.org,
 erwan.leray@foss.st.com, erwan.leray@st.com, linux-serial@vger.kernel.org,
 lkp@intel.com, patrice.chotard@foss.st.com
Date: Tue, 30 Mar 2021 10:28:52 +0800
Message-Id: <1617071338-9436-1-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: dillon min <dillon.minfei@gmail.com>
Subject: [Linux-stm32] [PATCH v7 0/6] ARM: STM32: add art-pi(stm32h750xbh6)
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

---
changes in v7:
- remove changes in
  Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
  Hi Rob Herring
  as you has already ack this patch, please ignore it. thanks
  history link:
  https://lore.kernel.org/lkml/1614758717-18223-4-git-send-email-dillon.minfei@gmail.com/
  https://lore.kernel.org/lkml/20210308195033.GA2855292@robh.at.kernel.org/
- remove "[PATCH v6 8/9] pinctrl: stm32: Add STM32H750 MCU pinctrl support"
  remove "[PATCH v6 5/9] ARM: dts: stm32: add stm32h750-pinctrl.dtsi"
- reference to stm32h743-pinctrl.dtsi in stm32h750i-art-pi.dts
v6 link:
https://lore.kernel.org/lkml/1616757302-7889-1-git-send-email-dillon.minfei@gmail.com/

changes in v6:
- add gpiox{gpio-ranges, ngpios} in stm32h7-pinctrl.dtsi
- add status="disabled" in stm32h743.dtsi 

changes in v5:
- accroding to rob's suggestion, replace false with 'type: object'
  of 'additionalProperties'.
- add Tested-by: Valentin Caron <valentin.caron@foss.st.com>

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

*** BLURB HERE ***

dillon min (6):
  Documentation: arm: stm32: Add stm32h750 value line doc
  dt-bindings: arm: stm32: Add compatible strings for ART-PI board
  ARM: dts: stm32: introduce stm32h7-pinctrl.dtsi to support stm32h750
  ARM: dts: stm32: add support for art-pi board based on stm32h750xbh6
  ARM: stm32: Add a new SOC - STM32H750
  dt-bindings: serial: stm32: Use 'type: object' instead of false for
    'additionalProperties'

 Documentation/arm/index.rst                        |   1 +
 Documentation/arm/stm32/stm32h750-overview.rst     |  34 ++
 .../devicetree/bindings/arm/stm32/stm32.yaml       |   4 +
 .../devicetree/bindings/serial/st,stm32-uart.yaml  |   3 +-
 arch/arm/boot/dts/Makefile                         |   1 +
 arch/arm/boot/dts/stm32h7-pinctrl.dtsi             | 341 +++++++++++++++++++++
 arch/arm/boot/dts/stm32h743-pinctrl.dtsi           | 307 +------------------
 arch/arm/boot/dts/stm32h743.dtsi                   | 164 +++++++++-
 arch/arm/boot/dts/stm32h750.dtsi                   |   6 +
 arch/arm/boot/dts/stm32h750i-art-pi.dts            | 229 ++++++++++++++
 arch/arm/mach-stm32/board-dt.c                     |   1 +
 11 files changed, 787 insertions(+), 304 deletions(-)
 create mode 100644 Documentation/arm/stm32/stm32h750-overview.rst
 create mode 100644 arch/arm/boot/dts/stm32h7-pinctrl.dtsi
 create mode 100644 arch/arm/boot/dts/stm32h750.dtsi
 create mode 100644 arch/arm/boot/dts/stm32h750i-art-pi.dts

-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
