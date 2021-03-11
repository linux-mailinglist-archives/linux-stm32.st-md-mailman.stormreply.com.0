Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE9933771D
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Mar 2021 16:26:06 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1DEE1C57B55;
	Thu, 11 Mar 2021 15:26:06 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 229A8C5718B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Mar 2021 15:26:04 +0000 (UTC)
Received: from mail-lj1-f199.google.com ([209.85.208.199])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lKNCN-0004xj-JO
 for linux-stm32@st-md-mailman.stormreply.com; Thu, 11 Mar 2021 15:26:03 +0000
Received: by mail-lj1-f199.google.com with SMTP id 6so8657080ljr.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Mar 2021 07:26:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p7A+DSDQBb7c5EIU5TSfMWRw1BEprqFYaBkLJEF1chQ=;
 b=pxhLtd6a86qtduxFfitWofkBpeU67k0ciknVaXmhB1EbBkBVKaB29LTM8K3JF2Fmub
 mUUyu/Tbi0cfOhg7N7yC6NsRr/jIHhlsGxpInFfNI4S0j47tocYY5GM5xazudTWaK3up
 Kua7o0X0aPnJ+nTNCPJjmWKG2ywbY8smIoC5yRHo5khZw4CX6V6G2vU+jzksVlhJxSrm
 8OPEf5S287+BcsC4JlG1YKE3Q0GKn7JgUwWHCEbiRmJp9aDszhBT/4aTmXwRqugXU81k
 FFc2mFjBC7QigKyRyJgKzNOdL0fQ60J28yD/bJTqd4oGT8nKsxNrIB7sS3aESSNOng9d
 FpgQ==
X-Gm-Message-State: AOAM5329fjX7ilPGEe3mRs5Lwa6JkTPcGZb3Ox5NYt+8fbKl15EackNb
 oJDvCFVvBt1rC5K2kF3RNWAN7Z0a4hUelqRtAcAhbcL/jQ4uv3FRoNR5HHB8V6CxiFaIn4ttRxL
 2FuFlBE/EYWDnmaq8Gjgmkv1c+wGbx5lEJZi+9+wYaNxJh6WxiO8Phb3/Xg==
X-Received: by 2002:a17:907:ea3:: with SMTP id
 ho35mr3611142ejc.219.1615476352239; 
 Thu, 11 Mar 2021 07:25:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyz6VZBJQtyn1vJqNDMxNUwbfgoz1dh4Krocm3RNptCj8qhNdcuXhZNjAdYrrhTwPdtlG670g==
X-Received: by 2002:a17:907:ea3:: with SMTP id
 ho35mr3611099ejc.219.1615476351969; 
 Thu, 11 Mar 2021 07:25:51 -0800 (PST)
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch.
 [84.226.167.205])
 by smtp.gmail.com with ESMTPSA id v25sm1517826edr.18.2021.03.11.07.25.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 07:25:51 -0800 (PST)
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
Date: Thu, 11 Mar 2021 16:25:31 +0100
Message-Id: <20210311152545.1317581-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210311152545.1317581-1-krzysztof.kozlowski@canonical.com>
References: <20210311152545.1317581-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [Linux-stm32] [PATCH v3 01/15] clk: socfpga: allow building N5X
	clocks with ARCH_N5X
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

The Intel's eASIC N5X (ARCH_N5X) architecture shares a lot with Agilex
(ARCH_AGILEX) so it uses the same socfpga_agilex.dtsi, with minor
changes.  Also the clock drivers are the same.

However the clock drivers won't be build without ARCH_AGILEX.  One could
assume that ARCH_N5X simply depends on ARCH_AGILEX but this was not
modeled in Kconfig.  In current stage the ARCH_N5X is simply
unbootable.

Add a separate Kconfig entry for clocks used by both ARCH_N5X and
ARCH_AGILEX so the necessary objects will be built if either of them is
selected.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/clk/Kconfig          | 1 +
 drivers/clk/Makefile         | 1 +
 drivers/clk/socfpga/Kconfig  | 6 ++++++
 drivers/clk/socfpga/Makefile | 4 ++--
 4 files changed, 10 insertions(+), 2 deletions(-)
 create mode 100644 drivers/clk/socfpga/Kconfig

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index a588d56502d4..1d1891b9cad2 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -394,6 +394,7 @@ source "drivers/clk/renesas/Kconfig"
 source "drivers/clk/rockchip/Kconfig"
 source "drivers/clk/samsung/Kconfig"
 source "drivers/clk/sifive/Kconfig"
+source "drivers/clk/socfpga/Kconfig"
 source "drivers/clk/sprd/Kconfig"
 source "drivers/clk/sunxi/Kconfig"
 source "drivers/clk/sunxi-ng/Kconfig"
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index b22ae4f81e0b..12e46b12e587 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -106,6 +106,7 @@ obj-$(CONFIG_COMMON_CLK_SAMSUNG)	+= samsung/
 obj-$(CONFIG_CLK_SIFIVE)		+= sifive/
 obj-$(CONFIG_ARCH_SOCFPGA)		+= socfpga/
 obj-$(CONFIG_ARCH_AGILEX)		+= socfpga/
+obj-$(CONFIG_ARCH_N5X)			+= socfpga/
 obj-$(CONFIG_ARCH_STRATIX10)		+= socfpga/
 obj-$(CONFIG_PLAT_SPEAR)		+= spear/
 obj-y					+= sprd/
diff --git a/drivers/clk/socfpga/Kconfig b/drivers/clk/socfpga/Kconfig
new file mode 100644
index 000000000000..3c30617169bf
--- /dev/null
+++ b/drivers/clk/socfpga/Kconfig
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0
+config CLK_INTEL_SOCFPGA64
+	bool
+	# Intel Agilex / N5X clock controller support
+	default (ARCH_AGILEX || ARCH_N5X)
+	depends on ARCH_AGILEX || ARCH_N5X
diff --git a/drivers/clk/socfpga/Makefile b/drivers/clk/socfpga/Makefile
index bf736f8d201a..c6db8dd4ab35 100644
--- a/drivers/clk/socfpga/Makefile
+++ b/drivers/clk/socfpga/Makefile
@@ -3,5 +3,5 @@ obj-$(CONFIG_ARCH_SOCFPGA) += clk.o clk-gate.o clk-pll.o clk-periph.o
 obj-$(CONFIG_ARCH_SOCFPGA) += clk-pll-a10.o clk-periph-a10.o clk-gate-a10.o
 obj-$(CONFIG_ARCH_STRATIX10) += clk-s10.o
 obj-$(CONFIG_ARCH_STRATIX10) += clk-pll-s10.o clk-periph-s10.o clk-gate-s10.o
-obj-$(CONFIG_ARCH_AGILEX) += clk-agilex.o
-obj-$(CONFIG_ARCH_AGILEX) += clk-pll-s10.o clk-periph-s10.o clk-gate-s10.o
+obj-$(CONFIG_CLK_INTEL_SOCFPGA64) += clk-agilex.o
+obj-$(CONFIG_CLK_INTEL_SOCFPGA64) += clk-pll-s10.o clk-periph-s10.o clk-gate-s10.o
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
