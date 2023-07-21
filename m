Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF9075C371
	for <lists+linux-stm32@lfdr.de>; Fri, 21 Jul 2023 11:47:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AB605C6B442;
	Fri, 21 Jul 2023 09:47:49 +0000 (UTC)
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2127.outbound.protection.outlook.com [40.107.215.127])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 20278C65E70
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Jul 2023 09:47:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V6wlzlGQPvtMMyFqjjrmiYvHtVLAZ1aCeWbkDzsK7Vn8V0priy9jgG/qU0M2pvjp0YXOglaghury+lfYAsx53Nhh3QrYRPEMgdQToGhAze7IEESbZ/rZvhm1GnAVgPzlzR0bEgKwCO3w8jvuwgBASm4S4l8U3MeNEaQEUkMg/miBUR+AyMyqG5ntZnEW8l9LsVEpanwp0Zk2Qgy9aSjYrtiEQqjsE9ltTJlc/fKIaTJYr+vaNgEsopbVciPt6Ox3F1fxOBSZP5V6RLtA4JTatvh7v2r0QPqsOlzZSFBSEOXHQKH27L8HnN/7kaGcgAlC+lR5mOnMouLTe57yJcxnSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q+TzYuEeTgIKdnKfQ77B8vedEfB0P2/z7sQrh3Z4zJE=;
 b=JVQgROdNkBp2PKh0grjhUy+F6cDegVgT/ijW8wOzGgQjw8etkfa+W67oceX4ULcPfv7LwEAaGIihpTLiGyuakWSQx8/VbbsTjjhg171N83SlgCny74Ehpz7LHYwX7pxkfBkgVwSDj3OKRQ5T3S5cOsm0gWwDQKS/HR5rEb578E9d9dfoOGdlsvtuYl2HnKUeeuNQT9Z8o3GKI61IO0r11ACpxDHbD+a0v9cvuNtmEnIdmW9+87l/+SAGGx+PhfiBqPwSodN39pcQWPzTOoJQ0HDeU5RS6S5okpBaWxaqfAAHn06h59rLjpTEr8FAEip+xAh7r7UaDa5YdDg6QgJhCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q+TzYuEeTgIKdnKfQ77B8vedEfB0P2/z7sQrh3Z4zJE=;
 b=qfcHrklTXW184EA90QgOV1RDHJpntKHaG+564U4M5St5ugEuR0m5OMWRPh6AooN7IbLq5ZQc41W/8iPrxRUHcG2P0bZU+vAWakaChBKqu8OeqOfcjZOzsV6x0xQDS87E59AaqCU0/OS9l2z0kWS4iV/ct5DmiNAHqkxlH/zdt49k+GFtpt2qiAoIrWTxDRPi09awjePWuDBGGur2nkEadxKMpgS1UoKjJNTU+zqi6QJE3ms9KyoVPVtoOFOQrgJzrGV5c4RWP/w7LAS39+T5951ve17d1w7KkXsKGvz5lmzT6a/Ondmz2bZ2bX84Tu2nFgzHbPFm/14IDB9FXtZfSw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SEYPR06MB6311.apcprd06.prod.outlook.com (2603:1096:101:13a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.28; Fri, 21 Jul
 2023 09:47:40 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::732f:ea1d:45a1:1e0b]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::732f:ea1d:45a1:1e0b%3]) with mapi id 15.20.6588.031; Fri, 21 Jul 2023
 09:47:40 +0000
