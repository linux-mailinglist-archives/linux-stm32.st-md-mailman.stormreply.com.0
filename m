Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E86996928
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Oct 2024 13:47:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 55D15C7128F;
	Wed,  9 Oct 2024 11:47:17 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010004.outbound.protection.outlook.com [52.101.69.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 491E6CFAC50
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Oct 2024 11:47:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vfZpKTRw8mPwoqsOMVEBszgcT9wcAd4HCAhMCZN/mH9hQM3Fr0QM0QfXEoGxjFStrdAM5cXxGj0Ga1733D0hJqakBaFKZKyTqae+x0AbaSq+1K7uO/Bm1tRaiYeOh7HyOMQdPEnWUoC5Eu0WT/sTGiINwSpcS8paXu4Z86niKlEgGpjXUFTzQ0iImtZ+REIJ5jrMelkWe8VqknAAtu9ZsnOJVMIjZWhiOvQXauEypKKz0djfsXmHoDaMkMunqrQullsUH1WTCD0Gt/xzOMu/m7rhaLPR6ajdhNDHuSX5iGAxdWJCaE+6efmpcSDopU33dkxDBhTpN/jXj/Qcj90Oqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=koygImqvx/+weJAj/khOz7IiA7QhBlFJd2bxTtx9veY=;
 b=Fh+hXOVJ0y7oGR7+7xvTbx3lYfRAsE6Q1yLAcZXFyYILFqud4g2uGTLs1jzbtGTSWIPYSwwUl4FYjP1u6CFOkeNVOnhwqOcez1bLNttS2J/RWoEJnrCxR3pd0lrbnAsRQioeTPg2sMdVopliSYwrKjdHBjIzotMFHp1zUwQ737YzqOxgnnx/JFqz2Yj9jB4LABbjsx0CO3fmV1pqM/OW8yaedBKIhOwZ0gP7W2sR6ciTSCYLrDsmdiqse0L/+nVxz/gAyWGMSSQv4NgDlpKdxxSfx3yLMmcypdhS+KcqYVba1OULWCZtudW1bOIPNcg0f6+S1leNiNBFKYY32aPONA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=koygImqvx/+weJAj/khOz7IiA7QhBlFJd2bxTtx9veY=;
 b=kRqE/YsHZ8Y6oyHFayyOP+5VKLffdHhog7X6JJ4LxiOylX1mjP4mj0nEse7SLF7TnJ7eW/PNBOGyMjfs0/dKcQPd3daORSBhSionCPWpzRTCNzzABF8WqhxU0K8KQ7mq4r3ape69r/Xzo1nIike1HPYfH2nMYAapRPWBZznY71IGCiaDlJw+U04EuED+7xcOgGT2+CtVwKB6Z2coKUg5Gt4SZrosAQOpqTfcC9TZazwgclZSEVOK/QxaEMJ50Zl2s/1RR3KMA2fbjgGCK/iNDm6nfHNgnMvusM+4IOAXFyRsL35ehe404K7Tv3dITe7NpLwXJPuN35Hg2gRfufrLVg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com (2603:10a6:20b:24b::14)
 by DB9PR04MB8378.eurprd04.prod.outlook.com (2603:10a6:10:25f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Wed, 9 Oct
 2024 11:47:06 +0000
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2]) by AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2%3]) with mapi id 15.20.8048.013; Wed, 9 Oct 2024
 11:47:06 +0000
