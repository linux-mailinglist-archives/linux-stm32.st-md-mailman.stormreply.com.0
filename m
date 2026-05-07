Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QjcaBVNe/GlWPAAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 07 May 2026 11:41:39 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DA97C4E6269
	for <lists+linux-stm32@lfdr.de>; Thu, 07 May 2026 11:41:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9EEC5C8F289;
	Thu,  7 May 2026 09:41:38 +0000 (UTC)
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn
 (mail-bjschn02on2093.outbound.protection.partner.outlook.cn [139.219.17.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B5957C8F283
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 May 2026 09:41:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PZZWyrCgmY9RgU7bhpds/JhE8tGp8QvQ7GYnTJi8RMhHN+qfQfZWO5dR7DtiaYu9Aiag/WZGX72w1qts8vS7KlC/LuOuJxHdgAeWWT+MALWReY6kfV3OUn0ZvmVJGZ7dlD4xOKOBWYQ6QW+azQI6fCB6rDGnRVzw4ypvxBdQbsrGd4/T7bgAEj6J7bi+3pRxnxk6F9DroBDYc3bRf+qFjFpaCIpNXZwKnEvN+tu1XrXaZn+R6wbHoAU0ApQerBNbKTXIm76Iy4aL+5Z20xYo8ufDmA33CStCoY14URvFgsVrXd8WkDvwAudlOivNekZsYOKRMz/VStXuGQcjMbKSlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3wve0yqKAnwC7Y0OQAQZUCEndcyLS/ujIG5e1M+Qtoc=;
 b=c3tSETA0al32blsv8hQ2UUiFWwJWJDs2zatVx97Pv/sbDHbHIlDnfX3QbLcUC8dT79r15fFG6SIXWtiAggeRGiyUOMBnQK2280Su1PLqs3CcR6YDInIURDqxBpppYazX5hE7bM4vhs7u5xKgbS48Khd2boAZXRWQEzO/IzbgDhjj5hogirJcTBgLM5RTDrC13OFr0yzyKN4cHs+Tmcsv4FpLwhYpSKHQWyhDTerya8fFIY++YrVkiIA/zBM/t58ZvKT82eNQ42q3m/TbeTAzb+CDTWOv284ANxciR+NOL+tJ30mgo1roYJbv1r+tIdika5qBsa2f7vde1xSnD2ryOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:18::12) by BJXPR01MB0870.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:14::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.17; Thu, 7 May
 2026 09:41:30 +0000
Received: from BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn
 ([fe80::e2de:92aa:4c1c:a829]) by
 BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn ([fe80::e2de:92aa:4c1c:a829%6])
 with mapi id 15.20.9846.025; Thu, 7 May 2026 09:41:30 +0000
From: Minda Chen <minda.chen@starfivetech.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor@kernel.org>, netdev@vger.kernel.org
Date: Thu,  7 May 2026 17:41:15 +0800
Message-Id: <20260507094115.8355-6-minda.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260507094115.8355-1-minda.chen@starfivetech.com>
References: <20260507094115.8355-1-minda.chen@starfivetech.com>
X-ClientProxiedBy: SHXPR01CA0013.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:1b::22) To BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:18::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BJXPR01MB0855:EE_|BJXPR01MB0870:EE_
X-MS-Office365-Filtering-Correlation-Id: b52ea212-2d94-493d-4f28-08deac1cd142
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|52116014|921020|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: sx9YUrgXBSUhW2O/oXemz8UvNchd5bh0HXNK6qGJMvmfG/tphxa4gHVIrtcENgK0514JCjp+i0OthOrmZ18D+7XAlWnTP9lYTc/IW77KnzRXvTIE/NrzVSCRyzqC6ty3ZDw/03hFm6gjk4JilRyzp2uf/cAZKPg5l54CuQC44q3z5YuHJprrU6lqrlH/g36eq97Vass7yzCMLFzhCq705eHIbAZKhrL5UPu0RthUG87950PqY2r9FRC28eV9+kwNW71PpaV3cRPJgVUgLQX53m+Ulf/D/DFXF0hm8pnDgofCCblJxGfKX1f76MhZ/jM7TVnDek5eIMPobZ7EdKmftf0zYDAMY+ofLtHWv8zNw27PmB6c+PpMdKh9N8UxJCKkifVgYXkbu9jdJUlLOu22Y5WJX3/Lxnvxw4TjVZRZQ60/lpgVm9zm3wLI/RsGpgeSuwZR2AFigXRoc/bxEvwJ99VJTWhdIB8vfCk+bxMwI/4UAa8qTM4oNvrl1yqqNbwZAKWusvbq9BmxF+aPZAXoTlZl+6K2177JalpOUiJArk4iZ9I2OXKIDKu246TXe5IJKlIgJ7YRWtc/QdG7G2FROQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn; PTR:;
 CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(921020)(38350700014)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ROJcXeR1IvyHQurkKLZFYzGJGIi/SpX9BO4CWeidnJFnIs1PrFu8zVty96gu?=
 =?us-ascii?Q?L2bLeJlDRucNXBur2fyHyV+tCAjsCAZMWG+HmnmvEcNAhcHBXlBJESh87iJT?=
 =?us-ascii?Q?ZsnNMp0Ietk3lOLN3akPCiSd6DlH4LsP/jt6GMc07k2M88Unh0MFMOdGZ2IS?=
 =?us-ascii?Q?NbsNAMKfOZpyAJ7BuH80Ql7zTzPl6pjWX6M1iAbtFwb2SLbq1o8yKVzLxeOJ?=
 =?us-ascii?Q?3IGPz2N+GJYYoQS4PCKC5w/Ai//MP0KBWFpNlTyJ9lUnPB2PVgVqdP2trKBH?=
 =?us-ascii?Q?qK5MwvwWW8g9A/VadgOprl3p/EqGF0FwW/Y87VEoVHUPxqvXBSbCxv8Yf+CN?=
 =?us-ascii?Q?eWbvRjhjWjQJLIeQDOCAJ2xB+KzaZxUsxgdk2MUYkBnxRw4L8RcxE8IWSUtA?=
 =?us-ascii?Q?2NxAKuZyavYQLb+lfrSILl5Q6slZryQ6b8jMYTYEy3cC/Uv+S8HIvmhH3UBz?=
 =?us-ascii?Q?9RoUFyLm6Gk4mv14PKIQR3xfZrYS46c7nhC4w9K4RhbGwB+rIjq+uVGQSXhD?=
 =?us-ascii?Q?w1r4pPqrm18ytr7XSGCu/dKOHddSK8/knWrepcxfE/NdE8wwc7011Nb4yVss?=
 =?us-ascii?Q?cXYHA5ZmAvjUcS6lVez8R6oglj4ZwBNoYksSlxCQr8EbpRAjFTrA525goM/s?=
 =?us-ascii?Q?xueswUsTY4Zkce0veBZQVNlsTCq14rIfgVsUwJoN0i8QkoVxIIrgfZAi6V1c?=
 =?us-ascii?Q?xB3PYcZTcISbMx2jHbtkM71DFJINMs3UjAq83+m/lrJSMh3xESF4ZffKbucH?=
 =?us-ascii?Q?MW8eM0KIQilbPp6fob+u+sdNE5eg++ma7xxveVLMF/nonPzZDwAtqA5fxe29?=
 =?us-ascii?Q?a4nyOgFKq8o9f+amkHztvg4s9470/dpMp2pz1EtBmRO+hqq8MK4TFHExmxoC?=
 =?us-ascii?Q?RLKL1KSf8ygUzIgpUo40i1OD0W7Nx8UQ/PziU9gCaxKNR0f68crcxSbx9COt?=
 =?us-ascii?Q?K/wOl5CG07jIoIoWJqOURWOaFQR6j9v13QLFEGCSGhMZSO4IO4HCcxTa/Jvd?=
 =?us-ascii?Q?MPmN/wTm4yEnhtscfVwW5BJiGY4Ue8itX7zQSRuxQxiG4RKxZK7d9Bpm9qnP?=
 =?us-ascii?Q?G5IvLPNsxBLWBZmYguoWHE0h+WQKG0Ua3oc0E8zB9wSitQlhn/av16wAmzKt?=
 =?us-ascii?Q?ozXP1vGARGSwGwQRH6eRD4GW3lKgx0elU3fdcjW3GtP2qGqGh54Vvg6gPOOG?=
 =?us-ascii?Q?zwHdfUhuXtGSz+mdlXTLL13uxKvp6sL/MMgjQLckrZQdgslKhgXv6UcCOgfY?=
 =?us-ascii?Q?VKtxkAzrUxKIP/jrZndnuAgNcRP75WA4CC9Kl8TkibI/ELdZBP8dXP/X9Mat?=
 =?us-ascii?Q?KVdHh1KEIDYRUPv5CK/WOPAaexjhpRmwpVhzOOe0HoBZhVhuR9GvBNf2JKzf?=
 =?us-ascii?Q?3lugfX6X7kGbOxVbIr/Hob0jh/wBc0VPCQ+l9OqPiMJCo7h0OeT6UXWvoc1Z?=
 =?us-ascii?Q?hPq6Jod4mX3DYCc+CLpbs6Xf4Vu1Uj3VemeTrVwxBRNQpVmxg1pcLSQdXrbL?=
 =?us-ascii?Q?WkhHzYWJMTh5KiFVyXJck7RT/cWPxFnswLWkrHJFfFTPrhTIQ3ppOxQqmFHM?=
 =?us-ascii?Q?78LyKiuD3qDAg35nw4mhbSSAt7nx3pc4Bm7V7D8HA2CsAyyO31RWI00NGJ6N?=
 =?us-ascii?Q?g02FYJcBLU8q5rTcgUgEd16uJzRhksjFg3jRBdac791hNVQMQMue1izR5lFb?=
 =?us-ascii?Q?gep9w2Q/XWEKKyyEezNb6X3F0Xw/AwAHuS3gK4uw8TPLQb7/qB9lvKRrZH32?=
 =?us-ascii?Q?/0QPw3wG7TL2TaySp9GPJdKM1mI7aco=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b52ea212-2d94-493d-4f28-08deac1cd142