From: Yangtao Li <frank.li@vivo.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Fri, 21 Jul 2023 17:46:37 +0800
Message-Id: <20230721094641.77189-18-frank.li@vivo.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230721094641.77189-1-frank.li@vivo.com>
References: <20230721094641.77189-1-frank.li@vivo.com>
X-ClientProxiedBy: SI2PR01CA0031.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::11) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SEYPR06MB6311:EE_
X-MS-Office365-Filtering-Correlation-Id: 25dd82d3-01c7-4f43-e2d1-08db89cf85cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ty5Gj0IOo+nnkQtTl6AOhfhcPMvlwZ6WVnhHrYNVE9iFMsTqS0/Weh/6mv6mk19sLje896WMO/SDCMZ/Z3Z8I4nLqNgYl2IiUePmTPHM5Knw8N3B2j5qpucWDOnHTPIUPLOKlk/7pxXiPOfiLAUd1SMiR9NmpwGtTlGvJkTa1yVtcBTzCuDkGYF3AOEn9Zl7cTn1h04DhFjPYQst7GHd5bA6MPHHSvcXZYQDh6GV5pMS0IJLwOaYQSBRyRsqkGOoXXkv4hzmYo/caNgw28UAtFrqtIYEe3rAHxrT7bj6c4ZqNVLcDFcX7hnReWHvma6Y5o1qZkDXXTTkbPFvhZ9/6+Vt9bE1qhat/2Jqn9buRnsl78JySBi6Y3QNICb6aBjARuZUJELKPG5k0OamAtW+aKfP5YRJAO014V6xn/YzeC/mLmzEk5OOZ22URwL6PEPX189GNqxttNzRHSsO7y5UuxjOQ0ibdzuHgdgt2CeVCQagi9AP+1FjosCJkQ9Htiw99J9AhmoE+rCjLDDVwsJqOry5Hyu8mZyd0+tTvfSp3A3vW+Z95nbW/ukBEW5qGfeiHCqs0FNi4u5MtgetnerpG+Y3HsM1X6g9Q8PT03NqfsSkGcE38RT9adb6uG3TG528
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(376002)(346002)(136003)(366004)(39860400002)(451199021)(54906003)(52116002)(6486002)(6666004)(478600001)(110136005)(6512007)(186003)(6506007)(1076003)(26005)(2906002)(41300700001)(316002)(4326008)(7416002)(5660300002)(66476007)(8676002)(2616005)(66946007)(8936002)(66556008)(38100700002)(38350700002)(36756003)(86362001)(66574015)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MWNGaEREZ1BoZXJRd1ZJMWtremtKTnUwN3RLQTBjMXoyM01la25pMWw2MDNG?=
 =?utf-8?B?UkhuNEpsQVlqK2I2bm9uc1o0bGpHWFhKbjVORWU5akp2R00rTlVmSHNoS0xR?=
 =?utf-8?B?RFcyUVB5QW1tRktyalo3WHI0cG4xNWhNY21wcVVNU2xIY1JZOVJmL05zZ2c1?=
 =?utf-8?B?MVFhMlJHb0J2cDJzTXliRnJ2SlVaeGl2NU5jNzJhdC9oVjdEdjBxSDJTRVBE?=
 =?utf-8?B?WlYzQzg4S1YxeEtoU1hxWG1jYW43TlI3YUVrbzJFeTJNOEF4cDZ0ZWxaOEI5?=
 =?utf-8?B?UkY2WXVCK00rdXh4eE1PTkhTbzhZbHNQY2FFSGF5Zm15VFZGcXVaWEFkS2RE?=
 =?utf-8?B?Ry92aGp0WUp5ZDN2OTNIaXRCRDkvbmozcW54SWJPWGVoam9kVEF2d3UybWNZ?=
 =?utf-8?B?ZGFvdlN5c0hYS1dnZXRGSm11eEY5VDR5eC8wTkhLdWtUSTMzTFhIN0dtcU90?=
 =?utf-8?B?azMyOVRPSDVJcUVFNzM0SE9IcisyaHVGMGNmT1pwQWtXeEpLOFBNSkZUWjFC?=
 =?utf-8?B?a1FSWFozMVhvcHp5cGttSFZSTE15U0t2UWtFTk1CYUh0aWxMbzF1V0JOK2pX?=
 =?utf-8?B?TE5YV09FTjBCOVprTStBSEh6Wkl1Z0ZVU2V1YXozSmZqUFlTSko0emg3dTlN?=
 =?utf-8?B?alRhVXdSNk5sdzAxa1lJNlBncGcxU1NZRkE2eUNMS1lzbW0yVkMvRlNzR1Ay?=
 =?utf-8?B?Z25VME5CaFc0UUxvV0hXVFZTNkE3T0hnYVF6Z0c0eE96ZTUvWVN5M2FlSXNp?=
 =?utf-8?B?MXUyOW1pUGlzM1A0anZWdC9FWTEzWkdpTW1wdGZUTkg5eGpEdlZTd3BpUVps?=
 =?utf-8?B?SW5uMkdTb0lpSW56RnM1a3VvUVljQXcxc0MrNXkxVWpiRlNzamlEcUxsVm5L?=
 =?utf-8?B?U0NKOU01ejJYRDZGRlRLOTA5bDNRTHo0aGZxS1Z2U01MNEVWZG1vYzMyWmk1?=
 =?utf-8?B?dDFDWVJzYkJuaUx6ZzR4TThZblQyaDA5VS9nRURRVERILzhubGRwNlk2UFJv?=
 =?utf-8?B?YlZLNTJucFl0STN2TmFmbUJDa0t5ZzkxRUF1S0wzQ0t2WUVMdjJ6ZDR0WWNo?=
 =?utf-8?B?VVNtdHAxanhvNC9RWHFMWW4xVlFkdy9Td1RhUWZyc1NDRU42d01DVkhRd01v?=
 =?utf-8?B?bWlrQWVXOEhUNjcyU3doT0wxL202b0t4V05HeDJydmR0T05EUUtiVXZ0bVZF?=
 =?utf-8?B?bTgvNjIwR3VudFpSR3B0aFVUYTdZNUJwUmtlUmhsZEIxUDNab1k4VlJ4ZDg0?=
 =?utf-8?B?NWhVS0d5UHd5aDU1UEdJRjVDUU9lRFdvTURieGlKUStuQVVlV2tHbjd0QkRu?=
 =?utf-8?B?OUs0QXhiTGhOa0hCa1Q0MmtpNGRyQ0FGVE5KR3J1eXVsVmxtQi9wYUYwOUVC?=
 =?utf-8?B?Skhlbkd2SC96SUovSmhORVJlNHROR2owRTdyT3RaWGh4eSsyVHdJTGdoYXo1?=
 =?utf-8?B?N2l6WDJta0VqeW1Ic1JuTkZsaFRhQ3Z6Tlc5bGthTnFHdXJZNXIrTmc4blFs?=
 =?utf-8?B?V0hudHZXK2hyRy92dnAvdjZQbGxRRnpkSTAyd1UzYVRVWExERm12VUo5dW5z?=
 =?utf-8?B?M0xrOWFvSlRqckQ2OFNRUzB3SDdHNkxFR09aVWJpZ21KaVhWUUVhQ2pQZm9O?=
 =?utf-8?B?RFpDSi9GdHhVTEVwZEhQeUo5ZUZ2L0VXZGF4clpyaVNXNTFMWjRYWThqTXFa?=
 =?utf-8?B?THcvRHBMS0VLWktUVGJKMWpFc01zb3NTM1RZKzIvQVc3MVRZYWR6S1pqSVUv?=
 =?utf-8?B?TDZmMXV4WTl3WU5wdXlpZ1R2OWFHVkc1TlVQS2J2SVJWcWo0bjZzSlJxWDU0?=
 =?utf-8?B?Q3FxL2xteEhmUkpVU3BKV3dRMFU2ZFNSQWFFN2dFVTdxam43WnZOdGxHTkZy?=
 =?utf-8?B?ZzZraDEvK1ZmZ0Zjb0NYY0UrejJjTmVtN0NCMHpKU1l2WHhYZjc0OVNMSWNr?=
 =?utf-8?B?b09TQ3VPblRsc0QrZjM2bWorNkJBcmRGU2lrL3VTT25KWmVDMVdoQ01kUzlG?=
 =?utf-8?B?ek9Ua0Q5YjJkU3pwVk55bVlVMmNVNDNEY3VsK3hUOU9tNUZ0VFNtN2JmMmZ2?=
 =?utf-8?B?VkFlbk9VSjNtR2Q3YU1NRCszM24waXlVZTB2MUZLbHNSK3BjaUwyaEJteVJN?=
 =?utf-8?Q?TiNKLYoWcFTmYMWkFDzVCIfO6?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25dd82d3-01c7-4f43-e2d1-08db89cf85cf
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2023 09:47:40.0831 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YxNfBV1HrrqXpF3MlG4NPuTs8lJNpDnAqWpncJfNAMW+b4eoJfsMkfkREzmvv3sv+TI9Y3d5g8Kkqolt+tK6Ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6311
Cc: Yangtao Li <frank.li@vivo.com>, linux-pm@vger.kernel.org,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [Linux-stm32] [PATCH v5 18/22] thermal/drivers/stm: convert to use
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

