Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iCxuKE5e/Gm7OwAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 07 May 2026 11:41:34 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8490D4E624C
	for <lists+linux-stm32@lfdr.de>; Thu, 07 May 2026 11:41:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 46973C8F290;
	Thu,  7 May 2026 09:41:34 +0000 (UTC)
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn
 (mail-bjschn02on2093.outbound.protection.partner.outlook.cn [139.219.17.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5715BC8F283
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 May 2026 09:41:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RQPZvRKRoK3ZdRubD9eiwWcBS26Vw6kxFP1YIab5nmVo2ZklTrrX7YO1g/B53L1f7pUMuVQUHYrTVC1tYVLflFqScbJxO2W+rCONnIgXJ9tMhkGjuFBo3eqVzwBA1/bMIrP8NzT0C2pFMjRHIqfg/NBdR2Iz6CSgOwex0UbHXS2QnECtMC+4A5CJ7DVqCntBKUNegsTb2pEFe3esHykDLQIaGgvZSGwuO1LioE+Yo+CWgnX9RTOxEBDa4oY1jGVmFt9FPOMvQZAKenfvzyHVHk/v/ezO/R12PMmuh17aWKGT01WE7u6wZIFKWT3jAH0TXxtyBQb+bB+5a6l6QKvaTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XNRxJ9ND+8NrtjQFwg8Qo/jph/f8sCAees6AhSTwoS4=;
 b=UjlxBRBDsA3QFTTlCj2WQV+c3u+o30rH6BGpJpcJpZdJ1RdhyPLbwWPMP0mfevp40gB+E+GJ3YV186km6dtpM6Y/5RgYMnrWD32WvFYgEeHLH+VwPwRieHbzdwExzGGTl98K/DpqtJNMcg9ghXo7aHnmn6g+LPlQPjJeAROW4b8vPyCdCSvsXadKNiHF9jzFujQluq9TUJZvifEVuammfrXD9c5Kfy0/wbGBpu0pI8TDk9P8+xR1Skql17VKdbhvvdJ4CKyVz8LAinHdnRbTkLIy6mROFFlAO2wHgS4ZveOF75cpJAJ9d8Q2jnpDMSNXfXfY0ug/y/q1OuC5e/h6xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:18::12) by BJXPR01MB0870.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:14::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.17; Thu, 7 May
 2026 09:41:24 +0000
Received: from BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn
 ([fe80::e2de:92aa:4c1c:a829]) by
 BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn ([fe80::e2de:92aa:4c1c:a829%6])
 with mapi id 15.20.9846.025; Thu, 7 May 2026 09:41:24 +0000
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
Date: Thu,  7 May 2026 17:41:10 +0800
Message-Id: <20260507094115.8355-1-minda.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: SHXPR01CA0013.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:1b::22) To BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:18::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BJXPR01MB0855:EE_|BJXPR01MB0870:EE_
X-MS-Office365-Filtering-Correlation-Id: fd8851d6-7052-477c-9cc9-08deac1ccd91
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|52116014|921020|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: iNdPKEr4FHG9j8+c9BddGy5IAB59LtjvuBuAfQWVab8opLQSWtE1CV8ASM9qtb+uo/hNxiXLsNFrA2gxFH0JZ99iA0hrT7GSboypkA3DqM4X2HSIhWx0A9vxJL+D0CBHlDXGSVf6Q3m3IPV5Rg+ntEYPUTK0WthANI23aqZOYA5WTyJlUQ2pmuBpkrc0Vd28EDVJluF5+BN3qD5DHGPweWhcXYaXq3zDto0GvsCS9b5CzikDtiOoYaQMGVnDA/VNa/AtEEBrdUYhnOzAvSM9FFCZAGBx6zw5JVtlOD+op4WTSQSwS/PKt9BDUDyBk3owwQy36nMy+RKv6W0Kw20j3viexakGEEshVCw74eiOev2xSnsm6vDnmtTu44w41ig2qJGlG52+UvNJmRU2VPt5Q6Wu/3mZUYNMceybURSDPqgz0UbWn3NVWDA9YN+byzv1mJszBmSZtaUbCWQX8bCF2B1JcaZyDpo0SeBt22Gi2GqhYl7Kq/xyvNr+N+mCZemsqJpN0f2FRgybM7WMPw7BL1KdgYdIGaZ+mKnSaw4ZO3B/3MTho5ilv09fqS6Yzi/dHnjDXa84BOAWQPBfgyLvHw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn; PTR:;
 CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(921020)(38350700014)(56012099003)(18002099003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dTgiKbQtoIG4D6SNATsXuRjkY+QeztWojhbTulxc2EJexii8Iyt/qBRLCd6L?=
 =?us-ascii?Q?2Fsc0UW6cLvlPUUIjwOvdzh481Ymsv75ObOPLtk513QEy4q5xRs8WXpiSmre?=
 =?us-ascii?Q?F1mwVG+DZ2wcu0KTfhfKi9slQsET8wSWSm3xMGWMVtqGS9sxn63hgLhhghVN?=
 =?us-ascii?Q?HAMlFpyzKMpxLP5RAh6XMQzG8f0FJTcAK89a9w6kUkYmRQOe0K7FLXVJk3oA?=
 =?us-ascii?Q?wTFcj3V0HKkxw99rR+L6w+mPNbnBNaSb8SXyvi35N9Ark8opX+x4/sLZXncl?=
 =?us-ascii?Q?07YfQHXmWYqocy0ZMag9WtLuotsOm3bDjYdF5gADwLLUppHeX33goEWsnfAy?=
 =?us-ascii?Q?/99mmJa9SXXRVA/GfARADWFb3JZ8lt3XGs+aNLpPF52KsQPjXv4Iszyz1K2P?=
 =?us-ascii?Q?KoWI/OJG932SiWihk/kQql0Z9s/rGpwHnxfdcAuD1GNusw5MIaxShYOBvBdN?=
 =?us-ascii?Q?I15ErYxk1Z0QDjO/R0JGMLbCFume5ZFA/EFKBZfDWuIt2DS/lt6tFvV4YoKt?=
 =?us-ascii?Q?9kZ/xnoYwS0tyPwN/k86bqq38XhWEuAvhT64wg4b1vyuOYXTPodXk73Z3D9n?=
 =?us-ascii?Q?dqeESRVcS/4Q1IsYnwWUt32rzfJyfjyYgQ7q30sKabfI3yv5JRLk2z+6ej19?=
 =?us-ascii?Q?TZsf5VuMAAo4h+r1QRN3ODsaG1DX71BmSKsxUIh+a9VgDch7IBhDUvSp1EB3?=
 =?us-ascii?Q?rCF4s77I2rzCq/TFPZRQSDA8ct2HnoLLgK+A9NdnSirBECxYA6tOl538Lkxp?=
 =?us-ascii?Q?XfEjg/QhiFfSEt7poiRBeoKtrIBgMepC20dbpoARJlnXgXk38ZN+OmqDjutG?=
 =?us-ascii?Q?uUZ2kCsUbj+NuYJHkm7SlqIBb+pkpXB33JL+GIHkobtocGKalcQZmAuC6WFs?=
 =?us-ascii?Q?D8UKFEWl6QCKoNNqhaZeTfMy36XhPQXFou9H6neD+qbsNJ3BTj2DjceRA2MT?=
 =?us-ascii?Q?RtC6C6oYjWvvAqkd4Ys7Xv18UWxUoI05SIe3jbmlGvI2a4N+qefsHFELDlLi?=
 =?us-ascii?Q?TLchIuzwfHcgfsmiO1yTkmqRMdr0rePLFBHSwFJ26/ompUKibRUP+p6oJvEJ?=
 =?us-ascii?Q?d1kg+W7uiCO3Nfocr2mHONAhGhbR0ChYhuxYQE4JP0TPtGWxRSu3evf8EqEp?=
 =?us-ascii?Q?uktN9mpV5FRdmNRTIutL0SGODmaNPhfq8RoyAGYDI49pq9tPlOeHoXg+94TL?=
 =?us-ascii?Q?uwUp9kXvzuL20+2Ko1e+1rZ/+aPJzu84Vdp9AJztBeBnrbBuk9e2PKdsBQrM?=
 =?us-ascii?Q?pcDrFkoxuFZVLndzmrx5lfF88PcV2wNoXYE3BoY8zt9eN0RRxHktFWbLLU1o?=
 =?us-ascii?Q?6nYxdk0ZSCIJgKZ1erOW+Kcu6iMp0VjqaVKtHOBvDpK0czxTEblG9AF4fPvX?=
 =?us-ascii?Q?/8GALvWIDGgmURgoGVqTwZkKEi87IImLpDOsrIRWQJlJhxg5ISs6Cfvf5cNP?=
 =?us-ascii?Q?Cc3kh6RgqWq88l3Mk85S1XuBnZLjVCF9Aq9PrXPaN0nR1GlSmh9AULcWgPQu?=
 =?us-ascii?Q?1Svm/PwZp12FRgHXWbfQRS/u8bZ7QxP1bx4PVnwZrKV5pMuKVZ0wrOj6aYqu?=
 =?us-ascii?Q?GWzmISTlmrFWm07g7MFbH77ezr+q7SOx9t5QqFHCHSDydbKcMFwGiu+/fsuU?=
 =?us-ascii?Q?Kt7jeGOsq3YG6RaLCDVlfHi+egYgRtvGvqEBt6Hf7e0SehZNjz7grE5OfKJD?=
 =?us-ascii?Q?c26JcaXpH8OMKHsRmx+78UlV5p71Uz7sTwOL5tDtyVB44EmUkFOznPBOglj5?=
 =?us-ascii?Q?AkNS6RKKvuoo/bqUjMMjTeDoZ0e5iA8=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd8851d6-7052-477c-9cc9-08deac1ccd91
X-MS-Exchange-CrossTenant-AuthSource: BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 09:41:24.3758 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IZPzGByx7KePp/A1rRdTQTkk/1l42dUlh5MS21tk1DnSM/jY55NidFIkPobsS0qUKQ3W+Tjaq4ma9v/2O2CRCX7VNeYWD90Wy/Gx1i5oYvE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BJXPR01MB0870
Cc: devicetree@vger.kernel.org, Minda Chen <minda.chen@starfivetech.com>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [net-next v3 0/5] Add StarFive jhb100 soc SGMII GMAC
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
X-Rspamd-Queue-Id: 8490D4E624C
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
	NEURAL_HAM(-0.00)[-0.446];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[starfivetech.com:mid]
X-Rspamd-Action: no action

jhb100 is a Starfive new RISC-V SoC for datacenter BMC (BaseBoard
Managent Controller). Similar with Aspeed 27x0.

The jhb100 minimal system upstream is in progress:
https://patchwork.kernel.org/project/linux-riscv/cover/20260403054945.467700-1-changhuang.liang@starfivetech.com/

jhb100 GMAC still using designware GMAC core like JH7100 and JH7110,
and contains 2 SGMII interfaces, 1 RGMII/RMII interface, 1 RMII
interface. In JH7100/JH7110 dwmac-starfive.c have supported RGMII/RMII
interface. So require to add SGMII support to dwmac-starfive.c for JHB100.

SGMII serdes PHY has been integrated in JHB100 and do not have driver
setting.

In JHB100 EVB board, SGMII connect with motorcomm YT8531s external PHY
and support RJ45 ethernet port.

The patch base in 7.1-rc2

previous patch link:
v2: https://patchwork.kernel.org/project/netdevbpf/cover/20260417024523.107786-1-minda.chen@starfivetech.com/

changes
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

 .../bindings/net/starfive,jh7110-dwmac.yaml   | 67 ++++++++++++++-----
 .../ethernet/stmicro/stmmac/dwmac-starfive.c  | 59 ++++++++++++----
 2 files changed, 96 insertions(+), 30 deletions(-)


base-commit: 74fe02ce122a6103f207d29fafc8b3a53de6abaf
-- 
2.17.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
