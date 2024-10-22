Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1F09AE50C
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Oct 2024 14:39:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3930DC78F71;
	Thu, 24 Oct 2024 12:39:13 +0000 (UTC)
Received: from IND01-BMX-obe.outbound.protection.outlook.com
 (mail-bmxind01olkn2103.outbound.protection.outlook.com [40.92.103.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2B7CCC78012
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Oct 2024 00:47:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lwNK0QG+9WD7tR59SDlKNlSvRrPI9lTr3QvkVuQ4ZFjbZIdV05f+Z3BnXaURjvnclw+3+ErFl1zWBBjDjUSRY/+nGtKUo410O7BA+GobipJYE2t//gLjQObUy34XK8tUt162GixT5LuoHhKHQy42wOe59uzj3iGbjOfowSR7m/uGjyJDDTJhQPCNucgEs0D47qwVCTmrO4XulCYp41CzB7SaO7ZMPQykxBAKJVggKKwQCnr7SXzRttHfIQs/vNjrDZJO+q+yv/6SQhUOV0oiwh6oUeaXOUH7A1eDLfeRfHU89Dkah0THztdfMQ1kfW/p1gZ2NOZiM61ZZOZvyEmaoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ktMpXPEN3cn0BlwAum8KPYSIBbwWZW99xOS9KEwXHtI=;
 b=IFSfTj3GULCYVCDQRRTB2JCjRet1c+4uAnH27908CfLRw+4Z2eCI5l+lH/ZEd8c6ZAlO/2sfEmC/prCda/PyThWeF8JKenC/BYwVLO9liF00RjM0eVIvw0VBSePFl7anRAAkAPmAS1MpPqBhibO/Q//KPo3O0Dh7nGp07OWg/elRA2k0jembz5GrdwS/o8yB1KrKdu2PdyW8NG4B7rlLwOQcXmEnnB84AsDVrRa8Ms+auNANaaCw0+OvQKDBqUcsbMOMMzQeILLxzzkWyDPtYfb1mEJCZi5Gw2oNxZ0mN7RQC4JvDfcAo8f+JyHAoFDsnlpO4UvuJ2zuA/iKWYe5mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
 by PN2PPF99355ADDE.INDP287.PROD.OUTLOOK.COM (2603:1096:c04:1::137) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.29; Tue, 22 Oct
 2024 00:47:33 +0000
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c]) by MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c%3]) with mapi id 15.20.8069.027; Tue, 22 Oct 2024
 00:47:33 +0000
Message-ID: <MA0P287MB2822C943624A02C54E9A62C9FE4C2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Date: Tue, 22 Oct 2024 08:47:28 +0800
User-Agent: Mozilla Thunderbird
To: Inochi Amaoto <inochiama@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Inochi Amaoto <inochiama@outlook.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>
References: <20241021103617.653386-1-inochiama@gmail.com>
 <20241021103617.653386-5-inochiama@gmail.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <20241021103617.653386-5-inochiama@gmail.com>
