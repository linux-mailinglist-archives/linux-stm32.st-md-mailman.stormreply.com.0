Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5443A34FB85
	for <lists+linux-stm32@lfdr.de>; Wed, 31 Mar 2021 10:28:59 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F2D82C57B5B;
	Wed, 31 Mar 2021 08:28:58 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 353B4C3FAD6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 Mar 2021 08:28:56 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id v23so7522725ple.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 31 Mar 2021 01:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=LSOlkAz8jg+syisUb5+J8kiWofFRTKNdtiq801zgT0k=;
 b=AdWe8HdLue+b9OjCYYZHRuxs8xgRUeCnsxLgC61NH4vg9tAkiiUaLaJXkX0aBOLwR6
 ktyl6FNfM/2413NGnm4AvMyrtUj59BlQM4kGo+5jdusSzQi/NlsrF5yR6NS0wbKKfm/U
 A4cxM8cInzydCMG65qilnf75cF3nvBuhM0UqYIrO2MXDTWMW8R1Ht/CsLt0LSg6s4kbf
 MA1oPM4ld9I95FhN9KKSMVwjtrCRtY2akgEm0scvkvJ5n/3fFV0lQHnlDkZtryoUe8Rt
 q9MxtMmyrrHLQSVG1CFXOabAgmMquO14GJL+R8b/fFoCGcFwSTBuOI5MxcwqXivdPZpM
 7zEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=LSOlkAz8jg+syisUb5+J8kiWofFRTKNdtiq801zgT0k=;
 b=oWmmSKR+gYx6e0R+2JvCgqmXJFjZIidpYPAfeBc1nWx5qdI5tVlBGf/UzpJRthQ9yw
 YW+E0UudqUTNk8KwkfvL8x5N7UzHIarsSTv4yGgz0PAh2lwVgL4YfqjAHZ/H7mkn/uNe
 DSl82EUIT7b6Z1Dy/HOAlRhcDq9opxRdZfR8w358fVlD0OQCFm94nK4msN6s8lHgekoS
 HotwjSIJjz/ANTch4uDQ+IfJvnmforoFMdsBZu6mMDErAz02uurwKUxUFfGcVgH+/VJb
 YYBBKjIrTRt14GzU54s+JGA+bjvHkwD+egLZLpMT0yag5oRpCw1RaYzuSDRpKhFGXkDj
 y7Yw==
X-Gm-Message-State: AOAM530pGMxDaQTeiWk1HxXY+OCv3Ugk5nuFDmWgpAzJsQaIQGKcvZdf
 4xMOrvDaE/2r+9/QMKa64kI=
X-Google-Smtp-Source: ABdhPJySG41kxsf0qEO8iBvn2FDWddLbPMwCdtSXE4dBjTEsdFU7YoF1X5b8YZz8i/ZHhgu+FXJOyQ==
X-Received: by 2002:a17:90a:e2ca:: with SMTP id
 fr10mr2390380pjb.154.1617179335231; 
 Wed, 31 Mar 2021 01:28:55 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id v1sm1420991pjt.1.2021.03.31.01.28.49
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 31 Mar 2021 01:28:54 -0700 (PDT)
From: dillon.minfei@gmail.com
To: robh@kernel.org, valentin.caron@foss.st.com, Alexandre.torgue@foss.st.com,
 rong.a.chen@intel.com, a.fatoum@pengutronix.de, mcoquelin.stm32@gmail.com,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux@armlinux.org.uk, afzal.mohd.ma@gmail.com, gregkh@linuxfoundation.org,
 erwan.leray@foss.st.com, erwan.leray@st.com, linux-serial@vger.kernel.org,
 lkp@intel.com, patrice.chotard@foss.st.com, corbet@lwn.net,
 linux-doc@vger.kernel.org, pali@kernel.org, mchehab+huawei@kernel.org,
 andrew@lunn.ch
Date: Wed, 31 Mar 2021 16:28:39 +0800
Message-Id: <1617179325-6383-1-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: dillon min <dillon.minfei@gmail.com>
Subject: [Linux-stm32] [PATCH v9 0/6] ARM: STM32: add art-pi(stm32h750xbh6)
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
changes in v9:
- move gpio{a..k} entries from stm32h7-pinctrl.dtsi to stm32h743.dtsi
v8 link:
https://lore.kernel.org/lkml/1617094704-10040-1-git-send-email-dillon.minfei@gmail.com/

changes in v8:
- drop '[PATCH v7 3/6] ARM: dts: stm32: introduce stm32h7-pinctrl.dtsi to
  support stm32h750' - stm32h743-pinctrl.dtsi file
- move compatible string "st,stm32h743-pinctrl" from stm32h7-pinctrl.dtsi
  to stm32h743.dtsi
- update stm32h743i-{dico/eval}.dtsi to include stm32h7-pinctrl.dtsi
- move file stm32h743.dtsi submit position to [PATCH V8 3/6]
v7 link:
https://lore.kernel.org/lkml/1617071338-9436-1-git-send-email-dillon.minfei@gmail.com/

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
 Documentation/arm/stm32/stm32h750-overview.rst     |  34 +++
 .../devicetree/bindings/arm/stm32/stm32.yaml       |   4 +
 .../devicetree/bindings/serial/st,stm32-uart.yaml  |   3 +-
 arch/arm/boot/dts/Makefile                         |   1 +
 arch/arm/boot/dts/stm32h7-pinctrl.dtsi             | 275 ++++++++++++++++++
 arch/arm/boot/dts/stm32h743-pinctrl.dtsi           | 306 ---------------------
 arch/arm/boot/dts/stm32h743.dtsi                   | 176 +++++++++++-
 arch/arm/boot/dts/stm32h743i-disco.dts             |   2 +-
 arch/arm/boot/dts/stm32h743i-eval.dts              |   2 +-
 arch/arm/boot/dts/stm32h750.dtsi                   |   6 +
 arch/arm/boot/dts/stm32h750i-art-pi.dts            | 229 +++++++++++++++
 arch/arm/mach-stm32/board-dt.c                     |   1 +
 13 files changed, 729 insertions(+), 311 deletions(-)
 create mode 100644 Documentation/arm/stm32/stm32h750-overview.rst
 create mode 100644 arch/arm/boot/dts/stm32h7-pinctrl.dtsi
 delete mode 100644 arch/arm/boot/dts/stm32h743-pinctrl.dtsi
 create mode 100644 arch/arm/boot/dts/stm32h750.dtsi
 create mode 100644 arch/arm/boot/dts/stm32h750i-art-pi.dts

-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
