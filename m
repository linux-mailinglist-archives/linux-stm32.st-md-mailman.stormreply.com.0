Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C398433771B
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Mar 2021 16:26:04 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8720DC5718F;
	Thu, 11 Mar 2021 15:26:04 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 36284C57183
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Mar 2021 15:26:02 +0000 (UTC)
Received: from mail-lf1-f69.google.com ([209.85.167.69])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lKNCL-0004vB-Nx
 for linux-stm32@st-md-mailman.stormreply.com; Thu, 11 Mar 2021 15:26:01 +0000
Received: by mail-lf1-f69.google.com with SMTP id j15so6892394lfe.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Mar 2021 07:26:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HH1upFGS1oxbv+vQ09D6VKarsXku0IAuIjEmvH7R4Kk=;
 b=OgXZAy+tFsAn2D173AaaQk+K05UQf/SevAFqiEaQ4bf/O/wGSZ4vS5vEnYnSrvbVkM
 rWoL73T+dCDVZDP4spNTTrts0SfmfF/le5B/Q12ivAT6RY8Bc9Uk25UaJBcjeICsgrY7
 hDhmUJm3mRqKQmgvakHGaD2T+mnGzckm6dah9jvZf6x4R5xRPV+lrBU8JPs7mvu4+b9C
 s91cB4Wc9cvaPEqZa74tWB5PuLXwbeZTdv7/t97zFZ5XZoF9aHJ2I9TDJyKZPELu0laX
 jScXY0VvKlOtfFHhAl6X60dk2wLs+Hsvm/U+R8rXXs+AAfmUubjyRUFhvon+LOdCbLUN
 oH+w==
X-Gm-Message-State: AOAM5308gJX454AgjQgrDNFXas+cKutrAl+ZCG0xSz8IPJmihiRnzm8I
 wOdEF2+dMsr5Xv2cpXzSuF9NWyhZKmT3OI3ULynDcvDkrGFehbq22YO5Ir8hXHrtvN2CFgcOegJ
 LpvdUYFvDAmE4wttR/Ig23GLBzGsMx3pquZf3KyfDnjQaHTXhVHztGo4d/g==
X-Received: by 2002:a17:906:4f8a:: with SMTP id
 o10mr3653340eju.484.1615476351083; 
 Thu, 11 Mar 2021 07:25:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwl4COb3xR5+Ql8luerMFoHdUQmjQDr8WhPDVtBN8ZjQzZ5RdBWXObNPvxwoLN6Q/QH+U5+ow==
X-Received: by 2002:a17:906:4f8a:: with SMTP id
 o10mr3653311eju.484.1615476350782; 
 Thu, 11 Mar 2021 07:25:50 -0800 (PST)
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch.
 [84.226.167.205])
 by smtp.gmail.com with ESMTPSA id v25sm1517826edr.18.2021.03.11.07.25.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 07:25:50 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org,
 Rob Herring <robh+dt@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>,
 James Morse <james.morse@arm.com>, Robert Richter <rric@kernel.org>,
 Moritz Fischer <mdf@kernel.org>, Tom Rix <trix@redhat.com>,
 Lee Jones <lee.jones@linaro.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-edac@vger.kernel.org,
 linux-fpga@vger.kernel.org, linux-i2c@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Date: Thu, 11 Mar 2021 16:25:30 +0100
Message-Id: <20210311152545.1317581-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [Linux-stm32] [PATCH v3 00/15] arm64 / clk: socfpga: simplifying,
	cleanups and compile testing
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

Hi,

All three Intel arm64 SoCFPGA architectures (Agilex, N5X and Stratix 10)
are basically flavors/platforms of the same architecture.  At least from
the Linux point of view.  Up to a point that N5X and Agilex share DTSI.
Having three top-level architectures for the same one barely makes
sense and complicates driver selection.

Additionally it was pointed out that ARCH_SOCFPGA name is too generic.
There are other vendors making SoC+FPGA designs, so the name should be
changed to have real vendor (currently: Intel).


Dependencies / merging
======================
1. Patch 1 is used as base, so other changes depend on its hunks.
   I put it at beginning as it is something close to a fix, so candidate
   for stable (even though I did not mark it like that).
2. Patch 2: everything depends on it.

3. 64-bit path:
3a. Patches 3-7: depend on patch 2, from 64-bit point of view.
3b. Patch 8: depends on 2-7 as it finally removes 64-bit ARCH_XXX
    symbols.

