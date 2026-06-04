Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nFl2FbY3IWoNBQEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 04 Jun 2026 10:30:46 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D18C763E00C
	for <lists+linux-stm32@lfdr.de>; Thu, 04 Jun 2026 10:30:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=altera.com header.s=selector2 header.b=J6i5bsIA;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=altera.com (policy=reject);
	arc=reject ("signature check failed: fail, {[1] = sig:microsoft.com:reject}")
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7C7F5C8F272;
	Thu,  4 Jun 2026 08:30:45 +0000 (UTC)
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010039.outbound.protection.outlook.com [52.101.56.39])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8EE4AC8F271
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Jun 2026 08:30:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MGKR7G0FFqsMFR2N8jXH34sK9JFQj7CbfsJ6KtVczcOS3ivDsL9C3cPnrn6MEKqliZ27KqY9Hzsny7L4THtve7pg3xccBPDCSxSnGuVQMZXtqu6XCyeXuC7kxl7k2LilwFskwcgGAUrpcWudjrQaLPLTKN1LpYPGPGr0FAfX13ZNuMOwuzRKMc76XZbKYlJx2cryL5hM67cQsDjTU5VmSb/x4AhyvhYYy4KnJUm1IVUMbJ6zE/UmHY2oShP9zFlL3xX1s+lwNS7Vs3cWU/VmHVM5f7plPMNHDBOwjoYltfVb9poqEwxj27rBAY7coz2jOlWRt6eFRo0oPzKC8m03EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xWeXD5b3Mu0UToFxdMygz4f9aecflESnL2RYK3Wz5FE=;
 b=ldUUPRUFHnJ+/KsrboovXcn42AFeHsV1KjgqLTvNXwOq2eeJXDRTA0GHeueJaUrEi1VBYdjBO4LZzin7c02NX/FJ1br1VohCwUdq+Brlxsfs5nGHihxmgAmTINUTTUSRp9PHUbCQulxJ8H5fqvoYXZ7DJrcnJXPqtfT/W0SOMbdiHDMW1hJjF7hFBIpVCObvRitVNtsDYwRgBXQXiskcnfZbscIiNmv5+FAr+jsmYRE+6xFl72j3K7W6gCh/KYVkHUTHJW9vAbi40bhvP0U+B6aMT3S+/0rD0bAbQYKq9urPtXoWSerJbvD2R4exl16AobFFkZkDT8X8eSlBE4XlIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xWeXD5b3Mu0UToFxdMygz4f9aecflESnL2RYK3Wz5FE=;
 b=J6i5bsIAf5+Kwc9TWQNBxc1gPso3FtH27OTH8fAH5yLTjgQvvvFY6WPCTnE1kjva8AThFS/glKrrhRSAeidufDgBDUZua6aggbrG+ia7zjdx2kOhzY2z0PJS/42a4oeo4PO8VYJP3OVQBbXlnmpYb9jd/e2T8PEfYMsMcvxoQ1Q4NcACPvbsKGvVq2M/p9xHNEz1jjvjZ92s4CmbBu3vQX+fsZeXcLQ4MnO6YumcN8LLT8dwnJ5s3Pv+KAwgL0mEX05zn4+ojK/tqzW6+y7Se3RqK0ivdx4/g4BljYuDs0iz45mlpJm3tcX/lPrm4STo8xbljZiN+Pcs7LmRDqoXNg==
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com (2603:10b6:a03:432::18)
 by PH0PR03MB5941.namprd03.prod.outlook.com (2603:10b6:510:34::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Thu, 4 Jun 2026
 08:30:39 +0000
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775]) by SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775%6]) with mapi id 15.21.0092.006; Thu, 4 Jun 2026
 08:30:39 +0000
