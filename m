Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 76BF5A7013D
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Mar 2025 14:21:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 240F9C78F80;
	Tue, 25 Mar 2025 13:21:20 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11013021.outbound.protection.outlook.com [52.101.67.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BD7F9C78F7F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Mar 2025 13:21:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ouVcODml5VoLhYAL7O8uGPva0wnRn2LBuCDebfY3yaM9FKQzRt6tCtPP7aon7BysOkM8hCPkjQrEU2iRnGyIGwWD+Q44jv+THyiYmAeTOaGFwcobRmnoIcg1b0PNwfe5dMG0MTAksY+4iXlGZrFRr5dHmZ1lI45z2sW0XFQqrlC8EIgId7Q0R8HT1RBevXHqlIvTQw7AzI8oBApm5JwbucajyHbKBteMbrrq1JVs17MNtpzN4QbmDEbPn4MUPSphKyWM9eW/7KCUXjrjDZLpalALrLtR9jGrBgLLpETf0+spciklpLeFRv+DLzzjld1EJR9WOsSlw9+k95Ko2VsgjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8TyvjstiVa8n57IkCiQkQ0Z3af/85QEq7BrJIiK9W18=;
 b=U8+yRZOYW4nvka5fRKwUq+oYyaZKEX1ly/sVcho3esX6QgCi6KEx1R+10EnbMMKC5sE3OgeesIG3u6jL6Nz6gTkGjDLQoX74xjRSaTnkybeb7xr39hZWsTIXPWqB8WRwfnDF3XtleCYLJSLjrVTzh5fngxFXkfe3RMiByRrIux6v9gCDfPyfZWA+y7vC4KH+1s8E/roiOesXvEYEyP2mUrzKFGYV/COUgd43vp1u7B+0c0qOtd/eBwhCPkjC9twkNX3q1h8YGB7g3XV24lYB2Z4kFCHPRXEBb3VUOBvUmbdMfXwgYBMlwIvDBrDHbUWH6yFGskDwSeqsah1lveuNoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8TyvjstiVa8n57IkCiQkQ0Z3af/85QEq7BrJIiK9W18=;
 b=xh3G/fGCCECmBUov6V741u82v5OdYcDkBFOlqLKVXVw3ZJqmSAeheuVmPv7L4Ui2WqvDQeQ3aEkkHMDx+HDcl8qt+YJK2usREfk011Yb9SeCk7+OT3NOnUNrhCga1xAFvHa9hHEJo/47lkl43tB/qMDEIroc7gBzOsAhcUEG8cUtC7y4T20HkBzFHCwQvyo66mY6+rf4t3mxnX6Foip/I6Hl78TRat6wS9y9Yl0PIFaeXhJig6Ar/ZEiNcDAXWqCDJ9YwqEIIywsIxvB69/VvI++6vKD/nlDCP5tNvsTQqvITGZs+6iKdEcdjTwMNw1n7QvJrPMuPRx4ridNaQiUBw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU2PR04MB8582.eurprd04.prod.outlook.com (2603:10a6:10:2d9::24)
 by PA1PR04MB10324.eurprd04.prod.outlook.com (2603:10a6:102:448::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Tue, 25 Mar
 2025 13:21:17 +0000
Received: from DU2PR04MB8582.eurprd04.prod.outlook.com
 ([fe80::c96e:12f1:67b7:ed74]) by DU2PR04MB8582.eurprd04.prod.outlook.com
 ([fe80::c96e:12f1:67b7:ed74%5]) with mapi id 15.20.8534.040; Tue, 25 Mar 2025
 13:21:17 +0000
Message-ID: <50d2c651-746e-4ddd-4036-f72742a622f8@oss.nxp.com>
Date: Tue, 25 Mar 2025 15:21:13 +0200
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
From: Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
In-Reply-To: <cc2dd75c-e279-4e55-ab88-75498e93146a@linaro.org>
X-ClientProxiedBy: AM0PR03CA0020.eurprd03.prod.outlook.com
 (2603:10a6:208:14::33) To DU2PR04MB8582.eurprd04.prod.outlook.com
 (2603:10a6:10:2d9::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8582:EE_|PA1PR04MB10324:EE_
X-MS-Office365-Filtering-Correlation-Id: c9b3a1f3-eaef-46b1-8370-08dd6b9fec69
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d0lrVkh2YXpQZjUvckd1bDRhWTVqTjJrT2RwbzYvc3NQMGJaNWhKVzJBeHVi?=
 =?utf-8?B?RjhRNi9sblRkQWk1MktmZ0I3TkU5MUU5UTQwSGxVNGZsdDhyVkUxNVVZY1Ex?=
 =?utf-8?B?V09vTldaS29CV3FPSnAycTJiV0MzSVY1WXVQVjVLaTU5aEJSYWJMaW1SQXZT?=
 =?utf-8?B?WWIvcTZOV1J3V3FpUVpQanBpZWVyWURSL000dENLQTZVQjRiRVE3ODI3cTIw?=
 =?utf-8?B?UXhOUHpEdExBam15L3pvTGV6OGZSc1VWNTJwdUJyc3E5YlVWcDBsOVFQRzl4?=
 =?utf-8?B?TG5Fb0hHZzZXdWtVQW5Kbmc5T3lBQXAwL3FJTUpLK2l1WlRNSE1mSEFxZkhB?=
 =?utf-8?B?dHRnZzlIdVZvNER5QkpYL2JwSjZ0VlBYemNZRjlvVlFrY2o5OEI0VjUzMWIx?=
 =?utf-8?B?OGhqNkNUSWhYbExySFBKWUN3WWlQbytTZVBiNDQzb1I2c0FvWWlpU3R6UDR3?=
 =?utf-8?B?YTdkdHR0cG8zY1pyUU5nUTFYNUhtK0VrQ3FhR3B6ckVCNDc0OHErZ1RVQk9I?=
 =?utf-8?B?cUxVYkloeERpWVZ2S0FRaWZSMG1WOEs0ZjVBWEtBQlNSSDNoWWFjWWxVaEMw?=
 =?utf-8?B?aVlCYU9Ba1VBeWZMaTlzRnpHZzVzaWUvT0kzdHlEVGdFS3ZMRFpqZ3Q3L0ZH?=
 =?utf-8?B?V0VxaStXUDhNMHY0WGVQK2M5V2V5NityN2pVc3VlYWRaOWo1VDljYXpLdWZn?=
 =?utf-8?B?Qm9jU0xGOWcreVdNbkdWSktHN1hLYTdCODJReTJLdDVtV25wNk1wNHBmM2xL?=
 =?utf-8?B?bDBCYnFzMVcwbWZnOFdXd3o5SzhMV242ZzJrSTZCaitPNVQvdU9iR1o4U2F5?=
 =?utf-8?B?dXUvL01lRGZ2a2JmUWl3OHAwRXEwc1pFRlZBV2d6blNQRFYvUUo1dU9hb3hV?=
 =?utf-8?B?eTVlUXhzWW0vL1N2bi9wc0Z3WmFKeGM2SHRoS2xnSDB0ZTdkNWxlcFhkNVZM?=
 =?utf-8?B?MmZ5Wk1YdDUyb2ZJN21uUDJzWHJqelJQR2pKTTRGcVh6QjlBbUFwLzlnUFBW?=
 =?utf-8?B?YlBVUWFtcjFsOHExdWc3bklKUXVpOVZjTytINXlGVTVwM3ZlMzVUVCtyNE9Y?=
 =?utf-8?B?ZE9NaTc4NjRFM1g2YnZ4WVk0cnZkQ0ZFZEI3cnFkcU5PNkxMTnU4UmpOVlpl?=
 =?utf-8?B?VklBWldaY21PSTlkS29rUUFuNXJmbGpKSkZHb21QMm1wTk9LNWRMY0xhdjQ5?=
 =?utf-8?B?QU1lNnZ0ck5zUklaY1BoTXV2dExmR0REb2ZGOHN0T01oWFhTZ0IrMTBCeVJM?=
 =?utf-8?B?TEpNekE5MkQ5SkpxYm9GVDVHWDM5b0lmRlp2MUtWN09pSTRQQ2RINmpZcGVp?=
 =?utf-8?B?MlZYVEJaSzlrcWF3THFBbW03dzZuY2krLzZNZllaQmcrS2NpRDNnVmw2WS8v?=
 =?utf-8?B?elI0aW5kem41Qk5lTVp4UXJzRzdLcDJVMWhSSjR6MkpvUjlndlBxSndmWWpj?=
 =?utf-8?B?YlVkU1BTYXNHcFI5d3NHTzBJd0xobGNKMDVOMFphQTh4SHRUMXFlU3lWdFQr?=
 =?utf-8?B?enlha3JhVU16QWcvRjlLdHlNQVowQUtRZmJjaklnU20yRXpMZ2I4UGtsU2FV?=
 =?utf-8?B?aUFNcFBMaWd2NHhad0prUlNWNlJ2Q3dCbTAwUHZiNUlHemNtWlUwbHdRaWdh?=
 =?utf-8?B?cUJjQXZoVnZ0aERlS0kvcmZLTktodFRFK1NrazFTbmJHalZCK2s4ZkNMTFNM?=
 =?utf-8?B?VlNPT2E5UGF2Z3Z2M0xLMGg1aFJqL290QTQvTDl6ZG95cGs1ZFlONmtuclF4?=
 =?utf-8?B?Q0RNQkE3QWtSMVJ1VHBOQ21iZjRFRWhDYUduWmVjYnN5RXVZY29yMEpucVVN?=
 =?utf-8?B?dDh1ampyVWorRnF6cVZzbWs3cXFjZWxUeFU5VkNJVFF0TTZCSzlJbjNFdW43?=
 =?utf-8?Q?1MH67mTJg72H+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU2PR04MB8582.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R1luV3BsU3BUVlhZUDRlTUk3Ym9vclJvYXFMT1hEbWFiVDJHeGg4M3pYUE9T?=
 =?utf-8?B?eHp2RERFSEIrakozVEUrRjFoSStJN3RsQ0U2V2x1Q0NBYTFWelcvRDgyRXpG?=
 =?utf-8?B?MXYybVJLdXBPVXNFaGtvcmpveUVUNHpZN1NaYjg1c0tqTDF2TG82Nm12dGhH?=
 =?utf-8?B?UVc3OFRWcGxvMUxaaUpIcnlSMWxRQ013OUNubDJmajNZbmFLSmFsT3d2ZFZK?=
 =?utf-8?B?am5pdFF0cnNrY1VDclRUc3BDSE5YaVp6cnU5Sys0cGxJOHlkelBETGo3N0JG?=
 =?utf-8?B?QmhBclpid3hoTWlDUGVXNm55R1Q2L0tDTDFxUWVNYXhhTGk4UkJkcGRva2NU?=
 =?utf-8?B?WlNZa2lJZTlNR3NocEpPVUN6V0ZoSWpxT09xcnluUHhLQ1lnWTR1R1o3SUpF?=
 =?utf-8?B?eDlxcE5DVUhiNUhMdzZXSlMwM3RXVTBBNTc3aEhDYXVxaG9NQWdCMFJhdFFw?=
 =?utf-8?B?QkFmcU45RUluSFNvRm1iRGM2blZCVFVMMjA2UnkzSVFIU2cxbStPYW0vQ1Vx?=
 =?utf-8?B?Q2dITnFLMXdlRW5SYkdyWktlSHdKSUpCK2JxS2piSzBweTY4NHNxRkVXZGdO?=
 =?utf-8?B?OWFiWDFOOW8vOFl4NDNieUhyZUYzN0lJOEZFUWx1bVcrbEJlb2MreSs4MVJG?=
 =?utf-8?B?QlhINlU1TGdMVmhNNWVHQ0RCcW1iSXNTNjNRaFZBRXRDM1o2dXBnWXVjRnUx?=
 =?utf-8?B?VGRrZE1HWFNwaXY1SCtRTTZPL3kzZkZhem96Wi93eEZZOE8zQ3Yzcm9PcStn?=
 =?utf-8?B?dW9GekM1OUU4akdhQnlkRnEyVXN5Qy9tdjN4U2czaGtZMG9vb0dXNTY0VVJO?=
 =?utf-8?B?aDArU3JKMXpreUhqLzFSMUU3WGh4dzNJQ3p4R3BPWFptcHRGVDkzbzQvYlkr?=
 =?utf-8?B?Z3VJMVVLS1crb2VWVk1PRlJYMm5EanE4a3crT1ZXcGJDZTdtVkM5cTRCVXFY?=
 =?utf-8?B?ZzNzTy93Ri9BMXU2dEwwaTkxQU1MVDlsQVdKNFU0M3QwQWdTT3I5cUUzSys0?=
 =?utf-8?B?Y2xTRXIzT29qVGp5c2tiQjV5QmNuQmNNV09CR3kzd2JpT3dOZTlaZVB6Y3hx?=
 =?utf-8?B?TU0wUndEQUMxZ2FhNko2NHpkMWY2VnVNZE52QnhmVWFTM1VoRFNiZnJVZkNi?=
 =?utf-8?B?TzVqd3IyQ0p2RG5LRjArWm13bmRLUEFoNkx1Sks4V2lQNXE0SXQrZnFWQmNY?=
 =?utf-8?B?RHZXK2N6eUN0VDNnMTBMVWdIV2hidmhmYzZwTmNZKzMvVVYxZVdicEVWeGtl?=
 =?utf-8?B?TzB1M0ptTXJVVkVYK0NLSERBNDBTMGJVTFNkS0VUeHVBOUp3Rkdzb2c5dlVN?=
 =?utf-8?B?N1JnZGt6MDJHdkU0NU5GZEdIbi9LVXQyQVJmUkM4NUdkM1ZXeHVKVVo0RkEr?=
 =?utf-8?B?Q2J2cTZVc1hnMmJzZitMcVJhQVNuU05sVEUzOWdQQUlQZDg0UisxME5kK1Za?=
 =?utf-8?B?UGx6aGdBelZlakVVc1ZVRXM3M1NOcGNmbWNSTjhNRllSY2xVcU5yeENPbFhP?=
 =?utf-8?B?aHRmSmQxSlFYWHZkd21SNFJPbGpRZERlT0cxeW1tUTJNcFpIeWJCeGQ0SEJG?=
 =?utf-8?B?QjkxSXRSWmdWQjlOSERESEdDR3lENk5OdTg0WUh0QXNrK2NnMURxNXQvUXJC?=
 =?utf-8?B?MUFUSm81VWQySHZ0RnQ4am02ZUNuTWM4VWhZbzZBdUZGU3VRMGo0TmsyeHZu?=
 =?utf-8?B?d2RrRjVVTWZRSEw2QUdFMHNSNVlUQlVGa0luUC91c3JybG5pR09paldHVzhu?=
 =?utf-8?B?eFduOUlVbllWRXBZclN3RW43bi9aVWUvRVhJd3gwR0NWbWllYXl5N0ZwUFh6?=
 =?utf-8?B?M2cxaUlabnUwL2VRQTRBWnB4RWhGTzV4ZnN0N04vTWhOYTIxaHI1b1BmaGFL?=
 =?utf-8?B?elptTGtCa0lZU0ZUVVlGNXlHL1VXNHFBZXUyMWM5UERQZVpyQzBKalA4WUNQ?=
 =?utf-8?B?TjR6enlTUWpFMzB3V0pTdjJtOGo2dXJLbEgxUm9nZWdPdVgwWllUcUxabHVh?=
 =?utf-8?B?MU13YTVoanNPd0toUXJJQUl1bXkrdEpXdVNDT1pzVzVJQTdybDZ5K0o2NllQ?=
 =?utf-8?B?Um5KQWNsd25iNzdXME1xYlRMMXlzUWxEZDZFZWk3WEc2dmsrT0lSbXpBUG52?=
 =?utf-8?B?L0NVNDlDdmN6UFkxcUl1VUJ5TUJKaEdCdGdLSWNaSW85MURTeVFtTUdyZ3h0?=
 =?utf-8?Q?y+28VZpLQqVo0pUzPShqXxc=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9b3a1f3-eaef-46b1-8370-08dd6b9fec69
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8582.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2025 13:21:17.1855 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZKcJSLU1O3JD50Rv7Z4+Ett+DePBsjJ3/S3+6tq2uiz2kQDDmPH59MmEEjEjIphB3nWtPlJFyKGIcyiSsZpifhp3AZIKerQXAWJExdw7Mtc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10324
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

T24gMy8yNS8yMDI1IDI6NTEgUE0sIERhbmllbCBMZXpjYW5vIHdyb3RlOgpbIC4uLiBdCj4+Pj4+
Pj4gK3N0YXRpYyBpbnQgX19pbml0IG54cF9zdG1fdGltZXJfcHJvYmUoc3RydWN0IHBsYXRmb3Jt
X2RldmljZSAqcGRldikKPj4+Pj4+PiArewo+Pj4+Pj4+ICvCoMKgwqAgc3RydWN0IGRldmljZSAq
ZGV2ID0gJnBkZXYtPmRldjsKPj4+Pj4+PiArwqDCoMKgIHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnAg
PSBkZXYtPm9mX25vZGU7Cj4+Pj4+Pj4gK8KgwqDCoCBzdHJ1Y3Qgc3RtX2luc3RhbmNlcyAqc3Rt
X2luc3RhbmNlczsKPj4+Pj4+PiArwqDCoMKgIGNvbnN0IGNoYXIgKm5hbWUgPSBvZl9ub2RlX2Z1
bGxfbmFtZShucCk7Cj4+Pj4+Pj4gK8KgwqDCoCB2b2lkIF9faW9tZW0gKmJhc2U7Cj4+Pj4+Pj4g
K8KgwqDCoCBpbnQgaXJxLCByZXQ7Cj4+Pj4+Pj4gK8KgwqDCoCBzdHJ1Y3QgY2xrICpjbGs7Cj4+
Pj4+Pj4gKwo+Pj4+Pj4+ICvCoMKgwqAgc3RtX2luc3RhbmNlcyA9Cj4+Pj4+Pj4gKHR5cGVvZihz
dG1faW5zdGFuY2VzKSlvZl9kZXZpY2VfZ2V0X21hdGNoX2RhdGEoZGV2KTsKPj4+Pj4+PiArwqDC
oMKgIGlmICghc3RtX2luc3RhbmNlcykgewo+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBkZXZfZXJy
KGRldiwgIk5vIFNUTSBpbnN0YW5jZXMgYXNzb2NpYXRlZCB3aXRoIGEgY3B1Iik7Cj4+Pj4+Pj4g
K8KgwqDCoMKgwqDCoMKgIHJldHVybiAtRUlOVkFMOwo+Pj4+Pj4+ICvCoMKgwqAgfQo+Pj4+Pj4+
ICsKPj4+Pj4+PiArwqDCoMKgIGJhc2UgPSBkZXZtX29mX2lvbWFwKGRldiwgbnAsIDAsIE5VTEwp
Owo+Pj4+Pj4+ICvCoMKgwqAgaWYgKElTX0VSUihiYXNlKSkgewo+Pj4+Pj4+ICvCoMKgwqDCoMKg
wqDCoCBkZXZfZXJyKGRldiwgIkZhaWxlZCB0byBpb21hcCAlcE9GblxuIiwgbnApOwo+Pj4+Pj4+
ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gUFRSX0VSUihiYXNlKTsKPj4+Pj4+PiArwqDCoMKgIH0K
Pj4+Pj4+PiArCj4+Pj4+Pj4gK8KgwqDCoCBpcnEgPSBpcnFfb2ZfcGFyc2VfYW5kX21hcChucCwg
MCk7Cj4+Pj4+Pj4gK8KgwqDCoCBpZiAoaXJxIDw9IDApIHsKPj4+Pj4+PiArwqDCoMKgwqDCoMKg
wqAgZGV2X2VycihkZXYsICJGYWlsZWQgdG8gcGFyc2UgYW5kIG1hcCBJUlE6ICVkXG4iLCBpcnEp
Owo+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVJTlZBTDsKPj4+Pj4+PiArwqDCoMKg
IH0KPj4+Pj4+Cj4+Pj4+PiDCoMKgwqBGcm9tIGNvbW1pdCBkZXNjcmlwdGlvbjoKPj4+Pj4+Cj4+
Pj4+Pj4gVGhlIGZpcnN0IHByb2JlZCBTVE0gaXMgdXNlZCBhcyBhIGNsb2Nrc291cmNlLCB0aGUg
c2Vjb25kIHdpbGwgYmUKPj4+Pj4+PiB0aGUKPj4+Pj4+PiBicm9hZGNhc3QgdGltZXIgYW5kIHRo
ZSByZXN0IGFyZSB1c2VkIGFzIGEgY2xvY2tldmVudCB3aXRoIHRoZQo+Pj4+Pj4+IGFmZmluaXR5
IHNldCB0byBhIENQVS4KPj4+Pj4+Cj4+Pj4+PiBXaHkgaXMgdGhlIGludGVycnVwdCBtYW5kYXRv
cnkgd2hlbiB0aGUgbm9kZSBpcyBwcm9iZWQgYXMgYQo+Pj4+Pj4gY2xvY2tzb3VyY2U/Cj4+Pj4+
Cj4+Pj4+IEl0IHJlbGllcyBvbiB0aGUgRFQgZGVzY3JpcHRpb24gYW5kIGl0IGRvZXMgbm90IGh1
cnQgdG8gaGF2ZSBhCj4+Pj4+IGNvbnNpc3RlbnQgY29kZSBwYXRoIGZvciBjbG9ja2V2ZW50IC8g
Y2xvY2tzb3VyY2UgZXZlbiBpZiB0aGUKPj4+Pj4gaW50ZXJydXB0Cj4+Pj4+IGlzIG5vdCByZXF1
ZXN0ZWQgZm9yIHRoZSBjbG9ja3NvdXJjZSBsYXRlci4KPj4+Pj4KPj4+Pgo+Pj4+IElmIHNvLCBp
biBteSBvcGluaW9uLCBpdCB3b3VsZCBtYWtlIHNlbnNlIHRvIHVzZSB0aGUgc2FtZSBTVE0gaW5z
dGFuY2UKPj4+PiBmb3IgYm90aCB0aGUgY2xvY2tzb3VyY2UgYW5kIGJyb2FkY2FzdCBjbG9ja2V2
ZW50LCBhcyBib3RoIGZ1bmN0aW9ucwo+Pj4+IGNhbgo+Pj4+IGJlIGFjY29tbW9kYXRlZCB3aXRo
aW4gYSBzaW5nbGUgU1RNIGluc3RhbmNlLCB3aGljaCB3aWxsIGhlbHAgcmVkdWNlCj4+Pj4gdGhl
Cj4+Pj4gbnVtYmVyIG9mIFNUTSBpbnN0YW5jZXMgdXNlZC4KPj4+Cj4+PiBUaGUgYnJvYWRjYXN0
IHRpbWVyIGlzIHN0b3BwZWQgd2hlbiBpdCBpcyB1bnVzZWQgd2hpY2ggaXMgdGhlIGNhc2UgZm9y
Cj4+PiB0aGUgczMyIGJlY2F1c2UgdGhlcmUgYXJlIG5vIGlkbGUgc3RhdGUgcG93ZXJpbmcgZG93
biB0aGUgbG9jYWwgdGltZXJzLgo+Pj4gVGhleSBoYXZlIHRvIGhhdmUgYmUgc2VwYXJhdGVkLgo+
Pj4KPj4KPj4gVGhpcyB3b3VsZG4ndCBiZSB0aGUgY2FzZSBpZiB0aGUgU1RNIGlzIGtlcHQgcnVu
bmluZy9jb3VudGluZyBkdXJpbmcgdGhlCj4+IGNsb2NrIGV2ZW50IHNldHVwLCB3aXRoIG9ubHkg
dGhlIGNsb2NrIGV2ZW50IGludGVycnVwdCBiZWluZyBkaXNhYmxlZAo+PiAoQ0NSLkNFTikuCj4g
Cj4gQXJlIHlvdSBhc2tpbmcgdG8gdXNlIHR3byBkaWZmZXJlbnQgY2hhbm5lbHMgZm9yIHRoZSBz
YW1lIFNUTSBpbnN0YW5jZSwKPiBvbmUgZm9yIHRoZSBjbG9ja3NvdXJjZSBhbmQgb25lIGZvciB0
aGUgY2xvY2tldmVudCA/Cj4gCgpJIHN1Z2dlc3RlZCB1c2luZyB0aGUgQ05UIHJlZ2lzdGVyIHRv
IG9idGFpbiB0aGUgY291bnQgZm9yIHRoZSBjbG9jawpzb3VyY2UsIHdoaWxlIHVzaW5nIG9uZSBv
ZiB0aGUgU1RNIGNoYW5uZWxzIGZvciB0aGUgY2xvY2sgZXZlbnQuCgotLSAKUmVnYXJkcywKR2hl
bm5hZGkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXN0bTMyCg==
