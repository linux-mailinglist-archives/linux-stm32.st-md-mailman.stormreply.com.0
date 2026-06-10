Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id a9tgFjgRKWqCPwMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Jun 2026 09:24:40 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 371FE6669C7
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Jun 2026 09:24:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=starfivetech.com (policy=quarantine);
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	arc=reject ("signature check failed: fail, {[1] = sig:microsoft.com:reject}")
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E43AAC57A51;
	Wed, 10 Jun 2026 07:24:39 +0000 (UTC)
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn
 (mail-sh0chn02on2127.outbound.protection.partner.outlook.cn
 [139.219.146.127])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6762BC5663A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Jun 2026 07:24:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KdhNpgTVU5TGIZvPl6gYLo4zQIq0SLSXKzzyjkcp/IQU6yIW4h0WupJDsEXeotL7vUAtB5tgvsW2gjHIUd/iOo4qhlY2HmpJ4I4iZMJS/Qovrl7GcFc75U3Xb20y1p8AvFqqRrx0EojwwYNFnd15C7gFw0SKSjUUo4johGSvgWcdi84fiudFvH3cOZ73zoPlmEmhwAGQxVR2aQ4t0swEL3liIVAu75YsuX2S881qpJdec4wH4epaZdGDobjvKrkIJjuW50iXSxuiDJGuA5gKs3B3iyEJc08XoMDi1pis2ana4HTnNA6YIXyguUjx2/wUGg2ffe2blt0TGVSDLNGZyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G0f/BKFV38V0X8QkT8WEHyoW3pTFU3k/0NGCYIVbDtQ=;
 b=kGR2bnpndp5zWOdfl3uhzDKC5T4OYM9osXit75beAw2rHIfXif4dIXJexqju7vBWsx9FaJoX0BNvxsG/t6W1iCxpfju7GbJYP/Bjq3hgxo7/nUOWRV7xuAnFxvgcFgGRy66QTLm4PRCORawq1FSIHFj8VMJYVdPte8kxWXmmonIgwpmReTT9aBGgUgxKYN58zhX5BFyN2eO667szkB/PN37isIwzgCyigV7jr1tsty5jyKFCRaijBuLUZNo/WDgq2FOb92+50iUSpsDyXH8CPpOAi6pqmj9v3nw7YZ7ikSCev0KJnqnJsFQeIIAbeGCl4CGVtLo+uPdYlh6v6DL14g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:25::15) by SHXPR01MB0512.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:1c::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.11; Wed, 10 Jun
 2026 07:24:31 +0000
Received: from SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 ([fe80::9b99:12dc:a115:b90f]) by
 SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn ([fe80::9b99:12dc:a115:b90f%3])
 with mapi id 15.21.0092.014; Wed, 10 Jun 2026 07:24:31 +0000
