Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 324B5A34DED
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Feb 2025 19:46:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CC389C78F8D;
	Thu, 13 Feb 2025 18:46:25 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11012026.outbound.protection.outlook.com [52.101.66.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EA08CC78002
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Feb 2025 18:46:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uYhto2lowkm/yD22gDXZjfI1r32pYX9hafFHLCzmqa56QP27VxO3xaMCb6juggkgl+eoWcnBMBSr1BednEX2qiydX2S6HsL04FM3ehAaarkHtXXtNDD4CogrqMzQAdoASO+WfpY+rqZrnYteiH9CSNu6NXJXPjyLuxVQ5CX9gVR2wsUwYxk+GbXD16wWJ6WyHvOnKQ6bUQW/zh6nFkxJEszuqAQJb0x8uWss3wxE9cyFJmB4OCDdO7lo87gjMSbeokAIvvw/NnJOe0LRCKadEpkiHqHpyieTjNSQ9B4f0eDDenP5pVMIuDWIo3+8WtpxpyU3UdX4VZFn6VcaL5iTrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4cbhEucmo2HU1X6kViLKNri9ALyHc/syeQVfcb47aOg=;
 b=XyNhOs+GW9OR3OSt8SOoAeqmDgFyRhW0aBx/qNU9jNwzSYYLoctLIuPHpsj0aCK9bIDJx3d3kuteQQRfgMVTvpaetWrBzUreXvB6sIKQKwDU15L8eNijAuwZzIhQCUzsryjui3SNubEulKlxhdTNhFElbZgsm9g2W4gYitOnS282izImGnr1T5TN0CjRZqoMfBH47Ne9GhltlUk3aReOKgeASAa9kW5fubyLg8DDUed4Rdrby9tRvAOzdwvTCkJXn50omaYZNsEWWXj0BgAGda+9r1h9lcIsbonId2KJslABPkvTo8w0UGOv1qhY+iPg+0P7uTx6Z6/EwnJo2SqwTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4cbhEucmo2HU1X6kViLKNri9ALyHc/syeQVfcb47aOg=;
 b=VCXmjGtIkaRmMgHTw2WDDK0qYkuYrvzTEe9QjSZk0pjshMJ0zu7bq5OZS5kRw2jWCF+JqRI+5S8gPt1eT4BHHlvbA8s9+g1HiCj9hfcyGEDj8kkYuEmpsC5zi1zi0ify4Odck9N1TG1NOGEZHpjT6fuvS5Lj887B02v1BHHvp9syFfsIji58IlO9hQcvxdwWLX2HhE/6oKQVyyCk5uEV3IGjcC9c2uF5OO/VjIqEZa75Rdx+0GpSXHBWc2GD4ZvyoHgbOW+5DA2hIkRlVoIOLtQZmFWoZ2eDg7Xv04rffMq/GfRvttjKsTVitZvNkBPo/hvXrGsrfY95sgZG92UszA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com (2603:10a6:20b:24b::14)
 by PAWPR04MB10006.eurprd04.prod.outlook.com (2603:10a6:102:380::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.16; Thu, 13 Feb
 2025 18:46:17 +0000
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2]) by AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2%6]) with mapi id 15.20.8445.013; Thu, 13 Feb 2025
 18:46:17 +0000
Date: Thu, 13 Feb 2025 20:46:13 +0200
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: Kurt Kanzenbach <kurt@linutronix.de>
Message-ID: <20250213184613.cqc2zhj2wkaf5hn7@skbuf>
References: <20250210070207.2615418-1-faizal.abdul.rahim@linux.intel.com>
 <20250210070207.2615418-1-faizal.abdul.rahim@linux.intel.com>
 <20250212220121.ici3qll66pfoov62@skbuf>
 <b19357dc-590d-458c-9646-ee5993916044@linux.intel.com>
 <87cyfmnjdh.fsf@kurt.kurt.home>
 <5902cc28-a649-4ae9-a5ba-83aa265abaf8@linux.intel.com>
 <20250213130003.nxt2ev47a6ppqzrq@skbuf>
 <1c981aa1-e796-4c53-9853-3eae517f2f6d@linux.intel.com>
 <877c5undbg.fsf@kurt.kurt.home>
