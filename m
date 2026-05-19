Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SLT3EB04DGq2aAUAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 19 May 2026 12:14:53 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2A057C00A
	for <lists+linux-stm32@lfdr.de>; Tue, 19 May 2026 12:14:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C2078C8F295;
	Tue, 19 May 2026 10:14:51 +0000 (UTC)
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn
 (mail-bjschn02on2118.outbound.protection.partner.outlook.cn [139.219.17.118])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BC921C349C4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 May 2026 10:14:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EaCBwvG+qjMrEqSZK5rc90D2klYqbvK1J2rFP5vFU9ejQB1RTMJINkvvKwTlZqCuXQ4UY0OgWkBP3ZYFrpO7sx3sNCD0R5CqY19c43OtAL6MqDNnvwM33oBsnBWBqs2AAhSoUipyj6JFskqlcfeFb/+msU3L/POuf/pJjeisGcO1LOAvpETqppn9kRGTxXyVNhFfXhJRCDn4cfsNL8Jg9cYZz63niC/kyK+3FlFRios1y3PowwdAzu7kamT5PmJPG/0I71eFbF5ZDMdz8t7w2WPszplqZPate2KXFCl0qGopu7Fryifp4G+WZacr2CZvUKpuzP33YACG8uVfb38IGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hsCfx2zhMAYoryjAATowvXJhgPBLHdWMfe98M6ClXjQ=;
 b=c1NFvIv7MQHv9zrPFgMrBQ3uyKsLA07N56YYe6YUQAD53KnHhn9dUbeMv/f9MlMQK1Nq7/MP5b2RBKf5o0L+ZjMGdDlRbREVWb5GiwTsmiqkDQATI/I3/kR+PDammzuqg8Msy7vHkrFFhUErkuGs1+OM52+6Nw4vK1JUBHPLgyFRMN9VlHL/JIfUrWm7rDbpqeaLwp+9ht9ApP5KRdxFACqIvmJoURf4h+VrSXvP+o/jtQAPaxVbYEsur+Bp/lj1Hr4TwWCMi7pqJ/7SLvBJ37HFtzM3Zscbq1hje5fzDWSQc1ilDKoI+S9Km4xDbG/t5od0JLkuvEYjb8sYruYetg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:25::15) by SHXPR01MB0493.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:1e::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.24; Tue, 19 May
 2026 10:14:45 +0000
