Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7BE1A8EB5
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Apr 2020 00:40:03 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3E41DC36B0C;
	Tue, 14 Apr 2020 22:40:03 +0000 (UTC)
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 93EA3C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Apr 2020 22:39:59 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id g2so514212plo.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Apr 2020 15:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9t1OfRpRitZtOf4uo1UYB1/mDlF//ZHx3ZZOkOotBBs=;
 b=l3XQpqCuW3oYa5DHK/NlM9glUOcgF931LKIPpyUBbva6wQh/ApqWSeCHyzi1hghTZH
 E28Z7/PJgq8fK1ExjJYDRNg4bZEoHVY1Ka5gYHY7mRzcqb+ZSh6TFhMkpczIT5DetY1E
 Vfj0fgXh0s7lbHOBTeyH7qVzN6vqDxOPeyU369EWm3IC4lAaYIl58qqVXJdRpWo98ba6
 YwME3XfFr32hcDXqmy2j9PTh2FH/yV5Kc3Dbd3hIWB0AH7Sd2tg6uCIGaKfOW18TVAkM
 jLTIivkcJLKxd3oVpuERxs6gjCojoeC0IVzTuimvDjg/UPsqZ8qI/Yy/o+l+uNXkalOH
 7SeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9t1OfRpRitZtOf4uo1UYB1/mDlF//ZHx3ZZOkOotBBs=;
 b=W6yIwnwENJwP2jMepbcfVISrhrYTzM0xAW8OsJyTg/R6FSBq7YSV/nufPqkIjbDoqn
 D0puyfZnvHFyW7fPWwoW17KKecW6Loiub99OMd+5+TTNMaBGA5baNXB1vq7UUMT1H44t
 MK9dpQypXeztmJwPPzzP4KcuVaHP5WWpHHQI4EtrOHVLc5Jy6EeWZz+Idob9DaKogH5b
 DuPiyv/pI5xexlK/vQQXIfQYMusrjFFEqt0gA0anRPj26mk+2RjBnNJPiKdbgo/t40ap
 DizSK/SomHvoJ9spLBY0i+h8uKuyALR95LL8MmJtDN8hN3RilVUNZNvoZDZ/DEYYsLVq
 Z7sg==
X-Gm-Message-State: AGi0PuZrMCeVH9q/EVpmBiSz3TB3qMKEqWra6rwGWc2dnPa4CXqxkoEp
 z1hAz3PEpYxHt1FjUqrC7TQ=
X-Google-Smtp-Source: APiQypLpzCWuUJeGz0XSN07gJ7EzCXSnJI9C2zEP968l+WFRfqF85ygGJoM3ztime9HQeFmq1bturg==
X-Received: by 2002:a17:902:262:: with SMTP id
 89mr2073094plc.131.1586903997813; 
 Tue, 14 Apr 2020 15:39:57 -0700 (PDT)
Received: from localhost.localdomain (ip68-111-84-250.oc.oc.cox.net.
 [68.111.84.250])
 by smtp.gmail.com with ESMTPSA id e11sm12176214pfl.65.2020.04.14.15.39.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 15:39:56 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
To: netdev@vger.kernel.org
Date: Tue, 14 Apr 2020 15:39:52 -0700
Message-Id: <20200414223952.5886-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 open list <linux-kernel@vger.kernel.org>, Maxime Ripard <mripard@kernel.org>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>, Chen-Yu Tsai <wens@csie.org>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, olteanv@gmail.com,
 "David S. Miller" <davem@davemloft.net>,
 "moderated list:ARM/Allwinner sunXi SoC support"
 <linux-arm-kernel@lists.infradead.org>
Subject: [Linux-stm32] [PATCH net] net: stmmac: dwmac-sunxi: Provide TX and
	RX fifo sizes
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

After commit bfcb813203e619a8960a819bf533ad2a108d8105 ("net: dsa:
configure the MTU for switch ports") my Lamobo R1 platform which uses
an allwinner,sun7i-a20-gmac compatible Ethernet MAC started to fail
by rejecting a MTU of 1536. The reason for that is that the DMA
capabilities are not readable on this version of the IP, and there
is also no 'tx-fifo-depth' property being provided in Device Tree. The
property is documented as optional, and is not provided.

Chen-Yu indicated that the FIFO sizes are 4KB for TX and 16KB for RX, so
provide these values through platform data as an immediate fix until
various Device Tree sources get updated accordingly.

Fixes: eaf4fac47807 ("net: stmmac: Do not accept invalid MTU values")
Suggested-by: Chen-Yu Tsai <wens@csie.org>
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sunxi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sunxi.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sunxi.c
index 7d40760e9ba8..0e1ca2cba3c7 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sunxi.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sunxi.c
@@ -150,6 +150,8 @@ static int sun7i_gmac_probe(struct platform_device *pdev)
 	plat_dat->init = sun7i_gmac_init;
 	plat_dat->exit = sun7i_gmac_exit;
 	plat_dat->fix_mac_speed = sun7i_fix_speed;
+	plat_dat->tx_fifo_size = 4096;
+	plat_dat->rx_fifo_size = 16384;
 
 	ret = sun7i_gmac_init(pdev, plat_dat->bsp_priv);
 	if (ret)
-- 
2.19.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
