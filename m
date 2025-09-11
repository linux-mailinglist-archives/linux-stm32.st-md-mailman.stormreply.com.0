Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DA470B52F67
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Sep 2025 13:09:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7EFD4C349C1;
	Thu, 11 Sep 2025 11:09:50 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C92F0C36B14
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Sep 2025 11:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=028dhRsQ8GM4B2fby7ztoYmOKZAqFSwbDbKA0jLGDMw=; b=seux19PHqPPKT5VRYLDruDtTob
 KqBMiC/sMjpYTeR1OT/bvTTa/wvEiKK8ig4+gwdXdH7aC81gsvltLSzUCUDCVQYH+UCKuIgnCYQ4T
 6jgwvKonNWm/tZZ6aKxXqafXHzcKiCiUxp9Gg7/8lIjc6Esdti/ZVQdBGtzCT/4qsgCiR6M5FZZ3X
 hwwE/DFVrBLoBU/X+mo/K70b8zhI2dceqE29RUlu18UmrAt4HK2v0olBtXZm94mT38ulgzqLru7uy
 6K8hlFZeLBbdkCllkktHkk5HiN8FlyYPsRIe7wZhn04kEhyhkspI7ascKvxQ8uT0uJvFG+aeEBvtj
 75dGgrWg==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:43394 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1uwfBJ-000000002rm-466u;
 Thu, 11 Sep 2025 12:09:38 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1uwfBJ-00000004j8M-0wT8; Thu, 11 Sep 2025 12:09:37 +0100
In-Reply-To: <aMKtV6O0WqlmJFN4@shell.armlinux.org.uk>
References: <aMKtV6O0WqlmJFN4@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1uwfBJ-00000004j8M-0wT8@rmk-PC.armlinux.org.uk>
Date: Thu, 11 Sep 2025 12:09:37 +0100
Cc: Richard Cochran <richardcochran@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Stanislav Fomichev <sdf@fomichev.me>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 bpf@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2 01/11] net: stmmac: ptp: improve
 handling of aux_ts_lock lifetime
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

The aux_ts_lock mutex is only required while the PTP clock has been
successfully registered.

stmmac_ptp_register() does not return any errors (as we don't wish to
prevent the netdev being opened if PTP fails), stmmac_ptp_unregister()
was coded to allow it to be called irrespective of whether PTP was
successfully registered or not.

Arrange for the aux_ts_lock mutex to be destroyed if the PTP clock
is not functional during stmmac_ptp_register(), and only destroy it
in stmmac_ptp_unregister() if we had a PTP clock registered.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
index 69bd8ace139c..993ff4e87e55 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
@@ -370,8 +370,12 @@ void stmmac_ptp_register(struct stmmac_priv *priv)
 	if (IS_ERR(priv->ptp_clock)) {
 		netdev_err(priv->dev, "ptp_clock_register failed\n");
 		priv->ptp_clock = NULL;
-	} else if (priv->ptp_clock)
+	}
+
+	if (priv->ptp_clock)
 		netdev_info(priv->dev, "registered PTP clock\n");
+	else
+		mutex_destroy(&priv->aux_ts_lock);
 }
 
 /**
@@ -387,7 +391,7 @@ void stmmac_ptp_unregister(struct stmmac_priv *priv)
 		priv->ptp_clock = NULL;
 		pr_debug("Removed PTP HW clock successfully on %s\n",
 			 priv->dev->name);
-	}
 
-	mutex_destroy(&priv->aux_ts_lock);
+		mutex_destroy(&priv->aux_ts_lock);
+	}
 }
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
