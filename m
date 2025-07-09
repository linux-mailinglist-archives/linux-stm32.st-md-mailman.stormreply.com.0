Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 89EA0AFE3C9
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Jul 2025 11:13:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2C73DC36B19;
	Wed,  9 Jul 2025 09:13:43 +0000 (UTC)
Received: from TYPPR03CU001.outbound.protection.outlook.com
 (mail-japaneastazon11012065.outbound.protection.outlook.com [52.101.126.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3CAC1C36B18
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Jul 2025 09:13:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nGeSt9KQi+jpeNbP7oUK5kUvasZnjyHCkhDeHgOP19i7qMd+Bhp1IS0QtDTRKmbXWpHVW48CA7bXrUpZasIskorr59ezFuFzwasYosMppm92REEnXQ/PATAB47pjIjwQEdzSAcoEwdB13PQ1iB33M1KjuEgHS1WkpluXKeb3t4s3kzTO1PiriTjIUjMP7oywjWsorNLY7xqvdW6Eyr4ddWaoLIg+ft20SvJwdQukFb47IKPLw1jfg9EEgkQ5wvtvWZrOT9CfyGXiZ88tIKfRf+dq2B13MpwqNJRPZwwMpv2In/Yqg+tImk3d1i33fzj9hp0qhvU7+GSAQbgiolbM8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0cgXAUeaeBWiVeu28FLcF2T7NYCf2knXQXrHfbR/y4k=;
 b=mCl7FjyEiB/cQIgr2SiMiQy+0hu85IyFlWX5iE3FL5rgcoFzcnUB1MXNHyad5LrsvVIWxtdUuvF3TvGNzGUdRRrGAWJN+Cv72rOcG06SvTdk6R6mY8Cfxu4Ln2Te8s0l/DgIZbe76WpJ8T9CDo/kkQ46QsY4iSBz63n07oAT5PFBA73vM9Imu49c/hBSSAIm9KZH4yDCAXz7epnS2GvHeunDqZaDFn1iFvhFfQKJ4Q5LrNM6Q2Dh9W0HKJn0Cscon+3ruGwI5TyshLW7LPoIXHdYMtY5ju8cGJd/OH+Um63HQToAdJton9AlTejPDZxCA0BjYW0KckXRWI1rKLv6ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0cgXAUeaeBWiVeu28FLcF2T7NYCf2knXQXrHfbR/y4k=;
 b=BynpCiuaqn1w/2eNfHZozXz1akFjPoky+CmCnfuebqnMeFptdX1FJtH5W1LMvQMTgUIStLmjhqZ447CDAzXQdi6DNYX61h0tnxQSIXGExIOil5n2Cb163jFvLR2ew43Ysf+PdxS49cw1hu4DeIMqYmid0ZG91K9GKL4hPYxWpGNJHYpnMYNV/z4LqOAh2laM9+kE2NxPEj0ysfrBzNg0cH8b3zf49pb8qo9SGEgYXvpuZ3RslUwbzijH1Wu0SrMlKj/gL7pQ25qWkkHGRrLhghi6ctLkxNW/HtuokFIGOSi6kybl/zmmGarv5fSYPgkpn4aKVZpKV5oO0Oenw0fXIg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TY1PPFECF6DCA7C.apcprd06.prod.outlook.com (2603:1096:408::92f)
 by SEZPR06MB5045.apcprd06.prod.outlook.com (2603:1096:101:47::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Wed, 9 Jul
 2025 09:13:34 +0000
Received: from TY1PPFECF6DCA7C.apcprd06.prod.outlook.com
 ([fe80::9d84:835b:c798:76bf]) by TY1PPFECF6DCA7C.apcprd06.prod.outlook.com
 ([fe80::9d84:835b:c798:76bf%6]) with mapi id 15.20.8901.023; Wed, 9 Jul 2025
 09:13:34 +0000
Message-ID: <2fccc38c-dd98-446d-8ffa-ac52ef5cc446@vivo.com>
Date: Wed, 9 Jul 2025 17:13:21 +0800
User-Agent: Mozilla Thunderbird
From: panchuang <panchuang@vivo.com>
To: Thomas Gleixner <tglx@linutronix.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>
References: <20250623123054.472216-1-panchuang@vivo.com>
 <20250623123054.472216-2-panchuang@vivo.com> <87h605o8vd.ffs@tglx>
 <TY1PPFECF6DCA7C0493FE1041C661918E91DA7BA@TY1PPFECF6DCA7C.apcprd06.prod.outlook.com>
In-Reply-To: <TY1PPFECF6DCA7C0493FE1041C661918E91DA7BA@TY1PPFECF6DCA7C.apcprd06.prod.outlook.com>
X-ClientProxiedBy: SGAP274CA0024.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::36)
 To TY1PPFECF6DCA7C.apcprd06.prod.outlook.com
 (2603:1096:408::92f)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY1PPFECF6DCA7C:EE_|SEZPR06MB5045:EE_
X-MS-Office365-Filtering-Correlation-Id: 752a8c1e-1c5d-48dd-c901-08ddbec8e16c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|52116014|7416014|13003099007|38350700014|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aTQvZTJaU1lTU0t6aTNBSm5ZVTA4RndQWVpkT3llQUpnQnVDUXVDYy8vK3Jj?=
 =?utf-8?B?VzhLaFF1bmJFMkRCRVhwRG05VmJEMks0MUJvUmdsSVhMMVAyK1RWNlBZU2F0?=
 =?utf-8?B?VHhEMTRNdzhGbStnRVV6QUZyZ2g0RDduZW1Ub2daOGtKM2p3ajNvOHd4bnJ4?=
 =?utf-8?B?RlI2aGtJWTRkN2tRb1V6OGl5S1R0Vm5MM3FJd0h0VUNxaW1OVmkydlhBNGlT?=
 =?utf-8?B?NHMrOGVNQWF6a2FjV05pMUorWmJYZTdScXhqQk41R2VoZ1JWSU9kT0RmbDE3?=
 =?utf-8?B?N0Z1b0R1ZlZkcWN4RkFxRDR1bmQ5WnpQRmF0Y09RZTFOSWJxYnRZaGhuQWti?=
 =?utf-8?B?eFBLQWVLVG5xZGxTUXJ5VFVtRUJOaEhabEpzeHJINHQrMmQzNzVSUzdrQkpO?=
 =?utf-8?B?RjlhWmowZ0xyNXZXN0VRSmZ5NVBvSmZkNzI3YWlaMTNGM0hvRUJHMlJRK083?=
 =?utf-8?B?QUQrQkhndVZnVUVuOUtzZWQrZ2xwSWl1ZjI2K0k3aGJHSFFpUWdFcUFqY1FG?=
 =?utf-8?B?V1p6MzdkeHZIRTgydXIwSGFDM1VoQmdCeDVlYzI2SXFKYXpydWtLNWUrVUlD?=
 =?utf-8?B?Y0htL2tOL0lKU3RGdUU5OWNPVXB3SEdiaHVCcUV1cVZZSjRyMGtqbVRRU2tS?=
 =?utf-8?B?WkphM0M1Nmo4bTZ2eHppVlh5YlVPZjlCalFHQndEL09MTG9QZG9oM2NVdE1J?=
 =?utf-8?B?dTR5V0hra0QzRVF6Ui9XaTl1RUNmY2ZZQmhqL0ZtSTg3bHJXRE9BZkRVcVdv?=
 =?utf-8?B?Y3hjNFkyUjlIUndXOEZxckxGV1pWaGYvWlBoVERkenV1WEh5b0JSa2w4MnFE?=
 =?utf-8?B?MWZWbmUzMEw2UTdPSDUzWTJyaHkrYmYzYjc4eDZadU9UMVYwWnpvbmRFSzJ0?=
 =?utf-8?B?dFhFVGpNWmVBeHBxZTRLM0J3VGJrVk91bTRMWHNhdUlLVGYrY04wZmRkVWpp?=
 =?utf-8?B?cmVFejlMUnJuNnJ6RTF2a3cyVW9YNEZsRTBxTXhTQnlodTliU0Z1cTAvajR0?=
 =?utf-8?B?ZWtrYkhuVVR5dzR0MnJzUjZlYXhKOWxaREF6SW1ZRGV6b0VFNWRzbkMrVS9V?=
 =?utf-8?B?djk0ZkFKZjdSNi9sSjZmLzFkTnVIN1NQMHBobm9reVlNbHdyNUt1dG51Znly?=
 =?utf-8?B?RklLTHRxT0ZuNm84YWw2anBKRXNMbUgwSStkSWxPS1VrRi9rVlljR3l0R0E4?=
 =?utf-8?B?eXYxaHhuNkZCeEdjUFYzV0hUR0Z0eVVkd3J1SDdtNHNxUjJGdHNtcFA0aWIv?=
 =?utf-8?B?UDlLRUFNOUNaQzVJRFVqc1BqTnR0TmhzSXRUcUJqREpDSVRsOUM0My94L2Zu?=
 =?utf-8?B?WTc4WlRmRDkzQ0UxR0x5bFZPYVFuM3RaR2hMS2xIMXI2b05uZklPUXVqV2RJ?=
 =?utf-8?B?ZnVBYnRTMG94MWdLOHh3VEdNaUUvMVU4bTFXbmJMZmxtODdEWGRzTzZqcjdj?=
 =?utf-8?B?V1VubmhzNm9yQUJLb25KY0o2enFyTGlTaHdFM3ZvK2VPQmx2Uk5Wb3ZvYzdG?=
 =?utf-8?B?dlp4N0ZpcTlJODhmUjVxTEYvUnJJT3BQTzBKVmV6VUoxa0tIZ0J3WFhXL0Y0?=
 =?utf-8?B?QkMycGYwaE5JY2todE9ud0pZSjhscUs4UU1CQkI1ZXBwSVJBY2hvQm5XUlpq?=
 =?utf-8?B?b3ZvbFRabFlVQnJud3RZQ2N6NTl4M0xqd1pxVTZKOTZ0ZytBQjFpWmdsbjFn?=
 =?utf-8?B?ZnlGdTk5bTVGRkVObTNYQ3hpbjZLN0MvVXl5VDBqcCtpV3ZQcVdDUzJnWHJr?=
 =?utf-8?B?eW00UXJWejVDSmcvMjhGY3lPVUZob3V3b1FBZXJmRWtrNDNuSWZiVzg2STBk?=
 =?utf-8?B?dVZVaGVWbWxUd3E0dUZ3clBSRzJ5UEJJdXJCM0Y2MWdYMjRWWVJrOGd3K0hn?=
 =?utf-8?B?QVZBbEFJVlgrVSt0QnVxYlVtVFMyOXBBbmNJNThIenlKRGdXQTV1UjZ5Rjgv?=
 =?utf-8?B?dHhCejRqSFAwTFNyRW92cjNwbXA0dlZwTDQ1SUZCai9YMmFZZVFZc1N5WWZ5?=
 =?utf-8?Q?Ey5bRLpxhxHqN9d17zEkD7B1owvDiY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY1PPFECF6DCA7C.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(52116014)(7416014)(13003099007)(38350700014)(8096899003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?akhWd2FLSWxDQTF4UG1mVmtvMmRyQnFmaURORm5pclY5VXE3Tk54bFZQZkJm?=
 =?utf-8?B?dUI1dk54L0h3OEJIMW14ckFKT0I3eDd5c0FhNi9McGxvb3U1aHg1U01XSU56?=
 =?utf-8?B?VlBPZFVtS0dWUkoyRWc2Q1ErZHp2QjFrd1EvVWFLb3NSTHVQY01KZGVJT3Bx?=
 =?utf-8?B?NU94T0VXK0kxRjh0NXpzaTlMWjI0cmRrTlRVSk5mam1LdStJQitEOVB4TS9I?=
 =?utf-8?B?MEhtVkFxaXZIQzkzNS9keDVpKzNkRGJwQWs2aDZBbW9aQmNDcjExZ1ZyTzN2?=
 =?utf-8?B?VWQ0Z21MQXZDM0Z6b1pab1g0NWtDMmswZjQ2cHliZ3h0M3lQa2dSMHRBbUti?=
 =?utf-8?B?b0lWcXE2RUQxRy9aWEdvMWQ4MXhlWkhxMUFXVko0bDlndE1oVmp6VnNkRytX?=
 =?utf-8?B?TEc3YWE5OEJYOS9HdXpwSCtOaDdSVWhjWVoxNStDL1hXMTZXRUMrNjJqaHZo?=
 =?utf-8?B?RFhKTzdaTzFNVS8wNHMwVU5UTURSOUg0YmZ1VTdMK3oybk00UldkZUJ1MnlL?=
 =?utf-8?B?dkN3bDdCRGk4aSs4RFZ5WUQrS29hck4zUzBBS1VwZ3h1UXplaWxkVy84SUZY?=
 =?utf-8?B?eXlicWpFT01yUW8rOXQ2SDA5MFhya2xtOEhjUHl5eDkzR1R5UkhlbE1NUS82?=
 =?utf-8?B?QnBkZlVsR3cxckNvdGdmL2RHa3RjS3dIekJOcGsyZVloN0JOdHE2Ymt4UldT?=
 =?utf-8?B?SWtBS05UOVU3KzE2MWJyQ2V1WmVKWUFLaG1SVXBMa1crZ0JkTm01bkp4VkFh?=
 =?utf-8?B?ejdBa0xQSnIyeGM5a3F1ejFSdi81QWJKbTJMUllKRGwyaGVUVVZVSjZKbk1O?=
 =?utf-8?B?OHVrU2ZScUZDRmlFRGVnOVpOc0hWSy81TWlNemo0bXU0ckllV2pJVFBrSnVY?=
 =?utf-8?B?WkdnWldhdDJVTUJhTittT0d5M0crb2lhcTh5cFJpRFpjOWdjeVc5Q1I3MEdJ?=
 =?utf-8?B?SllvWTNjUU50L0NmRkpzdU9uckZJVFFWOWljUnpiM08ySGNCbktrdDFEZ1Q4?=
 =?utf-8?B?dWFaN2JIUU5jdk90NUtuRC90Y2MyRTNNS2NFMmhoSmJwbElic2xGVWlZeEY0?=
 =?utf-8?B?cG1FcGhYTEpxV1AySUxsY0ZGUmJDWEpXaXNoclFLL1R5TnE3US8wQzRWZlFy?=
 =?utf-8?B?RW9FanJsVjBSblVraE5waFZKRTRWQXJUSUJVRGxqVm5xajBJNDYrdDF0aHRk?=
 =?utf-8?B?cVZpdFplUmZDQjJCR2huWS9raW5IYW1CYXFXLzhLMkVIKy8ybm9mZ09UcWhY?=
 =?utf-8?B?THEraUUvNVBkWFNKYkk2eVZDQ0RPc0tJYmpJTWcxZU1xbWdTZko2ck9FdVFH?=
 =?utf-8?B?eFc5YkZaN1JUR0k1alRmS3g3djJxQ2cvWHZBZEtmdUk4UVpGcFhPa1hvVzNE?=
 =?utf-8?B?b3ZHUWJvRUVlN3RvTEVhcldiZDhGdGxKNUdJQkswNXE2WXBEUGhuNEV1aDlB?=
 =?utf-8?B?cGFGSTZzM1VmVDB1a2FhRnc4cjAvblhQRzQyOE9rOXNLTThoSjVqMGlJYUE0?=
 =?utf-8?B?d3QyeFl6V2RVWGNFVVpES0hUbC9ZeDFrR3BrazEwS0l2cnJkNWtpYlY2R1Za?=
 =?utf-8?B?UjFLMmdBOCs2bUZoS3c3UFRSVmFoc2s5UWZGTjFVK2NkSVVYWHJUQ2t6VE5t?=
 =?utf-8?B?Q203MDJ1dEpBdG5DNE1vMVVQRytnVmN3ckxVNW15M1N4TmZ0cStRYkpjTjdW?=
 =?utf-8?B?UlNjeWxhdGpoUWNCZ0NvT3lSWWxpMEF6c2hVTFVHR0prQVNYdm92RDFuTGF6?=
 =?utf-8?B?cGtYODBUbVd3SitKQXU4NjZrTE5USEVMR2N0ZHphYmZpTk02eGo0Yi9Qb3A3?=
 =?utf-8?B?ZDF5dFdrbnBPTmcxeHRJdnRUQ04xSE5QK08zVlkxNFBTOE5EVEY1MXh5SlRx?=
 =?utf-8?B?T3BRR3ZucjN6MUpMek5nNExGSk5zVjVhNWk1c0szRnN4UW5vTHh5S0FlNHRS?=
 =?utf-8?B?OHIvS3lpTThscHdKZ3g3b2dLK0poakVwYVQ0NlI2WlRRMVpFQmcvSE14SUtN?=
 =?utf-8?B?VlpkOXdTb2d4aHJCemtzaEsyM1YwVkl5MWJUdUgzQkNhSHZMa1g1b29YSC9G?=
 =?utf-8?B?K0FQb2pwZFJtR1lDbFIzVm40SWVWSU1EZU0rbDlTdC9JcDVvRmJRRXRERGM3?=
 =?utf-8?Q?+mrh8lhwMzYG0/MvDUcXbqxqX?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 752a8c1e-1c5d-48dd-c901-08ddbec8e16c
X-MS-Exchange-CrossTenant-AuthSource: TY1PPFECF6DCA7C.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 09:13:34.4625 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xFg1WrqfH4sVcZbBuJbw98rh/1voSoPiZB0+dvzc150Vy3ElqBvndnbU8owswYxj52XWP1/HSRkpksqz0L+0Zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5045
Cc: "imx@lists.linux.dev" <imx@lists.linux.dev>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Yangtao Li <tiny.windzz@gmail.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Amit Kucheria <amitk@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Fabio Estevam <festevam@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Costa Shulyupin <costa.shul@redhat.com>,
 Raphael Gallais-Pou <rgallaispou@gmail.com>, Yury Norov <yury.norov@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Samuel Holland <samuel@sholland.org>,
 "Jiri Slaby \(SUSE\)" <jirislaby@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>, Yinbo Zhu <zhuyinbo@loongson.cn>,
 Jonathan Hunter <jonathanh@nvidia.com>, Vasily Khoruzhick <anarsoul@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Chen-Yu Tsai <wens@csie.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 Zhang Rui <rui.zhang@intel.com>, Colin Ian King <colin.i.king@gmail.com>,
 Thara Gopinath <thara.gopinath@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 =?UTF-8?B?5p2O5oms6Z+s?= <frank.li@vivo.com>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Markus Mayer <mmayer@broadcom.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Julien Panis <jpanis@baylibre.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 zhanghongchen <zhanghongchen@loongson.cn>,
 Greg KH <gregkh@linuxfoundation.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 Cheng-Yang Chou <yphbchou0911@gmail.com>,
 "linux-sunxi@lists.linux.dev" <linux-sunxi@lists.linux.dev>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Masami Hiramatsu <mhiramat@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Caleb Sander Mateos <csander@purestorage.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>, Shawn Guo <shawnguo@kernel.org>,
 Lukasz Luba <lukasz.luba@arm.com>
Subject: Re: [Linux-stm32]
 =?utf-8?b?5Zue5aSNOiBbUEFUQ0ggdjYgMDEvMjRdIGdlbmly?=
 =?utf-8?q?q/devres=3A_Add_devm=5Frequest=5Fthreaded=5Firq=5Fprobe=28=29_a?=
 =?utf-8?b?bmQgZGV2bV9yZXF1ZXN0X2lycV9wcm9iZSgp?=
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
Content-Type: multipart/mixed; boundary="===============1189732074011234963=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============1189732074011234963==
Content-Type: multipart/alternative;
 boundary="------------h3WgrsNzxYqSxC3LTI0n6ERu"

--------------h3WgrsNzxYqSxC3LTI0n6ERu
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi tglx and Miquèl, Just a gentle ping on this patchset. I understand 
you're likely busy with many other tasks, but any feedback or guidance 
on how to proceed would be greatly appreciated. As discussed in the 
previous thread, there was some uncertainty about whether we should 
directly integrate dev_err_probe() into devm_request_threaded_irq(), or 
if it's better to create a wrapper function. Thanks for your time! 
Thanks, Panchuang

> Hi tglx and Miquèl,
>
> On Tue, Jun 24 2025 at 16:13, tglx wrote:
>> As you cited correctly I said back then:
>>
>>    "So there is certainly an argument to be made that this particular
>>    function should print a well formatted and informative error
>>    message."
>>
>> This particular function is: devm_request_threaded_irq().
>>
>> IOW, I did not ask you should go an create a new one, right?
> Thank you all for your valuable feedback and guidance regarding the recent patch. I am a bit confused because, in the v1 version, no new function was added. However, in v2, tglx suggested introducing a new function[1]. Now, I would greatly appreciate your advice on the appropriate approach:
>
>    Should we directly integrate dev_err_probe() inside devm_request_threaded_irq()?
>    Or should we create a wrapper function instead?
>
> Thank you for your guidance.
>
> [1]https://lore.kernel.org/all/87h6qpyzkd.ffs@tglx/
>
> Thanks,
>
>          PanChuang
--------------h3WgrsNzxYqSxC3LTI0n6ERu
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><font face="segoe ui,sans-serif"><span style="color: rgba(0, 0, 0, 0.85); font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; text-align: start; text-indent: 0px; text-transform: none; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">Hi tglx and </span><font size="2">Miquèl</font></font><span style="color: rgba(0, 0, 0, 0.85); font-family: -apple-system, blinkmacsystemfont, &quot;Helvetica Neue&quot;, helvetica, &quot;segoe ui&quot;, arial, roboto, &quot;PingFang SC&quot;, miui, &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, sans-serif, &quot;Source Han Serif&quot;; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; lette
 r-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">,

Just a gentle ping on this patchset. I understand you're likely busy with many other tasks, but any feedback or guidance on how to proceed would be greatly appreciated.

As discussed in the previous thread, there was some uncertainty about whether we should directly integrate dev_err_probe() into devm_request_threaded_irq(), or if it's better to create a wrapper function.

Thanks for your time!

Thanks,
	Panchuang</span></p>
    <blockquote type="cite" cite="mid:%20%3CTY1PPFECF6DCA7C0493FE1041C661918E91DA7BA@TY1PPFECF6DCA7C.apcprd06.prod.outlook.com">
      <pre wrap="" class="moz-quote-pre">Hi tglx and Miquèl,

On Tue, Jun 24 2025 at 16:13, tglx wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">As you cited correctly I said back then:

  &quot;So there is certainly an argument to be made that this particular
  function should print a well formatted and informative error
  message.&quot;

This particular function is: devm_request_threaded_irq().

IOW, I did not ask you should go an create a new one, right?
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Thank you all for your valuable feedback and guidance regarding the recent patch. I am a bit confused because, in the v1 version, no new function was added. However, in v2, tglx suggested introducing a new function[1]. Now, I would greatly appreciate your advice on the appropriate approach:

  Should we directly integrate dev_err_probe() inside devm_request_threaded_irq()?
  Or should we create a wrapper function instead?

Thank you for your guidance.

[1]<a class="moz-txt-link-freetext" href="https://lore.kernel.org/all/87h6qpyzkd.ffs@tglx/">https://lore.kernel.org/all/87h6qpyzkd.ffs@tglx/</a>

Thanks,

        PanChuang
</pre>
    </blockquote>
  </body>
</html>

--------------h3WgrsNzxYqSxC3LTI0n6ERu--

--===============1189732074011234963==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1189732074011234963==--
