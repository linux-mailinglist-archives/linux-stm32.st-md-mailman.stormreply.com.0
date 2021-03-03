Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9348A32B5D4
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Mar 2021 09:05:26 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 44E61C57B70;
	Wed,  3 Mar 2021 08:05:26 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 82F71C56634
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Mar 2021 08:05:24 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id m6so15715606pfk.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 03 Mar 2021 00:05:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=eEHmW1L8oXnw1xKZQFNIdptSZuFAiD16Fplx3COkLXQ=;
 b=cubLM2Xr2VUGBMoGOmJ3YozVd9/DT6cNXEFWWgdvooUPrxGaim0M81JVFgQrkcyaEb
 0vbJpLxVVvIMZyHKLNF26/vVubtXIg5iZAwQuzYtP9kKJf/kN/IF+8alBS6Ks0P39LuB
 K6yNrrKSNYV1qyyS04MsQAky/UrZ/hCVXnhQylDIVE9XSX+lCnzgBg25FJvNTW2yT/sp
 cPGbn2xxCHxqiEVlh/GtG+eFTudSWSyxKYpr4yCa6vg29uYKoqekKEi19QJqQu55mjAI
 A9dh+ZKNslsI6IuESgtBKVs/Os0geMt7E0nzcVfmLCnm5sI6MFj1Vy/gxKPi68+PB1OH
 xATg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=eEHmW1L8oXnw1xKZQFNIdptSZuFAiD16Fplx3COkLXQ=;
 b=E1ZynTy+4JDPGCQc7dDmk/CDP9+zAVydTVKfTrGwQEzc05UT7JGH7HiDFIuWAl4dek
 6Xvn8WKs86pYW8T3YLzvXsyiC891EQVKa1frkkKNf4pgenf6xaWaxa3bEHj1rVAMUDFO
 9GNV2sfqcxsqrvepaIwOjwVMHFThoW1ZZvLOdH9Kz6UaRLtQOVLj8pKPylj5aDhzBUUa
 yHvFaocI4jaQO6oZ8bScahBmiTni+R1AQKl15sEoE7/3tvUGiPo0jXcov4Vpe3OsKw1B
 GUD87/cruVSjN9dl+ZvcsL1TK/8RddJJGg4E8AV9Mpr3cyvUCLzE9mo0Nu9kU+Y+nmAJ
 a1WQ==
X-Gm-Message-State: AOAM530Qe/2YNptC/wBZbL0ywygO0yIkKAeSyD89akZ6Sxv53oXpZcsl
 5v85EEze4+677MkALo007PQ=
X-Google-Smtp-Source: ABdhPJzZQAK2wGLpeLTSbFC08npR8WI/FNiq3sq4tFPV9XT7xMDHICu2/zZNReZRDvXWluYb/4AR2w==
X-Received: by 2002:a63:e045:: with SMTP id n5mr21779245pgj.220.1614758722912; 
 Wed, 03 Mar 2021 00:05:22 -0800 (PST)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id h6sm22260887pfv.84.2021.03.03.00.05.20
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 03 Mar 2021 00:05:22 -0800 (PST)
From: dillon.minfei@gmail.com
To: robh+dt@kernel.org, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux@armlinux.org.uk, vladimir.murzin@arm.com, afzal.mohd.ma@gmail.com
Date: Wed,  3 Mar 2021 16:05:09 +0800
Message-Id: <1614758717-18223-1-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: dillon min <dillon.minfei@gmail.com>
Subject: [Linux-stm32] [PATCH 0/8] ARM: STM32: add art-pi(stm32h750xbh6)
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

dillon min (8):
  ARM: ARMv7-M: Fix register restore corrupt after svc call
  Documentation: arm: stm32: Add stm32h750 value line
  dt-bindings: arm: stm32: Add compatible strings for ART-PI board
  dt-bindings: pinctrl: stm32: Add stm32h750 pinctrl
  ARM: dts: stm32: introduce stm32h7-pinctrl.dtsi to support stm32h75x
  ARM: dts: stm32: add stm32h750-pinctrl.dtsi
  ARM: dts: stm32: add support for art-pi board based on stm32h750xbh6
  ARM: stm32: add initial support for stm32h750

 Documentation/arm/index.rst                        |   1 +
 Documentation/arm/stm32/stm32h750-overview.rst     |  33 ++
 .../devicetree/bindings/arm/stm32/stm32.yaml       |   4 +
 .../bindings/pinctrl/st,stm32-pinctrl.yaml         |   1 +
 arch/arm/boot/dts/Makefile                         |   1 +
 arch/arm/boot/dts/stm32h7-pinctrl.dtsi             | 392 +++++++++++++++++++++
 arch/arm/boot/dts/stm32h743-pinctrl.dtsi           | 307 +---------------
 arch/arm/boot/dts/stm32h743.dtsi                   |  30 ++
 arch/arm/boot/dts/stm32h750-pinctrl.dtsi           |  11 +
 arch/arm/boot/dts/stm32h750.dtsi                   |   5 +
 arch/arm/boot/dts/stm32h750i-art-pi.dts            | 227 ++++++++++++
 arch/arm/mach-stm32/board-dt.c                     |   1 +
 arch/arm/mm/proc-v7m.S                             |   5 +-
 13 files changed, 716 insertions(+), 302 deletions(-)
 create mode 100644 Documentation/arm/stm32/stm32h750-overview.rst
 create mode 100644 arch/arm/boot/dts/stm32h7-pinctrl.dtsi
 create mode 100644 arch/arm/boot/dts/stm32h750-pinctrl.dtsi
 create mode 100644 arch/arm/boot/dts/stm32h750.dtsi
 create mode 100644 arch/arm/boot/dts/stm32h750i-art-pi.dts

-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
