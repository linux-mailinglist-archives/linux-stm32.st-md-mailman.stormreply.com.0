Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F9A74D27C
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Jul 2023 12:00:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5BC38C6B457;
	Mon, 10 Jul 2023 10:00:29 +0000 (UTC)
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2098.outbound.protection.outlook.com [40.107.255.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 92B3AC6A61D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Jul 2023 10:00:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YDi8f4fhqBQmLo/w1erRj4h0KDlAtdnSYVvIxrxqzZptmLOvVw0oCGfXqxRJT2yMWLHiCk6wFbGmZPHwv+jGf+i4uRzAIBpkOnshebHP7jC1j2C/L2Upo9EjR8nXmfABFuPbSMc9mY2p34D0/6/n5qKPibxngIHOta95yf7Jb1Fh/lBPXuPUaqSl+kKwmjwc3fYidJfbLEcsnAhxrJ2RtJ1OFhhk6l0a4dqjBq9iA1RYZ8cOnsKeGoXfZt5YxfzJhoeXv7MCEJxb+x0iSu1b6Ebcth3IWCmrJYymTzX7X22P/axAke0hBUY3lxFAJI5Ywi4hbbRENZvTzJZse4/9Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q+TzYuEeTgIKdnKfQ77B8vedEfB0P2/z7sQrh3Z4zJE=;
 b=jbdgUc597raW8lebj/wdUJpRl7kmq9zg7nrHuiE6i8l/UcLXbrdnlcLBxenKen/FrBPMG0E4yGM8PNVS5D6ISW9oZmr06JoZiz3hVgM3nk4gZwjWSP6jsVeKZZtOg8ChQ3oOlbcP7IgLL6YtxI5kfjz6dA/KogeSC5eylREB7cMYyYPOhJaG/LPqlgDlowfJmK9Ztu8g8rN9swqepz5FDRD2r6GnqLa+9VReUc5plE2jJpm6i4Ucc27hwV1ng+1G+EX2myWesICHHo4ayN2nuchAF3L2cHG6jcSNJPhjzkzczHa5pJCIuMkuKjvQ+UDb24D3ACI50jgQB4us0vkD+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q+TzYuEeTgIKdnKfQ77B8vedEfB0P2/z7sQrh3Z4zJE=;
 b=kiD7/uXVMCofQRZRkRX6QdEPamF9JqMfA1ZKeGZh2ReH/s0XEXen5Alpbwi069HZrEmwGNKJ9pGCt81SoCGON/onmU/S5TA1kfGCmYbK2KGEOPeiFbdvooV/Sx3bDYqPNUsGX2yvxDCtFJwB24CYdOS2g1SS6GJpjEKYDenspndmt3yI6g2wlPzz1v4OORXOFrtxc6zjgd5dV+JliHaw37Xpp3aRduUbp3LHgu7aJD9F2It79VEBvZyEpNmzLoGOhTDeiTdWGhov8z7g3Y+nngSEflq3m1K98v/ryph0xSu8DaWpP1upSvOH0FPEWSD3FIWr2sf7ovdMOyFaZJm3yQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TYZPR06MB6096.apcprd06.prod.outlook.com (2603:1096:400:33e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Mon, 10 Jul
 2023 10:00:24 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c%5]) with mapi id 15.20.6565.028; Mon, 10 Jul 2023
 10:00:24 +0000
