Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ADBAD1FB16
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Jan 2026 16:20:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CACA5C8F26F;
	Wed, 14 Jan 2026 15:20:28 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012020.outbound.protection.outlook.com [52.101.66.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C5D6BC349C4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Jan 2026 15:20:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nYY3u1sFn8AGzwLav4+UjaIleRZqRwYpofavB0sCwhFU3evaRbGCZ3tifYEehp8rYoFjpXiJBF0i3PgGfKEUPuABRbJpPOGQk7hwuvkBfrNFUhuRp4OQ0MX1jcV7FRzRfpIruXJNgCAaKrEmdT/NAKo3gNie6QRDbakNeO40El7z505modiMeoCKn1zzaCJ8bm3CHC+rOHOrb9LF0hL7fFteD5x70b1Di7ScCI+tR8RRZy/SWdNh8Wb7lxZ4LkJbD+A50iHCzpo2F243vnp3oDvFa4x+bzMKytrFUbJVMey9N5xoDJNRacWxS+NQuIaLGPwypKJQljgMY5ZzZWIAkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6tcXHFxAFX5iaUHaT0myfwSWoqDs9ve9DfEctT1gCfE=;
 b=hwi0BbHbRlPJmSD0dQg0qnB7R6Om6NyllySW9MjHIR8bNFB99QGZAtei6z19JScW1jy6X6Z3nmgNe+L4Fsb3Gt/+yc41Mzcfgw2vboNhfyf5b3dtxB9ff+JDCt88usasvjDK976Bll0OPj2w7TDMZk9GS3oiXdug+3D+6Nq2jOeva8MCXdOoM2tRz/BryT9HTYmQKssUlsZ9uukx2OOfKuANxFKa2iEuwYNxcSM3PvQt00OjWMYa7x2/WUYxSbAw6FB2oC8e0zScw1VJtFtvJ9fKnXOswp94EHh4mdFSF+y2KVxphBOnLi2/ushYQeQOGorCTKQx5CzqreLCy8QXtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6tcXHFxAFX5iaUHaT0myfwSWoqDs9ve9DfEctT1gCfE=;
 b=cO1mjNyxx/zb/ZwHkbYQ/8zkGf+ZjR4ecRCZ9qQzM9ZOGayToc9jnCSPdj+i9trL4PpampEA6lX+XRPm/he4JigOSVJcdfQGJA8f65w7fQBaNWL0FonBA34AgCCIl6Q6aAtBQtFR9hcwkkxpd5krh5mcPiGU5dbhpEx2bg+sbFJF3O8f2DxEBCDRwLnPfIu243WmdI+pjEjx9EbrLD6vX559OGDc9nCx4sYztJwKIf27fuLQNErtCUe1k3PtiU3InWEhinejHlwbqGJHGObWm6sSGEVq3vJtkHGuRRlpW6TFB8rKY7o6z85rtay70C7LWnFDiEhC7vfBawN8L1KWyw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8948.eurprd04.prod.outlook.com (2603:10a6:20b:42f::17)
 by PA3PR04MB11201.eurprd04.prod.outlook.com (2603:10a6:102:4b1::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Wed, 14 Jan
 2026 15:20:25 +0000
Received: from AS8PR04MB8948.eurprd04.prod.outlook.com
 ([fe80::843f:752e:60d:3e5e]) by AS8PR04MB8948.eurprd04.prod.outlook.com
 ([fe80::843f:752e:60d:3e5e%4]) with mapi id 15.20.9499.002; Wed, 14 Jan 2026
 15:20:25 +0000
Date: Wed, 14 Jan 2026 10:20:08 -0500
From: Frank Li <Frank.li@nxp.com>
To: Koichiro Den <den@valinux.co.jp>
Message-ID: <aWe0KJnZNHqSUAKg@lizhi-Precision-Tower-5810>
References: <20260113162719.3710268-1-den@valinux.co.jp>
 <20260113162719.3710268-4-den@valinux.co.jp>
 <aWatVUFdyYz+JaMI@lizhi-Precision-Tower-5810>
 <mz3ahnech7yn66hcv7hqllir6rz6qpjd6m2aj3feh2gqfsvpwk@oobwtkb6o2jx>
Content-Disposition: inline
In-Reply-To: <mz3ahnech7yn66hcv7hqllir6rz6qpjd6m2aj3feh2gqfsvpwk@oobwtkb6o2jx>
X-ClientProxiedBy: BY3PR04CA0020.namprd04.prod.outlook.com
 (2603:10b6:a03:217::25) To AS8PR04MB8948.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8948:EE_|PA3PR04MB11201:EE_
X-MS-Office365-Filtering-Correlation-Id: 629ee763-107f-41ab-90c2-08de538070d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|7416014|376014|19092799006|1800799024|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fIL87D+VpLubha8USo5MrqvxiDTPKRKMtMH5Qbpec8F804fxKLkwoJ079aJG?=
 =?us-ascii?Q?e4c+Nnp5c9T5N8iwFxOfDYVFsSzaaT5NlhCCle9qZIY4yAaBibXfjqRn3MLX?=
 =?us-ascii?Q?hwn+wSrzMAty3YkqVOQDSknZKJQNl5GSlCFlli9L4E0nMpH9hvA5n8fZxLGA?=
 =?us-ascii?Q?TQ9TlfeRRpvsFMYdBNETEtHfcMB5r6bN33xPmehruCX26dsjOMFhfawZ6JVF?=
 =?us-ascii?Q?8IM9is+9ncPJcjqvn6AbBFJWeAh+NbppZmpif+vYZIzWjxEynpGViq45+ZDx?=
 =?us-ascii?Q?u+JmdnNIsDpGaN3wUpvkwzhzNYRDNVY6NcKfjTcNrLiT7X/JvBlJbnl5Jyxw?=
 =?us-ascii?Q?n+CbDCQfERbi65Td8zuwf97bRpfKYuYmMSHTF9VTWgF4O2yXBToFiA8pwRLT?=
 =?us-ascii?Q?QJQoBbjjQAe2Ku/LlJHkukjt4cMFYSeZ0bM/QorQ4uC5ijClgr1MBuBvnUrI?=
 =?us-ascii?Q?YJJZmQ5yUDm6MOSPdn7hI3X4RU2dv64SIbfihC+YxXtKpRRV8qr6P/xbZpc/?=
 =?us-ascii?Q?NcFrfE4F+d5myDWSVqJUoqjOTIrqULekbYdGKgj91kczFNXWq64ocgmV4XFM?=
 =?us-ascii?Q?ntjoVWeXcN5NEm0qRfA4YXygkMVxlig4FH81CDSjjLwub0KlFVb8aawnHGSI?=
 =?us-ascii?Q?lSwOmVAK8pqYblEut9mARiyfHkksvqrHo1vjZN4BpjVgxhI8St7UpYENte9Q?=
 =?us-ascii?Q?nsnBqViEZlVcancicRNZtYwyjmADGH4uuYY+01Yu9Mn+8jIAn429G9Y96G6t?=
 =?us-ascii?Q?V5maZLdyA/CTxxciZrmV0kLgcXzbHti8yD74lq/Uudb0evXrfUM9V9gYrtd2?=
 =?us-ascii?Q?LYWQ/rLP0ddArTqUYAsTwMt4VE0vRKIQVOBA6otvrtI1vitLbXTd5CzpMkMV?=
 =?us-ascii?Q?ck1xRxKcH197ANtsMmdArPreUpq12dSUqVJZzuZYZXHCqyOXUUi1n9EkIraL?=
 =?us-ascii?Q?T2v15et51HPNozYT6y/l4iS+iMjO5yJC2MNhNk1E9d66ZfIhG1Dy9ApNCeUP?=
 =?us-ascii?Q?59Jdh/VikH5NnB0MuAwHDjhBePQ9ygF8DQyDWIYCoNOswQIaL7BjzHV9joAp?=
 =?us-ascii?Q?OxosV/Muwux8MUmdL6etTndr2Lus93LolPtRL8STaDvB31T4rixVM8vuKYyl?=
 =?us-ascii?Q?3jBSyI/fgBm83OErn9JmYJkA0iTiUmezmpNf8fmtKRfg3Vb6tGaP0ofZurC8?=
 =?us-ascii?Q?X87XBsp1gli/L9zUOy5DqEGaJhfFvD/ovOyDgvN7KVFJgEfJI5mByv2nOc1O?=
 =?us-ascii?Q?ziqnEK4Mm100LqrqQ8fyAIxVumgr2jSpoXypFeUybSlwOBo5S3FFqeV+2oMa?=
 =?us-ascii?Q?7+tiJ/KtTC4+FXiRmgbrYTxS6niCM/AwpCTWFjKLcjbqbUKi5deyf4ae+iZ3?=
 =?us-ascii?Q?JhdvLUaIZYDW2L0slnvNcyjK0xHTDch5YuA+NKzlRuPP2lFrKSDu1B6sOfzG?=
 =?us-ascii?Q?dWGTh3bLIacijeuO9gGJXlEU/ir0zaHKD0yz6k7V3ot84S1kMAIRUkPCqXUc?=
 =?us-ascii?Q?+5BPttKMqzvvAhI+hu+//et0UTxAACppO8Ago3HwQyHBjBp9w53eKVCavme0?=
 =?us-ascii?Q?3mJOHOHCiiYFXmEoh183Q1tchJJoGThGdA8Ma19nfAqlC/+TuHqxKTcb3cZW?=
 =?us-ascii?Q?yI9z+Hmdo7faLZ2fDdufymA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR04MB8948.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(7416014)(376014)(19092799006)(1800799024)(366016)(38350700014)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DNkHCP4NOcZRZBnZxljIjujN7yz4/lOcsaWMc/x9zHM4gXccRsRbh6t8eMZS?=
 =?us-ascii?Q?sufjvJQNyWSRBsU32XuLxRdCaOptdw8RB5b7qB+xbvENMedKxbQrC7lBjy8e?=
 =?us-ascii?Q?n54Q5fdVxmLEVavuFaL0JU25nd6UpsRqBBYyHD45zmwczwrOIy66/IuWfXzS?=
 =?us-ascii?Q?CeGL9MkIlOSm4WlxjaJYgJIhdvDbkNPXNAMKyJxJ+Sf/aNVB6sT93GQHGR9I?=
 =?us-ascii?Q?JcwXsvM6kwRug3g+QGlKJwSEuYwHexCbkl8bgrx7DCZqMOCJbRTpTwemSyK3?=
 =?us-ascii?Q?vQSgAkUFLM5eHHFLS0ArE+20DXHgO9aWMYHtoETVeT5j5cCI4G+6zED23yfR?=
 =?us-ascii?Q?HSIBA8Fst2jproViMFxhwTJJmS7RMPq6wI8KDSy8Gx69XY8qgRngpEACLTsP?=
 =?us-ascii?Q?hfVoisuBU2RqBE+OxTx1/KQKK0l6V2Huhunsb0r0wNC8MAz7sNTkk0RcJXTn?=
 =?us-ascii?Q?44yX4gbc5YWR2Zixw7jSkHowBes9XXVX8/ckcVoXbHwRSUj7vEj/Bj/XU1y5?=
 =?us-ascii?Q?zIRkXkzh/jMTZ8PMNC480YWeWdZScr8xm07GR4K1wGthQODN+Fk6+qrJA0D7?=
 =?us-ascii?Q?k+yhtgimy25GzVl+0m88LSJLUNLZltmQd9zGv+V4BHKoEOEleYCQkuLh7T2Q?=
 =?us-ascii?Q?dFv2xBfaE1pUsD6cX9pfaT6o9yPkTWiIM2rk7v5XpKBUBZ8pgPzbAZfNjLS9?=
 =?us-ascii?Q?UuAK9zP6GuGx/oaTSnxwgyKrUbTWynn/CCQ5QHVtO89hWVZJ/ajXvWcdEd+r?=
 =?us-ascii?Q?R+0UtLhTcped+PNjhNbXA+ZOjclGI3caZBZxMfGcXFud1rYsArZ93EjIIeYP?=
 =?us-ascii?Q?7VJVMfZaLiKXLOLOH5hbhBJ5kiqySlLwpOcBQtMJlWik9U/nlHFaFlyxGRm3?=
 =?us-ascii?Q?wcX1qnDDgK8gn0Czdo5Exto5snajv8LxWnVBM7v/Y0/mFAUd4qYyKkHu49rM?=
 =?us-ascii?Q?ZooFMMIA+ChV18NJn3LRySSry6HRr+davv6wgYi58G9RP5EfN5A8030yrSFd?=
 =?us-ascii?Q?TjVsrjSOstoLQ0eNC1fdr8QMNRCNn3WoSCGb3wKUrnxM9Pc6bCQoZtpHy+tT?=
 =?us-ascii?Q?LRlI7V33ZDdD4UXGmhzJQqj7hMAqKRyEyX9S07+gWwrHmgvjYqi38njdEiKv?=
 =?us-ascii?Q?ivYnnhOu2kc7OhOM36Z1u0EML7vP3hlx4c6o4CFECiZsFRnbmdbCzp/7hdSJ?=
 =?us-ascii?Q?2LIL0qLBSP93Aif4QQdSxWhbM9g+Ia7OeUxBdlD7ZjZSVZWUzB7qFHLuCSIC?=
 =?us-ascii?Q?iASCMizPv0iCNIZj2MMqThUJZULat48xVsBDyXvbtHchL9orvE9v/IyLFD+9?=
 =?us-ascii?Q?tRUyLajCURlaKjuY54TXBHa95R28UbjnoRD5XYw/OuEmB14e4Rmb4Lgatj9Y?=
 =?us-ascii?Q?ViBBuNWBcqrsCwWnGeOE5DO2gXX0StGP9NqF34KfUV9XL13GB/Bk5KZLOeqh?=
 =?us-ascii?Q?u7x7PP5Y0zThQPPzWkxcTf/upG0mS3AZqjLQ1I51G6O+yDeX2e30lt4ZLVeW?=
 =?us-ascii?Q?QtRBJkhq6AJvKFvKUTAxxHiRr6CE3YcHMzALglxMtTkQ5p8oAG443gT0C9pB?=
 =?us-ascii?Q?RuqsEzYw06HnhWTi5qqv1YdbxLDCjGYe85yZCdljKOTuoRAKfu3MB9p+VgfL?=
 =?us-ascii?Q?DV+mule3ojw7MwyysCFOV+u5lC5v1crXb9MDgg3Xzk1WwbwrxPkgBhe2TJSw?=
 =?us-ascii?Q?YG5SqzL30I59MbI+XJpi9JwGSBwqSJAXp7ZNSvulL/+YniVE9ensBzE9LC+O?=
 =?us-ascii?Q?075y4UTsUw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 629ee763-107f-41ab-90c2-08de538070d1
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8948.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 15:20:25.0378 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5i2KsnxGBSQei79KClrP2YnwaQpNJfccOalz5ZGbRR/Iyy/UiAqxxnGSngtKmT9kaIWFWc2/vdp3Xwcdxug/Jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA3PR04MB11201
Cc: imx@lists.linux.dev, vigneshr@ti.com, geert+renesas@glider.be,
 linux-pci@vger.kernel.org, lpieralisi@kernel.org, christian.bruel@foss.st.com,
 minghuan.Lian@nxp.com, thierry.reding@gmail.com, festevam@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, marek.vasut+renesas@gmail.com,
 kishon@kernel.org, robh@kernel.org, jesper.nilsson@axis.com,
 hayashi.kunihiko@socionext.com, jirislaby@kernel.org, magnus.damm@gmail.com,
 linux-arm-kernel@axis.com, jonathanh@nvidia.com,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 18255117159@163.com, s-vadapalli@ti.com, kwilczynski@kernel.org,
 shawn.lin@rock-chips.com, srikanth.thokala@intel.com, hongxing.zhu@nxp.com,
 mcoquelin.stm32@gmail.com, mani@kernel.org, linux-arm-msm@vger.kernel.org,
 s.hauer@pengutronix.de, linuxppc-dev@lists.ozlabs.org, bhelgaas@google.com,
 linux-omap@vger.kernel.org, rongqianfeng@vivo.com, mingkai.hu@nxp.com,
 roy.zang@nxp.com, linux-tegra@vger.kernel.org, cassel@kernel.org,
 linux.amoon@gmail.com, jingoohan1@gmail.com, yoshihiro.shimoda.uh@renesas.com,
 heiko@sntech.de, linux-kernel@vger.kernel.org, vidyas@nvidia.com,
 linux-renesas-soc@vger.kernel.org, mhiramat@kernel.org, kernel@pengutronix.de,
 shawnguo@kernel.org, nicolas.frattaroli@collabora.com, l.stach@pengutronix.de
Subject: Re: [Linux-stm32] [PATCH v7 3/6] PCI: dwc: Allow glue drivers to
 return mutable EPC features
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

On Wed, Jan 14, 2026 at 12:29:00PM +0900, Koichiro Den wrote:
> On Tue, Jan 13, 2026 at 03:38:45PM -0500, Frank Li wrote:
> > On Wed, Jan 14, 2026 at 01:27:16AM +0900, Koichiro Den wrote:
> > > The DesignWare EP midlayer needs to advertise additional capabilities at
> > > the DWC layer (e.g. subrange_mapping) without duplicating the same bit
> > > in every DWC-based glue driver and without copying feature structures.
> > >
> > > Change dw_pcie_ep_ops.get_features() to return a mutable
> > > struct pci_epc_features * and update all DWC-based glue drivers
> > > accordingly. The DWC midlayer can then adjust/augment the returned
> > > features while still exposing a const struct pci_epc_features * to the
> > > PCI EPC core.
> > >
> > > No functional change on its own.
> > >
> > > Suggested-by: Niklas Cassel <cassel@kernel.org>
> > > Reviewed-by: Niklas Cassel <cassel@kernel.org>
> > > Signed-off-by: Koichiro Den <den@valinux.co.jp>
> > > ---
> > >  drivers/pci/controller/dwc/pci-dra7xx.c       |  4 +-
> > >  drivers/pci/controller/dwc/pci-imx6.c         | 10 ++--
> > >  drivers/pci/controller/dwc/pci-keystone.c     |  4 +-
> > >  .../pci/controller/dwc/pci-layerscape-ep.c    |  2 +-
> > >  drivers/pci/controller/dwc/pcie-artpec6.c     |  4 +-
> > >  .../pci/controller/dwc/pcie-designware-plat.c |  4 +-
> > >  drivers/pci/controller/dwc/pcie-designware.h  |  2 +-
> > >  drivers/pci/controller/dwc/pcie-dw-rockchip.c |  8 +--
> > >  drivers/pci/controller/dwc/pcie-keembay.c     |  4 +-
> > >  drivers/pci/controller/dwc/pcie-qcom-ep.c     |  4 +-
> > >  drivers/pci/controller/dwc/pcie-rcar-gen4.c   |  4 +-
> > >  drivers/pci/controller/dwc/pcie-stm32-ep.c    |  4 +-
> > >  drivers/pci/controller/dwc/pcie-tegra194.c    |  4 +-
> > >  drivers/pci/controller/dwc/pcie-uniphier-ep.c | 58 ++++++++++---------
> > >  14 files changed, 60 insertions(+), 56 deletions(-)
> > >
> > > diff --git a/drivers/pci/controller/dwc/pci-dra7xx.c b/drivers/pci/controller/dwc/pci-dra7xx.c
> > > index 01cfd9aeb0b8..e67f8b7b56cb 100644
> > > --- a/drivers/pci/controller/dwc/pci-dra7xx.c
> > > +++ b/drivers/pci/controller/dwc/pci-dra7xx.c
> > > @@ -423,12 +423,12 @@ static int dra7xx_pcie_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
> > >  	return 0;
> > >  }
> > >
> > > -static const struct pci_epc_features dra7xx_pcie_epc_features = {
> > > +static struct pci_epc_features dra7xx_pcie_epc_features = {
> > >  	.linkup_notifier = true,
> > >  	.msi_capable = true,
> > >  };
> > >
> > > -static const struct pci_epc_features*
> > > +static struct pci_epc_features*
> > >  dra7xx_pcie_get_features(struct dw_pcie_ep *ep)
> > >  {
> > >  	return &dra7xx_pcie_epc_features;
> > > diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> > > index 4668fc9648bf..fe1de30b3df6 100644
> > > --- a/drivers/pci/controller/dwc/pci-imx6.c
> > > +++ b/drivers/pci/controller/dwc/pci-imx6.c
> > > @@ -131,7 +131,7 @@ struct imx_pcie_drvdata {
> > >  	const u32 ltssm_mask;
> > >  	const u32 mode_off[IMX_PCIE_MAX_INSTANCES];
> > >  	const u32 mode_mask[IMX_PCIE_MAX_INSTANCES];
> > > -	const struct pci_epc_features *epc_features;
> > > +	struct pci_epc_features *epc_features;
> > >  	int (*init_phy)(struct imx_pcie *pcie);
> > >  	int (*enable_ref_clk)(struct imx_pcie *pcie, bool enable);
> > >  	int (*core_reset)(struct imx_pcie *pcie, bool assert);
> > > @@ -1386,7 +1386,7 @@ static int imx_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
> > >  	return 0;
> > >  }
> > >
> > > -static const struct pci_epc_features imx8m_pcie_epc_features = {
> > > +static struct pci_epc_features imx8m_pcie_epc_features = {
> > >  	.msi_capable = true,
> > >  	.bar[BAR_1] = { .type = BAR_RESERVED, },
> > >  	.bar[BAR_3] = { .type = BAR_RESERVED, },
> > > @@ -1395,7 +1395,7 @@ static const struct pci_epc_features imx8m_pcie_epc_features = {
> > >  	.align = SZ_64K,
> > >  };
> > >
> > > -static const struct pci_epc_features imx8q_pcie_epc_features = {
> > > +static struct pci_epc_features imx8q_pcie_epc_features = {
> >
> > Is it more simple if
> > #define DWC_EPC_DEFAULT	.dynamtic_map = true
> >
> > Add
> > 	DWC_EPC_DEFAULT, into every epc_features.
>
> One corner case is that pci-layerscape-ep.c builds the pci_epc_features

It is our old platform. I checked code, it should be wrong. features should
report EPC hardware capibility.

> dynamically in ls_pcie_ep_init(), rather than providing a static definition
> with an initializer. I think setting (ie. overriding) the bit centrally in
> dw_pcie_ep_get_features() keeps things simpler.

In case one of chip have bugs, which need remove .dynamtic_map.
DWC_EPC_DEFAULT will be simple.

Frank
>
> Thanks,
> Koichiro
>
> >
> >
> > Frank
> >
> > >  	.msi_capable = true,
> > >  	.bar[BAR_1] = { .type = BAR_RESERVED, },
> > >  	.bar[BAR_3] = { .type = BAR_RESERVED, },
> > > @@ -1415,13 +1415,13 @@ static const struct pci_epc_features imx8q_pcie_epc_features = {
> > >   * BAR4	| Enable   | 32-bit  |  1 MB   | Programmable Size
> > >   * BAR5	| Enable   | 32-bit  | 64 KB   | Programmable Size
> > >   */
> > > -static const struct pci_epc_features imx95_pcie_epc_features = {
> > > +static struct pci_epc_features imx95_pcie_epc_features = {
> > >  	.msi_capable = true,
> > >  	.bar[BAR_1] = { .type = BAR_FIXED, .fixed_size = SZ_64K, },
> > >  	.align = SZ_4K,
> > >  };
> > >
> > > -static const struct pci_epc_features*
> > > +static struct pci_epc_features*
> > >  imx_pcie_ep_get_features(struct dw_pcie_ep *ep)
> > >  {
> > >  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> > > diff --git a/drivers/pci/controller/dwc/pci-keystone.c b/drivers/pci/controller/dwc/pci-keystone.c
> > > index f86d9111f863..4292007a9b3a 100644
> > > --- a/drivers/pci/controller/dwc/pci-keystone.c
> > > +++ b/drivers/pci/controller/dwc/pci-keystone.c
> > > @@ -929,7 +929,7 @@ static int ks_pcie_am654_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
> > >  	return 0;
> > >  }
> > >
> > > -static const struct pci_epc_features ks_pcie_am654_epc_features = {
> > > +static struct pci_epc_features ks_pcie_am654_epc_features = {
> > >  	.msi_capable = true,
> > >  	.msix_capable = true,
> > >  	.bar[BAR_0] = { .type = BAR_RESERVED, },
> > > @@ -941,7 +941,7 @@ static const struct pci_epc_features ks_pcie_am654_epc_features = {
> > >  	.align = SZ_64K,
> > >  };
> > >
> > > -static const struct pci_epc_features*
> > > +static struct pci_epc_features*
> > >  ks_pcie_am654_get_features(struct dw_pcie_ep *ep)
> > >  {
> > >  	return &ks_pcie_am654_epc_features;
> > > diff --git a/drivers/pci/controller/dwc/pci-layerscape-ep.c b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> > > index a4a800699f89..8d48413050ef 100644
> > > --- a/drivers/pci/controller/dwc/pci-layerscape-ep.c
> > > +++ b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> > > @@ -138,7 +138,7 @@ static int ls_pcie_ep_interrupt_init(struct ls_pcie_ep *pcie,
> > >  	return 0;
> > >  }
> > >
> > > -static const struct pci_epc_features*
> > > +static struct pci_epc_features*
> > >  ls_pcie_ep_get_features(struct dw_pcie_ep *ep)
> > >  {
> > >  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> > > diff --git a/drivers/pci/controller/dwc/pcie-artpec6.c b/drivers/pci/controller/dwc/pcie-artpec6.c
> > > index f4a136ee2daf..84111d8257f2 100644
> > > --- a/drivers/pci/controller/dwc/pcie-artpec6.c
> > > +++ b/drivers/pci/controller/dwc/pcie-artpec6.c
> > > @@ -369,11 +369,11 @@ static int artpec6_pcie_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
> > >  	return 0;
> > >  }
> > >
> > > -static const struct pci_epc_features artpec6_pcie_epc_features = {
> > > +static struct pci_epc_features artpec6_pcie_epc_features = {
> > >  	.msi_capable = true,
> > >  };
> > >
> > > -static const struct pci_epc_features *
> > > +static struct pci_epc_features *
> > >  artpec6_pcie_get_features(struct dw_pcie_ep *ep)
> > >  {
> > >  	return &artpec6_pcie_epc_features;
> > > diff --git a/drivers/pci/controller/dwc/pcie-designware-plat.c b/drivers/pci/controller/dwc/pcie-designware-plat.c
> > > index 12f41886c65d..60ada0eb838e 100644
> > > --- a/drivers/pci/controller/dwc/pcie-designware-plat.c
> > > +++ b/drivers/pci/controller/dwc/pcie-designware-plat.c
> > > @@ -60,12 +60,12 @@ static int dw_plat_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
> > >  	return 0;
> > >  }
> > >
> > > -static const struct pci_epc_features dw_plat_pcie_epc_features = {
> > > +static struct pci_epc_features dw_plat_pcie_epc_features = {
> > >  	.msi_capable = true,
> > >  	.msix_capable = true,
> > >  };
> > >
> > > -static const struct pci_epc_features*
> > > +static struct pci_epc_features*
> > >  dw_plat_pcie_get_features(struct dw_pcie_ep *ep)
> > >  {
> > >  	return &dw_plat_pcie_epc_features;
> > > diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
> > > index f87c67a7a482..4dda9a38d46b 100644
> > > --- a/drivers/pci/controller/dwc/pcie-designware.h
> > > +++ b/drivers/pci/controller/dwc/pcie-designware.h
> > > @@ -449,7 +449,7 @@ struct dw_pcie_ep_ops {
> > >  	void	(*init)(struct dw_pcie_ep *ep);
> > >  	int	(*raise_irq)(struct dw_pcie_ep *ep, u8 func_no,
> > >  			     unsigned int type, u16 interrupt_num);
> > > -	const struct pci_epc_features* (*get_features)(struct dw_pcie_ep *ep);
> > > +	struct pci_epc_features* (*get_features)(struct dw_pcie_ep *ep);
> > >  	/*
> > >  	 * Provide a method to implement the different func config space
> > >  	 * access for different platform, if different func have different
> > > diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> > > index 352f513ebf03..1f3c91368dc3 100644
> > > --- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> > > +++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> > > @@ -100,7 +100,7 @@ struct rockchip_pcie {
> > >
> > >  struct rockchip_pcie_of_data {
> > >  	enum dw_pcie_device_mode mode;
> > > -	const struct pci_epc_features *epc_features;
> > > +	struct pci_epc_features *epc_features;
> > >  };
> > >
> > >  static int rockchip_pcie_readl_apb(struct rockchip_pcie *rockchip, u32 reg)
> > > @@ -383,7 +383,7 @@ static int rockchip_pcie_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
> > >  	return 0;
> > >  }
> > >
> > > -static const struct pci_epc_features rockchip_pcie_epc_features_rk3568 = {
> > > +static struct pci_epc_features rockchip_pcie_epc_features_rk3568 = {
> > >  	.linkup_notifier = true,
> > >  	.msi_capable = true,
> > >  	.msix_capable = true,
> > > @@ -403,7 +403,7 @@ static const struct pci_epc_features rockchip_pcie_epc_features_rk3568 = {
> > >   * default.) If the host could write to BAR4, the iATU settings (for all other
> > >   * BARs) would be overwritten, resulting in (all other BARs) no longer working.
> > >   */
> > > -static const struct pci_epc_features rockchip_pcie_epc_features_rk3588 = {
> > > +static struct pci_epc_features rockchip_pcie_epc_features_rk3588 = {
> > >  	.linkup_notifier = true,
> > >  	.msi_capable = true,
> > >  	.msix_capable = true,
> > > @@ -416,7 +416,7 @@ static const struct pci_epc_features rockchip_pcie_epc_features_rk3588 = {
> > >  	.bar[BAR_5] = { .type = BAR_RESIZABLE, },
> > >  };
> > >
> > > -static const struct pci_epc_features *
> > > +static struct pci_epc_features *
> > >  rockchip_pcie_get_features(struct dw_pcie_ep *ep)
> > >  {
> > >  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> > > diff --git a/drivers/pci/controller/dwc/pcie-keembay.c b/drivers/pci/controller/dwc/pcie-keembay.c
> > > index 60e74ac782af..e6de5289329f 100644
> > > --- a/drivers/pci/controller/dwc/pcie-keembay.c
> > > +++ b/drivers/pci/controller/dwc/pcie-keembay.c
> > > @@ -308,7 +308,7 @@ static int keembay_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
> > >  	}
> > >  }
> > >
> > > -static const struct pci_epc_features keembay_pcie_epc_features = {
> > > +static struct pci_epc_features keembay_pcie_epc_features = {
> > >  	.msi_capable		= true,
> > >  	.msix_capable		= true,
> > >  	.bar[BAR_0]		= { .only_64bit = true, },
> > > @@ -320,7 +320,7 @@ static const struct pci_epc_features keembay_pcie_epc_features = {
> > >  	.align			= SZ_16K,
> > >  };
> > >
> > > -static const struct pci_epc_features *
> > > +static struct pci_epc_features *
> > >  keembay_pcie_get_features(struct dw_pcie_ep *ep)
> > >  {
> > >  	return &keembay_pcie_epc_features;
> > > diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
> > > index f1bc0ac81a92..6ad033301909 100644
> > > --- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
> > > +++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
> > > @@ -819,7 +819,7 @@ static void qcom_pcie_ep_init_debugfs(struct qcom_pcie_ep *pcie_ep)
> > >  				    qcom_pcie_ep_link_transition_count);
> > >  }
> > >
> > > -static const struct pci_epc_features qcom_pcie_epc_features = {
> > > +static struct pci_epc_features qcom_pcie_epc_features = {
> > >  	.linkup_notifier = true,
> > >  	.msi_capable = true,
> > >  	.align = SZ_4K,
> > > @@ -829,7 +829,7 @@ static const struct pci_epc_features qcom_pcie_epc_features = {
> > >  	.bar[BAR_3] = { .type = BAR_RESERVED, },
> > >  };
> > >
> > > -static const struct pci_epc_features *
> > > +static struct pci_epc_features *
> > >  qcom_pcie_epc_get_features(struct dw_pcie_ep *pci_ep)
> > >  {
> > >  	return &qcom_pcie_epc_features;
> > > diff --git a/drivers/pci/controller/dwc/pcie-rcar-gen4.c b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> > > index 80778917d2dd..ff0c4af90eff 100644
> > > --- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> > > +++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> > > @@ -419,7 +419,7 @@ static int rcar_gen4_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
> > >  	return 0;
> > >  }
> > >
> > > -static const struct pci_epc_features rcar_gen4_pcie_epc_features = {
> > > +static struct pci_epc_features rcar_gen4_pcie_epc_features = {
> > >  	.msi_capable = true,
> > >  	.bar[BAR_1] = { .type = BAR_RESERVED, },
> > >  	.bar[BAR_3] = { .type = BAR_RESERVED, },
> > > @@ -428,7 +428,7 @@ static const struct pci_epc_features rcar_gen4_pcie_epc_features = {
> > >  	.align = SZ_1M,
> > >  };
> > >
> > > -static const struct pci_epc_features*
> > > +static struct pci_epc_features*
> > >  rcar_gen4_pcie_ep_get_features(struct dw_pcie_ep *ep)
> > >  {
> > >  	return &rcar_gen4_pcie_epc_features;
> > > diff --git a/drivers/pci/controller/dwc/pcie-stm32-ep.c b/drivers/pci/controller/dwc/pcie-stm32-ep.c
> > > index 2cecf32d2b0f..8a892def54f5 100644
> > > --- a/drivers/pci/controller/dwc/pcie-stm32-ep.c
> > > +++ b/drivers/pci/controller/dwc/pcie-stm32-ep.c
> > > @@ -69,12 +69,12 @@ static int stm32_pcie_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
> > >  	}
> > >  }
> > >
> > > -static const struct pci_epc_features stm32_pcie_epc_features = {
> > > +static struct pci_epc_features stm32_pcie_epc_features = {
> > >  	.msi_capable = true,
> > >  	.align = SZ_64K,
> > >  };
> > >
> > > -static const struct pci_epc_features*
> > > +static struct pci_epc_features*
> > >  stm32_pcie_get_features(struct dw_pcie_ep *ep)
> > >  {
> > >  	return &stm32_pcie_epc_features;
> > > diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
> > > index 0ddeef70726d..06f45a17e52c 100644
> > > --- a/drivers/pci/controller/dwc/pcie-tegra194.c
> > > +++ b/drivers/pci/controller/dwc/pcie-tegra194.c
> > > @@ -1987,7 +1987,7 @@ static int tegra_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
> > >  	return 0;
> > >  }
> > >
> > > -static const struct pci_epc_features tegra_pcie_epc_features = {
> > > +static struct pci_epc_features tegra_pcie_epc_features = {
> > >  	.linkup_notifier = true,
> > >  	.msi_capable = true,
> > >  	.bar[BAR_0] = { .type = BAR_FIXED, .fixed_size = SZ_1M,
> > > @@ -2000,7 +2000,7 @@ static const struct pci_epc_features tegra_pcie_epc_features = {
> > >  	.align = SZ_64K,
> > >  };
> > >
> > > -static const struct pci_epc_features*
> > > +static struct pci_epc_features*
> > >  tegra_pcie_ep_get_features(struct dw_pcie_ep *ep)
> > >  {
> > >  	return &tegra_pcie_epc_features;
> > > diff --git a/drivers/pci/controller/dwc/pcie-uniphier-ep.c b/drivers/pci/controller/dwc/pcie-uniphier-ep.c
> > > index d6e73811216e..ddb5ff70340c 100644
> > > --- a/drivers/pci/controller/dwc/pcie-uniphier-ep.c
> > > +++ b/drivers/pci/controller/dwc/pcie-uniphier-ep.c
> > > @@ -82,7 +82,7 @@ struct uniphier_pcie_ep_soc_data {
> > >  	bool has_gio;
> > >  	void (*init)(struct uniphier_pcie_ep_priv *priv);
> > >  	int (*wait)(struct uniphier_pcie_ep_priv *priv);
> > > -	const struct pci_epc_features features;
> > > +	struct pci_epc_features *features;
> > >  };
> > >
> > >  #define to_uniphier_pcie(x)	dev_get_drvdata((x)->dev)
> > > @@ -273,13 +273,13 @@ static int uniphier_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
> > >  	return 0;
> > >  }
> > >
> > > -static const struct pci_epc_features*
> > > +static struct pci_epc_features*
> > >  uniphier_pcie_get_features(struct dw_pcie_ep *ep)
> > >  {
> > >  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> > >  	struct uniphier_pcie_ep_priv *priv = to_uniphier_pcie(pci);
> > >
> > > -	return &priv->data->features;
> > > +	return priv->data->features;
> > >  }
> > >
> > >  static const struct dw_pcie_ep_ops uniphier_pcie_ep_ops = {
> > > @@ -415,40 +415,44 @@ static int uniphier_pcie_ep_probe(struct platform_device *pdev)
> > >  	return 0;
> > >  }
> > >
> > > +static struct pci_epc_features uniphier_pro5_features = {
> > > +	.linkup_notifier = false,
> > > +	.msi_capable = true,
> > > +	.msix_capable = false,
> > > +	.align = 1 << 16,
> > > +	.bar[BAR_0] = { .only_64bit = true, },
> > > +	.bar[BAR_1] = { .type = BAR_RESERVED, },
> > > +	.bar[BAR_2] = { .only_64bit = true, },
> > > +	.bar[BAR_3] = { .type = BAR_RESERVED, },
> > > +	.bar[BAR_4] = { .type = BAR_RESERVED, },
> > > +	.bar[BAR_5] = { .type = BAR_RESERVED, },
> > > +};
> > > +
> > > +static struct pci_epc_features uniphier_nx1_features = {
> > > +	.linkup_notifier = false,
> > > +	.msi_capable = true,
> > > +	.msix_capable = false,
> > > +	.align = 1 << 12,
> > > +	.bar[BAR_0] = { .only_64bit = true, },
> > > +	.bar[BAR_1] = { .type = BAR_RESERVED, },
> > > +	.bar[BAR_2] = { .only_64bit = true, },
> > > +	.bar[BAR_3] = { .type = BAR_RESERVED, },
> > > +	.bar[BAR_4] = { .only_64bit = true, },
> > > +	.bar[BAR_5] = { .type = BAR_RESERVED, },
> > > +};
> > > +
> > >  static const struct uniphier_pcie_ep_soc_data uniphier_pro5_data = {
> > >  	.has_gio = true,
> > >  	.init = uniphier_pcie_pro5_init_ep,
> > >  	.wait = NULL,
> > > -	.features = {
> > > -		.linkup_notifier = false,
> > > -		.msi_capable = true,
> > > -		.msix_capable = false,
> > > -		.align = 1 << 16,
> > > -		.bar[BAR_0] = { .only_64bit = true, },
> > > -		.bar[BAR_1] = { .type = BAR_RESERVED, },
> > > -		.bar[BAR_2] = { .only_64bit = true, },
> > > -		.bar[BAR_3] = { .type = BAR_RESERVED, },
> > > -		.bar[BAR_4] = { .type = BAR_RESERVED, },
> > > -		.bar[BAR_5] = { .type = BAR_RESERVED, },
> > > -	},
> > > +	.features = &uniphier_pro5_features,
> > >  };
> > >
> > >  static const struct uniphier_pcie_ep_soc_data uniphier_nx1_data = {
> > >  	.has_gio = false,
> > >  	.init = uniphier_pcie_nx1_init_ep,
> > >  	.wait = uniphier_pcie_nx1_wait_ep,
> > > -	.features = {
> > > -		.linkup_notifier = false,
> > > -		.msi_capable = true,
> > > -		.msix_capable = false,
> > > -		.align = 1 << 12,
> > > -		.bar[BAR_0] = { .only_64bit = true, },
> > > -		.bar[BAR_1] = { .type = BAR_RESERVED, },
> > > -		.bar[BAR_2] = { .only_64bit = true, },
> > > -		.bar[BAR_3] = { .type = BAR_RESERVED, },
> > > -		.bar[BAR_4] = { .only_64bit = true, },
> > > -		.bar[BAR_5] = { .type = BAR_RESERVED, },
> > > -	},
> > > +	.features = &uniphier_nx1_features,
> > >  };
> > >
> > >  static const struct of_device_id uniphier_pcie_ep_match[] = {
> > > --
> > > 2.51.0
> > >
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
