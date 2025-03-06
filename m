Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 952CBA53F18
	for <lists+linux-stm32@lfdr.de>; Thu,  6 Mar 2025 01:28:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4D726C78F6E;
	Thu,  6 Mar 2025 00:28:31 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11011018.outbound.protection.outlook.com [52.101.65.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F0D20C78F68
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Mar 2025 00:28:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a130+0RzXCsIqAtvule7B8+oq5CFdMd7pdJU6iEaP+IvEpNEiXLY/90bM3pTzPeqmMSKqSwuXuBd60VvGbX+vQfl3/pAdlkDmTCCE9ILqeSdh/kHAheopvRR2ZkksQ8xneNIMCKDANcHulkEQO5Wmhc5MNcs2nTsYeayx47caQh7Cc3agXP42zn7IBmhz+kukP2odCIPV4d/Sth5Sl/+7j1NljnpGBNTuONT7dSUqYHcSkzbBs50mFu7UOavOh86y6AwJVgJ1R4iX55AJNgrRidq7FB30EaVeKiys4YvEePUjKU5weRl7ddpDQaGMXCSxO+v/SJ2dmo9ybfHvybgjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kyBPI7WgSnGKSJ5+6AV5y1KAsyM5ZY04dU1HCFQCCug=;
 b=F+CRrsAW4jLIbRJ/BNktptlqDPHPHtQQVoCJjyibiTTolo0TV2lPsZjbP6aclLlYcydoUKSYIKjWbT1XmkfNCkL6tLpscdxrCSCBL0LKFeKWB+ZK14cK8y1tFTiV5STL9Sv5gB+s1DtFGLivC2h8jizZEeM/DgntSkCY6KPJSvHDScDeAaKDCT7Pwu6BJFNvtN143wFn+FYpgKkugwsq4DrdEouSjcFxT7Pv6NJGtdsWXSvWLK9n9XUsA0MAL99VzFlDvHXPofU04tbndiD8QjmfGeZHZjrNJNOjhz3v117N6Wt4yDxi0wQbAf8vGSj12AVLM0KZDVonaie5FG95Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kyBPI7WgSnGKSJ5+6AV5y1KAsyM5ZY04dU1HCFQCCug=;
 b=WMfNt+vSM9VPUy8uHuyNKNMHOCGWUwAd/sMg5Jo1Gzo65Tdg+Xu2FYrzkptHramDEFKltgR8jUPDmY3KyHdqIdarJbM9yDY1cndv8WToih2BUnupasIl28ClNhPqQws6Wn/0W3i3xkTomhICs4mB5qZhb3qYLyoF9TZPVpJ00sw+tFikrKJuSPSVshwUOzXU2Cs/P/0b0qmDJz0e+GNYi1gTjt09XnBKrEmOeObZHqs/fnCBtgGwvlSALwRXtSjlLo26SNegxwH/0TZnKgwpKrtDG6g55sj8aSNijrFr6sfHiskrFGloCA/feKc1pzZqig/NnwZg0kUKaKljbvHAqg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com (2603:10a6:20b:24b::14)
 by AS8PR04MB8946.eurprd04.prod.outlook.com (2603:10a6:20b:42d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Thu, 6 Mar
 2025 00:28:29 +0000
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2]) by AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2%6]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 00:28:29 +0000
Date: Thu, 6 Mar 2025 02:28:25 +0200
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: Faizal Rahim <faizal.abdul.rahim@linux.intel.com>
Message-ID: <20250306002825.rva7wjsymmms7kbd@skbuf>
References: <20250305130026.642219-1-faizal.abdul.rahim@linux.intel.com>
 <20250305130026.642219-8-faizal.abdul.rahim@linux.intel.com>
