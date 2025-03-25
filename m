Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7921CA6F465
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Mar 2025 12:40:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 243B3C78F68;
	Tue, 25 Mar 2025 11:40:51 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2064.outbound.protection.outlook.com [40.107.104.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1BF43C78027
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Mar 2025 11:40:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZPfCc/Locsyrady5xcCLyw1eAxG17w66iMYlQx+Er3KWREb7QO7oIsYs5XRPynnYO3NNMd4P3xxRZKYv4qNqOxGwagdapKNN1d1WEqxPCEj0gFCBgi9tbpd7znDtq41Rw/UEzu22q5BlRiCglHMSBURBCM7CWfgYFo02S8r8xkKV/Y6ttts8WXNRh01db0yt2pYtUAwZ//qCYAJKOkkfuydv8598RWPlHhcn2NinkUFfm2ybTk4S5hhUaSjmmMKulAdJXuNSWotV8pcc62p0FRM71hCCWWZPma3tFW6UpHKBs8Zj566P6xlh+8p29/pHd+n3fDbrVHtpGOea64qBAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i9p8SxoCgO1CRxOGHFQK1oOByabIkxwuKSUJPUEUyKc=;
 b=Vk/UNJ0Z7QwRgCO7b6TWL5+licvNMedUteQDWeoU0jv2jzeLLkSJY+DTh7GBZk3iqWxR5+yco+jTKoyUTCi5XLymGiQ/2UumsGZqLtwd2oo3ZAlsp0+Ui3jwaUsaa7vUCkqiWTIT+sSfdVNxshyDD5RyY3YERyJvr8VXNUY6e7Qt2OhWc0/C9peO515q5CS9SAi44VHBW7onNh3IlIG9M0101HAO4wqcvxgNEfNf/J9Q4lUs88SLDrWdzJDZTQGQECWj0MCQeUDbstmjdkwdNwjkKt/P37h7Idww6VcW1pdWTRNwXqtnYS5nO8u6gtIAPpSoG5FirlBbqHAXCD3RVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i9p8SxoCgO1CRxOGHFQK1oOByabIkxwuKSUJPUEUyKc=;
 b=SiwXT74Ldq2s5g4r5bgkvAviYUZRv5RsUYqx6mRZA5mMxGFCi2BH3dq+vTVqvXX+hhHpKywgA+nYNsreyUh+iAduaP6fC/vuc/2dFmaBWdBfXyXfhD307X6mJFuV10vLrFxsmfNFBGT/kwmcqBaaznU4ztObAmi6aeh57w+jHo7wcQS3DsqVU9WrzXEtqVwuMlx/W8XR1EgVFH81A8qkTntSHnklkU4YRG0pd1xlHuZXCp/xYxtghjx/aDNzLSRi2PwMo9GFfGBFxhctbHfv8mlvcqFan4HwURtuU5ubdnaKYVU+GnXZa1rxG2pkbv5WYZOlmVyG+FbDUIxPlThZXg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU2PR04MB8582.eurprd04.prod.outlook.com (2603:10a6:10:2d9::24)
 by PAXPR04MB8766.eurprd04.prod.outlook.com (2603:10a6:102:20d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Tue, 25 Mar
 2025 11:40:48 +0000
Received: from DU2PR04MB8582.eurprd04.prod.outlook.com
 ([fe80::c96e:12f1:67b7:ed74]) by DU2PR04MB8582.eurprd04.prod.outlook.com
 ([fe80::c96e:12f1:67b7:ed74%5]) with mapi id 15.20.8534.040; Tue, 25 Mar 2025
 11:40:48 +0000
Message-ID: <065d6f32-3161-8316-bbbd-4da18eef839b@oss.nxp.com>
Date: Tue, 25 Mar 2025 13:40:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Content-Language: en-US
To: Daniel Lezcano <daniel.lezcano@linaro.org>, tglx@linutronix.de
References: <20250324100008.346009-1-daniel.lezcano@linaro.org>
 <20250324100008.346009-2-daniel.lezcano@linaro.org>
 <d60fca36-0beb-2574-cb82-3969bbfb58a9@oss.nxp.com>
 <8c208e8c-2e1e-430c-916a-dbc6732881b0@linaro.org>
From: Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
In-Reply-To: <8c208e8c-2e1e-430c-916a-dbc6732881b0@linaro.org>
X-ClientProxiedBy: WA0P291CA0015.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::20) To DU2PR04MB8582.eurprd04.prod.outlook.com
 (2603:10a6:10:2d9::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8582:EE_|PAXPR04MB8766:EE_
X-MS-Office365-Filtering-Correlation-Id: 23abe2b7-468a-4002-f592-08dd6b91e2e8
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Ukd3UFpDbHZHbmVVd2hLZkhpL25nZVRXbEViTjhwVnBwUzFmNjJMZ1BPd3N5?=
 =?utf-8?B?NWRueXBvWnBaYXg1aVllRGpvUHZTYmh0SFE2cjVvT3MzQzM1bXh1aW1pZWZ3?=
 =?utf-8?B?QnZOU3BGUFJNRkhIVlU2ekxPSEVUemRGWmJqMkV6WURSY1hXUXFxWklPOGhU?=
 =?utf-8?B?Wm9HTkxsMG5UdUlxaUFITmNlWGJRYVRYTEU3WTlJc05MeDFZSFlOYmx4NzBn?=
 =?utf-8?B?d0dYREQxUjNuM3pGdWlBcjN4TG9WNzFPZTc2VVFjdmZweFNRWTJIa2FWVUZl?=
 =?utf-8?B?NEx5MTlZWENhcmZrMlBkTGdHUU1WNjZWNStRSnpxbjJoSkQ5aGNXdUNrOEoz?=
 =?utf-8?B?QkxxaSthbWZwdVRJWEtqS3VscUFIU1J0c0hjSXJXdnEvSnY2aFhqTmxac1c1?=
 =?utf-8?B?NGNXR0IzVFhYYXpVckQ4TzIxQVR0VU9uVERXT01pUS9wTWFHZDVNZ2lLRWx5?=
 =?utf-8?B?Q2p6dzQ2OWJtNEMzbmVYbnNUbEljR0FPNXRWTk1uOWdBTDc0dDFPWUordW1h?=
 =?utf-8?B?QjJIbzdHNjlxNGRIaHJES0p3aDFsbWpJemNhM05vWVVhSTFLN3dBN3ZRVnJE?=
 =?utf-8?B?TXlWSTQzc3ArVXJrM0hlcktDQjRMeWM2cElaN2VlbFRhSHZMU2EvRDduVWJF?=
 =?utf-8?B?SndQZG96NENHNStBOHl4S0VrbldocGVMc3VOM1lGK0hRZHVCYkJlQlE5azlN?=
 =?utf-8?B?VFVLS3RMb1hiZmYybHVIVktLaWVTbGJiWWRmbUF4ckR6Tjhxb2owR1Z3dE9Q?=
 =?utf-8?B?ZHlFVmpBdXpvK2pxOUhMbndZQWpsTnF5UU1wVDNNcG1EeEQwVzBHSUpYdFk5?=
 =?utf-8?B?VUFmVmdsWXU0Y2NGNGRtTnAwaEJiS0tuKzJyMlVUcE9ObHlxU3VNc3I5SGIr?=
 =?utf-8?B?RnZvTDNVT3BURElzcDQxMWtLUHl0ZXp6UUFIU2tuWkptNDBQdGMyTUN3T1pG?=
 =?utf-8?B?ZC9CWWEyekYzMGYvT0p6d1QvaFJLWG5pUEtFMVNQYmFjS2tkbTZvOHpHN2dS?=
 =?utf-8?B?dkF3dTJxT281WFI3elNvT01iTzRKYmZOaDJzL0lyQTNLaWQ3OXNzbm5qVGRv?=
 =?utf-8?B?aWlVQjdPMG5Wb1hTK2h5UDQ3UGtZOWozbklNZjZORVZjS01aVGtZc1lVSjlF?=
 =?utf-8?B?cE9Yb0VhVHdXekNCdGNDd2Uwa2Y4cmRZNlRmNVRwamFYczEyNmwvNmJsZ0xU?=
 =?utf-8?B?bnBGcFdHY0JzSldqVFExek1jb09jNXROTTBZaEZjNjZmZ3REUksveGxBRmpZ?=
 =?utf-8?B?UTNNcmNaTlVFVmNpRUluWjFVTHJEMnhmYjZHZ0Zmdm42MEtmVU5xNUozOFlv?=
 =?utf-8?B?YlVpcmpoSWUwZC9OMXpuemQwY3NvOEIxNmpEaGttclAwTWt4bzI2RjRxL1ZG?=
 =?utf-8?B?UmVRd0kvOExvcEV6RWxpay9uN2FqblE0QnlOM2cwOUI5NmZaR3ZnWk9hWllP?=
 =?utf-8?B?WWdySTQzaWZBRE1JSHhzRk82ZUxIQTJEMFl0SlNHQXo0SUFsSjJHcmwrTG9t?=
 =?utf-8?B?b2dkM2kzeHZFV0lOTjlxVmhpR1k3MGhQTG5rb2JxRnFtbTdJWlEzZ3BPLzNW?=
 =?utf-8?B?a1gzeWxGT1czcTB0dzZ1Mk1DQ3NzSXlGUGdhZTE1dFVaMXVoNlRVQko4Q2V6?=
 =?utf-8?B?d2xvSDdHYStIam5HdklwK3h6RERBaDZ5dzZTamRmRVRQVitGTFJJekt0NytQ?=
 =?utf-8?B?VDZiTU4vN3lzU1BqWVFEY3FCYTMxbHh2MkhiOFgrVDdrQ2VUSGVOczIwbHU3?=
 =?utf-8?B?QldoeFNQWFdJNmtUc1pzZW14WEFJeGhMRzZDVHlVV01YK0V0Q05XZkpDZUJO?=
 =?utf-8?B?SDA4ejhlN2JtMGRSa0lXMEREdnYvZEx5cDlCcUpnRk1LbEFqYjZYcGdNV1p3?=
 =?utf-8?Q?CT14Hvnl1fg+Q?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU2PR04MB8582.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U044UWRTbmR0KzdSQ0hDV2pucGdzS05SOWJIakNJY2hyYUs1eU5xdTNMV2dt?=
 =?utf-8?B?VlliZDI0VWRUbXlvYlgwQTd2Q3NYcTdTanpiK1FHVlJEYWNFc0tBemR2ZmZQ?=
 =?utf-8?B?OTBSVTlxUnVadzgxQm1CNWRHU0xWK3phL3pjaVhZaG9uV092Ny9vTzZ2blpk?=
 =?utf-8?B?WkRkOGNpOWtrelROaVArMVoyb01zSVdLdmlDK1d0ck8xc2pXblh5R2o0VFRm?=
 =?utf-8?B?SWR2Mi9md2NJdmp5TURWVmg0aUhYUmplZmkzSVErVm5taTFlT3JtZ1ptb1Z0?=
 =?utf-8?B?MFlCZCtrdU90VmN6QThGZEZiaTk2L3hxRW1uZzQ0MHJYL2Z6Mk8yR1dBWUp1?=
 =?utf-8?B?ZG9lQjZBTGt5M1JENzA0ZEpsQ25PTllaRkVBTDF2NnVtY3dST3k0Sm9sd3pE?=
 =?utf-8?B?UlEwOFlxcmJRWkxVckxjbGUxN3dOd2JCMk5KcE1tOGdJSkFkMkJTcm5PTHFt?=
 =?utf-8?B?czdNZUdqcU1HU05UT0h3dWJyaVFQOXcvZXdpTUlESmZERTJMaEhwMXgxUnY1?=
 =?utf-8?B?QkRYQktrdzNOanI0R1NOWThGWWN3dmRCeG9Bd3paZlR1TTByMXFQUzJkbVEr?=
 =?utf-8?B?Wk13WEF3R1U5VW1EZjl4RkNBYXdGWHYvQ2Q2dldwOFd5V1dnU0FZTlU4ZFBu?=
 =?utf-8?B?QmJKY2d2SWtLTk4yZWJGczB3cENZY2N5Q2lVMERBTm5WMzc3SDNPeXNLZVpr?=
 =?utf-8?B?NnJXRW1VUG9lSVFUU05UQW1mRHJWdER6WW55aDdlN01KVWlJNnA0WGV3bUlJ?=
 =?utf-8?B?K3FEa3BqY2t2WlFtWkZ6NVRNRCtKMEhNcW9IU1Y2aWhKUGxtQVRZZHA1eDVu?=
 =?utf-8?B?V0VrK1BxcSs1TFBwaVd3UGwxL25zVVVzdUg5bFYvcUhoLzZ1MDRYTmtpcGRW?=
 =?utf-8?B?MklhWjl4bERVSXd2NjBYRlJCNmdwOXEwZjFWUUFRTU93WGZ3Rjh1QU9Wak9l?=
 =?utf-8?B?QWs4cjBMNWUxVzkzM29OVkFuUml6bFViUjlGTkMwSlJhdmFpejkxNktmYXEx?=
 =?utf-8?B?emFzK2FwNWY3VlpQV21YNmlUenZxUVZwNkhrK2ZwL1ZBMFQxTHhpUHdsa2JT?=
 =?utf-8?B?SHBYdVlveVUxSm5qWDZ1OGlBVS9LSENSZ3RyOGsvdEtNc2RPbENZa3hVWWRk?=
 =?utf-8?B?UFZ0bUNzSjdPUHZ5ei9adEdDZlQrUjZLZldvZ1NTQUNTMTZFOGtydFd4OHRH?=
 =?utf-8?B?MkJKVFh0VUNyNjBZOXhodmlMRjd6YjJ3eFppaFJUb1drdWdkU25CdW1SZzIw?=
 =?utf-8?B?WFNYenYrWC9hQWU3RzQzNCtISCsrNHNIY1pMSTZ1cjIvWGhWTVJvUFBYUmp6?=
 =?utf-8?B?R3J0V1RzeTd1ZmR5NWdORkJTUTVrV1Azcyt6dmVKcldCRW5PK3NvNE1WMG1V?=
 =?utf-8?B?dzR1QkxzQjNpN1E1QnoybjBiYkYrMTZpeDI3UERPZ3lQT0Q0cDNqdmFMelV4?=
 =?utf-8?B?RnI1MGFRNEVpYWowYWd0Y25UODJZTXQ1aGVMUjl6NGlkc1hYSFYvN3k5K3E1?=
 =?utf-8?B?VFFwNUlMVFFzMHAvMm5scy9yT3ZaOG9lc25yL09TYWFTMDJKN1ZkLzNUdWQ5?=
 =?utf-8?B?RTc4RWZqa09XdFZ2eE8zV2hhSGhBbHpyN2VDTEs4ZmtUK1dvbzNjQXV6d1Ay?=
 =?utf-8?B?bVNldEdNM2thOFZNYzRtMG5ORkFrOGx0bTY3eG95SVBWVlQ4Q3hGdEo0T1Z1?=
 =?utf-8?B?b1JReVBPclk4emo4Ykx1VGsrYVNXV25SQkNXZloxYUo4djRNVGszbTVJQ1dE?=
 =?utf-8?B?TThlQzBUdG1jZVpxT0tDREh3b3FLdjN1RzIvY1k4blVtZ0tzbEUza0Z3MkNn?=
 =?utf-8?B?dUw0QXV0RHRsZ0xDUVVYMlk5MCtTdlE2UTBTZWlKZ3hMcTJ5amgzTUZMUXVW?=
 =?utf-8?B?UDNxaDBFUk5tSkY4WGI1TUVrS2xINDBIcnd3N0pheW5MNlgxWG9DWnVmcjVF?=
 =?utf-8?B?Z0hBYXorU2NobGNObXJ5RzVjRGdWS25yVm1uQUEvSXFyL0RBQndyMW0xU2d6?=
 =?utf-8?B?OU5NQTEwK05wV25NUTFRMDFqNHNrc29JWDZ6Y2VYT3dNems0Y2pDTUlhZmxK?=
 =?utf-8?B?cUdZNHRSbGdjUmVXRHduR2cwYmlyaW9vSVRzdUhsKy9kNTIyQ3RwVERzTXFZ?=
 =?utf-8?B?VmF5b3JXdW9FUDBvbXROWnlzVFNQS1RHTk9vUlYxS3hITGdWZnRvY3BlVFRs?=
 =?utf-8?Q?a++n1R3XYrQKXD8ZHB+4WCc=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23abe2b7-468a-4002-f592-08dd6b91e2e8
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8582.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2025 11:40:48.0745 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ikzco8/FGX6PTFTe6671tXDeKN/YexjRAHj3SHOgw3xJTsPqycSIkXR3iZMfDBAX++I6SG262FiHrhUu7og5IHaB0jkkY0avwoMEp41EkzY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8766
Cc: "moderated list:ARM/STM32 ARCHITECTURE"
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

T24gMy8yNS8yMDI1IDEyOjUzIFBNLCBEYW5pZWwgTGV6Y2FubyB3cm90ZToKWyAuLi4gXQo+Pj4g
K3N0YXRpYyBpbnQgX19pbml0IG54cF9zdG1fY2xvY2tzb3VyY2VfaW5pdChzdHJ1Y3QgZGV2aWNl
ICpkZXYsIGNvbnN0Cj4+PiBjaGFyICpuYW1lLAo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHZvaWQgX19pb21lbSAqYmFzZSwgc3RydWN0IGNsayAqY2xr
KQo+Pj4gK3sKPj4+ICvCoMKgwqAgc3RydWN0IHN0bV90aW1lciAqc3RtX3RpbWVyOwo+Pj4gK8Kg
wqDCoCBpbnQgcmV0Owo+Pj4gKwo+Pj4gK8KgwqDCoCBzdG1fdGltZXIgPSBkZXZtX2t6YWxsb2Mo
ZGV2LCBzaXplb2YoKnN0bV90aW1lciksIEdGUF9LRVJORUwpOwo+Pj4gK8KgwqDCoCBpZiAoIXN0
bV90aW1lcikKPj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVOT01FTTsKPj4+ICsKPj4+ICvC
oMKgwqAgc3RtX3RpbWVyLT5iYXNlID0gYmFzZTsKPj4+ICvCoMKgwqAgc3RtX3RpbWVyLT5yYXRl
ID0gY2xrX2dldF9yYXRlKGNsayk7Cj4+PiArCj4+PiArwqDCoMKgIHN0bV90aW1lci0+c2NzLmNz
Lm5hbWUgPSBuYW1lOwo+Pj4gK8KgwqDCoCBzdG1fdGltZXItPnNjcy5jcy5yYXRpbmcgPSA0NjA7
Cj4+PiArwqDCoMKgIHN0bV90aW1lci0+c2NzLmNzLnJlYWQgPSBueHBfc3RtX2Nsb2Nrc291cmNl
X3JlYWQ7Cj4+PiArwqDCoMKgIHN0bV90aW1lci0+c2NzLmNzLmVuYWJsZSA9IG54cF9zdG1fY2xv
Y2tzb3VyY2VfZW5hYmxlOwo+Pj4gK8KgwqDCoCBzdG1fdGltZXItPnNjcy5jcy5kaXNhYmxlID0g
bnhwX3N0bV9jbG9ja3NvdXJjZV9kaXNhYmxlOwo+Pj4gK8KgwqDCoCBzdG1fdGltZXItPnNjcy5j
cy5zdXNwZW5kID0gbnhwX3N0bV9jbG9ja3NvdXJjZV9zdXNwZW5kOwo+Pj4gK8KgwqDCoCBzdG1f
dGltZXItPnNjcy5jcy5yZXN1bWUgPSBueHBfc3RtX2Nsb2Nrc291cmNlX3Jlc3VtZTsKPj4+ICvC
oMKgwqAgc3RtX3RpbWVyLT5zY3MuY3MubWFzayA9IENMT0NLU09VUkNFX01BU0soMzIpOwo+Pj4g
K8KgwqDCoCBzdG1fdGltZXItPnNjcy5jcy5mbGFncyA9IENMT0NLX1NPVVJDRV9JU19DT05USU5V
T1VTOwo+Pj4gKwo+Pj4gK8KgwqDCoCByZXQgPSBjbG9ja3NvdXJjZV9yZWdpc3Rlcl9oeigmc3Rt
X3RpbWVyLT5zY3MuY3MsIHN0bV90aW1lci0+cmF0ZSk7Cj4+PiArwqDCoMKgIGlmIChyZXQpCj4+
PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHJldDsKPj4KPj4gY2xvY2tzb3VyY2VfdW5yZWdpc3Rl
ciBkdXJpbmcgcmVtb3ZlIGNhbGxiYWNrIGZvciBjbGVhbnVwPwo+IAo+IFNvcnJ5IEkgZG9uJ3Qg
Z2V0IGl0IDovCj4gCj4gVGhlcmUgaXMgbm8gY2xlYW51cCBhZnRlciB0aGUgY2xvY2tzb3VyY2Vf
cmVnaXN0ZXJfaHooKSBpcyBzdWNjZXNzZnVsCj4gCgpJIG5vdGljZWQgdGhhdCBvdGhlciBkcml2
ZXJzLCBzdWNoIGFzCmRyaXZlcnMvY2xvY2tzb3VyY2UvdGltZXItdGVncmExODYuYyBhbmQKZHJp
dmVycy9jbG9ja3NvdXJjZS90aW1lci1zdW41aS5jLCBwZXJmb3JtIGNsb2Nrc291cmNlX3VucmVn
aXN0ZXIgZHVyaW5nCnRoZWlyIHBsYXRmb3JtX2RyaXZlci5yZW1vdmUgY2FsbGJhY2suIFNob3Vs
ZG4ndCB0aGlzIGFwcGx5IGhlcmUgYXMgd2VsbD8KClsgLi4uIF0KPiAKPj4+ICtzdGF0aWMgaW50
IG54cF9zdG1fY2xvY2tldmVudF9zZXRfbmV4dF9ldmVudCh1bnNpZ25lZCBsb25nIGRlbHRhLAo+
Pj4gc3RydWN0IGNsb2NrX2V2ZW50X2RldmljZSAqY2VkKQo+Pj4gK3sKPj4+ICvCoMKgwqAgc3Ry
dWN0IHN0bV90aW1lciAqc3RtX3RpbWVyID0gY2VkX3RvX3N0bShjZWQpOwo+Pj4gK8KgwqDCoCB1
MzIgdmFsOwo+Pj4gKwo+Pj4gK8KgwqDCoCBueHBfc3RtX2Nsb2NrZXZlbnRfZGlzYWJsZShzdG1f
dGltZXIpOwo+Pgo+PiBXaGlsZSBleGFtaW5pbmcgdGhlIGNvZGUgYmFzZSwgSSBjYW1lIGFjcm9z
cyB0aGUKPj4gZHJpdmVycy9jbG9ja3NvdXJjZS90aW1lci1pbXgtZ3B0LmMgZmlsZSwgc3BlY2lm
aWNhbGx5IHRoZQo+PiBteDFfMl9zZXRfbmV4dF9ldmVudCBmdW5jdGlvbiwgd2hpY2ggaW5jbHVk
ZXMgYSBwcm90ZWN0aW9uIGFnYWluc3QKPj4gbWlzc2luZyBldmVudHMuIFVzaW5nIGEgc2ltaWxh
ciBhcHByb2FjaCB3b3VsZCBhbGxvdyB1cyB0byBrZWVwIHRoZSBTVE0KPj4gbW9kdWxlIGVuYWJs
ZWQgd2hpbGUgb25seSBhbHRlcmluZyB0aGUgY2hhbm5lbCdzIHJlZ2lzdGVyIHN0YXRlLiBUaGlz
Cj4+IHJpc2sgY2FuIGFsc28gYmUgbWl0aWdhdGVkIGJ5IGFkanVzdGluZyBtaW5fZGVsdGFfbnMg
YmFzZWQgb24gdGljawo+PiBmcmVxdWVuY3kuCj4gCj4gSG93IHdvdWxkIHlvdSB2YWxpZGF0ZSB0
aGF0ID8KPiAKCkhvdyB3b3VsZCBJIHZhbGlkYXRlIHRoYXQgdGhpcyB3b3Jrcz8KCklmIHRoaXMg
aXMgdGhlIHF1ZXN0aW9uLCBJIHNlZSB0aGF0IHRoZSBjb3JlIHBlcmZvcm1zIGFuIGF1dG8gYWRq
dXN0bWVudApvZiB0aGUgbWluaW11bSBkZWx0YSBhcyBwYXJ0IG9mIHRoZSBjbG9ja2V2ZW50c19w
cm9ncmFtX21pbl9kZWx0YQpmdW5jdGlvbiB3aGVuIENPTkZJR19HRU5FUklDX0NMT0NLRVZFTlRT
X01JTl9BREpVU1QgaXMgZW5hYmxlZC4KSW5pdGlhbGx5LCBJIHdvdWxkIGV4YW1pbmUgaG93IG1h
bnkgdGltZXMgZGV2LT5zZXRfbmV4dF9ldmVudCgpIHJldHVybnMKLUVUSU1FLiBBdCB0aGUgZW5k
IG9mIHRoZSBmdW5jdGlvbiwgbWluX2RlbHRhX25zIHNob3VsZCByZWZsZWN0IHRoZQphY3R1YWwg
bWluaW11bSBkZWx0YSB0aGUgZGV2aWNlIGNhbiBoYW5kbGUuCgpbIC4uLiBdCj4+PiArc3RhdGlj
IGludCBfX2luaXQgbnhwX3N0bV90aW1lcl9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpw
ZGV2KQo+Pj4gK3sKPj4+ICvCoMKgwqAgc3RydWN0IGRldmljZSAqZGV2ID0gJnBkZXYtPmRldjsK
Pj4+ICvCoMKgwqAgc3RydWN0IGRldmljZV9ub2RlICpucCA9IGRldi0+b2Zfbm9kZTsKPj4+ICvC
oMKgwqAgc3RydWN0IHN0bV9pbnN0YW5jZXMgKnN0bV9pbnN0YW5jZXM7Cj4+PiArwqDCoMKgIGNv
bnN0IGNoYXIgKm5hbWUgPSBvZl9ub2RlX2Z1bGxfbmFtZShucCk7Cj4+PiArwqDCoMKgIHZvaWQg
X19pb21lbSAqYmFzZTsKPj4+ICvCoMKgwqAgaW50IGlycSwgcmV0Owo+Pj4gK8KgwqDCoCBzdHJ1
Y3QgY2xrICpjbGs7Cj4+PiArCj4+PiArwqDCoMKgIHN0bV9pbnN0YW5jZXMgPQo+Pj4gKHR5cGVv
ZihzdG1faW5zdGFuY2VzKSlvZl9kZXZpY2VfZ2V0X21hdGNoX2RhdGEoZGV2KTsKPj4+ICvCoMKg
wqAgaWYgKCFzdG1faW5zdGFuY2VzKSB7Cj4+PiArwqDCoMKgwqDCoMKgwqAgZGV2X2VycihkZXYs
ICJObyBTVE0gaW5zdGFuY2VzIGFzc29jaWF0ZWQgd2l0aCBhIGNwdSIpOwo+Pj4gK8KgwqDCoMKg
wqDCoMKgIHJldHVybiAtRUlOVkFMOwo+Pj4gK8KgwqDCoCB9Cj4+PiArCj4+PiArwqDCoMKgIGJh
c2UgPSBkZXZtX29mX2lvbWFwKGRldiwgbnAsIDAsIE5VTEwpOwo+Pj4gK8KgwqDCoCBpZiAoSVNf
RVJSKGJhc2UpKSB7Cj4+PiArwqDCoMKgwqDCoMKgwqAgZGV2X2VycihkZXYsICJGYWlsZWQgdG8g
aW9tYXAgJXBPRm5cbiIsIG5wKTsKPj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gUFRSX0VSUihi
YXNlKTsKPj4+ICvCoMKgwqAgfQo+Pj4gKwo+Pj4gK8KgwqDCoCBpcnEgPSBpcnFfb2ZfcGFyc2Vf
YW5kX21hcChucCwgMCk7Cj4+PiArwqDCoMKgIGlmIChpcnEgPD0gMCkgewo+Pj4gK8KgwqDCoMKg
wqDCoMKgIGRldl9lcnIoZGV2LCAiRmFpbGVkIHRvIHBhcnNlIGFuZCBtYXAgSVJROiAlZFxuIiwg
aXJxKTsKPj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVJTlZBTDsKPj4+ICvCoMKgwqAgfQo+
Pgo+PiDCoEZyb20gY29tbWl0IGRlc2NyaXB0aW9uOgo+Pgo+Pj4gVGhlIGZpcnN0IHByb2JlZCBT
VE0gaXMgdXNlZCBhcyBhIGNsb2Nrc291cmNlLCB0aGUgc2Vjb25kIHdpbGwgYmUgdGhlCj4+PiBi
cm9hZGNhc3QgdGltZXIgYW5kIHRoZSByZXN0IGFyZSB1c2VkIGFzIGEgY2xvY2tldmVudCB3aXRo
IHRoZQo+Pj4gYWZmaW5pdHkgc2V0IHRvIGEgQ1BVLgo+Pgo+PiBXaHkgaXMgdGhlIGludGVycnVw
dCBtYW5kYXRvcnkgd2hlbiB0aGUgbm9kZSBpcyBwcm9iZWQgYXMgYSBjbG9ja3NvdXJjZT8KPiAK
PiBJdCByZWxpZXMgb24gdGhlIERUIGRlc2NyaXB0aW9uIGFuZCBpdCBkb2VzIG5vdCBodXJ0IHRv
IGhhdmUgYQo+IGNvbnNpc3RlbnQgY29kZSBwYXRoIGZvciBjbG9ja2V2ZW50IC8gY2xvY2tzb3Vy
Y2UgZXZlbiBpZiB0aGUgaW50ZXJydXB0Cj4gaXMgbm90IHJlcXVlc3RlZCBmb3IgdGhlIGNsb2Nr
c291cmNlIGxhdGVyLgo+IAoKSWYgc28sIGluIG15IG9waW5pb24sIGl0IHdvdWxkIG1ha2Ugc2Vu
c2UgdG8gdXNlIHRoZSBzYW1lIFNUTSBpbnN0YW5jZQpmb3IgYm90aCB0aGUgY2xvY2tzb3VyY2Ug
YW5kIGJyb2FkY2FzdCBjbG9ja2V2ZW50LCBhcyBib3RoIGZ1bmN0aW9ucyBjYW4KYmUgYWNjb21t
b2RhdGVkIHdpdGhpbiBhIHNpbmdsZSBTVE0gaW5zdGFuY2UsIHdoaWNoIHdpbGwgaGVscCByZWR1
Y2UgdGhlCm51bWJlciBvZiBTVE0gaW5zdGFuY2VzIHVzZWQuCgotLSAKUmVnYXJkcywKR2hlbm5h
ZGkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXN0bTMyCg==