From: muhammad.nazim.amirul.nazle.asmade@altera.com
To: netdev@vger.kernel.org
Date: Thu,  4 Jun 2026 01:30:37 -0700
Message-ID: <20260604083037.24407-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
X-Mailer: git-send-email 2.43.7
X-ClientProxiedBy: SJ0PR03CA0368.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::13) To SJ0PR03MB6964.namprd03.prod.outlook.com
 (2603:10b6:a03:432::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6964:EE_|PH0PR03MB5941:EE_
X-MS-Office365-Filtering-Correlation-Id: 1514ebb8-162c-4163-20b1-08dec2138efa
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|18002099003|11063799006|56012099006|55112099003;
X-Microsoft-Antispam-Message-Info: GxObSr+v9xf23qOZWRRJ9yYcpjHgF0oB+VTSFpPV8thIkLHX8ZlOzZPw25kBqMEd75MTSzTZw5AxU7+wpCBxtBX0UlSVTwR/S57rL5X5qZlt1I6p6TwrVLBCWiDUNpy7JoXQaAdX5+RC6M1t1CUpkdGOddoLe+WpNsgVPw7p/b1kH92yynhvGdRvQUR32ehSJAS7V6WX8xRUy430obdB4AflAFhFKeXCVuwWuygkERpKY3aDgDu2XmiCCXEenPEKTdLwasGkzUSA4gVHWS5shvEA8vS50Q05YrVIltwF7h+hGhwK/8Lzhb4z8svtkKoffJsIaO/bg01h7iMVQfV6mVE2zQELw6tYDrTFt7WzQlaCcndqPIiHzL7bcV4JnKJZe8Fd3is0bcF2f3MqeiDdm/xp2V70S+kPFBX8ZSwvyBlQI6OMJyWuGtBYeCdrWJ7VLeV6nos2/HXnVbE2satwldBnrsnvdrUyT0L1ayLkRB4i8qIV8aX5ETks+pJWRUPDQGS/ohyX/WFw3YcGVmc0txK+DNuvHG7sLwEgtEApLfe5iKhMuNqiMTjYVMYr9yhTEkoEO5JR34FoRajfULBDQmrYSs1dFtPGyozX+LHG4BQLM9bF1/IBzUmuPd7sjoY4ih7p/UZKriZrz+hoZOHSYXdNYI9NoXm2W8bklGt/087b/a3YSV3Lv1SEsHlgeJ90
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR03MB6964.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(18002099003)(11063799006)(56012099006)(55112099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uhrCcq2ZVsvLqyTJr4poH/8tl57SIlz7Boy3pz4uN1CPtd+fXf1ZpQhhzS/x?=
 =?us-ascii?Q?g6fSMzk/HMwk9d9x679nhHAOW0wVyhVS+chcRU7nK6TyysBgpcG2bEUjMBiC?=
 =?us-ascii?Q?yLQbWgMjT/jQi65z3XoDuTaFFJTWggRCOTxoXgd4hbqnGUZatIwGPazypkOj?=
 =?us-ascii?Q?1U5yGV/GVm/nj7UW7MVtvDp6oKEQduuUTnID8t2D1cEeuv2S/MAJ8liGfDrr?=
 =?us-ascii?Q?itOupZtVUuivqIwnqeoEbXHNfvgztSX97K11EJ3OcvONrEistZ0AFjiS1Xfl?=
 =?us-ascii?Q?WX23Y5sZ75HclJBJ3hLF0pF2jcRiIM4cW24HNEurmMujUD0GtnqC8KzJFVXy?=
 =?us-ascii?Q?oRHdBaoqeU4heYUN9zKMzy1qoLGlA7BSNG5iHrGS3kKlQ914y6TEwObbhGFc?=
 =?us-ascii?Q?1VhCsOuOyKf7ls2z12x9/ib7VGMz3FsiBdawISJmv+PpEaaxjDhJRI4qkqg5?=
 =?us-ascii?Q?RQzuBqbuuHBhx+YdjToAK/XHKdzaTjoS6cc01te9aSTAcD5/keT4+J+r6tyY?=
 =?us-ascii?Q?mkvQIMiSu8sGhhQ6FY++SqyyLHWgJsJHJURDJHK+A1ehPS3Idwm+aVyJrIC2?=
 =?us-ascii?Q?9bPITWe2/OQa1W7d3UEaW3DL2HNVnUPXWxsUekDbYB4YirUme/m1dMJgZSU+?=
 =?us-ascii?Q?J31oJ6HYUxgdz/zzzcmFr+5xXzht+A4NEPZD+ZGQJUx79A5KmT3SmLcO/RvT?=
 =?us-ascii?Q?UR+lEac3lD/rit7RFpM1ixNroU8X0MeXYsCR4irCXPAp0dQXeZ+liJno/feJ?=
 =?us-ascii?Q?5xjq82DPKIa/qIhHvySw/vrZ2mUgaSv29r9WfL9dExaoUeS84r2VQSTGHkSy?=
 =?us-ascii?Q?8zbtgnkDYcuRaRmNVuza9zRn0tTJ+ykAPC2t+7kS+U0AmwK6/RErIceAsrEX?=
 =?us-ascii?Q?qW1zkjkHBti4W0sJdMGjCoLc37zTnoW3885VynmXtqUCUrYkdPqtEzI8170g?=
 =?us-ascii?Q?0YaC+kECYuqHFpucfasqhUXJJFE0frXeKwC4bT9Ab7ZnEbPOfrFo4x5u85f9?=
 =?us-ascii?Q?5+EZIg6Y3WPKVhX3clQVFOFiMfzxYtJ2LtNjxQcmMeVij5fNrb3sAN6IlOaZ?=
 =?us-ascii?Q?1TDfI6sUDSzNXsJVkXtY2pUTVuwAgZC8hBKAkaru4uRew7vIUIZpqyLZ5M2M?=
 =?us-ascii?Q?sp573eOT+z/TwXoBc4MtsdHT5g8ATMmdgqJqZbmvy7quKd2+WnvGFpjDQH4o?=
 =?us-ascii?Q?Rbo1eD/CIqHacJreNVMk8WXDiEd2KH0BKzXHUxukAVi6pP2rbnSDxrnMxJxi?=
 =?us-ascii?Q?sy0csUIl26zN/1+z4DMTPXD/2F64DfpyN/UNJrnSsbuuHvU0NGchr0TtjLxp?=
 =?us-ascii?Q?/YaTGb5kL95hRJnFcApiHzmiqF/CHXRVEraSPaZjHHt8yq3hkSff0BIIpqci?=
 =?us-ascii?Q?ULJ9F/mf3xMdaXaXv4fNT0/z9KIb8ZVbWGqZ1m1mtPnvWVFd0WMK1ashyIS0?=
 =?us-ascii?Q?o3CQSll6l0sW93ZzdgSdQMVpg3ZGw7PNX8COD4SBCPUnWGU2Go84CnklgI/A?=
 =?us-ascii?Q?Pcs59fbVbx319LreqSRkpGvpc8ReIanyuF025saVYonMCI5+eJoGEKBzFHuN?=
 =?us-ascii?Q?P68qL2vPVua4j+2QTg0/wAJ81K8e4aQA6n4guoNytNQ5Po0o32TDo8P55SHb?=
 =?us-ascii?Q?GK6O/jjMiViXw79kTEPvEET5HWs/VLOOxqnOrk/K+Ppa8POtU4/RGLsGcP+X?=
 =?us-ascii?Q?rvTxX2rEwB7w7FWoHmQ8OeIyGCUAqtTZyYXlwKVaC0oshC5635s3pohISAhz?=
 =?us-ascii?Q?Jj9XQYcJxm7xiVLpeMyiHHy3fhOdnBxgmLaHHVrYDbtWHx7UaYeKTX3ti+Sz?=
X-MS-Exchange-AntiSpam-MessageData-1: 7zBphShBrn4F6Q==
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1514ebb8-162c-4163-20b1-08dec2138efa
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6964.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 08:30:39.4030 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6dcP/MYEnK2H22Cr1JfQLHRPbX4zn66/0TX1BXxADJ6wuVrIY0+0GSEIZckKm4KknoFs6fJ3YvQPTHOxfcTqx6RkZevKBA/2xeU26I4BsfYwbidKZ+n4rqUOJ2mO5y/dLlnQPDm8jILwngvFKqM1vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5941
Cc: linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, edumazet@google.com,
 mcoquelin.stm32@gmail.com, kuba@kernel.org, pabeni@redhat.com,
 rmk+kernel@armlinux.org.uk, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] net: stmmac: xgmac: report L3/L4 filter match
	count in ethtool stats
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
X-Rspamd-Action: add header
X-Spamd-Result: default: False [7.29 / 15.00];
	DMARC_POLICY_REJECT(2.00)[altera.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_DKIM_REJECT(1.00)[altera.com:s=selector2];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	GREYLIST(0.00)[pass,meta];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:maxime.chevallier@bootlin.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:mcoquelin.stm32@gmail.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:rmk+kernel@armlinux.org.uk,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:rmk@armlinux.org.uk,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[muhammad.nazim.amirul.nazle.asmade@altera.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,st-md-mailman.stormreply.com,bootlin.com,lunn.ch,google.com,gmail.com,kernel.org,redhat.com,armlinux.org.uk,davemloft.net,lists.infradead.org];
	DKIM_TRACE(0.00)[altera.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[muhammad.nazim.amirul.nazle.asmade@altera.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,kernel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:from_smtp,st-md-mailman.stormreply.com:rdns,stormreply.com:url,stormreply.com:email,altera.com:mid,altera.com:from_mime,altera.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D18C763E00C
X-Spam: Yes

From: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>

Read the L3FM and L4FM bits from the RX descriptor status word (RDES2)
and increment the corresponding ethtool statistics counters. This allows
users to observe L3/L4 filter hit rates via ethtool -S.

Signed-off-by: Rohan G Thomas <rohan.g.thomas@altera.com>
Signed-off-by: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h       | 2 ++
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c | 6 ++++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
index 51943705a2b0..95fdf3133208 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
@@ -429,6 +429,8 @@
 #define XGMAC_TDES3_VLTV		BIT(16)
 #define XGMAC_TDES3_VT			GENMASK(15, 0)
 #define XGMAC_TDES3_FL			GENMASK(14, 0)
+#define XGMAC_RDES2_L4FM		BIT(28)
+#define XGMAC_RDES2_L3FM		BIT(27)
 #define XGMAC_RDES2_HL			GENMASK(9, 0)
 #define XGMAC_RDES3_OWN			BIT(31)
 #define XGMAC_RDES3_CTXT		BIT(30)
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
index b5f200a87484..6719ac6e395b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
@@ -27,6 +27,7 @@ static int dwxgmac2_get_rx_status(struct stmmac_extra_stats *x,
 				  struct dma_desc *p)
 {
 	u32 rdes3 = le32_to_cpu(p->des3);
+	u32 rdes2 = le32_to_cpu(p->des2);
 
 	if (unlikely(rdes3 & XGMAC_RDES3_OWN))
 		return dma_own;
@@ -37,6 +38,11 @@ static int dwxgmac2_get_rx_status(struct stmmac_extra_stats *x,
 	if (unlikely((rdes3 & XGMAC_RDES3_ES) && (rdes3 & XGMAC_RDES3_LD)))
 		return discard_frame;
 
+	if (rdes2 & XGMAC_RDES2_L3FM)
+		x->l3_filter_match++;
+	if (rdes2 & XGMAC_RDES2_L4FM)
+		x->l4_filter_match++;
+
 	return good_frame;
 }
 
-- 
2.43.7

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