Content-Disposition: inline
In-Reply-To: <20250305130026.642219-8-faizal.abdul.rahim@linux.intel.com>
X-ClientProxiedBy: VI1PR07CA0267.eurprd07.prod.outlook.com
 (2603:10a6:803:b4::34) To AM8PR04MB7779.eurprd04.prod.outlook.com
 (2603:10a6:20b:24b::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7779:EE_|AS8PR04MB8946:EE_
X-MS-Office365-Filtering-Correlation-Id: e58dbaa2-2030-4217-407d-08dd5c45d19f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bTJ4OEh3N2RUOXpqR1B1VzgxKzllcHJwNUVFVEp5L3FybHloQzFZRjNWWVJt?=
 =?utf-8?B?WFNyQ1lRRktkcEM5U0poc2I4RUsyQmxhaTYzMTRIRHh2cVdOR0tiRm9iK0tU?=
 =?utf-8?B?UWFsQWxHbTl0b1ZYNHRmWEl3Qi9vY1NiSUNFSFRRdFFPRWdzTFkxN3ZGdERZ?=
 =?utf-8?B?MDI1OGs1NGowS0N1c2hwVVpYWkJ1NWREYlFPdTdtS2gwdGNCSVloSjFWN1Ro?=
 =?utf-8?B?NTd3UitRaE45ZEVzMTFGN2JJTXo4eldQVUMwaDJ6VWtSNWxVazhlVkRpU1ZO?=
 =?utf-8?B?Qi9zV1ZUR2lhKytQLzNHM09mcVdZTi8vUmJNalpucmFLUU9xckdPUFE2SlUz?=
 =?utf-8?B?OWl1V2dYR1hnT3A1UitVMzNHdFJUSkMxaHVmbWFDSW1zc3dZVDBDK2MxdVhW?=
 =?utf-8?B?VlB6cTBZRFBkc1dnZTJjbU9zUGdMMXFZZjQ0SWtKcEpyWnRyNTJNaVpkZy9Y?=
 =?utf-8?B?d2hpTDRadlQrem1WWGpqdTVpMllmeFBCZGZUVmMybDhoeUxCRVpDN0hqNC9B?=
 =?utf-8?B?Q1pJa24xQmluWVhGVFdjZkV5RU1YS1ZqYTJaZ0ZVZmhDMnlGdEF4cUZVK2ta?=
 =?utf-8?B?NWd4eHYxOWxEWUg3UEVMYVRzb1J6UzZvSHRnYlVWSDQrZ25XdFdtQllEMmdJ?=
 =?utf-8?B?OTBycCtPS0tZU1Z3ajZ2Rk82eld4SEZ6YVdCVG5ic1Ywb1VqSGNhRkN1dDVX?=
 =?utf-8?B?YUZlbVNCdml3RVI0Vk9HUGVVWXZTSzV2Um9DOVBQeFliTlhkeUxWT1RVM1Yx?=
 =?utf-8?B?SFJFMFF5MTBZNzY0cm5JbHZhZFJnL3hmTjhVbDR6Rmsrc1FmV3M0Rm1PNzFQ?=
 =?utf-8?B?a2ZMdDgrd0dQenpZanEzTjh4N01xOVhCZk1ZcXBYZW1VWW1HaUc5TysyRHNu?=
 =?utf-8?B?L0lMYXpsSTgwL1JMWDkzYUgvbkxOMitReUFsalNWamFuTWY3SFZSaFRwN1Vy?=
 =?utf-8?B?akpNT3FLY2NWLzlvMVNpRSt5V1RjajRUL2pMbkpWUVhWSnVFRkVGdnd0dVJl?=
 =?utf-8?B?QmhxdjBFOXI1SVQzV2Y5clFZTE5taWs4K0kwUFJ6dTJZSW45MGJTMzJzdmhy?=
 =?utf-8?B?aVZScVRWTnNLbW5mQTFMcDduRmFPa0FWU05SakhkYnl6TGxiZFFrV0lOOG1I?=
 =?utf-8?B?aUlLUTAvN3p3azhUUk8wMEVRWks0ekd6UzNpeithWDU5SlhPeVhsRUxxQU8z?=
 =?utf-8?B?NmYyNkRxdkdjdEdOOEJEYlQxY0c2QVR5Y2JuRkFmRGRTWnVpTG56VjZpZVkv?=
 =?utf-8?B?UGxRU3B5K3QvRXlUSkVLOVVPVlFid3VwWTNrcTVOWlgrVm5NNFhEZkFLejRx?=
 =?utf-8?B?eTkvNEE0YnRKZjFsRzNFZ0NqV2hNdmEvQk1xVVpTVGhXMjNPVTQrRGEwaXdj?=
 =?utf-8?B?c0sxdmwxRHYvMXJvcEdWak83SGZ0Z1JXS1Q0VVNaSkRYM1JYUXBtSy9BQUov?=
 =?utf-8?B?MldpMlU4OGJxY0JWRnkzWmxOM3B6akxyRW83UEV2MkFYb3QyQ1lzZTk4N2I0?=
 =?utf-8?B?RU9QWU5nQzFSMXA2TjFWUTQrSHJxdmxjNEorYlRiUDg1VEJSR1NRV1lkZFRN?=
 =?utf-8?B?R3hvc3k3Rk9YUzFhUWVER3BHbVNmei9pZGZTMmdPTDgrMHBUKzZNbHJSTjVX?=
 =?utf-8?B?eDJIQzdxbGgyc29QVHNLRTRMbVg5TWtkSEl3QjZRUHBuRzNTQzAwOWoxeFJh?=
 =?utf-8?B?aldITmVzcTZKUDhBd080OWh6VzViYzE4OUp1N1VrU2dLelpKSDA0ZGpRTHBN?=
 =?utf-8?B?U2hRa2tUYm91LzBzbTdxK09FNWxram1qV2VZOFU0UnZJN2lDeTAyN0dDWno4?=
 =?utf-8?B?bHloOEVVVFYxNUt1NFBsKytneFRCU3h4MTBEMjFwd1JVYzRFV3FIY0VqQWpQ?=
 =?utf-8?Q?fAw2OgcfHhJdA?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM8PR04MB7779.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RFBOWDFCdEcrUHl3Z3FGWG9EU1BxejB1NldRc3FUYnpEMXM3UXJoT2pxbDJt?=
 =?utf-8?B?R2xuS0tVTlhMc3dtT2tuZDc1QTk0Q0N3dWdpaUF4STJOL2tSNkN5enhYZjlr?=
 =?utf-8?B?WDFJVEt0eGlPNmloNVNRSmlNQ3JCbFg3ZFlBcG1tajh3SDR0aVJQS2IzbFQ4?=
 =?utf-8?B?YXRzS3FtNHlsbVVhRG5PT0M3ajk2VWoxNDVpaU1QMnZ3bW0wVWdlQUdtYm93?=
 =?utf-8?B?dERqWFo0U29ZU2ZSZFoyMEoyNmRnQ2F6alhLcm1wVHkza090cVNUQVhlYlRu?=
 =?utf-8?B?TnlzMDd0VUN3REw2YnpFNFpaMnJkcWwyUHowYWJEdmRiKy9ySGsxVkJxdGNF?=
 =?utf-8?B?WDZjalkxVkoyWlpMM1dPS0RnaVZuLzFVSE5BVmdCVjJ2N3FzYkQvL1VSQ3pN?=
 =?utf-8?B?dnJtVU9Ob0crQ3JaM2QwRlhCSXdUQmt5K0doTlNVSUNvNmY2azRaVWd5c3hN?=
 =?utf-8?B?QzBnZk5RVmd3UWVmb0p5WEhRU3JDbzN1SHROZyszN3FiUEU2SHNXY0gza3Fp?=
 =?utf-8?B?S2Q2UGcwMGNzaHF3WDYwbkdnb0dTTWN3NysySGpVNlJhdm9uRE00cDZocXhn?=
 =?utf-8?B?R21JdzB2MzlNMGg2ditBQ3ZVYW5hV280VDlTeHBYelJ0UHdzZ3hDTzdlM1k1?=
 =?utf-8?B?WkowaXNONzlqOHdsZDJLYmM0akJwcG5kNVpISzBybTFCbGRwakY2NGRrMG1w?=
 =?utf-8?B?a3ZJS3pwY3Y1aWJTdjkxVXVXdVQxeVY5b2Q1V3hrRUppRzZ0eGwvSHd3NVNL?=
 =?utf-8?B?Y0IxR0dOclZRRkV2bDVwRVEzZFlRWTY5Skg1MGthS1VYZ2UxTHRkakJRNUFW?=
 =?utf-8?B?cFpMWnpUaWZ3TEREaWpBWXJnc0hHRGtHdjRha25NMFM3bVRJRnplY25zOEcv?=
 =?utf-8?B?Q2JYdXVTQ3BuMWw5NGhUdkhXeG55dXFIS0dlejYrenBhY2ZNTStuNzdkc2hr?=
 =?utf-8?B?QXVTM3VtbWc2amdkQUxEUW5yc3B3SXpEMVVJNG8xd2Vab1pXQmNTOTJaVU05?=
 =?utf-8?B?dW5BdHl0UlcrbjV1akg5WVd5eGZuOVNCS01vLzU3MWpDZ2RQd2d5TlpzR2ho?=
 =?utf-8?B?Z1pzSFEyTGFRVWJWVmkwcWZ1NCtNazVvZmpjd0RCK0R2d0JqakJlK25acFJM?=
 =?utf-8?B?cXpWR2hSSzF1aVhPdmhlTGd6enRaTDFPRitZa1U0YXlUNUF4c0NiVVZPckk5?=
 =?utf-8?B?K01aWjJwZTJ4WEFFVjRjMkNTOXUwMDJ1MHdxY0RKeTFQQmxobDBJQW5PckJq?=
 =?utf-8?B?eVpKZWtaeDRvN0xWY0tZQU9QNXBzR1dVZzIzTjgwQnZhbTAxalQrakdyMVJW?=
 =?utf-8?B?ZUw5WXNITXdqNHNWdFNCSUpEWm8vSVd3TGxhQUFnMFk3ZE1LTlVRRHE1dG5a?=
 =?utf-8?B?RGN3VWo4dWZvaCttNXNoV3RsWnpkRVBxMmIwaVkvQnJaeWFENUxMeWdzaTVD?=
 =?utf-8?B?bi9vRTJBSGh6cEpNc09GazlPdm4xM2pnRW91WWlxbGpSQWZ1TitTSEhyMjRz?=
 =?utf-8?B?VWh2Z1R0V3dHdWZSWUYzdWd2dHNxZGtONVZGekFFbGJaL0FIdmtCYTFLdGtF?=
 =?utf-8?B?enlPRUFVc1JIejJhMWJnRS8yMWpJa2xCM0JhS2J1UStDK01JaTUzUzVjY29Z?=
 =?utf-8?B?aHJLeVgxVFdpSU9NYXAvQUxaY0F2Yzc4Uk5HcTRqM1JMVUhMaGxGQ2ErVFZR?=
 =?utf-8?B?V1hwVkdEekIxS21keG1wN3RFK2RzWWIzT0pJcXJtZ29tNy9sL1RCbzZpeFV3?=
 =?utf-8?B?UXM3Nkk5VUk1NUJpNmZreUNWQ3lySVFqTEU1TGs0UE5Da1JQRlZrN1pMRDFy?=
 =?utf-8?B?OFBwMG9FVVVRek04eW44Z3ZUeUdJVUVYYnlydHVOVkt2RE1UM3N4bGp3bEtM?=
 =?utf-8?B?TU93amxkK0tZWHhQUzVIYk52R001N0pXdFdxelZWeVdyK0VlQTdyQ09iRnc3?=
 =?utf-8?B?ajZucTR4WTRUUjNJWmNvWXNVcEJWY0hwcDA4cU5oVFBtWnczSk8wRHZIZDIy?=
 =?utf-8?B?SnBvUWI2M25UQXZjRkI0bEs0ekRXVDhML1cyNXZ5OXJubHdkSTFNb20zTW5W?=
 =?utf-8?B?N2NDaVBKYmdlTnh0LzlJdEtwaHU5eUFKZHp6YmwzTDBqaEozZ1FteVBMTUsv?=
 =?utf-8?B?VmJpZ1BLQ2RkTk51WDNJQ0tGMHMwcGhHTk1sUmU0ZGlFUkQ0TkRhR1IzcThv?=
 =?utf-8?B?bHc9PQ==?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e58dbaa2-2030-4217-407d-08dd5c45d19f
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7779.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 00:28:29.7550 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MJw4GpRh/cKy+5TUGERl0JFtSclUdOG927mrXFRUbNNo7OE50q3CHUY823cn0VD2byX7BwM1Oy7jGnnCORhlew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8946
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
Subject: Re: [Linux-stm32] [PATCH iwl-next v8 07/11] igc: add support for
 frame preemption verification
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

T24gV2VkLCBNYXIgMDUsIDIwMjUgYXQgMDg6MDA6MjJBTSAtMDUwMCwgRmFpemFsIFJhaGltIHdy
b3RlOgo+IGIpIGNvbmZpZ3VyZV9wbWFjKCkgLT4gbm90IHVzZWQKPiAgICAtIHRoaXMgY2FsbGJh
Y2sgZHluYW1pY2FsbHkgY29udHJvbHMgcG1hY19lbmFibGVkIGF0IHJ1bnRpbWUuIEZvcgo+ICAg
ICAgZXhhbXBsZSwgbW1zdiBjYWxscyBjb25maWd1cmVfcG1hYygpIGFuZCBkaXNhYmxlcyBwbWFj
X2VuYWJsZWQgd2hlbgo+ICAgICAgdGhlIGxpbmsgcGFydG5lciBnb2VzIGRvd24sIGV2ZW4gaWYg
dGhlIHVzZXIgcHJldmlvdXNseSBlbmFibGVkIGl0Lgo+ICAgICAgVGhlIGludGVudGlvbiBpcyB0
byBzYXZlIHBvd2VyIGJ1dCBpdCBpcyBub3QgZmVhc2libGUgaW4gaWdjCj4gICAgICBiZWNhdXNl
IGl0IGNhdXNlcyBhbiBlbmRsZXNzIGFkYXB0ZXIgcmVzZXQgbG9vcDoKPiAKPiAgICAxKSBCb2Fy
ZCBBIGFuZCBCb2FyZCBCIGNvbXBsZXRlIHRoZSB2ZXJpZmljYXRpb24gaGFuZHNoYWtlLiBUeCBt
b2RlCj4gICAgICAgcmVnaXN0ZXIgZm9yIGJvdGggYm9hcmRzIGFyZSBpbiBUU04gbW9kZS4KPiAg
ICAyKSBCb2FyZCBCIGxpbmsgZ29lcyBkb3duLgo+IAo+ICAgIE9uIEJvYXJkIEE6Cj4gICAgMykg
bW1zdiBjYWxscyBjb25maWd1cmVfcG1hYygpIHdpdGggcG1hY19lbmFibGVkID0gZmFsc2UuCj4g
ICAgNCkgY29uZmlndXJlX3BtYWMoKSBpbiBpZ2MgdXBkYXRlcyBhIG5ldyBmaWVsZCBiYXNlZCBv
biBwbWFjX2VuYWJsZWQuCj4gICAgICAgRHJpdmVyIHVzZXMgdGhpcyBmaWVsZCBpbiBpZ2NfdHNu
X25ld19mbGFncygpIHRvIGluZGljYXRlIHRoYXQgdGhlCj4gICAgICAgdXNlciBlbmFibGVkL2Rp
c2FibGVkIEZQRS4KPiAgICA1KSBjb25maWd1cmVfcG1hYygpIGluIGlnYyBjYWxscyBpZ2NfdHNu
X29mZmxvYWRfYXBwbHkoKSB0byBjaGVjawo+ICAgICAgIHdoZXRoZXIgYW4gYWRhcHRlciByZXNl
dCBpcyBuZWVkZWQuIENhbGxzIGV4aXN0aW5nIGxvZ2ljIGluCj4gICAgICAgaWdjX3Rzbl93aWxs
X3R4X21vZGVfY2hhbmdlKCkgYW5kIGlnY190c25fbmV3X2ZsYWdzKCkuCj4gICAgNikgU2luY2Ug
cG1hY19lbmFibGVkIGlzIG5vdyBkaXNhYmxlZCBhbmQgbm8gb3RoZXIgVFNOIGZlYXR1cmUgaXMK
PiAgICAgICBhY3RpdmUsIGlnY190c25fd2lsbF90eF9tb2RlX2NoYW5nZSgpIGV2YWx1YXRlcyB0
byB0cnVlIGJlY2F1c2UgVHgKPiAgICAgICBtb2RlIHdpbGwgc3dpdGNoIGZyb20gVFNOIHRvIExl
Z2FjeS4KPiAgICA3KSBEcml2ZXIgcmVzZXRzIHRoZSBhZGFwdGVyLgo+ICAgIDgpIFJlZ2lzdGVy
cyBhcmUgc2V0LCBhbmQgVHggbW9kZSBzd2l0Y2hlcyB0byBMZWdhY3kuCj4gICAgOSkgV2hlbiBs
aW5rIHBhcnRuZXIgaXMgdXAsIHN0ZXBzIDPigJM4IHJlcGVhdCwgYnV0IHRoaXMgdGltZSB3aXRo
Cj4gICAgICAgcG1hY19lbmFibGVkID0gdHJ1ZSwgcmVhY3RpdmF0aW5nIFRTTi4KPiAgICAgICBp
Z2NfdHNuX3dpbGxfdHhfbW9kZV9jaGFuZ2UoKSBldmFsdWF0ZXMgdG8gdHJ1ZSBhZ2Fpbiwgc2lu
Y2UgVHgKPiAgICAgICBtb2RlIHdpbGwgc3dpdGNoIGZyb20gTGVnYWN5IHRvIFRTTi4KPiAgIDEw
KSBEcml2ZXIgcmVzZXRzIHRoZSBhZGFwdGVyLgo+ICAgMTEpIFJlc3QgYWRhcHRlciBjb21wbGV0
ZXMsIHJlZ2lzdGVycyBhcmUgc2V0LCBhbmQgVHggbW9kZSBzd2l0Y2hlcyB0bwoKcy9SZXN0IGFk
YXB0ZXIvQWRhcHRlciByZXNldC8KCj4gICAgICAgVFNOLgo+IAo+ICAgT24gQm9hcmQgQjoKPiAg
IDEyKSBBZGFwdGVyIHJlc2V0IG9uIEJvYXJkIEEgYXQgc3RlcCAxMCBjYXVzZXMgaXQgdG8gZGV0
ZWN0IGl0cyBsaW5rCj4gICAgICAgcGFydG5lciBhcyBkb3duLgo+ICAgMTMpIFJlcGVhdHMgc3Rl
cHMgM+KAkzguCj4gICAxNCkgT25jZSByZXNldCBhZGFwdGVyIG9uIEJvYXJkIEEgaXMgY29tcGxl
dGVkIGF0IHN0ZXAgMTEsIGl0IGRldGVjdHMKPiAgICAgICBpdHMgbGluayBwYXJ0bmVyIGFzIHVw
Lgo+ICAgMTUpIFJlcGVhdHMgc3RlcHMgOeKAkzExLgo+IAo+ICAgIC0gdGhpcyBjeWNsZSByZXBl
YXRzIGluZGVmaW5pdGVseS4gVG8gYXZvaWQgdGhpcyBpc3N1ZSwgaWdjIG9ubHkgdXNlcwo+ICAg
ICAgbW1zdi5wbWFjX2VuYWJsZWQgdG8gdHJhY2sgd2hldGhlciBGUEUgaXMgZW5hYmxlZCBvciBk
aXNhYmxlZC4KPiAKPiBDby1kZXZlbG9wZWQtYnk6IFZpbmljaXVzIENvc3RhIEdvbWVzIDx2aW5p
Y2l1cy5nb21lc0BpbnRlbC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogVmluaWNpdXMgQ29zdGEgR29t
ZXMgPHZpbmljaXVzLmdvbWVzQGludGVsLmNvbT4KPiBDby1kZXZlbG9wZWQtYnk6IENob29uZyBZ
b25nIExpYW5nIDx5b25nLmxpYW5nLmNob29uZ0BsaW51eC5pbnRlbC5jb20+Cj4gU2lnbmVkLW9m
Zi1ieTogQ2hvb25nIFlvbmcgTGlhbmcgPHlvbmcubGlhbmcuY2hvb25nQGxpbnV4LmludGVsLmNv
bT4KPiBDby1kZXZlbG9wZWQtYnk6IENod2VlLUxpbiBDaG9vbmcgPGNod2VlLmxpbi5jaG9vbmdA
aW50ZWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6IENod2VlLUxpbiBDaG9vbmcgPGNod2VlLmxpbi5j
aG9vbmdAaW50ZWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEZhaXphbCBSYWhpbSA8ZmFpemFsLmFi
ZHVsLnJhaGltQGxpbnV4LmludGVsLmNvbT4KPiAtLS0KPiArc3RhdGljIGlubGluZSBib29sIGln
Y19mcGVfaXNfcG1hY19lbmFibGVkKHN0cnVjdCBpZ2NfYWRhcHRlciAqYWRhcHRlcikKPiArewo+
ICsJcmV0dXJuIHN0YXRpY19icmFuY2hfdW5saWtlbHkoJmlnY19mcGVfZW5hYmxlZCkgJiYKPiAr
CSAgICAgICBhZGFwdGVyLT5mcGUubW1zdi5wbWFjX2VuYWJsZWQ7Cj4gK30KPiArCj4gK3N0YXRp
YyBpbmxpbmUgYm9vbCBpZ2NfZnBlX2lzX3ZlcmlmeV9vcl9yZXNwb25zZSh1bmlvbiBpZ2NfYWR2
X3J4X2Rlc2MgKnJ4X2Rlc2MsCj4gKwkJCQkJCSB1bnNpZ25lZCBpbnQgc2l6ZSwgdm9pZCAqcGt0
YnVmKQo+ICt7Cj4gKwl1MzIgc3RhdHVzX2Vycm9yID0gbGUzMl90b19jcHUocnhfZGVzYy0+d2Iu
dXBwZXIuc3RhdHVzX2Vycm9yKTsKPiArCXN0YXRpYyBjb25zdCB1OCB6ZXJvX3BheWxvYWRbU01E
X0ZSQU1FX1NJWkVdID0gezB9Owo+ICsJaW50IHNtZDsKPiArCj4gKwlzbWQgPSBGSUVMRF9HRVQo
SUdDX1JYREFEVl9TVEFUX1NNRF9UWVBFX01BU0ssIHN0YXR1c19lcnJvcik7Cj4gKwo+ICsJcmV0
dXJuIChzbWQgPT0gSUdDX1JYRF9TVEFUX1NNRF9UWVBFX1YgfHwgc21kID09IElHQ19SWERfU1RB
VF9TTURfVFlQRV9SKSAmJgo+ICsJCXNpemUgPT0gU01EX0ZSQU1FX1NJWkUgJiYKPiArCQkhbWVt
Y21wKHBrdGJ1ZiwgemVyb19wYXlsb2FkLCBTTURfRlJBTUVfU0laRSk7IC8qIEJ1ZmZlciBpcyBh
bGwgemVyb3MgKi8KClVzaW5nIHRoaXMgZGVmaW5pdGlvbi4uLgoKPiArfQo+ICsKPiArc3RhdGlj
IGlubGluZSB2b2lkIGlnY19mcGVfbHBfZXZlbnRfc3RhdHVzKHVuaW9uIGlnY19hZHZfcnhfZGVz
YyAqcnhfZGVzYywKPiArCQkJCQkgICBzdHJ1Y3QgZXRodG9vbF9tbXN2ICptbXN2KQo+ICt7Cj4g
Kwl1MzIgc3RhdHVzX2Vycm9yID0gbGUzMl90b19jcHUocnhfZGVzYy0+d2IudXBwZXIuc3RhdHVz
X2Vycm9yKTsKPiArCWludCBzbWQ7Cj4gKwo+ICsJc21kID0gRklFTERfR0VUKElHQ19SWERBRFZf
U1RBVF9TTURfVFlQRV9NQVNLLCBzdGF0dXNfZXJyb3IpOwo+ICsKPiArCWlmIChzbWQgPT0gSUdD
X1JYRF9TVEFUX1NNRF9UWVBFX1YpCj4gKwkJZXRodG9vbF9tbXN2X2V2ZW50X2hhbmRsZShtbXN2
LCBFVEhUT09MX01NU1ZfTFBfU0VOVF9WRVJJRllfTVBBQ0tFVCk7Cj4gKwllbHNlIGlmIChzbWQg
PT0gSUdDX1JYRF9TVEFUX1NNRF9UWVBFX1IpCj4gKwkJZXRodG9vbF9tbXN2X2V2ZW50X2hhbmRs
ZShtbXN2LCBFVEhUT09MX01NU1ZfTFBfU0VOVF9SRVNQT05TRV9NUEFDS0VUKTsKPiArfQo+IEBA
IC0yNjE3LDYgKzI2MTcsMTUgQEAgc3RhdGljIGludCBpZ2NfY2xlYW5fcnhfaXJxKHN0cnVjdCBp
Z2NfcV92ZWN0b3IgKnFfdmVjdG9yLCBjb25zdCBpbnQgYnVkZ2V0KQo+ICAJCQlzaXplIC09IElH
Q19UU19IRFJfTEVOOwo+ICAJCX0KPiAgCj4gKwkJaWYgKGlnY19mcGVfaXNfcG1hY19lbmFibGVk
KGFkYXB0ZXIpICYmCj4gKwkJICAgIGlnY19mcGVfaXNfdmVyaWZ5X29yX3Jlc3BvbnNlKHJ4X2Rl
c2MsIHNpemUsIHBrdGJ1ZikpIHsKCi4uLiBpbnZhbGlkIFNNRC1SIGFuZCBTTUQtViBmcmFtZXMg
d2lsbCBza2lwIHRoaXMgY29kZSBibG9jayBhbHRvZ2V0aGVyLCBhbmQKd2lsbCBiZSBwYXNzZWQg
dXAgdGhlIG5ldHdvcmsgc3RhY2ssIGFuZCB2aXNpYmxlIGF0IGxlYXN0IGluIHRjcGR1bXAsIGNv
cnJlY3Q/CkVzc2VudGlhbGx5LCBpZiB0aGUgbGluayBwYXJ0bmVyIHdvdWxkIGNyYWZ0IGFuIElD
TVAgcmVxdWVzdCBwYWNrZXQgd2l0aAphbiBTTUQtViBvciBTTUQtUiwgeW91ciBzdGF0aW9uIHdv
dWxkIHJlc3BvbmQgdG8gaXQsIHdoaWNoIGlzIGluY29ycmVjdC4KCkEgYml0IHN0cmFuZ2UsIHRo
ZSBiZWhhdmlvciBpbiB0aGlzIGNhc2Ugc2VlbXMgYSBiaXQgdW5kZXItc3BlY2lmaWVkIGluCnRo
ZSBzdGFuZGFyZCwgYW5kIEkgZG9uJ3Qgc2VlIGFueSBjb3VudGVyIHRoYXQgc2hvdWxkIGJlIGlu
Y3JlbWVudGVkLgoKPiArCQkJaWdjX2ZwZV9scF9ldmVudF9zdGF0dXMocnhfZGVzYywgJmFkYXB0
ZXItPmZwZS5tbXN2KTsKPiArCQkJLyogQWR2YW5jZSB0aGUgcmluZyBuZXh0LXRvLWNsZWFuICov
Cj4gKwkJCWlnY19pc19ub25fZW9wKHJ4X3JpbmcsIHJ4X2Rlc2MpOwo+ICsJCQljbGVhbmVkX2Nv
dW50Kys7Cj4gKwkJCWNvbnRpbnVlOwo+ICsJCX0KClRvIGZpeCB0aGlzLCBkb24ndCB5b3Ugd2Fu
dCB0byBtZXJnZSB0aGUgdW5uYXR1cmFsbHkgc3BsaXQKaWdjX2ZwZV9pc192ZXJpZnlfb3JfcmVz
cG9uc2UoKSBhbmQgaWdjX2ZwZV9scF9ldmVudF9zdGF0dXMoKSBpbnRvIGEKc2luZ2xlIGZ1bmN0
aW9uLCB3aGljaCByZXR1cm5zIHRydWUgd2hlbmV2ZXIgdGhlIG1QYWNrZXQgc2hvdWxkIGJlCmNv
bnN1bWVkIGJ5IHRoZSBkcml2ZXIsIGJ1dCBkZWNpZGVzIHdoZXRoZXIgdG8gZW1pdCBhIG1tc3Yg
ZXZlbnQgb24gaXRzCm93bj8gTWVyZ2luZyB0aGUgdHdvIHdvdWxkIGFsc28gYXZvaWQgcmVhZGlu
ZyByeF9kZXNjLT53Yi51cHBlci5zdGF0dXNfZXJyb3IKdHdpY2UuCgpTb21ldGhpbmcgbGlrZSB0
aGlzOgoKc3RhdGljIGlubGluZSBib29sIGlnY19mcGVfaGFuZGxlX21wYWNrZXQoc3RydWN0IGln
Y19hZGFwdGVyICphZGFwdGVyLAoJCQkJCSAgdW5pb24gaWdjX2Fkdl9yeF9kZXNjICpyeF9kZXNj
LAoJCQkJCSAgdW5zaWduZWQgaW50IHNpemUsIHZvaWQgKnBrdGJ1ZikKewoJdTMyIHN0YXR1c19l
cnJvciA9IGxlMzJfdG9fY3B1KHJ4X2Rlc2MtPndiLnVwcGVyLnN0YXR1c19lcnJvcik7CglpbnQg
c21kOwoKCXNtZCA9IEZJRUxEX0dFVChJR0NfUlhEQURWX1NUQVRfU01EX1RZUEVfTUFTSywgc3Rh
dHVzX2Vycm9yKTsKCWlmIChzbWQgIT0gSUdDX1JYRF9TVEFUX1NNRF9UWVBFX1YgJiYgc21kICE9
IElHQ19SWERfU1RBVF9TTURfVFlQRV9SKQoJCXJldHVybiBmYWxzZTsKCglpZiAoc2l6ZSA9PSBT
TURfRlJBTUVfU0laRSAmJiBtZW1faXNfemVybyhwa3RidWYsIFNNRF9GUkFNRV9TSVpFKSkgewoJ
CXN0cnVjdCBldGh0b29sX21tc3YgKm1tc3YgPSAmYWRhcHRlci0+ZnBlLm1tc3Y7CgkJZW51bSBl
dGh0b29sX21tc3ZfZXZlbnQgZXZlbnQ7CgoJCWlmIChzbWQgPT0gSUdDX1JYRF9TVEFUX1NNRF9U
WVBFX1YpCgkJCWV2ZW50ID0gRVRIVE9PTF9NTVNWX0xQX1NFTlRfVkVSSUZZX01QQUNLRVQ7CgkJ
ZWxzZQoJCQlldmVudCA9IEVUSFRPT0xfTU1TVl9MUF9TRU5UX1JFU1BPTlNFX01QQUNLRVQ7CgoJ
CWV0aHRvb2xfbW1zdl9ldmVudF9oYW5kbGUobW1zdiwgZXZlbnQpOwoJfQoKCXJldHVybiB0cnVl
Owp9CgoJCWlmIChpZ2NfZnBlX2lzX3BtYWNfZW5hYmxlZChhZGFwdGVyKSAmJgoJCSAgICBpZ2Nf
ZnBlX2hhbmRsZV9tcGFja2V0KGFkYXB0ZXIsIHJ4X2Rlc2MsIHNpemUsIHBrdGJ1ZikpIHsKCQkJ
LyogQWR2YW5jZSB0aGUgcmluZyBuZXh0LXRvLWNsZWFuICovCgkJCWlnY19pc19ub25fZW9wKHJ4
X3JpbmcsIHJ4X2Rlc2MpOwoJCQljbGVhbmVkX2NvdW50Kys7CgkJCWNvbnRpbnVlOwoJCX0KClsg
YWxzbyByZW1hcmsgdGhlIHVzZSBvZiBtZW1faXNfemVybygpIGluc3RlYWQgb2YgbWVtY21wKCkg
d2l0aCBhIGJ1ZmZlcgogIHByZS1maWxsZWQgd2l0aCB6ZXJvZXMuIEl0IHNob3VsZCBiZSBtb3Jl
IGVmZmljaWVudCwgZm9yIHRoZSBzaW1wbGUKICByZWFzb24gdGhhdCBpdCdzIGFjY2Vzc2luZyBh
IHNpbmdsZSBtZW1vcnkgYnVmZmVyIGFuZCBub3QgdHdvLiBUaG91Z2gKICBJJ20gc3VycHJpc2Vk
IGhvdyB3aWRlc3ByZWFkIHRoZSBtZW1jbXAoKSBwYXR0ZXJuIGlzIHRocm91Z2hvdXQgdGhlCiAg
a2VybmVsLiBdCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXN0bTMyCg==