Date: Wed, 9 Oct 2024 14:47:03 +0300
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <20241009114703.3pi6txfqnn2rxgbt@skbuf>
Content-Disposition: inline
In-Reply-To: <Zv_BTd8UF7XbJF_e@shell.armlinux.org.uk>
X-ClientProxiedBy: VE1PR08CA0005.eurprd08.prod.outlook.com
 (2603:10a6:803:104::18) To AM8PR04MB7779.eurprd04.prod.outlook.com
 (2603:10a6:20b:24b::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7779:EE_|DB9PR04MB8378:EE_
X-MS-Office365-Filtering-Correlation-Id: bf77e3fa-ed88-4b96-aaaf-08dce8581968
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kbXaBuN7nuuCmGBC3oSk9Uk31R/a+xfwy8Rcb5wIzSGflodD3LddsXdGPnCh?=
 =?us-ascii?Q?q3Q7jrjqHYaFcKucOwMrQeowiGRWjMnKl1IFPWuVC8HWeYG96FS4azeXvAkI?=
 =?us-ascii?Q?C6cvcFmvwavv1nLigGuadDhfr1jgn96rZ4a7GvYX1ZUop3G7IwUm5STrLHNP?=
 =?us-ascii?Q?gfz9UFPKkwniY3AlTQ+Jk41cmPeexzT+F29a6l7N8wgwPcNo5afZZSklIMYM?=
 =?us-ascii?Q?AlC+GEoK2X1/zl/JNjuJ3EWnfMMx6F2Z3xh76vkdMQ9JGeX6R0gDqkk1Ygdb?=
 =?us-ascii?Q?JFhDEXx4O6njk2Gy/m1GQmuTGwbEFzPW+B8sEFCpSCOjOKB+om7Mk1pn8I6E?=
 =?us-ascii?Q?ZAnsCKjyUwt5f3vhyY2tOM9BSmk+zEOWdHEGyolLDURQ1kpSsnXxFkoUMjNm?=
 =?us-ascii?Q?ANpe/ENmdppt+OBiNo/NG4npZ1F/AAk69CaAZpL3Ha6mN7VXZcuOwgaziwHe?=
 =?us-ascii?Q?F187tdQ5icL2VdUXOR5GXqz2v2oodfaPVtImyflzVitwhWsuMzBD4lX+ZlJH?=
 =?us-ascii?Q?IVcLzIC3/nfqIN77K5TuZa9jJ5FEQ9dtbECIIflsB83pl0okg2fVQ520k4Qq?=
 =?us-ascii?Q?8iQPWj79Z3/bnKlDM3ZGMt3Yw03tN7X6hWmdYP1kB8qsJc95XtZA1CfEl9WY?=
 =?us-ascii?Q?n5disjyD8RrgGUj8NoqfV8aa27EzkVe5sApYOsm3Ab46agVhlfu/7/bvmDs5?=
 =?us-ascii?Q?JT6px7pqHosHEQ/mKsWnlQM3pY1R59ogYNri+blvUmqJ0nrmx/nGaaUmlaQ9?=
 =?us-ascii?Q?rKUUO61CDPqQAi9n04fctSoCDNpS4M3kRLpB/ttVN9eE6O7SmmWn1ahfBblT?=
 =?us-ascii?Q?ewc8IT4aSdeuoTHLC2eJwi/cryJeUFOuCH1WuwKk4RjZXC3mP1KAcWVq3rNW?=
 =?us-ascii?Q?14umiy8ZitKIXRqrSCWLqxNv3SdazQ0qCgQuVuZIUui5vHZ31v4Frw5TK7rV?=
 =?us-ascii?Q?W/C3CaOAYrSsFhOrQrgu40Ja5CFj60NLBWnMX1sqfAcmoYQqhsSe2GDXe4TL?=
 =?us-ascii?Q?4HRmOJQEdluySgp9AxXtZnudPP7VdSyv7T3MjVMa5d/d2LYEYZcApG/5Ggld?=
 =?us-ascii?Q?N39P5enFAoxpAqttYnNQ9NGv0RjawefQOqN7Grq6Gg5fyOvzoIwYvpeEOHmz?=
 =?us-ascii?Q?fMDTwMZPd06wQf0hkSPtVe7RoR7q8Y5gvuvqBfIs766+JzPsnhvguMh2c71P?=
 =?us-ascii?Q?SO8JIGHZB7ROwjX08C8zM1CTEdx4OxkB/BsQ6mUMMxwrjr0G14XSp8FRwAE?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM8PR04MB7779.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZgR2ErAnKEJKjWFMEis7/kXBKYUC9u+5piHa83YmWDspOs8tdrsVbg1gkteT?=
 =?us-ascii?Q?WdOVFIuaFyuM1dldU+c2MrW27RNmPanrTN4bYercOuudKjmZHxC4RE6QATYR?=
 =?us-ascii?Q?ZBPnpg2INsQnk/wkdDOy0PbQcKn6Z2C5CTkAh3UOYTKzIlUfOa3F0YcGQgLy?=
 =?us-ascii?Q?hFVTxJIJK/bnZlnrwzCwgER+K35Ur6f5RTSgGk0lH4gqMcOX01MfbkTnSfZq?=
 =?us-ascii?Q?jEUjnTU9R94l6tBYZm4sOZKIUS9N6WYlavOdoioHVEKetWl1Qa5yuMXla7n0?=
 =?us-ascii?Q?eGu7VMv/Sr1m5lCcv7U+2BEWQwbYHtu1TlnGHFIT1TVoTHNtTxlr7Hr+FsgJ?=
 =?us-ascii?Q?UH1T6DVEcskgEdx0UwuBHRhZiJKF0tuLkA4SFBGFCEXz5mbjGJy5Gr2mus+H?=
 =?us-ascii?Q?4Lr7fJe8sfVDM6Bly2vvEcQNCrexVmFtu417C9mrGOkw8ggxYc4sve5EgY+g?=
 =?us-ascii?Q?5wu4CRQgzhvpV2k1Va8bNuwEHlWn+xL0Ro1aQTfTNzNCfAG3kCDk5NWC2Rp+?=
 =?us-ascii?Q?RcZcRqx26HRZUpuMvD0JivrEDbmpmHCz8LoQzyYNWFBksIvyf9/Lv4pQYOoF?=
 =?us-ascii?Q?FkWLRqQqfHCFDPMs7SeZ10b/bAXF0JTfBSkGILA29AQc/E33G9vMLb3GYCIo?=
 =?us-ascii?Q?ASK2P6FgJ25Mc6gRwYhHRYajvxzii4yk/XPZJrVqmEgKp6zaKAkktP1G/9yH?=
 =?us-ascii?Q?t9Rn2SQT7M0H8PvfDgvxYNlJauzqriBkD8WWGKgXf/4s0IHvo3fAUL3j+apU?=
 =?us-ascii?Q?E+tQcg0T7dTjigBfvJAeF9xPcZN7r5kMCUR38DfEOvLovdc97S06Zy9bhTDh?=
 =?us-ascii?Q?3nMKvUnXhUXOsiqxebjzxlabEkRndRuyiK8suGH8j/ky2f5qwBFOBXeTskVW?=
 =?us-ascii?Q?7Hp9D60yhwPvEwlMP22M3mEj0vD3iKiSCQmf51oj2mdqDjMrZWSFqizhINmN?=
 =?us-ascii?Q?xA8amNzpJnl0/yohjR9Eh0EK/VyMDbjQycKIgeiRsQneu66x8B3cF2Zzy9O3?=
 =?us-ascii?Q?mhzlOrC+wLet210vohFCev1hZq/9wb1zqKSh+BN8wtjaUctHVAwZqskLq+8Y?=
 =?us-ascii?Q?NMUMAMzYmgrZkfQhP98g0+nRyJ1X+inhrZ81o/DNgo/9eyp4IPhek8hNsWwD?=
 =?us-ascii?Q?BqHJic+Mb8ULK3HYWvSqg2rYoMHzRSg/4WzVxHCf0cTmQvaMfPcqNRX3PE2l?=
 =?us-ascii?Q?YSpuZrBfXjvCCaDlJTX0DfNFo/hvWZEwGkAaISDLjoT0+u1rTOoOBEDKIKb/?=
 =?us-ascii?Q?Ov8JAb//hmIbRtCKPzO+JgIQ6uIcQaLLUYjHJzuq0JHnJRaq7VfSaTnO04R/?=
 =?us-ascii?Q?8xOJibLx0vI04CwiVpTP3yu61vuXpR3zI5BrWufhj9NtPFFOkQ9fD10Nc1t7?=
 =?us-ascii?Q?4klyWtw9Xo/IZRjAEm7qgJK/ccljaBiWtJ5uVNY9oxk3/qLsDoTeYU2D+cLC?=
 =?us-ascii?Q?/m+kZd4Kwnn+rQjW47O54ZcCFt8dtXimUCnySGGVbjCWhGT9D/DXxTJxDof/?=
 =?us-ascii?Q?Y9Ir3U+V5lCiGFZH8t1UzVoOOfm0WtXGCCebBxilIe59CZBlV7kMThTQ827S?=
 =?us-ascii?Q?5Z3R7sKSMa6Si5oxP85IpbY47XBwYHOKmRi/7KFXoAUcCf2BZM/xv4IhKReX?=
 =?us-ascii?Q?Tw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf77e3fa-ed88-4b96-aaaf-08dce8581968
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7779.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2024 11:47:06.4294 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pw8DRm6IxYiQ74KpLuBHQIRrORqqirbHus1smQ/johFWgnDKnJ2geZKec22GcTvke8EPgYYthnM0Y7rJNUHfaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8378
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 netdev@vger.kernel.org, Jose Abreu <joabreu@synopsys.com>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jiawen Wu <jiawenwu@trustnetic.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Mengyuan Lou <mengyuanlou@net-swift.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 00/13] net: pcs: xpcs: cleanups
	batch 2
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

