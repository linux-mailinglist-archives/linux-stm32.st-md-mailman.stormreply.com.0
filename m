Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E6CEBD1B4F5
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Jan 2026 21:56:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 954F3C5A4EF;
	Tue, 13 Jan 2026 20:56:29 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010005.outbound.protection.outlook.com [52.101.69.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1F534C5A4C0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jan 2026 20:56:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vMkzS2wEY0UKQKRLXauvdLvOBhF3XKIilg6J+WAhfjlX3zsyXoA0T1og1MdGz0Be9gE4MnMmFYW50b85sqQJKi16dGtecf7MbkgSIWXIDrFMjY8FeiuRXq+egibwiVj45ngKrbUv3AuIx+N218XU4kVz0jDCJzVECvayqExvhjwpAIiVj6v/jQgLiLMUr8rtGUjvGlnH2do83RHDt8tE2L3M5a0ll9eVWZirQzauguxlBZmyLh6JC1EdetgFT9SwUX+8nWgrGkEw6WUQKJUKOgEyPzsSD8Y035bGVkrX/QsVsl8q02GtD0s/gBx2eohpIhFEQTPiLi2BnN+MwkuAqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DVmSYEthlU7/aLflsiBoas+NWEIzmin6y7Rq+JT3wqk=;
 b=xxqIrfWwhRUjSJtW5/RMVXPSmxV6IKTO4qqi5sohoDVKIJLqmuuGdxBWkb5dvhx8tFhEDWdtZtyIOF3Z0LEDJ/96Ce/1HWR9BKMVNQd4wPOJ0a5Wksm7mOT34zgucZt3c4kyzohY8G6gOH0+zTGv+PLyXuocJvQyal1M471ZLGvWP/OxtCdsneHZdZU9lVgZNFG7/t78Hr+lPKA4vTl7pBQotIealgbAA9cRDjGFXi6vIf7m7v6+oamH2bbIfDYKRIE5IhCGQjLGJt49yY8PpGs8kYQexyUk5ucHE4E6lFSe0xextwlS3QXZYoXrutkvxWz2M2QLp9wpqSSMTmF2/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DVmSYEthlU7/aLflsiBoas+NWEIzmin6y7Rq+JT3wqk=;
 b=egbfdkxceYX7m549A9fvSM/YwUZkx/Hd5PPJuEZq3ZCddGo2J4j9gpgzGKVF4RLfU+RV9w8pkF0mZUzm/vd7I9Sk+tqVy5HDAJzwqAIySB9wlMkEA9gVoP40O+0cmlLqcMtnH7PRV1pZ2fzrvIhKeObTQPF0S4t7nQLhLmcj3BlAvdC1hxSxrwnQC/O1OQypdDWUoGIh+VWafNEmp59UpEPv+5N2jeMIYv8vM9BEvX5XAg42Jzoz1FGXb/3T2iBF49MdrEwPDa7SYJnyyGyXaWhPsO3Eh0JnnAykCO+V7CyInzwmNjCrANCWOczBipYAmGDALeTq1IZel6/aUcDtCQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by DU4PR04MB10340.eurprd04.prod.outlook.com (2603:10a6:10:564::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.5; Tue, 13 Jan
 2026 20:56:26 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9478.004; Tue, 13 Jan 2026
 20:56:26 +0000
Date: Tue, 13 Jan 2026 15:56:09 -0500
From: Frank Li <Frank.li@nxp.com>
To: Koichiro Den <den@valinux.co.jp>
Message-ID: <aWaxaR5KWoPbN0Ju@lizhi-Precision-Tower-5810>
References: <20260113162719.3710268-1-den@valinux.co.jp>
 <20260113162719.3710268-7-den@valinux.co.jp>
Content-Disposition: inline
In-Reply-To: <20260113162719.3710268-7-den@valinux.co.jp>
X-ClientProxiedBy: SJ0PR13CA0163.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::18) To AS8PR04MB8948.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|DU4PR04MB10340:EE_
X-MS-Office365-Filtering-Correlation-Id: ae0c53fd-17b8-4081-1797-08de52e6372d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|7416014|376014|19092799006|366016|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2Vd7xdhVs6g7kVpNx6ris04xoABTJAnpUE9AXuaDSeDjQmsxB1r/9tKGQGDT?=
 =?us-ascii?Q?mpQH3vcGuo/KjOA8UzgZQA+F8WzXGiTVWRrkgxpavM/kyk1+ixuWPkEOnKm2?=
 =?us-ascii?Q?1YbdfAiXUEssCfhszm6HVyMdQ0maljjR0exszBhrjRbgG8j4dplNLvrLPlwv?=
 =?us-ascii?Q?fNJJ7L9TaxfQDzm9mKivSJ6gk4KMZ3fkh/kC4XJ1KgF4kZgED7q279kSr5pA?=
 =?us-ascii?Q?Un7I9MjXr0dKHNuzC6r31tQA8dT3aE0lVOmLtBIgeDoMX/h/VWEfWMR8wjb/?=
 =?us-ascii?Q?Q23Rbm7zmB1tpm10h2ZKR0KJQMjkVqBnE00eDFUweFpvEYjJ7MQuUCj+x/Pd?=
 =?us-ascii?Q?Px83IycEIP6lNzZ9ior0YMvZp+D8xiFE+av7M0YAa4oZk5QNraew3yHEWWDg?=
 =?us-ascii?Q?iIuaZF5SM/CImhJS1pE9OGqZDUx2kfmVpvvXNvGhZV4AcXsObOLzIuLsSj+R?=
 =?us-ascii?Q?TvGllnRFURhtTUgMBhaeeF3phLpKspqVnWc1BZK1ESsWZ88vghClLxMRExXi?=
 =?us-ascii?Q?0fSor16amZBQeZxSS/+8sczMtmUR9x6mxcmq005L6DviEAM2SUzN5Aj7lDck?=
 =?us-ascii?Q?voxo1MNakw5QQrOMUeYleR33XE1p85NoWTLcslqdHMuxjen6b7WjZBVhE2/p?=
 =?us-ascii?Q?k2CDAVHF3Tgt9/Diju9I+hKrEM7SaT7Okl2y5u0MO1vtSlAb8hA0XaJzu0a8?=
 =?us-ascii?Q?E0WytW3iZ/dZcPba8HIwDgfpcS/qmjr5noYMnyNQ02+d+Yl5Oc9yAugpW1Dn?=
 =?us-ascii?Q?a83B8CE30s4M+7FXbwlo0pmvq+UuW6oGY40+xSAJ3pBLd1ZMBFTXiti6qX0O?=
 =?us-ascii?Q?kNAUfB/LmsbnjEosLlq1/aQ5xkpDN2nc5eHfcW3wEGoEh61s5IKT2Dg7HWNt?=
 =?us-ascii?Q?f4BkxMaaOaMStOVlRPQYFmtjAZJb2xqunQeZY9cU7fhowz43Ugawb8YqsZBq?=
 =?us-ascii?Q?DCDeVxUBZZDTBdf5N3gtu4fhh/3FBhj5+qDI/8u2vw8CuK5XooSar41vtcSR?=
 =?us-ascii?Q?JgghX6J7nhhtyWmv8wFGR7824KZcncIsuyssHAsSvFSQQPkrtUtrhezxSy71?=
 =?us-ascii?Q?nIlVreI/yZ/hVe3WkUozsV2lxK1CIAKk3Kh7V82ZV6oAUHkyzIAq2bbMFHzs?=
 =?us-ascii?Q?BkN2BuKGZpYwA9Wlwv8t4d4WsfsVDWaZWO5REwWkMBRc5QTgwSMq+rI3H+4H?=
 =?us-ascii?Q?IZecssqAZsbFdQIFhOBGRdMjlhVG/xCHUYXBWIZ5LPhlE4vnzKX/tN7aAP89?=
 =?us-ascii?Q?JouMv+rl92lrOQD1QdO1A+DQIFP4lySx5n5FcsiBxlJaWKnskSm6vHrIQuI5?=
 =?us-ascii?Q?5Kc51zR06wKYuUQww3AE67UbqdVQgccBnoGPZWLVfbNPQuJVvqH7Awd7oU5K?=
 =?us-ascii?Q?uoq4gR9f6QerI8n3I9UxHdxV3yeAVKhqJtsZUjaay6qz8vH/NI4/DmNX6FLl?=
 =?us-ascii?Q?EDGaYYcwSqEyaZD2Y2mHLKLd2i0rCVcD9nGIUv0nut4FZOtWzS8a1gJt68fD?=
 =?us-ascii?Q?iSeddHPgD8p+y4ktzQbUCmmk2dI2bftxq9UV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU2PR04MB8951.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(7416014)(376014)(19092799006)(366016)(1800799024)(38350700014)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lEsE47wTJyC1MwQyTeCPyXIUiAGXBe7wzZ6neeLWfHDqcmEDBsT+Qs5fyMzO?=
 =?us-ascii?Q?lUhgSGWVcrdNY/ou3Ujo4oUiWYaPw7FobZTicCHd+khFHW5Kw9akRB2qX0fX?=
 =?us-ascii?Q?9Bk7p/BNAgMSfnRahNnBNrrL0csC91yBB5HNfYueDxFpPdMi9sdg5lFfDwLC?=
 =?us-ascii?Q?aOqTQrGJ2/T4GD9Hp4xgFrY1u1mB2OUfm5NjWm6KZRhgG56dxwcL/niv2yS8?=
 =?us-ascii?Q?ETPfNgfVqLA5K9mKfJtP2AhG32g1adrtxaJOFU4tcuvHeR/Qw8+qSZK3PBwV?=
 =?us-ascii?Q?g3E4hdVOSQ34aiRRD9MdA9s3FmU6ngvn1+n92kZtPuZT/Ybodem+gcNzM0v8?=
 =?us-ascii?Q?cQPTZAw/8tca/iAlwc5/O9eQKWyxejn32zR/g+p9b1xZQtka21oQy4rFNbMp?=
 =?us-ascii?Q?fnO9SYDGJgZSRI0KD5IlJqqlzgq/wgPmU4HVjh+RQkQA1EMCdoIPeNLwq5Hz?=
 =?us-ascii?Q?aPACo92r/N7G5PSZ/L2YQC9e2UOVf595uKeFMyWJ0V/CelvJLTQ1bXIqQ5qV?=
 =?us-ascii?Q?U11e9GiIcGkKzX2IDFdQHxGM+UMjyIVdEB6wnq68yWAY7dHwH3PrV83alUdN?=
 =?us-ascii?Q?I1/xvWXCY0TzOvzGYxUuIHfAHpReMDw3mohOd4nKOAuG0Jmdjd6E/ggnDY48?=
 =?us-ascii?Q?315nCgSkiaXPFs7GartE1QNvN7SkL6wZvq07d86mMA9uVZXtFeMjcI7mC36D?=
 =?us-ascii?Q?CXjx7aXW5rUPJ5Z59P/ZN7UkPEcwKmCbT3j0ueRUdJ3DJBBFRSzRsIzyfuzI?=
 =?us-ascii?Q?m/5JpzuP4i/nusgx96AawYE5NR3hEj5NSrfMoTfrYN7dij9KCFYansLVRoB7?=
 =?us-ascii?Q?qxxIvqYYt3JJlmzvpMmKx8eUJ+UTCCZy0Y/7l2K09EPBysoSqB5AbMxM1asd?=
 =?us-ascii?Q?EsI5ptuDYsz/ljlN3az+b80VjkBb/hpuK9GFoCrgAvXK8koVkca5uDSXzQce?=
 =?us-ascii?Q?LwjIejAiCgu4pmnZ13EH0TfP/IThpUM5MsipHqCYUBf0RXbzS5X6N8I4RPhC?=
 =?us-ascii?Q?jBoQslppDnwJSZQLVoHIU63OALEGl54OI7xjdgvjLG4rYXtS/6C4W4CN0g0c?=
 =?us-ascii?Q?u13z4TXSMP58VyhRMYkuhTfIe4yqNyTp/59ymPzzBS5QU7tizcbV6HVI1k6w?=
 =?us-ascii?Q?l58s7Xc2z3dzOs3W2UuE1Kfls+YIro9KRbmE0JmlS5qw8pAZAC3Bok1zAOTQ?=
 =?us-ascii?Q?3OXFVANMLpE2/rgrkOFyLlrTdq1RIdjWCnZ/qqEWEqhGXFIsXvoVEZa5Fjoy?=
 =?us-ascii?Q?HItEr7jxykj12A3VB0HrUsm+nkuVNK2mzyHm1PorlnDj9MkttTlbF8YSIBhw?=
 =?us-ascii?Q?5kyIwMkiZCiZdFp/m448CLER6b8KAvKgogUrpHzYzuoXSDxiFOeE4Pgda69Y?=
 =?us-ascii?Q?NysgKb6PxE5ImW/Wf5KXPVxzZaWEJaHRV6fWwwNboQuVV70lxhdUFYc/fwfj?=
 =?us-ascii?Q?TlzoLhuqPMtGaISFSWHfYiJZL4ECKppCvxvvpiKpkzzZFHZw/iChcevgwC4d?=
 =?us-ascii?Q?xKzkF88AG/pamvw5eI/R9pKdv1yPRfkAGGz7KA5g1uo3n+JSdkoPXaBtiM8k?=
 =?us-ascii?Q?NyEi6NE9ek0hKZN9lTzyX3HOypfdK6F2x6RIdIkbkU0W9nybh0K/yn+OaWu7?=
 =?us-ascii?Q?9Ob6budC2iT88NGREWxB77XsE2es/4R7zZCdlynrBDZy+dcwZwhDY53HnTA/?=
 =?us-ascii?Q?B+tYevKdG/lb2vXK2q5ezHQQKbzDqo3TADSQ1O8X6s31VK3K?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae0c53fd-17b8-4081-1797-08de52e6372d
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8948.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 20:56:26.2036 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lEYFTCwW5mfwx4xVv2ssEXyN6cd86bZ8/sV4dWqUjOtIGT65u9McB+kFnBWCR1FAvdg2E/zpN7pcjs9nY2um3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10340
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
Subject: Re: [Linux-stm32] [PATCH v7 6/6] Documentation: PCI: endpoint:
 Clarify pci_epc_set_bar() usage
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

On Wed, Jan 14, 2026 at 01:27:19AM +0900, Koichiro Den wrote:
> The current documentation implies that pci_epc_set_bar() is only used
> before the host enumerates the endpoint.
>
> In practice, some Endpoint Controllers support calling pci_epc_set_bar()
> multiple times for the same BAR (without clearing it) in order to update
> inbound address translations after the host has programmed the BAR base
> address, which some Endpoint Functions such as vNTB already relies on.
> Add document text for that.
>
> Also document the expected call flow for BAR subrange mapping
> (pci_epf_bar.use_submap / pci_epf_bar.submap), which may require
> a second pci_epc_set_bar() call after the host has programmed the BAR base
> address.
>
> Reviewed-by: Niklas Cassel <cassel@kernel.org>
> Signed-off-by: Koichiro Den <den@valinux.co.jp>
> ---
Reviewed-by: Frank Li <Frank.Li@nxp.com>
>  Documentation/PCI/endpoint/pci-endpoint.rst | 24 +++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>
> diff --git a/Documentation/PCI/endpoint/pci-endpoint.rst b/Documentation/PCI/endpoint/pci-endpoint.rst
> index 0741c8cbd74e..09b892de9280 100644
> --- a/Documentation/PCI/endpoint/pci-endpoint.rst
> +++ b/Documentation/PCI/endpoint/pci-endpoint.rst
> @@ -95,6 +95,30 @@ by the PCI endpoint function driver.
>     Register space of the function driver is usually configured
>     using this API.
>
> +   Some endpoint controllers also support calling pci_epc_set_bar() again
> +   for the same BAR (without calling pci_epc_clear_bar()) to update inbound
> +   address translations after the host has programmed the BAR base address.
> +   Endpoint function drivers can check this capability via the
> +   dynamic_inbound_mapping EPC feature bit.
> +
> +   When pci_epf_bar.use_submap is set, the endpoint function driver is
> +   requesting BAR subrange mapping using pci_epf_bar.submap. This requires
> +   the EPC to advertise support via the subrange_mapping EPC feature bit.
> +
> +   When an EPF driver wants to make use of the inbound subrange mapping
> +   feature, it requires that the BAR base address has been programmed by
> +   the host during enumeration. Thus, it needs to call pci_epc_set_bar()
> +   twice for the same BAR (requires dynamic_inbound_mapping): first with
> +   use_submap cleared to configure the BAR size, then after the PCIe link
> +   is up and the host enumerates the endpoint and programs the BAR base
> +   address, again with use_submap set.
> +
> +   Note that when making use of the inbound subrange mapping feature, the
> +   EPF driver must not call pci_epc_clear_bar() between the two
> +   pci_epc_set_bar() calls, because clearing the BAR can clear/disable the
> +   BAR register or BAR decode on the endpoint while the host still expects
> +   the assigned BAR address to remain valid.
> +
>  * pci_epc_clear_bar()
>
>     The PCI endpoint function driver should use pci_epc_clear_bar() to reset
> --
> 2.51.0
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
