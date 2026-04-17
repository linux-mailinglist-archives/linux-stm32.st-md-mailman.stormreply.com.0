Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6DtUKNSe4WkQvgAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Apr 2026 04:45:40 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9604164F9
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Apr 2026 04:45:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 47F2AC8F296;
	Fri, 17 Apr 2026 02:45:40 +0000 (UTC)
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn
 (mail-sh0chn02on2121.outbound.protection.partner.outlook.cn
 [139.219.146.121])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AFB17C8F293
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Apr 2026 02:45:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SiV63H6RaVVJbd8upp1RbYfGS1kp+naxldhhZjNRZeQ5nbUfdmiSL3LiuhuTVKGLD0un6wwNp6HyovxprcjK/4pGI6SvRC9tkGaooUwLyBPD3659scpXbLzwuCZB+cn6Civ+rsMvliP4tfG4bSYADE+AiAfJjrwV5LPPAup2bz0X/efaYUB4UKFyh1vSoEXX063ZDw7klRE/nZ/shze5G795ZQDQAsUHda4z4rqvb/lH0IWH94jPoAJ9K+W3MsWuNSomYxo6ze1ClKCDIGxwNMdXuFz9NA5IuOWEQE9JPXpMloNpFbz6uekUF8oT1FujKHlr6TwSAjBy0lknYfDo3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AtoMmKFE2y8g6Zs6HD8pvwL5h2PvrVlYzSzteURIgxs=;
 b=Ax0MC0A9jfur0swEe7+ytiOAkNSyhwQWp6Ue/6VJYLfm3Qc/Pc3Y8T5cQ5g1kAXLz+nUjRcDAbwfdYxnCJw+0Wp47hAtUSoEyrcEsAImxwExpZGdx1IdQFFYh/56QEMJ3uIiAfMirHm8rjfonBm70wU0ZstZG/89p6ZpNGSaLVulU9NyeMGtB78Ea8sXzIoKd6FGnmnTX2q6uphrwns5MXRRXWHlys9+mLaSL9sqM/DOtVrp36hzPUeu9lDcYlu5wHY3epRexnlfpYr2x7aMFgW4MCttbLryoEA2yDNevxk7AnZHur3hPzEZVUBpiC0gw5hODdxaMDWxOYlSBTXeiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:18::12) by BJXPR01MB0517.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:14::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Fri, 17 Apr
 2026 02:45:37 +0000
