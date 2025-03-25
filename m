Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AB711A6FB12
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Mar 2025 13:21:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 61E7BC78F6A;
	Tue, 25 Mar 2025 12:21:42 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2083.outbound.protection.outlook.com [40.107.105.83])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 09498C78F68
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Mar 2025 12:21:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RwNj04ZxzxuE4Yp7Zgs8/gRyfQHYpv9XLkuquLx1CL/Jh4u2pXHmfXs2OJayA6nzjIZK6hIWtGF0nf5ssi3TEfNtoK0b2pvfGtN2Pq490hzRnPJQO1X+JR++dZoFhRNL86VFjfGqHHAsChxr/dZuhCQzEhPTWh5Ln6egNkr0gaZ3qEirD9AO9RXJNWOTKY9SceR/z6hWzWsxI/vwqxV2q0t4OlWutmHB076FgmiCuuQs6pt0wKUYOK5N2RubkU1TmyUDwYTDrFcsr3FgByhHeb5Oop5m7k1m60Ja+dkZK1eCT/k03M4HVgCaa6yEVF9l7S6Z2TDtRjRSLkbyr+PrsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5rT49O53CA8t9mCidX3amYrwwupgEm9CWCGDIgawkt0=;
 b=RLmX9njrcd9rYYwU7BNvphkn+xnoftXdsblJxoRhLAffyuQ4lOzetROlRjQAUKOibgkBS11pmdwM3ln9TkTPiqDUjwFb7Yt6nNxEO/C89cRAsKK5XysF2UZ+vsfYfei3/DVgatAwnEjTczwiU+gpA4nCfaqnpQJNxmTWSAy+qGH1BGpBxQ5dMsrk9dsNl68SzSZUJlrOCp+UrUH5CsD/+m52KUNCoj2cvYh7ATnia8txglrvS/WvOT8+HPBhQRYFeTXujeKtzNPYsYt3lIlu2DObS4LwNTCNSaVfPZBbGKd8J9/MnqfOOJ3HoIV4x7yLqGjajpxJvI4rfq1mJVZESw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5rT49O53CA8t9mCidX3amYrwwupgEm9CWCGDIgawkt0=;
 b=PTji9/nr1dtx7C/NQjYIsH8pywWkBDTjW4moHX87T+fqmFjy0RkfEttzC0tYikxyVSN8d1stlBJcQIFYKe/zVWLLOhiuOM9auBR77T6HowVmgKWwGngoCmsLa0mPif7qmGX9ZBgWH27rVJjG+4ks1jlkDpHNisRDERRESdopb86qopl7o/JexBuEHoXTo/Ynpj+fq5+gyCeYpJqgG170RveaTPH7kq8/51YBlUbx09+duUEtNrvgTRJoRjfxwlHyKG6OPANsai7VJddkTnNzg0T8Au+iKpAT/bpwv9IkOGbM5B4UPKtbDY7GhLLY9p1KUd1aRZDNoIY1C5hHQxvm/A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU2PR04MB8582.eurprd04.prod.outlook.com (2603:10a6:10:2d9::24)
 by DB9PR04MB8431.eurprd04.prod.outlook.com (2603:10a6:10:24e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Tue, 25 Mar
 2025 12:21:39 +0000
Received: from DU2PR04MB8582.eurprd04.prod.outlook.com
 ([fe80::c96e:12f1:67b7:ed74]) by DU2PR04MB8582.eurprd04.prod.outlook.com
 ([fe80::c96e:12f1:67b7:ed74%5]) with mapi id 15.20.8534.040; Tue, 25 Mar 2025
 12:21:39 +0000
Message-ID: <068713cb-47ca-ae26-e113-9f5026be9196@oss.nxp.com>
Date: Tue, 25 Mar 2025 14:21:35 +0200
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
From: Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
In-Reply-To: <098c5de8-9291-4f3e-a276-500825cac7c5@linaro.org>
X-ClientProxiedBy: AM0PR01CA0122.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::27) To DU2PR04MB8582.eurprd04.prod.outlook.com
 (2603:10a6:10:2d9::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8582:EE_|DB9PR04MB8431:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ded1ab5-b7dc-4f68-3f6f-08dd6b9797bb
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z3VCbkxvUThEVGZWUFJheGY5QU1jZC9UVVA0bDBNcWM2U3FPUUNOaWg3M3dH?=
 =?utf-8?B?Z1Uxb29vNkdkRGxZTTVrdmx1Q1hXd3VCWmFSUFZLUGJBQ1pZYWprQzVwUjln?=
 =?utf-8?B?VGRsSVpHQWdKWkk2U3RTMFZlNDkxajdTbTRnWUZFT0VxZ3d2bDlPcTVRMWw3?=
 =?utf-8?B?VktxSkdqYU03bkVlUWprQkpGdnlCZ3RsUktPNXhDVitmTy9tcjVBMXRqdFh5?=
 =?utf-8?B?cElvWHROV0VzYzBUVXBnMVcvV2RwdzRSRFA0TklMbEljZTBkSUdKRDN0Sjl2?=
 =?utf-8?B?NzFKeUFEeVppNWtxbXJhZUJ2a005NjlOTjdRYlprWU5zN1Q1dkxZamtMdkYz?=
 =?utf-8?B?N2E3aVBYMjh6M1JKNkYzUkJwZVpZSXJXNUREc2UvbDlhM1VNbzcvYXB4bXly?=
 =?utf-8?B?aHQxWTVEaHdaUURSNGRRbm5CdDF5Rk1UT1RnVkJ0UGp6NlVHTFU3b1Q0R0d6?=
 =?utf-8?B?SFRRVUl6WHZyUVMybTBzK2VJeWdseWV0RFArVGwrQ1NtdEtwZkZSczNqVG5l?=
 =?utf-8?B?WURSUlBvblduL1dVTGp4MzNFVDk4K01GNU9wTVh1SDNDTVQvOXIvT0lqUm9L?=
 =?utf-8?B?ZTBaMFowYXMvVVpqZklFZGgzQ1hkRVg5TFJWcHI2dXd5NTd5L1A0TjVFZHFE?=
 =?utf-8?B?UnJVbUZNZ3N0V3dhL25YTzhRbkZJK2czOEhjTEk3ZVVXaU1jSE5wektJZnpB?=
 =?utf-8?B?WitHU0E5TFZtRjhwNjVxR0oyV2MvV3VzdFR2a2JyMnlaY1RZcHUzNWhQY1dn?=
 =?utf-8?B?bnBNU0ZYMzh6eE5aVlJqZE1KVHJsYzBtOTRiczZlS1RXY1RhMzdFYkNMKzMz?=
 =?utf-8?B?U3JKT056N1lsUDhsN1lDVDBtS3ZJendsWmE3UXE4bU5CTUhqVUdTMUYzRVdx?=
 =?utf-8?B?OXc3QU1tUnlqRU1Dcm1ucjNBME8yYkZDQlVVdEFHeTBTQ2o5MWRLNFhYOXZl?=
 =?utf-8?B?SG00bkNVVDlleUZUL0tKYzhLZkMrUkJSZUE1VytSbnFRbk9ObE1KeXhmNU5Z?=
 =?utf-8?B?bENuUExFcmFsU0swR3l1bDUwRFRsKzB5TDBHR0VSSVpIdTFJYXY3RnpDbkVm?=
 =?utf-8?B?SERMTE8yYjFpWFpsNURqVWN3UTEyVkczWENhb2FpbnErS3hIc1ozYnBkaTBq?=
 =?utf-8?B?aDBHMEVBcVNTVFU4RTdDUGRNRDhqYVNYSDhONmozUS8rWTc5bzlLUGhEZmNk?=
 =?utf-8?B?K25Yc0FLMlZacjhDelhoT2IvT3hJMzRJb2JWSks1bGZFM1hVakI1YlFPblJD?=
 =?utf-8?B?Yit4SVpUa2s2NUFiM1hnWHQ2cVpKMjlyN2lqRy81UXhKZTBZRC9MQTVXL3JP?=
 =?utf-8?B?RUN6amZiT3RWYkJIRHVMMFAxTW5JUXhVcDNQbkdNWC9OZ0JmWHQ0VVBONzBQ?=
 =?utf-8?B?RVFJWkNNVUxGdDBIRmhtV0grU1FSL2RKMTR2TlZMd2xSeHNuV3dES1UzdWJW?=
 =?utf-8?B?RmJXb3hNZk5tVGxNbWp2aFdWUnljeFFNL1MranBxU201dVNIbzNhMmlwZnk4?=
 =?utf-8?B?N2Y5b2JvaE94aE1Lc0s0WStaWDV4aHpsNXEwdVhlUkw2VUJVWGhpMkxtclZs?=
 =?utf-8?B?ZGxTQUhUZHo4Wk1QQUgveFB5Ky8vaGZzaE83K1ZZWHZlNk90K21FT0sxdm9C?=
 =?utf-8?B?L2hheTRkOVN2djBnTjFGcDVwT0lKRnZGdXBHamlhSVBxUi9Pcjh6WUlORTFI?=
 =?utf-8?B?TDhvT0s5WmdEOFNCT3pOOTY1LytEMkV2VE9URDNmYW90cWt6MlFXRmVjL0JH?=
 =?utf-8?B?WXBpNjBwam9Qa3AxT3F6QkN4QzFHL0QvbFNOcUd1Y0NHUzBZSGhjRE5ZcU1I?=
 =?utf-8?B?dUF6NzFmY0R2Kzc3SWFEdTRkSGEvWGhSTGJVeWE2K0dYRnpvaDd4QUx2RlNX?=
 =?utf-8?Q?HhhPIWVykF3l8?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU2PR04MB8582.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d1hHcTg5Ui9IRWg3YVRCQXBjUHFKNHlLRTRwaCttUHB2WWtRM1lSM1lCcTdk?=
 =?utf-8?B?d1ZDWm1rNCtwUWJxRmljeEpNd2hNV3EybnAxS2ZjVE85V2R0THZmR0JEVHgv?=
 =?utf-8?B?RVlwTVdJOGlCdjl6aGhlRUREUjZmUStzUWhsU2M2b21RWnIxOW9kcS9QRlZ5?=
 =?utf-8?B?cEZIT1lOQ0E2MWo3U3R6NEorcVlPbVpjY1ZTY2kvRzJoOThzYTZNdHhpTWZU?=
 =?utf-8?B?b1BJZTlkd21USVpkcC8ybFRUV0YxbXlrZThQQU9CaSttaW5BbXJDQ3ExR0Vi?=
 =?utf-8?B?LzhySFBIQnEva09neStCNXBobnNKdEhjbDY5eE95bTNVZTZZbkRJL2RFQlUw?=
 =?utf-8?B?bml0ekNMc2VxRzczSmw1SFVQU3BjRjlWRmlmcXA2NjB0TWM5c0pGci8rVm1Q?=
 =?utf-8?B?SXYxNjNvN3ZZRDlBLzdzYWlVeWhTYjIwTGMreC80T0JwSkJ2dEtiaXdjL0hH?=
 =?utf-8?B?Rnh2NUo2RlZGVU9CMDZZMk5UKzVvVktZZ1d5bU5PcUhXMEdFR3gwQk1jVEVn?=
 =?utf-8?B?R2VjM1RnNk9FT2tzUWNUOFZ0N21tUHk3RWIwUWhZUEdaekhJVkFFZXhwSnZz?=
 =?utf-8?B?TnRpZHBlaUdmR3FVZG1mRkM1UXBnVkFObXl6NFNUblpZdVRydDlrbm5Dd0U3?=
 =?utf-8?B?dmZGcm9PYWwwNEl0b2pWaWlpckZzMExHbmxVWThvSTExSXFQRUMranNqR2pi?=
 =?utf-8?B?dFFYc0dxM280MndjOGp3VDlqa0ZSbE9XRWR5ekdjZEMyaWppdHl5Q0ExVFlL?=
 =?utf-8?B?SVVnL3RHald0cXdmSnA2RFhZMjRSNnpnMnlZcjVqVEpVSDNPZmpmdUZkYVov?=
 =?utf-8?B?bStsckhlbmVrUVBPUUgwc1N2SWo3dnhYRFViTHZBc2tWWVlvR1AvWHRkdVpS?=
 =?utf-8?B?ODUzTWVFb2Z2ZXJnT1hneFJxbE1YS1hJaDVyOFhwWkdNSXJoZTA4ejlnQXdK?=
 =?utf-8?B?dFRFb25GUVVUR2ZQeVJ4SVJNR0ZKU3Jyd0pXRVNGTDZrVzFqa0p6NXJUc0VO?=
 =?utf-8?B?TnlIaFpGMjdlMm5DTWlrODdDbjdkQmhFZ1JMcmlTWXFGdk51Vmg5ZWZ0eXZ6?=
 =?utf-8?B?RUxiUEJTc3pYQ2NzV3kzN3NLSnlpUW8xSTJPL0pFNkxDUXBEL0FKamwyaXFY?=
 =?utf-8?B?TzJLcXl4T2JkSlFSL0NXWnN6TzBCU0c0bnFsTU45cTdZNkI0ZHlsbXZHK0hR?=
 =?utf-8?B?eDdleVhaK1VTY2p0TnVYbTU3Ty9aeDduZEltMFNiRlJYczgxZlpLUFpDUnhj?=
 =?utf-8?B?eU1qMUFUU212azhLVlpLOEIvZUhtZEtkUTBnVk91dDF3NmQ1MkR2VS9WQmp1?=
 =?utf-8?B?aDIvOGdPL1g0cjhINjRRbzlNcDRjYkgrS1ZEVDBvamRxWHdSYWpuay9tR1Qz?=
 =?utf-8?B?cjkzdHFrNmpjNEtIQS90TnBGYVVqczE3eURxY1d6S0hheDlzeVpNVHhLbSti?=
 =?utf-8?B?Mm5uN2sza1lGd1NCUlRRYzFCNjdvT1J4ODg2d1hQQ2lQUklaWEJPNzFDSXQw?=
 =?utf-8?B?TEhYeVRxZzM2MGxoamdHb1IyRVBsS0ZYMGNISExpcFVWWnNyMlJLb3J1YlRx?=
 =?utf-8?B?dnFDaTV1QmI0ZmQzRGtqaG51YXFoOGYwVFBIcTBGOXRjRGVNakd2bzlFTEQx?=
 =?utf-8?B?bkwxYVc2OWg4dXFSNWVkVVBpVnQ5N2wrNUdrdmROWUZoeTBNRG9qYVJGckdN?=
 =?utf-8?B?VWQ5OFlPdHJpWHF2WTlaVXZremlkTWVmWGVqWnAyMnlzNzdrdHBJRGFQOWlS?=
 =?utf-8?B?VVB5b0dpYmZ0UWtTaS94UzE5eVh2Y3AydGdOU3lxays3NHRDSUhaRVE1aWNs?=
 =?utf-8?B?a3hXVjlhekkycTZYUFJQYi9YaHR3UEVvYXMzZ3lkdmVYU2FHUGFNd1daNE9R?=
 =?utf-8?B?K1llUTN6T1luNjk4eWVuajVoOEJ6R04zb0ZYRkxJU0xNK1FPZGtaTmNEdnFJ?=
 =?utf-8?B?NlVERzJsWm41c3l1TklvdVJqcXhBaDEzajF1YVN0VW5PNlFNbXVTZXhJbVNk?=
 =?utf-8?B?ZFdEMEl1ckVYYUlNQU82SWgyak5rVUxTL3E2T25mekZyWDAvMWF0cnFjakUw?=
 =?utf-8?B?dlFlc3h5RWZId3kxazRxdFVubDFad20va21KZWJEZ1cxdUxtYnUyQnZBYlVN?=
 =?utf-8?B?aERnTzRvbVZYOFdMaWh0dk9yNnFHNy9YbWxWbnZmL0ZBVVFxdjhraW9udFEy?=
 =?utf-8?Q?m9xK4rkiHXf8HT1xR1qr6z0=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ded1ab5-b7dc-4f68-3f6f-08dd6b9797bb
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8582.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2025 12:21:38.9235 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B+JyqMXaicteetVcsx84FNp7gU7c5B+seNax0OkoO1TXGYFyZbvQRak8cP+TuFT1G/XTGoMrEhcvvXmiDklJSonRPIA7NB1MX0XWpiFp+yQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8431
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

T24gMy8yNS8yMDI1IDI6MDkgUE0sIERhbmllbCBMZXpjYW5vIHdyb3RlOgo+IE9uIDI1LzAzLzIw
MjUgMTI6NDAsIEdoZW5uYWRpIFByb2NvcGNpdWMgd3JvdGU6Cj4+IE9uIDMvMjUvMjAyNSAxMjo1
MyBQTSwgRGFuaWVsIExlemNhbm8gd3JvdGU6Cj4+IFsgLi4uIF0KPj4+Pj4gK3N0YXRpYyBpbnQg
X19pbml0IG54cF9zdG1fY2xvY2tzb3VyY2VfaW5pdChzdHJ1Y3QgZGV2aWNlICpkZXYsIGNvbnN0
Cj4+Pj4+IGNoYXIgKm5hbWUsCj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCB2b2lkIF9faW9tZW0gKmJhc2UsIHN0cnVjdCBjbGsgKmNsaykKPj4+Pj4g
K3sKPj4+Pj4gK8KgwqDCoCBzdHJ1Y3Qgc3RtX3RpbWVyICpzdG1fdGltZXI7Cj4+Pj4+ICvCoMKg
wqAgaW50IHJldDsKPj4+Pj4gKwo+Pj4+PiArwqDCoMKgIHN0bV90aW1lciA9IGRldm1fa3phbGxv
YyhkZXYsIHNpemVvZigqc3RtX3RpbWVyKSwgR0ZQX0tFUk5FTCk7Cj4+Pj4+ICvCoMKgwqAgaWYg
KCFzdG1fdGltZXIpCj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVOT01FTTsKPj4+Pj4g
Kwo+Pj4+PiArwqDCoMKgIHN0bV90aW1lci0+YmFzZSA9IGJhc2U7Cj4+Pj4+ICvCoMKgwqAgc3Rt
X3RpbWVyLT5yYXRlID0gY2xrX2dldF9yYXRlKGNsayk7Cj4+Pj4+ICsKPj4+Pj4gK8KgwqDCoCBz
dG1fdGltZXItPnNjcy5jcy5uYW1lID0gbmFtZTsKPj4+Pj4gK8KgwqDCoCBzdG1fdGltZXItPnNj
cy5jcy5yYXRpbmcgPSA0NjA7Cj4+Pj4+ICvCoMKgwqAgc3RtX3RpbWVyLT5zY3MuY3MucmVhZCA9
IG54cF9zdG1fY2xvY2tzb3VyY2VfcmVhZDsKPj4+Pj4gK8KgwqDCoCBzdG1fdGltZXItPnNjcy5j
cy5lbmFibGUgPSBueHBfc3RtX2Nsb2Nrc291cmNlX2VuYWJsZTsKPj4+Pj4gK8KgwqDCoCBzdG1f
dGltZXItPnNjcy5jcy5kaXNhYmxlID0gbnhwX3N0bV9jbG9ja3NvdXJjZV9kaXNhYmxlOwo+Pj4+
PiArwqDCoMKgIHN0bV90aW1lci0+c2NzLmNzLnN1c3BlbmQgPSBueHBfc3RtX2Nsb2Nrc291cmNl
X3N1c3BlbmQ7Cj4+Pj4+ICvCoMKgwqAgc3RtX3RpbWVyLT5zY3MuY3MucmVzdW1lID0gbnhwX3N0
bV9jbG9ja3NvdXJjZV9yZXN1bWU7Cj4+Pj4+ICvCoMKgwqAgc3RtX3RpbWVyLT5zY3MuY3MubWFz
ayA9IENMT0NLU09VUkNFX01BU0soMzIpOwo+Pj4+PiArwqDCoMKgIHN0bV90aW1lci0+c2NzLmNz
LmZsYWdzID0gQ0xPQ0tfU09VUkNFX0lTX0NPTlRJTlVPVVM7Cj4+Pj4+ICsKPj4+Pj4gK8KgwqDC
oCByZXQgPSBjbG9ja3NvdXJjZV9yZWdpc3Rlcl9oeigmc3RtX3RpbWVyLT5zY3MuY3MsCj4+Pj4+
IHN0bV90aW1lci0+cmF0ZSk7Cj4+Pj4+ICvCoMKgwqAgaWYgKHJldCkKPj4+Pj4gK8KgwqDCoMKg
wqDCoMKgIHJldHVybiByZXQ7Cj4+Pj4KPj4+PiBjbG9ja3NvdXJjZV91bnJlZ2lzdGVyIGR1cmlu
ZyByZW1vdmUgY2FsbGJhY2sgZm9yIGNsZWFudXA/Cj4+Pgo+Pj4gU29ycnkgSSBkb24ndCBnZXQg
aXQgOi8KPj4+Cj4+PiBUaGVyZSBpcyBubyBjbGVhbnVwIGFmdGVyIHRoZSBjbG9ja3NvdXJjZV9y
ZWdpc3Rlcl9oeigpIGlzIHN1Y2Nlc3NmdWwKPj4+Cj4+Cj4+IEkgbm90aWNlZCB0aGF0IG90aGVy
IGRyaXZlcnMsIHN1Y2ggYXMKPj4gZHJpdmVycy9jbG9ja3NvdXJjZS90aW1lci10ZWdyYTE4Ni5j
IGFuZAo+PiBkcml2ZXJzL2Nsb2Nrc291cmNlL3RpbWVyLXN1bjVpLmMsIHBlcmZvcm0gY2xvY2tz
b3VyY2VfdW5yZWdpc3RlciBkdXJpbmcKPj4gdGhlaXIgcGxhdGZvcm1fZHJpdmVyLnJlbW92ZSBj
YWxsYmFjay4gU2hvdWxkbid0IHRoaXMgYXBwbHkgaGVyZSBhcyB3ZWxsPwo+IAo+IFRoZSB0ZWdy
YTE4NiByZWdpc3RlcnMgd2l0aCBvbmUgcHJvYmUgc2V2ZXJhbCB0aW1lcnMgYW5kIGNsb2Nrc291
cmNlcy4KPiBUaGUgdGltZXItbnhwIHByb2JlcyBmb3IgZWFjaCBub2RlLgo+IAo+IFRoZSB0aW1l
ci1zdW41aS5jIGhhcyB0aGUgcmVtb3ZlIGNhbGxiYWNrIGJ1dCBpdCBpcyBwb2ludGxlc3MgYXMg
aXQgY2FuCj4gbm90IGJlIGNvbXBpbGVkIGFzIG1vZHVsZS4gU28gaXQgc2hvdWxkIG5vdCBoYXZl
IGl0Lgo+IAoKT2suCgo+PiBbIC4uLiBdCj4+Pgo+Pj4+PiArc3RhdGljIGludCBueHBfc3RtX2Ns
b2NrZXZlbnRfc2V0X25leHRfZXZlbnQodW5zaWduZWQgbG9uZyBkZWx0YSwKPj4+Pj4gc3RydWN0
IGNsb2NrX2V2ZW50X2RldmljZSAqY2VkKQo+Pj4+PiArewo+Pj4+PiArwqDCoMKgIHN0cnVjdCBz
dG1fdGltZXIgKnN0bV90aW1lciA9IGNlZF90b19zdG0oY2VkKTsKPj4+Pj4gK8KgwqDCoCB1MzIg
dmFsOwo+Pj4+PiArCj4+Pj4+ICvCoMKgwqAgbnhwX3N0bV9jbG9ja2V2ZW50X2Rpc2FibGUoc3Rt
X3RpbWVyKTsKPj4+Pgo+Pj4+IFdoaWxlIGV4YW1pbmluZyB0aGUgY29kZSBiYXNlLCBJIGNhbWUg
YWNyb3NzIHRoZQo+Pj4+IGRyaXZlcnMvY2xvY2tzb3VyY2UvdGltZXItaW14LWdwdC5jIGZpbGUs
IHNwZWNpZmljYWxseSB0aGUKPj4+PiBteDFfMl9zZXRfbmV4dF9ldmVudCBmdW5jdGlvbiwgd2hp
Y2ggaW5jbHVkZXMgYSBwcm90ZWN0aW9uIGFnYWluc3QKPj4+PiBtaXNzaW5nIGV2ZW50cy4gVXNp
bmcgYSBzaW1pbGFyIGFwcHJvYWNoIHdvdWxkIGFsbG93IHVzIHRvIGtlZXAgdGhlIFNUTQo+Pj4+
IG1vZHVsZSBlbmFibGVkIHdoaWxlIG9ubHkgYWx0ZXJpbmcgdGhlIGNoYW5uZWwncyByZWdpc3Rl
ciBzdGF0ZS4gVGhpcwo+Pj4+IHJpc2sgY2FuIGFsc28gYmUgbWl0aWdhdGVkIGJ5IGFkanVzdGlu
ZyBtaW5fZGVsdGFfbnMgYmFzZWQgb24gdGljawo+Pj4+IGZyZXF1ZW5jeS4KPj4+Cj4+PiBIb3cg
d291bGQgeW91IHZhbGlkYXRlIHRoYXQgPwo+Pj4KPj4KPj4gSG93IHdvdWxkIEkgdmFsaWRhdGUg
dGhhdCB0aGlzIHdvcmtzPwo+Pgo+PiBJZiB0aGlzIGlzIHRoZSBxdWVzdGlvbiwgSSBzZWUgdGhh
dCB0aGUgY29yZSBwZXJmb3JtcyBhbiBhdXRvIGFkanVzdG1lbnQKPj4gb2YgdGhlIG1pbmltdW0g
ZGVsdGEgYXMgcGFydCBvZiB0aGUgY2xvY2tldmVudHNfcHJvZ3JhbV9taW5fZGVsdGEKPj4gZnVu
Y3Rpb24gd2hlbiBDT05GSUdfR0VORVJJQ19DTE9DS0VWRU5UU19NSU5fQURKVVNUIGlzIGVuYWJs
ZWQuCj4+IEluaXRpYWxseSwgSSB3b3VsZCBleGFtaW5lIGhvdyBtYW55IHRpbWVzIGRldi0+c2V0
X25leHRfZXZlbnQoKSByZXR1cm5zCj4+IC1FVElNRS4gQXQgdGhlIGVuZCBvZiB0aGUgZnVuY3Rp
b24sIG1pbl9kZWx0YV9ucyBzaG91bGQgcmVmbGVjdCB0aGUKPj4gYWN0dWFsIG1pbmltdW0gZGVs
dGEgdGhlIGRldmljZSBjYW4gaGFuZGxlLgo+IAo+IFRoYXQgaXMgYW4gYXJlYSBvZiBvcHRpbWl6
YXRpb24gYW5kIEkgd291bGQgcHJlZmVyIHRvIGtlZXAgdGhhdCBhcyBhCj4gc2VwYXJhdGUgY2hh
bmdlIGZvY3VzZWQgb24gdmFsaWRhdGluZyB0aGlzIGFwcHJvYWNoLgo+IAoKVGhpcyBzdWdnZXN0
aW9uIHN1cHBvcnRzIHRoZSBhcmd1bWVudCBwcmVzZW50ZWQgYmVsb3cuCgo+PiBbIC4uLiBdCj4+
Pj4+ICtzdGF0aWMgaW50IF9faW5pdCBueHBfc3RtX3RpbWVyX3Byb2JlKHN0cnVjdCBwbGF0Zm9y
bV9kZXZpY2UgKnBkZXYpCj4+Pj4+ICt7Cj4+Pj4+ICvCoMKgwqAgc3RydWN0IGRldmljZSAqZGV2
ID0gJnBkZXYtPmRldjsKPj4+Pj4gK8KgwqDCoCBzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wID0gZGV2
LT5vZl9ub2RlOwo+Pj4+PiArwqDCoMKgIHN0cnVjdCBzdG1faW5zdGFuY2VzICpzdG1faW5zdGFu
Y2VzOwo+Pj4+PiArwqDCoMKgIGNvbnN0IGNoYXIgKm5hbWUgPSBvZl9ub2RlX2Z1bGxfbmFtZShu
cCk7Cj4+Pj4+ICvCoMKgwqAgdm9pZCBfX2lvbWVtICpiYXNlOwo+Pj4+PiArwqDCoMKgIGludCBp
cnEsIHJldDsKPj4+Pj4gK8KgwqDCoCBzdHJ1Y3QgY2xrICpjbGs7Cj4+Pj4+ICsKPj4+Pj4gK8Kg
wqDCoCBzdG1faW5zdGFuY2VzID0KPj4+Pj4gKHR5cGVvZihzdG1faW5zdGFuY2VzKSlvZl9kZXZp
Y2VfZ2V0X21hdGNoX2RhdGEoZGV2KTsKPj4+Pj4gK8KgwqDCoCBpZiAoIXN0bV9pbnN0YW5jZXMp
IHsKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGRldl9lcnIoZGV2LCAiTm8gU1RNIGluc3RhbmNlcyBh
c3NvY2lhdGVkIHdpdGggYSBjcHUiKTsKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiAtRUlO
VkFMOwo+Pj4+PiArwqDCoMKgIH0KPj4+Pj4gKwo+Pj4+PiArwqDCoMKgIGJhc2UgPSBkZXZtX29m
X2lvbWFwKGRldiwgbnAsIDAsIE5VTEwpOwo+Pj4+PiArwqDCoMKgIGlmIChJU19FUlIoYmFzZSkp
IHsKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGRldl9lcnIoZGV2LCAiRmFpbGVkIHRvIGlvbWFwICVw
T0ZuXG4iLCBucCk7Cj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gUFRSX0VSUihiYXNlKTsK
Pj4+Pj4gK8KgwqDCoCB9Cj4+Pj4+ICsKPj4+Pj4gK8KgwqDCoCBpcnEgPSBpcnFfb2ZfcGFyc2Vf
YW5kX21hcChucCwgMCk7Cj4+Pj4+ICvCoMKgwqAgaWYgKGlycSA8PSAwKSB7Cj4+Pj4+ICvCoMKg
wqDCoMKgwqDCoCBkZXZfZXJyKGRldiwgIkZhaWxlZCB0byBwYXJzZSBhbmQgbWFwIElSUTogJWRc
biIsIGlycSk7Cj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVJTlZBTDsKPj4+Pj4gK8Kg
wqDCoCB9Cj4+Pj4KPj4+PiDCoMKgRnJvbSBjb21taXQgZGVzY3JpcHRpb246Cj4+Pj4KPj4+Pj4g
VGhlIGZpcnN0IHByb2JlZCBTVE0gaXMgdXNlZCBhcyBhIGNsb2Nrc291cmNlLCB0aGUgc2Vjb25k
IHdpbGwgYmUgdGhlCj4+Pj4+IGJyb2FkY2FzdCB0aW1lciBhbmQgdGhlIHJlc3QgYXJlIHVzZWQg
YXMgYSBjbG9ja2V2ZW50IHdpdGggdGhlCj4+Pj4+IGFmZmluaXR5IHNldCB0byBhIENQVS4KPj4+
Pgo+Pj4+IFdoeSBpcyB0aGUgaW50ZXJydXB0IG1hbmRhdG9yeSB3aGVuIHRoZSBub2RlIGlzIHBy
b2JlZCBhcyBhCj4+Pj4gY2xvY2tzb3VyY2U/Cj4+Pgo+Pj4gSXQgcmVsaWVzIG9uIHRoZSBEVCBk
ZXNjcmlwdGlvbiBhbmQgaXQgZG9lcyBub3QgaHVydCB0byBoYXZlIGEKPj4+IGNvbnNpc3RlbnQg
Y29kZSBwYXRoIGZvciBjbG9ja2V2ZW50IC8gY2xvY2tzb3VyY2UgZXZlbiBpZiB0aGUgaW50ZXJy
dXB0Cj4+PiBpcyBub3QgcmVxdWVzdGVkIGZvciB0aGUgY2xvY2tzb3VyY2UgbGF0ZXIuCj4+Pgo+
Pgo+PiBJZiBzbywgaW4gbXkgb3BpbmlvbiwgaXQgd291bGQgbWFrZSBzZW5zZSB0byB1c2UgdGhl
IHNhbWUgU1RNIGluc3RhbmNlCj4+IGZvciBib3RoIHRoZSBjbG9ja3NvdXJjZSBhbmQgYnJvYWRj
YXN0IGNsb2NrZXZlbnQsIGFzIGJvdGggZnVuY3Rpb25zIGNhbgo+PiBiZSBhY2NvbW1vZGF0ZWQg
d2l0aGluIGEgc2luZ2xlIFNUTSBpbnN0YW5jZSwgd2hpY2ggd2lsbCBoZWxwIHJlZHVjZSB0aGUK
Pj4gbnVtYmVyIG9mIFNUTSBpbnN0YW5jZXMgdXNlZC4KPiAKPiBUaGUgYnJvYWRjYXN0IHRpbWVy
IGlzIHN0b3BwZWQgd2hlbiBpdCBpcyB1bnVzZWQgd2hpY2ggaXMgdGhlIGNhc2UgZm9yCj4gdGhl
IHMzMiBiZWNhdXNlIHRoZXJlIGFyZSBubyBpZGxlIHN0YXRlIHBvd2VyaW5nIGRvd24gdGhlIGxv
Y2FsIHRpbWVycy4KPiBUaGV5IGhhdmUgdG8gaGF2ZSBiZSBzZXBhcmF0ZWQuCj4gCgpUaGlzIHdv
dWxkbid0IGJlIHRoZSBjYXNlIGlmIHRoZSBTVE0gaXMga2VwdCBydW5uaW5nL2NvdW50aW5nIGR1
cmluZyB0aGUKY2xvY2sgZXZlbnQgc2V0dXAsIHdpdGggb25seSB0aGUgY2xvY2sgZXZlbnQgaW50
ZXJydXB0IGJlaW5nIGRpc2FibGVkCihDQ1IuQ0VOKS4KCi0tIApSZWdhcmRzLApHaGVubmFkaQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3Rt
MzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20K
aHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtc3RtMzIK
