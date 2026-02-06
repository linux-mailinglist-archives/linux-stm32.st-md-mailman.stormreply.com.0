Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eNI3KIhHhmkhLgQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 06 Feb 2026 20:56:56 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E79C102ED6
	for <lists+linux-stm32@lfdr.de>; Fri, 06 Feb 2026 20:56:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DD4F4C87EDD;
	Fri,  6 Feb 2026 19:56:55 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com
 [209.85.219.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 26DD3C290A0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Feb 2026 19:56:55 +0000 (UTC)
Received: by mail-qv1-f47.google.com with SMTP id
 6a1803df08f44-894674a4c4aso17798036d6.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 06 Feb 2026 11:56:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770407814; x=1771012614;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=B6IArvx0vdf7oFz1KRMa/JnNwWUDCFupKTsMgFUEvU4=;
 b=kgeRoe97hgCcJqmGKPdlIGbMkD+lnTZG5FZd9hoK8krGfy1L+K60cF4ULSABsgyvbC
 TGbSq6N6k4OdQFfSBmrijI972aDqJvUCoaSQL2+Mol/2aonpObuZ+CC8pKEIMldW0gyH
 ti/oDX+kb43H0p8ojGZJlZtSR++5hZGfthnv/U5BPv74K2AmOjmUpGHhYNxTiWLrG8+6
 qhE/k8/c6U95+/CecFtO8Rfiqtspq47FzdzyF1JHi0UoLbFtS2PbppA6fRHnuXOQLv/L
 15qcRJcWYHmhEYZCJRazmbiTkn4gRARPrVKKrwTYHK2pcqozN0gu7VlEEPBfKDfQ6isl
 K+BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770407814; x=1771012614;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B6IArvx0vdf7oFz1KRMa/JnNwWUDCFupKTsMgFUEvU4=;
 b=N62paLsnnaA1HQv+/MOmJOTZz+U00gJCbDlmjhzR7PQIYkBYtt3URmDxfUdcCpImEx
 ZIonPQSJmWL8Lf+FTnSDZ2nYSH5I5dlqfdnOuWe4/rbcz+t+YNedGFFN1P9fyNqLGzd0
 NxuqKUyM7JDjTF2+pjwpgMRgmLte8UlxOE0LZtKwMIt5JJ+0c9+MCPKH0X1XxGBiZf38
 TUoNnUZXSDeGcpu7OEIZ47TglHtMqtGIykCvxRYn2WQbZgeu/cMq5Vw4ea8U6KtlaLul
 +Z//Sz4B1vtM/2lHULcgSZWwerIP8AJV1U9Sbgg9q9w19VCTVflvVvqzVLFHuvpO1ssq
 etGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUS2Wb/nowkySi7bChunFwEvjWEePngAhIn2FMQdOAwmqMTRiMYHteWhYTVaoZM6QPNyYxzMpmOTP3xg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy5R3Rnc+zvV4VYROda4QUjqtdBQjNREofDZQi/jqtCnut/3hux
 m1sl5B0GtGbwYT9s+R8HyD2Ncx5c+0RhyybgyeYtPhIFyAjHRAmH/ACl
X-Gm-Gg: AZuq6aKwPGKW3wtgjv8hVfk0hmS1qBWbLpiViNYs4RbFONVHsaU4mUN8IAVABA1ier5
 nZW0JnxHVKwbTj1Sc58ot+Yf/Cd2FgzT/RtMXjQdF0GEXVyf+DKKkuY+nAIIysj6YwgnUySw50H
 ZmcbqtPBy6ZMXpyoS8p1Fh/34zH6RgiL+h3OFvxnRdoOc+3VwjgLx0tqzrJBuGQxphXcHjFh9c2
 p7DoIUk8ERnK/0oUf9YVLSCeFV3OcfWGwg3Fufpe7Cs+1uyr/+5QOiHe5xvsGFvuzS20xKh1GOx
 GDL8jliYKq4XfkVGmMwYOUzOeYbuiFF1SrCCh23sHTitnBBdypYEaCDX/gPKdB1JLqBVdno/kf1
 yK43QkweHSHdzjNbVEuE6mDhrYvH+gfX4iqcyPPPiKRi8BqDTailu5nC6apLg6fto07gE8d6Ue2
 0tzRSXMgXKOZRjmkj/vJ6pTlRWH8ynJUyxruIxNSJqqJ6JUDMRw8tfNY7cAEXlVywsTsiAGjuTl
 Bo=
X-Received: by 2002:a05:6214:e6c:b0:894:68fa:37e6 with SMTP id
 6a1803df08f44-8953cd9897cmr55323726d6.58.1770407813759; 
 Fri, 06 Feb 2026 11:56:53 -0800 (PST)
Received: from localhost.localdomain
 (h69-131-24-92.cntcnh.broadband.dynamic.tds.net. [69.131.24.92])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-50638c37b75sm23139701cf.0.2026.02.06.11.56.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Feb 2026 11:56:53 -0800 (PST)
From: Jie Zhang <jzhang918@gmail.com>
X-Google-Original-From: Jie Zhang <jie.zhang@analog.com>
To: netdev@vger.kernel.org
Date: Fri,  6 Feb 2026 14:56:38 -0500
Message-ID: <20260206195643.11333-1-jie.zhang@analog.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, jzhang918@gmail.com, jie.zhang@analog.com,
 horms@kernel.org, Jacob Keller <jacob.e.keller@intel.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net v2] net: stmmac: fix oops when split
	header is enabled
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
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[jzhang918@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:netdev@vger.kernel.org,m:Jose.Abreu@synopsys.com,m:linux-kernel@vger.kernel.org,m:mcoquelin.stm32@gmail.com,m:vladimir.oltean@nxp.com,m:linux-stm32@st-md-mailman.stormreply.com,m:edumazet@google.com,m:andrew+netdev@lunn.ch,m:jzhang918@gmail.com,m:jie.zhang@analog.com,m:horms@kernel.org,m:jacob.e.keller@intel.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:rmk+kernel@armlinux.org.uk,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,m:andrew@lunn.ch,m:rmk@armlinux.org.uk,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[jzhang918@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[synopsys.com,vger.kernel.org,gmail.com,nxp.com,st-md-mailman.stormreply.com,google.com,lunn.ch,analog.com,kernel.org,intel.com,redhat.com,armlinux.org.uk,davemloft.net,lists.infradead.org];
	NEURAL_HAM(-0.00)[-0.991];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,kernel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,analog.com:mid,analog.com:email]
X-Rspamd-Queue-Id: 3E79C102ED6
X-Rspamd-Action: no action

For GMAC4, when split header is enabled, in some rare cases, the
hardware does not fill buf2 of the first descriptor with payload.
Thus we cannot assume buf2 is always fully filled if it is not
the last descriptor. Otherwise, the length of buf2 of the second
descriptor will be calculated wrong and cause an oops:

Unable to handle kernel paging request at virtual address ffff00019246bfc0
...
x2 : 0000000000000040 x1 : ffff00019246bfc0 x0 : ffff00009246c000
Call trace:
 dcache_inval_poc+0x28/0x58 (P)
 dma_direct_sync_single_for_cpu+0x38/0x6c
 __dma_sync_single_for_cpu+0x34/0x6c
 stmmac_napi_poll_rx+0x8f0/0xb60
 __napi_poll.constprop.0+0x30/0x144
 net_rx_action+0x160/0x274
 handle_softirqs+0x1b8/0x1fc
...

To fix this, the PL bit-field in RDES3 register is used for all
descriptors, whether it is the last descriptor or not.

Fixes: ec222003bd94 ("net: stmmac: Prepare to add Split Header support")
Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
Signed-off-by: Jie Zhang <jie.zhang@analog.com>
---
v2:
1. Update for the latest net HEAD
2. Reduce crash dump message in commit message
3. Add Fixes tag
v1 link: https://lore.kernel.org/all/20251202025421.4560-1-jie.zhang@analog.com/
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 20 ++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index a379221b96a3..8adc02003517 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5023,13 +5023,27 @@ static unsigned int stmmac_rx_buf2_len(struct stmmac_priv *priv,
 	if (!priv->sph_active)
 		return 0;
 
-	/* Not last descriptor */
-	if (status & rx_not_ls)
+	/* For GMAC4, when split header is enabled, in some rare cases, the
+	 * hardware does not fill buf2 of the first descriptor with payload.
+	 * Thus we cannot assume buf2 is always fully filled if it is not
+	 * the last descriptor. Otherwise, the length of buf2 of the second
+	 * descriptor will be calculated wrong and cause an oops.
+	 *
+	 * If this is the last descriptor, 'plen' is the length of the
+	 * received packet that was transferred to system memory.
+	 * Otherwise, it is the accumulated number of bytes that have been
+	 * transferred for the current packet.
+	 *
+	 * Thus 'plen - len' always gives the correct length of buf2.
+	 */
+
+	/* Not GMAC4 and not last descriptor */
+	if (!priv->plat->has_gmac4 && (status & rx_not_ls))
 		return priv->dma_conf.dma_buf_sz;
 
+	/* GMAC4 or last descriptor */
 	plen = stmmac_get_rx_frame_len(priv, p, coe);
 
-	/* Last descriptor */
 	return plen - len;
 }
 
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