On Fri, Oct 04, 2024 at 11:19:57AM +0100, Russell King (Oracle) wrote:
> This is the second cleanup series for XPCS.
> 
> Patch 1 removes the enum indexing the dw_xpcs_compat array. The index is
> never used except to place entries in the array and to size the array.
> 
> Patch 2 removes the interface arrays - each of which only contain one
> interface.
> 
> Patch 3 makes xpcs_find_compat() take the xpcs structure rather than the
> ID - the previous series removed the reason for xpcs_find_compat needing
> to take the ID.
> 
> Patch 4 provides a helper to convert xpcs structure to a regular
> phylink_pcs structure, which leads to patch 5.
> 
> Patch 5 moves the definition of struct dw_xpcs to the private xpcs
> header - with patch 4 in place, nothing outside of the xpcs driver
> accesses the contents of the dw_xpcs structure.
> 
> Patch 6 renames xpcs_get_id() to xpcs_read_id() since it's reading the
> ID, rather than doing anything further with it. (Prior versions of this
> series renamed it to xpcs_read_phys_id() since that more accurately
> described that it was reading the physical ID registers.)
> 
> Patch 7 moves the searching of the ID list out of line as this is a
> separate functional block.
> 
> Patch 8 converts xpcs to use the bitmap macros, which eliminates the
> need for _SHIFT definitions.
> 
> Patch 9 adds and uses _modify() accessors as there are a large amount
> of read-modify-write operations in this driver. This conversion found
> a bug in xpcs-wx code that has been reported and already fixed.
> 
> Patch 10 converts xpcs to use read_poll_timeout() rather than open
> coding that.
> 
> Patch 11 converts all printed messages to use the dev_*() functions so
> the driver and devie name are always printed.
> 
> Patch 12 moves DW_VR_MII_DIG_CTRL1_2G5_EN to the correct place in the
> header file, rather than amongst another register's definitions.
> 
> Patch 13 moves the Wangxun workaround to a common location rather than
> duplicating it in two places. We also reformat this to fit within
> 80 columns.
> 
>  drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c |   2 +-
>  drivers/net/pcs/pcs-xpcs-nxp.c                    |  24 +-
>  drivers/net/pcs/pcs-xpcs-wx.c                     |  56 ++-
>  drivers/net/pcs/pcs-xpcs.c                        | 445 +++++++++-------------
>  drivers/net/pcs/pcs-xpcs.h                        |  26 +-
>  include/linux/pcs/pcs-xpcs.h                      |  19 +-
>  6 files changed, 237 insertions(+), 335 deletions(-)
> 
> -- 
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

Late, I know, but:

Reviewed-by: Vladimir Oltean <vladimir.oltean@nxp.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
