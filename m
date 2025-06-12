Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 15775AD6B59
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Jun 2025 10:49:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C9C96C36B24;
	Thu, 12 Jun 2025 08:49:51 +0000 (UTC)
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E0DC7C36B1E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Jun 2025 08:49:50 +0000 (UTC)
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55C5a2vm001079;
 Thu, 12 Jun 2025 03:48:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=PODMain02222019; bh=Mp6wAFt2Iu0N/IFXUq
 gfrt9eZl/zWHCCsWhPrJjoqoU=; b=fAf7by06bEsAT3M7A/2gkS6m/YRvHt+mvq
 y+BF7aGL/WCbf02t+7cJYfp7TDhcYNWcdYhgCpv12rFB8n24XWhQNXp1plrOz4Sl
 6LFexsmWeHWUZVNOPVnx4lWw9E1tRpze5KBf/xW2yk34erPaXqkzghX6hfsrZTKe
 Gb8u2rXiM+MKS+HJtO+SamvYpsI1dw19mZv/mcrULo/h3SfuL0Z7cqDSqcLHGbQd
 LXC1t8/PV46lSuKHk8BsW7ATWrXyLw25Kpg2OdF940W33swBmuNgZGGRx+IyqNU4
 98dpsiXELapCi5m4fEqMUxKVuqJ8IU5r/b9rGFq6VbNYcZ7nva7w==
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11hn2210.outbound.protection.outlook.com [52.100.172.210])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 476ksdbhh6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Jun 2025 03:48:59 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ohnJR3sdTe7zeE0S0f6C6zShs7r0hUfEtn9Hx0gsvZ4kL4ABfmAJqmFYOu8VMGu6R1Meaag+DnCTCJw9gVybFIu6mA0NC8DMX5+wRO5srUVk3KaPc2zsqErLhW4g6WfQyP9fkjgGB8YYdcFSuGukPN0GLPR1N6gdILpoAeSLLXCcpxOlHMSCIxjguJiPbGUaSQ4yvmf3q1RdpOh2ECGR1MdKtC3vNPukR7rzoTOY96jEfLHQ4DK5cOkzMNo5rtv3BXYtolmkNT3+9cxxq+fwyIsgWFkUTer/r1WQjxn6ucDVTdx5RdzSisiz+Ib2Q3IjGpsFzK3oOYDmqoEqBI2uDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mp6wAFt2Iu0N/IFXUqgfrt9eZl/zWHCCsWhPrJjoqoU=;
 b=d32RYyKsA2gFEUxqyNEE8TJsvICOD2Gaczj7hEJdAcn7EX4qqOE2ebhz3P4YwdzyFTi+l0BCPfBCz7qdBIT0E9mZnnDIvwv/hJXsXPegaT/XMjx9lCzUM65YctvIGiQ3t53FoyPs5/mQA4Ix1StiXNQt2XQ+pnfns43QFPhLZk1bgrNCY4r10E2O0HQFwYfzGnwUpy1G9ydmEcB79QqdW3Yy8NUhH7hVcIg25N+x1jbLlO30thAIJpQj0bv422PxWiN90BGY2LTY46B7kibcQu5+HqZ1FVp73hwJs9HA6vixZ89kQpyO8A2CipGvCXDJU1itIFOkxOevDc5My6jd3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=atomide.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mp6wAFt2Iu0N/IFXUqgfrt9eZl/zWHCCsWhPrJjoqoU=;
 b=i6bGHfJuejK97DVCXKpcwwnG8Ft485dJq9HAI2jL1EnEJ/xcLqpM+iFEF3CERUPgq63/VXF43urOzySrKSRb6BfTehlDyfIoYrn9Ydix/C+YtFpzzOy+vCFsKwHjW+Ffz9QiDfMCEJBnGtrvLf5dfEQixdvX2XtHB6aeZ/xprBM=
