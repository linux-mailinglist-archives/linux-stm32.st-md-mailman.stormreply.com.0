Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 303CC20B121
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Jun 2020 14:08:56 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5843CC36B0C;
	Fri, 26 Jun 2020 12:08:55 +0000 (UTC)
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EAE0EC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Jun 2020 12:05:36 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id d16so70464edz.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Jun 2020 05:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=7AUVic1Y5MTcZ9Y09JPQEhG9Xb1GhH74cCEqiNFQyeo=;
 b=sCTvLyzvfG61CEw6PS/+ZDFbAEA1jjY1z5t0Vb2HtBM4NTvCaCYHVj6TVox/BI84G2
 Tk5OFYEV1b9aRmbI2qoiRX1RgaAHnSl7pOhTFtX5KfmmK5uvBZmINMwyrEde/rJhSZ6Q
 sCX7n4toc9R3wNiUCMLdIxyRwgm0ZIIP4JuvW7JtLtQESVxnueatAWgyM/9IDTiiGmKq
 lKIBrVZGEnTvQ4rXV4dKI/lG8hD/lkTjEY/RiaKEw1ECPXceaSkjnoLMXaQy/wye7ANa
 prX0MAN0W32DheJNlQ9wEy8H2GblFBSD9QGNPCEBl0zIDz+SDUb5eLBLx+xOD1PLVcdF
 DrJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=7AUVic1Y5MTcZ9Y09JPQEhG9Xb1GhH74cCEqiNFQyeo=;
 b=XrM7BXO6dTGBouJvOl9D3jNr207DSyWigh9vEGvvXft9VLwJBrOdE1vSAg4Eem3rIi
 eqoGdOTsfLTV6iNFgyiQDAVMd0Sho0LdpxEZefjjJUoJLIPuTR8pO5Lkg0mP7TqMnyZE
 YcuvTw8cLK4xkw8QHq3k06O1vaBO8/vPnTGrFZatXSS8DsoxKBnEpt8hDZvDlcw/5I+j
 eBiP6eejxkwuXxE/AzjyZaFHyahhfPBZyAHk4IUfXUkxTUlTEwqDKJ/mEikTjgf9FykI
 Tv5V6BO0Z7/Bk7IjwwnDtCV6k3lIIKZh8xKPh1IzgJk8AMiwITeOeqAoB0oBQ8RFkgPY
 n3ug==
X-Gm-Message-State: AOAM5337EAjcAe7f3gl4UMgU6GbilI4dqc0qAmOsU1IqbGi+FHNhg/a/
 aopAiBdjj48m14QfJbnxOcs=
X-Google-Smtp-Source: ABdhPJxA60jOtfzOkAemDvxspe50YaRE1GzXfaeagKO2wJzWFn6BjlrOjGLEWZ46HXXmW+OQKbef1Q==
X-Received: by 2002:a50:ee87:: with SMTP id f7mr3045824edr.355.1593173135719; 
 Fri, 26 Jun 2020 05:05:35 -0700 (PDT)
Received: from debian.home (ip51ccf9cd.speed.planet.nl. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id l27sm5024153ejk.25.2020.06.26.05.05.34
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Jun 2020 05:05:35 -0700 (PDT)
From: Johan Jonker <jbx6244@gmail.com>
To: peppe.cavallaro@st.com
Date: Fri, 26 Jun 2020 14:05:26 +0200
Message-Id: <20200626120527.10562-1-jbx6244@gmail.com>
X-Mailer: git-send-email 2.11.0
X-Mailman-Approved-At: Fri, 26 Jun 2020 12:08:54 +0000
Cc: heiko@sntech.de, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-rockchip@lists.infradead.org,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/2] net: stmmac: change Kconfig menu entry to
	STMMAC/DWMAC
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

When a Rockchip user wants to enable support for
the ethernet controller one has to search for
something with STMicroelectronics.
Change the Kconfig menu entry to STMMAC/DWMAC,
so that it better reflects the options it enables.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
index 36bd2e18f..8f7625cc8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
+++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config STMMAC_ETH
-	tristate "STMicroelectronics Multi-Gigabit Ethernet driver"
+	tristate "STMMAC/DWMAC Multi-Gigabit Ethernet driver"
 	depends on HAS_IOMEM && HAS_DMA
 	select MII
 	select MDIO_XPCS
@@ -26,7 +26,7 @@ config STMMAC_SELFTESTS
 	  results to the netdev Mailing List.
 
 config STMMAC_PLATFORM
-	tristate "STMMAC Platform bus support"
+	tristate "STMMAC/DWMAC Platform bus support"
 	depends on STMMAC_ETH
 	select MFD_SYSCON
 	default y
-- 
2.11.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
