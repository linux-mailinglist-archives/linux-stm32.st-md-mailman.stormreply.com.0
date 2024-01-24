Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D5383AD99
	for <lists+linux-stm32@lfdr.de>; Wed, 24 Jan 2024 16:43:18 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E6E9BC6B457;
	Wed, 24 Jan 2024 15:43:17 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4FAFEC65E4C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Jan 2024 14:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com; 
 s=default2211;
 h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=43lXa0WU3VYMfy+YKtoNb7AXn3JY+KVVRfKVmYJaNNU=; b=gX3xFsmZxlILiwmvmGybuap8w/
 CtYayO6m6VuK+QhhX5Pnk+brc4gckoiGoV5ESNv/8TjSEQ6VpZPSVmNRiLYJRnDa+AdE/D62XWUVy
 eBDYOpTnliziZF06bme87Y/4UK89aEii+9EfuUzEu1oMQ5Ypc7IgFlXX9oviQNx5lo5Ih2nS+G9+5
 q0ROMsxjZF40qVx4TKCDS0zfQff7+a+R2nfh/J7zg6O17HQ4nY7/LXPJUentt0nRn1TQ583ZA0VVd
 H7vsZ6izsyFEKHRZmoFS+t5kWHt+elaJBU9LSuakv8REzyZ3SxpTCnm4UwvmsSeLuyYJ7ahrIkEky
 p6tthuNA==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
 by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2) (envelope-from <esben@geanix.com>)
 id 1rSeJY-000Nbk-31; Wed, 24 Jan 2024 15:33:16 +0100
Received: from [87.49.43.79] (helo=localhost)
 by sslproxy01.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <esben@geanix.com>)
 id 1rSeJX-0009kq-8t; Wed, 24 Jan 2024 15:33:15 +0100
From: Esben Haabendal <esben@geanix.com>
To: netdev@vger.kernel.org, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Wed, 24 Jan 2024 15:33:14 +0100
Message-ID: <b807c2a70dba9711376b265b6da5fb5ff14589aa.1706105494.git.esben@geanix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <b365dc6f756a3fad4dfaa2675c98f4078aba8a55.1706105494.git.esben@geanix.com>
References: <b365dc6f756a3fad4dfaa2675c98f4078aba8a55.1706105494.git.esben@geanix.com>
MIME-Version: 1.0
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27164/Wed Jan 24 10:45:32 2024)
X-Mailman-Approved-At: Wed, 24 Jan 2024 15:43:17 +0000
Cc: linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 3/3] net: stmmac: Time Based Scheduling
	support for OF platforms
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

This allows enabling TBS for TX queues by adding the
snps,time-based-scheduling property. You should check for support for this
on your particular controller before enabling. Typically, TX queue 0 does
not support TBS.

Signed-off-by: Esben Haabendal <esben@geanix.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 70eadc83ca68..f0bb49b0f41c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -278,6 +278,8 @@ static int stmmac_mtl_setup(struct platform_device *pdev,
 
 		plat->tx_queues_cfg[queue].coe_unsupported =
 			of_property_read_bool(q_node, "snps,coe-unsupported");
+		plat->tx_queues_cfg[queue].tbs_en =
+			of_property_read_bool(q_node, "snps,time-based-scheduling");
 
 		queue++;
 	}
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
