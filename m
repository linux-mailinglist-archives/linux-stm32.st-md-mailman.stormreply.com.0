Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 876BCAAD0DC
	for <lists+linux-stm32@lfdr.de>; Wed,  7 May 2025 00:18:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0F879C78F8B;
	Tue,  6 May 2025 22:18:43 +0000 (UTC)
Received: from AS8PR03CU001.outbound.protection.outlook.com
 (mail-westeuropeazon11012039.outbound.protection.outlook.com [52.101.71.39])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3C9C9C78F87
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 May 2025 22:18:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ree+vVkRrlLRpszsFyjV/nsR4NcszkjaZ95+z45xBglD+uiae2vJfrugPEBZXpq72E6rYAykTC1Xwa4FBPI5Kf8pCl82+I/VefihmXwRzmMVe/SKGY3CBVTqKIotVXE4CgiJTbGsJmpmZHOjeJgsJjm0013FdCT5nNiyaTl7PkorhZ8gFRij/UzDuqrxWCuZTZhWKlpi715xUlWXzAj8WgncAUiOavFyfbJQTxdFyExECaEiGvxs09QSJ3RBtQhYpdpJXMrdZp2qMLFfR7KeixDUwC3tvh8QvCijNCEIY1U0CtWzjOAO7gqGgsou3zRcSgTffLtwiwDWgoxUapIcZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uZ3Y0UP5+30xKw23aI0BmflkXsNMdFBSdUU3jpS2mmg=;
 b=NtEb7EyG3qbP405ceJH2h/mdWQLNNSta5N9/EmSUP364kypmaRoSxGY31q8P6fgWAx4lAEF3ozELhKbbjiRHaPaYLkRd3LbvbSgrvOEhty2bagSlLLK01V20zYz8jA0I16xTKpNpvpm5toB58JPsgSfyCcJmGZDA/w5Aw+SBrMawrlsmdarcV89jHhUTvGIbZwAIcsYkjtyqRrTiklVBf3vlKWO3e2kgN12On1aiZvhdSHJTKvWbudfBynrre1EO/6X13kRWk9fhQMwx9+XXFBy7hfAuMq2HJwRwDoFCVZ02HsdxGQmUi9D4D6w//K/YF4dkfQHozluq1dkR4X2NqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uZ3Y0UP5+30xKw23aI0BmflkXsNMdFBSdUU3jpS2mmg=;
 b=dapYQJ37KSjLF/eQW68Luo68UdgndcaMlR3V/ZFMcKk/B3egvgZ9yMHtetGntX5Dq6yrM/CTQ5fNWXbHm7pNVifEkmG0oDb8+QLOp7DuOiYOsXcPDlsQbVh3LcMvbs0nx0eiEnc+8nwSCvmNO+bGhfDek3NOl1RiKFqkRUckrQyW3t3IXPRXXnmbpHxQGu3XGs1lRFJXvHmzCwiD/Tru/fNtyU/0oDEeG2ht/489hzVDXoPm4ZzRzZWWRvg5GWUfoyylNCh1+CRn0gkr80X+1CLQndNDFI8cC9kmtauWMdCIaAmvh1l3PAOIYq02QU6CNhiJFr3x0n/no1Af6zBVnA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com (2603:10a6:20b:24b::14)
 by AM8PR04MB7747.eurprd04.prod.outlook.com (2603:10a6:20b:24a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Tue, 6 May
 2025 22:18:39 +0000
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2]) by AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2%4]) with mapi id 15.20.8699.022; Tue, 6 May 2025
 22:18:39 +0000
Date: Wed, 7 May 2025 01:18:34 +0300
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: Sean Anderson <sean.anderson@linux.dev>
Message-ID: <20250506221834.uw5ijjeyinehdm3x@skbuf>
References: <20250415193323.2794214-6-sean.anderson@linux.dev>
 <20250415193323.2794214-6-sean.anderson@linux.dev>
 <20250506215841.54rnxy3wqtlywxgb@skbuf>
 <20250415193323.2794214-1-sean.anderson@linux.dev>
 <20250415193323.2794214-1-sean.anderson@linux.dev>
 <20250415193323.2794214-6-sean.anderson@linux.dev>
 <20250415193323.2794214-6-sean.anderson@linux.dev>
 <20250506215841.54rnxy3wqtlywxgb@skbuf>
 <50e809ea-62a4-413d-af63-7900929c3247@linux.dev>
 <50e809ea-62a4-413d-af63-7900929c3247@linux.dev>