From: Minda Chen <minda.chen@starfivetech.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor@kernel.org>, netdev@vger.kernel.org
Date: Wed, 10 Jun 2026 15:24:17 +0800
Message-Id: <20260610072420.64699-4-minda.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260610072420.64699-1-minda.chen@starfivetech.com>
References: <20260610072420.64699-1-minda.chen@starfivetech.com>
X-ClientProxiedBy: NT0PR01CA0003.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510::15) To SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:25::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SHXPR01MB0863:EE_|SHXPR01MB0512:EE_
X-MS-Office365-Filtering-Correlation-Id: 921ac0c6-6730-4976-99fb-08dec6c1507e
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|7416014|376014|52116014|22082099003|18002099003|38350700014|921020|56012099006;
X-Microsoft-Antispam-Message-Info: drUknxUl57k4Sb8fxrVJEo0JkqvRSFvsMtaaqywIzo8iYkdkM7f0kzJD0j/l+yRcIvy5EEzMy7L4Vt++jUIFhRiaxX8s3Cvoix6cMr43JDOy715zGuXPZAciu3PqTklf/RbcY+7S4LfY6odnLFZsVsz6jBPcXQQuWDZD4wA+eJv1RGQL5J9SnyBE15eYSC/1rpdGlKjvzW4g10h5KP75oekBH991qw5kJQjmMuoJDk63BvzsXkz5UvGxKIVoH5SAsCyDlxhDB3lsdAG+dULnh8RSCF2UQVfNzRbTBJnQRkWqygMFSbRhtE7hc68djMHCokjkAJtYIOfLXaHkVDkodxT9sSmfboI1QZRlXI4fiAZdKqIcX4Ovboy4lPhOgUaXN0hIzbckXl2nMDJWbBDPnD++LytgoLN2WCHk5yYFEY2m240SuHOGFELYCmE8HJbXNuyE2eDp61OEEhAibRuqlBk8kPcTrR/1Ct6W1HxFp6qVl+Kx9JDwvXNNr/Mwf8gO2eTwaz+/NmxelNQvQpz5rPBQOvPQmOefaw4q5QP9qhDWoUwU4i3Zwxx80wpkB94eecjKQthBNim+xuH0/hGQGQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn; PTR:;
 CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(7416014)(376014)(52116014)(22082099003)(18002099003)(38350700014)(921020)(56012099006);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fkBbwo+h3QUslv0vqPvZLl0Mte1LWEWg+mkONbdrdJobCEchT1Z1C3umaFuD?=
 =?us-ascii?Q?RTfTXfuOsF/GTyvt5hJMnwD7ga1a3F7462N43Q4kG02eg6J0sHTPbMq0jGW+?=
 =?us-ascii?Q?fvRQXqvTcV9sKvfeTw6q/zsEwEycHSBUxcZ6Q2KWwB1cyj+hEq/uG0L9vT00?=
 =?us-ascii?Q?rOPAhnEinDDfumaNszeshX8rbc7HZit6IPK3Itj6LFc6rFGBsZkdAcgxstpZ?=
 =?us-ascii?Q?gxmgSUmuS2fTdKDl0Q7sY1SYCw511b94gvmRKtVhtoDD9a0h7Tearv4+k6TO?=
 =?us-ascii?Q?9pti0W607yVuq2QZVNC4kSyaa955X/0IxLxMOnChrm5VV3KbzwGz1PWeUR/C?=
 =?us-ascii?Q?Qm6V6sFKWcUYePlIs2CtUcHdIKvW3Z0S3WuEObIMnGr+FliXJu0Up7ENdeT9?=
 =?us-ascii?Q?eD9bisSYFIWwwLmDYSTWlyJHjl/Nxru6imjCM9+H7YI2Dy42zm8YmegVWzVK?=
 =?us-ascii?Q?lHHreX/En5F6S0coEOxW4sxDw8vnM5hIh/V9p/qWCAscrEoIxknP/i7uqo0T?=
 =?us-ascii?Q?8/AzKXj3vo23UhWi8eRnkuOlMyg3y3aL7UGQnPwJlx1lkCqfRXiUt+VJff3K?=
 =?us-ascii?Q?t0/z8fZjQ7makhXxbx6GcjQnbNjHdYOKm91NziLYqf+ciGZ74YCxuIPMNNji?=
 =?us-ascii?Q?UTX/pAVcmLKNgauITw1xrYv/Pt61mYFhmEK638wZtB3rK3kGIKmmM0Zv0WiK?=
 =?us-ascii?Q?VqGfo8EZHQYvbtVt6c4k/WqY5INfd6lzCDrsCl3cXm2A01Z3Ji6PBevD+pYT?=
 =?us-ascii?Q?NkSv7EHAjE70kcMe4r8xRZVMnI/UeqkepQV54KBCkb0/4S0QrSXvun5KDdHh?=
 =?us-ascii?Q?0uv4YLHv4mXk4Afv9Yh1/jWxGqzWbmWKhaAJclmPHmqEfczR7FcrkjrEC6FM?=
 =?us-ascii?Q?vTuR6BkpL65X29RSqRAqu1Uq/vTNf8tL1s1yk4VxRgWMea0fuQtS8OyCw1ke?=
 =?us-ascii?Q?V2cGF275TTgjrJETOP0qLnk7uckemaIeBMxFpy13xj9T8VSN6fx+cJUVA2qY?=
 =?us-ascii?Q?wmvpbDg+SVgGYMCUdjbMmjv2zTqCkxZUsfE454iwCk9H6GHgMFkq/lrN5Bdq?=
 =?us-ascii?Q?fLygFY/NDw9ePbCl/Ex42u3eiOKT0Km7kgfHpZoCRSaS5XtLP5t5lNXGnaBB?=
 =?us-ascii?Q?zlyxxOQaeHphr/KjHLwTQKBfDzUHtZ8Lrk4RmDVsGqjmIgwgq2olxGXUNnH3?=
 =?us-ascii?Q?bzmZ236jBzhz1FXTrDpunYcJ4FIWaB4xVrWt3lbAdaEWnEJDAitmIxZxKbeF?=
 =?us-ascii?Q?5R9/SOvJ9Y+Ty7kMXKKYf5BSKdibT2ui+9LLSv7HWAa6k8Tviopa5UI2Bggi?=
 =?us-ascii?Q?Y0JNW8OHFywJN0c1RD9rEn0/VnVy/OrycswsbH6/Bs8DE6XgEXkc6iQUTftI?=
 =?us-ascii?Q?z1WoeNngFRME0925sFB5N/wWk6OD/JUTc6hz6pvjtn/F2EhNJvt3RwOy8HfE?=
 =?us-ascii?Q?cPu5fH/HSdH6xlujHaTEbwwPqEjkP8vTkgtifUrx25tOoFSea6S8wyX2hT50?=
 =?us-ascii?Q?ElqQZVcc7DGOEym67BYWSbUCBHtkuTdMMfTXkvYP2185OGcs42d/4xECXJ1x?=
 =?us-ascii?Q?7Xw/75feXJzYVxkuGF6WzV03Z3UYOiIpP1s98r4ocPhEaeFW74bfq29tn8I8?=
 =?us-ascii?Q?jjD+9aioxlqMvnyJtSjb6SMfkc029Oc6aaX+dR0ssCG1Wr4jpCJcqz29j2a6?=
 =?us-ascii?Q?4gIw3pSbH6Q10TmNI8BhNLKGR2z7Maht+14MUlbFXC4+96NBaGVocE//V3kl?=
 =?us-ascii?Q?psPNczKCx+gsXfvSChinCRbuco0NDxc=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 921ac0c6-6730-4976-99fb-08dec6c1507e
