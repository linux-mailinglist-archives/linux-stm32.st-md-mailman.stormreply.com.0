Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E19C880CF
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Nov 2025 05:25:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4549CC57B72;
	Wed, 26 Nov 2025 04:25:04 +0000 (UTC)
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010018.outbound.protection.outlook.com [52.101.201.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3C433C56611
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Nov 2025 04:25:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NBqqG72dcoBEQLwb3/oMBr2Ki3mPTbp4KWhgCMV0vsooRWyjPC/AsN002BhDrNP35hQQbWxhF5UcuYYusHM/xknwvwKSAbyEBTnP2NZv1dQIHI85SWhKbM/4bvxVVlp8q3YI4FYg6lpdUFUOAJEmChsWuH4oFc2Uh497K2u4XD+LfSivZI6u0M91vxx33He51L+X6Vp3gBNLcCBVcd5exiHBqJzXQE1Bsd1KOZWcFT2hMx262UFO/nOZdYZC8PSQ2cnqz7W8yBOqaeo2IQ24ESwbM7JidiK26ROq5J2oA9RW6bkqUVP4QXRC8xgDeUPOj3eKHCkAks4gAaR2V4jI1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SYzMy/GIcf0MYm+e5IY7n8Ua0Ig+9RP/pCaqyQvO4OQ=;
 b=ielRHED47x2KkfnT6Nj1Op2gRSXGz6z/xBvXT/MMI/H6X65L/gD1CbV1idf7Q5k1BEsr6daRucNVR3MwQC3+Oo99YmXYZ6q0Xe0UsDM72ydZSzQiFDTEaaWrPWo5CwyRIp8JLRnJWV4kGNPTWo/TtxCj9v5Xvmv8bt2hFmpt3vv6yR+BWSJH3nI9+OiGwEbUCt/woGQTPBIvJRaQflqhXggGEUxDSlN35DZCshf3E+5l7sgvYki46VTCVvFuit7nNlTLyBicUZoKs2UWJ1dQrGHgl5mg+4B86P4ECw/CrMLB1va3qQSYvtBf86YUm6DFDYOuELbiFbU21KHhAK37/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SYzMy/GIcf0MYm+e5IY7n8Ua0Ig+9RP/pCaqyQvO4OQ=;
 b=T957LPnfUGQsyNonx68tiLgFqF9BhkMqPzX6BDcNdUnQkNohq7RY5lHvTJxHTLbrOyP5Dj6D1r895uqOhTOjzH3sAvS7mBMZvTxIBKRLY9+DyYb6y6t6JUt85nLrh4uhDb5VKsJE1CV8WkCG8TYgRDbY64X/CJaPhNIen1lmlmUB1hhcfMTdRUxYiAfteuug0NgM+e41I1+wDHaMYH4LxvPx+q8/DJRivDXNizr6Zt5w8p7w4eFaIXk/UHyVUpwWFVkSNCSPtRdguHMBN3xC7HFvrWL+C+4eNcI6mmA6+7B0y495LoxOADHLOPG3wtkHDaApSwg7fSjrdBSJE9ZAww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from BY5PR03MB5364.namprd03.prod.outlook.com (2603:10b6:a03:22e::7)
 by DM6PR03MB5353.namprd03.prod.outlook.com (2603:10b6:5:24b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Wed, 26 Nov
 2025 04:25:00 +0000
Received: from BY5PR03MB5364.namprd03.prod.outlook.com
 ([fe80::7350:f35d:11a2:4c98]) by BY5PR03MB5364.namprd03.prod.outlook.com
 ([fe80::7350:f35d:11a2:4c98%4]) with mapi id 15.20.9366.009; Wed, 26 Nov 2025
 04:24:59 +0000
Message-ID: <ac08a26b-a5d0-4a36-a387-f802c804086f@altera.com>
Date: Wed, 26 Nov 2025 09:54:44 +0530
User-Agent: Mozilla Thunderbird
To: Andrew Lunn <andrew@lunn.ch>
References: <20251125-ext-ptp-fix-v1-1-83f9f069cb36@altera.com>
 <e721d2d5-73cc-4c32-b99c-55f0fb625563@lunn.ch>
Content-Language: en-US
From: "G Thomas, Rohan" <rohan.g.thomas@altera.com>
In-Reply-To: <e721d2d5-73cc-4c32-b99c-55f0fb625563@lunn.ch>
X-ClientProxiedBy: MA5PR01CA0198.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b2::8) To BY5PR03MB5364.namprd03.prod.outlook.com
 (2603:10b6:a03:22e::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR03MB5364:EE_|DM6PR03MB5353:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d5d73ec-f5eb-4352-e9d8-08de2ca3c29c
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SDFaajQycGNSVFljdCtYYXBQbUhVWCtpblBsblRYbTVYVGNYeHhiUGRPS1M2?=
 =?utf-8?B?THZaUE5Nb21aY25IMTF3NGluY3Z4N3dFdGVOaW9uWk1ldGlDTW52U09DSnVB?=
 =?utf-8?B?QWZhZlRaQmhJYW1qS1dqdUMzZGpHR2QrcWpmd0V5WU1Hb0hPaHBndVRTVXp1?=
 =?utf-8?B?VFBjelNYbjZ6VFJxZExxNHN5Y01KNENlcVV6aWl1SmNoWERnRGJuZzRBcSt4?=
 =?utf-8?B?enJ1cEtGeWFnbm8xQllJbXhWMG05UDJjanhHMjBYNDFVQUFCY0dCQUhBb2Ny?=
 =?utf-8?B?SngvZjFDamxUTy9mWkFmY2k0R1BJNnRmSW10NzF1K2hXaTE4a2RjM1FhRml4?=
 =?utf-8?B?OUx5MEFORllSaTkzUWNiRGg1SUR5eFBTYmdhWGZxd213ZndocTZ4eGl2VkdF?=
 =?utf-8?B?azRHdW81YVI0dENFZ0d2VTE1ZVlsbnczQ2NZVVBaQ3N5ZDYydG41SEJja2ll?=
 =?utf-8?B?bUtORWdGYStucDBNOG9JWnlTN2VCaktGTDk0M3g1VjgzN2xtNURwT0EvbzN0?=
 =?utf-8?B?aTlBN3FSQkRDM1N1elVGd3Q1VjF1M29ySmtpMGJrdGxWdzFMSlkyUjNBMHc2?=
 =?utf-8?B?RWhVS0hON3N3UEJySElBblU3RmdaMmd3N3BxUE9ybStpVTRyYXRIaTNTVUdH?=
 =?utf-8?B?ZEEvQkpjb21BdEN5Q2dCam1Rd2dmMXc0RDVJYVlSK0hkLzJoeE5FcVBpR21u?=
 =?utf-8?B?WWpwRmNRVjBObVprSWg3Mm5sSHB1NTRxQ21tV3Q1Zi9oNTFYOGtkanVnV0R1?=
 =?utf-8?B?bmVGMzJSTDBTRjBzNUtHeVpSTnF6R1EvTjJuUmZpZWY4ZTlUbk9zSWJPMXVS?=
 =?utf-8?B?TnJNTzZqb0puQmM5MmF2VHNTWmRvYmk5Z2xkc1ExdFk4b3F1Mk5XdG5rOGZt?=
 =?utf-8?B?WnZCaHd5TFAySEpldkpoY1NQcklzc1pJTktKbXZKZFFBRWJJSVIrWEgzaDhY?=
 =?utf-8?B?cUpMYWZZZ01Wd3pzQVFJVVFjQ0wzaE5HdHJuNlMvdXd6US9hWEZrZFpIUW0w?=
 =?utf-8?B?QzhtTGlUSXVUS2tuSE1xSy96elIvSllxblBxMUxXNmZnSlJqTWhoUGlBWHpq?=
 =?utf-8?B?Ukd5eEFUelkyNTMvanU2NElOZ253UUZGeU4zcks1dDZvMEpuNmhBMzRNM0l3?=
 =?utf-8?B?a1Z0MGpNSGM4TDIyN0dERjd4YTJZb1BXV2FXQkd3WENwRVRjNzJiOVRES0V6?=
 =?utf-8?B?ZHo1MFIxVDlPR0JaOHJrekthSWwzWXhHaUx3U2Zwb2dKS3F6bkpGYWRtUGo3?=
 =?utf-8?B?N21qLzhKKzhBYnQ1KzNGQ0p2WXlhTDlDdm9vYmp3cTBJUVQ2dGJjZ1JHalZi?=
 =?utf-8?B?L2xIYU5qKzlpQU80V3dLNkpjdDdpaVp4UEpuNnlsMlYwT3JLbXNTVDdJOCto?=
 =?utf-8?B?TmNTZTRJT2NrRDErSExMOTRQTENDSHl3anRGenNhUGRHV0V6Mi9JTlJWMzVI?=
 =?utf-8?B?bUxoMnpiVVFwZWNEVFB4OXlHMzlYd3FIRzV2MWlkYzVjMTFZRWpsdVZ2R2ZW?=
 =?utf-8?B?NHBOS2YzeEk1MnlaU3dpNUdpb2dPRHBwVkR4alQzdnJGT1VycGlKWmxoa3RT?=
 =?utf-8?B?MU9xa0lnYkdYZE9SUExKbFJHK3ZkalFadnNBd0lvQ29VcVhqamlWc1J1b1Z1?=
 =?utf-8?B?cXcvUEs4WFJhMEpvOG5RNjBERzZxcXJzVmw3S1QrQWcyc041RWVnUWM3b1E5?=
 =?utf-8?B?SDV4cDJRQmk5dHhWaUErR0hqazlLQVVUSFduazdSQ3JYd3RLMEdBQ3pMV0p2?=
 =?utf-8?B?czJILzlMQXVnNTZ3aGY3czlIWXNVdzNZTFF4NnJMREpEaGFYWXNaWmxqSmda?=
 =?utf-8?B?RUthdi90cUxMQ1ZncHY5cUVkV1BBRnRHRmFpQUcwZit5SXc4ejg4TjNoWjdW?=
 =?utf-8?B?ajRjaTR6Y2hYVEFTOFdWMXRJOEk0aHN6RXNtSHVHL3RqZVVNU2hQTEdrUkI0?=
 =?utf-8?Q?N3dz0alUNL147FsGYv2I8ZB0GTsvOlx7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR03MB5364.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L1pzNUV5eGlhc2lZYU1HQ0R2OVh2Y2hkaUJNNDJqNWJiaDZuL2RXZUpYZmd2?=
 =?utf-8?B?dUxydzl5ZWlEVHZ6QVFqUlJZWllXYXQ5YVoxT0t6MjV2SDF3N1ZuNUEvT0dP?=
 =?utf-8?B?MUs0Rm5JV29ZTktzU01YQWdRTEgrSzlFNHlBV1E0MGpYYjdyZUtvbEFaZ0ZR?=
 =?utf-8?B?bGdJcXJudVJ5T1dPcnRGRWExZzF1bWhtTkkrZktWcVRmd3VmZ2RJbVdFei8z?=
 =?utf-8?B?eDE4WTBKU3g1N2VCMFY4TEt1YWF6L3VxOEdoajNNL0Zibm1OME1rZThsUUgy?=
 =?utf-8?B?ZkVucS9WV1JxT3pCODVLMFJzSkJ6WnlZZ2JxZVo1NjFuVUkrKzYyRHlBY1RZ?=
 =?utf-8?B?K0h1NjdmUVhBVzJ5NHB5UHdaczZ5VWtIekd1bXpPUTQ5bnhhQXB1UUswM2NV?=
 =?utf-8?B?cEpvRUxsaHYwT1hUbU11UUplalRBODhHM29PQ0cwa3ZHY2NxdDFxd0VLcVZn?=
 =?utf-8?B?ZXVWOHFWUWJQcXNaWmxTci9GNndxQkhJcWtyYmdZRGlqSnJiN1JBWmdhKzZT?=
 =?utf-8?B?VjNTUDhyNmNldjNGeVk2VWJTd2I3dTk1bVAwcTNyV3J5Yk9WZ1JwUFdZMTl2?=
 =?utf-8?B?cTkzaldLUlFxejBrUWsrM0NUaUNVZFNPOHFiZ3F5THd4VlR0Q2RBVnJBRTNj?=
 =?utf-8?B?a2cvWjdZVnNraXFDbWFDbVlJTEtDNmV4TnpKUDcwM2w1Vm1wZ0lVNmMvbi9l?=
 =?utf-8?B?a1BwZm43a0hha0VOdWRTT3lINU5sakdOemdQZGJvOXpmZXNTRmJqZTZUdGNB?=
 =?utf-8?B?SlByWjFhUzlLRURCQnhHRDgyYUVWRGYxTUNJdG9OcXRtazlwSW1ZUUdFM0JC?=
 =?utf-8?B?cDhNb1k2TlU5Q3ZXRWk3Ykg5aGRMOTM1OTRmcnl1ZDZWak9KRDFPQ3pzOGpx?=
 =?utf-8?B?ZEJRUXdxWXVFRFR0b1dRai9EVTdTbE95OURGaWZqSmplVStPYTFSRHFPNm9F?=
 =?utf-8?B?MzBRT21jM2ZKUlp3NVl2TkhjSUNwYSs0bzREQmMrTDdqWjhsOTk3cWxFcWVQ?=
 =?utf-8?B?UkNsYTYrMU1lb0FpOUNOV21KMUQ1RThEWjdPSWJseXREVnd5TnlFWkxNRjQx?=
 =?utf-8?B?c0g0OEY5T1lvTU5XRnh3K3BjbkVHTWdWaUgybVJ1RHFjVCsrQzQ5Y0g0L0ty?=
 =?utf-8?B?Z0gwMFVlQ2RiNHJWRVRWNXpWaU1mQ3YwVnBmaDcwZlY5bjBIT09GMW1CZEF4?=
 =?utf-8?B?SHVMQ3NEeUtuTE5RRnpOdjA0RjhtTGYwYlJoYXdOYVpLbmw1bDdQVVdMckN3?=
 =?utf-8?B?MGJNSXdkYVIyc00wZ1R3Um5xOEFwcDNBUkd2c3RPOFNkQXh3bnIyaXNPZndr?=
 =?utf-8?B?WER4REgxd0tFa3FUWitPNWZFZ0ZMcnI1SUR1M2IyTFZJc3lQVmM0M0l2VjJh?=
 =?utf-8?B?WWZsUmQ0ck1MOEdkbzJ1ZzRiNVNlQ2dXUnFOb1N2TWlOeFU4czlSZDVReXNu?=
 =?utf-8?B?M1pGZXExOWNSeFc2VkNEaFd3UUlqdElaVkpDdjRDSGtjb05tSXNPMHIxb09Y?=
 =?utf-8?B?Vmo3MCtKc0x2L2xPUVhJMlVZWUVKb2ZmUndFVUVCcUM0M3pIQlhnUG13VFBh?=
 =?utf-8?B?T1dlaUx2T1B3RXI5SEtqaFFYS1YyU01BWHU4QS9TUDBGSmlwUWxDRHpreXJ5?=
 =?utf-8?B?QU4wa0ZJNXdidHE4TXdBcTRzc1l1cW1lMkozTktGcjNCQW4xTHJjZUN0djFz?=
 =?utf-8?B?cW8wVk1aRmd0VjRoemtFRGZvOHdkVEtyV1MwSzdBZzFTTHhNVWJ1K2lSYjcr?=
 =?utf-8?B?WVdTeGxYRUtzR3FjQ2M2SFVkejl2VjRLRWNWbUJyLzgzUUZtMWJCM3ZRZmdN?=
 =?utf-8?B?RytGYXgvc2hRL3JrbmlPLzQ4MUtubEtxMFZTdEU3WjUzMUJXaFhoU2tTNlVS?=
 =?utf-8?B?TDF5UmdTNERCU2lWT1BURW1rdU9pZW5sL250d1pRVkkwZ0dpdHBpTndZelR1?=
 =?utf-8?B?SUdMek1tV3AxNnVxRGt0R2xpS3JvQVZiSTBUU0lKQzZaMEsvdUQ2UVBMSlZ4?=
 =?utf-8?B?SGN3c1VXVU9LUmQ5Y0RmdkFDZE1XWm4vVWZsYWw4VXJBNGpuNW9yczVVcUUr?=
 =?utf-8?B?cjBtMkE1WVJFdzBjVG5PT3FoV0pINzNUSFQybjNtdUNkTmxib2syMkFpSmxJ?=
 =?utf-8?B?QVA2RVVBMlpYTWtOWUM5amlFWU9ZY2xRellrK0RrRjlncVo4M2d0SUswNXM5?=
 =?utf-8?B?Tmc9PQ==?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d5d73ec-f5eb-4352-e9d8-08de2ca3c29c
X-MS-Exchange-CrossTenant-AuthSource: BY5PR03MB5364.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 04:24:59.4712 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ieOcedu9TpA0n7UFXFfSopDuGcqpNqULU4xmyaJjcWZazF+Vgcyuuv9KyoR9ZxTbLa5RRzfWQnoRi2u9YKDVFxkfc9WI7L5rkn76VmQro4o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5353
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Fugang Duan <fugang.duan@nxp.com>,
 netdev@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>,
 Kurt Kanzenbach <kurt@linutronix.de>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: Fix E2E delay
	mechanism
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hi Andrew,

On 11/25/2025 9:56 PM, Andrew Lunn wrote:
> On Tue, Nov 25, 2025 at 10:50:02PM +0800, Rohan G Thomas via B4 Relay wrote:
>> From: Rohan G Thomas <rohan.g.thomas@altera.com>
>>
>> For E2E delay mechanism, "received DELAY_REQ without timestamp" error
>> messages shows up for dwmac v3.70+ and dwxgmac IPs.
>>
>> This issue affects socfpga platforms, Agilex7 (dwmac 3.70) and
>> Agilex5 (dwxgmac). According to the databook, to enable timestamping
>> for all events, the SNAPTYPSEL bit in the MAC_Timestamp_Control
>> register must be set to 2'b00, and the TSEVNTENA bit must be cleared
>> to 0'b0.
>>
>> Commit 3cb958027cb8 ("net: stmmac: Fix E2E delay mechanism") already
>> addresses this problem for all dwmacs above version v4.10. However,
>> same holds true for v3.70 and above, as well as for dwxgmac. Updates
>> the check accordingly.
>>
>> Fixes: 14f347334bf2 ("net: stmmac: Correctly take timestamp for PTPv2")
>> Fixes: f2fb6b6275eb ("net: stmmac: enable timestamp snapshot for required PTP packets in dwmac v5.10a")
>> Fixes: 3cb958027cb8 ("net: stmmac: Fix E2E delay mechanism")
> 
> Given the list of Fixes: do you want this back ported to stable? If
> so, you should not submit it for net-next.
> 
> 	Andrew

Thanks! Sure, I will send the next version to net instead of net-next.

Best Regards,
Rohan
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
