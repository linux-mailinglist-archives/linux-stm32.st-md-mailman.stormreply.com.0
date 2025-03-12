Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5211AA5E09B
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Mar 2025 16:39:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 19507C78011;
	Wed, 12 Mar 2025 15:39:22 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013022.outbound.protection.outlook.com
 [40.107.162.22])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ADFA1C7128F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Mar 2025 15:39:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p68ET2deSL3UyrdBNWmwCTsl7p6ZZycd6weLVCxv80AoFDBklPTeNtxDLJQvrhcYPgeYvhinl1/93iOtcPzjQteSeVK2uIhTj+SRM0szGXHnPE4b7Pv7VrbI5pX6ODXYogVlTD/5pZQFmYLnit1Jnn5iBfhQgxGf8QIDE+0EOQolat4U0c+svzBIIxOFYphXiNjnuH20/0BU+PXbFhs2+cnZEZawO7arNF14F9klPqEkY7UWtMDmbNNtjPQ8dW/tilf2QkbFBFGvM1BZEgnAozKL95UaRXiW7sr/HFEMGDxMNBoGzSqUYj56XuSbbZJGbGcv8lV7BlnW6yPtCOj7/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s/bM9rAKCnpxhuCd+Tt/LVI/F/zec+pdv2jlPgio8fw=;
 b=eIt2Mci5pTQCsC+Tulqfbs0Z2AFuxKgSFRqRNFf37rSrPZCvnHT2Vj3Rn1tEb+c3DptUeE0QTexB2sIBM5+a2JI8gfxVHNOf9SeaSFzBhlUiz1hfuSHZhPYqlMUMvhJCElJBDZiIYtSwXEqsrorO4pd+QYecTHkSHug/dTul6IZg32gDNFqUxFkrbnznpv9GilG6RvUAHMOH8JV86uHo3DaSXqx6i+5apAEFewK6wMGRFBvd/yICl5TZexEUOFEbgJPMmOgEwOIMqbwGx0Vf/FN0Tm1XZ4CRANbnNHiUbk38Kwy9TY62Xoo3pKQzCg0XQ91E5mvDAnjBsz7odAUigw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s/bM9rAKCnpxhuCd+Tt/LVI/F/zec+pdv2jlPgio8fw=;
 b=PjrVo9PTy2LYzZDbZu9hTD1adG9k8XXScPkxI2WScQtaSg3EZrPdNtohTd11mYn1SDmroE9ZJ0vpL8AMbzMTaTfpHBNZF567dAqkv5zf4YLR6JrjT5EPwkU7q1K4Jm6kHcdfILyATHY1P94qhpCoEw/h7LqGvSywsmSF9cFlfH2NmQZ7UfpxXEucrFodpoBcvooQG3u6i6EXak3UflnXCGsu8kd01UNYyVyxr/KmcPdHCouwBOGE7BDcW23zABfWCm87Pg2GDnXUV4pmT3cJVgGu5IprK/Drgpl8uaQzFsVWwJaGlfXKqS9jKsLBvY+uiE5w8ugWkvTBPyQI9i9oqg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com (2603:10a6:20b:24b::14)
 by AM7PR04MB6902.eurprd04.prod.outlook.com (2603:10a6:20b:107::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.28; Wed, 12 Mar
 2025 15:39:19 +0000
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2]) by AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2%6]) with mapi id 15.20.8511.026; Wed, 12 Mar 2025
 15:39:19 +0000
Date: Wed, 12 Mar 2025 17:39:14 +0200
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: Faizal Rahim <faizal.abdul.rahim@linux.intel.com>
Message-ID: <20250312153914.pqmefvkafp7zq5k5@skbuf>
References: <20250309104648.3895551-1-faizal.abdul.rahim@linux.intel.com>
 <20250309104648.3895551-4-faizal.abdul.rahim@linux.intel.com>
