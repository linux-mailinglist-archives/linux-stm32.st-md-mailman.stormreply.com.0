Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B984AAD06C
	for <lists+linux-stm32@lfdr.de>; Tue,  6 May 2025 23:58:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B3137C78F8B;
	Tue,  6 May 2025 21:58:49 +0000 (UTC)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on2078.outbound.protection.outlook.com [40.107.103.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D176FC78F87
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 May 2025 21:58:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FvVjZPhI+dk1yMCk5NCy59rOFhm9S1nrogpl5jcoQMjTl/CGlnyvobF0hWO7Fz9icYKspzrIh7lxdvBptouL19xb48g3W8w6jL3Lpy/pCsQa7oLHj8pqyT3jp4Ai6trEr4tPSPjVs2x2Qd4j2/BvsqHNwlHwGK+ye2ipRGImRfR7nQbftkiLT5t3EiOHRHGKqfAlmYZHawwzG2iDZzcu2hJPYtHOP0xdJDZx8qqJxKUdperv2rbHnc8yuXnfYGlYcASQ14PJEXs+ejgpHKj3i+hlFCXFwb169TiE2mlD2FCUGQjtv/pBDUcmSuneXuZQvv3iVJOA4b94K7Mm2Kyl7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gmRXU3MBZuC2jrBIB8OTTGkBc1rnlxFjlIQO08zdjsc=;
 b=ttCP+tJcixpgWw1JOuLWRhFandC3+1zMj8fvyqfsNnc5pAPw/sKd8if2rGvi1M9xuWcDMlDylfu4iMx2X4HRBFmMiDRkbI+94oLZZyMyuDav3cXQyF2qeMl/LJxGlONIRUfg+Qj2Y3auK1IOFBCwesYmB4joJxwX9Dp66rJMfoml0YvR+1TGkCyIq9fu8UQwSKtgJNp0YcnwdBpGZPTPRpdTbUJLeUjgP0YdSHQ9Qw8DsK916UTnxGPzd/LKrsbChEu/R44juT4b2EHJiLWwV+Y6Mz88oMvNB/WGnjM1sO75UZJdvGsgzThGVs7k91BPwSz+2/XllvxxemJ8DmcAPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gmRXU3MBZuC2jrBIB8OTTGkBc1rnlxFjlIQO08zdjsc=;
 b=YlcMKHMsUgjnSbJxhHQ/DY2wdwomqFgxzx44rCvGfKahPb/CAzhaR4hMVMid5osRMTBgtMFwRU8GhjM/QxJiOPBCvlW+mQnHae/8EQ2xqyZGX88UICQ2DyHh9hq/0lemLAUW/1+Tve7OsEBiBFs5VAIFeXqPP4FL14ZFTSuwtzZj+0u/H1aKeWJ8qFPebz/B/DRhUgXPzlaDl9WoITiCaUeP2TejMSJoGBPq+N4v4106j5ZpGKasRlLnertB1/NMTy2z2X4hfuchlgam91eOfDxInatKd6c/XpRoN44PU8tue0MRg+UhlQ2JbKulW+J5ueihcQ6+eB3SFiYFynR/Wg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com (2603:10a6:20b:24b::14)
 by PA2PR04MB10258.eurprd04.prod.outlook.com (2603:10a6:102:404::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Tue, 6 May
 2025 21:58:46 +0000
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2]) by AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2%4]) with mapi id 15.20.8699.022; Tue, 6 May 2025
 21:58:45 +0000
Date: Wed, 7 May 2025 00:58:41 +0300
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: Sean Anderson <sean.anderson@linux.dev>
Message-ID: <20250506215841.54rnxy3wqtlywxgb@skbuf>
References: <20250415193323.2794214-1-sean.anderson@linux.dev>
 <20250415193323.2794214-1-sean.anderson@linux.dev>
 <20250415193323.2794214-6-sean.anderson@linux.dev>
 <20250415193323.2794214-6-sean.anderson@linux.dev>
