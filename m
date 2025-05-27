Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB77AC45F8
	for <lists+linux-stm32@lfdr.de>; Tue, 27 May 2025 03:40:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 470BDC36B13;
	Tue, 27 May 2025 01:40:47 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2047.outbound.protection.outlook.com [40.107.21.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C5882C36B12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 May 2025 01:40:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JlwBcM4NPz7dr7UzVE+ioh65Fkab53TTQB1zzWLma+8DGESMUPg7Fgomiul6qSU5GE59/ce0sh0dXHwPCC0p72Xekl0AraeO7ylAiPUQ8Qew9VCqB6ycB5J9+pbzzLh/PBtLka8V8Wa4hxSQpvWp+TecUoM8l3WOdVCI78SBzyCJl+NJPyprvIwA34CfvfLTXUL20pXVMAM5Eix0Us07hqXHmLOuRHczwrdn+Lhg37XKYG4AkP2YZdXy1BvbBcfU8PFoYKFtsPzTAkhG4oCK6tFxw0D/duKJni/zF+4Kdt49Txk3wj1jcynhKN3ycV7dPSTEmTrgp7WUI+pljrpuAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SJNPOBYkA332Gm1n/RNP4l4xJ5l6gwQXPoUdntxwna8=;
 b=gWmCa25q1AgXlQA22VGrzsw+9khc6fMXQOc+epOYMhu/1GfkIt5ANA0SgL+SuH6BVbUcZldjFkS/Y4zF/P7i46xm5MfeViB3RPhJHC6ItjlPo4h0hElNkL91m0YMBCOkZGjvQjT9FLCYA9pMwf8LUW6X6PxIJ9aB2/71VjIrSIEo39GwATHpLAN4gEa5g2D97rapqJDoIk+cDQKjp0EmbkqOos4HmeQKvC+tlXT/4lqdClM6mV618LuY7cXQ/7GlVb/UOo+FUNPdWEy/kgYXsitJ//6MkIv6VfJtKdQgFY3xmS9rV9txLaV/YnMLDJ3vy6Hb2gahLez7EzByUCv3ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SJNPOBYkA332Gm1n/RNP4l4xJ5l6gwQXPoUdntxwna8=;
 b=cxpbfoWOWc1bXO621JZrT3J/AIJl5xvBPCgkeFEqzcU4kzd/79lndwfw+2D3u7JLmVkWKJVXhVPDzcYwl02Ywx8xSeAyxPsyOqIfkiSdFWPL8qfhufh6jIWlmC9AWMnSYnylOkc4XriwBqmo8p5FfwVcbYta1wdNYnDArhsvg1eJ/ar3nRu6K1uaHjk4ryvaZ1VyaAKGgLtjUqnWePHLwt0yNXwGug3Z3A6F/BBdpy5pTxr3J+iOMgXqzBftzRsbK4ccTvOCrco1OsxreCX/0b9CxppdQcYkgXplhB76/rTeW7xjnowmGRlS2x9muEq14Tn+06VhnKkJmjIswJCfwQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI2PR04MB11241.eurprd04.prod.outlook.com (2603:10a6:800:29a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Tue, 27 May
 2025 01:40:43 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8769.025; Tue, 27 May 2025
 01:40:43 +0000
Message-ID: <0a88178f-a3f1-4aa1-94e9-6050330ff168@nxp.com>
Date: Tue, 27 May 2025 09:42:11 +0800
User-Agent: Mozilla Thunderbird
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
 <20250424-drm-bridge-convert-to-alloc-api-v2-30-8f91a404d86b@bootlin.com>
 <553d62ed-976a-4e17-9678-cdc3d40ce4a7@nxp.com>
 <20250430112944.1b39caab@booty>
 <f71d18d2-4271-4bb9-b54f-0e5a585778f3@nxp.com>
 <20250506224720.5cbcf3e1@booty>
 <67252c36-8b31-4c40-9d89-4f502da4a087@nxp.com>
 <20250526092024.48cae4ae@booty>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20250526092024.48cae4ae@booty>
X-ClientProxiedBy: MA1PR01CA0156.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::26) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|VI2PR04MB11241:EE_
X-MS-Office365-Filtering-Correlation-Id: ce86e609-e697-4ec3-b533-08dd9cbf7e8e
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U3pjQzhjckUxaHBDbkpIQWIxYlJqRSt2bnVaTjk0OFRoaHRzYjZpMndvY01k?=
 =?utf-8?B?QWxjaHdHVDcyaTNCamorSWFERE1BdkJSTjUzemUxQ1luMEVKbmMzbW9zQnB3?=
 =?utf-8?B?ZEc0LzZZcG1xZFBZbUNDMlJndzg3eG9oTU9FNml0eVJDMFg1SXhnUzN1LzBa?=
 =?utf-8?B?bWhDZnIybnk0ODNQejlaTmlaeXlwa3lLcDByT0IzVjhKT0taajd4ZGpTNlRx?=
 =?utf-8?B?Ykl4amVNYmNTZUtwcWg0WmNVWU1paFFLVHB5TXlSczhQa0Yva0NWNW5lMTVM?=
 =?utf-8?B?VVNnQnI4aEVBUjBBSHpjTklLaiszOFBMT0Z3ejNyVXRQSFZERi9xZnF2OTM1?=
 =?utf-8?B?d1RyblFsZGcwR0dTYjJ5bWlMRVY1dEUyZlJtZi9jUWM0L0lVUlZFdm1OVnFP?=
 =?utf-8?B?cWdqcThidmNNNFBqditKa2pid3NnWHB3a2g4Qm9mKzFDWlk5V3RydHQ0ZS9w?=
 =?utf-8?B?OGtpcEZrbUh5T0VnU1ZHYldka1Y3VHdOL084SVViTm5vQ2V5SDVKSFZvL3hm?=
 =?utf-8?B?KytPQVFSSlJ5MjBhVy9FQ0Fxek5VQTlOZmZlYUQxc0hMNldDb2VlU3FORjZW?=
 =?utf-8?B?c3JucHZRRlVmRnBRV3g2Z0NHNHp4WEx2ZEg0K1BrblFYR0pVMUdRakF1eFlq?=
 =?utf-8?B?SmFzWVJSMkdsYWNGblUrWG9oMlFGdlR2SGx6TXdtNkc2UVAxU1VIVC9hRW8z?=
 =?utf-8?B?a290WExza2l3cUtUTUNDTmNsek5wUytiN1JramVObHRVMG11N1REM0EwTEth?=
 =?utf-8?B?Z25SZDdHMzFxcm5wd0toUXA1WVpha1pCOHJwM2JWTFErVDNkT2ZaSW83ck4z?=
 =?utf-8?B?bytwVm16Y3Vjc0t6b0lYN2o0V2xSVjZTc1hVdnZjRndBaWRMVGZOeXpvWkVE?=
 =?utf-8?B?dnRNdlpQMDBYZGRIRzc5SnYvNVVQc1ZsYXhxcWVYYTlYdVdHRzlVM0hTTCtN?=
 =?utf-8?B?NW5lcmtQMGFqT3JBbkFUZUg0ZTNFZmpvczdPNk9sNXFoemNQQjU5REZLMWc0?=
 =?utf-8?B?V2xjSVFsS0pvbnJDRzRCTWZ0b0ZoK2xsclhHYU55OVVUdm1udG9tdE1ZR0h3?=
 =?utf-8?B?ZTNBVnNJdTdFQ08yZWptNE9sMWVmS21tQ0ZMZzROdHk0QUhCV1hqSVRRbDg1?=
 =?utf-8?B?NWR0aTR3RHVCL29XaTA4SUY1bDZUNVRvS1FLV1VIeDdUZ1FhRk93dWd2S0hy?=
 =?utf-8?B?T1RFdysyTkphUmE3VzhoNCtZMDBmejhxUDRoZ1lsZmRPejB5dFhPZ0JIaWx6?=
 =?utf-8?B?c1U0Q05URmhxQU95RlVlenIxWEs1R0pPOTc4THhhQWxuQkt3eUxkR2ZRdG84?=
 =?utf-8?B?VngwazZEM0p6Nnc4T2ZlbDBERGxBdXBQektLMWhIdnQ3amNqZ0oyU0gzWEht?=
 =?utf-8?B?QjdLeVNWdVhSckVTRGxaMWVmWFhvT1NkaHUremJMV2haeWZpQVZqaEJVTkpY?=
 =?utf-8?B?WjlTaEpIRTJMck8xVlIxdG1UQzdkSC9sOFpuSHhxcTVlSGhibjBKTG1UYjNB?=
 =?utf-8?B?enB2SDRTNDArVkR1VTZJS2JuNHhXVlFiYWdJblF6eDZRN096Kzl3NzVLM09s?=
 =?utf-8?B?TlhiUEJmMXhRbHhkVDV6M0FFTTBUVFQ2RDIwQ21sWHdnNHl6bEs4ZEtwcTFn?=
 =?utf-8?B?dWdKZGZCZGhjd2FjYUVON0Z0dkppSjA0NWI3NG43RE9pMm5BUitEM3l1QWxs?=
 =?utf-8?B?Q3NBUytqNUdSZzV6bWI4SFpkaVRBb2pHL3hxODRRVFZxUjB3N0ZFTE1WL2dF?=
 =?utf-8?B?NkZqYmFYOERYcTZZOTg4ODIwN3ZveFR5WEJsMlNOM2cvWVh3RThMRUZJWWRW?=
 =?utf-8?Q?32VE72z/cAsSvy87VlBcqoS2BcASl9ZarqYQ4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dkZPWHVneFV6TFdvcUJ2d0N3ck5HZk5WVHU1b0xOYWNQQUw3bkJicTlabytq?=
 =?utf-8?B?UmREdmFKRjlDdHk0QUcybTREa0dCSDZKdnJVc2dKUFY5citSTnBlT1M0MUJM?=
 =?utf-8?B?enlzMTVnOXE1UjdQVWR0dlR2cHVEbHBmM2NiS2s5RHFsMks3d3FZZmMzbU1P?=
 =?utf-8?B?cjQ4ZEw5L215ZmtyRWxQSTIzYlZLd1VKTmZWUVZUQUd1bFJOaDFuWkcrRDZq?=
 =?utf-8?B?YWs4YnFvY05wdlVRbElVZEFCZEZ0U0hCUkFOWjlBcXhlYXlKckpMRVd3dU9G?=
 =?utf-8?B?NkJXWGhsRTVwYlpqREY4WnpDRENxTVA0TFlBWjBXQUtTSGtQaU9WQXFtZzEw?=
 =?utf-8?B?YXh1bzkydmdSbCs0cEhuRUF2ZVZnWGdpY0lJU0dZKzd0NnlndmwrNkxsbEZS?=
 =?utf-8?B?VEpJNmJyL0lHdTV0WndFaXhLdHRZamI3Y0VkbjVMOUtDallrTk50THA0a294?=
 =?utf-8?B?K3AwcndPTTNNYzR5TWRKbndEL0JZbVkxelE2STdTZlBoUkpzWFBGc3hUb3pD?=
 =?utf-8?B?Z3BrTFpEUVowYS9IZnFjb2VPLzZvQTJlaDc4VUNRc3Z3aWhOazNPUTAzSUo3?=
 =?utf-8?B?aVJmOUoyTktSOEEvSVJub2E3SllWUjlnTEkraWt5MU92SGZMZVR3S1RrYUZp?=
 =?utf-8?B?YnU3c0RoeEptSE5CNU1pb2FZRmxVcXUrWWdqb1JBMTc0cENnTHVROGNEUkJL?=
 =?utf-8?B?ZkFSWXMvbEFoWHRyZmFRVzhERCtlMG9JL0RrQWp6Y0hCZGgzTVEwMmVIWWxX?=
 =?utf-8?B?dDg4Q1VkTFpQeEVaZ0xzZXBCYzJSZis4VWdrUU9CU2l0TTdjMVdRUU9FOGFE?=
 =?utf-8?B?cTJ4eitaVVIzdHplZFdXU2NVcFNsbmZ5WEo2VmwxaTk1U3F4Yk12NlRSV1dZ?=
 =?utf-8?B?Z29IbE5tbEtIanRoUTBDbXZQYkpiOUVYWVBLRi9iaDRaMCtCbjRSeC95OGk1?=
 =?utf-8?B?eUdkVzVPb05TMjYwL0I4SHJOcHJ4V1lqVUlNUVhxWDZ2ejl5bFBYQ3RSMWp0?=
 =?utf-8?B?aHFYQStxUDFrT093c1ZKcGtBM2gxUFZXS3ArajZOWjZxQWRzNzByRStoK1Ey?=
 =?utf-8?B?YjVJZ2cwSVFaWVZtM1VSa1R2NzFKM0g2b0xPL0dCM080Rk1FM3pqaU1hZk5x?=
 =?utf-8?B?V0l2UWZTZmlGV1cxQVhvQjdmVUtRVTVtY3R1U3ZCVjR0UzRPaXNSZ1F5L2lV?=
 =?utf-8?B?elVYVXJkZ0VTbHV1QytxL0drbU53UlJLRkZqL0JaSEJuY2NXcWU2emR1ZVpC?=
 =?utf-8?B?clRlVHpvOWhqV2ZMYUpTbUNQcWU2dnZaeEFldUZLME56d0loQ0JESTFxUGlw?=
 =?utf-8?B?ZGZsbVZGdHAwaGkzdkFGWmlCbFEyZFlZcTV6Vm42cGZYemxRKzhKeDJrQmZs?=
 =?utf-8?B?Uk5ZK0p3RHd4NDlkdkpwZHROSGVTOVN1cDZESjNqRGUwN0NydzBPbmRhVTZD?=
 =?utf-8?B?TXRHcXNrSXVSSEJrKzUrRkd2M2NPbzZiSWk1Zmh5eGNmTGsxOGVRSEZTN3ZT?=
 =?utf-8?B?NjVZejVOZWZXb2prSUQzYURQN1lPckdGMloxRXk4a2xsamdRRjIxNUU5SUdW?=
 =?utf-8?B?YS9qZCtFZmsxcEFrbFNEV3kwRVl5dWtyVmVSdGxGaWMwRjhJMDBXOStNOGZ3?=
 =?utf-8?B?S25MZmMxd2pxa3lIMGduV3g2M3o1VncydUtselpJT05RU2dTTkRIbHc1eW1q?=
 =?utf-8?B?S3V5bm81VEE3M1pFTEZXUlZTQjNGc2RPL2xCbUZBNXFVZG5GR1ljUUpPMkMw?=
 =?utf-8?B?bXBzQTA0T3lGTVA0aVhRRjROOEh3eE81OHdTUWdyTk82YmNNeHVPUDFzRmtS?=
 =?utf-8?B?Y1lLUWsycUlRUVBsekNlam5mamRzQjNORHlPbnJhbEJmd1p4TjhjcEZ1aUQz?=
 =?utf-8?B?ZVNrbFgyOW5Fa091N0JPUjJBeXZnenM2MWthSktMQWUxeHhmM1ZzYlFHSnNw?=
 =?utf-8?B?VXJFNmg5aysxemYxM0g2UXRnRzJFcEtpcEgwTUpVUnp3SHdaWWlGVUpuOE5r?=
 =?utf-8?B?SGZuYmE5RmZiVTJlVm1uSjBUYmFGaU85OU1uaUEwT3h1L0p2ZzZJY3BLd2Ry?=
 =?utf-8?B?Y1ZMckUwdkF6bWVobTk0N0t2N2NJT1dIMXMxb0lPNkNiRDh5ZlVsdnIzaTdC?=
 =?utf-8?Q?/Qljje3UiZVhQWFhYxAQVfvQ4?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce86e609-e697-4ec3-b533-08dd9cbf7e8e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 01:40:43.4749 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VsxOlVlJu8fTmopTgTzxSFjqZ+d2D+NcjUsxR+KN7vgpQoqodpNSgM5bjldTfFsDl0h+Pg6fj8XT4tl3yYY+Ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB11241
Cc: imx@lists.linux.dev, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Paul Kocialkowski <paulk@sys-base.io>, linux-kernel@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Simona Vetter <simona@ffwll.ch>,
 chrome-platform@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
 Robert Foss <rfoss@kernel.org>, David Airlie <airlied@gmail.com>,
 Anusha Srivatsa <asrivats@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, linux-samsung-soc@vger.kernel.org,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Hui Pu <Hui.Pu@gehealthcare.com>, linux-amlogic@lists.infradead.org,
 platform-driver-x86@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Dmitry Baryshkov <lumag@kernel.org>, freedreno@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>, linux-renesas-soc@vger.kernel.org,
 asahi@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>,
 Shawn Guo <shawnguo@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v2 30/34] drm/bridge:
 imx8qxp-pixel-combiner: convert to devm_drm_bridge_alloc() API
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