X-MS-Exchange-CrossTenant-AuthSource: BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 09:41:30.4622 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J2D6wxp9bECn8Y2C/yl85Zw7zF9DfU0/JAX8nJKF9F/izHJUHedXcb+XXe5/IxsAFvcUlrsqvN+rC1GKEZB5lOgwaYaDGlvq7oI10a/3oPk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BJXPR01MB0870
Cc: devicetree@vger.kernel.org, Minda Chen <minda.chen@starfivetech.com>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [net-next v3 5/5] net: stmmac: starfive: Add
	STMMAC_FLAG_SPH_DISABLE flag
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
X-Rspamd-Queue-Id: DA97C4E6269
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.79 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[starfivetech.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:alexandre.torgue@foss.st.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:mcoquelin.stm32@gmail.com,m:emil.renner.berthing@canonical.com,m:robh+dt@kernel.org,m:krzk+dt@kernel.org,m:conor@kernel.org,m:netdev@vger.kernel.org,m:devicetree@vger.kernel.org,m:minda.chen@starfivetech.com,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:robh@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[foss.st.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,canonical.com,vger.kernel.org];
	FORGED_SENDER(0.00)[minda.chen@starfivetech.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[minda.chen@starfivetech.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.392];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[starfivetech.com:email,starfivetech.com:mid]
X-Rspamd-Action: no action

Add default disable split header flag in all the starfive
soc.

Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
index bd86a39b79f0..935c4fc4c29f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
@@ -147,7 +147,7 @@ static int starfive_dwmac_probe(struct platform_device *pdev)
 			return err;
 	}
 
-	plat_dat->flags |= STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP;
+	plat_dat->flags |= (STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP | STMMAC_FLAG_SPH_DISABLE);
 	plat_dat->dma_cfg->dche = true;
 
 	return stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
