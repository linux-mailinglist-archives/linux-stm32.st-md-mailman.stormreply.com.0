Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gJuHG3MV1mnwAwgAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 08 Apr 2026 10:44:35 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D153B9422
	for <lists+linux-stm32@lfdr.de>; Wed, 08 Apr 2026 10:44:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CAEA8C87ED0;
	Wed,  8 Apr 2026 08:44:34 +0000 (UTC)
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn
 (mail-bjschn02on2112.outbound.protection.partner.outlook.cn [139.219.17.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9107EC36B12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Apr 2026 08:44:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gGzxnPytRuYJ0jFYc9mDq7zOaoGSq99J1usptsuSWtOOMyHrOVMOOYV3GoforLIoi+eXtTPzQ3RhcbGmMwTfDpfd4yq/6Af28rZNBjILAbVYLi9JpjrV0Jr1aFv64nGdXz1sNQeR5jMYP9buzhGAdj6Zw153dKHtWSh8xgMFtVR9GPhAZsjS9552eRVk2bX0oOOOnlleBBYPp61vMWUZFFuTezHWhq45761EvEU3fqi9KwIDO560dtmXgEKftnVUMl+THGF8QKI6bmeafI6E1k+0i9zS9OxEe+aaMYeo4UwNAO0I7YORLcW0bxNOyBCkg1SauQIw8a5weF9rFSifdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+zmfhaPUQaV/qKhRRuNmokCPlmlEmTkPnSqktZOlVzo=;
 b=FVpjRMnjKcKZemMDr8a8TFfPj65QEMh6FLtHXs3BdHnZhCGlzA3bd6wppyrLkAr3HgRfQSBMbL6RiPn0fW0QZ6JLuLLlQtcqhc2B4VTfJNZkrtZZ9zSJpvGOTt5NOY1WRqIgXz7M6i6Xwa+8lspHRZE5q0O2ff6K+EAUBLMpA6nb/TZzEUJJwJounwwJDEQtDi3Ij3UaTdblDQY+kyMEleJIrzksH3t7McQxb8/R6goHtb1aigxBZix5pzsWJbwsPGMXcN/P76IgqRR6zECED/vtvu66pvsDS5GXP8TJ+oag8uNr3dQsxo7GxwC4jEm0qAd2dScQ8P/fBy9SGip1pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:25::15) by SHXPR01MB0719.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:26::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Wed, 8 Apr
 2026 08:44:25 +0000
Received: from SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 ([fe80::9b99:12dc:a115:b90f]) by
 SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn ([fe80::9b99:12dc:a115:b90f%6])
 with mapi id 15.20.9723.018; Wed, 8 Apr 2026 08:44:25 +0000
From: Minda Chen <minda.chen@starfivetech.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor@kernel.org>, netdev@vger.kernel.org
Date: Wed,  8 Apr 2026 16:44:11 +0800
Message-Id: <20260408084416.29753-1-minda.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: BJSPR01CA0012.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:c::24) To SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:25::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SHXPR01MB0863:EE_|SHXPR01MB0719:EE_
X-MS-Office365-Filtering-Correlation-Id: 6290ad3d-0906-4fd3-ee11-08de954b097c
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|52116014|376014|921020|56012099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info: dA73NIAC9Nv35JIPb4lJFxaWCZaRO8EwXNAjW1ZkVNZ4S6RJnDvBB5XjGy3zlgj+NXn0X2/XCDOpkgHt+9YhDE1crbhjlUUIraTjdFiRqBGa+h/B7ZtUQliRC5AnjNUTBelNTfjbfMpzJJ1YCgTBsmEUihstpTVjqjE146Ols4mqCjFBG7tpTsy0G56JdRNKyr1uwuwlflzJUv7gOXReZNIfBVXt55uhcvnQyFsQXvWHXOqSDuIqJ9/NOwk+NBULdEvtecosfMnI+vHnUtozsDwG7bOCIRawIyunSv3t9b1QMtUi/khpkDwtiy39qD3/TH/pN9MHzak7xsza9MlNsoRJQqtj2yb9fuSURjLI8VvEDbIUQ0BDEQKI5Pg7vVSPhNFd7Y74MbfPtVk2i8kteIQcy2EZLuGczf412IiotoZnwhHr7OSKO4fUjO7cuaFYiservpwSDIsejrWwCdO6QGmSN98sU5zfFEZEHgkjvqvXAnSNBy68iqOXswP25qtQjmDB0KRig7hMOFSPhs+O9H4/8v5oOqq8bm8dA3JQgTS0MJI20d18bY1r20b/VvwAuEu6YSwr9iZ0OEIcjmzLCacISSSY9RLIfneAx9HKs9I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn; PTR:;
 CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(52116014)(376014)(921020)(56012099003)(18002099003)(38350700014);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ols59tiqmvVYwlZcgtyj72cvk5OxEoR2c3TVKLi5XVAge1tKWIwilIIrOfGw?=
 =?us-ascii?Q?RV3zfhSd0WYHpg9yOwZSNO+Fj1pZ8IZyflHut0nm+MIFmCQrmFSryN/5zLfd?=
 =?us-ascii?Q?diSevayRuU15IS0xWdL6y3tX5yX4iQ3olGWHZTg1mYXGqHKX8o3ruztPm7pU?=
 =?us-ascii?Q?8kx+6UsY20hYuXmQaLVEOPS55mTl4ltF7QZ3UN54v3JRsJiDMPk6Z+tMQKti?=
 =?us-ascii?Q?VnZ4225WFBXchfRSOFRXiV0h7AV1crWHUmfCxvGSpUWDnRL/KbSf1uoollJJ?=
 =?us-ascii?Q?JvHU/79O1oZcnlVsq7uUzx48bNueB3EAKvHfEx6SST0MxEoNLoW3IwqTjnQg?=
 =?us-ascii?Q?RHhyVtBZgW2dfIzPWB7obTPVk0oVRurJadnk0Z0wlqJuqttFOa6xpqkq3Voe?=
 =?us-ascii?Q?PiGz3LeRCk3sYFHq0uAp52FIIlazdTdNhRRlUna6eovlNK5IiL6PSeXY7qH6?=
 =?us-ascii?Q?HioBYIf+PsjUrvUH00ZaxLvvEF8bp8jwlHhsAfyQQEfNmdkDHD6+hJNHZyea?=
 =?us-ascii?Q?aZdnMAHm7mI8H87I9YAytbBfyy7jWwXCL6B8bD/bSEoZDj1klTm8KjJf4K9+?=
 =?us-ascii?Q?dSu8T6mogzsl/xTzR+QbN87l0OAkHNa9v/t3QUpWHS5W7tPQoFN43PAeUzoU?=
 =?us-ascii?Q?5kJCBETVe4Pf6mWljbc6GuNe7k99XcEU2f9Hf8/VshyY5iuMGEsTNu8sSYGb?=
 =?us-ascii?Q?/kBJRa6PwWh3HJJKTpnMZVZ+d8jH5VTcjNmejhObsr8iZuSrP3JLlPeKekes?=
 =?us-ascii?Q?42k+4sTxSyVLiT6M0xJDcsc6GCwEZA+H04CxHRSKD5lEhpr7NUR+72BhUgP1?=
 =?us-ascii?Q?7VFPBqmQEDeZdhvX74m6Gc6Fdu5yj/kvZqZlGrRan3ym9hHE/HrgAgZKyWxM?=
 =?us-ascii?Q?8csx+Ykw9ScuydPb2Ib7RhfgYKUnmdcyi8SDLSCkD0tHKUTnssr4Ae/tPMpx?=
 =?us-ascii?Q?ws3fGfzzVtQr70zzNoQrJwInRCaFbVE7CFcLFpKzezYxaed3Dh+Rg1BoVMOL?=
 =?us-ascii?Q?ZTLu7BecMKPA1imNthi4pXazynnGrdAHABRkG+9vBcHSasKR6ItVmieDweAk?=
 =?us-ascii?Q?edjrl5/xi4Gxw7OTjlVgp1mIITxxFzdY3PmWViM3cFHl9MfDiC5EqLithbW9?=
 =?us-ascii?Q?3nIBRLnXRb1o1uKiZnzZceL59xbr8eUmPMAocBNT8f3r4PVHGEP+ciFr12N9?=
 =?us-ascii?Q?YKN6tm963aYik4wIrg7jrhyDNsFCcECCPBOpAKav+h+LUWorY65Mw3YpP3kh?=
 =?us-ascii?Q?1r87CKUEVRys9KrmFgXilYvyLci+pUq6c2fGetaWHmdGcXWpcs15wwm3igp5?=
 =?us-ascii?Q?SYEn4GD91+VUpws1rh8J0GqgFyBdNIFVicllFuATagLVB1JUR4l+eNeeprGV?=
 =?us-ascii?Q?YE5PG4RTLXBwSr67vkt4dYJEBvkvcFrmVnf94w8Ma10/jkOWxenwzWSklTyK?=
 =?us-ascii?Q?Aq3vTS5BG4LuXM4TioN/Zr9tOfcpEjeQK6StfhjqK0TAy+RTnQfp6OalMpUF?=
 =?us-ascii?Q?RycmM3EMjFzTREq4tRE9rlR1ctXCi+0Ka2Blw9VmU/6CmmRvIpdg4bhAwdm5?=
 =?us-ascii?Q?40UAUxeVubXvoTLubI+jt/8EWkMHvtVIqEpR3EoDJPMpyJfqJpW96bhpYTBW?=
 =?us-ascii?Q?A6ZNXZ8aktvPiqE0ZPA139VZTxLBYy6NVm/MXEU3nQ+RFq4m4rh8oc5aZpwV?=
 =?us-ascii?Q?/XIhF17VWPFDLjTaLCn+/JCRPKWRvkUvYZR/yK1rY/HQCD+3vNKycotNSZGb?=
 =?us-ascii?Q?8qbat5XsuIBOvIMB86VOb9y4/cSCJ9E=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6290ad3d-0906-4fd3-ee11-08de954b097c