T24gMDUvMjYvMjAyNSwgTHVjYSBDZXJlc29saSB3cm90ZToKPiBIZWxsbyBMaXUsCgpIaSBMdWNh
LAoKPiAKPiBPbiBUaHUsIDIyIE1heSAyMDI1IDExOjAxOjEzICswODAwCj4gTGl1IFlpbmcgPHZp
Y3Rvci5saXVAbnhwLmNvbT4gd3JvdGU6Cj4gCj4+IE9uIDA1LzA3LzIwMjUsIEx1Y2EgQ2VyZXNv
bGkgd3JvdGU6Cj4+Cj4+IFsuLi5dCj4+Cj4+Pj4gQWZ0ZXIgbG9va2luZyBpbnRvIHRoaXMgcGF0
Y2ggYW5kIHBhdGNoIDMxKHRob3VnaCBJJ3ZlIGFscmVhZHkgcHJvdmlkZWQgbXkgQS1iKQo+Pj4+
IG1vcmUgY2xvc2VseSwgSSB0aGluayB0aGUgaW14OHF4cF9wYyBhbmQgaW14OHtxbSxxeHB9X2xk
YiBtYWluIHN0cnVjdHVyZXMKPj4+PiBzaG91bGQgaGF2ZSB0aGUgc2FtZSBsaWZlIHRpbWUgd2l0
aCB0aGUgZW1iZWRkZWQgRFJNIGJyaWRnZXMsIGJlY2F1c2UgZm9yCj4+Pj4gZXhhbXBsZSB0aGUg
Y2xrX2FwYiBjbG9jayBpbiBzdHJ1Y3QgaW14OHF4cF9wYyB3b3VsZCBiZSBhY2Nlc3NlZCBieSB0
aGUKPj4+PiBpbXg4cXhwX3BjX2JyaWRnZV9tb2RlX3NldCBEUk0gYnJpZGdlIGNhbGxiYWNrLiAg
QnV0LCBJSVVDLCB5b3VyIHBhdGNoZXMgZXh0ZW5kCj4+Pj4gdGhlIGxpZmUgdGltZSBmb3IgdGhl
IGVtYmVkZGVkIGNoYW5uZWwvYnJpZGdlIHN0cnVjdHVyZXMgb25seSwgYnV0IG5vdCBmb3IgdGhl
Cj4+Pj4gbWFpbiBzdHJ1Y3R1cmVzLiAgV2hhdCBkbyB5b3UgdGhpbmsgPyAgCj4+Pgo+Pj4gSSBz
ZWUgeW91IGNvbmNlcm4sIGJ1dCBJJ20gc3VyZSB0aGUgY2hhbmdlIEknbSBpbnRyb2R1Y2luZyBp
cyBub3QKPj4+IGNyZWF0aW5nIHRoZSBwcm9ibGVtIHlvdSBhcmUgY29uY2VybmVkIGFib3V0Lgo+
Pj4KPj4+IFRoZSBrZXkgYXNwZWN0IGlzIHRoYXQgbXkgcGF0Y2ggaXMgbWVyZWx5IGNoYW5naW5n
IHRoZSBsaWZldGltZSBvZiB0aGUKPj4+IF9hbGxvY2F0aW9uXyBvZiB0aGUgZHJtX2JyaWRnZSwg
bm90IGl0cyB1c2FnZS4gT24gZHJtX2JyaWRnZV9yZW1vdmUoKQo+Pj4gdGhlIGJyaWRnZSBpcyBy
ZW1vdmVkIGZyb20gaXRzIGVuY29kZXIgY2hhaW4gYW5kIGl0IGlzIGNvbXBsZXRlbHkgbm90Cj4+
PiByZWFjaGFibGUsIGJvdGggYmVmb3JlIGFuZCBhZnRlciBteSBwYXRjaC4gV2l0aCBteSBwYXRj
aCBpdCBpcyBub3QgIAo+Pgo+PiBkcm1fYnJpZGdlX3JlbW92ZSgpIG9ubHkgcmVtb3ZlcyBhIGJy
aWRnZSBmcm9tIHRoZSBnbG9iYWwgYnJpZGdlX2xpc3QgZGVmaW5lZAo+PiBpbiBkcm1fYnJpZGdl
LmMuICBkcm1fYnJpZGdlX2RldGFjaCgpIGlzIHRoZSBvbmUgd2hpY2ggcmVtb3ZlcyBhIGJyaWRn
ZSBmcm9tCj4+IGl0J3MgZW5jb2RlciBjaGFpbi4gIEl0IGxvb2tzIGxpa2UgeW91IHdyb25nbHkg
dGhvdWdodCBkcm1fYnJpZGdlX3JlbW92ZSgpCj4+IGlzIGRybV9icmlkZ2VfZGV0YWNoKCkuCj4g
Cj4gSW5kZWVkIG15IHNlbnRlbmNlIHdhcyBpbmFjY3VyYXRlLCBzb3JyeSBhYm91dCB0aGF0Lgo+
IAo+PiBTbywgZXZlbiBpZiBkcm1fYnJpZGdlX3JlbW92ZSgpIGlzIGNhbGxlZCwgdGhlIHJlbW92
ZWQKPj4gYnJpZGdlIGNvdWxkIHN0aWxsIGJlIGluIGl0J3MgZW5jb2RlciBjaGFpbiwgaGVuY2Ug
YW4gYXRvbWljIGNvbW1pdCBjb3VsZCBzdGlsbAo+PiBhY2Nlc3MgdGhlIGFsbG9jYXRlZCBicmlk
Z2Uod2l0aCBsaWZldGltZSBleHRlbmRlZCkgYW5kIHRoZSBjbG9ja19hcGIgY2xvY2sKPj4gZm9y
IGV4YW1wbGUgaW4gc3RydWN0IGlteDhxeHBfcGMgY291bGQgYWxzbyBiZSBhY2Nlc3NlZC4gIFRo
YXQncyB3aHkgSSB0aGluawo+PiB0aGUgbWFpbiBzdHJ1Y3R1cmVzIHNob3VsZCBoYXZlIHRoZSBz
YW1lIGxpZmV0aW1lIHdpdGggdGhlIGFsbG9jYXRlZCBicmlkZ2UuCj4gCj4gQXMgdGhlIGxvbmct
dGVybSBnb2FsIGlzIHRvIGFsbG93IGJyaWRnZXMgdG8gYmUgaG90LXJlbW92YWJsZSwKPiBkZWNv
dXBsaW5nIHRoZSBsaWZldGltZSBvZiB0aGUgdmFyaW91cyBjb21wb25lbnRzIGlzIGEgbmVjZXNz
YXJ5IHN0ZXAuCj4gRGVmaW5pdGVseSBpdCB3aWxsIG9wZW4gb3RoZXIgaXNzdWVzLCBhbmQgZXNw
ZWNpYWxseSB0aGUgcmVtb3ZhbCBkdXJpbmcKPiBhdG9taWMgdXBkYXRlcy4gVGhpcyBoYXMgYmVl
biBkaXNjdXNzZWQgYWxyZWFkeSwgYW5kIHRoZXJlIGlzIGEKPiBwcm9wb3NlZCBwbGFuIHRvIGhh
bmRsZSBpdC4KPiAKPiBGaXJzdCwgaGVyZSBpcyB0aGUgZ3JhbmQgcGxhbiAobWVudGlvbmVkIGlu
IHRoZSB2MyBjb3ZlciBsZXR0ZXIpOgo+IAo+ICAxLiDinpwgYWRkIHJlZmNvdW50aW5nIHRvIERS
TSBicmlkZ2VzIChzdHJ1Y3QgZHJtX2JyaWRnZSkKPiAgMi4gaGFuZGxlIGdyYWNlZnVsbHkgYXRv
bWljIHVwZGF0ZXMgZHVyaW5nIGJyaWRnZSByZW1vdmFsCj4gIDMuIGF2b2lkIERTSSBob3N0IGRy
aXZlcnMgdG8gaGF2ZSBkYW5nbGluZyBwb2ludGVycyB0byBEU0kgZGV2aWNlcwo+ICA0LiBmaW5h
bGx5LCBsZXQgYnJpZGdlcyBiZSByZW1vdmFibGUgKGRlcGVuZHMgb24gMSsyKzMpCj4gCj4gV2Ug
YXJlIG5vdyBhdCBzdGVwIDEuIFlvdXIgY29uY2VybiwgYXMgSSB1bmRlcnN0YW5kIGl0LCB3aWxs
IGJlCj4gYWRkcmVzc2VkIGF0IHN0ZXAgMi4gQnJpZGdlcyB3b24ndCBiZSByZW1vdmFibGUgdW50
aWwgc3RlcCA0LCBzbyB0aGUKPiBjdXJyZW50IGNoYW5nZXMgYXJlIG5vdCBpbnRyb2R1Y2luZyBh
IG1pc2JlaGF2aW9yIGJ1dCByYXRoZXIgcHJlcGFyaW5nCj4gdGhlIGdyb3VuZCB3aXRoIGFsbCB0
aGUgbmVjZXNzYXJ5IGluZnJhc3RydWN0dXJlIGNoYW5nZXMuCj4gCj4gU3RlcCAyIHdhcyBkaXNj
dXNzZWQgaW4gdGhlIHBhc3QgWzBdLCBhbmQgdGhlIGlkZWEgcHJvcG9zZWQgYnkgTWF4aW1lCj4g
aXMgdG8gaW50cm9kdWNlIGEgImdvbmUiIG9yICJ1bnBsdWdnZWQiIGZsYWcgYW5kIGRybV9icmlk
Z2VfZW50ZXIoKSAvCj4gZHJtX2JyaWRnZV9leGl0KCkgZnVuY3Rpb25zLiBUaGUgcHJpbmNpcGxl
IGlzIHRoZSBzYW1lIGFzIHN0cnVjdAo+IGRybV9kZXZpY2UudW5wbHVnZ2VkIGFuZCBkcm1fZGV2
X2VudGVyL2V4aXQoKS4KPiAKPiBJbiBhIG51dHNoZWxsIHRoZSBpZGVhIGlzOgo+IAo+ICAtIGRy
bV9icmlkZ2UudW5wbHVnZ2VkIGlzIGluaXRpYWxpemVkIHRvIGZhbHNlCj4gIC0gZHJtX2JyaWRn
ZV9lbnRlcigpIHJldHVybnMgZmFsc2UgaWYgZHJtX2JyaWRnZS51bnBsdWdnZWQgPT0gdHJ1ZQo+
ICAtIGFueSBjb2RlIGhvbGRpbmcgYSBwb2ludGVyIHRvIHRoZSBicmlkZ2UgKGluY2x1ZGluZyB0
aGUgYnJpZGdlIGRyaXZlcgo+ICAgIGl0c2VsZikgYW5kIG9wZXJhdGluZyBvbiB0aGUgYnJpZGdl
IChpbmNsdWRpbmcgcmVtb3ZhbCkgbmVlZHMgdG8gZG86Cj4gICAgICBpZiAoZHJtX2JyaWRnZV9l
bnRlcigpKSB7Cj4gICAgICAgICAgZG8gc29tZXRoaW5nOwo+ICAgICAgICAgIGRybV9icmlkZ2Vf
ZXhpdCgpOwo+ICAgICAgfQo+ICAtIHdoZW4gdGhlIGJyaWRnZSBpcyByZW1vdmVkLCB0aGUgZHJp
dmVyIHJlbW92YWwgZnVuY3Rpb24gc2V0cwo+ICAgIGRldl9icmlkZ2UudW5wbHVnZ2VkID0gdHJ1
ZQo+IAo+IFRoZSAiZG8gc29tZXRoaW5nIiBhYm92ZSBpbmNsdWRlcyBhbnkgYWNjZXNzIHRvIGRl
dmljZSByZXNvdXJjZXMsCj4gaW5jbHVkaW5nIGNsb2NrcyAoYW5kIGNsa19hcGIpLgo+IAo+IElu
IG90aGVyIHdvcmRzLCB0d28gcGllY2VzIG9mIGNvZGUgY2FuIG5vdCBhY2Nlc3MgdGhlIGJyaWRn
ZSBzdHJ1Y3R1cmUKPiBhdCB0aGUgc2FtZSB0aW1lLiBUaGlzIGluY2x1ZGVzIGJyaWRnZSByZW1v
dmFsIFZTIGFueSBhdG9taWMgb3BlcmF0aW9ucy4KPiAKPiBEbyB5b3UgdGhpbmsgdGhpcyBhZGRy
ZXNzZXMgeW91ciBjb25jZXJuPwoKWWVzLCBkcm1fYnJpZGdlX3tlbnRlcixleGl0fSBhZGRyZXNz
IGl0LgoKPiAKPiAKPiBGb3IgeW91IHRvIGhhdmUgYSBiZXR0ZXIgcGljdHVyZSBvZiB0aGUgcGF0
aCwgaGVyZSdzIGFuIGFkZGl0aW9uYWwKPiBjbGFyaWZpY2F0aW9uIGFib3V0IGRybV9icmlkZ2Vf
YXR0YWNoL2RldGFjaCgpIGFuZAo+IGRybV9icmlkZ2VfYWRkL3JlbW92ZSgpLiBBcyBwYXJ0IG9m
IHN0ZXAgMSBvZiB0aGUgZ3JhbmQgcGxhbiwgYm90aCBvZgo+IHRoZW0gd2lsbCBkcm1fYnJpZGdl
X2dldC9wdXQoKSB0aGUgYnJpZGdlLCBzbyB0aGF0IG5vIGJyaWRnZSBpcyBmcmVlZAo+IGlmIGl0
IGlzIGVpdGhlciBpbiB0aGUgZ2xvYmFsIGJyaWRnZV9saXN0IG9yIGluIGFueSBlbmNvZGVyIGNo
YWluLgo+IAo+IFBhdGNoZXMgZm9yIHRoaXMgYXJlIGFscmVhZHkgYXBwcm92ZWQgYnkgTWF4aW1l
IFsxXVsyXS4gVGhleSBjYW5ub3QgYmUKPiBhcHBsaWVkIHVudGlsIGFsbCBicmlkZ2UgZHJpdmVy
cyBoYXZlIGJlZW4gY29udmVydGVkIHRvIHRoZSBuZXcKPiBkZXZtX2RybV9icmlkZ2VfYWxsb2Mo
KSBBUEksIHNvIHRoZXkgZGVwZW5kIG9uIHRoaXMgc2VyaWVzIHRvIGJlCj4gY29tcGxldGVseSBh
cHBsaWVkLiBXZSBhcmUgZ2V0dGluZyBwcmV0dHkgY2xvc2U6IGFzIG9mIG5vdyB0aGUgZW50aXJl
Cj4gc2VyaWVzIGhhcyBiZWVuIGFwcGxpZWQgZXhjZXB0IGZvciB0aGlzIGFuZCBhbm90aGVyIGRy
aXZlci4KPiAKPiBbMF0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjUwMTI5MTI1MTUz
LjM1ZDA0ODdhQGJvb3R5L3QvI3UKPiBbMV0gaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Au
b3JnL3BhdGNoLzY0MzA5NS8KPiBbMl0gaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3Jn
L3BhdGNoLzY0MzA5Ni8KPiAKPiBCZXN0IHJlZ2FyZHMsCj4gTHVjYQo+IAoKLS0gClJlZ2FyZHMs
CkxpdSBZaW5nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXN0bTMyCg==
