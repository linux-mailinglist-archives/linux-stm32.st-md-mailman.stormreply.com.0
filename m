Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5E1A331D5
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Feb 2025 23:01:35 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EA970C78F6D;
	Wed, 12 Feb 2025 22:01:34 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2058.outbound.protection.outlook.com [40.107.104.58])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AFC13C78006
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Feb 2025 22:01:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BcDpOAAwXN6id9lHDtrDPrDGy7JEXDbj1IRfCTGVMpEs5+NbzbqPpriidfG4WHpyKDE5UbJseCjbVU2ef74SH7gkYr9gGkTd7pddgZLQpy1GInbzhxis+RZ2Zle705pMVcwi1mnD5ByUAUutMGpOqaH6cvwz9ycKJb6C7jEUHnKylbdhiZGxypAT1bKQozV1ywXSAl8Lm9oNODCY1Kq6gxvafaRXWJc6Q861d2BXKRQSBehdQwyHDQMJMMKcGKHUQ2Ibk3uQYzqfXV6X6BgckKKGE28dtzKkvKxGIAO0MTbS/YiA7+DVa3ixPgO6mcfgML3d3IaMwWuCSyPLuxD5Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xewWSnNNZqrgRtonI1dOD4M0xFibKRmbLIibf4IZPUo=;
 b=ViL7xLDi37PHNn36G7hq+X0nWhtjborPONjrebVFVIXhFpUpVvwfIv2L/M8DBSlgZM18py72Pu70O+NhnJoGeAQWdTTYBjVzIukYHiO+QvVgp8DiMjDRayfK5p/VEmcpuHiM51ZfAAhoXjnRWTMC0mN8vQ7cdzrapQpnDrRpQWDTH6KZymEyTy2Mo1N2yLIegNRjBzk2TGDxNlp4wAdrG9HzbE9lra1r1Dgljkh6RxBsDqRHNbLJIhvm+9e8iu12XraSxHZ+rB8+Ha6x/7GZ90SE2rMNoCNDKZUJsns049+jWc7VYA7EV/4ctr6nDVZUWFat1n496uUIgDZwTIoeZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xewWSnNNZqrgRtonI1dOD4M0xFibKRmbLIibf4IZPUo=;
 b=DfJgWMyICOGfDSaQPIYEiZFdblABaI6kaMJTDruAML+mxViZ9ck+1oE5hWSX0+HhoS7ZqUERapBA0+II2T5b8zJR5wm/0nlLsXfiYuNNoZ/bNh5VtGr4R6fx/m5HVKuUzX7KWK7np16vf7ubadi2+gRI32LUx7d38u7PQ5XDnzD0ZeE5SNKZJIp9b//RypjKgtVqUPJL1uBbI7V8n2gZbQYgqI2wipPUMEhUckj5v0cbwbzzskKFl6UT13wWy4b0MEoCRCupIoyrFwHQWUoqtXSngMDzDGJM7doLxvhfy7fKxzUG5LqhEgwcJmGcqcm0Cpeyf1BVU1icY6gdJT5ktQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com (2603:10a6:20b:24b::14)
 by PA2PR04MB10239.eurprd04.prod.outlook.com (2603:10a6:102:409::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Wed, 12 Feb
 2025 22:01:26 +0000
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2]) by AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2%6]) with mapi id 15.20.8445.013; Wed, 12 Feb 2025
 22:01:25 +0000
Date: Thu, 13 Feb 2025 00:01:21 +0200
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: Faizal Rahim <faizal.abdul.rahim@linux.intel.com>
Message-ID: <20250212220121.ici3qll66pfoov62@skbuf>
References: <20250210070207.2615418-1-faizal.abdul.rahim@linux.intel.com>
 <20250210070207.2615418-1-faizal.abdul.rahim@linux.intel.com>
Content-Disposition: inline
In-Reply-To: <20250210070207.2615418-1-faizal.abdul.rahim@linux.intel.com>
 <20250210070207.2615418-1-faizal.abdul.rahim@linux.intel.com>