X-ClientProxiedBy: SI1PR02CA0046.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::14) To MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:138::5)
X-Microsoft-Original-Message-ID: <087c1882-3cdb-4518-bf5e-1654bca3def8@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2822:EE_|PN2PPF99355ADDE:EE_
X-MS-Office365-Filtering-Correlation-Id: 30ce1516-4972-47f0-de33-08dcf2331dad
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|19110799003|461199028|5072599009|6090799003|8060799006|7092599003|15080799006|3412199025|440099028;
X-Microsoft-Antispam-Message-Info: mcP6pv9DMARQwpZIQu3wK55uU1NCVHvTdANbLRu0vr6g3Q8gXA/TMLdYiT87tj5tne2VmIbTa6cxkMF9mbbGmfgyqO1KXGwJfGpa1p8lMpAUwycaW4CpGks9WXUWzqGjRk81cwfXRSd17l2UjV6lO9IKEg+uQKrKq4h0HiwCMUj94+ZnTGg0Xuo+eJAozdbHqV3883/2uWwlzOFPNMW7p40ZTf/g1j7jTDmbJeiG0T93cMCXJVDalYuAgZPWHdqV+mOKC7siB9qWfVZDzo4Pwxt8Uum3FgAogjxvZpub5uV7IZYglCs4lxKlKLAu8/eCI8IB5ER71gOf38Icti+pSqM2rmjnRDxucJuw5mTsFTIGrB5bcBzsIXVtMpEEubVpDVzbcvfxsJRm1gNaYnYdV1agqU8LQzJYV2NpvOvqMEHG0HR1OTsNR0MoLGXx+6wa05SaBCGSMcCXe8Kjone9MHbKRPHgWvr70IVj6J46ucFxMaA/UkoF6lyH0x+wQiAX8utFOtCpAurIKgRndJzpS3WLEk9T5oy4LK6b7BkrRMTwjyqhkcr5u9bSlesTsGO3TgHbzcRm0qqRhOTI1bHaWUW/VDxBkmf4LU7VxeYpgDC0xXNk30yrzjWB07sppXnAdMwOtaTRigytKKgqC3gdscJGJ9r7il/ZSJREqRvVVfzD0dtDP1a7HjiESt+NItTXs/PJ5Ed/OonqCWisb8GRNpfESDlR1pnFgV1cWRVRhdsgDQEkBy8Xe8KKKsW1hMjxwW3cRXCojZwIQFFXaONe9Q==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VDk2WjVnRXZSdVRpUnhGMlY1UE14TGxiQ1ZqS01WVFR4dks3MWdCS2RNY3Zj?=
 =?utf-8?B?dGZGMzlybmZBLy9iUjlXcVBWdTRtY0lkUjJQRmhlY04rU0xYMG9zMnFzZjlj?=
 =?utf-8?B?VGlOU0xrN3hDM2FNWXRHcEpaeVhBSG9zQ2pEWGJoK1QvQlpVNndGcmhkTUdZ?=
 =?utf-8?B?WGdQY3NuSjZRdXc5bkFENUhxSUZ3VG05VEx3T1ZVa1BlSGZZRUV2MDZUWURT?=
 =?utf-8?B?VjMzYnE3TC96eVZOWjBkZ1phcVNyUWVDMVk3M3E5SWgva3NwZ1ZVSGppbXU0?=
 =?utf-8?B?WnJ5MnpSSU9OVmpMQURUNlFvTnFtNnUyMkRaYitNSEt2UzhHc1FsYWNuOUpy?=
 =?utf-8?B?SUlFa2NsRkNjbVlrQ0QxNnlUZlAxTmY0MEdCbWplSVp2NTlqeUtSaThMK0c3?=
 =?utf-8?B?NEV5RjlQNlNKbWtRYXJhYVVUUVZNbDY4VjJVajNXdDBScDNaR3dhTWd4Vktq?=
 =?utf-8?B?T1pBR2FXZEtoeWNpYnVzRjBsclM2K3hZZ2RveHl6MXc2czhyUVMrcVAwQXRj?=
 =?utf-8?B?VHdDM2R0bWNjdzdMVDZaTEkxRlN6clBubnU5WEpCRE94czVaRWFsT2w5UjB0?=
 =?utf-8?B?RVVSYUZpb2lKOGZvQWF5dHBCelJQN25ORm1DMVpoTGZLUytQVkVtSmMxZk1Y?=
 =?utf-8?B?SHd0YzM1bEk4SVVsNWQ1OVJ1K2JhbnptbFAxazJWMkNIb0VYYVd1UklzUHVl?=
 =?utf-8?B?bGk2TFowZ1hYWHAzWncycHFReWtRcTVBWExaRGhtb2RBbFJGK0ZvdmdmV3FT?=
 =?utf-8?B?TTJvVCtGSnZiZG9vVERkcTlhZCs2b3d0WVBVQVBQNCtDOHROclM4SE00UnhR?=
 =?utf-8?B?VFhBUkVqeHhCbkxMb3d0R3NReGd0WmlLbXpSejVvRFh1aXhzeVA0aU84dzIz?=
 =?utf-8?B?ZkdzSkNmZFpZR0JXN3ZqUEttMnVjTnRHTzhhd2FlMU1qZjFYQWNJa3hoOGo0?=
 =?utf-8?B?eXR0N2lGUFpwV2xiUCsxZFNGNG1KbXVjdTlBUzZQQ0FUdTFOUlVzT0txRGpk?=
 =?utf-8?B?NWhxRklMTXVHS3diT2ZPTGN4RnNscU56aXZ4WU9zOVp3NWgzWVAzay9QbFRk?=
 =?utf-8?B?TDhVb1FzQnY4NkE5V2ZtdlBSVmp2QWFsN0xiTE1vWUZsUmtNMXNabXNNN2hN?=
 =?utf-8?B?aU1ZWTZhN1ZacUJCUkQyd2IvTytCTHZvTXFpMEZXQmxsNTVGbUVMMGFYR3hh?=
 =?utf-8?B?WDZUaEt1ejdNQnFBbXZzWVp4ekNlZzZUUENOaFVQczVYdFNRNGRIWHNUTUhE?=
 =?utf-8?B?KzhROVVkakU0R3JqQjQ5RERpMjAxWVlNdmhYYzZ0cTdNNTJFTzMyWk9XVmJr?=
 =?utf-8?B?WS9NTEdxYkduUCtTTXJiUTR6ZXhyeWFCZXc4LzlPMWZVbk91ak54RyswdXV5?=
 =?utf-8?B?eVljK3Jxbi9Jb0hjNlJVOUhuUjFxN3VoVkFVR3UyTmVQNk9EaFBraTBCK05o?=
 =?utf-8?B?d2lhRDE4RGlOeCtxcU1XSTRjQWJsSlk4MjRLOVp5Y1hmQW9PZ2VOZVR4K3h6?=
 =?utf-8?B?bExBSElVdFQveFhxa25FcldXd09WYldMMVBTTE1CN0M2aWJ5OSt1a1dWRk1Z?=
 =?utf-8?B?OTBMZUtvRjh5MVJhUmZ2Q3B2UFh6aHBzMzNSc1UxOGVScVIvNlZLRitUa01E?=
 =?utf-8?B?N3lYdzZtYXFLeGNoVHhXTVQrRERzTW04bUxqV0ZIRVdvdk9BL3d5V0YwcXlR?=
 =?utf-8?Q?97vk2OP717J+MuF7Al+K?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30ce1516-4972-47f0-de33-08dcf2331dad
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2024 00:47:33.6697 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2PPF99355ADDE
X-Mailman-Approved-At: Thu, 24 Oct 2024 12:39:11 +0000
Cc: devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 4/4] net: stmmac: Add glue layer for
	Sophgo SG2044 SoC
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


On 2024/10/21 18:36, Inochi Amaoto wrote:
[......]
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c
> new file mode 100644
> index 000000000000..83c67c061182
> --- /dev/null
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c
> @@ -0,0 +1,132 @@
[......]
> +module_platform_driver(sophgo_dwmac_driver);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("Sophgo DWMAC platform driver");

Missing MODULE_AUTHOR ......


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