X-MS-Exchange-CrossTenant-AuthSource: SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 08:44:24.9410 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5gtb4gtvKDHV9uMgb6jpzZHu1/Au+WBvHOHmJOCAjme+MrxqPyJMOhBmPzb+JVzI18Tz39kqs3qT05Ob/ecjq/C0si97oNpW6Az2qFNp83w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SHXPR01MB0719
Cc: devicetree@vger.kernel.org, Minda Chen <minda.chen@starfivetech.com>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [net-next v1 v1 0/5] Add StarFive JHB100 soc SGMII
	GMAC support
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
	FORGED_RECIPIENTS(0.00)[m:alexandre.torgue@foss.st.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:mcoquelin.stm32@gmail.com,m:emil.renner.berthing@canonical.com,m:robh+dt@kernel.org,m:krzysztof.kozlowski+dt@linaro.org,m:conor@kernel.org,m:netdev@vger.kernel.org,m:devicetree@vger.kernel.org,m:minda.chen@starfivetech.com,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:robh@kernel.org,m:krzysztof.kozlowski@linaro.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[foss.st.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,canonical.com,linaro.org,vger.kernel.org];
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
	NEURAL_HAM(-0.00)[-0.588];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[starfivetech.com:mid,stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:email,stormreply.com:url,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 25D153B9422
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

Minda Chen (5):
  dt-bindings: net: starfive,jh7110-dwmac: Remove JH8100
  dt-bindings: net: starfive,jh7110-dwmac: Add JHB100 support
  dt-bindings: net: starfive,jh7110-dwmac: Add JHB100 sgmii rx clk
  net: stmmac: starfive: Add JHB100 SGMII interface
  net: stmmac: starfive: Add STMMAC_FLAG_SPH_DISABLE flag

 .../devicetree/bindings/net/snps,dwmac.yaml   |  1 +
 .../bindings/net/starfive,jh7110-dwmac.yaml   | 89 +++++++++++++------
 .../ethernet/stmicro/stmmac/dwmac-starfive.c  | 38 +++++++-
 3 files changed, 98 insertions(+), 30 deletions(-)


base-commit: c369299895a591d96745d6492d4888259b004a9e
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
