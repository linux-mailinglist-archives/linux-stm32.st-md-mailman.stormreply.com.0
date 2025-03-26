Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF9EA7178F
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Mar 2025 14:31:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 22674C78F67;
	Wed, 26 Mar 2025 13:31:19 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013039.outbound.protection.outlook.com
 [40.107.162.39])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 10BCBC71280
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Mar 2025 13:31:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n4Bn00Og/Rv/rRP9jIf1gvr9snWqGc4Z4UVENXSdy8w0JkouCuwXCFHvb/9eN/5qlRTz9Tb6grZA6McfjLc4NvJcWw3GZiLg0CIWawdBWCxWemujsoHX8xfTNCtmJ2EyxSouuAmlwksZYj+jAwY7uv+X8p6ERIE//6GSqTRcn0i8+2mqX1A3ezd/SposUk19Iy5FLqtMUiLcOOIAbabK9UajwigO4G0AvPPVD9iUCmhXkU6/uEK8s4ZNg+uQR44beyuW/yvWP88kyJAN8mSifPXVZbgtmVmRH3VtLCVFJoZdr8/xPmPPiB2KVM9rpEYtY4+Nc+1gE5ldfImva3vPyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YnBFVHU6d/YAjyXH+U4GdR5Z8mjPJIBomVlgza2xcuc=;
 b=krswemMkbixaq+zuGUETaQ+GC6Gtc4fPdIzvWzAoBWzTkKH4JUV0s+8GPpQDTUdJmJ5CJvIs/cXUxe9Jo7eNDTm2vP2g8SSoA0dFPN/uNLNov/mDQJb84fRXipz5LYi3hKhnp1o7G0i80AxsgOOcL83189MTchqe7PFMd4cSiZiRHzI6NZw4odaueHwg1ubncn2Ad9BxxsxNl/5m8cfzba4/9gYZFqxNtxSMdA7HICUuLbwlQFmmaBbICf/AuCCwcihgkl/gtuVeqOAqVcRrg3s9XKTcCX3YPPp7MBfrc4GM8QNSLIu+DTamtZgHvk2d6YXiAUM4Uca/EKs2gdxRjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YnBFVHU6d/YAjyXH+U4GdR5Z8mjPJIBomVlgza2xcuc=;
 b=iCX9GnB0vvL1prhGAujcDTUeotohYASqrVgJNnVLXggdvQ4AqkiENwcUkY0qdNGbtsViYS+N/QH1vNCegx8YE7fUhSW4+tfb+2tJSOE7iakXBi9uD43XqVIVIr6j7HIgINORPLmBginO27Yp5PpEaMMeurylsCahGaIKZbVYn0LGTNhBnRNBcdLn77ibJv2ElU4lj/ty9YTjq3YgYejHXbBNgCOHCTZbHGOO21WOyBbLF+j8mkaTsTaAPov28qXZe3PlSqD3yInIz3dwP6nuU0TTQmsW/D9eJNbrETzNqp7ciZMP0sf0p+GiPwrTSjTjfidgJpZ3wjPV/Azbmefe7A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU2PR04MB8582.eurprd04.prod.outlook.com (2603:10a6:10:2d9::24)
 by AS8PR04MB8962.eurprd04.prod.outlook.com (2603:10a6:20b:42d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Wed, 26 Mar
 2025 13:31:14 +0000
Received: from DU2PR04MB8582.eurprd04.prod.outlook.com
 ([fe80::c96e:12f1:67b7:ed74]) by DU2PR04MB8582.eurprd04.prod.outlook.com
 ([fe80::c96e:12f1:67b7:ed74%5]) with mapi id 15.20.8534.043; Wed, 26 Mar 2025
 13:31:14 +0000
Message-ID: <6b48ad6a-2b45-455f-1ba8-3d90deb516f4@oss.nxp.com>
Date: Wed, 26 Mar 2025 15:31:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Content-Language: en-US
To: Daniel Lezcano <daniel.lezcano@linaro.org>, tglx@linutronix.de
References: <20250324100008.346009-1-daniel.lezcano@linaro.org>
 <20250324100008.346009-2-daniel.lezcano@linaro.org>
 <d60fca36-0beb-2574-cb82-3969bbfb58a9@oss.nxp.com>
 <8c208e8c-2e1e-430c-916a-dbc6732881b0@linaro.org>
 <065d6f32-3161-8316-bbbd-4da18eef839b@oss.nxp.com>
 <098c5de8-9291-4f3e-a276-500825cac7c5@linaro.org>
 <068713cb-47ca-ae26-e113-9f5026be9196@oss.nxp.com>
 <cc2dd75c-e279-4e55-ab88-75498e93146a@linaro.org>
 <50d2c651-746e-4ddd-4036-f72742a622f8@oss.nxp.com>
 <e8054f85-2a23-4ceb-8e1c-7cdfe7c87628@linaro.org>
 <a31a575b-8f6d-6317-f172-b4f8b1a5cda7@oss.nxp.com>
 <f1268261-c900-4adc-aefe-795f23faba59@linaro.org>
 <2d7b18bf-31ed-abfc-20db-7f5b54c812af@oss.nxp.com>
 <16d02edf-181e-42a1-8b0f-cdef61109fbf@linaro.org>
From: Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
In-Reply-To: <16d02edf-181e-42a1-8b0f-cdef61109fbf@linaro.org>
X-ClientProxiedBy: AS4P190CA0002.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5de::11) To DU2PR04MB8582.eurprd04.prod.outlook.com
 (2603:10a6:10:2d9::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8582:EE_|AS8PR04MB8962:EE_
X-MS-Office365-Filtering-Correlation-Id: 9792cad7-32ea-4c32-82d3-08dd6c6a7add
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TWhlMm1JMEhmUTNXcUlkVnY4dURtVVEwMFJEejU3RW4ycDdrWnJOREVWaHEv?=
 =?utf-8?B?NUkyYURCaG9NSENlaFZGLzdxQ0pDNGFLZFhLUVNPeVUwSk5SVkU4dTAvWFhi?=
 =?utf-8?B?SjZoYzBOSU5jNXVZWERYNG9xZmVsV0VnU05pVlZvb2RxMG5OZ3lWdUZ4dzYv?=
 =?utf-8?B?QW5LV3AvQysvdFJPUnlqMU5icFB6SFlGUlZCeDRtL0F5eXJNZG5nMm1Uejh1?=
 =?utf-8?B?REZxNXVzV0pOYlZtT0d0Kzd3ZjMxTDdBYWE0RXdkdXVlc2hmWkI1YnpabXlt?=
 =?utf-8?B?TkJsK3g0WWNMV3krQVpCQWk4MEVWTmdUQUVMcXg1dXhCLzB2TkNjbDdyc2No?=
 =?utf-8?B?L2tFUDduS0ZIYlFkZjMveHhDRlFNY1ljMmo0STdwcUNuMWg1aXpXTWdDT1BM?=
 =?utf-8?B?aFBmalAvcTVJbndUZ2ZsQ09nVCt4UDFKYlVETUlZT1JNaDg1SUF1M2owRkdG?=
 =?utf-8?B?S0hmelpDQTNCUDhmWFdPRVdZcHo4QTA4QWNyejZxMVZ1QU11eVlxRXFWRWd0?=
 =?utf-8?B?V09mblJLdjFIa2RncFduVUtjUG5jUkJrSDhrejdJcUtJcm5zSDJBVXU2MTR4?=
 =?utf-8?B?YkkvSko1eGo4R1BxMFpDNU8xNGw2dGd5ZmZRUlhkSXBZL2hxZWpXaVo1ODgr?=
 =?utf-8?B?anZHQWlqdXNESEdSTjBMNThNeUoyZ1NtcTBsSDBUSTl3WjdjTzIyajBNUTB1?=
 =?utf-8?B?LytOVFYvbmZ6TVJneml5S0MvZkJuczY4eTlYVk1TbVlucnhMc21Wa2syTGNt?=
 =?utf-8?B?Wk96NGh3bGkyMnl4bktQNmVqUUZzemhtbzVXNVV2MG5xbmZTVWtLdGc0RzEy?=
 =?utf-8?B?ZmtMZ2gwdGxXZDcyYVZvN1lsSDJSU0F0TlVrN2hkcVp3K2lkUHg3NUdyUG80?=
 =?utf-8?B?Si9TUEZNbGVKNEZDNU43SllxNjltOUtZQmJrV0EvbFk2MHo5cCtRb0YyVi8v?=
 =?utf-8?B?N3hMVzBuQVpLUDYxbVZ2bGZqUVJGYzNTb0ErUzV4MDFoL3ROTEx2ZnVuUHpH?=
 =?utf-8?B?U3pwVWU2WFlpdHMwQnFGL0VqSUdBQXZtcVJ0bStnMVp1UC9CVVViOVJjOGhl?=
 =?utf-8?B?bEk4WHhyMnE2VDNuRUhTSTF6bGE1T2NRQVlkMW1XL1p4dnNkUHY0UkZtTlY1?=
 =?utf-8?B?L1ZVc0l0NEFYYnpMOUdNaDhFUXZCTWJxeWRDNlFjRmh3VWdWblYyOWlLQUR1?=
 =?utf-8?B?YTYxZXBDdFZXMmliUXBPQnRwdGhjOGFXYVdVVEJWekZ0NjdWOXl2ck1MRzR2?=
 =?utf-8?B?TkJocDg1S3lkRFhqQXFyVDlBUlFJUmdUMmM5K3hFOVpXeTIwRE5WcE9kNjBu?=
 =?utf-8?B?Si9Kbm96NE9ZUWU0THVkSVhpc3NlenZRekVHbXQrZ21zZGZsK0NSc1RzZWFL?=
 =?utf-8?B?RWRTMlEzMUNMYkxPNzZYdUtlemNucE1Rb0hUVHJJdVJVL3JyYkdxek1kN0FV?=
 =?utf-8?B?VTNsZFdjNUdON1EwSEd2OStmNWMvTi81aUlvQjZMOVMwdjE2VWhGQ3hJUUg5?=
 =?utf-8?B?UHdwNXZlSDViRitHYTNDVmIra1lYTm94RjV1ZjBuejg1b2thbFdtWlR3OVU4?=
 =?utf-8?B?bmVLNTljaTUrZEdNSEJnVWExckhickFtamRIQTU5U0dEdFlhQWtzUjVSK0Z0?=
 =?utf-8?B?WEhiSGZtVCs0NmF0blF4dXFQNHA2OWdSbVFrdzVKRTlyem50NkJOcHdIQS9k?=
 =?utf-8?B?eDBxK2daUmJRT0I5c3NHcnhUU0JSYUlxczdjdzB2aXhVM3hwaFd0Y1MweEU3?=
 =?utf-8?B?ckMzcXoyU3JRUHdqR2E4amlOZDdQTGY5RG1ZV2hYaU1lVE9ldzBqWmVoWVU1?=
 =?utf-8?B?bm4rb1FLQVc0d3ZsZ0w2VjdsclBsd1d5eEswRDdjOENEb1FGRnV1TFZhcDBD?=
 =?utf-8?Q?zp+lADKDG12Be?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU2PR04MB8582.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RHcyNUpLOEdSQkRnREd0YTA5dm9oK3Qya1FMMXEveTROYnhNb1ZtbFBaODZK?=
 =?utf-8?B?dXVFT2pWeTVUendaeHArZXhHVU1xblhGMjVPY3hlOUN5TmRpMHk2dnZFTmVk?=
 =?utf-8?B?MFVyTTlLdUFEdnUzeXB6YkhpaDFIVjNPd0hZMnVlWTFTU2U4eVJkZVZrL1Zk?=
 =?utf-8?B?ZVBHcWxRU2pCYzY4akJxa21OYjBBVEsvVkl1RVVCeXZ0Rnd0U2lvL2xEZytt?=
 =?utf-8?B?Mk1WRmJFdkRXNUViZDhFOFFhQlNYaDdJbDJBbTZrYy9nRTA5ZjFCRGpFbUJp?=
 =?utf-8?B?UnhzWTRZWi9iNzUxbFBSZkQ0cFFqMWxlcHA3OXVyKzk2NFNhWWphTU9xWHAr?=
 =?utf-8?B?QmgzVXBXU01hTEhmenlhS2V6bkNrRXRFY0xXNkhOZnZCVzB6RGdBUEtCY0Vt?=
 =?utf-8?B?Z21nUjZUdnNaZUVqdnpjZitWNmtUL3VBMVhOT2IyRWxlMkF2cXcwN3ZPQlcv?=
 =?utf-8?B?WlRzQmY2SWFRMFpvVFNpQjZOZ2x2OEpYT0dmc2RzT3A4MUFhQUtUV05wUlVV?=
 =?utf-8?B?RFVEamQ1b2JwMFBpeWtqT0VBQlJVNmlYLzZCanRCNkVKakUzNk5QbHJrQ0Zs?=
 =?utf-8?B?djFEOXBtWDBpMVB2TlFWSjVWSmt6VHRrTStjQk1aYnV0R2xCMDVYUmUvbVh5?=
 =?utf-8?B?dW5xcm0xMCtQR1krZVErZjArSFJFbHBaYzA3cDhXM0MzY3dTbUdqdXI4cDB3?=
 =?utf-8?B?aUN1MzlSKzdtNityejFDSGV2dSs4Q2Qzc0xURm5PSjluc1phSmxuOTI3NVhC?=
 =?utf-8?B?NDRmT3pJQ0lzNmxhT1lXZEVyWk1YOUpxaUEwMGV2cmErc0FvTm5UKzlmLzV3?=
 =?utf-8?B?WUJrKzh1RmZPWjdzRHlpbEFGWndsbXAvSUN2c0w1REltOVVvTitReTVVQTdt?=
 =?utf-8?B?Zk9adFdRa2lkZ0lBcTV4ZUpiNXYxd3cwSmI2aTBOZmJGT1loSE14WXMrUDVs?=
 =?utf-8?B?RDltcDVRaC9yUVp5R0w1d1hJSGlVdGN3eUkwcTNPc2M0N1d0OHk5SXZkL1VQ?=
 =?utf-8?B?ZWR0UERvNDNxZG1ObXExd29rREpNN0tQdEtFUmM0WURhTVFrZFk5VW9IS0Yz?=
 =?utf-8?B?dVFqbHBkdlZaaGhJSDN3NmVWeXR2bktNY04xYnVEVTFKS2NNd1lDaERYM1Rn?=
 =?utf-8?B?NnNmUDhqQmdHMlMzc084ejFYb2YrMkl6MXFIQnBPcmxSMlZzY0hQdTMrWW00?=
 =?utf-8?B?d0JGdzFNSzZXS1BrU2hueExEL1JGM3RkajhvalFwMkM1T01ZWWJYVWtvQUE4?=
 =?utf-8?B?YW5jZ2VteW50RGk2KzdlVVFWNEJIQTRIc1czQjg5RjlDb0RnZzdDdmJaWDFp?=
 =?utf-8?B?L3l5cGo4MW51SGR0aEtseUNpYUtveWF2bCtKMGhNWHdtbEFkUlFSWHJnWFpY?=
 =?utf-8?B?RTlCMWYwYnRhTVNsdHhhRmFreUNBeUR4Yjc5aDZGQVo4SjFMcVk2aUNQUFFl?=
 =?utf-8?B?ZlRFclB2aW1nM0ZUV1IwYTJodzhsOVZMVXplWjUwaDd4ZjAzOEVzK3UyVEJF?=
 =?utf-8?B?OUNVOERtOElnM3FGV0cxeFBSdXRNcVRNN013MldCQWRwSUxjSllmNHkxbXZN?=
 =?utf-8?B?R2dwcmlCZVFYcm8ySGN4VU5VdzNRMW5weWttZVB0d1Ivb2h6TjdDUDk5MFds?=
 =?utf-8?B?ejV3ZkdVbE1SdG9GeXBlcENzN3dNNmQ2WHVEeTBYazFBMHBsbTNMS0I4ek40?=
 =?utf-8?B?N0pSbmNwdDRvZDJTMnlsa1J0YXFudkFYSVpDcVNjeW1hWnhlaWkwcWZpaUNr?=
 =?utf-8?B?Zk1pYVZvZTZUMmVpRHBBeEF3eG1FTFEvTFY0bUZGNjU3ckJHeWplTXJ1WXkv?=
 =?utf-8?B?NjlWbG1kci81Y0lCNXdaY3k5K3ZtaFJEN3QySm1uaXpxS212UTBxZThqMHZD?=
 =?utf-8?B?WnNMQjBFVG1Dd29UYXRTbVhoVHRrWlF0eEZKWlRaVEJYQ2ZQZVRFQWVSaHFn?=
 =?utf-8?B?SHRiQlYvbWxtU3RaZTJHdW91alVXVTZKV2dYMlUyOGVaQjZQcjlYQzRaMERv?=
 =?utf-8?B?NWhSSzZST2VDWk9yK25FS215cGtsS2JXcWE0NXphVzhGYVRFVlIxbjdFS3pS?=
 =?utf-8?B?Si9uSEg5dDVyMkx1TlkrZlFBa0h1SWVhOWpYbG9GOVl4bE8rNkkrb2pqTjZw?=
 =?utf-8?B?ellPMDZ0NWQ4QVJtb2MvTEduMjIyL09wcWZoTmI0VVgvUHNwdDlac3N5T3pv?=
 =?utf-8?B?VkE9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9792cad7-32ea-4c32-82d3-08dd6c6a7add
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8582.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 13:31:14.3077 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lGrddyekgyPYqNSgT3pCuIdotcQk3S/K2QIwSbx+fkRBgeYwgx6OQns6tssGaM7p5LyCkzr/LXGaHmMfScXZ/GvFdiC44DZBC7G9zM4Nqz0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8962
Cc: NXP S32 Linux Team <s32@nxp.com>, "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Larisa Grigore <Larisa.Grigore@nxp.com>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Thomas Fossati <thomas.fossati@linaro.org>,
 Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
 "moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 2/2] clocksource/drivers/nxp-timer: Add
 the System Timer Module for the s32g platform
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

T24gMy8yNi8yMDI1IDEyOjMxIFBNLCBEYW5pZWwgTGV6Y2FubyB3cm90ZToKPiBPbiAyNi8wMy8y
MDI1IDEwOjU3LCBHaGVubmFkaSBQcm9jb3BjaXVjIHdyb3RlOgo+PiBPbiAzLzI2LzIwMjUgMTE6
MTkgQU0sIERhbmllbCBMZXpjYW5vIHdyb3RlOgo+Pj4gT24gMjYvMDMvMjAyNSAwODo0NCwgR2hl
bm5hZGkgUHJvY29wY2l1YyB3cm90ZToKPj4+PiBPbiAzLzI1LzIwMjUgMzo1NCBQTSwgRGFuaWVs
IExlemNhbm8gd3JvdGU6Cj4+Pj4+IE9uIDI1LzAzLzIwMjUgMTQ6MjEsIEdoZW5uYWRpIFByb2Nv
cGNpdWMgd3JvdGU6Cj4+Pj4+PiBPbiAzLzI1LzIwMjUgMjo1MSBQTSwgRGFuaWVsIExlemNhbm8g
d3JvdGU6Cj4+Pj4+PiBbIC4uLiBdCj4+Pj4+Pj4+Pj4+Pj4gK3N0YXRpYyBpbnQgX19pbml0IG54
cF9zdG1fdGltZXJfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZQo+Pj4+Pj4+Pj4+Pj4+ICpw
ZGV2KQo+Pj4+Pj4+Pj4+Pj4+ICt7Cj4+Pj4+Pj4+Pj4+Pj4gK8KgwqDCoCBzdHJ1Y3QgZGV2aWNl
ICpkZXYgPSAmcGRldi0+ZGV2Owo+Pj4+Pj4+Pj4+Pj4+ICvCoMKgwqAgc3RydWN0IGRldmljZV9u
b2RlICpucCA9IGRldi0+b2Zfbm9kZTsKPj4+Pj4+Pj4+Pj4+PiArwqDCoMKgIHN0cnVjdCBzdG1f
aW5zdGFuY2VzICpzdG1faW5zdGFuY2VzOwo+Pj4+Pj4+Pj4+Pj4+ICvCoMKgwqAgY29uc3QgY2hh
ciAqbmFtZSA9IG9mX25vZGVfZnVsbF9uYW1lKG5wKTsKPj4+Pj4+Pj4+Pj4+PiArwqDCoMKgIHZv
aWQgX19pb21lbSAqYmFzZTsKPj4+Pj4+Pj4+Pj4+PiArwqDCoMKgIGludCBpcnEsIHJldDsKPj4+
Pj4+Pj4+Pj4+PiArwqDCoMKgIHN0cnVjdCBjbGsgKmNsazsKPj4+Pj4+Pj4+Pj4+PiArCj4+Pj4+
Pj4+Pj4+Pj4gK8KgwqDCoCBzdG1faW5zdGFuY2VzID0KPj4+Pj4+Pj4+Pj4+PiAodHlwZW9mKHN0
bV9pbnN0YW5jZXMpKW9mX2RldmljZV9nZXRfbWF0Y2hfZGF0YShkZXYpOwo+Pj4+Pj4+Pj4+Pj4+
ICvCoMKgwqAgaWYgKCFzdG1faW5zdGFuY2VzKSB7Cj4+Pj4+Pj4+Pj4+Pj4gK8KgwqDCoMKgwqDC
oMKgIGRldl9lcnIoZGV2LCAiTm8gU1RNIGluc3RhbmNlcyBhc3NvY2lhdGVkIHdpdGggYQo+Pj4+
Pj4+Pj4+Pj4+IGNwdSIpOwo+Pj4+Pj4+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVJ
TlZBTDsKPj4+Pj4+Pj4+Pj4+PiArwqDCoMKgIH0KPj4+Pj4+Pj4+Pj4+PiArCj4+Pj4+Pj4+Pj4+
Pj4gK8KgwqDCoCBiYXNlID0gZGV2bV9vZl9pb21hcChkZXYsIG5wLCAwLCBOVUxMKTsKPj4+Pj4+
Pj4+Pj4+PiArwqDCoMKgIGlmIChJU19FUlIoYmFzZSkpIHsKPj4+Pj4+Pj4+Pj4+PiArwqDCoMKg
wqDCoMKgwqAgZGV2X2VycihkZXYsICJGYWlsZWQgdG8gaW9tYXAgJXBPRm5cbiIsIG5wKTsKPj4+
Pj4+Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIFBUUl9FUlIoYmFzZSk7Cj4+Pj4+Pj4+
Pj4+Pj4gK8KgwqDCoCB9Cj4+Pj4+Pj4+Pj4+Pj4gKwo+Pj4+Pj4+Pj4+Pj4+ICvCoMKgwqAgaXJx
ID0gaXJxX29mX3BhcnNlX2FuZF9tYXAobnAsIDApOwo+Pj4+Pj4+Pj4+Pj4+ICvCoMKgwqAgaWYg
KGlycSA8PSAwKSB7Cj4+Pj4+Pj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGRldl9lcnIoZGV2LCAi
RmFpbGVkIHRvIHBhcnNlIGFuZCBtYXAgSVJROiAlZFxuIiwKPj4+Pj4+Pj4+Pj4+PiBpcnEpOwo+
Pj4+Pj4+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVJTlZBTDsKPj4+Pj4+Pj4+Pj4+
PiArwqDCoMKgIH0KPj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+PiDCoMKgwqDCoMKgwqBGcm9tIGNv
bW1pdCBkZXNjcmlwdGlvbjoKPj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+Pj4gVGhlIGZpcnN0IHBy
b2JlZCBTVE0gaXMgdXNlZCBhcyBhIGNsb2Nrc291cmNlLCB0aGUgc2Vjb25kCj4+Pj4+Pj4+Pj4+
Pj4gd2lsbCBiZQo+Pj4+Pj4+Pj4+Pj4+IHRoZQo+Pj4+Pj4+Pj4+Pj4+IGJyb2FkY2FzdCB0aW1l
ciBhbmQgdGhlIHJlc3QgYXJlIHVzZWQgYXMgYSBjbG9ja2V2ZW50IHdpdGggdGhlCj4+Pj4+Pj4+
Pj4+Pj4gYWZmaW5pdHkgc2V0IHRvIGEgQ1BVLgo+Pj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4+IFdo
eSBpcyB0aGUgaW50ZXJydXB0IG1hbmRhdG9yeSB3aGVuIHRoZSBub2RlIGlzIHByb2JlZCBhcyBh
Cj4+Pj4+Pj4+Pj4+PiBjbG9ja3NvdXJjZT8KPj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4gSXQgcmVs
aWVzIG9uIHRoZSBEVCBkZXNjcmlwdGlvbiBhbmQgaXQgZG9lcyBub3QgaHVydCB0byBoYXZlIGEK
Pj4+Pj4+Pj4+Pj4gY29uc2lzdGVudCBjb2RlIHBhdGggZm9yIGNsb2NrZXZlbnQgLyBjbG9ja3Nv
dXJjZSBldmVuIGlmIHRoZQo+Pj4+Pj4+Pj4+PiBpbnRlcnJ1cHQKPj4+Pj4+Pj4+Pj4gaXMgbm90
IHJlcXVlc3RlZCBmb3IgdGhlIGNsb2Nrc291cmNlIGxhdGVyLgo+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+
Pj4+Cj4+Pj4+Pj4+Pj4gSWYgc28sIGluIG15IG9waW5pb24sIGl0IHdvdWxkIG1ha2Ugc2Vuc2Ug
dG8gdXNlIHRoZSBzYW1lIFNUTQo+Pj4+Pj4+Pj4+IGluc3RhbmNlCj4+Pj4+Pj4+Pj4gZm9yIGJv
dGggdGhlIGNsb2Nrc291cmNlIGFuZCBicm9hZGNhc3QgY2xvY2tldmVudCwgYXMgYm90aAo+Pj4+
Pj4+Pj4+IGZ1bmN0aW9ucwo+Pj4+Pj4+Pj4+IGNhbgo+Pj4+Pj4+Pj4+IGJlIGFjY29tbW9kYXRl
ZCB3aXRoaW4gYSBzaW5nbGUgU1RNIGluc3RhbmNlLCB3aGljaCB3aWxsIGhlbHAKPj4+Pj4+Pj4+
PiByZWR1Y2UKPj4+Pj4+Pj4+PiB0aGUKPj4+Pj4+Pj4+PiBudW1iZXIgb2YgU1RNIGluc3RhbmNl
cyB1c2VkLgo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IFRoZSBicm9hZGNhc3QgdGltZXIgaXMgc3RvcHBl
ZCB3aGVuIGl0IGlzIHVudXNlZCB3aGljaCBpcyB0aGUKPj4+Pj4+Pj4+IGNhc2UgZm9yCj4+Pj4+
Pj4+PiB0aGUgczMyIGJlY2F1c2UgdGhlcmUgYXJlIG5vIGlkbGUgc3RhdGUgcG93ZXJpbmcgZG93
biB0aGUgbG9jYWwKPj4+Pj4+Pj4+IHRpbWVycy4KPj4+Pj4+Pj4+IFRoZXkgaGF2ZSB0byBoYXZl
IGJlIHNlcGFyYXRlZC4KPj4+Pj4+Pj4+Cj4+Pj4+Pj4+Cj4+Pj4+Pj4+IFRoaXMgd291bGRuJ3Qg
YmUgdGhlIGNhc2UgaWYgdGhlIFNUTSBpcyBrZXB0IHJ1bm5pbmcvY291bnRpbmcKPj4+Pj4+Pj4g
ZHVyaW5nCj4+Pj4+Pj4+IHRoZQo+Pj4+Pj4+PiBjbG9jayBldmVudCBzZXR1cCwgd2l0aCBvbmx5
IHRoZSBjbG9jayBldmVudCBpbnRlcnJ1cHQgYmVpbmcKPj4+Pj4+Pj4gZGlzYWJsZWQKPj4+Pj4+
Pj4gKENDUi5DRU4pLgo+Pj4+Pj4+Cj4+Pj4+Pj4gQXJlIHlvdSBhc2tpbmcgdG8gdXNlIHR3byBk
aWZmZXJlbnQgY2hhbm5lbHMgZm9yIHRoZSBzYW1lIFNUTQo+Pj4+Pj4+IGluc3RhbmNlLAo+Pj4+
Pj4+IG9uZSBmb3IgdGhlIGNsb2Nrc291cmNlIGFuZCBvbmUgZm9yIHRoZSBjbG9ja2V2ZW50ID8K
Pj4+Pj4+Pgo+Pj4+Pj4KPj4+Pj4+IEkgc3VnZ2VzdGVkIHVzaW5nIHRoZSBDTlQgcmVnaXN0ZXIg
dG8gb2J0YWluIHRoZSBjb3VudCBmb3IgdGhlIGNsb2NrCj4+Pj4+PiBzb3VyY2UsIHdoaWxlIHVz
aW5nIG9uZSBvZiB0aGUgU1RNIGNoYW5uZWxzIGZvciB0aGUgY2xvY2sgZXZlbnQuCj4+Pj4+Cj4+
Pj4+IEFoLCBvay4KPj4+Pj4KPj4+Pj4gSSB0aGluayBpdCBpcyBwcmVmZXJhYmxlIHRvIGtlZXAg
dGhlbSBzZXBhcmF0ZWQgdG8ga2VlcCB0aGUgY29kZQo+Pj4+PiBtb2R1bGFyLiBHaXZlbiB0aGUg
bnVtYmVyIG9mIFNUTSBvbiB0aGUgcGxhdGZvcm0sIGl0IGRvZXMgbm90IGh1cnQKPj4+Pj4KPj4+
Pgo+Pj4+IFRoZSBTMzJHMiBhbmQgUzMyRzMgYXJlIFNvQ3MgZmVhdHVyaW5nIGEgZGl2ZXJzZSBz
ZXQgb2YgY29yZXMuIExpbnV4IGlzCj4+Pj4gZXhwZWN0ZWQgdG8gcnVuIG9uIENvcnRleC1BNTMg
Y29yZXMsIHdoaWxlIG90aGVyIHNvZnR3YXJlIHN0YWNrcyB3aWxsCj4+Pj4gb3BlcmF0ZSBvbiBD
b3J0ZXgtTSBjb3Jlcy4gVGhlIG51bWJlciBvZiBTVE0gaW5zdGFuY2VzIGhhcyBiZWVuCj4+Pj4g
c2l6ZWQgdG8KPj4+PiBpbmNsdWRlIGF0IG1vc3Qgb25lIGluc3RhbmNlIHBlciBjb3JlLiBBbGxv
Y2F0aW5nIHNpeCBpbnN0YW5jZXMgKDEKPj4+PiBjbG9jawo+Pj4+IHNvdXJjZSwgMSBicm9hZGNh
c3QgY2xvY2sgZXZlbnQsIGFuZCA0IGNsb2NrIGV2ZW50cyBmb3IgYWxsIEE1MyBjb3JlcykKPj4+
PiB0byBMaW51eCBvbiB0aGUgUzMyRzIgbGVhdmVzIHRoZSBNNyBzb2Z0d2FyZSBzdGFja3Mgd2l0
aG91dCBhZGVxdWF0ZQo+Pj4+IFNUTQo+Pj4+IGNvdmVyYWdlLgo+Pj4KPj4+IEdpdmVuIHRoaXMg
ZGVzY3JpcHRpb24gSSdtIHdvbmRlcmluZyB3aHkgb25lIFNUTSBoYXMgdG8gYmUgdXNlZCBhcyBh
Cj4+PiBjbG9ja3NvdXJjZSBpZiB0aGUgU1RNXzA3IGlzIGFscmVhZHkgYSBUUyBvbmUuIEFuZCBh
bHNvLCB3ZSBjYW4gZ2V0IHJpZAo+Pj4gb2YgdGhlIGJyb2FkY2FzdCB0aW1lciBhcyB0aGVyZSBp
cyBubyBpZGxlIHN0YXRlIGZvcmNpbmcgYSBzd2l0Y2ggdG8gYW4KPj4+IGFsd2F5cy1vbiB0aW1l
ci4KPj4KPj4gSW5kZWVkLCBTVE1fMDcgY2FuIGJlIHVzZWQgYXMgYSBzeXN0ZW0gY2xvY2sgc291
cmNlLCBidXQgTGludXggc2hvdWxkCj4+IG5vdCBhc3N1bWUgb3duZXJzaGlwIG9mIGl0Lgo+Pgo+
Pj4KPj4+IElJVUMsIG9uIHRoZSBTMzJnMiB0aGVyZSBhcmUgNCB4IENvcnRleC1BNTMgYW5kIDMg
eCBDb3J0ZXgtTTMsIHRoYXQKPj4+IG1lYW5zIHdlIG5lZWQgNyB0aW1lcnMuCj4+Pgo+Pj4gVGhl
IHN5c3RlbSBoYXMgNyB0aW1lcnMgKyBhIHNwZWNpYWwgb25lIGZvciB0aW1lc3RhbXAuCj4+Pgo+
Pj4gU28gaWYgSSBmb2xsb3cgdGhlIHJlYXNvbmluZywgdGhlIGJyb2FkY2FzdCB0aW1lciBzaG91
bGQgbm90IGJlIHVzZWQKPj4+IG90aGVyd2lzZSBvbmUgY29ydGV4LU0zIHdpbGwgZW5kIHVwIHdp
dGhvdXQgYSB0aW1lci4KPj4+Cj4+Cj4+IE9uIHRoZSBTMzJHMiwgdGhlcmUgYXJlIGVpZ2h0IFNU
TSB0aW1lcnMgYW5kIFNUTV9UUy4gVGhlcmVmb3JlLCB0aGVyZQo+PiBzaG91bGQgYmUgZW5vdWdo
IGluc3RhbmNlcyB0byBhY2NvbW1vZGF0ZSA0eEE1MyBhbmQgM3hNNyBjb3Jlcy4KPj4KPj4+IFRo
YXQgbGVhZHMgdXMgdG8gb25lIGNsb2Nrc291cmNlIGZvciB0aGUgZmlyc3QgcGVyIENQVSB0aW1l
ciBpbml0aWFsaXplZAo+Pj4gb3IgYWx0ZXJuYXRpdmVseSBvbmUgU1RNIGluc3RhbmNlID09IDEg
Y2xvY2tzb3VyY2UgYW5kIDEgY2xvY2tldmVudAo+Pj4gd2hpY2ggbWFrZXMgdGhpbmdzIHNpbXBs
ZXIKPj4+Cj4+IEknbSBub3Qgc3VyZSBJIHVuZGVyc3Rvb2QgdGhlIGVudGlyZSBkZXNjcmlwdGlv
bi4gQXMgSSBzZWUgaXQsIHR3byBTVE0KPj4gaW5zdGFuY2VzIHNob3VsZCBiZSB1c2VkIHRvIGFj
Y29tbW9kYXRlIG9uZSBjbG9jayBzb3VyY2UsIGEgYnJvYWRjYXN0Cj4+IGNsb2NrIGV2ZW50LCBh
bmQgZm91ciBjbG9jayBldmVudHPigJRvbmUgcGVyIGNvcmUuCj4gCj4gV2hhdCBJIG1lYW50IGlz
IHRvIGRvIHNvbWV0aGluZyBzaW1wbGVyOgo+IAo+IC0tLS0tLS0tLS0tLS0tLS0tCj4gCj4gY2F0
IC9wcm9jL2ludGVycnVwdHMKPiAKPiDCoDE2OsKgwqDCoMKgwqDCoCA3ODkxwqDCoMKgwqDCoMKg
wqDCoMKgIDDCoMKgwqDCoMKgwqDCoMKgwqAgMMKgwqDCoMKgwqDCoMKgwqDCoCAwwqDCoMKgIEdJ
Q3YzwqAgNTYgTGV2ZWwKPiBzdG1ANDAxMWMwMDAKPiDCoDE3OsKgwqDCoMKgwqDCoMKgwqDCoCAw
wqDCoMKgwqDCoMKgIDUzMjbCoMKgwqDCoMKgwqDCoMKgwqAgMMKgwqDCoMKgwqDCoMKgwqDCoCAw
wqDCoMKgIEdJQ3YzwqAgNTcgTGV2ZWwKPiBzdG1ANDAxMjAwMDAKPiDCoDE4OsKgwqDCoMKgwqDC
oMKgwqDCoCAzwqDCoMKgwqDCoMKgwqDCoMKgIDDCoMKgwqDCoMKgIDE2NjY4wqDCoMKgwqDCoMKg
wqDCoMKgIDDCoMKgwqAgR0lDdjPCoCA1OCBMZXZlbAo+IHN0bUA0MDEyNDAwMAo+IMKgMTk6wqDC
oMKgwqDCoMKgwqDCoMKgIDDCoMKgwqDCoMKgwqDCoMKgwqAgMMKgwqDCoMKgwqDCoMKgwqDCoCAw
wqDCoMKgwqDCoMKgIDUxNTLCoMKgwqAgR0lDdjPCoCA1OSBMZXZlbAo+IHN0bUA0MDEyODAwMAo+
IAo+IC0tLS0tLS0tLS0tLS0tLS0tLQo+IAo+IGNhdCAvc3lzL2RldmljZXMvc3lzdGVtL2Nsb2Nr
ZXZlbnRzL2Nsb2NrZXZlbnQqL2N1cnJlbnRfZGV2aWNlCj4gCj4gc3RtQDQwMTFjMDAwCj4gc3Rt
QDQwMTIwMDAwCj4gc3RtQDQwMTI0MDAwCj4gc3RtQDQwMTI4MDAwCj4gCj4gLS0tLS0tLS0tLS0t
LS0tLS0tCj4gCj4gY2F0IC9zeXMvZGV2aWNlcy9zeXN0ZW0vY2xvY2tzb3VyY2UvY2xvY2tzb3Vy
Y2UwL2F2YWlsYWJsZV9jbG9ja3NvdXJjZQo+IAo+IHN0bUA0MDExYzAwMCBzdG1ANDAxMjAwMDAg
c3RtQDQwMTI0MDAwIHN0bUA0MDEyODAwMCBhcmNoX3N5c19jb3VudGVyCj4gCj4gCj4gCj4gT24g
dGhlIFMzMkcyOiA0IFNUTSBpbnN0YW5jZXMgdXNlZCBmb3Igb25lIGNsb2Nrc291cmNlIGFuZCBv
bmUgY2xvY2tldmVudAo+IAo+IE9uIHRoZSBTMzJHMzogOCBTVE0gaW5zdGFuY2VzIHVzZWQgZm9y
IG9uZSBjbG9ja3NvdXJjZSBhbmQgb25lIGNsb2NrZXZlbnQKPiAKPiAKPiBTcGVjaWZpYyBicm9h
ZGNhc3QgdGltZXIgaXMgbm90IG5lZWRlZCBhcyB0aGUgczMyZyBzeXN0ZW0uCj4gCj4gCj4gVGhl
IHJlc3VsdGluZyB0aW1lciBkcml2ZXIgY29kZSBpcyBtdWNoIHNpbXBsZXIuCj4gCgpPa2F5LCBp
dCBtYWtlcyBzZW5zZSBmcm9tIGEgY29tcGxleGl0eSBzdGFuZHBvaW50LCBldmVuIHRob3VnaCBp
dApkb3VibGVzIHRoZSBudW1iZXIgb2YgU1RNIG1vZHVsZXMgdXNlZCwgd2hpbGUga2VlcGluZyB0
aGUgcmVxdWlyZWQKbnVtYmVyIG9mIFNUTSBtb2R1bGVzIGFsaWduZWQgd2l0aCB0aGUgbnVtYmVy
IG9mIGNvcmVzLgoKPiAKPj4gRS5nLgo+PiBTVE1fMAo+PiDCoMKgwqDCoC0gY2xvY2tzb3VyY2Ug
KGJhc2VkIG9uIENOVCkKPj4gwqDCoMKgwqAtIGJyb2FkY2FzdCBjbG9jayBldmVudCAoY2hhbm5l
bCAwKQo+Pgo+PiBTVE1fMQo+PiDCoMKgwqDCoC0gQ29ydGV4LUE1MyAwIChjaGFubmVsIDApCj4+
IMKgwqDCoMKgLSBDb3J0ZXgtQTUzIDEgKGNoYW5uZWwgMSkKPj4gwqDCoMKgwqAtIENvcnRleC1B
NTMgMiAoY2hhbm5lbCAyKQo+PiDCoMKgwqDCoC0gQ29ydGV4LUE1MyAzIChjaGFubmVsIDMpCj4+
Cj4gCj4gCgoKCi0tIApSZWdhcmRzLApHaGVubmFkaQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0
bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