VGhlcmUgYXJlIG1vcmUgdGhhbiA3MDAgY2FsbHMgdG8gZGV2bV9yZXF1ZXN0X3RocmVhZGVkX2ly
cSBtZXRob2QgYW5kCm1vcmUgdGhhbiAxMDAwIGNhbGxzIHRvIGRldm1fcmVxdWVzdF9pcnEgbWV0
aG9kLiBNb3N0IGRyaXZlcnMgb25seQpyZXF1ZXN0IG9uZSBpbnRlcnJ1cHQgcmVzb3VyY2UsIGFu
ZCB0aGVzZSBlcnJvciBtZXNzYWdlcyBhcmUgYmFzaWNhbGx5CnRoZSBzYW1lLiBJZiBlcnJvciBt
ZXNzYWdlcyBhcmUgcHJpbnRlZCBldmVyeXdoZXJlLCBtb3JlIHRoYW4gMjAwMCBsaW5lcwpvZiBj
b2RlIGNhbiBiZSBzYXZlZCBieSByZW1vdmluZyB0aGUgbXNnIGluIHRoZSBkcml2ZXIuCgpBbmQg
dGdseCBwb2ludCBvdXQgdGhhdDoKCiAgSWYgd2UgYWN0dWFsbHkgbG9vayBhdCB0aGUgY2FsbCBz
aXRlcyBvZgogIGRldm1fcmVxdWVzdF90aHJlYWRlZF9pcnEoKSB0aGVuIHRoZSB2YXN0IG1ham9y
aXR5IG9mIHRoZW0gcHJpbnQgbW9yZSBvcgogIGxlc3MgbG91c3kgZXJyb3IgbWVzc2FnZXMuIEEg
cXVpY2sgZ3JlcC9zZWQvYXdrL3NvcnQvdW5pcSByZXZlYWxlZAoKICAgICA1MTkgbWVzc2FnZXMg
dG90YWwgKHRoZXJlIGFyZSBwcm9iYWJseSBtb3JlKQoKICAgICAzNTIgdW5pcXVlIG1lc3NhZ2Vz
CgogICAgIDMyMyB1bmlxdWUgbWVzc2FnZXMgYWZ0ZXIgbG93ZXIgY2FzaW5nCgogICAgICAgICBU
aG9zZSAzMjMgYXJlIG1vc3RseSBqdXN0IHZhcmlhbnRzIG9mIHRoZSBzYW1lIHBhdHRlcm5zIHdp
dGgKICAgICAgICAgc2xpZ2h0IG1vZGlmaWNhdGlvbnMgaW4gZm9ybWF0dGluZyBhbmQgaW5mb3Jt
YXRpb24gcHJvdmlkZWQuCgogICAgIDE4NiBvZiB0aGVzZSBtZXNzYWdlcyBkbyBub3QgZGVsaXZl
ciBhbnkgdXNlZnVsIGluZm9ybWF0aW9uLAogICAgICAgICBlLmcuICJubyBpcnEiLCAiCgogICAg
IFRoZSBtb3N0IHVzZWZ1bCBvbmUgb2YgYWxsIGlzOiAiY291bGQgcmVxdWVzdCB3YWtldXAgaXJx
OiAlZCIKCiAgU28gdGhlcmUgaXMgY2VydGFpbmx5IGFuIGFyZ3VtZW50IHRvIGJlIG1hZGUgdGhh
dCB0aGlzIHBhcnRpY3VsYXIKICBmdW5jdGlvbiBzaG91bGQgcHJpbnQgYSB3ZWxsIGZvcm1hdHRl
ZCBhbmQgaW5mb3JtYXRpdmUgZXJyb3IgbWVzc2FnZS4KCiAgSXQncyBub3QgYSBnZW5lcmFsIGFs
bG9jYXRvciBsaWtlIGttYWxsb2MoKS4gSXQncyBzcGVjaWFsaXplZCBhbmQgaW4gdGhlCiAgdmFz
dCBtYWpvcml0eSBvZiBjYXNlcyBmYWlsaW5nIHRvIHJlcXVlc3QgdGhlIGludGVycnVwdCBjYXVz
ZXMgdGhlCiAgZGV2aWNlIHByb2JlIHRvIGZhaWwuIFNvIGhhdmluZyBwcm9wZXIgYW5kIGNvbnNp
c3RlbnQgaW5mb3JtYXRpb24gd2h5CiAgdGhlIGRldmljZSBjYW5ub3QgYmUgdXNlZCBfaXNfIHVz
ZWZ1bC4KClNvIGNvbnZlcnQgdG8gdXNlIGRldm1fcmVxdWVzdCpfaXJxX3Byb2JlKCkgQVBJLCB3
aGljaCBlbnN1cmUgdGhhdCBhbGwKZXJyb3IgaGFuZGxpbmcgYnJhbmNoZXMgcHJpbnQgZXJyb3Ig
aW5mb3JtYXRpb24uCgpJbiB0aGlzIHdheSwgd2hlbiB0aGlzIGZ1bmN0aW9uIGZhaWxzLCB0aGUg
dXBwZXItbGF5ZXIgZnVuY3Rpb25zIGNhbgpkaXJlY3RseSByZXR1cm4gYW4gZXJyb3IgY29kZSB3
aXRob3V0IG1pc3NpbmcgZGVidWdnaW5nIGluZm9ybWF0aW9uLgpPdGhlcndpc2UsIHRoZSBlcnJv
ciBtZXNzYWdlIHdpbGwgYmUgcHJpbnRlZCByZWR1bmRhbnRseSBvciBtaXNzaW5nLgoKQ2M6IFRo
b21hcyBHbGVpeG5lciA8dGdseEBsaW51dHJvbml4LmRlPgpDYzogS3J6eXN6dG9mIEtvemxvd3Nr
aSA8a3J6a0BrZXJuZWwub3JnPgpDYzogIlV3ZSBLbGVpbmUtS8O2bmlnIiA8dS5rbGVpbmUta29l
bmlnQHBlbmd1dHJvbml4LmRlPgpDYzogSm9uYXRoYW4gQ2FtZXJvbiA8Sm9uYXRoYW4uQ2FtZXJv
bkBIdWF3ZWkuY29tPgpDYzogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gIDxhbmdlbG9naW9h
Y2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20+ClNpZ25lZC1vZmYtYnk6IFlhbmd0YW8gTGkg
PGZyYW5rLmxpQHZpdm8uY29tPgotLS0KIGRyaXZlcnMvdGhlcm1hbC9zdC9zdF90aGVybWFsX21l
bW1hcC5jIHwgMTIgKysrKystLS0tLS0tCiBkcml2ZXJzL3RoZXJtYWwvc3Qvc3RtX3RoZXJtYWwu
YyAgICAgICB8IDEzICsrKystLS0tLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25z
KCspLCAxNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3RoZXJtYWwvc3Qvc3Rf
dGhlcm1hbF9tZW1tYXAuYyBiL2RyaXZlcnMvdGhlcm1hbC9zdC9zdF90aGVybWFsX21lbW1hcC5j
CmluZGV4IGU4Y2ZhODNiNzI0YS4uNDBiYjMxOGI1NDg5IDEwMDY0NAotLS0gYS9kcml2ZXJzL3Ro
ZXJtYWwvc3Qvc3RfdGhlcm1hbF9tZW1tYXAuYworKysgYi9kcml2ZXJzL3RoZXJtYWwvc3Qvc3Rf
dGhlcm1hbF9tZW1tYXAuYwpAQCAtOTcsMTQgKzk3LDEyIEBAIHN0YXRpYyBpbnQgc3RfbW1hcF9y
ZWdpc3Rlcl9lbmFibGVfaXJxKHN0cnVjdCBzdF90aGVybWFsX3NlbnNvciAqc2Vuc29yKQogCWlm
IChzZW5zb3ItPmlycSA8IDApCiAJCXJldHVybiBzZW5zb3ItPmlycTsKIAotCXJldCA9IGRldm1f
cmVxdWVzdF90aHJlYWRlZF9pcnEoZGV2LCBzZW5zb3ItPmlycSwKLQkJCQkJTlVMTCwgc3RfbW1h
cF90aGVybWFsX3RyaXBfaGFuZGxlciwKLQkJCQkJSVJRRl9UUklHR0VSX1JJU0lORyB8IElSUUZf
T05FU0hPVCwKLQkJCQkJZGV2LT5kcml2ZXItPm5hbWUsIHNlbnNvcik7Ci0JaWYgKHJldCkgewot
CQlkZXZfZXJyKGRldiwgImZhaWxlZCB0byByZWdpc3RlciBJUlEgJWRcbiIsIHNlbnNvci0+aXJx
KTsKKwlyZXQgPSBkZXZtX3JlcXVlc3RfdGhyZWFkZWRfaXJxX3Byb2JlKGRldiwgc2Vuc29yLT5p
cnEsCisJCQkJCSAgICAgIE5VTEwsIHN0X21tYXBfdGhlcm1hbF90cmlwX2hhbmRsZXIsCisJCQkJ
CSAgICAgIElSUUZfVFJJR0dFUl9SSVNJTkcgfCBJUlFGX09ORVNIT1QsCisJCQkJCSAgICAgIGRl
di0+ZHJpdmVyLT5uYW1lLCBzZW5zb3IsIE5VTEwpOworCWlmIChyZXQpCiAJCXJldHVybiByZXQ7
Ci0JfQogCiAJcmV0dXJuIHN0X21tYXBfZW5hYmxlX2lycShzZW5zb3IpOwogfQpkaWZmIC0tZ2l0
IGEvZHJpdmVycy90aGVybWFsL3N0L3N0bV90aGVybWFsLmMgYi9kcml2ZXJzL3RoZXJtYWwvc3Qv
c3RtX3RoZXJtYWwuYwppbmRleCA5MDNmY2YxNzYzZjEuLjZhMzZhN2VhYjliZCAxMDA2NDQKLS0t
IGEvZHJpdmVycy90aGVybWFsL3N0L3N0bV90aGVybWFsLmMKKysrIGIvZHJpdmVycy90aGVybWFs
L3N0L3N0bV90aGVybWFsLmMKQEAgLTM4NywxNiArMzg3LDExIEBAIHN0YXRpYyBpbnQgc3RtX3Jl
Z2lzdGVyX2lycShzdHJ1Y3Qgc3RtX3RoZXJtYWxfc2Vuc29yICpzZW5zb3IpCiAJaWYgKHNlbnNv
ci0+aXJxIDwgMCkKIAkJcmV0dXJuIHNlbnNvci0+aXJxOwogCi0JcmV0ID0gZGV2bV9yZXF1ZXN0
X3RocmVhZGVkX2lycShkZXYsIHNlbnNvci0+aXJxLAotCQkJCQlOVUxMLAotCQkJCQlzdG1fdGhl
cm1hbF9pcnFfaGFuZGxlciwKLQkJCQkJSVJRRl9PTkVTSE9ULAotCQkJCQlkZXYtPmRyaXZlci0+
bmFtZSwgc2Vuc29yKTsKLQlpZiAocmV0KSB7Ci0JCWRldl9lcnIoZGV2LCAiJXM6IEZhaWxlZCB0
byByZWdpc3RlciBJUlEgJWRcbiIsIF9fZnVuY19fLAotCQkJc2Vuc29yLT5pcnEpOworCXJldCA9
IGRldm1fcmVxdWVzdF90aHJlYWRlZF9pcnFfcHJvYmUoZGV2LCBzZW5zb3ItPmlycSwgTlVMTCwK
KwkJCQkJICAgICAgc3RtX3RoZXJtYWxfaXJxX2hhbmRsZXIsIElSUUZfT05FU0hPVCwKKwkJCQkJ
ICAgICAgZGV2LT5kcml2ZXItPm5hbWUsIHNlbnNvciwgTlVMTCk7CisJaWYgKHJldCkKIAkJcmV0
dXJuIHJldDsKLQl9CiAKIAlkZXZfZGJnKGRldiwgIiVzOiB0aGVybWFsIElSUSByZWdpc3RlcmVk
IiwgX19mdW5jX18pOwogCi0tIAoyLjM5LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBz
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
