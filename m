Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2NLKFstpoWkOswQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 27 Feb 2026 10:54:19 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D1D1B59D1
	for <lists+linux-stm32@lfdr.de>; Fri, 27 Feb 2026 10:54:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D097DC87EC9;
	Fri, 27 Feb 2026 09:54:18 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B4B47C87EC5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Feb 2026 09:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RpIRyZ7QzC/EBC6A85M42Ue5KN0IkzW1S7uTrte3DSM=; b=KV+0ks30s5w+XkvAjqLK9c8aLw
 Y+SPF51vKXHle27aiO2GeXb8eWHxqyQgempeY71m/oBoNovR+bNTCWZUkSWygrNWMcYn14YjSTdwH
 k4bvkmphbhrsfc44wKkboAFLYr+sZEvB3VY8RuMyfZJpSfdUyiUvMD4DzkY9+gNES3lm4s/g92Ar2
 TAOi4xoRiwRqDeB3hku79SkzAlayajKUo2w4Ni1MnMcMFG+ASFSAtdFf7m9zbZxxUkSF0mcLrefPM
 rAZRAgl69NVyvbIzZqUw9mkp/oKbp/ARZ8Rvx2hwPVFqF8FWqN0Mf1FC7vALHfaX7lIEL0NbA6ifn
 iPxuJd9A==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:51748 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1vvuXu-000000000ec-3V5u;
 Fri, 27 Feb 2026 09:54:07 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1vvuXn-0000000AvnX-4A1u; Fri, 27 Feb 2026 09:54:00 +0000
In-Reply-To: <aaFpZvuIzOLaNM0m@shell.armlinux.org.uk>
References: <aaFpZvuIzOLaNM0m@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1vvuXn-0000000AvnX-4A1u@rmk-PC.armlinux.org.uk>
Date: Fri, 27 Feb 2026 09:53:59 +0000
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 11/14] net: stmmac: make dma_cfg
 mixed/fixed burst boolean
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[kernel];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[rmk@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.793];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[rmk@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,armlinux.org.uk:email,rmk-PC.armlinux.org.uk:mid,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 14D1D1B59D1
X-Rspamd-Action: no action

struct stmmac_dma_cfg mixed_burst/fixed_burst members are both boolean
in nature - of_property_read_bool() are used to read these from DT, and
they are only tested for non-zero values. Use bool to avoid unnecessary
padding in this structure.

Update dwmac-intel to initialise these using true rather than '1', and
remove the '0' initialisers as the struct is already zero initialised
on allocation.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c | 4 +---
 include/linux/stmmac.h                            | 4 ++--
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index 92d77b0c2f54..ece2a0c38562 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -636,8 +636,6 @@ static int intel_mgbe_common_data(struct pci_dev *pdev,
 
 	plat->dma_cfg->pbl = 32;
 	plat->dma_cfg->pblx8 = true;
-	plat->dma_cfg->fixed_burst = 0;
-	plat->dma_cfg->mixed_burst = 0;
 	plat->dma_cfg->aal = 0;
 	plat->dma_cfg->dche = true;
 
@@ -1106,7 +1104,7 @@ static int quark_default_data(struct pci_dev *pdev,
 
 	plat->dma_cfg->pbl = 16;
 	plat->dma_cfg->pblx8 = true;
-	plat->dma_cfg->fixed_burst = 1;
+	plat->dma_cfg->fixed_burst = true;
 	/* AXI (TODO) */
 
 	return 0;
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index cc6c89769d82..84dea8c4fa65 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -97,8 +97,8 @@ struct stmmac_dma_cfg {
 	int txpbl;
 	int rxpbl;
 	bool pblx8;
-	int fixed_burst;
-	int mixed_burst;
+	bool fixed_burst;
+	bool mixed_burst;
 	bool aal;
 	bool eame;
 	bool multi_msi_en;
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
