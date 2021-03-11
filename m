Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 769FF33771F
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Mar 2021 16:26:08 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4269DC57B77;
	Thu, 11 Mar 2021 15:26:08 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 138F2C57B78
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Mar 2021 15:26:07 +0000 (UTC)
Received: from mail-lf1-f69.google.com ([209.85.167.69])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lKNCQ-000518-Mv
 for linux-stm32@st-md-mailman.stormreply.com; Thu, 11 Mar 2021 15:26:06 +0000
Received: by mail-lf1-f69.google.com with SMTP id r79so6841619lff.20
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Mar 2021 07:26:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=seRfZbNnrbt83A3lqfbME46rdPLUXBuaJIJzFEroJqM=;
 b=gB1B/VTAKsmvOyvhQ8mJtn2htHqNtQuL2xQ/JaKLkhocF333l0OO/E7oL0oMkYw6HQ
 qD1YV0tPm6wG3eukA+pEOJPB3CVBpRBreFBSU5YvHDYp81sTMFmQFaYAkxeP6vMZz1pk
 kXeqv+fF/BMbIjjoJ30p8eICwHabuq0ERx4D/xGMe71zyO2BmqatBQ4/32WSHiCIFMVr
 SdD/cbR9cwN8Rchtf08mJOzHbBgBxO921fkS2wGc69YQHLsIa+KiF8Co5SrpdpETjxfS
 c930JSRPNKq+GOQwMk13vIYLtS7vEk4he+zjUuLazOTm2l3iA7Tg++lyR24KDz6hChON
 j5Fw==
X-Gm-Message-State: AOAM530MgoBuRZgRMwcG/eU2xWXeSWzCjEsMCCCQP9/N7Am5Bcn/kCzI
 IgtJgI1xGCyR0RNmS1TaHXgOfrLRzMkJVwWh4KRwkauCvC7kU+iIfQ83QsOU5dxFkr/NmJzd69z
 /nrDe6WRCrjhMvMlapZVe82bFpA/Smv73qKpg8UkxtF9BKMNMJeVqZGLg7w==
X-Received: by 2002:a17:906:2c44:: with SMTP id
 f4mr3504714ejh.508.1615476355782; 
 Thu, 11 Mar 2021 07:25:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyyTATyAQcbeENIUwKOgFEFyZfkouzkosm1a5SyTcN6wlVTiKi+ARuyDQUI5aUuLLjUtpz6tg==
X-Received: by 2002:a17:906:2c44:: with SMTP id
 f4mr3504683ejh.508.1615476355579; 
 Thu, 11 Mar 2021 07:25:55 -0800 (PST)
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch.
 [84.226.167.205])
 by smtp.gmail.com with ESMTPSA id v25sm1517826edr.18.2021.03.11.07.25.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 07:25:55 -0800 (PST)
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
Date: Thu, 11 Mar 2021 16:25:34 +0100
Message-Id: <20210311152545.1317581-5-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210311152545.1317581-1-krzysztof.kozlowski@canonical.com>
References: <20210311152545.1317581-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [Linux-stm32] [PATCH v3 04/15] net: stmmac: merge ARCH_SOCFPGA and
	ARCH_STRATIX10
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

Simplify 32-bit and 64-bit Intel SoCFPGA Kconfig options by having only
one for both of them.  This the common practice for other platforms.
Additionally, the ARCH_SOCFPGA is too generic as SoCFPGA designs come
from multiple vendors.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/net/ethernet/stmicro/stmmac/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
index e675ba12fde2..7737e4d0bb9e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
+++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
@@ -140,8 +140,8 @@ config DWMAC_ROCKCHIP
 
 config DWMAC_SOCFPGA
 	tristate "SOCFPGA dwmac support"
-	default (ARCH_SOCFPGA || ARCH_STRATIX10)
-	depends on OF && (ARCH_SOCFPGA || ARCH_STRATIX10 || COMPILE_TEST)
+	default ARCH_INTEL_SOCFPGA
+	depends on OF && (ARCH_INTEL_SOCFPGA || COMPILE_TEST)
 	select MFD_SYSCON
 	help
 	  Support for ethernet controller on Altera SOCFPGA
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