4. 32-bit path:
4a. Patches 9-14: depend on 2, from 32-bit point of view.
4b. Patch 15: depends on 9-14 as it finally removes 32-bit ARCH_SOCFPGA
    symbol.

If the patches look good, proposed merging is via SoC tree (after
getting acks from everyone). Sharing immutable branches is also a way.


Changes since v2
================
1. Several new patches and changes.
2. Rename ARCH_SOCFPGA to ARCH_INTEL_SOCFPGA on 32-bit and 64-bit.
3. Enable compile testing of 32-bit socfpga clock drivers.
4. Split changes per subsystems for easier review.
5. I already received an ack from Lee Jones, but I did not add it as
   there was big refactoring.  Please kindly ack one more time if it
   looks good.

Changes since v1
================
1. New patch 3: arm64: socfpga: rename ARCH_STRATIX10 to ARCH_SOCFPGA64.
2. New patch 4: arm64: intel: merge Agilex and N5X into ARCH_SOCFPGA64.
3. Fix build is.sue reported by kernel test robot (with ARCH_STRATIX10
   and COMPILE_TEST but without selecting some of the clocks).


RFT
===
I tested compile builds on few configurations, so I hope kbuild 0-day
will check more options (please give it few days on the lists).
I compare the generated autoconf.h and found no issues.  Testing on real
hardware would be appreciated.

Best regards,
Krzysztof

Krzysztof Kozlowski (15):
  clk: socfpga: allow building N5X clocks with ARCH_N5X
  ARM: socfpga: introduce common ARCH_INTEL_SOCFPGA
  mfd: altera: merge ARCH_SOCFPGA and ARCH_STRATIX10
  net: stmmac: merge ARCH_SOCFPGA and ARCH_STRATIX10
  clk: socfpga: build together Stratix 10, Agilex and N5X clock drivers
  clk: socfpga: merge ARCH_SOCFPGA and ARCH_STRATIX10
  EDAC: altera: merge ARCH_SOCFPGA and ARCH_STRATIX10
  arm64: socfpga: merge Agilex and N5X into ARCH_INTEL_SOCFPGA
  clk: socfpga: allow compile testing of Stratix 10 / Agilex clocks
  clk: socfpga: use ARCH_INTEL_SOCFPGA also for 32-bit ARM SoCs (and
    compile test)
  dmaengine: socfpga: use ARCH_INTEL_SOCFPGA also for 32-bit ARM SoCs
  fpga: altera: use ARCH_INTEL_SOCFPGA also for 32-bit ARM SoCs
  i2c: altera: use ARCH_INTEL_SOCFPGA also for 32-bit ARM SoCs
  reset: socfpga: use ARCH_INTEL_SOCFPGA also for 32-bit ARM SoCs
  ARM: socfpga: drop ARCH_SOCFPGA

 arch/arm/Kconfig                            |  2 +-
 arch/arm/Kconfig.debug                      |  6 +++---
 arch/arm/Makefile                           |  2 +-
 arch/arm/boot/dts/Makefile                  |  2 +-
 arch/arm/configs/multi_v7_defconfig         |  2 +-
 arch/arm/configs/socfpga_defconfig          |  2 +-
 arch/arm/mach-socfpga/Kconfig               |  4 ++--
 arch/arm64/Kconfig.platforms                | 17 ++++-------------
 arch/arm64/boot/dts/altera/Makefile         |  2 +-
 arch/arm64/boot/dts/intel/Makefile          |  6 +++---
 arch/arm64/configs/defconfig                |  3 +--
 drivers/clk/Kconfig                         |  1 +
 drivers/clk/Makefile                        |  4 +---
 drivers/clk/socfpga/Kconfig                 | 19 +++++++++++++++++++
 drivers/clk/socfpga/Makefile                | 11 +++++------
 drivers/dma/Kconfig                         |  2 +-
 drivers/edac/Kconfig                        |  2 +-
 drivers/edac/altera_edac.c                  | 17 +++++++++++------
 drivers/firmware/Kconfig                    |  2 +-
 drivers/fpga/Kconfig                        |  8 ++++----
 drivers/i2c/busses/Kconfig                  |  2 +-
 drivers/mfd/Kconfig                         |  4 ++--
 drivers/net/ethernet/stmicro/stmmac/Kconfig |  4 ++--
 drivers/reset/Kconfig                       |  6 +++---
 24 files changed, 71 insertions(+), 59 deletions(-)
 create mode 100644 drivers/clk/socfpga/Kconfig

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
