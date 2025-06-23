Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DFAEAE4977
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Jun 2025 18:00:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C28ABC32EBF;
	Mon, 23 Jun 2025 16:00:46 +0000 (UTC)
Received: from SEYPR02CU001.outbound.protection.outlook.com
 (mail-koreacentralazon11013064.outbound.protection.outlook.com
 [40.107.44.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C42F3C36B2E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Jun 2025 12:41:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gd79OyqZFysNPZmqgaSSyXnhe9AcjL/Ale5Yt9SqjbZOW2iUkHH7CusqmKCF373cdww8qQKKC7oan3Oaj81aCAL2GbfzHdzJDkDI8x6t4a5Vs3ubXk3AcXBCXyeScIpMRpeYXRfEFJ6dqxDS65XA2H6pQCDYB5Myl8u9uTPvbNbVDCGkxQVP7yvuN3wPuO7khjbLA05DQvELOpC0AKy9g12OK50setmxTH6LQ1xCKkbZzkEU2/2QGI6qqkeDF2Xx7QjBMWAyZTmSEKRWXNNSChq1hveNM2ZyB8uKOhcIBryf9qP1TpdCrDmqLxuUJh//Dff5XloenLVlZ75F5xgh2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VJHVDgwiWvmvOxA6h/J4YopEOXPzSmTbgluUEuz0QQs=;
 b=KFP9kNyXeRBJVNRCebmGqt0fyLrfyYh22iBWpj9NFOPoDUi/8qFBjyZEuhZlG7M0w5gofy/bJ0rZ99sjiJyGb861/C0+0QMdl4IksEjlZ963kdGQg3WOM7iUb5/fnveXWdckstczXXryos0Z3PJc5mjhEbmwnsXJ0hyeceuqjsRcuRhx3VZPbe4numtqVcD/H3vemSethjVOEum5hDq1SYH9KCuGp9uiM5/myRS+KPg7fxNdGMGMro8+OitNU8OsORAkCVDtYdr+xTSn05GZsfmvbkJnH/cWnA0U3TeTy6FssgEDfpvZ3eGIzJyrL8GUWCF/YhxWLp93i290DZa4LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VJHVDgwiWvmvOxA6h/J4YopEOXPzSmTbgluUEuz0QQs=;
 b=gfPaZBShI9Dq4RKkTWrggg4dTir2Pea4OkmDGmIdd2Je5StC99/zqBOzlRYEwYRcnbEVYa86Lfil3qy0QunRKUErFe/vbo10nIN9277Qxj6PROG6kLouAs22p1+mEVdYm3vzVpq2N7Q2MV0dkygEjh5WGw6PTFBfCyE2IXXqFWfPfCyfMvMelm9cIWXXiWzJfRaYy/HK6rKuERyI/SC0Sp4ibgAFC0C31Qg/J2zRLiTuDeOQSxGprPWJC8eMgJhd1u8yHfyfbaAdD4grZTOKeAuNr34DMj/AnpRnaQYcZpxY/2kTBI39Uq9eeQ5RNDHirEnUfz0m8ETMsRMZN7htNw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from OS8PR06MB7663.apcprd06.prod.outlook.com (2603:1096:604:2ac::8)
 by SE3PR06MB8096.apcprd06.prod.outlook.com (2603:1096:101:2e3::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Mon, 23 Jun
 2025 12:41:37 +0000
Received: from OS8PR06MB7663.apcprd06.prod.outlook.com
 ([fe80::46a5:9b06:416e:1e49]) by OS8PR06MB7663.apcprd06.prod.outlook.com
 ([fe80::46a5:9b06:416e:1e49%3]) with mapi id 15.20.8857.026; Mon, 23 Jun 2025
 12:41:37 +0000
From: Pan Chuang <panchuang@vivo.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Raphael Gallais-Pou <rgallaispou@gmail.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Date: Mon, 23 Jun 2025 20:41:17 +0800
Message-Id: <20250623124122.474673-1-panchuang@vivo.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: SI1PR02CA0016.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::17) To OS8PR06MB7663.apcprd06.prod.outlook.com
 (2603:1096:604:2ac::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS8PR06MB7663:EE_|SE3PR06MB8096:EE_
X-MS-Office365-Filtering-Correlation-Id: 05a28713-e432-4faa-64a4-08ddb2534b36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|7416014|376014|366016|1800799024|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dmczRnkwNzBmUHE5ckxDWjdKWTR6Y20ybXNYWkZ0UlBYdi9Ed2sya0Y1MkRw?=
 =?utf-8?B?a1drd3BaZlRlVXJaM3RaeVYzVUpRNlR2Q0xad3RGOU1uVG1aQyt3ZWtjNGRK?=
 =?utf-8?B?NWhzU2s0R0p2QnZsSEtVdm5jb2tpeEVpb3hXWFNoNWxPTzVLK1ZQR1AyMUph?=
 =?utf-8?B?RXpVZU9xek1oS3l4UkFPVnkyOWxlVjg5dkZKNlRjbi9hVFVmOHFnUi8xZTdL?=
 =?utf-8?B?S0JyaENNbVc1TUlDYWorRE5Jb2s5UkttM1VSeXNmSnJ4MmlzTlo2NHlHUHVR?=
 =?utf-8?B?QnFIcngwWk1NVFc2MmQ1OXpZTEdZYksrbFIxMnRGa05LMVFuckxqV0hLRjBv?=
 =?utf-8?B?YkRFcFUwT280UFkvNzRCWVJZTVdRYnpOdm1RTUtzVVRncWx3TXZBa3NpTjd1?=
 =?utf-8?B?R0hpVHE2ZDVTYlY2M0xjVlBRTFhVOTNTVXBLWWpFSloxWGZIUHpDTm1yNW1k?=
 =?utf-8?B?L0VkVnhSMFhrcU1CcmJKOXlqb1BYaDRrY1Izd2RPQ0dURXVoSnZoUXZJdmtY?=
 =?utf-8?B?TS9EdEJJQTdlaGJoWDhsbzhSWUR5ZkVqeUZ4NTFjcWxFbENxSngvWGNPZzhj?=
 =?utf-8?B?S0dvM3MxTXhKYTgrT1lUalpaZUJISDJqc3psaTMyMmlkNUtrVE54ZXRGOUNu?=
 =?utf-8?B?aVpZVnZ6ZWtZdklONmgrNHVBS1VhMDV2eUFPVG5QcWIwS1VETnl5Rm1iUHVl?=
 =?utf-8?B?NnMyWmFQTjBvVEhFa2FKSkhzVFhTSm1kcUE2UnRReUxsZHhYYlJ3UDZXOHBS?=
 =?utf-8?B?YlU4OEJyOFpUZGhwM3hZODdESnhhUlJBWkNtSlRmWEh2MndUTW5ud0VjaDhX?=
 =?utf-8?B?aCt1aUtwWG1lWjhCSHExNE1jYTQvR21Za2pxanRxM1YyRGVGVzQxWXhwV3BU?=
 =?utf-8?B?SzUzY1doZ0RkME9oWmNGbCs1SEhyUjAyaHI5REtvMWxWT1FONjk3TDhyN1R2?=
 =?utf-8?B?VUFObmJvUEFMR1grWmlFWDlHQmw3MzNFaDU1QjlBd0UxeFcxblBtL0tnT2g5?=
 =?utf-8?B?WVZBOWZPb3pCSk9ZamRIVHh6c0dZL0VSam5sVDJhUHlmY3lYMWRKOUlYS3Fw?=
 =?utf-8?B?VWV1Z3VpQ2FReVpleGtpdlcybHRPV3VjMUtHZjg4eUNOdlpremEwNUsrREhj?=
 =?utf-8?B?L2FZaXNmSlJMakhQcXZISm9FREZtS0hkOCtJcmxKYm9TRDk0clplS2JKOGRD?=
 =?utf-8?B?LytVemlMbklUVnB4emppTU9XTEkxSVdsRFViaEFVeHFFVnlQWG9aQndGVVdF?=
 =?utf-8?B?WWd1L1pMTmZ2cmw5YVZMQSs3VlpndGw3RGZKc1ROMmdybHA1VWQyb2gwdVlV?=
 =?utf-8?B?cnU2U1hDL3JDVEdHR2xqTGlDelAzN09CTEYyVmE5VVpQYUhVcUtxSlh0ZGpO?=
 =?utf-8?B?Q290MFdOeFdYK1FPUHpzUDREMHF2UDNwWVJvZTVFTFFPLy95REZGWWdjbWRU?=
 =?utf-8?B?QS9BT0loMEZiNlRnUTVsU1BvdktLSkd4QlprRjY1L2drL3FoMU5scW9oT0hq?=
 =?utf-8?B?anJkejJPOVhWcy9RTDdPNm90T2VjREJZSXJNNnErTzlUTk9zYkFxTnJFbjBS?=
 =?utf-8?B?Qm1VSW94TStZNXFkaEVnZ24vU3MzVTR3Znd4WHorLzVVbkpVdDJZd2NJZjRG?=
 =?utf-8?B?amJXS3JwRU1hVGsxeStqVFJMZEdtbVJvUysweFQvTFBnd2h6WXV3Vlk0bUpL?=
 =?utf-8?B?M3R2cWhjWFlnV2pwbFd2NmZ4cmMrU1BuSW9mZ3JPT1FXQXhhNTlkTEt4VUxv?=
 =?utf-8?B?NGIwMnN0Q1Ixa3ltYlBrVjhnODhGSHFJY1liNlNZckhjYThod3BjUTk2ZEtY?=
 =?utf-8?B?aE1LT3pUMTBxa0ttSk5sVW1jV2IzNjdhTGY3WDVER3BsN2hIOWVLUU5jM2pu?=
 =?utf-8?B?aXI0MDhnVXc5L01VZGdkdzYraWZDRWJnQndmcW5Dd1NRUUovb1RrVkFMaW5m?=
 =?utf-8?B?WGZLcGRlV0ZFeWxzSTB6WElETTBLTHBxa1dZL3ZwOHltbFFEWHZIZnh5MUdS?=
 =?utf-8?Q?gOyOR2k2STSqojtky510NbCdpx6faw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS8PR06MB7663.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(7416014)(376014)(366016)(1800799024)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RnRIYnNYMEFmSTNBY1cwYmpUdmk0VTI3ckloQkswUXVWSVFuSUtGdzR6L3Bh?=
 =?utf-8?B?NnFoWHFDNGVhUHJpOHh6VFF0WEQwRkN5YVhyZDZZZ0lraWU5SDZkaVVJYk43?=
 =?utf-8?B?ekt0WVVsOFdkVDBROVNiR3pmdUNUN2RKU0M1SUJTbmFRWFF6WnZFS1RaT1Nj?=
 =?utf-8?B?WCtlRHg1dVNKYklhNzhRVHVIanlVenEzYWhKcnhRQit0R1NodnIwY2FkaEFm?=
 =?utf-8?B?c0lQVkc3MGxnTHVXeEhYMS9VV3duOGV4Yk8zVmhXT0FPRDVlTGNEWjM1NWRl?=
 =?utf-8?B?Y3RxemEyakU3eW5LVWJTUjdXckxOT0xJU2V5TFJMWjIzV3dsaFMwYmloMWdi?=
 =?utf-8?B?KzNRQVBwVWJTR2pxMVc4NllnMi9VczVXRWVoME5xRlR1RWJlQTFJejlab21j?=
 =?utf-8?B?Nmx6bW9uTlNMdWRIcmR6cVVNWFczb3RxVitTUVBnUEhKSVk2OFMrMmM4cXRa?=
 =?utf-8?B?S010NSsyUDFDNVBjWm5EaFJiRHhWL3FrVk1Ga3R2dm9OeDdkL251dkVOT2tp?=
 =?utf-8?B?NmVwK2NnMjdsRjRSdWIwRzU4NzV6dnZkWFBjNnhwZGcxNVN4QTZSTXExV1Jm?=
 =?utf-8?B?Y2xMRXZiQk9hazRpeGtDeFVMZnNLME5yZlcxZXZnQ2JCL3ZoSkJWQkdjMzJ4?=
 =?utf-8?B?akNaMzg5YXlmZGpzOVRBbmN2a3MzS2pYTWp6cktQMTdENjdIMlVQRDdqblQx?=
 =?utf-8?B?SE52bnU2YmIzNGtoWFFmU2RhNlR5ZU9WS0ZBZEdOZHVOS0V3ZzNjQ1d6bDlI?=
 =?utf-8?B?elhWMTM2SnBHSGU4Q3VHRUJEZ1pXS2MrNG8ySDVkclNnaXhnTFlNQ2xhMWpV?=
 =?utf-8?B?d2dFVGpDNW1WaU1GaEZsWUs4SmV4ZmhDVStPR2M3R0xHMTlMeHUvcThiZmV5?=
 =?utf-8?B?Ny9pcGQ5cHhMcHFwb2phMDkrdjlNWDhVVWRtOHV0ZW1jZmFObDlKc01MTVZX?=
 =?utf-8?B?YmowMnNLTVdlcCtOT3VyVGEwM3Y4Smh2NklDQU5yZG1lY2d0eW14bHhCTXZz?=
 =?utf-8?B?Zm5uWGNwbHZ5VEtwYWhFcE9EbmhQRzF3SEM1eUxVdzY0dGNObGtFWG5KNklI?=
 =?utf-8?B?TjgvLzE3VUsvUXlMWFVZaXhEVGQvL2J6VkhEL1V1ajRsR1h4M0ZrcFJJOHh0?=
 =?utf-8?B?UnpERGJ5TTFJK1FhSjh3bUJDaitBTHo5ck8zNEZ6MVhSNE5LeWgvb0NKa0tO?=
 =?utf-8?B?L3crdzl2VDh4WUhmc0hTVFdDWCtYMDE1NGp5THRxVk5qTmMrbFBWUVN4RlNF?=
 =?utf-8?B?R3UwT1QwV0JmenVpMVFnQWorUXJwcHlWeWJVeGd2bkROS2hXT2N0VHhPbVly?=
 =?utf-8?B?RGVXWDdTOGdaMkowUnRHMHlCSWxwNmRqQ2xTM1Y0V0pxRHl0d2YwV29OR2Jo?=
 =?utf-8?B?UVhyK05MZXhFaGZHTUkzaEt0SCtHVlNlYmhvZEpJUHRDdmxwbHYyME1DWkY1?=
 =?utf-8?B?UnIrN0h6RUtEQTREU0hvT2NvYWEyOU0rV2pHNzhIQUk4VUxVV241Y1FyMzFm?=
 =?utf-8?B?Q0F3Sk10MnFES1RtamFBUkg0Ky94VVlRRGt3SDNXMEtNdXdDbWhlRjJ2QURS?=
 =?utf-8?B?dkJOUXI4UHBjM0dodm9halpvYitGV0VkUHJLcW5HN0xMZXk0QVJ6UlNxU29j?=
 =?utf-8?B?c2VVNzN3MWR6OXppWmpGdHIyd1lWMSs5WEZWVGpLRnhVRXQxRHpvTkNkVjJi?=
 =?utf-8?B?b3dORTVNb0d5MkZla0s2SjFMVmlnZ1VBV0RqQ0lkVGZlWTFMZEU1NkFXTFlE?=
 =?utf-8?B?a0JkL2xpcUFERmdzN0U3TzNodUF5NDhPV0FGTWdLNUtjb0F5TkJ1TFhvbWVt?=
 =?utf-8?B?N2MySjA2V3pOUGwxb0UrQTZTaElQZFJIaXFlY0g4ZTd3TTFIWVhGU1ZNYVU0?=
 =?utf-8?B?dklaOWFxVitSNE5iSmNrVXJIT3k2YjdsblNuSlhicTBGWDZ4Q2ZKbCtOQWVZ?=
 =?utf-8?B?TGIrc2RMU2d2M0ZhVEExOEs1OW9CMm1UNW1IbXBLVzZKNFZkYUpjTVVoUU9N?=
 =?utf-8?B?Vm9iNXM0V1gwalVPQ2gxRU12MXpnaFJmZ3hvdjI2MWQ0SUtQS0E5WnEzVjJX?=
 =?utf-8?B?YnZXM0NLSzhxanVNMkdxcWJ0VmNoZ3RCQllLbzN2ZWpIYkFCTVZwZmF2dE9z?=
 =?utf-8?Q?59Dn0317ZdMc+3e1KXXiHvldl?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05a28713-e432-4faa-64a4-08ddb2534b36
X-MS-Exchange-CrossTenant-AuthSource: OS8PR06MB7663.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 12:41:37.2799 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Siklz3zFisNcSnIKLTgyTw6fFmq10IRet56WrL5SYwzwgFDuinNe6sJJodKR5GKhQJMf1oK87Vp5sjadcSLgPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE3PR06MB8096
X-Mailman-Approved-At: Mon, 23 Jun 2025 16:00:45 +0000
Cc: Yangtao Li <frank.li@vivo.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Pan Chuang <panchuang@vivo.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [Linux-stm32] [PATCH v6 18/24] thermal/drivers/stm: convert to use
	devm_request*_irq_probe()
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

RnJvbTogWWFuZ3RhbyBMaSA8ZnJhbmsubGlAdml2by5jb20+CgpUaGUgbmV3IGRldm1fcmVxdWVz
dF8qaXJxX3Byb2JlIEFQSSBwcmludHMgYW4gZXJyb3IgbWVzc2FnZSBieSBkZWZhdWx0CndoZW4g
dGhlIHJlcXVlc3QgZmFpbHMsIGFuZCBjb25zdW1lcnMgY2FuIHByb3ZpZGUgY3VzdG9tIGVycm9y
IG1lc3NhZ2VzLgoKQ29udmVydGluZyBkcml2ZXJzIHRvIHVzZSB0aGlzIEFQSSBoYXMgdGhlIGZv
bGxvd2luZyBiZW5lZml0czoKCiAgMS5Nb3JlIHRoYW4gMiwwMDAgbGluZXMgb2YgY29kZSBjYW4g
YmUgc2F2ZWQgYnkgcmVtb3ZpbmcgcmVkdW5kYW50IGVycm9yCiAgbWVzc2FnZXMgaW4gZHJpdmVy
cy4KCiAgMi5VcHBlci1sYXllciBmdW5jdGlvbnMgY2FuIGRpcmVjdGx5IHJldHVybiBlcnJvciBj
b2RlcyB3aXRob3V0IG1pc3NpbmcKICBkZWJ1Z2dpbmcgaW5mb3JtYXRpb24uCgogIDMuSGF2aW5n
IHByb3BlciBhbmQgY29uc2lzdGVudCBpbmZvcm1hdGlvbiBhYm91dCB3aHkgdGhlIGRldmljZSBj
YW5ub3QKICBiZSB1c2VkIGlzIHVzZWZ1bC4KCkNjOiBUaG9tYXMgR2xlaXhuZXIgPHRnbHhAbGlu
dXRyb25peC5kZT4KQ2M6IEtyenlzenRvZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4KQ2M6
ICJVd2UgS2xlaW5lLUvDtm5pZyIgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KQ2M6
IEpvbmF0aGFuIENhbWVyb24gPEpvbmF0aGFuLkNhbWVyb25ASHVhd2VpLmNvbT4KQ2M6IEFuZ2Vs
b0dpb2FjY2hpbm8gRGVsIFJlZ25vICA8YW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJv
cmEuY29tPgpTaWduZWQtb2ZmLWJ5OiBZYW5ndGFvIExpIDxmcmFuay5saUB2aXZvLmNvbT4KU2ln
bmVkLW9mZi1ieTogUGFuIENodWFuZyA8cGFuY2h1YW5nQHZpdm8uY29tPgotLS0KIGRyaXZlcnMv
dGhlcm1hbC9zdC9zdF90aGVybWFsX21lbW1hcC5jIHwgMTIgKysrKystLS0tLS0tCiBkcml2ZXJz
L3RoZXJtYWwvc3Qvc3RtX3RoZXJtYWwuYyAgICAgICB8IDE0ICsrKysrLS0tLS0tLS0tCiAyIGZp
bGVzIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDE2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvdGhlcm1hbC9zdC9zdF90aGVybWFsX21lbW1hcC5jIGIvZHJpdmVycy90aGVy
bWFsL3N0L3N0X3RoZXJtYWxfbWVtbWFwLmMKaW5kZXggOGY3NmU1MGVhNTY3Li5mMGRhYzdhMTc4
ODMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdGhlcm1hbC9zdC9zdF90aGVybWFsX21lbW1hcC5jCisr
KyBiL2RyaXZlcnMvdGhlcm1hbC9zdC9zdF90aGVybWFsX21lbW1hcC5jCkBAIC05NywxNCArOTcs
MTIgQEAgc3RhdGljIGludCBzdF9tbWFwX3JlZ2lzdGVyX2VuYWJsZV9pcnEoc3RydWN0IHN0X3Ro
ZXJtYWxfc2Vuc29yICpzZW5zb3IpCiAJaWYgKHNlbnNvci0+aXJxIDwgMCkKIAkJcmV0dXJuIHNl
bnNvci0+aXJxOwogCi0JcmV0ID0gZGV2bV9yZXF1ZXN0X3RocmVhZGVkX2lycShkZXYsIHNlbnNv
ci0+aXJxLAotCQkJCQlOVUxMLCBzdF9tbWFwX3RoZXJtYWxfdHJpcF9oYW5kbGVyLAotCQkJCQlJ
UlFGX1RSSUdHRVJfUklTSU5HIHwgSVJRRl9PTkVTSE9ULAotCQkJCQlkZXYtPmRyaXZlci0+bmFt
ZSwgc2Vuc29yKTsKLQlpZiAocmV0KSB7Ci0JCWRldl9lcnIoZGV2LCAiZmFpbGVkIHRvIHJlZ2lz
dGVyIElSUSAlZFxuIiwgc2Vuc29yLT5pcnEpOworCXJldCA9IGRldm1fcmVxdWVzdF90aHJlYWRl
ZF9pcnFfcHJvYmUoZGV2LCBzZW5zb3ItPmlycSwKKwkJCQkJICAgICAgTlVMTCwgc3RfbW1hcF90
aGVybWFsX3RyaXBfaGFuZGxlciwKKwkJCQkJICAgICAgSVJRRl9UUklHR0VSX1JJU0lORyB8IElS
UUZfT05FU0hPVCwKKwkJCQkJICAgICAgZGV2LT5kcml2ZXItPm5hbWUsIHNlbnNvciwgTlVMTCk7
CisJaWYgKHJldCkKIAkJcmV0dXJuIHJldDsKLQl9CiAKIAlyZXR1cm4gc3RfbW1hcF9lbmFibGVf
aXJxKHNlbnNvcik7CiB9CmRpZmYgLS1naXQgYS9kcml2ZXJzL3RoZXJtYWwvc3Qvc3RtX3RoZXJt
YWwuYyBiL2RyaXZlcnMvdGhlcm1hbC9zdC9zdG1fdGhlcm1hbC5jCmluZGV4IDZlOTBlYjlmNDE0
ZC4uMjY3Yjg2ZTJlOGMzIDEwMDY0NAotLS0gYS9kcml2ZXJzL3RoZXJtYWwvc3Qvc3RtX3RoZXJt
YWwuYworKysgYi9kcml2ZXJzL3RoZXJtYWwvc3Qvc3RtX3RoZXJtYWwuYwpAQCAtMzg1LDE2ICsz
ODUsMTIgQEAgc3RhdGljIGludCBzdG1fcmVnaXN0ZXJfaXJxKHN0cnVjdCBzdG1fdGhlcm1hbF9z
ZW5zb3IgKnNlbnNvcikKIAlpZiAoc2Vuc29yLT5pcnEgPCAwKQogCQlyZXR1cm4gc2Vuc29yLT5p
cnE7CiAKLQlyZXQgPSBkZXZtX3JlcXVlc3RfdGhyZWFkZWRfaXJxKGRldiwgc2Vuc29yLT5pcnEs
Ci0JCQkJCU5VTEwsCi0JCQkJCXN0bV90aGVybWFsX2lycV9oYW5kbGVyLAotCQkJCQlJUlFGX09O
RVNIT1QsCi0JCQkJCWRldi0+ZHJpdmVyLT5uYW1lLCBzZW5zb3IpOwotCWlmIChyZXQpIHsKLQkJ
ZGV2X2VycihkZXYsICIlczogRmFpbGVkIHRvIHJlZ2lzdGVyIElSUSAlZFxuIiwgX19mdW5jX18s
Ci0JCQlzZW5zb3ItPmlycSk7CisJcmV0ID0gZGV2bV9yZXF1ZXN0X3RocmVhZGVkX2lycV9wcm9i
ZShkZXYsIHNlbnNvci0+aXJxLCBOVUxMLAorCQkJCQkgICAgICBzdG1fdGhlcm1hbF9pcnFfaGFu
ZGxlciwKKwkJCQkJICAgICAgSVJRRl9PTkVTSE9ULAorCQkJCQkgICAgICBkZXYtPmRyaXZlci0+
bmFtZSwgc2Vuc29yLCBOVUxMKTsKKwlpZiAocmV0KQogCQlyZXR1cm4gcmV0OwotCX0KIAogCWRl
dl9kYmcoZGV2LCAiJXM6IHRoZXJtYWwgSVJRIHJlZ2lzdGVyZWQiLCBfX2Z1bmNfXyk7CiAKLS0g
CjIuMzkuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlz
dGluZm8vbGludXgtc3RtMzIK
