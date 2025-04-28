Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A580CA9FC58
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Apr 2025 23:40:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 52E67C7802F;
	Mon, 28 Apr 2025 21:40:48 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2085.outbound.protection.outlook.com [40.107.105.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B484AC71287
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Apr 2025 21:40:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=irKriz6Lq56gQ3xNCcyOilJkQvD64VAZk6i2J+vkZzoO8NPp8RH2HPZVZ5wNFUGoQu9r1vCtwgcx3X9SgU6EVrrRTEIp+4MzgdgMvn3kCFwCCP3BvoobzzTeIDMAqzZ50bOHSueENE4LOvn+ct/DAPTfbUXJ5gKExWjnhefOKnCs1DUbar1xmenndMVqc9ym4qj7wsPEA8WyAXroBZ7oD4fJ+URHZ584fXi5yGNO7kq3LG1oGbjIKgk6TySkeu7q2zH7T2JqVFecEpC6up7mv96rQ0PQ9MHR5pCsyBjs32uGwPDVN/nbA0L+LnI4upiIW/QriOkoHgWhK1K8tsYs9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=le5HuXrhqWS72PSd8/L6yifA4QUECx2VlRLIIw/1PLU=;
 b=rlcSlj0VAUFBi2mRJDidSYVji2Mt9scB5PpcPeEDFd/R4biTJjvp5ZX7wJZreRky0tg9PNhYUtqktMvLf5g8AIa/t+WbAapbLPOtK5nS1nNhqsyU6lpHm/W/kJHp39OD50wtBjKlnnYG5SUtVogk74MSSozBpZs+ZiMFj3TrSTxZcTtjS2CZsNNPYplOFCOFzJHHSU50q1moj5X2MnF5EP5DScDt9iqsOh4Uo5t8hxasGrh/q/h4G0nwkjinptMW3EWr9yp+JoUWXFByezDGUMSXYSCnnyBiNOrerRrfWA9XMiOEa4MyJ8d7yYwOb+5KDk9N1gmutOT9EmmEtH5XLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=le5HuXrhqWS72PSd8/L6yifA4QUECx2VlRLIIw/1PLU=;
 b=VOcNbcMvrg9tpjk19BiFekFcWVg5DRL81ho9NAPry/qHLG/eZxjIKXnlv5vYAPF8a+/U/QAam6d/2gdq+H9rtQ5c8vIQRSWrUO+QAlw0f2DaJXvfpuRbuuF8ngYVGIsPZuDSKl6gCM6UlMWws6J9h1WiGvJNziA7wstfRZ9z7OW4nBumK/0Wb7tTktdpfyDnqCgbtaKvx4lU2EpX9L0/A53n1LnulqlSyuPRUlh1VqYZdA4b+Hza0iq0aFwmucwN5nuoS/iARVsaIMDuf6oKhCO/JR9iHRPo6tT+khBplGijlfBduZNY+hAccfUCgxRpYLWZES4D2eaVuJAxf7v8TA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8774.eurprd04.prod.outlook.com (2603:10a6:10:2e1::21)
 by AS8PR04MB8708.eurprd04.prod.outlook.com (2603:10a6:20b:42b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Mon, 28 Apr
 2025 21:40:45 +0000
Received: from DU2PR04MB8774.eurprd04.prod.outlook.com
 ([fe80::88b8:8584:24dc:e2a1]) by DU2PR04MB8774.eurprd04.prod.outlook.com
 ([fe80::88b8:8584:24dc:e2a1%7]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 21:40:45 +0000
Message-ID: <89d58524-c6ac-4517-ade6-80c966c20115@nxp.com>
Date: Tue, 29 Apr 2025 00:40:42 +0300
User-Agent: Mozilla Thunderbird
To: Rob Herring <robh@kernel.org>
References: <20250423-dt-memory-region-v2-v2-0-2fbd6ebd3c88@kernel.org>
 <CANLsYkxKHhCHYrbAGzQ48QGpL_DbuLnX3=ppmpyu0vjuuvvODg@mail.gmail.com>
 <322d366c-1564-4b06-9362-28fe451a35e7@nxp.com>
 <CAL_JsqJemaAzx6v0kj52J=YFRGqLo5=xk8LXXk-8i=mAomTCWQ@mail.gmail.com>
Content-Language: en-US
From: Iuliana Prodan <iuliana.prodan@nxp.com>
In-Reply-To: <CAL_JsqJemaAzx6v0kj52J=YFRGqLo5=xk8LXXk-8i=mAomTCWQ@mail.gmail.com>
X-ClientProxiedBy: AS4P189CA0037.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5dd::8) To DU2PR04MB8774.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8774:EE_|AS8PR04MB8708:EE_
X-MS-Office365-Filtering-Correlation-Id: aec1419f-6d00-4d27-15aa-08dd869d550d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K1A3clhGbzg1aFlVdmw3V2JnZFhUYVJJck54MDZ6ZTJVd0plMVp4T21XcklW?=
 =?utf-8?B?V2tiMEc2Wk1aTlZFR2tSSE5rT0tjVEplU0hRR1RIM3h5NWN4RzMvMVlHVXVE?=
 =?utf-8?B?MDl2U3NDWGRXVFdGR2ppQ3dXMnpFN2NDSCtBMU1FKzNiSDU0b2gvc2tGQzh3?=
 =?utf-8?B?bXlvRkNQcmNUTXJQaVJIWW5mUVdPZjBFOG1obDc5M2lPbUlYT0h1ekg0V2xl?=
 =?utf-8?B?WlpxYTVUcjNucHhVNTRrM01oVk5aS29mMkFDaGhXTkpCcCthQW4yazVPZ1N0?=
 =?utf-8?B?WkZBS2RHcmZCQ1R5M0hhaThlRWgva3RmTVBBbXZ6ZnBHeW1vdUpuOWhyOGVn?=
 =?utf-8?B?b0R5c0IxSFJ6aXdSd0gyU055TDU0eE9ScTdYWnVacVU1VW4ybmxPSmdFcXl1?=
 =?utf-8?B?dGxWeEh0Y001aEQxZmJUbWx1VUdVZnByeGJUYkxycHFOd2JKeE8rT2dGZzFQ?=
 =?utf-8?B?YnUzRmVjMmc2Q3ZMRmFBKzlRWi9xMWQ5cHIzVlh3NE1nOWszOFRNb294djMr?=
 =?utf-8?B?azBzTFp4RC9zcmR3VGh2N0N0dHBTVWFVSjl2dWlUK3dsdUsvSm1TdXNjOUR5?=
 =?utf-8?B?NGF1ekkxZjRxT1QxaEJZTlVEMFhXWmZPcWRIVTJFWlFiUDdXMllPRmg0WWJH?=
 =?utf-8?B?MWE4MllWWFUvZmIvTTNVNUNkN0N6YmZTRm4zMWFMOHViRU96NVRQSXBjdCs3?=
 =?utf-8?B?SWx0YS96WnlkRDZhMGhhQTVQb0ZaSmh5am05bnFqci8reTJPUDl0VDVpUFRy?=
 =?utf-8?B?R25mU1hOSkxJMWtFMklLSGxiOXJNWHl6QXg2ZVI2T0xCeGtpeWlXdGgwVlB3?=
 =?utf-8?B?aXU3Y1IyRGFQN3RlS1ZEOFh2SHUxVlFWZWkwU1IrZDN6c0xFa2Q3YmRzUFNy?=
 =?utf-8?B?M29VVEJ4U2dHZXh5UDY3eGNtclowZ01lcHRrTXJBQitDYldORC85WUxLSEJZ?=
 =?utf-8?B?WTBGR3VqT1JVeHRHNnRXNUhLRVFZUmxpU283Qmp2aSsvcm9tYnJxOStuNmw3?=
 =?utf-8?B?OUtGZ296MDRvSmRTaS9sOEFjMWF1d041elpiRXc5Z2k5di9pN3R5OWdxNjBs?=
 =?utf-8?B?SEt1N2hYS0QvMzM0U2dHUzMxZVVvM3pCWExQdm1yUnpwc0twMFIvelRxVUVX?=
 =?utf-8?B?YjhFTm0rQ2lqcGhMYXNoRU1Mc2Q5bWZSeVQ0NkZIMlhvL2FqRUxrTVRydlJC?=
 =?utf-8?B?Smt6bER2bzhpNGV5VUNkV0N5NVRiVXZiWVhEK3NpUTliM0xsekE5VlZDcXly?=
 =?utf-8?B?QzAwZ3huaUx0cE1mQXBVYW5hZnEvSnZMM3pCU2FJRkwyTk96Q2htaHE4VXBw?=
 =?utf-8?B?K1BOUTZaR0tTV2ttVVo2VU5Pa0s1Z2hGaUs4aUgyZ2tPaVp5QTVvUGlzd1pj?=
 =?utf-8?B?SGZVTmpWdG01YmNrWkpZc0R2TzZ3VDFBY29vVHEvTlR1cnVLYlJlcWY0Q3R1?=
 =?utf-8?B?WGljenc3NG5nRjFJNS9xY1A4RWIrWlZzZ0QwYTdMWE1XZUdtYVhnNVRUanRp?=
 =?utf-8?B?a3dpQkxPTzRwU1RSYWljY0x6NU9YL3kvV1VGMHlXRzQzbnlvYVkzOFF4OTRp?=
 =?utf-8?B?N0VOZkZBMGpoNXRPUEV5L1FVbi9QWG95RktiVjFnbFB6ekFKSnJHQnR4YVdx?=
 =?utf-8?B?YldRSFJrWWwxS3VCQ0l0OG91QWRwaW9lemcxRG05QytXaHJ4aTdvTGtwMVdr?=
 =?utf-8?B?a3VGd0lNcWZ1MC85RVlzcnlWa0tSYWJ4QzNodGo3STZoSXFuZng1OFN0Q1Q0?=
 =?utf-8?B?L0ZrK3ZvYzlHeHlJeWQwcjIzdW5zMmwxVk5qdCswQTRIZWttb1dQNjRzbWZl?=
 =?utf-8?B?TExOcXFmbWNpaHM3L2tJN0l0UEEzR3NEMm93eWw2cmwxWmczSjRIQlJaYTdv?=
 =?utf-8?B?S3RXbCtQTnRmRmJkTlMxZ3VaSVRoYnZiM2Q4MkJPZ25ydG9CMk9oaDZhSFNN?=
 =?utf-8?Q?lnZGXQOP4jY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU2PR04MB8774.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M3ZCY2pORGdFV1ZZa08vcjh1bC9QMFNoY2dsZXFsRUo3Q0xLemV0NVBydStn?=
 =?utf-8?B?N3VVZWRjVmRkRC95UmwzMzBwYTZkVnV5dXg0c1BORzdTdUR0MCs0Z2VLS0xa?=
 =?utf-8?B?RndGd2FTT2JjQmxnR1hMZ3pxV0U3aEgxS2txM0pCdC9mUkxZMklqbkhPRy9C?=
 =?utf-8?B?T1dXMmQ1VXA2ZzRHSXB1WEpLSkhkL1VZWVRTd1QvQjNIREJhRWFrQnVnNGFu?=
 =?utf-8?B?bEhqY3A4ZFZkUjJ2ZFJVR2JBcVp5dXVWRElSOXdneTBhY3pqbzNwTHJhNmI5?=
 =?utf-8?B?ZVU0aVp3LzhJVTdKczdBQzFEbjlRSVU4TEZMZ1JSRFNkTmxmRlZiblZ3dWNG?=
 =?utf-8?B?Rjg0NGdQUXZiY1hQeFZxV0FJWGpZekp6anJuakxvckhTSzVVQ1pOSWlBVGx3?=
 =?utf-8?B?OWVRSWcrMnNrNW9CeHlLZE1GSmFCWnVRbE1Rbi9JbWJpMVN5RlJtNmZHdHZi?=
 =?utf-8?B?ZDFNMDNUaHpGbi9rWXYzMXREVm9lRklFdHA5TUFQV2hBM21JVjlOS1ZzcDhJ?=
 =?utf-8?B?MDJ0Ri9xOGljMWZEVCtwT3VQV2ZLYThDOW1qT0lBUUM1N3Fxa2NNU3kwTHAr?=
 =?utf-8?B?Y3pTSHozMmhnbFBnOXo4S2JEN3pjVW1NR2MvbWZpVHhTejRSSDFKY3ZnYkNy?=
 =?utf-8?B?T1lpcWRDNThxRjQ0WWE0VkR2VjFTbno1STRhL2E4WE1Oc1FXbnBVcUdMRk1H?=
 =?utf-8?B?dmMxUEtzNlFjTHZBUmhuNXo0YmJzV0xCUGJ0MWhmQ1RyMVlPN2JPNlZXQ0pY?=
 =?utf-8?B?SlliWjhhR3g5TGtuSnU0WW9ob2ZEUnMzZDVVemFZOEgvbUExWWMxZ09sWWNk?=
 =?utf-8?B?RlJRL1hYc0Mzdi9mZlpoaGhCbzJzMmxXMlpwWjNhem8wS0MrbU0rVGFEQkpO?=
 =?utf-8?B?VFpjcVA0KzZ2YWxidlJtanNqTmt3REd6WUdmZ0drcXR4Q2VoMmhBSzFCKytI?=
 =?utf-8?B?cmJQYW92N2RMZGYzSUhIQzVWakd6WjFSc2hjRjk5akZhaWxhbndueGUyL25l?=
 =?utf-8?B?aEJSbUJyN2hWWUtKVGg4QkkxMDZhYnZpQks0YnhsbTdFdnBSTVU5M1dLd2Jn?=
 =?utf-8?B?RUNQRGxaQURaS2VscEVwR1FMVldxSDFwdURiR3htMFRGdGgwU2s1YVZzZ21n?=
 =?utf-8?B?M0RiTWJvUllDUnhidGE0ZURpM2piZDFiTkFZbzVTNEY0eGViN3c1N21UL3Q0?=
 =?utf-8?B?eXowWTJiMytHMTRvcFo1L1ExVUZlUFpvSmw5YnFoeVBNUWxXM0tLdGp3ejZi?=
 =?utf-8?B?QXc1eFlDSXFmd3N2Qm5SNjR3QmtYaXhLVFNId0p1amI3V0x5Sm5FOTI5Tzhs?=
 =?utf-8?B?Lzg4QndsbGpkMDloKzJvdzR6OG1iZ2VxWWdsenNFdGJkdU9vVzhQUjBTOUhs?=
 =?utf-8?B?cW0reitCSm4wYlpMUUthS1FkMzVQSnJoS0x6TUpReEdNWUFsK0lSSjVyRElI?=
 =?utf-8?B?YUpDYzRsaGZkY1FCNzk2b2IwdloyMUdVVDZGUnIyTERFbGJaUXhhTFRhK3ox?=
 =?utf-8?B?bnF5dm90MDR5ckJqUStKakZUTkwzU1VFY2VYR0JhdjJBbVc2THV0YTRHUmdX?=
 =?utf-8?B?bnREN3NDVnFZYmRBSVNxaU12QWN0bFhoeW1mQkJaN1pOOU81aE53cEZHR3hw?=
 =?utf-8?B?Yjg1UmU3WU5tejJwSXNMUmNVS0VkdEw2OHpwNkZMS2wvbkV1Qm8xZVo1L2x6?=
 =?utf-8?B?K2ZnS1JqOVJZRXVHamxYaHZ2UGZOdnNjREM5THF3R1haS0lzRE5jcUZ4cWxQ?=
 =?utf-8?B?V2VBSDBaUmhLcGMwcWducXgzK045eHhGWTZZWjBKWkpoYlpqamVjVmQvc0Fo?=
 =?utf-8?B?MnlGNWJyWFYyZVRhenlCak1ZK1JZOFJoY3NYbEVDeHQ5Rjdxcjk4S25obVVM?=
 =?utf-8?B?Q1VoNGVaNyszcnlPSEp4MktHZ0E1SXJOSjVIQlVlMDVGYmprOGZjWXlwajNa?=
 =?utf-8?B?VkloMFltc0VKWDIwdi9iZzIxS09VV2V0VERiVnRGVEMrT0YrR2RFT0t0cFlT?=
 =?utf-8?B?UDZDN2t4SXlSWEN5U1NlT0dVRzN6RmxIT2NObEpLWnpmaGJ2K3FtTnRrUkI3?=
 =?utf-8?B?T09MMHNaUmNDQ1hiUW4vVVNQSEJ4dlJLbGdUdVdnVTJ2RGNzbW9PZDdBVkN6?=
 =?utf-8?B?b1dvYkJiVEpxY29hcEFQajl0Sm5LaGEwUGMxOGVFQ0F5enRpSmFXQ2U4eFVP?=
 =?utf-8?B?T1E9PQ==?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aec1419f-6d00-4d27-15aa-08dd869d550d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8774.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 21:40:45.3507 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +bj2zKYqrCfal4xcKlXwj8RbUIAtOY1JuxfbKYP9Q+SZwn8zTC9tl62kc/wuVYqsgbsgUJY0GzpUfN1XSwxnmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8708
Cc: imx@lists.linux.dev, "Shah, Tanmay" <tanmay.shah@amd.com>,
 linux-remoteproc@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Saravana Kannan <saravanak@google.com>, devicetree@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, Chen-Yu Tsai <wens@kernel.org>,
 Daniel Baluta <daniel.baluta@nxp.com>, linux-arm-kernel@lists.infradead.org,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 "Andrew F. Davis" <afd@ti.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>, Shawn Guo <shawnguo@kernel.org>
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gNC8yOC8yMDI1IDM6MjMgUE0sIFJvYiBIZXJyaW5nIHdyb3RlOgo+IE9uIEZyaSwgQXByIDI1
LCAyMDI1IGF0IDY6MzTigK9QTSBJdWxpYW5hIFByb2RhbiA8aXVsaWFuYS5wcm9kYW5AbnhwLmNv
bT4gd3JvdGU6Cj4+IEhlbGxvIE1hdGhpZXUsIFJvYiwKPj4KPj4gSSd2ZSB0ZXN0ZWQgaW14X2Rz
cF9ycHJvYyBhbmQgaXQgZmFpbHMgd2l0aDoKPj4KPj4gWyAgIDM5Ljc0Mzc3MF0gVW5hYmxlIHRv
IGhhbmRsZSBrZXJuZWwgcGFnaW5nIHJlcXVlc3QgYXQgdmlydHVhbCBhZGRyZXNzCj4+IGZmZmZm
ZmZmZmZmZmZmZWEKPj4gLi4uCj4+IFsgICAzOS44MDUwNzhdIEhhcmR3YXJlIG5hbWU6IE5YUCBp
Lk1YOE1QbHVzIEVWSyBib2FyZCAoRFQpCj4+IFsgICAzOS44MTAzOTBdIHBzdGF0ZTogMDAwMDAw
MDUgKG56Y3YgZGFpZiAtUEFOIC1VQU8gLVRDTyAtRElUIC1TU0JTCj4+IEJUWVBFPS0tKQo+PiBb
ICAgMzkuODE3MzUzXSBwYyA6IF9fcGlfbWVtc2V0X2dlbmVyaWMrMHg1MC8weDE4OAo+PiBbICAg
MzkuODIxODkyXSBsciA6IGlteF9kc3BfcnByb2NfcHJlcGFyZSsweDNhNC8weGVhNCBbaW14X2Rz
cF9ycHJvY10KPj4gWyAgIDM5LjgyODA3OV0gc3AgOiBmZmZmODAwMDg1M2RiYjEwCj4+IFsgICAz
OS44MzEzOTZdIHgyOTogZmZmZjgwMDA4NTNkYmI5MCB4Mjg6IDAwMDAwMDAwOTI0MDAwMDAgeDI3
Ogo+PiBmZmZmODAwMDdhMzZkM2Q4Cj4+IFsgICAzOS44Mzg1NDBdIHgyNjogZmZmZjAwMDBkMGE1
ZTQxMCB4MjU6IGZmZmY4MDAwN2EzNmQzZjAgeDI0Ogo+PiAwMDAwMDAwMDAwMDAwMDA0Cj4+IFsg
ICAzOS44NDU2ODVdIHgyMzogZmZmZjAwMDBkNTQxNDg4MCB4MjI6IGZmZmYwMDAwZDVlMWRjZTgg
eDIxOgo+PiAwMDAwMDAwMDAwMDAwMDAwCj4+IFsgICAzOS44NTI4MjddIHgyMDogZmZmZjAwMDBk
NWUxZGI5OCB4MTk6IGZmZmYwMDAwZDU0MTRiODAgeDE4Ogo+PiAwMDAwMDAwMGZmZmZmZmZmCj4+
IFsgICAzOS44NTk5NzBdIHgxNzogMjAyYzY1NmM2OTY4NzcyMCB4MTY6IDNlMjA3NDc1NmY2NTc2
NzIgeDE1Ogo+PiBmZmZmODAwMDgxZjhkMDUwCj4+IFsgICAzOS44NjcxMTRdIHgxNDogZmZmZjAw
MDBkYjU4NDY4MCB4MTM6IDAwMDAwMDAwMDAwMDAwMDMgeDEyOgo+PiAwMDAwN2ZmZmEzMzMwMDAw
Cj4+IFsgICAzOS44NzQyNTddIHgxMTogMDAwMDAwMDAwMDAwMDAwNCB4MTA6IDAwMDAwMDAwMDAw
MDBhYjAgeDkgOgo+PiAwMDAwMDAwMDAwMDAwMDAwCj4+IFsgICAzOS44ODE0MDBdIHg4IDogZmZm
ZmZmZmZmZmZmZmZlYSB4NyA6IDAwMDAwMDAwMDAwMDAwMDAgeDYgOgo+PiAwMDAwMDAwMDAwMDAw
MDNmCj4+IFsgICAzOS44ODg1NDZdIHg1IDogMDAwMDAwMDAwMDAwMDA0MCB4NCA6IDAwMDAwMDAw
MDAwMDAwMDYgeDMgOgo+PiAwMDAwMDAwMDAwMDAwMDA0Cj4+IFsgICAzOS44OTU2ODldIHgyIDog
MDAwMDAwMDAwMDAwODAwMCB4MSA6IDAwMDAwMDAwMDAwMDAwMDAgeDAgOgo+PiBmZmZmZmZmZmZm
ZmZmZmVhCj4+IFsgICAzOS45MDI4MzddIENhbGwgdHJhY2U6Cj4+IFsgICAzOS45MDUyODRdICBf
X3BpX21lbXNldF9nZW5lcmljKzB4NTAvMHgxODggKFApCj4+IFsgICAzOS45MDk4MjFdICBycHJv
Y19ib290KzB4MmMwLzB4NTI0Cj4+IFsgICAzOS45MTMzMTddICBzdGF0ZV9zdG9yZSsweDQwLzB4
MTAwCj4+IFsgICAzOS45MTY4MTJdICBkZXZfYXR0cl9zdG9yZSsweDE4LzB4MmMKPj4gWyAgIDM5
LjkyMDQ3OF0gIHN5c2ZzX2tmX3dyaXRlKzB4N2MvMHg5NAo+PiBbICAgMzkuOTI0MTQ2XSAga2Vy
bmZzX2ZvcF93cml0ZV9pdGVyKzB4MTIwLzB4MWU4Cj4+IFsgICAzOS45Mjg1OThdICB2ZnNfd3Jp
dGUrMHgyNDQvMHgzN2MKPj4gWyAgIDM5LjkzMjAwOF0gIGtzeXNfd3JpdGUrMHg3MC8weDExMAo+
PiBbICAgMzkuOTM1NDEzXSAgX19hcm02NF9zeXNfd3JpdGUrMHgxYy8weDI4Cj4+IFsgICAzOS45
MzkzNDJdICBpbnZva2Vfc3lzY2FsbCsweDQ4LzB4MTA0Cj4+IFsgICAzOS45NDMwOTRdICBlbDBf
c3ZjX2NvbW1vbi5jb25zdHByb3AuMCsweGMwLzB4ZTAKPj4gWyAgIDM5Ljk0NzgwNV0gIGRvX2Vs
MF9zdmMrMHgxYy8weDI4Cj4+IFsgICAzOS45NTExMjNdICBlbDBfc3ZjKzB4MzAvMHhjYwo+PiBb
ICAgMzkuOTU0MTg4XSAgZWwwdF82NF9zeW5jX2hhbmRsZXIrMHgxMGMvMHgxMzgKPj4gWyAgIDM5
Ljk1ODU0OV0gIGVsMHRfNjRfc3luYysweDE5OC8weDE5Ywo+PiBbICAgMzkuOTYyMjIyXSBDb2Rl
OiBkNjVmMDNjMCBjYjA4MDNlNCBmMjQwMGM4NCA1NDAwMDA4MCAoYTkwMDFkMDcpCj4+IFsgICAz
OS45NjgzMTddIC0tLVsgZW5kIHRyYWNlIDAwMDAwMDAwMDAwMDAwMDAgXS0tLQo+Pgo+PiBUaGUg
cHJvYmxlbSBzZWVtcyB0byBiZSB3aGVuIGNvbXB1dGluZyBgY3B1X2FkZHIgPQo+PiBkZXZtX2lv
cmVtYXBfcmVzb3VyY2Vfd2MoZGV2LCAmcmVzKTtgLCBpbiBwYXRjaCA0Lgo+PiBJbiBgX19kZXZt
X2lvcmVtYXBfcmVzb3VyY2VgIChzZWUgWzFdKSwgaXQncyBleHBlY3RpbmcgdGhlIHJlc291cmNl
IHR5cGUKPj4gdG8gYmUgYElPUkVTT1VSQ0VfTUVNYCwgd2hpY2ggaXMgbm90IHRoZSBjYXNlIGhl
cmUgKGF0IGxlYXN0IHRoZSBmbGFncwo+PiBhcmUgbm93aGVyZSBzZXQgZm9yIHRoaXMpLgo+IFRo
YW5rcyBmb3IgdGVzdGluZyBhbmQgZGlhZ25vc2luZy4gSU9SRVNPVVJDRV9NRU0gbmVlZHMgdG8g
YmUgc2V0LiBDYW4KPiB5b3UgdGVzdCB3aXRoIHRoaXMgY2hhbmdlOgo+Cj4gaW5kZXggZjg3OTE1
Y2NlOTYxLi4wMGM5MzU4NTc1OGYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9vZi9vZl9yZXNlcnZl
ZF9tZW0uYwo+ICsrKyBiL2RyaXZlcnMvb2Yvb2ZfcmVzZXJ2ZWRfbWVtLmMKPiBAQCAtNzcxLDYg
Kzc3MSw3IEBAIGludCBvZl9yZXNlcnZlZF9tZW1fcmVnaW9uX3RvX3Jlc291cmNlKGNvbnN0Cj4g
c3RydWN0IGRldmljZV9ub2RlICpucCwKPiAgICAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFM
Owo+Cj4gICAgICAgICAgcmVzb3VyY2Vfc2V0X3JhbmdlKHJlcywgcm1lbS0+YmFzZSwgcm1lbS0+
c2l6ZSk7Cj4gKyAgICAgICByZXMtPmZsYWdzID0gSU9SRVNPVVJDRV9NRU07Cj4gICAgICAgICAg
cmVzLT5uYW1lID0gcm1lbS0+bmFtZTsKPiAgICAgICAgICByZXR1cm4gMDsKPiAgIH0KCkkndmUg
dGVzdGVkIHdpdGggdGhpcyBjaGFuZ2UsIGFuZCBpcyBhbGwgZ29vZCBub3cuIEl1bGlhCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBt
YWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRw
czovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1z
dG0zMgo=