Received: from SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 ([fe80::9b99:12dc:a115:b90f]) by
 SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn ([fe80::9b99:12dc:a115:b90f%3])
 with mapi id 15.20.9891.021; Tue, 19 May 2026 10:14:45 +0000
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
Date: Tue, 19 May 2026 18:14:31 +0800
Message-Id: <20260519101436.111476-1-minda.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: BJXPR01CA0056.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:12::23) To SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:25::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SHXPR01MB0863:EE_|SHXPR01MB0493:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ade10d7-f847-47ae-c788-08deb58f737a
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|52116014|376014|7416014|1800799024|18002099003|56012099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info: t3NhCwLozv9HmMYgU42uvnPRt7CkpKzN/Gb/00sWs5jY5H5D5Rl6DzSadUTE7d0urYB6JnvTcP2Gg4lBZ9511cmLODfuFaagWj8oux+vk7cNLQOqg08c4BEfyEbCl8Mxn7z9I2hSQe/dn34002IBhCaejBzrbwADGjvayb4l2zymCZ2QLQlBjj8O5YxVr6vaKGfNuOQksH4TRhunDmQ1Rjm9IJJWNG9QgGDgWpj+3ppbIzLSVYoVtcYh72dKA1K9W0tZ+UkdBRxtaKF6aFCjXkusyWFT4d7v7TSjPOr7LyYVYkeCBuw7AA5no8sNQ3AnpabYLQUJCdGwrMQ3D7t0mQDlK7RadRyg6dKr+eqU+HPD5wlXVNgCqAWiyaZ0dbfQgI3AnUMi8WO0jtlCm1nVOsqM+RIKRX07hgHheiN9L4nxuca+IGbJ4/HZqU6VDKltJIoX2JsNg4xIjL8sJlP+3O8zaojMek6qXsk64w5w7Xk5tme9WnGKMuJAnF4MI9qgZ6Uxtvc2VsEtLJOJK1OuiXxNLA07ies190uDPSBQ461mmME+xtw/2zex4mYNWazdkoye65ia38Tem4bnZLcLiA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn; PTR:;
 CAT:NONE;
 SFS:(13230040)(366016)(52116014)(376014)(7416014)(1800799024)(18002099003)(56012099003)(38350700014)(921020);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wXLmKfo6pnxWcDpX+jF6bvTqiAGNqEcOgpB/DffDyif72N7s409Ptn3JYtP+?=
 =?us-ascii?Q?G918ifvEnbmX7PH4tKYZ0gdZw448jpQV/MkGF8Nq6spzrG3anvTg2RwdmxRD?=
 =?us-ascii?Q?lt+Lw4nJoiFn5HlXjhiO8vNnSbMsIpoojGR88STTMz/UsKUt5U+cKPmyCFKd?=
 =?us-ascii?Q?nOAQTtUmU3veCSFjsB0tuOZHOArcUu1m1Q37h2ziaVFIjscIEokm7w+COVxK?=
 =?us-ascii?Q?Sd7ZQU3EAHjbiOKSHOU4UTQP8CuHL8pNIsza8dt+VNi32T6n9Kd8wqNW6sN7?=
 =?us-ascii?Q?sj2l+4Aximuy7BzE8596ZLvUFNwwEWWhS9s9HnEYIXbXwAdKpCs0WgLfyi9S?=
 =?us-ascii?Q?1jXF9KjES2H/5D+kYzA78r+qcnib47Bif2DiFQeC2KXzdnVbscSOd61FBCqW?=
 =?us-ascii?Q?/vHPJVlu280PFWe9r14+4tb/QVv9W58MK37k6h2YB3v2pq/NVWkp51pq0g8B?=
 =?us-ascii?Q?cyJjIPzKexg8s1G6YuCx0mhV0UrBKIVX/hsOHvGg5Tq7mmUTarzpt6nXtRdU?=
 =?us-ascii?Q?KrijAYP9unHoBrUmsg0yShjD1zI1C5ZpKqTSjboS+u6S7xiujtEUgfjWQpF7?=
 =?us-ascii?Q?lSPACwC9c3e2DttNNUOCDj0QgU8s13F9YSsmiOcSmYQcTDphufvsIGc1pxUI?=
 =?us-ascii?Q?+vBCSYfUrZUtw/GSKg1JARaWUhoLnPopXrvD5xUoBocye4OAX6iTQ+s8MoXk?=
 =?us-ascii?Q?LLTh0cqYD25NyYU9e8581F5pYkcYXIp+otFT6Gmyq8EpUP+Gozbutyy4qMg/?=
 =?us-ascii?Q?ve1ygdQzXl61q4hr3dF/cfESNUjwXQCeVH93mX4Qozp2onLnF9dqn0Lby7gg?=
 =?us-ascii?Q?e89jnpevJffMAhXxZGoHzGbpBuH2HwJNGdU4qwe2J0bSwlG2k733Dg6i0J8l?=
 =?us-ascii?Q?B/Y1/HmlILSAPpp9mHSPwXYbr6tJQrj8IagRcQ+Mf8JuhxKpWcgQi3uDNHSp?=
 =?us-ascii?Q?aAt1H2yV1IkJQI21GoIxq16MJ7YEW96VZAp6Nop/JGH6M8KEi30h3xJ8soz0?=
 =?us-ascii?Q?7JrCP7gISPTynTF2Z+cxoHpC+qW/J9mnTJOiOwkbP8rmkcGFkx+OfKUeS18J?=
 =?us-ascii?Q?nX6CzeUuYV6FwG4IoVszUVRTpQZibplb+X5lrarbaFs0AFE/2gLvhx5wl4TE?=
 =?us-ascii?Q?K48TKWQjdnPaX8vMamppbHh3paUoKZOmU/T5elKmimapXOlIvP5ZR85rH+JR?=
 =?us-ascii?Q?QR0Xoap/kO/3GN0/zfNdSlhWCbUksC1w6byevFj3frLq2cxQz+oCekNkvQca?=
 =?us-ascii?Q?C8CqktRKpDZjVQOUuVKDoYkQBrex9LFcRuLjkfwlmRpG9mBaOkCTsRMKhERm?=
 =?us-ascii?Q?M301mqXKHfgC6xFzi+TEC3hg/9LznMLPH62buHa4wDf284TxDdk/aZNQz1Wk?=
 =?us-ascii?Q?0rb/fvGAn9hNog36jvbf85VuHeZ5F7TRPM/vv/5qzunPYanLj45jioVncGI1?=
 =?us-ascii?Q?3u6+kzBsiDPmDGP3RgfjVmuHMryyrHOcpXEZDECp5YGBMyOCLV3AFh73lEOe?=
 =?us-ascii?Q?5Z2AddxaJ/pkc/V/B37Yq+Ajax62ZGhJ2oliJfzJfCgsbROqQYP5ABAetZ3z?=
 =?us-ascii?Q?Ag5poFuUCOt9HLwlJAtPgkfk3cfTgm5ZrVzc17K2JUjmUWFRLfu4x12FGqhg?=
 =?us-ascii?Q?fY0EpHjY5OQnkWptr7a++mUK+GrqEW3r8wjJsTc4c2jfO8cm4+/PeKtqt+hb?=
 =?us-ascii?Q?7lR6NYBk3fQfg4kJjVR128iuOEIVblcvS/+zARObcQwfw23zH81yMpHotH2w?=
 =?us-ascii?Q?FAr0DUG2uM69MGt3IKuXGq39hT0qjkY=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ade10d7-f847-47ae-c788-08deb58f737a