Received: from PH0PR07CA0008.namprd07.prod.outlook.com (2603:10b6:510:5::13)
 by SA6PR19MB8594.namprd19.prod.outlook.com (2603:10b6:806:412::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Thu, 12 Jun
 2025 08:48:54 +0000
Received: from CY4PEPF0000E9D0.namprd03.prod.outlook.com
 (2603:10b6:510:5:cafe::ef) by PH0PR07CA0008.outlook.office365.com
 (2603:10b6:510:5::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.21 via Frontend Transport; Thu,
 12 Jun 2025 08:48:54 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000E9D0.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Thu, 12 Jun 2025 08:48:53 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com
 [198.61.86.93])
 by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 324FE406541;
 Thu, 12 Jun 2025 08:48:52 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
 by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 15114820249;
 Thu, 12 Jun 2025 08:48:52 +0000 (UTC)
Date: Thu, 12 Jun 2025 09:48:50 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Message-ID: <aEqUcjZ3q0UcVSSf@opensource.cirrus.com>
References: <20250611104348.192092-1-jirislaby@kernel.org>
 <20250611104348.192092-13-jirislaby@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250611104348.192092-13-jirislaby@kernel.org>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D0:EE_|SA6PR19MB8594:EE_
X-MS-Office365-Filtering-Correlation-Id: 41410a49-d510-4b43-d0bf-08dda98df600
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|34020700016|36860700013|7416014|376014|61400799027|12100799063;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?EflOBUD9AvXV/qaOi93hQwM3TJ6aCqaBvdhPOv1a2VpuCk/iKme+bmU588hV?=
 =?us-ascii?Q?C94yYWEqtyp2MslCfaPOrEWH8HqRx2SfmYT4lIL7KIz0DZUShqKVhqJq/wDI?=
 =?us-ascii?Q?Yy2AVX/+Sw4o0tuB98MKvHwbxxuDOqRuopgNeeoKxd6KcgR54JDj4rsnJzBq?=
 =?us-ascii?Q?Ypv7wkKT8ZMqgOeBTGLQzpZGPVhLOBwlRBf9XNAmwkp+NkRKvWgAqfjxj8zp?=
 =?us-ascii?Q?Y4qOTLwyOjIwuLeNJvQYCIAzWqDRi4zLg3mUbVoBrceWYKCFK9SkUrwxtQFa?=
 =?us-ascii?Q?JfdVFUMKrBikCZW4zMDgIwGsn0qL+qo6Oc0ob3xjH6Iha3X3WmIptafKkBfY?=
 =?us-ascii?Q?E+sYveLRB5Z45wE+KZnVWkAkonbyHTy5/azQ1yb+spL3NyaBDjfCkK9+Iabt?=
 =?us-ascii?Q?AV6PWy0Ojf2CH9MEZurUXe6QI1ARz1adxQbVSLF2sO0msnQZ3/hVvDxbicCB?=
 =?us-ascii?Q?NZCo729IJz4RRKAqpMh4XmHjsSWlgnI482Cvlv39LSU4sBN9F4mIGQwGa+Jd?=
 =?us-ascii?Q?I0FHm8GbC+ZMdAqqBHDh1LRd7sEjzBdKGuLIPM7QvnX1fgfjm5KewjV5Xsl9?=
 =?us-ascii?Q?DrxFzlYSxAU6hktDysQPjqIsnVXq2PHyNY5YxF7mRU89WYCQ2aCWxSuvN3DU?=
 =?us-ascii?Q?DBQW9UaK4jr3hzWe03B1qbOGVNtm499vbXlQ/XIfF/QnKCqkuIkQiDhJMTIk?=
 =?us-ascii?Q?uFTSpCno5PwBQYoByt09Y5qV9UL8FYCbat4/Gz0PpuyxSmXdyaRuqs8iN4+c?=
 =?us-ascii?Q?1D29N0DXBiqHzoexh5Cs2CGJCN3+0g2FdmdY42PALK20/1qXhr4aR9eciR8L?=
 =?us-ascii?Q?sPM1OygbIA8O5d9uj3S/khYlolhflnuiC7bE+YMUyMuJLESfuixi3AYDxsXN?=
 =?us-ascii?Q?UIEGzModC6746vBCP9yYF+Qvwc1thPUxRiJaJtomxExcadoOY83HUIfJLB7o?=
 =?us-ascii?Q?pcJ+2Hq4U3ekOFFJOB7+1Yao4LuQfBBBEznrM/lS6GTtAlzyNM5bSNSDeryI?=
 =?us-ascii?Q?12W2Dkw4A0h8Prt34/ME7JHuOySFM9rvtFhgPLaz5OaQnX8nOmS3PLXKSXBB?=
 =?us-ascii?Q?Rpkg/VXEYG3B3cVt8yqIcstcD/cJLYbKFDHXMHYJLy1bZ6U80LAeYxbFPbCc?=
 =?us-ascii?Q?b8YWzp51/jewrrIYWjL3M+WeLj7Bogh0K/5ENaRnIaoDJ3bqUGOpwyV/oR7y?=
 =?us-ascii?Q?AJMks9ivffMtQL4KVnrp4EvsoChbD/0o8Lz+a8Uz6yBbPRK0xBCBXIe/mw89?=
 =?us-ascii?Q?mymMVZ0aoTskRqPLdmAAbyC4MSZS1PfsABg+GPAUaZo65IDzMtLE4yyqHAlT?=
 =?us-ascii?Q?LUFarRtsIoFMcbKEqfXiXoUwFAiiWamH2972KDAf7TkgryNqlSM72Gx8Kuqu?=
 =?us-ascii?Q?rgPZh6PRBAi6BIRVqeSdOAa2lcmTN8wom0q6VekA0NJ4tDSSMLc2msxhcSXo?=
 =?us-ascii?Q?+PFZpz4yyuIlDnRzJzfCfSn6Qe0j/iXY5bw+bRDnLNcjn3IdREAarsmvoZpr?=
 =?us-ascii?Q?IafLGCXfzo5tRwy6cklAEqVFrkOu7f774s9n?=
X-Forefront-Antispam-Report: CIP:84.19.233.75; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:edirelay1.ad.cirrus.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(13230040)(82310400026)(34020700016)(36860700013)(7416014)(376014)(61400799027)(12100799063);
 DIR:OUT; SFP:1501; 
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 08:48:53.6238 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 41410a49-d510-4b43-d0bf-08dda98df600
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8; Ip=[84.19.233.75];
 Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR19MB8594
X-Proofpoint-GUID: MI1o5d_OcAduM1Cq0ic6z3Ct2T16YFPj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDA2NyBTYWx0ZWRfX3dtSLqtgUovA
 aSKqR1OMT2jEO0IknB+dodUrjfguhdNDEWt5FhI77WrSyTzlcHLXcLM84jCmVpZDUxJkU8pfWIZ
 7GfoaZFZdp22z6jDJJ1B/ofe7Xia8ShuVPnL4Kh9ZY+8uvIF3Dj4a/fcIUC6CYjNnC7RuftK/Y4
 RTzvFcxFElbwBWzTgwXxtGAlIx1nb802NLYZTsnnQr4pW1oJW41JcDHr9Yigd0ss5IcshIP111+
 ZE6/cXwOgKNPMNGeovSsGYtwVshC2j8fN72ICPmx9qiAnbasNzbLb7iW1zaGn/+SSzkj8ZcR2Aq
 o+qws/q/FRZzCmLye2TLhklYcObiXlRpHPllkQV90GYGLjwYENIYoXitO+O7dAR589qJe/jvfZY
 5HWuJLGb8gPzEIz+gBmmxk/fKTDiYaA6SC6TR2SN546LBYig6io/495mb/XXdmu0JM/6GYTI
X-Authority-Analysis: v=2.4 cv=c5OrQQ9l c=1 sm=1 tr=0 ts=684a947b cx=c_pps
 a=KMTg/8RFoxcndjAm0j+8Gg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=VwQbUJbxAAAA:8
 a=w1d2syhTAAAA:8 a=GpktXrwMqSbe8FIqCiwA:9 a=CjuIK1q_8ugA:10
 a=jZz-an6Pvt0H8_Yc_ROU:22
X-Proofpoint-ORIG-GUID: MI1o5d_OcAduM1Cq0ic6z3Ct2T16YFPj
X-Proofpoint-Spam-Reason: safe
Cc: imx@lists.linux.dev, Tony Lindgren <tony@atomide.com>,
 Linus Walleij <linus.walleij@linaro.org>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Kevin Hilman <khilman@baylibre.com>, Lee Jones <lee@kernel.org>,
 Andreas Kemnade <andreas@kemnade.info>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, Roger Quadros <rogerq@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 tglx@linutronix.de, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Subject: Re: [Linux-stm32] [PATCH] mfd: Use dev_fwnode()
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

On Wed, Jun 11, 2025 at 12:43:41PM +0200, Jiri Slaby (SUSE) wrote:
> irq_domain_create_simple() takes fwnode as the first argument. It can be
> extracted from the struct device using dev_fwnode() helper instead of
> using of_node with of_fwnode_handle().
> 
> So use the dev_fwnode() helper.
> 
> Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
> Cc: Lee Jones <lee@kernel.org>
> 
> ---

For wm831x:

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
