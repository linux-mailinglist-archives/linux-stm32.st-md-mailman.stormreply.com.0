Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 17AD6AAD419
	for <lists+linux-stm32@lfdr.de>; Wed,  7 May 2025 05:33:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9EDA4C78F8B;
	Wed,  7 May 2025 03:33:37 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2055.outbound.protection.outlook.com [40.107.22.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2D5B8C78F87
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 May 2025 03:33:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=azKo+qIH6uJbcp+MWWTZPymWDdW5OHYGIWWwyNpNLn3odx5YaVvrZUVl1BIm7RcB4Uy0RvZLfekQcpMl3/ERzedhrPn5+grtYUgGL1jlWxRIWh9r3DUFHIh8QbBqJ9hrQYtoA/C2YXVa6CHMSghOD8/loAlH61Fr55b4xhcOVXkUxEnwn7Q+ogKJ09TPA8EwttRGd2J9nfnQUpA/CMPdizkOHYxFVcM9m47Rz/C3TKUIFtUlxUho4NR0ft7YTpyrsimwXrkv9kNUDVNON6aXmEv6b0C7rtU1gQta6BVEh6gBD1/qriseF+Ln/T2yULiYzKYPCz2d+EdWH+GZRusIAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jYA12YK7zILSCsjks26D54O0YhtosuFK+6TAZKbzLAU=;
 b=k5dT6EuggcNfgu+2KcLdoc98R5C4T/eToJsEYUZUXf08KC2iFlblgR+n4cUZVvrvF8ZeosNEO0z+Q/U7ekQJVqunJuuUjEe9pasLLvAJcBycNwQ0b9L4DqXTclthAHIXRkM34FI2Qcf8URoZB5IhxvhYzNlnVLFYDH1U2/RuPSVSqnmXSZr8RpuLhSBkSfhnlUQDD1J32cbsX75UMGZ6Bd3BuCh+7DlfaTFlKQSk4Yt+tqtd/jlYUl4LKt7h5C60/sbdRTU7OzIsHCRfhxtSoRX4+UVNh+iVoGqKUCDrHCNCnoe2NeUSJ71stTPJf3oEjyXrMel2iJGnc8ej2ApS7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jYA12YK7zILSCsjks26D54O0YhtosuFK+6TAZKbzLAU=;
 b=NMpcxQQQgpt3VYp7GeKBTk2JNEEuTMd8ypqyXn+Roe+K08yjKPjk/Jata24lpYXEC+Boam535st5m0NDsIwSqRuWj+GxycjUcihOWsorBe5wsT4bjWb6m7n7XpiRlLrWNJmhapEfqWh60BRPsc1srg+trKjaHtvXBb89tCQygE85bZcM9zsUGkuiD0VudJGzX2KnHRNFpxT+smGuDBchqRWIu6kAan3M2FzCh7HeVqMvOWoRW9GzNd0XnsYK9mC5x8vDOoQDeIOjsWmHB0vCW9tWwKq7iHCYrVdTTZk6Jo1QdH4/x+47HywO7zLnjNeFTMPn5zF4obfb8Zxld+Pw7w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VE1PR04MB7406.eurprd04.prod.outlook.com (2603:10a6:800:1ae::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Wed, 7 May
 2025 03:33:32 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8699.026; Wed, 7 May 2025
 03:33:32 +0000
Date: Wed, 7 May 2025 12:42:41 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Message-ID: <20250507044241.GA2351@nxa18884-linux>
References: <20250423-dt-memory-region-v2-v2-0-2fbd6ebd3c88@kernel.org>
Content-Disposition: inline
In-Reply-To: <20250423-dt-memory-region-v2-v2-0-2fbd6ebd3c88@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI1PR02CA0024.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::12) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|VE1PR04MB7406:EE_
X-MS-Office365-Filtering-Correlation-Id: cc5292b7-53a9-4632-b646-08dd8d17f11d
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|52116014|7416014|376014|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tgyVn5gTU1oAZ+LyHKjq6AyCJx3TzOQ16c9hL7E8eJoTZSdgxf9uq6bFDi6L?=
 =?us-ascii?Q?ilGuMaYhkoV91VKMsY/PaMgbaKmjqqMh7HG0QMqj9CBor21EBq2WFOiu5Va3?=
 =?us-ascii?Q?KYRcixOqExuH9nExN0EGbRf26fxiGdIsyG3qf9UhYmTnAEpn6paIMl2kKdcU?=
 =?us-ascii?Q?3/YG+zOsXhCqMkvm2z45TcWNR3Z/CFJbx6hVJkr9MLfscc4XCfOdNc8pKO0f?=
 =?us-ascii?Q?nWURGBP8tL25Fub1YGCxoNl+OynjpJHFuv47d6Hwzr0odxmgO1NPBHn5BxlE?=
 =?us-ascii?Q?w1/qzkdjCLEVBEyLE3xtCKfZfWy3MwWOoeMNdzjIJ0yM+68mgStVtpIYqwNV?=
 =?us-ascii?Q?g398gBfht2kEoro8zDAEU0yk45YR/i9WkceRIyKekTNhWn7VfVte7oQOWl9m?=
 =?us-ascii?Q?6TYE1L+ef/P2R0hp8Y/7H7FI97ovvUSSCLJ666HXt7APEVjoBa3QBmAE3oIB?=
 =?us-ascii?Q?SDXva86f8zS0NjIMI4qwXGEcZxDBxQJvvu5rHLU9Bxx48NSMctoC6m1WGCLi?=
 =?us-ascii?Q?R77qCVVsWGpdOxHrj2ycOWckwsGHYh7mLzLInbgvKNvt7oFiVI979Iy2OYdm?=
 =?us-ascii?Q?mPn7+8+a3AtYDO06HWI4ouVdkL1OkvuSepvGnfM04ayh5sPqXJKu3GOfOqUC?=
 =?us-ascii?Q?2nu1UVcCjb/frW4YYZLJNb8s68eOwaN8ARQ9EwdMhnBzQcmF/qdQDZJO5iLd?=
 =?us-ascii?Q?0mwl0YZfYxyoMAUxcI5vLpE0/Qv2vRw6/it9hxTecSvNpTSayWSGsHGRnPwN?=
 =?us-ascii?Q?K04rAOoTmEbrl/t4RSshLFYDo9D5ua+RbrwxOEU4iWaTes/U9Z53Obuaujhg?=
 =?us-ascii?Q?EO9Smzn5p9+hazGiGv6kapTvLJa9ESagx4agyWPBQWuevh+X6NUaqHJ84R7c?=
 =?us-ascii?Q?uUvOKioCJPTcYZKmuuPT/FDU4uSHBGheo++yOAGg9yyoDursMaTeMAEnq4Wm?=
 =?us-ascii?Q?mj5374OuOf70ea8ABRyjR4p2zqtFPoBjSzEgbHy4//krfaehuDUZyuvkFY/d?=
 =?us-ascii?Q?1mXvaNXXiEvDpQ8xTk9xoHlNYNsRN5IC5tpOxhwPbf7QobcGD9q4YqoTiZkv?=
 =?us-ascii?Q?Hgd2Ct/QySpaBAKWahZrwhR1HDA0j5q/p6ucQw4TlIF1iFz/ASxNitCfieW+?=
 =?us-ascii?Q?yM+BdzhQk7eAekZstfXRPfQ02RotztV4a/ddg4ByR3igDAG+K8pvy3cYn9A1?=
 =?us-ascii?Q?P43AnDQmnzOVa5uVEOVxkBIpF4XJ2N50Ka8DaS7bQ+kpqvdPqL/SYPno9z4M?=
 =?us-ascii?Q?W9QfBPP8cNRdGGJNAUoIknU6goNZW9yDVbVXJ1ocHi9qJmrj0Cul3ln4Oyjm?=
 =?us-ascii?Q?mR6jyit3py/BdNngmuj8p3LVC+Kmr2wwNT9W6PQtEWp0umd+gOhZRSAJ1hNR?=
 =?us-ascii?Q?RDvOpvh3zNH6o9cBpi3fre5c47s2dHe+s5CphzsASfeWjDJMtv/33WFbJiOT?=
 =?us-ascii?Q?w2TpgP+2z05jQgZQI/zifcSVTJpcVucL8A/9cMnfTp6A+aI1Gl3fBZ3qp2/x?=
 =?us-ascii?Q?UElC017XDsVhGLU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB8459.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(38350700014)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?InNt1+XB5xVB6TBZw5gM1cKqmTvXQ460wIatNIkq8g400R3v8VNUwLFlGde7?=
 =?us-ascii?Q?jV/5CMXOC4VxcntX+CcKqd3lXmAiuQWkRaFdIAJcUpomGFkCvOX/Ip4754Py?=
 =?us-ascii?Q?QQU8N2QDh/QZ/f2j4RWOY8l6cAuqwvEkFNU01hKtD+wWlcSTenwgHbkZwVd9?=
 =?us-ascii?Q?lujctweFpGBgGTRYqA0gMW3VkaK0FLUmE2StbYLEB1zbS5axynAwVryCmvzJ?=
 =?us-ascii?Q?C4DrGKcw7IjquzWy+9W6kmebwBuPTegZepM8dE1dpzIqbiWCuh6KHog9i8X9?=
 =?us-ascii?Q?Fm3bDb0F7RZyx/VSYIceDHGhtIVV8v5AmBjfz9dmVpTzKbpP8pW8FnuBARIQ?=
 =?us-ascii?Q?WL09+163gCZ7v7YOcFoBcYVN9NxgNutUaJh5YGMxZmyt58WH76/jrNsD+tnb?=
 =?us-ascii?Q?gQyLyOp5r9B5OZgzTY4tfcV2IWh5rx9eAgfpstjqM4Lqe3SLfTXRKyF7ZQux?=
 =?us-ascii?Q?ZDZn0Ji0XTNfkmvPYY3VkbAH6slV8pH9fCD//qaJJ4gWT/2miCR0snMRhcWe?=
 =?us-ascii?Q?aP3D1zSEY0gByjh9oPbR2sDfmqSVgdJFy2AcGqudVPcW0CffgE0h2Ry1nE7k?=
 =?us-ascii?Q?YhT6wiwnfOISRBoX5XQ/4nt/lVnz1GGJJKf79LgCLLUqIi4bcKICdSbDSGlH?=
 =?us-ascii?Q?NYPhEHBAfhMa40y6ooMemt+Ig3/AsiyXt2Tzi2hVaqiG+7GkJdsw5oSPQ0Ve?=
 =?us-ascii?Q?KonaM4ehDUDoIxLupvH36XXPmoJF6cmmRDwQwAJD1Gwxc3UOMzlv1npxnOz2?=
 =?us-ascii?Q?QyqWnRPS/Y367dEZYcA67anN73+x15AWqUpnRpCT7h+V0zQWeHM+Sjj58ZLg?=
 =?us-ascii?Q?cmbdorHsfn5BsMB6CartHhbMN19K5M8mNfEWH0WKXeUydoKbZDvnUwqDcyTT?=
 =?us-ascii?Q?WCVEq8CnwC80ijeGBzO2glL7UUZTvG7Hl+YTlkN/rBwFv6/v4omp3j9KKupf?=
 =?us-ascii?Q?+tI+ILprSkoicq/4s1Ux/Vika/N4MvCSXt82IzxuIFTY8xbClQa1TCecg8Km?=
 =?us-ascii?Q?QI4N9/aZp4PYRhX7wh0smxcNlrQCejeWhsW5mbxWSzoROkO2Mg2yARKzO7tB?=
 =?us-ascii?Q?sxUcq4VHhh5CyeNUXiCLB0Zsqw8dMuVvQSPy+OL80sHsO5Me3PQ26ioxd1NG?=
 =?us-ascii?Q?qiHPBBzPFWzCebuH0Ckn/7vu8QK62Cq9/mO+o+sRHzWruUtgn7K60mMEd67p?=
 =?us-ascii?Q?SZEcl+7G2/BJveQtZiuDST5e18gsFq/xrEx5b/rPX3R1acY1RXcRUUM0DKgF?=
 =?us-ascii?Q?AF5kmWP1oHlfR9kB54cH7THhzp6Wsf6u/61D/ZaAYmlNep9L0fY5YRajDdvh?=
 =?us-ascii?Q?eVaxN6PQC+Lx17bMb6ZKvFvRIC7xwy3QqFHZ4qnj8Lty6ANsCI4SoPV13936?=
 =?us-ascii?Q?pbWNJ3dSAABOJ4wdDMvfhj7Md7an7t/35A7TeWwDWR3IRV9M3YRJVUG35eXF?=
 =?us-ascii?Q?7IxyFN4t8UXbwJJC3cjP64G9QRa1xAC5a+rYh8YsDwgkLEQDGY0vCS92idz0?=
 =?us-ascii?Q?iYOOohdrZGeiea7KbMa/IVSoXVhNtoMRk4w0inm4y3O/C2frILVQhhalmT0T?=
 =?us-ascii?Q?oTJMBYm05lLkDPfRTAUuYvFWEvoB3ZFz3I9tFdnr?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc5292b7-53a9-4632-b646-08dd8d17f11d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 03:33:32.7837 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P4m2eAKJFkxEN5ji2yVZtmWHZs0pkF8tcbqMTsu2q3bIgU5EWBEzKXtfCnX8Y0oOtp7poEpnOz0bYE/ksW4Yfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7406
Cc: Daniel Baluta <daniel.baluta@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, imx@lists.linux.dev,
 Chen-Yu Tsai <wens@kernel.org>, Saravana Kannan <saravanak@google.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, devicetree@vger.kernel.org,
 Fabio Estevam <festevam@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 linux-remoteproc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2 0/4] of: Common "memory-region" parsing
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