Content-Disposition: inline
In-Reply-To: <877c5undbg.fsf@kurt.kurt.home>
X-ClientProxiedBy: VI1P189CA0032.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:802:2a::45) To AM8PR04MB7779.eurprd04.prod.outlook.com
 (2603:10a6:20b:24b::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7779:EE_|PAWPR04MB10006:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a047e8a-06b9-4a90-3bef-08dd4c5eb34b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cmR0MmhzRDYydGJsSVNmaEUxQzFaeDExbDFYSGtZd0RXM1FveEN3cHhDWFBB?=
 =?utf-8?B?MTg2eCttcmY5Z0JkY2NocWxCY2x6ZXVxUE91OGt0ZUZuMVQ3aFpteGtFcHhL?=
 =?utf-8?B?Q1BadEttUkllRWVndVdiZkpPY0YxK0x1ZXpVeWk2RGV5eG9CeXlrMEppbWw2?=
 =?utf-8?B?UzFucnlkd3JnWkluc1QwOTZVOHBZOTBIVFZJWFdHUHdsZVA5U2Ryam5nV3Zo?=
 =?utf-8?B?ZXg1U2RwcjdJVUwwSUc0SjFpTitSYlpCN3EyVzltejNjdUtNRy94YjBqQXJ2?=
 =?utf-8?B?SXRWVXJqN1JtV3RPN2czQldBZ055bFBmd0pNTVBWcnhRaEpIVks3RDluNmZ4?=
 =?utf-8?B?aVErVnoyOVhabjFmdDJ4SkNQc0p3RWNTVXR2QXpLYkhMU0dIamVWNlJSVmdq?=
 =?utf-8?B?SExNSHd0NUIwd1BSWUJlQ2hWQWh3VFhGU2lGNGFxZ1RDWkIrNjczSnZjUnNn?=
 =?utf-8?B?WDRtZ2tQa3dXSGhRSFN6WVZ4WU82SW1GNC9ENngrbzF2bmhrZWVLR29GSmhm?=
 =?utf-8?B?TXpSZ3BQbUtRa1hpY3VaL0FSM2cxYUU3K2ZwS0tTakZFb0oySWlvNkl4TGVo?=
 =?utf-8?B?eTQzN3ZyOXJEQ0ovQXUwR3U4UTBIUzRLNnhOcitzOUtPOXh3bkpxZXN4K1Rk?=
 =?utf-8?B?S3lHLzdlYkVnZkt0ak9HUURpSGlTdCs0VVFkVlF6N0IrNkhOUEV0V2l1ampM?=
 =?utf-8?B?cCtyeXZkNnpxQnhGNmFDdzlUQVIzOFJsQkFVRlRKOG5peHkxanlsVnc5aG9p?=
 =?utf-8?B?VGk3c21BV1FlcUI2Y2k0dnRudFRubGozUU1JRVRqQnpDamJYbGVJU2dEanhT?=
 =?utf-8?B?bUNhV1RjZkFTVVBxRWcxQUF5dVBZVUUxK2hhUHB4R1NyREU4eHNjc3FRWjNq?=
 =?utf-8?B?N0F0NnlGOVJkQjQ3U3FTSTE5Y0VNMk1oVkxtWUJTajM5K1Y2YUJhd1lSUWRi?=
 =?utf-8?B?TXh4dys5OGtiVjBXb0owcmZjY3h2dnAzbzB4Y2ZZbTlJNnFId2lFWVlHcnNs?=
 =?utf-8?B?bTV0bnIrUERxdU9vSG5qZUgzNUpVNHMwNE0zQ1BhOHozcW41dWoxUWhqYTZU?=
 =?utf-8?B?a3lPVm9GVUtsZDFrQ2plRSt4eWlvN3FjazY3UGJsb3JsRm5IVExiOXpWblZ3?=
 =?utf-8?B?cHhwWktHVzZEdmdhME5pN24rRUhYUFZsWHJVajdSSSs0aFh3YzE1UElMMmdS?=
 =?utf-8?B?Yk9LVlU3VmxwOEUxNnBlRnFjMVlUSUFvZTdSOUVoK2tPdlh1eURiQTduUDFH?=
 =?utf-8?B?aGg4R3MvMHZRL3djWWt2SWtrbk5RcGF6U1RQZ1VTK3Nmb0F3dXhpQnZ1M2Rn?=
 =?utf-8?B?ZlBSRHFBL1c3ZDRlUmtRRVZKbzFNVE9ubHZ3RHBRWTF1ZDU5bFRueHhidGN0?=
 =?utf-8?B?Z2xxSnFpR1JURm9VMHFaUkNKdkoxcWx1MUVYRE1GM3ZUdk9xd05NdXozODNQ?=
 =?utf-8?B?NkZoVHJOem15Z0RmUzFLZURYaGd4Y253UVUxOTFtMWpsY1MvdkhocGpYQmhs?=
 =?utf-8?B?Ukp0ajIzUStzNWZIQUlydWpKUng5bDBQMC9mV2NBMk84aVFQd1J6ZVJxVnVW?=
 =?utf-8?B?VlhOSUh5WUcvMncvZ3hsbkp3cW56WTRxK0N6ekpWcGQ1b3Nubkt4WEJRa1JW?=
 =?utf-8?B?OGtUQ0NiL3VTQlpVaE1CMVF5ZGVsR20wWDM1eUl6UmNyR1NoNXdHMGdmN1JM?=
 =?utf-8?B?QjVsdDQ3bDcrdlNMbUlTVVdEOU9kNDhOQzlXcHN3K2k4Q2tpYWZoVmJ6YVha?=
 =?utf-8?B?SDFuWTd4N1Z5bFdodDlEaW5yVHJmVU8vdUYwbnBKOVhNK0xIeC81b2grZ1B0?=
 =?utf-8?B?a2JVN1g5SlRwZmRhTm5tdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM8PR04MB7779.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c2JMbGRveG4xZDFxWXZDZzRLcE5QbkIxSTRmYTdRL3l3NVM0eWRzN1ZFM3NL?=
 =?utf-8?B?NWVaT3RvU3FVV1Y5RjVYSjF0ZFdIOGE2N1E5NXA0L0dNT1ZybS8yUFQ1U0th?=
 =?utf-8?B?a3FLVUlEOGhjN3ExMytFNjJtWVJzODQ3aUhQVmptaXI0b2dnZ2dKODJRaUFz?=
 =?utf-8?B?TDdFb3hkQVB0UFFxWnJ4VUJXbTJnQy9lNFBWdldTU1ROcXg4enphbTlEMnZn?=
 =?utf-8?B?NmhaY2hDdFRZVkFwK2RtVE5QV1RNeVZnaURramR1SXo1TXJPdUJmKzJ4V3Ja?=
 =?utf-8?B?N284UFVyUCticlBPL2tXYUxrenRxa2tJenlVa041L1dJZWcxWGQwMjBtVk9P?=
 =?utf-8?B?VHJrOTRkaGdzYzNyUzhTOGYxazdnbzVDdWdma2YzNnlLaVFVSFUrNk1Ld3Mw?=
 =?utf-8?B?NHovNFlOTWxFeEo0Ny9rcmRXK0sxbkYrT3VyTmhtRTM3d3ZDOFpwVmFFVjk1?=
 =?utf-8?B?V21jL3hhNWRlaXV3ZDlVOVFobGRic1EyN3FMbHhnaEdjVzNiOFduZ0NnbGht?=
 =?utf-8?B?cVA1SVIvQUgyZmQ0L2dCVU5keER3Rk1JbFNEN1RUVExsSkZjRzRHajJ1M2o0?=
 =?utf-8?B?U3VucHpKNjR6RGFQclByMGFqSURPRkx3c1pmK1E2MktUN1IreXhiMnVaR0I1?=
 =?utf-8?B?YTNKRFBjOXVuREV2cDhEWVh3cnY4RjdFV21CNkptcFdLWlZLbllhR1RYMjQr?=
 =?utf-8?B?bURPTVB2aWVpNGhWMTFrRnUzVXV0VGg2ZkFrR1pWZ3F4NmU2TEZtcjIxVUVa?=
 =?utf-8?B?RmhnSVBYQ2lBZUVhRnZZL2VUcXVBY1dUOC8zY3FzSXI3WS9pNEpLajR6QTE4?=
 =?utf-8?B?ZGoxaUxKaW9NVzZNVWNxMEwwR09pWVdLSThXSWJlcHFWZThEYkNkRHFraFhx?=
 =?utf-8?B?YWpDZHZLbFJVNlNpckVNNFNENUg0Q2phMHB4UjZPeStqbk9GOWJkNXlRMU03?=
 =?utf-8?B?Z2JKaXk2TlZrYjI1Um54RWdIdmd0eFVTb0Y1MjQvblZwVnhtamduVCtFQlBG?=
 =?utf-8?B?YXhzOFUxZk4wa253VFZiWUI5QzhFVzA5YnlWQXd3R0dPSUJuSFlxWnpFalVn?=
 =?utf-8?B?Z1M3SVRSdHBuSkxqM2ZBaXllSFNUQVgzSlpCQVdnYWNqMUNqOHBnNWc0RWxJ?=
 =?utf-8?B?dW9oWmp5L2xaZHp5cUk1eFlVM3lua215WUtQNjJYQ3pRZThTZThqL0VKMGlo?=
 =?utf-8?B?UkRYWmhrQkNDVXU2Q0Y2VEVnbHJLWkVqQUo1Q0xjQWdmb3RpTHhxUHRGd0VB?=
 =?utf-8?B?VFoyNTNXMFBxR3lyZzZPbHZMVUl3b1lpWnZXQ1Q4SDVTUnV2TjNNMThUTTZa?=
 =?utf-8?B?WGtwVTB6OCswL1M5RWJ4WFV0VTEzMTJ6UDNycjRuc0Y2ZXJFSTFoaCs0dWhP?=
 =?utf-8?B?TGMzS0tFTjhScEV5NXZJdmlBNkV0RS9PSTdVQjRHc2JBeWEyajBiZExiT0Ru?=
 =?utf-8?B?dFFPVHpuUk1xWnBBVEtzMTJNcnlUTnNYTzFXaE9jQjVJRnFSYXdVVU5jM1pv?=
 =?utf-8?B?Qmc0MWs1THc5dWh4cisrS3lwQTI3OUdkTmxENllWL0M0M1M5ZlJ0L05oSnBI?=
 =?utf-8?B?c3BGRzFDbkcvM3NpdXVBYlU4ZktGcmFtZjNJZmhKaTFxVGplN21OTTUzZjEz?=
 =?utf-8?B?cEszYi9xSGtyeWtuVkN1ci9IWTZpQjNwc2Fsc3g1R1JPQWhEK1I1QXZVK2Nx?=
 =?utf-8?B?Vml3Ly9lVlNoZUtndDFVYndkdFhQcTJsL0J2b0orV2l2aWVGeU11aEI2K0J4?=
 =?utf-8?B?Y05iVTZPTTZmR0Y3ZG02MU5mbTZ0dXdkOVMycEZrSkZhdTBXTmxPNWNLK21V?=
 =?utf-8?B?bkRIdkZlS091SGdTc0lpZHBTQk9mSWdSL3hDcytpQW8wUTFoQ0NGOE1xd2p2?=
 =?utf-8?B?VkZNekttNWhXNWtRZ091b09KQkJlV2pCdnZEaE9vQXVpS1NTQ21jNXZ1UmQx?=
 =?utf-8?B?dnZCYUo1L29tQlRHaXo5OWJvN0JtUlFYdG95UUtaa3BRdHYwaGQ0UVdjeXk3?=
 =?utf-8?B?d292cDdWdU8zeW5Yb0NmTzFtWGpvVlFLdDhxM0FNdWd3SWJydk5ibXlIVXhr?=
 =?utf-8?B?RDZVbTB0b2NlaU1WQXhLb2gzODRsbFRYYk5kaWx4WjFGWjgzVFFmeEkzWGlB?=
 =?utf-8?B?bnl3Yy9mZXpGRC94U1VnUDBsUXdscXA1VWVLM1JXSmtvZzJVWXYvN1JvblJP?=
 =?utf-8?B?S3c9PQ==?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a047e8a-06b9-4a90-3bef-08dd4c5eb34b
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7779.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2025 18:46:17.7755 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bbmFxIidc7ZDlpRKiahnNIdES1bUL7xxqsg4qQHog5iDCwFJ7WxOlYKbNdUa7v/VU9ER9hcWUscKnJf1YVGfgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB10006
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
 intel-wired-lan@lists.osuosl.org, "Abdul Rahim,
 Faizal" <faizal.abdul.rahim@linux.intel.com>, Jakub Kicinski <kuba@kernel.org>,
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gVGh1LCBGZWIgMTMsIDIwMjUgYXQgMDM6MTI6MzVQTSArMDEwMCwgS3VydCBLYW56ZW5iYWNo
IHdyb3RlOgo+IE9uIFRodSBGZWIgMTMgMjAyNSwgQWJkdWwgUmFoaW0sIEZhaXphbCB3cm90ZToK
PiA+IE9uIDEzLzIvMjAyNSA5OjAwIHBtLCBWbGFkaW1pciBPbHRlYW4gd3JvdGU6Cj4gPj4gT24g
VGh1LCBGZWIgMTMsIDIwMjUgYXQgMDg6NTQ6MThQTSArMDgwMCwgQWJkdWwgUmFoaW0sIEZhaXph
bCB3cm90ZToKPiA+Pj4+IFdlbGwsIG15IGlkZWEgd2FzIHRvIG1vdmUgdGhlIGN1cnJlbnQgbXFw
cmlvIG9mZmxvYWQgaW1wbGVtZW50YXRpb24gZnJvbQo+ID4+Pj4gbGVnYWN5IFRTTiBUeCBtb2Rl
IHRvIHRoZSBub3JtYWwgVFNOIFR4IG1vZGUuIFRoZW4sIHRhcHJpbyBhbmQgbXFwcmlvCj4gPj4+
PiBjYW4gc2hhcmUgdGhlIHNhbWUgY29kZSAod2l0aCBvciB3aXRob3V0IGZwZSkuIEkgaGF2ZSBh
IGRyYWZ0IHBhdGNoCj4gPj4+PiByZWFkeSBmb3IgdGhhdC4gV2hhdCBkbyB5b3UgdGhpbmsgYWJv
dXQgaXQ/Cj4gPj4+Cj4gPj4+IEhpIEt1cnQsCj4gPj4+Cj4gPj4+IEnigJltIG9rYXkgd2l0aCBp
bmNsdWRpbmcgaXQgaW4gdGhpcyBzZXJpZXMgYW5kIHRlc3RpbmcgZnBlICsgbXFwcmlvLCBidXQg
SeKAmW0KPiA+Pj4gbm90IHN1cmUgaWYgb3RoZXJzIG1pZ2h0IGJlIGNvbmNlcm5lZCBhYm91dCBh
ZGRpbmcgZGlmZmVyZW50IGZ1bmN0aW9uYWwKPiA+Pj4gY2hhbmdlcyBpbiB0aGlzIGZwZSBzZXJp
ZXMuCj4gPj4+Cj4gPj4+IEhpIFZsYWRpbWlyLAo+ID4+PiBBbnkgdGhvdWdodHMgb24gdGhpcyA/
Cj4gPj4gCj4gPj4gV2VsbCwgd2hhdCBkbyB5b3UgdGhpbmsgb2YgbXkgc3BsaXQgcHJvcG9zYWwg
ZnJvbSBoZXJlLCBlc3NlbnRpYWxseQo+ID4+IGRyYXdpbmcgdGhlIGxpbmUgZm9yIHRoZSBmaXJz
dCBwYXRjaCBzZXQgYXQganVzdCBldGh0b29sIG1tPwo+ID4+IGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL25ldGRldi8yMDI1MDIxMzExMDY1My5pcXk1bWFnbjI3anlmbndoQHNrYnVmLwo+ID4+IAo+
ID4KPiA+IEhvbmVzdGx5LCBhZnRlciByZWNvbnNpZGVyaW5nLCBJ4oCZZCBwcmVmZXIgdG8ga2Vl
cCB0aGUgY3VycmVudCBzZXJpZXMgYXMgaXMgCj4gPiAod2l0aG91dCBLdXJ04oCZcyBwYXRjaCks
IGFzc3VtaW5nIHlvdeKAmXJlIG9rYXkgd2l0aCBlbmFibGluZyBtcXByaW8gKyBmcGUgCj4gPiBs
YXRlciByYXRoZXIgdGhhbiBhdCB0aGUgc2FtZSB0aW1lIGFzIHRhcHJpbyArIGZwZS4gVGhlcmUg
bGlrZWx5IHdvbuKAmXQgYmUgCj4gPiBhbnkgYWRkaXRpb25hbCB3b3JrIG5lZWRlZCBmb3IgbXFw
cmlvICsgZnBlIGFmdGVyIEt1cnTigJlzIHBhdGNoIGlzIGFjY2VwdGVkLCAKPiA+IHNpbmNlIGl0
IHdpbGwgbW9zdGx5IHJldXNlIHRoZSB0YXByaW8gY29kZSBmbG93Lgo+IAo+IEkgdGhpbmsgc28u
IEFmdGVyIHN3aXRjaGluZyB0aGUgVHggbW9kZSBtcXByaW8gd2lsbCBiYXNpY2FsbHkgYmUgYQo+
IHNwZWNpYWwgY2FzZSBvZiB0YXByaW8gd2l0aCBhIGR1bW15IFFidiBzY2hlZHVsZS4gQWxzbyB0
aGUgZHJpdmVyCj4gY3VycmVudGx5IHJlamVjdHMgbXFwcmlvIHdpdGggaGFyZHdhcmUgb2ZmbG9h
ZGluZyBhbmQgcHJlZW1wdGlibGVfdGNzCj4gc2V0LiBTbywgSSBkbyBub3Qgc2VlIGFueSBpc3N1
ZXMgaW4gbWVyZ2luZyB5b3VyIGZwZSBzZXJpZXMgZmlyc3QuIEkgY2FuCj4gaGFuZGxlIHRoZSBt
cXByaW8gcGFydCBhZnRlcndhcmRzLgo+IAo+IFRoYW5rcywKPiBLdXJ0CgpDdXJyZW50bHksIGln
YyBzZXRzIHRjX3RhcHJpb19jYXBzIDo6IGJyb2tlbl9tcXByaW8gPSB0cnVlLCBtZWFuaW5nIHRo
YXQKaGlnaGVyIHNjaGVkdWxpbmcgcHJpb3JpdHkgaXMgZ2l2ZW4gdG8gc21hbGxlciBUWFEgaW5k
aWNlcy4gVGhpcyBpcyBhCnNwZWNpYWwgY2FzZSwgYXMgbm9ybWFsbHkgc3BlYWtpbmcsIGhpZ2hl
ciBzY2hlZHVsZXIgcHJpb3JpdHkgaXMgZ2l2ZW4KdG8gaGlnaGVyIHRyYWZmaWMgY2xhc3Nlcywg
Ym90aCBpbiBtcXByaW8gYW5kIGluIG5vcm1hbCB0YXByaW8gKHNlZQp0YXByaW9fZGVxdWV1ZV90
eHFfcHJpb3JpdHkoKSB2cyB0YXByaW9fZGVxdWV1ZV90Y19wcmlvcml0eSgpKS4KCkluIGNvbW1p
dCA5ZjMyOTc1MTFkYWUgKCJpZ2M6IEFkZCBNUVBSSU8gb2ZmbG9hZCBzdXBwb3J0IikgeW91IGRv
Y3VtZW50CnRoZSBpbnRlbmRlZCBtcXByaW8gdXNhZ2UgcGF0dGVybjoKCnRjIHFkaXNjIHJlcGxh
Y2UgZGV2ICR7SU5URVJGQUNFfSBoYW5kbGUgMTAwIHBhcmVudCByb290IG1xcHJpbyBudW1fdGMg
NCBcCiAgIG1hcCAwIDAgMCAwIDAgMSAyIDMgMCAwIDAgMCAwIDAgMCAwIFwKICAgcXVldWVzIDFA
MCAxQDEgMUAyIDFAMyBcCiAgIGh3IDEKCkFwcGx5aW5nIHRoZSB0cmFuc2Zvcm1hdGlvbnMgZGVz
Y3JpYmVkIGluCmh0dHBzOi8vbWFuNy5vcmcvbGludXgvbWFuLXBhZ2VzL21hbjgvdGMtbXFwcmlv
LjguaHRtbCwgaXQgbG9va3MgbGlrZSB0aGlzOgoKICAgICAgICDilIzilIDilIDilIDilIDilKzi
lIDilIDilIDilIDilKzilIDilIDilIDilIDilIDilIDilIDilJAKICAgICAgICDilIJQcmlv4pSC
IHRjIOKUgiBxdWV1ZSDilIIKICAgICAgICDilJzilIDilIDilIDilIDilLzilIDilIDilIDilIDi
lLzilIDilIDilIDilIDilIDilIDilIDilKQKICAgICAgICDilIIgIDAg4pSCICAwIOKUgiAgICAg
MCDilIIKICAgICAgICDilIIgIDEg4pSCICAwIOKUgiAgICAgMCDilIIKICAgICAgICDilIIgIDIg
4pSCICAwIOKUgiAgICAgMCDilIIKICAgICAgICDilIIgIDMg4pSCICAwIOKUgiAgICAgMCDilIIK
ICAgICAgICDilIIgIDQg4pSCICAwIOKUgiAgICAgMCDilIIKICAgICAgICDilIIgIDUg4pSCICAx
IOKUgiAgICAgMSDilIIKICAgICAgICDilIIgIDYg4pSCICAyIOKUgiAgICAgMiDilIIKICAgICAg
ICDilIIgIDcg4pSCICAzIOKUgiAgICAgMyDilIIKICAgICAgICDilIIgIDgg4pSCICAwIOKUgiAg
ICAgMCDilIIKICAgICAgICDilIIgIDkg4pSCICAwIOKUgiAgICAgMCDilIIKICAgICAgICDilIIg
MTAg4pSCICAwIOKUgiAgICAgMCDilIIKICAgICAgICDilIIgMTEg4pSCICAwIOKUgiAgICAgMCDi
lIIKICAgICAgICDilIIgMTIg4pSCICAwIOKUgiAgICAgMCDilIIKICAgICAgICDilIIgMTMg4pSC
ICAwIOKUgiAgICAgMCDilIIKICAgICAgICDilIIgMTQg4pSCICAwIOKUgiAgICAgMCDilIIKICAg
ICAgICDilIIgMTUg4pSCICAwIOKUgiAgICAgMCDilIIKICAgICAgICDilJTilIDilIDilIDilIDi
lLTilIDilIDilIDilIDilLTilIDilIDilIDilIDilIDilIDilIDilJgKCkluIHRoaXMgbW9kZWws
IHByaW8gNyBnb2VzIHRvIFRYUSAzLCBhbmQgc2luY2UgSSBhc3N1bWUgcHJpbyA3IGlzIGEgaGln
aApwcmlvcml0eSwgaXQgbWFrZXMgbWUgdGhpbmsgVFhRIDMgaXMgdGhlIGhpZ2hlc3QgcHJpb3Jp
dHkgcXVldWUgKEkgZG9uJ3QKaGF2ZSBhIGxvdCBvZiBzcGFyZSB0aW1lIHRvIHNlYXJjaCBmb3Ig
aTIxNiBkb2N1bWVudGF0aW9uIGFuZCBlbmxpZ2h0ZW4KbXlzZWxmKS4KClRoZW4gd2UgaGF2ZSBG
YWl6YWwncyBleGFtcGxlIGZyb20gcGF0Y2ggNy85OgpodHRwczovL2xvcmUua2VybmVsLm9yZy9u
ZXRkZXYvMjAyNTAyMTAwNzAyMDcuMjYxNTQxOC04LWZhaXphbC5hYmR1bC5yYWhpbUBsaW51eC5p
bnRlbC5jb20vCgphKSAxOjEgVEMtdG8tUXVldWUgTWFwcGluZwogICAkIHN1ZG8gdGMgcWRpc2Mg
cmVwbGFjZSBkZXYgZW5wMXMwIHBhcmVudCByb290IGhhbmRsZSAxMDAgXAogICAgIHRhcHJpbyBu
dW1fdGMgNCBtYXAgMyAyIDEgMCAzIDMgMyAzIDMgMyAzIDMgMyAzIDMgMyBcCiAgICAgcXVldWVz
IDFAMCAxQDEgMUAyIDFAMyBiYXNlLXRpbWUgMCBzY2hlZC1lbnRyeSBTIEYgMTAwMDAwIFwKICAg
ICBmcCBFIEUgUCBQCgpiKSBOb24tMToxIFRDLXRvLVF1ZXVlIE1hcHBpbmcKICAgJCBzdWRvIHRj
IHFkaXNjIHJlcGxhY2UgIGRldiBlbnAxczAgcGFyZW50IHJvb3QgaGFuZGxlIDEwMCBcCiAgICAg
dGFwcmlvIG51bV90YyAzIG1hcCAyIDEgMCAyIDIgMiAyIDIgMiAyIDIgMiAyIDIgMiAyCiAgICAg
cXVldWVzIDJAMCAxQDIgMUAzCiAgICAgZnAgRSBFIFAKCiAgICAgICAg4pSM4pSA4pSA4pSA4pSA
4pSs4pSA4pSA4pSA4pSA4pSs4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSQICDilIzilIDilIDilIDi
lIDilKzilIDilIDilIDilIDilKzilIDilIDilIDilIDilIDilIDilIDilIDilJAKICAgICAgICDi
lIJQcmlv4pSCIHRjIOKUgiBxdWV1ZSDilIIgIOKUglByaW/ilIIgdGMg4pSCICBxdWV1ZSDilIIK
ICAgICAgICDilJzilIDilIDilIDilIDilLzilIDilIDilIDilIDilLzilIDilIDilIDilIDilIDi
lIDilIDilKQgIOKUnOKUgOKUgOKUgOKUgOKUvOKUgOKUgOKUgOKUgOKUvOKUgOKUgOKUgOKUgOKU
gOKUgOKUgOKUgOKUpAogICAgICAgIOKUgiAgMCDilIIgIDMg4pSCICAgICAzIOKUgiAg4pSCICAw
IOKUgiAgMiDilIIgICAgICAzIOKUggogICAgICAgIOKUgiAgMSDilIIgIDIg4pSCICAgICAyIOKU
giAg4pSCICAxIOKUgiAgMSDilIIgICAgICAyIOKUggogICAgICAgIOKUgiAgMiDilIIgIDEg4pSC
ICAgICAxIOKUgiAg4pSCICAyIOKUgiAgMCDilIIgMCBvciAxIOKUggogICAgICAgIOKUgiAgMyDi
lIIgIDAg4pSCICAgICAwIOKUgiAg4pSCICAzIOKUgiAgMiDilIIgICAgICAzIOKUggogICAgICAg
IOKUgiAgNCDilIIgIDMg4pSCICAgICAzIOKUgiAg4pSCICA0IOKUgiAgMiDilIIgICAgICAzIOKU
ggogICAgICAgIOKUgiAgNSDilIIgIDMg4pSCICAgICAzIOKUgiAg4pSCICA1IOKUgiAgMiDilIIg
ICAgICAzIOKUggogICAgICAgIOKUgiAgNiDilIIgIDMg4pSCICAgICAzIOKUgiAg4pSCICA2IOKU
giAgMiDilIIgICAgICAzIOKUggogICAgICAgIOKUgiAgNyDilIIgIDMg4pSCICAgICAzIOKUgiAg
4pSCICA3IOKUgiAgMiDilIIgICAgICAzIOKUggogICAgICAgIOKUgiAgOCDilIIgIDMg4pSCICAg
ICAzIOKUgiAg4pSCICA4IOKUgiAgMiDilIIgICAgICAzIOKUggogICAgICAgIOKUgiAgOSDilIIg
IDMg4pSCICAgICAzIOKUgiAg4pSCICA5IOKUgiAgMiDilIIgICAgICAzIOKUggogICAgICAgIOKU
giAxMCDilIIgIDMg4pSCICAgICAzIOKUgiAg4pSCIDEwIOKUgiAgMiDilIIgICAgICAzIOKUggog
ICAgICAgIOKUgiAxMSDilIIgIDMg4pSCICAgICAzIOKUgiAg4pSCIDExIOKUgiAgMiDilIIgICAg
ICAzIOKUggogICAgICAgIOKUgiAxMiDilIIgIDMg4pSCICAgICAzIOKUgiAg4pSCIDEyIOKUgiAg
MiDilIIgICAgICAzIOKUggogICAgICAgIOKUgiAxMyDilIIgIDMg4pSCICAgICAzIOKUgiAg4pSC
IDEzIOKUgiAgMiDilIIgICAgICAzIOKUggogICAgICAgIOKUgiAxNCDilIIgIDMg4pSCICAgICAz
IOKUgiAg4pSCIDE0IOKUgiAgMiDilIIgICAgICAzIOKUggogICAgICAgIOKUgiAxNSDilIIgIDMg
4pSCICAgICAzIOKUgiAg4pSCIDE1IOKUgiAgMiDilIIgICAgICAzIOKUggogICAgICAgIOKUlOKU
gOKUgOKUgOKUgOKUtOKUgOKUgOKUgOKUgOKUtOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUmCAg4pSU
4pSA4pSA4pSA4pSA4pS04pSA4pSA4pSA4pSA4pS04pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSY
CiAgICAgICAgICAgICAgY2FzZSBhICAgICAgICAgICAgICAgY2FzZSBiCgpJbiB0aGVzZSBjYXNl
cywgRmFpemFsIGxlYXZlcyB1cyBhIGhpbnQgdGhhdCB0aGUgcHJlZW1wdGlibGUgdHJhZmZpYwpj
bGFzc2VzIGFyZSB0aGUgb25lcyB3aXRoIHRoZSBsb3dlciBzY2hlZHVsaW5nIHByaW9yaXR5IChU
QzIgYW5kIFRDMyBpbgpjYXNlIGEsIFRDMiBpbiBjYXNlIGIpLiBIZXJlLCB0aGUgbG93ZXIgc2No
ZWR1bGluZyBwcmlvcml0eSB0cmFmZmljCmNsYXNzZXMgYXJlIG1hcHBlZCB0byB0aGUgaGlnaGVy
IG51bWJlcmVkIFRYIHF1ZXVlcywgd2hpY2ggYmFzaWNhbGx5Cm1hdGNoZXMgdGhlIGJyb2tlbl9t
cXByaW8gZGVzY3JpcHRpb24uCgpTbywgY29uZnVzaW5nbHkgdG8gbWUsIGl0IHNlZW1zIGxpa2Ug
b25lIG9wZXJhdGluZyBtb2RlIGlzIGZ1bmRhbWVudGFsbHkKZGlmZmVyZW50IGZyb20gdGhlIG90
aGVyLCBhbmQgc29tZXRoaW5nIHdpbGwgaGF2ZSB0byBjaGFuZ2UgaWYgYm90aCB3aWxsCmJlIG1h
ZGUgdG8gYmVoYXZlIHRoZSBzYW1lLiBXaGF0IHdpbGwgY2hhbmdlPyBZb3Ugc2F5IG1xcHJpbyB3
aWxsIGJlaGF2ZQpsaWtlIHRhcHJpbywgYnV0IEkgdGhpbmsgaWYgYW55dGhpbmcsIG1xcHJpbyBp
cyB0aGUgb25lIHdoaWNoIGRvZXMgdGhlCnJpZ2h0IHRoaW5nLCBpbiBpZ2NfdHNuX3R4X2FyYigp
LCBhbmQgdGFwcmlvIHNlZW1zIHRvIHVzZSB0aGUgZGVmYXVsdCBUeAphcmJpdHJhdGlvbiBzY2hl
bWU/IEkgZG9uJ3QgdGhpbmsgSSdtIG9uIHRoZSBzYW1lIHBhZ2UgYXMgeW91IGd1eXMsCmJlY2F1
c2UgdG8gbWUsIGl0IGlzIGp1c3Qgb2RkIHRoYXQgdGhlIFAgdHJhZmZpYyBjbGFzc2VzIHdvdWxk
IGJlIHRoZQpmaXJzdCBvbmVzIHdpdGggbXFwcmlvLCBidXQgdGhlIGxhc3Qgb25lcyB3aXRoIHRh
cHJpby4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtc3RtMzIK