Content-Disposition: inline
In-Reply-To: <20250309104648.3895551-4-faizal.abdul.rahim@linux.intel.com>
X-ClientProxiedBy: VI1PR09CA0132.eurprd09.prod.outlook.com
 (2603:10a6:803:12c::16) To AM8PR04MB7779.eurprd04.prod.outlook.com
 (2603:10a6:20b:24b::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7779:EE_|AM7PR04MB6902:EE_
X-MS-Office365-Filtering-Correlation-Id: 7770659c-a366-4917-bfe1-08dd617c0dc0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?webWUkwcGw/aMgrfpxIooM+rx4o3Ug9h2NWDXoTang+zPpn97ZMheG41hi5J?=
 =?us-ascii?Q?s/TrNlloSwMLUJsaO2omBTpdO804N096wB0a1F3JCgwLB8WAYlTLsAqmd1hi?=
 =?us-ascii?Q?YzMpGYSY+JYu/7xnySojDelhbfKK2vKMMTzog8gMFiVMO9U67TRIHZcyTM1Z?=
 =?us-ascii?Q?ui/FM+TvjmI0sOD38kL7epkFv8GsD8vY353Sni167a/f3HcWhgd7+K52EVgw?=
 =?us-ascii?Q?6tG8dCOxJrlH0aZoy7bvvqA/WX/fY9WQitqBy0ncaM4cn+8wh77bJy/kW27i?=
 =?us-ascii?Q?8JqdXiFDFQOCU3YnEm+Ay0InW67QH3ZMZk0CRbHfkWAFXGIcByjSRr8HRv0j?=
 =?us-ascii?Q?lEs8q5DGF6QkCvBnhtwXFA3sgcLomH0hV8uDVPto3jn8wI7GTX1vwMPMGMRN?=
 =?us-ascii?Q?Rf7eIz9oVw/iC9+SzhChOkAK/+9Jy5nZcG+DDTIQazLBSMNMf0AOd3m2Khnr?=
 =?us-ascii?Q?vdFs3ElcIYYb9tEUy+R14g90x33N5steJ6j44COBIzzSsW2oMnCosqiB+vB8?=
 =?us-ascii?Q?kW4GWAIAjMBADirS4hhgRFriIknJgiuyGo1P+T6/mC/Y67XnQrzqomVL6V8z?=
 =?us-ascii?Q?ockhnmcBbaEU8dVT+pvEY3nEj0VKwye1vKdU+GwqVrzJzTME1pPBekPs1sIh?=
 =?us-ascii?Q?zISnUSrZNvr/9gw9ewXhjdmA38xEORK9Z/a81Fz0oz4Xn7YWPcxbhYs1B0Ff?=
 =?us-ascii?Q?5auwowkdFGChdwbptmMhAajljk7sSa7l/7vyvoVNMnT0e/iGzTEQ9Amv1Bfp?=
 =?us-ascii?Q?YFhnqhVgyZHE1C4O1ppZE3H8VjLXvvezKu/6bWWn43Jd6KquHM2Gbxh15eAO?=
 =?us-ascii?Q?zTsmAMycUZU41iJI1CjwJi0ZPl9kZYZuKSV+1tZNXLkL28pjHOlzN1lEt6If?=
 =?us-ascii?Q?gfoRwDTBljYTAahSVP3PNdxu30kCcdnVeo6gdB3xdVqMQ5Rm+JyYrofHkMct?=
 =?us-ascii?Q?nlH80S/eI+dnqNKWiA2LSxf0XzttcOt2JGGZgZ77iSxBusVtKnDDFDe1PspL?=
 =?us-ascii?Q?CQbecW65m3n60g6RTtIO3fOaU5UEpk9pC6iKZ+t7cYIrolkDJu2ov/Z8oUUq?=
 =?us-ascii?Q?4wfHf+Q2cJC5YAs+ozlfDOS7MDcuAt10iEqcsqmBsVOcyQYxHHnpKagGz/RQ?=
 =?us-ascii?Q?9NtIXYwwTxc3oq9vDQWip5pT+hl4d+ijQONgOaW5Xy/iV60BmawXEHBTi8YE?=
 =?us-ascii?Q?gxi/StTISQsI6NIaVCkCBRDzmTVrIt5SQd8LeOX3gDO4LhylqYxTYl1Qpwx+?=
 =?us-ascii?Q?0TOV1FBuq39/giypmBdGHvDrclHew2amKlDLwNWXhXu+z8z4h2BkDQ0Xd9Jq?=
 =?us-ascii?Q?E4xCY+mQnGDpOjC9UySgTGMAXXaTngB4P7e8JXQyUYtcuxTAnDiXRM7ryWyE?=
 =?us-ascii?Q?y4oO0I1bKQxB7qRWbNuYs3DamE+a?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM8PR04MB7779.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eAFwox/VS2yYh9Rta2Y7itgjcxPRA6RRF5OJt3ouIFuDh8axiwZnk4OtR2Z5?=
 =?us-ascii?Q?RDMhs7Hjph64XLq2F5iIb96lb00wio4Sh888SaEmc7tWJBq5mkDq+cwdD4UB?=
 =?us-ascii?Q?rjT/xYT+680p9navOhFSenm63baZ5yvoDt8xJFxvd6rRU0phrO/4IaAGL/Y5?=
 =?us-ascii?Q?oUIy+2fzaRXojO0Kx7IzCkLVYlberTXFRNKKhQVNVrKpT4nyfAR0G2rHuF6m?=
 =?us-ascii?Q?wxeboNNHFVirzEZ8ERVhufJa6b2exXRSNz+EirTubshVXGSyrf/X/Z14bV8d?=
 =?us-ascii?Q?Ms6gdzf9z1maE5FCvujgTOZ9MBg1894oLXtYrF7cEDOoDI60eRbALBnaQRPQ?=
 =?us-ascii?Q?+E9ut5wHBF5ST3lihIB7mgUUc4bV+sODzXVpug1Zko4QCCRughGiGIodaDv7?=
 =?us-ascii?Q?4nVgIFFE1YX6e0ZY7uuwpc86lnnP8pk3SV8TeGmVI05yJtLrToq3fXC/Nfpe?=
 =?us-ascii?Q?2wDbm2yrfNgkCOFrSRXvsSLT8mmss8jEIp3nXyFKAn2FSui+nkShTc1tXIrb?=
 =?us-ascii?Q?a1wtbweRAeYbTDSkc3oZsDM9fa71O+Ft2vgJGLbwfkxiffwoTtBJkiD0/+BA?=
 =?us-ascii?Q?diaKT7X7p5GPyQGTD1F8Jvr4opl+DX12xpy7Ybs86BbSELHTn5SLhWq0gSnf?=
 =?us-ascii?Q?321VlzdeiySke9YY62WqIyhg+8D1SocBbWJiHzG4nTWIjaso4849rN5Yv2zk?=
 =?us-ascii?Q?UH9y0SGdT8kRHELKwEyfOYBQGvCYLvq7s4ywrkbE6oTcQ8VwHu+AR21MTBXg?=
 =?us-ascii?Q?Ci7/8/hfVThG1qLUKIVc9MLFPN8FRU7c9GBEW1G0JeMsDexUxLLUXQz7w7pd?=
 =?us-ascii?Q?KzGGclNvJLw925fITgboRY12nYiJa71QCMvCwbMVHYanyvhafsxmd+vPMhjk?=
 =?us-ascii?Q?FSKSVRqpkGJO3cCsjuOJIXLURQ1m0UcsX/+4dZLRTCSfEv69KG8nLXXDxruq?=
 =?us-ascii?Q?UVZ4IJL02mHnb8qDrtbLuVg0tJzhU+/ksirtxU4em+fvlAQ51d331Cj6/ZvF?=
 =?us-ascii?Q?qNtUHnRqyZrEFUOPjneW3eZbl0ZRsSco3ZNPR0GhjILbhNUGXnMZ7kaigNfD?=
 =?us-ascii?Q?sKADJB4s/+N3e/n8ifrFPs2angP8WxgU82CFfr15/p6wAfQLSSbvjonjulVI?=
 =?us-ascii?Q?w9NWlhHS5/NLYu182EJ5LcN7WbwMH0eZbKAhw8UUfsoEdWdVqN7wrveVt58w?=
 =?us-ascii?Q?1InpSYl74RFfD+lUpI7iEU66sl+7B5UvTY/buaKHgJWpAVxdf08gTLYf6m/Y?=
 =?us-ascii?Q?DpkPlbIkwih2tObYRunl6BRdqipt15hgCyzTwc06gsH8WYI0TJXVh7wMbDJY?=
 =?us-ascii?Q?HcYuB9Yx9rdj4Z08XuYaynSZNz8dpmM8muMCdMmZVG2rpDDWHSgDSbWpW4Xd?=
 =?us-ascii?Q?L9h/oVRz4iPVPEUjkgDhvQR0wNewLcUeV21NwCRFeVFbgwsPbkm3xjP7nikH?=
 =?us-ascii?Q?cZndHnJ1b2+yx494j+7N/uxSrChv4cV0Q9ctcpWQsMlkqWK3mIjHZCGwUZ6w?=
 =?us-ascii?Q?LrQHHkmXYdbNbkQeadk00kmbKZaozQjG0KitEbTJqzjFoUQ2lb8gU2Iw986c?=
 =?us-ascii?Q?H7FbOeOM0aBMvvSpgVihmAHRyeq/bVnqhuYTzCqO+vCYhMkhiSwXwcNWZDlE?=
 =?us-ascii?Q?nQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7770659c-a366-4917-bfe1-08dd617c0dc0
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7779.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2025 15:39:19.2639 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: leDmst3NqEDQoiBAc7CY+XdrP9Cul5Gr1LPX0bzKgtbYhoD0Dfa/KeTISYmRbi0FLO6tA6GqPTZcxJHxS4yN5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6902
Cc: Suraj Jaiswal <quic_jsuraj@quicinc.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Alexei Starovoitov <ast@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Eric Dumazet <edumazet@google.com>, Tony Nguyen <anthony.l.nguyen@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Chwee-Lin Choong <chwee.lin.choong@intel.com>,
 Jesper Nilsson <jesper.nilsson@axis.com>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Vinicius Costa Gomes <vinicius.gomes@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>, Gal Pressman <gal@nvidia.com>,
 John Fastabend <john.fastabend@gmail.com>, Furong Xu <0x1207@gmail.com>,
 intel-wired-lan@lists.osuosl.org, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Russell King <rmk+kernel@armlinux.org.uk>,
 Choong Yong Liang <yong.liang.choong@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org,
 Kory Maincent <kory.maincent@bootlin.com>,
 Xiaolei Wang <xiaolei.wang@windriver.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Simon Horman <horms@kernel.org>,
 bpf@vger.kernel.org, "David S . Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH iwl-next v9 03/14] net: ethtool: mm: reset
 verification status when link is down
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

On Sun, Mar 09, 2025 at 06:46:37AM -0400, Faizal Rahim wrote:
> When the link partner goes down, "ethtool --show-mm" still displays
> "Verification status: SUCCEEDED," reflecting a previous state that is
> no longer valid.
> 
> Reset the verification status to ensure it reflects the current state.
> 
> Signed-off-by: Faizal Rahim <faizal.abdul.rahim@linux.intel.com>
> ---

Reviewed-by: Vladimir Oltean <vladimir.oltean@nxp.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