X-MS-Exchange-CrossTenant-AuthSource: SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 07:24:31.6040 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NEZ2rBh7tujHUMWCgpvV6kIW2m/83w8EixybmacZlAH0kIgG6cuDroSCFQK0jXV8VgTujibIVN3PvvJRu1/XdLYt3cf8+21kvk5TW/QChm0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SHXPR01MB0512
Cc: devicetree@vger.kernel.org, Minda Chen <minda.chen@starfivetech.com>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [net-next v1 3/6] net: stmmac: Add register NCSI
	device support
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [5.79 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[starfivetech.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:joabreu@synopsys.com,m:mcoquelin.stm32@gmail.com,m:linux@armlinux.org.uk,m:peppe.cavallaro@st.com,m:alexandre.torgue@foss.st.com,m:robh+dt@kernel.org,m:krzk+dt@kernel.org,m:conor@kernel.org,m:netdev@vger.kernel.org,m:devicetree@vger.kernel.org,m:minda.chen@starfivetech.com,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:robh@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_TO(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,synopsys.com,gmail.com,armlinux.org.uk,st.com,foss.st.com,vger.kernel.org];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[minda.chen@starfivetech.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[minda.chen@starfivetech.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,dt];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp,stormreply.com:url,stormreply.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 371FE6669C7

Add stmmac register support. The register NCSI code is
almost from faraday ftgmac100.c

Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  1 +
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 44 +++++++++++++++++--
 .../ethernet/stmicro/stmmac/stmmac_platform.c | 10 ++++-
 include/linux/stmmac.h                        |  1 +
 4 files changed, 51 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index 8ba8f03e1ce0..1df0689e22a5 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -383,6 +383,7 @@ struct stmmac_priv {
 	struct bpf_prog *xdp_prog;
 
 	struct devlink *devlink;
+	struct ncsi_dev *nsdev;
 };
 
 enum stmmac_state {
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 010802389772..b6af53783883 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -41,6 +41,7 @@
 #include <linux/udp.h>
 #include <linux/bpf_trace.h>
 #include <net/devlink.h>
+#include <net/ncsi.h>
 #include <net/page_pool/helpers.h>
 #include <net/pkt_cls.h>
 #include <net/xdp_sock_drv.h>
@@ -4167,6 +4168,16 @@ static int __stmmac_open(struct net_device *dev,
 	if (ret)
 		goto irq_error;
 
+	if (priv->plat->use_ncsi) {
+		/* If using NC-SI, set our carrier on and start the stack */
+		netif_carrier_on(priv->dev);
+
+		/* Start the NCSI device */
+		ret = ncsi_start_dev(priv->nsdev);
+		if (ret)
+			goto irq_error;
+	}
+
 	stmmac_enable_all_queues(priv);
 	netif_tx_start_all_queues(priv->dev);
 	stmmac_enable_all_dma_irq(priv);
@@ -4250,6 +4261,9 @@ static void __stmmac_release(struct net_device *dev)
 
 	netif_tx_disable(dev);
 
+	if (priv->plat->use_ncsi)
+		ncsi_stop_dev(priv->nsdev);
+
 	/* Free the IRQ lines */
 	stmmac_free_irq(dev, REQ_IRQ_ERR_ALL, 0);
 
@@ -7795,6 +7809,15 @@ struct plat_stmmacenet_data *stmmac_plat_dat_alloc(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(stmmac_plat_dat_alloc);
 
+static void stmmac_ncsi_handler(struct ncsi_dev *nd)
+{
+	if (unlikely(nd->state != ncsi_dev_state_functional))
+		return;
+
+	netdev_info(nd->dev, "NCSI interface %s\n",
+		    nd->link_up ? "up" : "down");
+}
+
 static int __stmmac_dvr_probe(struct device *device,
 			      struct plat_stmmacenet_data *plat_dat,
 			      struct stmmac_resources *res)
@@ -8048,10 +8071,19 @@ static int __stmmac_dvr_probe(struct device *device,
 	if (ret)
 		goto error_pcs_setup;
 
-	ret = stmmac_phylink_setup(priv);
-	if (ret) {
-		netdev_err(ndev, "failed to setup phy (%d)\n", ret);
-		goto error_phy_setup;
+	if (priv->plat->use_ncsi) {
+		dev_info(priv->device, "Using NCSI interface\n");
+		priv->nsdev = ncsi_register_dev(ndev, stmmac_ncsi_handler);
+		if (!priv->nsdev) {
+			ret = -ENODEV;
+			goto error_phy_setup;
+		}
+	} else {
+		ret = stmmac_phylink_setup(priv);
+		if (ret) {
+			netdev_err(ndev, "failed to setup phy (%d)\n", ret);
+			goto error_phy_setup;
+		}
 	}
 
 	ret = stmmac_register_devlink(priv);
@@ -8082,6 +8114,8 @@ static int __stmmac_dvr_probe(struct device *device,
 error_netdev_register:
 	stmmac_unregister_devlink(priv);
 error_devlink_setup:
+	if (priv->nsdev)
+		ncsi_unregister_dev(priv->nsdev);
 	stmmac_phylink_destroy(priv->phylink);
 error_phy_setup:
 	stmmac_pcs_clean(ndev);
@@ -8141,6 +8175,8 @@ void stmmac_dvr_remove(struct device *dev)
 
 	pm_runtime_get_sync(dev);
 
+	if (priv->nsdev)
+		ncsi_unregister_dev(priv->nsdev);
 	unregister_netdev(ndev);
 
 #ifdef CONFIG_DEBUG_FS
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 5cae2aa72906..483ecf06fc13 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -348,7 +348,7 @@ static int stmmac_mdio_setup(struct plat_stmmacenet_data *plat,
 	 * described assume this is the case since there must be something
 	 * connected to the MAC.
 	 */
-	legacy_mdio = !of_phy_is_fixed_link(np) && !plat->phy_node;
+	legacy_mdio = !of_phy_is_fixed_link(np) && !plat->phy_node && !plat->use_ncsi;
 	if (legacy_mdio)
 		dev_info(dev, "Deprecated MDIO bus assumption used\n");
 
@@ -451,6 +451,14 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
 	 * they are not converted to phylink. */
 	plat->phy_node = of_parse_phandle(np, "phy-handle", 0);
 
+	if (of_property_read_bool(np, "snps,use-ncsi")) {
+		if (!IS_ENABLED(CONFIG_NET_NCSI)) {
+			dev_err(&pdev->dev, "NCSI stack not enabled\n");
+			return ERR_PTR(-EINVAL);
+		}
+		plat->use_ncsi = true;
+	}
+
 	/* Get max speed of operation from device tree */
 	of_property_read_u32(np, "max-speed", &plat->max_speed);
 
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index 4430b967abde..8c4f1b0a1a42 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -348,6 +348,7 @@ struct plat_stmmacenet_data {
 	int mac_port_sel_speed;
 	u8 vlan_fail_q;
 	bool provide_bus_info;
+	bool use_ncsi;
 	int int_snapshot_num;
 	int msi_mac_vec;
 	int msi_wol_vec;
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