From: Yangtao Li <frank.li@vivo.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Mon, 10 Jul 2023 17:59:21 +0800
Message-Id: <20230710095926.15614-17-frank.li@vivo.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230710095926.15614-1-frank.li@vivo.com>
References: <20230710095926.15614-1-frank.li@vivo.com>
X-ClientProxiedBy: SG2PR01CA0167.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::23) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|TYZPR06MB6096:EE_
X-MS-Office365-Filtering-Correlation-Id: 50708932-a9ee-43cd-aeba-08db812c7a9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6lRSknbGh8PmoS3Xny7ElGcMj4BkXGR6wUlGvJFyeGElbaP0+MxuEZVysx+sIgC0Tl9LrAnn2bMHfKSvqYIxDoURVajnmY2KoOUu8mNxcaTe6hgvKy8LG/2RvIx+Ei+wpuYcbTmdhy52anUfS1gVT62LKb397GM9JtBxQzNBIl8O/5rMgvCwUJGkFyn4GUM2+3+qirkqZBdciwPO/9qp4wA4iblD9VoC/DtGU7h/naSkfSnAPCbydxH6EZQLfSlpzIv95QdxsDe73yYndvCXRnWYJYf73D8bdPFtemKacq6w72ysCwpQrnrB5DrOtubIY7pBYN+cNogfEPYvMjilqyjTpcLf0ZG3MMDETrsPKvhGUByvkhDTSVEmK3SvOjJVdFqHOKUAvC+PteSwv0Jq2lkICtH3e6fF+WSCQbbbM4N3PF7/8G3vrtC9kMCen6nHg8F6S/xvlGU+BsAS1yoaqiae+E9CkZ/DPWYsjMtfpYDhIMi3R3T4szfHevmV3nln9xsaDhPJnbqROzyNpRfwnLnrZKPZxsqAqiNxMMAy4sBMScKEqmV1tDcs3DEusA9L2+bd3lCd1ubWgI8H8oNj2HcroyGBUaicMB2it75vLPcGOlzFmKDSI8WhyHH5okEb
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(39850400004)(366004)(136003)(346002)(396003)(451199021)(186003)(6506007)(1076003)(2616005)(6512007)(26005)(66574015)(83380400001)(41300700001)(4326008)(66476007)(2906002)(66556008)(316002)(7416002)(5660300002)(8936002)(8676002)(478600001)(66946007)(6486002)(52116002)(6666004)(110136005)(54906003)(36756003)(38350700002)(38100700002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dVkxNmltZGNxT0c4SXdOSjJyTUt3K0FLTGp0UHBoZmcwRUFiRGhidGtnZ1lF?=
 =?utf-8?B?RUExV1IxcThramlVYmZEY1l3UUZwL200dytSdFZkaFhKZDlVRW54eFkwdW1R?=
 =?utf-8?B?U3dlZkJ1L3owZDBqRTd1TlNkRGZzY2xoUUVSdWFEd1pQTDVIUHZTcExLTEFX?=
 =?utf-8?B?c1VqbklIQW9VQUVDZDlrZUcxK2ZoOEs3QkhmckZuU1Q0dXJVNmdhQW9vRm9j?=
 =?utf-8?B?WmdiU1VYS2taT2MwTFRzSXAxVEoxRnI5SzBHM0VETlV4cWRaMlc1ZG5mSm1V?=
 =?utf-8?B?RURoRXhjYzk4Rjd5NjAwdlhQbmdQWUNaZ3VyUkxMaTlraE93ZWNIU0IzNFJU?=
 =?utf-8?B?ZzB4NWQwc3lqdnRtSVFFUGZEQVRDWlZ1bkJyTEdlQ0txeG5hVlNybXlKTUlK?=
 =?utf-8?B?UVVVSVcvTE00dTVtalRkL2xzdkYvY0VjZm82c2NLRXBEYXE4aHgyNEZVb0Rl?=
 =?utf-8?B?ZHNuSTdhNHdmUXdSQWNEckd1b0dKckgwYkJBRm1mVUFmZW1JbVl3djdlUFRR?=
 =?utf-8?B?cTlsZmk5YXlzRnVDaVBQWmpOZXVWQlh2OC9PbW5iQUNSNWJ1b0ttbVhqNDUw?=
 =?utf-8?B?NSswQ0wyb0JuZGNyVXpLYkFkU2FxazFTZ25EQnhsU1pTTjdrWWpIS3p6ZFcw?=
 =?utf-8?B?bk0zTVhRMnVEdkZWWlE2Q2FnY3BSdWNlaWsydEtWNG5JMlRzS0lvdTlmYTRQ?=
 =?utf-8?B?bHNZMnUwQkpWVFRBdUtQcE10MC9tRkU5OURHZjhDNUw4M2FsRVNhQzZRY1RW?=
 =?utf-8?B?bWdIcDh1VEdsN0JWSXIrTHlVYjBudUh5WGQ4YWxrSTJWY2pydWNCNmFVSkVs?=
 =?utf-8?B?ZWp3b0t6Uk1ybXArOWdheXhvNGgxa3UzQVRLV3ZEY05SMWx4OTI3SmhGYitk?=
 =?utf-8?B?UGRWTWZhNXBmRzZmS2tLUVFhUVR5ZG9uQ2NPbnkxSjlhZmlIN1hRU2d1Z1ZW?=
 =?utf-8?B?VE5LY2gwMkpqTmZsUWRaeHFrUHE0dnN4a2g4cnErb25kdUNmNWxXQU1LYVph?=
 =?utf-8?B?ckpsemxNZEl0YkJhd3dyYmhYU1hHblY3RzBUeElvY080NFE1cWx6YkRvZWx3?=
 =?utf-8?B?WlZSSXlDZkJkeHYwWFRDbG1ES3pqUjYvRFFIUW11Z2d6SzRkd3ZRRWlabEhB?=
 =?utf-8?B?dmc0VFhtOTNkUTE2cm1Lbjg3aHh6K244Mkk4RmxWWWtsZ0FHUzZUV0RmbXFV?=
 =?utf-8?B?QThWY1cwTlltUlI3SWJmVFZKMjVBQnY4RmtIME9GQWJ3ZE02cFhzTEQzbFRR?=
 =?utf-8?B?eXVaNGpJc1BERm1wVm1EbnpTRnJlL3hDdWxyQXBlK1ZXSzJ1TVpJVzhwcWNK?=
 =?utf-8?B?QVNWS3hQb0hKcmxzTmtzaTBONVpPa3FWK05hOFlRdVhIditRUEVoQUJqS2VC?=
 =?utf-8?B?VDJOeUdlUHoxSlpqZjVxZE9tTmt3cXY2NndvQVB0eGp4RlJoanlaTUhTQTNr?=
 =?utf-8?B?V0V1UEJEQjIxcXUyMGJEQVlRSDI3M1lHRWdzUUdWeVJITk8vbUJWN2NDb1J1?=
 =?utf-8?B?UW5ZMnNnZVlpbHliMVNMSitGaHdPcHp4MC9JWDd0bzcyNGEyQ1hPY2JzeHRh?=
 =?utf-8?B?aDRZVHRnNkxtNjZmK1BaZFZGRXhYbjdSYzFLZHJYTmxXcnY4R1YxUWozRnQ2?=
 =?utf-8?B?NmxhVTN5Y0VmUGxwdWZwNXFyS2hxdkxOWG53ZTNGWGtTVFRiWE9JdzZ3bmVP?=
 =?utf-8?B?WWZ5KytWdjRDOVp4aFQwelRpYlptNXZoZ24vQ0NacWxibW54T0VZRWg1S0Z5?=
 =?utf-8?B?bHJRcy9GWmVNY29Qc05xWC8xUkxMTnE2WnZ1S3NoV21UVWNnWDNlRTRxcUZm?=
 =?utf-8?B?M3VKaE9zSU02NGdmblZoS0dSVFV4cFJNQVE5eFU1ZWFZZFluOTJ0aVAwc2Rz?=
 =?utf-8?B?V1VzaVQrOXZJTVEzOTV6K2FoRitvZ0NYd3BkU2VGS2QwZERSQ2NJOGpvQU4x?=
 =?utf-8?B?Y3d5L2VKRlZBZVg0OWYzTDZUY0YwOXFyR2huelZYbzFtM2lyNm9UaGxGMUxx?=
 =?utf-8?B?UCszcndoL243WkRYeXhtOG5Sb2RUN1RYMUdFOFk5YzBHMGlZTkJXVUFtOUVC?=
 =?utf-8?B?OUNnQVNScVpqU2kvUTlLYm9NcXA4U1ovOW51Y2VyRmcxT081TFFZYXVocy9I?=
 =?utf-8?Q?z9BvNHDcUObq5J4Gix5p9THYE?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50708932-a9ee-43cd-aeba-08db812c7a9e
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2023 10:00:24.0271 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1M+lcwzHaiTgRP3rY7KrlwAvwU2zQZYM1X5/3OtFwJJIsQ17TrI83qhdF9LdmNb0dN3MiDqEkIIGrxQYHuR+pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6096
Cc: Yangtao Li <frank.li@vivo.com>, linux-pm@vger.kernel.org,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [Linux-stm32] [PATCH v4 17/21] thermal/drivers/stm: convert to use
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
