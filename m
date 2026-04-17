Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sK9UANOe4WkQvgAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Apr 2026 04:45:39 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 409CA4164E2
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Apr 2026 04:45:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C2954C8F292;
	Fri, 17 Apr 2026 02:45:37 +0000 (UTC)
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn
 (mail-sh0chn02on2121.outbound.protection.partner.outlook.cn
 [139.219.146.121])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2475DC87ED4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Apr 2026 02:45:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l5of0svGxnkX9xQ2qq5HLRBnr3RFHk2T1uCeML39uqSs0lMy6bHMdC/dHpLtXaru4IoZc5Hn8fOPslsBmVLBZ4MNq5+mlQc8gpnNjl/uAJvF92yIQV2L2zY2A3Z8LrX5jMtPYRMpTYZOZ7uNBKjkhmIaKwSK3froZVRQke/lTI5Laj6hqYvic5QnoguuTUDjTsTaGuTH4JSIucISJzZ1Bhv6EUbm5VWxefLscXPFE+JYknwBooWP/sJ3F6y283Z5B71To2bFsKRMGSMMF/UI0V0V920y1U67ac7ldIpvZ8TN+Jcui1SudXE/uZHu7eIsQuzwGafeYXWJpZPluubSmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eBS+dVk8fjPlFaPGiBV3bi2ohi1pudGFfBYThY4spvA=;
 b=ez1xc6W8EYDtK4XpQEijfbsrelAD+uheLDq3zq3fkUsbfu40VH5ahPD05Z7D+H3wcejK56h//hcR3lBvMAyhDw77Pxt5e58Zkeu+vpgV1drqadLCSHX+MzWoKUQs1WvPxvPVYFa98cFTftnf85v6m5lzlpFgthw8Rvw7cAuuO4FY/sLtArNrCn80UHXzcnPTBkxDAAiEE6xOtZsdJ9caoSlwQ6WYBdzc/qvTQBrMnkWh1E+oycd96JUuwt3kAq3HjWUiDNmsGiyvKjIyR/FzpvL6C6YSZkxZnYFznVKSksIvmz4v5hfgsKrP+7Iin9gu5Y/7lI94K9ktl5EsAb/SSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:18::12) by BJXPR01MB0517.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:14::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Fri, 17 Apr
 2026 02:45:32 +0000
