Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D522132994
	for <lists+linux-stm32@lfdr.de>; Tue,  7 Jan 2020 16:05:42 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5449AC36B0B;
	Tue,  7 Jan 2020 15:05:42 +0000 (UTC)
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 809C7C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Jan 2020 15:03:14 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id az3so23286425plb.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 07 Jan 2020 07:03:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=7Vp5Vy5j9yM6zzEKiWqAsDsmN6F0gjsulGDFzYzW5ms=;
 b=FRdc/pEtLxybKATPi0gWX2OnrpPVH/gGawy/tcqojjMjvopFGGM068hu4YFt3qmt8A
 6R5y0yJvntjkO8rsWhyzfx23MOZxhzl/6e8Z+UKVVBc1Gihd/WO9l45YcNrgpYi9rKXD
 tWIIDANUvg28Kn7rZ9lTElzHP9SNKUJwcKPS6+aZR3KuKyMWVSR3aJ2aGRsUgKXN+aRD
 hUqAoVldM0Wyh88gr372bKNGydSXKln+wJOHPMUw8udR26H1B/JSx3TpR0H+RTBJJfYV
 huQgd0dDZJWNtdUEMbumFGCV7R864/LXirQdWi2VM5u/CpZOL4tJmLKL4i+gsWM2v2qk
 /wlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=7Vp5Vy5j9yM6zzEKiWqAsDsmN6F0gjsulGDFzYzW5ms=;
 b=IreNrapttUKK+61CIjEe6KKZv6f4mhIeV8bHvDP5FVOQeQYnOr+ZOGoE9Zz1U9UxWK
 sJeVvLw3nXZzuOuxSpa/VoOHPNmTA5I1/yC/LbAJC6nQRG5LGQpCzc26mIze2sF/yoeI
 xPdcsp69RZSzNTY5Lq7TThOu3BKesaIUaaAqUZsJrgJelNiFQzGkUrtCX6oxYu3NUX6w
 2KPlOEpZvnuwfWnQTTdW4Q3h2lvM9TIrMiSICtBZaEXxQw9RloafEbJgPqh3IMuNETe/
 lgHXLatfS2DOT1pupH5U7HtcxUUBWpaCgpR00mJXS8bWoLzkQsA7FyySR/8+i5Qbi/q9
 YcPg==
X-Gm-Message-State: APjAAAU0TkRYjiy+LLL+TiGPoC0iuSEVQrdxBhb4gCmC9Xet3lQa1uyt
 lsLBrjnkK4zPSEE4AXUf8ZA=
X-Google-Smtp-Source: APXvYqzftM+e7fYt4IHv4fHcbdCZwaijynpYGwn5PKAuo5WlUzUl87fCknMZfMefV1A2363vPvEgwQ==
X-Received: by 2002:a17:902:654d:: with SMTP id
 d13mr33352pln.187.1578409392867; 
 Tue, 07 Jan 2020 07:03:12 -0800 (PST)
Received: from localhost (199.168.140.36.16clouds.com. [199.168.140.36])
 by smtp.gmail.com with ESMTPSA id h3sm35881215pfo.132.2020.01.07.07.03.11
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 07 Jan 2020 07:03:12 -0800 (PST)
From: Dejin Zheng <zhengdejin5@gmail.com>
To: davem@davemloft.net, corbet@lwn.net, mcoquelin.stm32@gmail.com,
 alexandre.torgue@st.com, linus.walleij@linaro.org
Date: Tue,  7 Jan 2020 23:02:54 +0800
Message-Id: <20200107150254.28604-1-zhengdejin5@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Tue, 07 Jan 2020 15:05:39 +0000
Cc: linux-doc@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Dejin Zheng <zhengdejin5@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] Documentation: networking: device drivers:
	sync stmmac_mdio_bus_data info
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

Recent changes in the stmmac driver, it removes the phy_reset hook
from struct stmmac_mdio_bus_data by commit <fead5b1b5838ba2>, and
add the member of needs_reset to struct stmmac_mdio_bus_data by
commit <1a981c0586c0387>.

Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
---
 Documentation/networking/device_drivers/stmicro/stmmac.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/networking/device_drivers/stmicro/stmmac.txt b/Documentation/networking/device_drivers/stmicro/stmmac.txt
index 1ae979fd90d2..3d8a83158309 100644
--- a/Documentation/networking/device_drivers/stmicro/stmmac.txt
+++ b/Documentation/networking/device_drivers/stmicro/stmmac.txt
@@ -190,17 +190,17 @@ Where:
 For MDIO bus The we have:
 
  struct stmmac_mdio_bus_data {
-	int (*phy_reset)(void *priv);
 	unsigned int phy_mask;
 	int *irqs;
 	int probed_phy_irq;
+	bool needs_reset;
  };
 
 Where:
- o phy_reset: hook to reset the phy device attached to the bus.
  o phy_mask: phy mask passed when register the MDIO bus within the driver.
  o irqs: list of IRQs, one per PHY.
  o probed_phy_irq: if irqs is NULL, use this for probed PHY.
+ o needs_reset: make MDIO bus reset optional.
 
 For DMA engine we have the following internal fields that should be
 tuned according to the HW capabilities.
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