Content-Disposition: inline
In-Reply-To: <50e809ea-62a4-413d-af63-7900929c3247@linux.dev>
 <50e809ea-62a4-413d-af63-7900929c3247@linux.dev>
X-ClientProxiedBy: VE1PR08CA0017.eurprd08.prod.outlook.com
 (2603:10a6:803:104::30) To AM8PR04MB7779.eurprd04.prod.outlook.com
 (2603:10a6:20b:24b::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7779:EE_|AM8PR04MB7747:EE_
X-MS-Office365-Filtering-Correlation-Id: 38f30819-5134-471f-2c66-08dd8cebf30f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mkDlWvSLQU3PxozDHsre5Pxw4nCVGIPrQY2hl0QBS8mNsExYuh02/5g3twBY?=
 =?us-ascii?Q?4b5napycBm9c5z/hnZ3y7izCJJDvjIedC0FX3t2S1arQ/m3qaY6cQOtobzIL?=
 =?us-ascii?Q?8ruB7iCsHyCcPh+NVlxQGplyaeMoakgSskfD4owfu+9aei6lsXgE5O1/E905?=
 =?us-ascii?Q?dD1lG2Ta2tpGr2fYFvEwCnDZqbBu+ddBFocj+LpqIcE9oyNNTA1JoWpu2D6P?=
 =?us-ascii?Q?mrRLupUUPR38h0Kxej56gPHKG6nEw6b/ADfVX3Mh/UGPRxjeOKg2Iy5U6tbD?=
 =?us-ascii?Q?yFatcAbfatSwDg18kgLcqJhR+hHt5jddo+Kkp01ajYpd8mTBnEL8n3lGLu6o?=
 =?us-ascii?Q?MBGUsfr/EKhAAEbgu+NBfHEPqjykK4//pIcHWo9GucgNqvokQK5TQuYP8JWc?=
 =?us-ascii?Q?CgsliDr03OksnqquZvVRNn56W3rF0y8Y8iu3dQT8tDrgCsIQx9/g447g7oWN?=
 =?us-ascii?Q?sl+dLloeVssmEyUutH6vl6HbbmZG5p5C3Ntb7emM6WPqTLyx4Sr2kURL+ktA?=
 =?us-ascii?Q?hy/fg/i7KvutsAEarsPUnN59wQXlMRJP5XKAA/sZ5Mvm1ntN2yc3iBDpstfI?=
 =?us-ascii?Q?2GKT6Tid0nMNTGLYsWR1rycArnhWQ5q5Rtq8vlnEZ2unJjdcLCwWkEByDRH3?=
 =?us-ascii?Q?/UKTzzNe8mn2zFKw9WTIHxVwtDzOcaP7rF8l/lZpDzF2IHX6vryD6lXWTgWJ?=
 =?us-ascii?Q?v/u+RusofRHPHdP9m8y3VQmKTfuE1WkkGiWm5Hj8rpQHnHdUh2PI1JPtb+dl?=
 =?us-ascii?Q?0BOP737r16Lo8yNuTrzpJi/3s/BTJKW93Jj/QcbpZTgxCv3Hxkklx1+XDTmr?=
 =?us-ascii?Q?fSlVMmBkNmC33sFwNo61z72wgClpQltjV831FAmCNj5bTt4zJxlkZnCykHZj?=
 =?us-ascii?Q?D6aTVWTJfoUZWSjaFzrV/HDRmtaJ/dDqb6yBmxOsZtrU9B72dhdoN48SP9b7?=
 =?us-ascii?Q?bXu8wYeUh/Pdhwt4NuvKCXe3HmIdYJKBldiskww34uNc4BSBEaUZAwvK2CpS?=
 =?us-ascii?Q?IYbDpFLCmwTxZTmD6HuAhc7C5VpItPFIkRWY2mHaKE8hi8+W842jIf815vcW?=
 =?us-ascii?Q?Qn5ygmhx01BO6Gcd35ORvmsJyFdVzkpSpji/IZ8V+rz75xe/ETkVM7ywwdMb?=
 =?us-ascii?Q?fiCYq2I4LzmWXJyKkMVnAp9puh1V9UT61p6FdEDXMbegL1pIaBZSXvp45JE6?=
 =?us-ascii?Q?L2U6ToOArX1z0JRR5o5MxXblC84TDIVUsIqTwHLpXtKZpjYC+lr67mcOjdVg?=
 =?us-ascii?Q?pKMHtV1uLA8LxIiAFXUJsKWw80qqxTtd7hx1DZMHUyem34MsHJJxx2WhBWBY?=
 =?us-ascii?Q?qqIeOpJONxE0ynWoY8HwuZe0K5xyxeQeyjkkWQzF52vSaG7Qseeb8S6HmFgQ?=
 =?us-ascii?Q?6XnaPF7Yj7DhhEcTktfXm92YBwdQbi8TXW+U3NUFzlHEer/ODw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM8PR04MB7779.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ypsu6fSsKUN8SzuCij7+CUWn7FuUE09izcYsLwE+bz3M43nByiaDuWxcZ7Dc?=
 =?us-ascii?Q?OtaF5UlBres2o7TsQBHVoZ9XDmCiC5djKBAGpPHZbarY6qod8Jyos1MeHABu?=
 =?us-ascii?Q?dwRfWMtsT+dAKDa2UGpNOPafrulWVMfWGgNlFH2riNktjG7Xix/WMOC3eT48?=
 =?us-ascii?Q?3Qudx9kmr/UdLDbQ+5J1Pwt5OKcseBNpF8G/hkYdLUFzM6Hg8raCL9aVsGwX?=
 =?us-ascii?Q?5+448znfcp0KpKhP7ZrvvnhRpDOZQfwNJ/6495lo9/e2DZWU5z+UO/X/+yFF?=
 =?us-ascii?Q?063SzOq2D9TYbYhePRSXfzgSc1agHVerUgUkQXy7Z8DZgUylZm/VEEqUKg8b?=
 =?us-ascii?Q?RBzaFOZUUAEXVAtFsfZQhe9itffraPNE6lIg6RapUmGr7DiJMqxpTUAOoxBf?=
 =?us-ascii?Q?MWQxKYaEIXOmg7I7UjmmMQcAt7eIHeZQVsPltQyplhGBZKl3IknIsKDNc/CJ?=
 =?us-ascii?Q?clqQVUQQToMlHpVy91LgNzmG1q1RwK2ca7eDQ9QdH10cIzEVeWKtx4pqwzde?=
 =?us-ascii?Q?XM0H4j/GNkg/DvadDoieBMwL8C1YPSnFaZd06rdeT6kkwGQY2AxPeuEfPG+h?=
 =?us-ascii?Q?dTk+aGw/IaqR7rqchaHOzwh2/UkPR8hv4euzhmw0CrP6DYs/dxCyOqhEm9Re?=
 =?us-ascii?Q?F7afgnjjJ3sAgaL7907y5N4CAxm7beaXCSblH7AWI90dJ72iK8NN9neCVSEd?=
 =?us-ascii?Q?sFU4MEKUAHBuAgAREb9/IALwJve4IWW9app/hd1rdqylrDVGtImbvkHUktje?=
 =?us-ascii?Q?eimD/ybyqFqR9xFeW3O99/KgTql66JmlmXvtVnyb4vRAZPVnvxAc1utVb4uO?=
 =?us-ascii?Q?C/O13vm5IP4VgVuuF1YQUIkoTEHrzl1+WLMIYYGKbYJ7U/Rp9EdayDFcu3QF?=
 =?us-ascii?Q?TzHzvWAu29LdcXfrHEX62PyilW/YGAggqPjhIzdkAMHHfEqtH4s2+krowdIf?=
 =?us-ascii?Q?UigY5LEVdxrS7b0tgwkKkVfBzPPUqSvqiGDDN68olvSY0UOn8Gf7UsrtPCZv?=
 =?us-ascii?Q?H2pkp6fsjhKYPr9ecVlaA8PkTf2QDcBhJjspCGGEabQkJkNfuwY3lMN+7vAb?=
 =?us-ascii?Q?WztAXul2n4wLJH1eVJ8A7Ms9AqpcnmTBYKzKHiisqEL38MvMMNHFyjoMu2Qi?=
 =?us-ascii?Q?07BkOJIidvw59kufjmDmqo8C2ZEassvQ0e5z6zvtYgVuDv4vYKZ9FykPdcPc?=
 =?us-ascii?Q?X+KLJw2ZAWZbaIxkf1hiaHFvJYtw9MGbDYoUBAw+c/JTxkzWfoIM2hVGalvq?=
 =?us-ascii?Q?hB9ArkL9szIoqE9qXUaxReT6Rf1VpApqgKLM77lFxjnknYBeTa3thRO7EHk8?=
 =?us-ascii?Q?mkFV5pI5TOz7MW97n1eLxlLXm17/ilchctFHKzT5MRV0SyJz2AiLRp4uHRr+?=
 =?us-ascii?Q?mysi57FItSsoNfQcLIk+cNGsKnss3z1dOelhW6Ir4NWIrsKb4ZvkH0ZFJc++?=
 =?us-ascii?Q?w1TZzOCBwMGa1oEXgZB7hLpadGMFayHt5jXr6pBg86sNofEces4d/W+Bm3Sp?=
 =?us-ascii?Q?qlIGa026sQbevnF/7PZQt9ElVQ0EyMsq49XvXUYDi5wDQZXN08BCMPhhTJI0?=
 =?us-ascii?Q?rx3zAYsTvh259+aCoV6QqX8Vxw+/OX9ySTKw0waZlq1xmvol9sSjBQkOfOUf?=
 =?us-ascii?Q?4w=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38f30819-5134-471f-2c66-08dd8cebf30f
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7779.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 22:18:39.3084 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1MqsfiDotGrlp+RaClhoYfC9TNFQf5wjOTeQNQa7KDhMu6sojoV0RRyhbbSurZkldVvDLhaTSml3in3pqOQepQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7747
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

On Tue, May 06, 2025 at 06:03:35PM -0400, Sean Anderson wrote:
> On 5/6/25 17:58, Vladimir Oltean wrote:
> > Hello Sean,
> > 
> > On Tue, Apr 15, 2025 at 03:33:17PM -0400, Sean Anderson wrote:
> >> diff --git a/drivers/net/pcs/pcs-lynx.c b/drivers/net/pcs/pcs-lynx.c
> >> index 23b40e9eacbb..bacba1dd52e2 100644
> >> --- a/drivers/net/pcs/pcs-lynx.c
> >> +++ b/drivers/net/pcs/pcs-lynx.c
> >> @@ -1,11 +1,15 @@
> >> -// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
> >> -/* Copyright 2020 NXP
> >> +// SPDX-License-Identifier: GPL-2.0+
> >> +/* Copyright (C) 2022 Sean Anderson <seanga2@gmail.com>
> >> + * Copyright 2020 NXP
> >>   * Lynx PCS MDIO helpers
> >>   */
> >>  
> >> -MODULE_DESCRIPTION("NXP Lynx PCS phylink library");
> >> -MODULE_LICENSE("Dual BSD/GPL");
> >> +MODULE_DESCRIPTION("NXP Lynx PCS phylink driver");
> >> +MODULE_LICENSE("GPL");
> > 
> > What's the idea with the license change for this code?
> 
> I would like to license my contributions under the GPL in order to
> ensure that they remain free software.
> 
> --Sean

But in the process, you are relicensing code which is not yours.
Do you have agreement from the copyright owners of this file that the
license can be changed?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