On Wed, Apr 23, 2025 at 02:42:12PM -0500, Rob Herring (Arm) wrote:
>While there's a common function to parse "memory-region" properties for
>DMA pool regions, there's not anything for driver private regions. As a
>result, drivers have resorted to parsing "memory-region" properties
>themselves repeating the same pattern over and over. To fix this, this
>series adds 2 functions to handle those cases:
>of_reserved_mem_region_to_resource() and of_reserved_mem_region_count().
>
>I've converted the whole tree, but just including remoteproc here as
>it has the most cases. I intend to apply the first 3 patches for 6.16
>so the driver conversions can be applied for 6.17.
>
>A git tree with all the drivers converted is here[1].
>
>v2:
>- Fix of_dma_set_restricted_buffer() to maintain behavior on warning msg
>- Export devm_ioremap_resource_wc()
>- Rework handling of resource name to drop unit-address from name as it 
>  was before.
>- Link to v1: 
>  https://lore.kernel.org/all/20250317232426.952188-1-robh@kernel.org
>
>[1] git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt/memory-region
>
>Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
>---
>Rob Herring (Arm) (4):
>      of: reserved_mem: Add functions to parse "memory-region"
>      of: Simplify of_dma_set_restricted_buffer() to use of_for_each_phandle()
>      devres: Export devm_ioremap_resource_wc()
>      remoteproc: Use of_reserved_mem_region_* functions for "memory-region"
>
> drivers/of/device.c                       | 31 +++++-------
> drivers/of/of_reserved_mem.c              | 80 +++++++++++++++++++++++++++++++
> drivers/remoteproc/imx_dsp_rproc.c        | 45 +++++++----------
> drivers/remoteproc/imx_rproc.c            | 68 +++++++++++---------------

Tested-by: Peng Fan <peng.fan@nxp.com> (i.MX93-11x11-EVK for imx_rproc.c)

Thanks,
Peng
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
