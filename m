Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sEWPBziuFmpHoQcAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 27 May 2026 10:41:28 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D415E13D1
	for <lists+linux-stm32@lfdr.de>; Wed, 27 May 2026 10:41:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7836AC8F290;
	Wed, 27 May 2026 08:41:26 +0000 (UTC)
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn
 (mail-bjschn02on2094.outbound.protection.partner.outlook.cn [139.219.17.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BB55FC8F28E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 May 2026 08:41:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G+cRh6IPPIVmJhqQSAYWo8R6nJVvhxzbA+n/kcSMwbE6+MMnpOJ14qFQq6mkBorpqdMSRn/u8bo3WpJ8Y+HZ1GSiX8AmNXaS3Fgvsmtlq+gn6Z512OtUY84Uy/2aRscvSristtoGNbalnMw+OjZIGqtzy6u87rE2JFLuZfJnK7mT+PhMSVhSHCOaxmgs11KHjpthsoKpnoO5JN1SxFZsDPa5LNKN8v/oXHo5m2AZ8mZWQMKdtCWL/aRBsBVU1mTGnWD5aif6aYQ1tl1uPLTrCX5l+PQ0jTBvE15nnK5VDNDFnOWsc59ypUkvvTG6Eea6zPvvFSIgaW53d72e5LES9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5N+EGJ+iUMaM8iD/stUthqHuUXhlEwEtxd1Jc9cX7hU=;
 b=Lg/ro14sIOqXZTTUO1xm8w4ESf8Z5qtyPxcYjEIjbsJTSsp62xIl+TEH0F2Z4KnT4y/RLyFYDX56NVopQXbaqrElSsQNV6Owh+soVeyJLP6dK7UoNctVOQAcN+b7n4TAGHxf0pf2O5Cj2lDbGorek7U9nD9zF5dtt4yRZphTEV2sDVPxt26jxzXHJF7mZFhYvdxv6lwdPi+bW04xErGqdRlnjJmGi9wtGAAPDH7Bn4Dqfnsu8TG1iPi3GfYkXis8kD3owSqffTGDsPiWIqKjwTUy/NYtyucX+d8kG1OGes8vfxYVhCQaA4Waebt7FdJd+AjHxsJ/F74ShSnDlPMT7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:25::15) by SHXPR01MB0829.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:26::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Wed, 27 May
 2026 08:41:16 +0000
Received: from SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 ([fe80::9b99:12dc:a115:b90f]) by
 SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn ([fe80::9b99:12dc:a115:b90f%3])
 with mapi id 15.20.9891.021; Wed, 27 May 2026 08:41:16 +0000
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
Date: Wed, 27 May 2026 16:41:04 +0800
Message-Id: <20260527084108.121416-1-minda.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: SH0PR01CA0014.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:5::26) To SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:25::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SHXPR01MB0863:EE_|SHXPR01MB0829:EE_
X-MS-Office365-Filtering-Correlation-Id: 690fe418-5fad-426c-7831-08debbcbb757
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|366016|376014|52116014|1800799024|38350700014|921020|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: spNVEyeO9Dx4FFfTMx5iyYJpGZa4MOB3/Lg5v39CZIGNAIT1nI+afANNyt33yIP6iQrNeSAcexREwcMMf7/gFnn5fFeISnuKKnWA2JMS+qVuoIBZdhwvjFKZXF/18eG0YyK+OrU63a/mHjmBEWHAuDxY9sZzdXYztM7bxfn/3CMijyseiNnjgx2pJB4Yd6w3vPc2KBbiaxHhHYuwVcZF6eYxaqEAer6KQ1jCVy+EvJqL1vbXpoM+4aOpW5Dwiqf6UWRqrtO+ahxBbZA5ynL59ylQFWB6cw0sy+joup8e3HOj7jpqjs/5HSQnk+VJosqVuZw29JHdeTJIGdfM6nIwfeA3t8Gy0cS5hD3P4uQsgz9iyR4yxp5M8hqK0nT20pqYr9sSrfM6gxnXRaMSkHKI4Q5rN17xZPxsq4adENt9McaFdlq9gz90C9oiAAXR4h5ZcZReEnVNSEXHlWtv4oxNvXqtikNpuJBajT3JW7ZAub2HPGaDdw+2AD862rtfhZ3kdLTWmOqoutwdkc/Dfcoy0ollJCsQqGIgAX8rNBNxB+cuQ44IRaDHXsAwVdZczSmWLy4LeQdm42dwxTnLVs22iQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn; PTR:;
 CAT:NONE;
 SFS:(13230040)(7416014)(366016)(376014)(52116014)(1800799024)(38350700014)(921020)(56012099006)(18002099003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TtgEWQxgNpU0iy8h7c1gnoqiaMvSh0JlfVxQOGKfIF7YsDJIynZVT3fT9JxU?=
 =?us-ascii?Q?lr2JrZFuZ2O/HIqTAMl9c1boN5zzhNdWv64UB/Obzi6ISp6Q0Ww9WKMGEGQb?=
 =?us-ascii?Q?6cVVjiYhy2cyjsmE//phNo7DsrSyibjRVZWyndtx3WsgJzaURhkkI3TIbH/8?=
 =?us-ascii?Q?LE9Ll9kLSDEcQGTLvUlLzvYb/iQwQrLCBpCfzg9gvmIZAQUKSqH8cyLJuPFr?=
 =?us-ascii?Q?4zOhG3VLL4rMjqH4lxGqldI6iw9EWo8Ol71riOLkcD0M3SypP0uyHidjFq/P?=
 =?us-ascii?Q?P7JRn/RVEHHrAgGnjnRMeeA23Gv+jTpztAXk2gz3Rb1MHjJ3Xgc3ksEsMdwd?=
 =?us-ascii?Q?I6r1LjyfoNAF3PuI/LkqbBr8AyXDhJm3nIkRnDIALTOM5FAvM1hi91orurS/?=
 =?us-ascii?Q?K6P8tRdnXBvAfpcBaDj7GggFzpCWlJwnvNHC4vHqM2u6HChp46Lfg4igN1MH?=
 =?us-ascii?Q?JuixV1rEoxTnnV3S9U3oaS2ijQ2j0Vp2gWWFdeE0JseQwaQ5svVfLAuQ76sU?=
 =?us-ascii?Q?35Fca3J3l8uuGjD/CJDRCYdOLE7r90VD+h/Co0WEL0EMIHajbfuuNpZvE/5Y?=
 =?us-ascii?Q?KEBAvsKG9fPeleGMtdgEB+7jmX92lJ0AnyTPoUQiNTaSm/pCis3wlel7QWhF?=
 =?us-ascii?Q?9FQ4HkqDzKX8yMev0IYixiRRaSay979ms5nY6XB/m6G/NVqhPhy6ZCNUezGX?=
 =?us-ascii?Q?sa5AS4DMCEdEqoqcM4uzQqrb84Ys6j7twfkBRi9wiEBZYpc0atNRpLtVtSOX?=
 =?us-ascii?Q?QhvCfEOIpN0w5BTWtSI0dyr95XgNf/oefqgBBdOZOdt2orFW+Hc6570TJTCu?=
 =?us-ascii?Q?IeuwFYGDYLOeigPNusimLa4G8i7EQGOy0CWc68sWmRy+AeQuBLALix+hiUMF?=
 =?us-ascii?Q?IX5ydBZBVzkA86U2iK72oOk8NqGgRkczSF4E1r471M2G11ENldsyuVKFL/Nz?=
 =?us-ascii?Q?gFITLvXBVFHqN0U9/GL7Hz/EYEBgY06ER/1oqvsHQPDv8xsBJoOqpMUQL3Pq?=
 =?us-ascii?Q?LbuZfR3KixwAT3bADOdMehluijqW3mk+dz4fYsv5ir0QRrBAjOEIGvVOXwsQ?=
 =?us-ascii?Q?7uYISWwwkBBK1/srewYVjLW0pKn56mc0DR6JQfxre10RWYyyGuj/paqkIWSn?=
 =?us-ascii?Q?CqT4KdYfG3oKUrbOicHebpO+BCXkZVo/iNcFg25BJxCAYVAJb8pvAilJwSwb?=
 =?us-ascii?Q?eA7GTaU20gec8mr6hbjzD2mBBymFe1E3uklZggV2p2DRS0P15S6JDnJrUWAF?=
 =?us-ascii?Q?rtB2Pga7+NARzxVptOzvNxrlMTR/arXhtZA53ACkevyKGrJGlYaakjGXAERN?=
 =?us-ascii?Q?llftvrBZjUxfELwVG2WNSQuISJ5yeHf06LeBtu+ip08KgnB7ar6nuEWMlhSH?=
 =?us-ascii?Q?43j4gQ2SKcDsde1BZr65gAsXVoM78nkwEvUS11rm3sBrYbNdw5xjCXO0cDoF?=
 =?us-ascii?Q?bpfQAbnliZitX0Vmf/SRwAEqDWA+FGkyLMjMZjZmq4klflnUcBZzZw8soqcJ?=
 =?us-ascii?Q?l9FN118km/oXZdCh13jsFEDyu0ecDdRCHUqo5rtyEzbJR5rfp7XZQcuZp1MA?=
 =?us-ascii?Q?gCsEmanraeDXnVn1a9nPrgyg2roGcpyHvX5tvxmezrJSFiR4pTR037jPRh9C?=
 =?us-ascii?Q?bu0tLKCi6XHNGAac9VBYC4/HbuUHbMU2/X+quOwIS/A0svcZ2ukpzM202GzY?=
 =?us-ascii?Q?V1QvjH0HD5DiobwAzRuHLNck9p0YjORCdLqFaegD9KXhuds70u0OguUXAQGx?=
 =?us-ascii?Q?MQe+JTOQKtkTM9rowUpmqID9P6YyJWU=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 690fe418-5fad-426c-7831-08debbcbb757
X-MS-Exchange-CrossTenant-AuthSource: SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 08:41:16.3010 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mj7Cq3oTckXvxJKUwFOZHqkPEfUlhQ/Ukf8JCqdnWlpDwiUlgrF/Vkf+FsRQ4r4lwzBNwtZ9Xfc/Z473uX6O1jsU5XMGexNZvgq8H2XAPmU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SHXPR01MB0829
Cc: devicetree@vger.kernel.org, Minda Chen <minda.chen@starfivetech.com>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [net-next v5 0/4] Add StarFive jhb100 soc SGMII GMAC
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
	NEURAL_HAM(-0.00)[-0.742];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 05D415E13D1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

jhb100 is a Starfive new RISC-V SoC for datacenter BMC (BaseBoard
Managent Controller). Similar with Aspeed 27x0.

The jhb100 minimal system upstream is in progress:
https://patchwork.kernel.org/project/linux-riscv/cover/20260508053632.818548-1-changhuang.liang@starfivetech.com/

jhb100 GMAC still using designware GMAC core like JH7100 and JH7110,
and contains 2 SGMII interfaces, 1 RGMII/RMII interface, 1 RMII
interface. In JH7100/JH7110 dwmac-starfive.c have supported RGMII/RMII
interface. So require to add SGMII support to dwmac-starfive.c for JHB100.

SGMII serdes PHY has been integrated in JHB100 and do not have driver
setting.

In JHB100 EVB board, SGMII connect with motorcomm YT8531s external PHY
and support RJ45 ethernet port.

The patch base net-next (base commit list below)

previous patch link:
v2: https://patchwork.kernel.org/project/netdevbpf/cover/20260417024523.107786-1-minda.chen@starfivetech.com/
v3: https://patchwork.kernel.org/project/netdevbpf/cover/20260507094115.8355-1-minda.chen@starfivetech.com/
v4: https://patchwork.kernel.org/project/netdevbpf/cover/20260519101436.111476-1-minda.chen@starfivetech.com/

changes
v5:
patch2 add review tag and squash with v4 patch3
patch3 stmmac_starfive_sgmii_set_clk_rate() not support rate return
-EINVAL and claim not support 1000basex

v4: patch1 and patch5 add review tag
patch 3 add sgmii clock dts setting more elegant and simple
patch 4 remove redundant compatible and (void *)

v3:
patch2: Add jhb100 attach to jh7110 compatibible, remove redundant commit
message. just descript the jhb100 hardware.
patch3: Add oneOf 5 clocks / 6 clocks to claim the clocks and make it
pass yaml test.
patch4: Add review tag and unused tag to phy interface.

v2:
1. patch1 Add the remove reason
2. patch2 rename rx clock to sgmii_rx
3. patch4 confirm sgmii rx clock exist, or will probe error
   sgmii will not call starfive_dwmac_set_mode() 


Minda Chen (4):
  dt-bindings: net: starfive,jh7110-dwmac: Remove jh8100
  dt-bindings: net: starfive,jh7110-dwmac: Add jhb100 support
  net: stmmac: starfive: Add jhb100 SGMII interface
  net: stmmac: starfive: Add STMMAC_FLAG_SPH_DISABLE flag

 .../bindings/net/starfive,jh7110-dwmac.yaml   | 31 ++++++----
 .../ethernet/stmicro/stmmac/dwmac-starfive.c  | 59 ++++++++++++++-----
 2 files changed, 65 insertions(+), 25 deletions(-)


base-commit: aa064a614efcfa4c300609d1f01134e99a12ad10
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