Received: from BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn
 ([fe80::e2de:92aa:4c1c:a829]) by
 BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn ([fe80::e2de:92aa:4c1c:a829%6])
 with mapi id 15.20.9769.046; Fri, 17 Apr 2026 02:45:31 +0000
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
Date: Fri, 17 Apr 2026 10:45:18 +0800
Message-Id: <20260417024523.107786-1-minda.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: ZQ0PR01CA0036.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:2::20) To BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:18::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BJXPR01MB0855:EE_|BJXPR01MB0517:EE_
X-MS-Office365-Filtering-Correlation-Id: 081fd850-ce8b-4d7a-d2f1-08de9c2b647e
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|52116014|921020|56012099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info: GyvhqVQxVUpxbqiEmEk+qKfQEbHgHfwP6kPhTlJPMD/O+jnya17a9htcEUGI8MtWXYdxXf5ERZZqxWUv24OZu5w48W6BaXFbRK19aDsrAQi3BfKA/rKCxKh4PMAP0LbQQ4dig1CjWucJW7t9ek/1k1kF/zvCc8dwp7RfaSlhsBFZHoEsTcII/O0SSuOXiGU3yAmGmYV6UAuxNpzDu8rsiLXuXTl7avjr0s3y49B28FkRrHUhAvnveTUErFtEHiJmp/vnsTpnk6r2FVh7O8c6NrWkIlViuDYxpfiq6k0cY5aC52WN7nEPFxNoXZFQDeSdsL+mTdn8hc9crZtq3pwnakN4xN2K4xc4AKkiA36gpDVkDtaVqUwwzW2z+A3gqmpgkpaTUcLItKQ/dkwQIQLq6v4/fgi8QcocEGfOtifpxgfkWSozswvtrC7ra6oL3/Z67ORbWCo3hVGHlnJxVHE+ME8gWvV4WSyuMA5k7EuwTJ8z88tCtcipMrOiT/t4qXDnaOkAjgF3xh5g4TjiOzoTOHbhR7ZHfM4FEm4FH+Q79o35rpL+EelnI0V/9wOh6Ay9eNUu07zbw41I9t7+ntWUtNe7Fx01Ol4OJbXil8RV8WU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn; PTR:;
 CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(921020)(56012099003)(18002099003)(38350700014);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?F63uixmKcd4K+QLiNWLdhhxy8OMo/ZTl2NJjg44OxrLX+Ek7hUHVnSvuBS3P?=
 =?us-ascii?Q?LIJW9rVAFCtWF0muBD7ipk0EbiNCd14DFX6SHocyyYoEODpUdUFlNq0ivjc5?=
 =?us-ascii?Q?7Xg2H0gm71zHkExIF1ouojYVHVHMNID/shUWswZPvE9RsdV7OR5raOtslwmU?=
 =?us-ascii?Q?TYdMYsMVUdEA5V3ueSb/2UBn0SxvHhDZeU0H9MEkrsgi9z8lWatD6iag57GN?=
 =?us-ascii?Q?aIOiV9imlG07TvcvAbzBmZ1atJbyawfD/oJFghbKyrsuedLio9PSsqhdYbs1?=
 =?us-ascii?Q?wBBXcKQr+EROGIZ2MWrsrw8/pjoWewiaq8k6vc6LYwzzGXbZoj0pVLE10nqc?=
 =?us-ascii?Q?sKokS3tQL9m3dwroEPXwMQ8t7dFzSv0i/NUEVtM1hevmuI6FdNBCUJA0E7FZ?=
 =?us-ascii?Q?Spb0XFJfAOoEOs9vcYwsRSh/Zqd5QCnibRlJglKfaPZZ1QMlwXU3bUq1mqsP?=
 =?us-ascii?Q?YdPjtyQqe3cc0X71iCK6fsNcRYXHuCsyRiBxOWpQcqhbbLZwu0tXvpBXADOb?=
 =?us-ascii?Q?DoObOe6VJlhlvyPktDvJ7BxygCp53YprRyC/ei6XHdoCypfl63IuA9LoOE/f?=
 =?us-ascii?Q?XMO75bsOt4rryEKeafcq5ideryWhn3SVXqTtlHrXjno9ZEDD1m7P+sPSjfy8?=
 =?us-ascii?Q?KUhi3I0j+LU7+7KsD1BCxZuQBFhc+bYvDVQe7O+dX8pPLZjX+VPewvOEy87g?=
 =?us-ascii?Q?BFKgn/yfFQ17NDQMPvgTVHd7/Hgrt+CgyUpQhqZPJBTH/5BPe5K2qRvCI6h4?=
 =?us-ascii?Q?DvJph14fQyLxBo+IGnetbXd2ME+6xwBF6g1K4nhkvpwlzzUae4RM3WkqGqiT?=
 =?us-ascii?Q?nOouDA06vVw0+lpyf/OHRBsAxzqo8Sbv/JtQ1eudGx/CDg40PD8T2uisNBf9?=
 =?us-ascii?Q?nSrx7Jb29ieZ3Hcd3+mgDt5oclQxWMHKQG46eLSQXzebM553V3rcRZeK+6UW?=
 =?us-ascii?Q?98Tskr62yc7a7IdOQVvqonnyfj67nIRA5GzcX4m24KPJmHZtNriAXp8xRhei?=
 =?us-ascii?Q?LvltjsBQ46ZoVjbkGsfa+8m7LeFwlDvr7Nufc//RDT4m/7eDvxOkKev8tw5y?=
 =?us-ascii?Q?7KwIIC+7kwQTVW5oLQbiJwwFxumIY9qJtTj9ih3MQFyr1V62sxP/US3UzUwb?=
 =?us-ascii?Q?qN4Lk2uOGrChyEBa7j1tZgKVWPImUlpIHwxplOCYO7hYqmhBZf4gMgnuBHmI?=
 =?us-ascii?Q?VJ3vwRwKG0fWvPkBBxoSJ2V4tTOz5z8V7FnoRoHs3tiFbntcu09q4TKcY3mD?=
 =?us-ascii?Q?2wwrY18kv+/Pb1NgUWFo/Dr7E+fvIOcSUjZKzv3pCW12yRH2UdSBRRlDlfxy?=
 =?us-ascii?Q?FeEEYOx5YIjIcy/3pKAuM40pmBmTSNSZpvGQH6ZDuZEr93D4VI/ifGhpWS92?=
 =?us-ascii?Q?7vrcJnr4bumixWvaqQzIKyGL407SlN8G1MntCC6R7Y13q2DsVzVE2+CzNb/c?=
 =?us-ascii?Q?sEIi6LrHKpoKqt6iO91GL/8dsJnLMWfJuHGbGFFBepLOzI5h+Dfe59uKcAvw?=
 =?us-ascii?Q?CHRaATKLc/R3msRUqknKbzmA5c2ZSyrVLkBZJH3M4DFBDtlsns4gQB40Z6Uq?=
 =?us-ascii?Q?OH/OHD/J8FixokA0ppuG9K0bBSv9BMqU5eYAWjIlbpmDH9aNS+3YITLLIitm?=
 =?us-ascii?Q?qtUySYU2Qfum9a8UuvTxzRwPkzxdI3iMn05a5NR2ELgi0O15wpAtSjxHj3l6?=
 =?us-ascii?Q?2Kprk0z5LjcuWFTGNbmFhp9QHuLj4Uf4B0M9C60INfxPPEQtunc1gPbqDF5h?=
 =?us-ascii?Q?refai86e9k8wzDmOXe6SrbSmjTWM+iM=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 081fd850-ce8b-4d7a-d2f1-08de9c2b647e
