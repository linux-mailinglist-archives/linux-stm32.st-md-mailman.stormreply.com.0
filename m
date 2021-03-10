Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B273339D4
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Mar 2021 11:21:06 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 723B8C57196;
	Wed, 10 Mar 2021 10:21:06 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 82AB7C57183
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Mar 2021 08:33:32 +0000 (UTC)
Received: from mail-wm1-f69.google.com ([209.85.128.69])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lJuHb-0003GQ-DY
 for linux-stm32@st-md-mailman.stormreply.com; Wed, 10 Mar 2021 08:33:31 +0000
Received: by mail-wm1-f69.google.com with SMTP id a65so858231wmh.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Mar 2021 00:33:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RZxvgYZhRwx3vtBKrExOY7yB1Rao/D3y6ddDmt53T8k=;
 b=WO1CN/cxlTGPjKL9PHT0WT6LH5Jh80bSryGdO6Iq3Ky0cQZeweL7liyrGqIvHOt6VU
 Wgi1s2Ot9JRXa3ceWmGF466mxnydLctDw11HzMP6bvFyDSiTwvdlxt+LqlJQ+UsU+MbX
 a7PrhpnM6wbS5V6hMGAQwcpP4ecMczZaqsSf4uIECIskiNqYHaIjro7Pav3z//joBxit
 YzZhh6fgGhH9HKWZJlMycPvOsF4k5ay+ohuFmayGI+MoJAzpIER/a9QWE4GuiLK1kFAj
 Rz6My31CAG1tmuuZKcBBGtl+dSWaRlHnX6l1Ff+xOsavL1xYuEpSEc7Yyc+bAvdi+Tgl
 +nBg==
X-Gm-Message-State: AOAM532TGPPnDAX9x+QqJ9s9farjJFnKFyt++dGL+MMvMAJigdRH8NkY
 ZRU+gJfLrK6+mpOPairI3u/MAUJpvs5uCLTU18BY2K8ImU23uRpoQhA7Atuaa5aG82717jim7DD
 fhDFE5Ksen9/o+oOaISKBqmMKa4WGSHVHec2ndmg36arXzfTw7FBRch3G7Q==
X-Received: by 2002:a1c:f406:: with SMTP id z6mr2225375wma.24.1615365211048;
 Wed, 10 Mar 2021 00:33:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx+uPRMBgFfoVCHx5kur24yVECBMZDDtyDQfyluEn8gAohH3gku3X1wAI4MIWrYIO0FNDk1jQ==
X-Received: by 2002:a1c:f406:: with SMTP id z6mr2225348wma.24.1615365210807;
 Wed, 10 Mar 2021 00:33:30 -0800 (PST)
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch.
 [84.226.167.205])
 by smtp.gmail.com with ESMTPSA id m17sm28675495wrx.92.2021.03.10.00.33.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 00:33:30 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Moritz Fischer <mdf@kernel.org>,
 Tom Rix <trix@redhat.com>, Lee Jones <lee.jones@linaro.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-edac@vger.kernel.org, linux-fpga@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 arm@kernel.org, soc@kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>
Date: Wed, 10 Mar 2021 09:33:22 +0100
Message-Id: <20210310083327.480837-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 10 Mar 2021 10:21:03 +0000
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [Linux-stm32] [RFC v2 0/5] arm64 / clk: socfpga: simplifying,
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

Try to unify them.

Changes since v1:
=================
1. New patch 3/5: arm64: socfpga: rename ARCH_STRATIX10 to ARCH_SOCFPGA64
2. New patch 4/5: arm64: intel: merge Agilex and N5X into ARCH_SOCFPGA64
3. Fix build issue reported by kernel test robot (with ARCH_STRATIX10
   and COMPILE_TEST but without selecting some of the clocks).

I tested compile builds on few configurations, so I hope kbuild 0-day
will check more options (please give it few days on the lists).

Best regards,
Krzysztof


Krzysztof Kozlowski (5):
  clk: socfpga: allow building N5X clocks with ARCH_N5X
  clk: socfpga: build together Stratix 10, Agilex and N5X clock drivers
  arm64: socfpga: rename ARCH_STRATIX10 to ARCH_SOCFPGA64
  arm64: intel: merge Agilex and N5X into ARCH_SOCFPGA64
  clk: socfpga: allow compile testing of Stratix 10 / Agilex clocks

 arch/arm64/Kconfig.platforms                | 17 ++++-------------
 arch/arm64/boot/dts/altera/Makefile         |  2 +-
 arch/arm64/boot/dts/intel/Makefile          |  6 +++---
 arch/arm64/configs/defconfig                |  3 +--
 drivers/clk/Kconfig                         |  1 +
 drivers/clk/Makefile                        |  4 +---
 drivers/clk/socfpga/Kconfig                 | 17 +++++++++++++++++
 drivers/clk/socfpga/Makefile                |  7 +++----
 drivers/edac/Kconfig                        |  2 +-
 drivers/edac/altera_edac.c                  | 10 +++++-----
 drivers/firmware/Kconfig                    |  2 +-
 drivers/fpga/Kconfig                        |  2 +-
 drivers/mfd/Kconfig                         |  2 +-
 drivers/net/ethernet/stmicro/stmmac/Kconfig |  4 ++--
 drivers/reset/Kconfig                       |  2 +-
 15 files changed, 43 insertions(+), 38 deletions(-)
 create mode 100644 drivers/clk/socfpga/Kconfig

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
