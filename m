Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aBNeAwNJc2mHuQAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Jan 2026 11:10:11 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9FF73F9E
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Jan 2026 11:10:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1A454C8F26F;
	Fri, 23 Jan 2026 10:10:10 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7207EC87EDF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Jan 2026 10:10:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 88D3D60134;
 Fri, 23 Jan 2026 10:10:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2C304C116D0;
 Fri, 23 Jan 2026 10:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769163008;
 bh=QhbxPJILpUk0pmN0IL18GV2yR3tp2vcg7M3uxmouMsQ=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=Zgm42Y57P4bEBUkXZ9JnR+C4rIgdA0tQIN01kx67BYQMc7augWO1Xb5jIelMl69Cw
 4f9DNnfpqGbZU/CRERCHf8pzft82N2wX/OL6JPYpJNaJaz+Yd8d8uG5AUpxf+zWljG
 OdWwoHEXG8x9SbzAfu0Dqr7xTpaU+Md7DgzCcoNGHVulT5HxVmoI34bRrXp34axpzS
 Ifpmu2fKVLcWY4+wH3IbcmsCfMgVoLtTfikE27eeIlQ5/B1IqEVjqWbeu+C9J1Mx1B
 uzmqkzxMouduPf6zM2G3ERD4MmoEMqj9DqEHaYjAulpLK1lrIt+ufMhuK/pkcaSdfX
 PVSENJL2dXfgA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 1D7EAD72369;
 Fri, 23 Jan 2026 10:10:08 +0000 (UTC)
From: Jan Petrous via B4 Relay <devnull+jan.petrous.oss.nxp.com@kernel.org>
Date: Fri, 23 Jan 2026 11:09:54 +0100
MIME-Version: 1.0
Message-Id: <20260123-dwmac_multi_irq-v3-1-cc53f2be8961@oss.nxp.com>
References: <20260123-dwmac_multi_irq-v3-0-cc53f2be8961@oss.nxp.com>
In-Reply-To: <20260123-dwmac_multi_irq-v3-0-cc53f2be8961@oss.nxp.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, 
 NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769163006; l=2267;
 i=jan.petrous@oss.nxp.com; s=20240922; h=from:subject:message-id;
 bh=I69CIaOrsVjsk2qKie1opY8Sk2GVcG8xJRTXN7Y+zQc=;
 b=WvOceTE3VPOC4NTuTUvuhTgwBZGNIEPH2jVhDbCEigXBb+g1OVDllXFDqyQGO9zyvwhux9uZV
 0jOywyej101AgVoOEW86ing0WPCg66Y/BTfnKts+8xKtx/9xfmJzv63
X-Developer-Key: i=jan.petrous@oss.nxp.com; a=ed25519;
 pk=Ke3wwK7rb2Me9UQRf6vR8AsfJZfhTyoDaxkUCqmSWYY=
X-Endpoint-Received: by B4 Relay for jan.petrous@oss.nxp.com/20240922 with
 auth_id=217
X-Original-From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, netdev@vger.kernel.org,
 "Jan Petrous \(OSS\)" <jan.petrous@oss.nxp.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 1/4] net: stmmac: platform: read channels
	irq
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
Reply-To: jan.petrous@oss.nxp.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[jan.petrous.oss.nxp.com];
	FORGED_RECIPIENTS(0.00)[m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:chester62515@gmail.com,m:mbrugger@suse.com,m:ghennadi.procopciuc@oss.nxp.com,m:s32@nxp.com,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:imx@lists.linux.dev,m:netdev@vger.kernel.org,m:jan.petrous@oss.nxp.com,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[25];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,foss.st.com,suse.com,oss.nxp.com,nxp.com,pengutronix.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-0.867];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,dt];
	HAS_REPLYTO(0.00)[jan.petrous@oss.nxp.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns,nxp.com:email,suse.com:email,oss.nxp.com:mid,oss.nxp.com:replyto]
X-Rspamd-Queue-Id: 8C9FF73F9E
X-Rspamd-Action: no action

From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>

Read IRQ resources for all rx/tx channels, to allow Multi-IRQ mode
for platform glue drivers.

Reviewed-by: Matthias Brugger <mbrugger@suse.com>
Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
---
 .../net/ethernet/stmicro/stmmac/stmmac_platform.c  | 38 +++++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 8979a50b5507..f10a691b8add 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -700,6 +700,9 @@ EXPORT_SYMBOL_GPL(stmmac_pltfr_find_clk);
 int stmmac_get_platform_resources(struct platform_device *pdev,
 				  struct stmmac_resources *stmmac_res)
 {
+	char name[16];
+	int i;
+
 	memset(stmmac_res, 0, sizeof(*stmmac_res));
 
 	/* Get IRQ information early to have an ability to ask for deferred
@@ -743,7 +746,40 @@ int stmmac_get_platform_resources(struct platform_device *pdev,
 
 	stmmac_res->addr = devm_platform_ioremap_resource(pdev, 0);
 
-	return PTR_ERR_OR_ZERO(stmmac_res->addr);
+	if (IS_ERR(stmmac_res->addr))
+		return PTR_ERR(stmmac_res->addr);
+
+	/* RX channels irq */
+	for (i = 0; i < MTL_MAX_RX_QUEUES; i++) {
+		scnprintf(name, sizeof(name), "rx-queue-%d", i);
+		stmmac_res->rx_irq[i] = platform_get_irq_byname_optional(pdev,
+									 name);
+		if (stmmac_res->rx_irq[i] < 0) {
+			if (stmmac_res->rx_irq[i] == -EPROBE_DEFER)
+				return -EPROBE_DEFER;
+			dev_dbg(&pdev->dev, "IRQ rx-queue-%d not found\n", i);
+
+			/* Stop on first unset rx-queue-%i property member */
+			break;
+		}
+	}
+
+	/* TX channels irq */
+	for (i = 0; i < MTL_MAX_TX_QUEUES; i++) {
+		scnprintf(name, sizeof(name), "tx-queue-%d", i);
+		stmmac_res->tx_irq[i] = platform_get_irq_byname_optional(pdev,
+									 name);
+		if (stmmac_res->tx_irq[i] < 0) {
+			if (stmmac_res->tx_irq[i] == -EPROBE_DEFER)
+				return -EPROBE_DEFER;
+			dev_dbg(&pdev->dev, "IRQ tx-queue-%d not found\n", i);
+
+			/* Stop on first unset tx-queue-%i property member */
+			break;
+		}
+	}
+
+	return 0;
 }
 EXPORT_SYMBOL_GPL(stmmac_get_platform_resources);
 

-- 
2.47.0


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