X-MS-Exchange-CrossTenant-AuthSource: BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 02:45:31.8247 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J3W+9+Ouo1VfDgL7HrESAEUHODl11xJXdIG6DMMHw1ryg6QD+gUEaHziUZKvUv/ktSCY8FK831vAjcoBeHPc7203lLSvRlV7uukgOqm/2Pc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BJXPR01MB0517
Cc: devicetree@vger.kernel.org, Minda Chen <minda.chen@starfivetech.com>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [net-next v2 0/5] Add StarFive JHB100 soc SGMII GMAC
	support
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
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
	NEURAL_HAM(-0.00)[-0.977];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 409CA4164E2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

JHB100 is a Starfive new RISC-V SoC for datacenter BMC (BaseBoard
Managent Controller). Similar with Aspeed 27x0.

The JHB100 minimal system upstream is in progress:
https://patchwork.kernel.org/project/linux-riscv/cover/20260403054945.467700-1-changhuang.liang@starfivetech.com/

JHB100 GMAC still using designware GMAC core like JH7100 and JH7110,
and contains 2 SGMII interfaces, 1 RGMII/RMII interface, 1 RMII
interface. In JH7100/JH7110 dwmac-starfive.c have supported RGMII/RMII
interface. So require to add SGMII support to dwmac-starfive.c for JHB100.

SGMII serdes PHY has been intergrated in JHB100 and do not have driver
setting.

In JHB100 EVB board, SGMII connect with motorcomm YT8531s external PHY
and support RJ45 ethernet port.

The patch base in 7.0-rc5

changes
v2:
1. patch1 Add the remove reason
2. patch2 rename rx clock to sgmii_rx
3. patch4 confirm sgmii rx clock exist, or will probe error
   sgmii will not call starfive_dwmac_set_mode() 

Minda Chen (5):
  dt-bindings: net: starfive,jh7110-dwmac: Remove JH8100
  dt-bindings: net: starfive,jh7110-dwmac: Add JHB100 support
  dt-bindings: net: starfive,jh7110-dwmac: Add JHB100 sgmii rx clk
  net: stmmac: starfive: Add JHB100 SGMII interface
  net: stmmac: starfive: Add STMMAC_FLAG_SPH_DISABLE flag

 .../devicetree/bindings/net/snps,dwmac.yaml   |  1 +
 .../bindings/net/starfive,jh7110-dwmac.yaml   | 89 +++++++++++++------
 .../ethernet/stmicro/stmmac/dwmac-starfive.c  | 56 +++++++++---
 3 files changed, 106 insertions(+), 40 deletions(-)


base-commit: c369299895a591d96745d6492d4888259b004a9e
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