X-MS-Exchange-CrossTenant-AuthSource: SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 10:14:45.7204 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +/xNFDK8n/HeZvJKDqGhsflhh/x+ZYavA2J5aFBWb11uCKFbP1vG64S+OZ8iuyWTz5rDeQWRioedsVb/UcHNgkMfP9rwfaqP3NR/KJichcs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SHXPR01MB0493
Cc: devicetree@vger.kernel.org, Minda Chen <minda.chen@starfivetech.com>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [net-next v4 0/5] Add StarFive jhb100 soc SGMII GMAC
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
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[foss.st.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,canonical.com,vger.kernel.org];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:alexandre.torgue@foss.st.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:mcoquelin.stm32@gmail.com,m:emil.renner.berthing@canonical.com,m:robh+dt@kernel.org,m:krzk+dt@kernel.org,m:conor@kernel.org,m:netdev@vger.kernel.org,m:devicetree@vger.kernel.org,m:minda.chen@starfivetech.com,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:robh@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[minda.chen@starfivetech.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[minda.chen@starfivetech.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 9E2A057C00A
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

changes
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

Minda Chen (5):
  dt-bindings: net: starfive,jh7110-dwmac: Remove jh8100
  dt-bindings: net: starfive,jh7110-dwmac: Add jhb100 support
  dt-bindings: net: starfive,jh7110-dwmac: Add jhb100 sgmii rx clk
  net: stmmac: starfive: Add jhb100 SGMII interface
  net: stmmac: starfive: Add STMMAC_FLAG_SPH_DISABLE flag

 .../bindings/net/starfive,jh7110-dwmac.yaml   | 31 ++++++----
 .../ethernet/stmicro/stmmac/dwmac-starfive.c  | 58 ++++++++++++++-----
 2 files changed, 64 insertions(+), 25 deletions(-)


base-commit: 7af2a94f4dcf53a45f3be5870ebeb195402866d1
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