Received: from BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn
 ([fe80::e2de:92aa:4c1c:a829]) by
 BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn ([fe80::e2de:92aa:4c1c:a829%6])
 with mapi id 15.20.9769.046; Fri, 17 Apr 2026 02:45:37 +0000
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
Date: Fri, 17 Apr 2026 10:45:23 +0800
Message-Id: <20260417024523.107786-6-minda.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260417024523.107786-1-minda.chen@starfivetech.com>
References: <20260417024523.107786-1-minda.chen@starfivetech.com>
X-ClientProxiedBy: ZQ0PR01CA0036.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:2::20) To BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:18::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BJXPR01MB0855:EE_|BJXPR01MB0517:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ee31287-ea0d-4c9f-768b-08de9c2b67fa
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|52116014|921020|56012099003|22082099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info: 6jNxFlTrJXGkVs1Yb6k1xl6Fm+gRS9h8nMKOgOduk1ZCa0zdhPH36hZLgMAJg0bKwAKvhLnm7u8bhRF6V5g1ZkwkSFHWQNmC2uW3UNg2CF2JWhZzD0Bb6xiaoPWM7WcN2ycX09LcNSyIW11lKiv7CSuISMzNjhcfMBJUd8PQFQ89cZXCPvi9oLlk6V5vlQNAKmRCP6ip/wQmp5+7ourn7wefXB6weNUax1T7SChy/ed70e3lxz0pt6rva2P+aPeMzk8/C8pIEAK+2A5aHWQC0ygWalRhKeRv0JbQFE1KDVFp4lktL1bsZvjo+fYineBAGAxrdoJse1R3+MbqJIlgNYdRk8AwiBLL99/mT1I1KsCeI4NOx2xx2imlFbrQ+0FYT0Nc0gaEexOSZM32wlaoYc5HBrIFzdp0t3EWigT5VwhLpjXU/CyLCJrhLnG+QMa6baqu/p1OjOjnFc3wgmXGH2SsYjyCfqBOuKeMEN+EVTWa21vn+QhQrPwCKT1GEwCdK5NpcT4YAUNbJ+hOM/oSHSSNlnx4D7ewJYZJacEU2nvCoabbkH+HXEkINeSY1iIK2xF/alo5ZJWNivMXJeMQ64+deBe18YtXIQki4VMDmWU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn; PTR:;
 CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(921020)(56012099003)(22082099003)(18002099003)(38350700014);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ik86VFYIZfUixK50YaVr1BYf4zAy2hg4gMhV2n+/bjVz6cz8apwgpRe/mJzh?=
 =?us-ascii?Q?dQ3HMBkpqOu2ynLc1OVKjj1z/CfmnyFrAGS/LLo/ixtydgo2qLV3QFBj95PO?=
 =?us-ascii?Q?ByAWaXRfM81QeoeQKT2HmEMQK16RKhLDGwo9Htqh5s0yZx3W7IHVX01cuMd5?=
 =?us-ascii?Q?Tf97eCS8QqTPnOIBAFDhvmSHkiOFar17sxKLyLa8sLMAtRYdQnB4of1M8WiM?=
 =?us-ascii?Q?Wx+MOAqpaDffjxLjkm9b3sRh0HvcfgUux4rJD9+R+T8yQFWiYPTyv4bbZXfA?=
 =?us-ascii?Q?+QuSXrb+G+AHS9P7/kCUtx/B+K9Bz1XcL239PDtEX/9vWAjno/Sua+VDnU7z?=
 =?us-ascii?Q?72H49NShbqTS/0jlApqUKGozjc6Cqtf96hRF24+XCWFpdkiBzHtY73j6LLPj?=
 =?us-ascii?Q?htcjk2AZqqY2mWndqkS84lqByqjUPO9UEbABflhkNJKgwmSQFhLxVphzbRpi?=
 =?us-ascii?Q?B2TlWM9dOzi72N7bXrfSSqcrk8jtzmOSYUX4nehYzllAs08CvnCkdWGGokTq?=
 =?us-ascii?Q?lX7G45SGemETNAnmp5vu5NEWygdhbVpigiLSjHp6Ci05VYJ+laokQLtdB3aN?=
 =?us-ascii?Q?8MANry74bJgrLMj3hzO7dQbPIBABF8PnxTAfEOPck8zkx9wyCxSQhRz81kMG?=
 =?us-ascii?Q?MU5H1sSGcb/yAkMvmFPvM16b0sintn0wcL/y2zvG0kLaeM6VfblXBCZvHm2R?=
 =?us-ascii?Q?dtbr3UUmlyMMoqnM5yvhGTfQ8cz6qS/VbnBsJ+UvWY4jTYBlNRdmxAWwDDm0?=
 =?us-ascii?Q?vFscSvploJ5C7kLzh/WzdU1yC03DRxrm5zlCLELYvMdL/bRonMjyFTv/pPGw?=
 =?us-ascii?Q?TXVF/Zh7oyXhPIXS/F2kk74+IdUINa1kBy3vsRikn4rO+KmhmPHB3VzSMpEr?=
 =?us-ascii?Q?iaVj/I5y7mTsFUwc5Ntoe6lAdFLc3vV/qeBFxwDZIQT2KarOuq0WuGmHVUiw?=
 =?us-ascii?Q?4QWF1EI7ggiLKNQsK6S0L9aLJDE7cjxV1SIWa7805DeNOOGGRInMspzteqIO?=
 =?us-ascii?Q?yu88uCAPeSHkkpjb0sEEpNRhUgzQ+7o1zMcFFEotAXztHsnNl0it8mQ4Kcxl?=
 =?us-ascii?Q?87KDbAB7u0U3Cg7WqoI/rHHx/CFwprgkYSz6M7qPjQ4FywBvzHzZMNB8yGYH?=
 =?us-ascii?Q?+iv/E5gNfe3IJV7RX2RvlZsEiKGZgxZv5g/V/MONnwW/clyOvdK0DbZH3dwH?=
 =?us-ascii?Q?DNFw3NpDdCXovzmRVDUDjdStdxWOJxx5FYSDHZOOcmzc8B62FZ/fa9kviRfi?=
 =?us-ascii?Q?JNpGUEVRjTDUW7XAekZQ4RwJSwEpR1L+rDPaSm7zNlBiIonaaRSvv3s06R/N?=
 =?us-ascii?Q?G6xFSfSwDtpmB1E4DbSiZKvuiGO5b8ymOkiAeNcTBS8OzJjOcu7/WDeqmhuo?=
 =?us-ascii?Q?WpNgMqj9/IU+DRZ3mXrxh2dHfj4HsyDkssxwkhpLB9OBAU+5GG0xzXnoMQ+3?=
 =?us-ascii?Q?FwtqU3aXz6vWC2tHFY5dVdHIrJuBaFLv1um0pRtSz0mMFypL4P8wtZkCBuGn?=
 =?us-ascii?Q?5sTF95S52LQHy3BYPi1kEeQDO8X3kyKlvMiYKltTR8TAlCQpsfhTQJXoY1Rv?=
 =?us-ascii?Q?D5rIfWtcOfHY0PuEXgzLeRITYqH/L3T3ilAp9MMymc4mdb5XW6698GY/A5gZ?=
 =?us-ascii?Q?ewceOXfWaW3AGW++r/+vLv7xpzCHPbibkch4RTI3jClDXQSDZTNV2mXt59ik?=
 =?us-ascii?Q?Rvke0VHvyCJYNPmvqS9XYA85a9tEJk2/45RKfEwlMASgS+Ew1KFZXaQjtzQc?=
 =?us-ascii?Q?/PEEqBJvtnoPEEF3mnYJKySjYJCrQFE=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ee31287-ea0d-4c9f-768b-08de9c2b67fa
X-MS-Exchange-CrossTenant-AuthSource: BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 02:45:37.6643 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nSy9fi/2RFfDJ4pvijZ2/Na1IACHwdOZ8c1JFsTEwvRgbX7XPjE4RlFpCSAQ9TsmP308wDc/L8b8rJqkvEMdoCBJNcRryY/cQHbm13JDgfE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BJXPR01MB0517
Cc: devicetree@vger.kernel.org, Minda Chen <minda.chen@starfivetech.com>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [net-next v2 5/5] net: stmmac: starfive: Add
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
	NEURAL_HAM(-0.00)[-0.962];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 8E9604164F9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add default disable split header flag in all the starfive
soc.

Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
index 91698c763dac..9146b498658d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
@@ -145,7 +145,7 @@ static int starfive_dwmac_probe(struct platform_device *pdev)
 	}
 
 	dwmac->dev = &pdev->dev;
-	plat_dat->flags |= STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP;
+	plat_dat->flags |= (STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP | STMMAC_FLAG_SPH_DISABLE);
 	plat_dat->bsp_priv = dwmac;
 	plat_dat->dma_cfg->dche = true;
 
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