Content-Disposition: inline
In-Reply-To: <20250415193323.2794214-6-sean.anderson@linux.dev>
 <20250415193323.2794214-6-sean.anderson@linux.dev>
X-ClientProxiedBy: VI1PR06CA0111.eurprd06.prod.outlook.com
 (2603:10a6:803:8c::40) To AM8PR04MB7779.eurprd04.prod.outlook.com
 (2603:10a6:20b:24b::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7779:EE_|PA2PR04MB10258:EE_
X-MS-Office365-Filtering-Correlation-Id: 63ec9559-08d4-4235-ab5f-08dd8ce92c5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?F+DLqDt3sEP+TxJ5Zb2m9bVggA9UfPD9NdfHXkZ+8+kSRfOlAboNvERrglsD?=
 =?us-ascii?Q?I88yP14sW4XoicC7PgK86YFCA1qE7Ykbjvtu5ERPq5cGsXmX6tLH0pQ5SwpW?=
 =?us-ascii?Q?rxAljUwrCzfgbKAGIdb++7Njf8wt9HLVpdVWli2O9/4F79lcPJleIg4dDgFe?=
 =?us-ascii?Q?0OOpaqnIW43uePb5HY73a3xD5IivaiAkOfN3A+x0swUxjZKZt8AOwmVon/jB?=
 =?us-ascii?Q?s7BezZKrF+DQqtgyN0232xf9h8WNRboaCu6vtqNyb0PeKde8VptzPy6W8W1Y?=
 =?us-ascii?Q?BrEL4/DEjCozWrhEoeh1kg5a9Ek7NClyNx1zE/46crikDaz/bxGBgBH37Uok?=
 =?us-ascii?Q?KPtE342dDGoAI6yf0fsnSaH1hW90o7lZeoQJFxJPk44XZhK7fnb+65X/vdcL?=
 =?us-ascii?Q?cyX/WqHhNFFEg+UrcVNPl50ivE3jMyKxBZDF8r676KWQ8ZsLdPWos8ur1F9n?=
 =?us-ascii?Q?iYKVBlqOFW23uYI+BWn6O9S2VI7FZO4LrBneuMWMFkGpEPQCGyulHkCi2Rfu?=
 =?us-ascii?Q?DDTpB2pL6otYZs0A3xNidkt1BSj6/P2Z7oU1ck8QYkcJmkRozRw43IXI9nUV?=
 =?us-ascii?Q?s9mFVqN3sgOBF84I+YQRiDQgIW7JR76B+6eSoCB2HhUIc8Xyaj/Nf9ZCtYVT?=
 =?us-ascii?Q?3jHQFHjOzwgeJSTy0GKRhf5qoB8+aTjbtDYwmT5WPFrdId6F8klF/NXCc39t?=
 =?us-ascii?Q?PV/wY9i0POnUpGz1U9jGBq6/SmyLa91rp8mInTV0gSmzyEUtJUR93a8j0ChO?=
 =?us-ascii?Q?UmgtgpXUmokYAdPjKWJtql1kzK1J2wucMxLlGlihZ5NxSSnO2LdABze3pTXK?=
 =?us-ascii?Q?tSqgHlN33Wy0ategXCPnS2j1/bvj45w0HdduiKtywfGM9+ELUJ2ZoIx8nVwU?=
 =?us-ascii?Q?Ob4a/vS2M1buOmR5nG5l/XxWny61gXnAl5gihMXliN0RgOcIxkdRRF795ZJv?=
 =?us-ascii?Q?uNz/AqyRG/P14xUvgaRW1LtEgqDe5Y0v4oLO/twumrGVVzjLwdns0jqzUf+L?=
 =?us-ascii?Q?cgC0OSEBVvaGadLU1IBI9g65FcBvixudK6eZ3jQV6hctNbomcQ3CQfXit6GV?=
 =?us-ascii?Q?Q7rv2FR/nUZ18JEw0fvX0T+aLgo8oU28aI+2Hh/sD5GCnMHLzeJ0SMPgC8kk?=
 =?us-ascii?Q?x/ZBo5eFJfX03RU1oq6qjEnn3B75vTjv7ziH/NRW+O5og0o1eEqBIOdXlbgs?=
 =?us-ascii?Q?bTi5udZq7weJavIzxdch77oiv+mRECcCbsL6yUv5rGnGy9NdAdVl8DYtawrf?=
 =?us-ascii?Q?X1o6oan4kroZh7kDSvWt3CjopGS/rYt4gDzr78bdL0Uk7rEMsAEwZsm8eJad?=
 =?us-ascii?Q?fjidmjbcBP+wxAQBMLDS1fRbNr8WsaQHQet2w0sqz9ewJMx5jRymfRMFRjrK?=
 =?us-ascii?Q?dzAWaxE7dA/d+0adGW/mU91/eD8E6QmjEfW8LW97t1vuP3Pdqg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM8PR04MB7779.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IMv79Rjxy1DBSUBGM5l4e0JQ9+ovT4PdUL7Qp0Gw+biKADB9EW7LkJoS77G0?=
 =?us-ascii?Q?C5+AfsbtBGlgQC3U4RvxhMKegPuQm65jH+bDpeJA+8lvyr+wgE3ePSFUHILp?=
 =?us-ascii?Q?f1joZxJcFuY2RCCUNnHGz7MrRvIS4nsqCqdHbHvYlJHefAG0ECe4FGDzauCy?=
 =?us-ascii?Q?kV2kqzpLvNRdHygQTBymTgNNpOta/SGX01txW1dFox+OpXMIMFw17z3b0cNX?=
 =?us-ascii?Q?+upQoZto6OIzAnESbs9zAKSbIbW8maQyIozNXFWE8Mc/s3pYBK9KWRQheLoF?=
 =?us-ascii?Q?xLpmVONDiSYv0/jasxFBkANBKDBbxoS9TnAK3NFOUX3gLk1mGghB+5LUVvgk?=
 =?us-ascii?Q?SyLWKw3q1CrT69/bGBUajYe9V5ELnxEjI2DINiYa4inWmlIsgBpI4b6eblaO?=
 =?us-ascii?Q?W+0+tCsK+GpxWwCYeu1NWUVK90Cs7/7CO6LvFBkXHtECEnXDi7NdXLxgtAHW?=
 =?us-ascii?Q?LVA2HEUxIjfMHmOOAYb2zdQQIVH/M3hanxG9nW4uxlF26WegMubLyq8fqn5b?=
 =?us-ascii?Q?nzZET2pBJWat/gdqAmHy2wQpiv2PAsjszmuVGMzoOic5m4MQSSpBhNbGjJOB?=
 =?us-ascii?Q?z0Q2Y0c3bUp7dib6bvUE9hNb/txPC2wFeyBFXuUCNLLXM1iUZ22EOhVhpB6p?=
 =?us-ascii?Q?iMgOEm7gTAx11skTICqCtgMr9q8zejQrG/iqYGb8gwnf7+OT+/WzaqOeiAz2?=
 =?us-ascii?Q?caI1AA2OaEHGZjovANWzX47sre7LNPo/btiL59C0BCeqBLV5SRy/lFjfQb9d?=
 =?us-ascii?Q?25QGboQoBCdy39ZG51ULpLgsh3hKgTYarkMWXI6bd+pgbeglPr0yXHGaAjvR?=
 =?us-ascii?Q?NsTl3da68Fh+tIlcJp8V7/6Ar2SIoaVOJnZXJcWt41t+/OUUtdnjQTwzjGro?=
 =?us-ascii?Q?47907t1ZQPEZGYOjlmabdgNru6ttyP3plOxQNsK7vZ4PK6YS+r/HahQC8JgW?=
 =?us-ascii?Q?usXafZRn2WBxIF4j0DQbEJZxik9ZuzkuFyQpCDQbYCXJ+1o9QUyGf9ck4H13?=
 =?us-ascii?Q?i1TaBVnoxTCrPhiCN0prNpLBOigED5+7Vcc5sgb+seOwcwCr4tdHUptOPqQm?=
 =?us-ascii?Q?IGnPqvOStuJ+kwnpQGORxzw6tF8/cczOvpNBFhZOCL/tLK/ihDYbzhERRCEX?=
 =?us-ascii?Q?uYE7Bhz0P8Y6X+KePcR+D59zjDPf6zdvVt0ZU/dYYhh60OKQ2sy2x0vZEf8I?=
 =?us-ascii?Q?+SOh4UEWN1boo0O72i1J5PDmTzUMWqeAd7c5vRiMX+PaLyEzv0L9HgvZDrj6?=
 =?us-ascii?Q?3wnGrBriKqL50CozZBX519KvoPtoEbrI0/61n1v77BtAa63auNQ/WskMMANJ?=
 =?us-ascii?Q?qU+YzaqBXfbAzq1Me83QbgLP9OsIyQFcMu0wKEsrbCAiCa0hJ48P3oziIZYC?=
 =?us-ascii?Q?0lcT8/TmpGYbFWmS69F+SZ/oEGBRwUlna9Lddti6NPZQoQ1uV0f/pL62v8Yf?=
 =?us-ascii?Q?v9KmxDd+HpwaOhLIwpkZZEyDLlAiaIJRu93owJDwCrKagMGVup/elCITD0pu?=
 =?us-ascii?Q?eUwLLL6QCcR1RfyVidzlhB1S3Fd/oGXJAv6ad+RVF8yueGOCEt3uBni3gL0r?=
 =?us-ascii?Q?/X/dp+heTbN9JaWjf9PqgcrRtG3KzacM0ML/XICv+M+TzAMY6/ymvbWQrS1n?=
 =?us-ascii?Q?hQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63ec9559-08d4-4235-ab5f-08dd8ce92c5b
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7779.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 21:58:45.8308 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cBlL2l+l/HuscQ3mZsjf7HoxKta0ULHgqPE/MEzhxHDpPTNvzIoOyp0GEfWyisufI6u5IZxp+su5upztAFoNqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10258
Cc: imx@lists.linux.dev, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Madalin Bucur <madalin.bucur@nxp.com>, Eric Dumazet <edumazet@google.com>,
 Ioana Ciornei <ioana.ciornei@nxp.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 "David S . Miller" <davem@davemloft.net>, Joyce Ooi <joyce.ooi@intel.com>,
 Russell King <linux@armlinux.org.uk>, Clark Wang <xiaoning.wang@nxp.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Christian Marangi <ansuelsmth@gmail.com>,
 Claudiu Manoil <claudiu.manoil@nxp.com>, Wei Fang <wei.fang@nxp.com>,
 Kory Maincent <kory.maincent@bootlin.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, UNGLinuxDriver@microchip.com,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, upstream@airoha.com,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [net-next PATCH v3 05/11] net: pcs: lynx: Convert
 to an MDIO driver
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

Hello Sean,

On Tue, Apr 15, 2025 at 03:33:17PM -0400, Sean Anderson wrote:
> diff --git a/drivers/net/pcs/pcs-lynx.c b/drivers/net/pcs/pcs-lynx.c
> index 23b40e9eacbb..bacba1dd52e2 100644
> --- a/drivers/net/pcs/pcs-lynx.c
> +++ b/drivers/net/pcs/pcs-lynx.c
> @@ -1,11 +1,15 @@
> -// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
> -/* Copyright 2020 NXP
> +// SPDX-License-Identifier: GPL-2.0+
> +/* Copyright (C) 2022 Sean Anderson <seanga2@gmail.com>
> + * Copyright 2020 NXP
>   * Lynx PCS MDIO helpers
>   */
>  
> -MODULE_DESCRIPTION("NXP Lynx PCS phylink library");
> -MODULE_LICENSE("Dual BSD/GPL");
> +MODULE_DESCRIPTION("NXP Lynx PCS phylink driver");
> +MODULE_LICENSE("GPL");

What's the idea with the license change for this code?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