X-ClientProxiedBy: VI1PR08CA0226.eurprd08.prod.outlook.com
 (2603:10a6:802:15::35) To AM8PR04MB7779.eurprd04.prod.outlook.com
 (2603:10a6:20b:24b::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7779:EE_|PA2PR04MB10239:EE_
X-MS-Office365-Filtering-Correlation-Id: 16bf5745-10bf-47b2-b484-08dd4bb0cb1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?SdM3Ce/NNpWirdqqNW9Bn8PZbbUkghL/xvybMJxTe9YsCfztA/KpRzxVAiGQ?=
 =?us-ascii?Q?Pe8t44Fto+ji01cN0e2tZghCRd9aeLDvAjY/plIesm97kYPXJUlj06NfOX9I?=
 =?us-ascii?Q?/RsCNtFUUPCh6HF7XbyXMz/+3vnTV9ZM85HnV6E/7VH/6ZZizycRM/ARFnao?=
 =?us-ascii?Q?M0ZH02bfgYjHOyh/ksW2o+mv5IAdVOy3ARDA5o3e8m7IVvuvBU23g4hgqgQA?=
 =?us-ascii?Q?OXOt6ISgXoCIsHbWS0su+R4hEUgFnsz2Wj5frR0RLmHriJyx0PcGwPPuFVa+?=
 =?us-ascii?Q?qxmsm7ofaxWc/ISmLnHkbddwy1fzkaNzi52dpCI/XLuTdbNSD8M5Y1cUsqSd?=
 =?us-ascii?Q?vLyl5YxPH7uYgY+ll3bl59HsKoaHZld/UUaieOjt7BsT4GKuevJdTg75aQtr?=
 =?us-ascii?Q?dvaCt1jtpXd7w33BsSf/DdqkBQd4MnCnztiWUgB6lzwyHy4IGXthj1hqDG49?=
 =?us-ascii?Q?PZ+gwXaQ40XONgUKdEVuegrNp1tDuGuuoqiYdSr6c0uSn+kfeEeAVrrAshhG?=
 =?us-ascii?Q?XSvmZ8LEagDTwTrMI1cbO8UbJVQM6Cf4snR9JfYFJEpTL4u59qgUfDHhuuVT?=
 =?us-ascii?Q?1+Z79zbjT9kLhDyYq2AMbxfHyMKKCntD3dMxk/Kjw0Hfztbt4l+EO1odTM2s?=
 =?us-ascii?Q?hVR9J4SY6cPkQ/zt5vFlPQDG4cTiRo3rhOj6RxEyrKauM67IzaP5Y3oslksj?=
 =?us-ascii?Q?ZBgxMnC6O13wM6SmYfiws7lC29N6uzPUkw9dsNbHsJbxM9BNnWHIZQE46Agc?=
 =?us-ascii?Q?eFKqyxASFrjATnNVv+BlDDto4joEne6YUFY31lCvT/BskIYlFITReceTPE5b?=
 =?us-ascii?Q?i1q+AZs4qYxLf9hqX8A/RGY3Z+eTVxhwbybhSx4sGnuKAmTwGmj5xuM54CHc?=
 =?us-ascii?Q?ZXfHcvKPL8J6PwY8bFOAjSANJJsZdpUIHR8tcKMR+rofGkcninoPtyp2D6ga?=
 =?us-ascii?Q?IxQyNNV4kGKeAft2t+UgQVD5Wq01j5NtwXpWJSHTcZow0zQUxdrJumD0TLw0?=
 =?us-ascii?Q?SnABPpOl51+VlOL/2YM0VdVWOJ7p/m9ADy9e1JxZgDSjFyqBRhaNnJXE2mGU?=
 =?us-ascii?Q?OWHYDNFIyv4jtmcm8+uPRd6eRZPOil8aHJVmuL/ia+Ivi430ze+ylhucqD0O?=
 =?us-ascii?Q?2Z+tmSc48luKlRbzLvOGIgFa4clMhUk5OtJeEFSWaPs5B+ut6MTyJjXeHlPt?=
 =?us-ascii?Q?T6o+l2rCnbbYwStfWSSVQ27v6ISjvKavYXlS74V4li/Gxf4yEWc0jGwthSIG?=
 =?us-ascii?Q?zUP2dwibIosvMA741X3Rl7bJOwsebTm1iCArb0Qtzwo9txAOIUTvuz7stNkk?=
 =?us-ascii?Q?GoqUuiiqmemhBdY0ao4X3ZskXzmdmi2iuWVKYF+da9LGsWruilZ1cxYp3CK5?=
 =?us-ascii?Q?d3jEFJS7/QGtrmIX6q0WXCpGBvlY?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM8PR04MB7779.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qJKrs+qaFkWN07aUIaDFp6YGq135HCJr7VGBGeqrEtbSeHga6x/OgLYZOjLc?=
 =?us-ascii?Q?97y5aXAsYf/rzP7HQMqOGQP2Cib8rYh3pWGMW8ip6BKvy9s49XTOzPhefXoi?=
 =?us-ascii?Q?V0zufRyDC6lVmtzfsowBo0R6FDspTgONpol4XEJd/dnHDGVWUlkhPziavwhp?=
 =?us-ascii?Q?DfXXNG/4Ss3ZxD0QmJU7y/V2fd9m1nS2DQfsvgmTzR/KPH5iy4GkiVmDfVaf?=
 =?us-ascii?Q?5bUKM1imwPhsra5hwgOgELMXJPYlJUeB7c5l9XrBpeIQhcyUMNUUXXlhqldx?=
 =?us-ascii?Q?716wodUOiKBEtetSK9/qtqb8DZaNa8h73DUijQQPKf2l0Am6Oplmhlz/b3i/?=
 =?us-ascii?Q?fpSJlR6FTP5vuE7EIanh9qVMTdMoJflAbQYMUuB7B/Vxqp+UyWvd5FD7HZh8?=
 =?us-ascii?Q?Mz5Q5mDtibRHwKpy9EgcZonHxYlg2f3PbkgFudwW/25EDMy2HdvtJuH8u5f2?=
 =?us-ascii?Q?8zyhV6L3skE16gZPZur+X2B1VwySl/c+6OREGxEtwJzCo7aWIIotb4TqBGCc?=
 =?us-ascii?Q?KGGh4GGsybHybCxl8ZqwZRJuw/ddJ8i9l/JaetTHnxFynrq9PQDp0oGdF/cB?=
 =?us-ascii?Q?sW6YtTfposZuN5p1+ORmUs3xlTLm7ahpHOTpIrclr/t6xsHYcp7hbG7V6y6J?=
 =?us-ascii?Q?IsfBpAmEfr8frOG5WqzXMC1ikfFZ6Zq6217rI4E81lUBnt4puQTHaxXYKL/+?=
 =?us-ascii?Q?fs0EznLCYysjNnabwZhiwJQc7RlTU9fK9o5HpAvGknazrDwRCfR/FA1vvL8g?=
 =?us-ascii?Q?PkhCGDRwHdgNQFGVECY5EJEE4AcBps/SA38nzeENxVNC599fQf1ZhB7+2zPh?=
 =?us-ascii?Q?ThK7UbQsc8WzLI9J4qaTVVZNjB8J9snZoT+8GdlI1JIFadjDJUZXhk3uz/5z?=
 =?us-ascii?Q?rioOqclI/9I+Rb0FB+OFx/H191xFVZmepxeiUhHIgoCp5QIsYL+WgxCu8FDM?=
 =?us-ascii?Q?qK+bgMvefgsFnEoIgKKnM5YMxmdquLi0yvDMzDD4SGM8WRvRFF9XmQtxl7lq?=
 =?us-ascii?Q?ZjJtHjC0i9FWFiL3HbqGK3G0V/mxL3gjO4oHaWypGVSavdX3cJxDu3UhYK1y?=
 =?us-ascii?Q?WxcAfP4y1eun8t3d1Z0uVszRhwDXecIrIjTuTo527bmosY1SNy/Sc/qYavfH?=
 =?us-ascii?Q?7FWbTMr3k0GBsbsH3BkYTsk4yv+UWhswDNKbAN0R4pPnr1QW0RJWKrGFz5nP?=
 =?us-ascii?Q?lqG6b3GI25Q8dtgRzJ1Oq4FzKZZxL98UFG0gVkY8CezNtWPed5D6EV6XJL6C?=
 =?us-ascii?Q?2Px9vvdtxBlA/Na0B6E3BtRae6YYE6T0lNW+jW7DLXVOSOpXGAjKuYzUpdGO?=
 =?us-ascii?Q?eOdAT9+i9QaB3hqpA5mwqmGRf/aY8xFHn7/3PBK9zheLv5fwjINGISUK9Sen?=
 =?us-ascii?Q?sK+ZBDx3k70dMruEZi07iEntS40HsjUjZdSrbDfOEWCP1WV8PqlbNO/bbQAx?=
 =?us-ascii?Q?Rm3dHjXsahnU5ZKMXccZhVjJoeF3h7jLSiGYiXk0RELcrB1aPNqe2p8NmL4R?=
 =?us-ascii?Q?LfG3KptotHO+4kbnPFO/aaLtqASw3/mcXPaSLVeWqfcMrIXVOa4vvrGZFOBt?=
 =?us-ascii?Q?epIUAVzxVyvJu+tBJscvVUfWjuNIfzv6+xZsUjC1ZPczjyzsm4b1SQ3TOwta?=
 =?us-ascii?Q?pA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16bf5745-10bf-47b2-b484-08dd4bb0cb1e
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7779.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 22:01:25.2617 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: epgfZm+U2O7k4jmSoLRaCAbAWCKxhDJlP4jb+43l4wWIqMftuV34xGwXuRZFbtbcz7btGmyNwkhkr32UDqF+gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10239
Cc: Suraj Jaiswal <quic_jsuraj@quicinc.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Alexei Starovoitov <ast@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Eric Dumazet <edumazet@google.com>, Tony Nguyen <anthony.l.nguyen@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Jesper Nilsson <jesper.nilsson@axis.com>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Vinicius Costa Gomes <vinicius.gomes@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>, Gal Pressman <gal@nvidia.com>,
 John Fastabend <john.fastabend@gmail.com>, Furong Xu <0x1207@gmail.com>,
 intel-wired-lan@lists.osuosl.org, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Andrew Halaney <ahalaney@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Russell King <rmk+kernel@armlinux.org.uk>,
 Choong Yong Liang <yong.liang.choong@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org,
 Kory Maincent <kory.maincent@bootlin.com>,
 Xiaolei Wang <xiaolei.wang@windriver.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Simon Horman <horms@kernel.org>,
 bpf@vger.kernel.org, "David S . Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH iwl-next v4 0/9] igc: Add support for
 Frame Preemption feature in IGC
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

On Mon, Feb 10, 2025 at 02:01:58AM -0500, Faizal Rahim wrote:
> Introduces support for the FPE feature in the IGC driver.
> 
> The patches aligns with the upstream FPE API:
> https://patchwork.kernel.org/project/netdevbpf/cover/20230220122343.1156614-1-vladimir.oltean@nxp.com/
> https://patchwork.kernel.org/project/netdevbpf/cover/20230119122705.73054-1-vladimir.oltean@nxp.com/
> 
> It builds upon earlier work:
> https://patchwork.kernel.org/project/netdevbpf/cover/20220520011538.1098888-1-vinicius.gomes@intel.com/
> 
> The patch series adds the following functionalities to the IGC driver:
> a) Configure FPE using `ethtool --set-mm`.
> b) Display FPE settings via `ethtool --show-mm`.
> c) View FPE statistics using `ethtool --include-statistics --show-mm'.
> e) Enable preemptible/express queue with `fp`:
>    tc qdisc add ... root taprio \
>    fp E E P P

Any reason why you are only enabling the preemptible traffic classes
with taprio, and not with mqprio as well? I see there will have to be
some work harmonizing igc's existing understanding of ring priorities
with what Kurt did in 9f3297511dae ("igc: Add MQPRIO offload support"),
and I was kind of expecting to see a proposal for that as part of this.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
