Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B8ACF790B
	for <lists+linux-stm32@lfdr.de>; Tue, 06 Jan 2026 10:40:06 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DB5B7C8F277;
	Tue,  6 Jan 2026 09:40:05 +0000 (UTC)
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011046.outbound.protection.outlook.com [52.101.62.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 19EB0C60463
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Jan 2026 09:40:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XI8/0e//fttAIb7OVwZpYDN1/emb17aNbHUxYQY7UKRwGQayLixOZ2ssszRzIsuHe3FH3A6IKwFnv1vW9BwZ/eJX9EL7cM5jyIDP/GhLim9teo2c15oC2PJz1XQLEtsU8fB3iTpyJPyqd83h30vepm785iZWlnjlQYDeYSRz+XnM8SZ2a2kl9THe3lmE1W1XV3wb/CVuzCX1saqe9ioyu5IqJ7ttRrrEk/Hz6kpbbYwlnfIaJqPSABPdoT+zyR+v6agO5ylK15TX431dcAb45pntbiencQMZBx/6AasYSCbGW/l9BBlct7cT7R6VcBqV7/N9gUFFFq9edPiGrP5D+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y3X0bQgJ+7urF66T5wmVRlKo19vZNPzZgEdPyCqVva4=;
 b=HGeDtuKeI//CMLTX/KoXTjCpmV9IsnuV3cNyvmonmr5eTWNDN36gorU6objhQSkcKKZXDARkZujw2hLauvKv9hsVvGzGvhjRpLlXbH5LWBJQEoHn5YM9Dmp4v+RJ34irjWzzFYuNBYt/I8M9fdtV8bqdXP1K/t2es7Yuj1IUnGJ+XFy1TSJo6UKxWxKKY5e5g2DiFlKIQa/KIh5qoFjSfKwTxOJx8pY4nDWDPvVmqGVOGDd9R/wd5l4Igt0mRPYXOUtFdAFIxKsMrnKU+pUWagpnT0l+tybwXaWk9PmsuvV+H839kfPmRhm11S8tCQDLfE9xqhVk9aZ8r/XrS6g4ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y3X0bQgJ+7urF66T5wmVRlKo19vZNPzZgEdPyCqVva4=;
 b=tJIHJL6dEkxPkSemsBWsfjGL7Cz/HyTQEI1ESy6neDd1BWzZmklUXLCwgFeWoUlEIGsobUJF0dM3sxSZrVeKoj2QeyVs4t+ob++dQsPGcqKpTC8uJ1MpGeLtIBU/BejB3EAVSzZWDqbLAomte1sq868gjXnmXrjRmNN3oLcXA8vSjGc4o1Z/J6pqb8wtnljrRIax72oBZcAJReuMMWjjriUNdwLMNWGg2zlXslK20lAmHy8gYQHTs9Cvl/e6vvUB3O33YTrrjFpw3Q/82KhE5O4NgNJEUvFZZSv1eY3blQiMmvHKeMsJn6DU97LHlM9URERBvKxTu0KgUn5TsRd4yw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by DS0PR12MB7926.namprd12.prod.outlook.com (2603:10b6:8:14a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 09:39:59 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%7]) with mapi id 15.20.9478.004; Tue, 6 Jan 2026
 09:39:59 +0000
Message-ID: <d14a9c41-9df7-438f-bb58-097644d5d93f@nvidia.com>
Date: Tue, 6 Jan 2026 09:39:48 +0000
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Jens Wiklander <jens.wiklander@linaro.org>, Jonathan Corbet
 <corbet@lwn.net>, Sumit Garg <sumit.garg@kernel.org>,
 Olivia Mackall <olivia@selenic.com>, Herbert Xu
 <herbert@gondor.apana.org.au>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?=
 <clement.leger@bootlin.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ard Biesheuvel <ardb@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Sumit Garg <sumit.garg@oss.qualcomm.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Jan Kiszka <jan.kiszka@siemens.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Michael Chan <michael.chan@broadcom.com>,
 Pavan Chebbi <pavan.chebbi@broadcom.com>,
 James Bottomley <James.Bottomley@HansenPartnership.com>,
 Jarkko Sakkinen <jarkko@kernel.org>, Mimi Zohar <zohar@linux.ibm.com>,
 David Howells <dhowells@redhat.com>, Paul Moore <paul@paul-moore.com>,
 James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>,
 Peter Huewe <peterhuewe@gmx.de>
References: <cover.1765791463.git.u.kleine-koenig@baylibre.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <cover.1765791463.git.u.kleine-koenig@baylibre.com>
X-ClientProxiedBy: LO6P123CA0036.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2fe::10) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|DS0PR12MB7926:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e06cf2f-d2f5-4f35-d98b-08de4d078ec4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QWZjYUpXd2VBT3g3ajlmWVA3OVFPbUFzUSttTkhxTEx1ZGJqVWRaZ3Z2b1dZ?=
 =?utf-8?B?dEhMTEtjSWE3UHBLV3lRVVl5QUJmbWN2ZmdidklpTmU3ZlJJMDk2WHZwbHQv?=
 =?utf-8?B?eGRNK0w5cDNrejdiNkVmclMrTmlPTzRIRFhaMkRhRVR2a2RTYUJ6V2xQTUR5?=
 =?utf-8?B?REd3ZWtaSytqemdPQi9OaVU5N1k5c3h6bXpNcGVySXhtZkR5TkI1RzRHWEU0?=
 =?utf-8?B?OUZab0k3Z1VBd3kvaTZ6bzFsVEpidVo3UXBoR2pjTUFjZEdjTFlwVC9pMG9U?=
 =?utf-8?B?MUdmdmMxaVhVMjV5cGZXWTk5WlhQSW12S2Zsbms2QTRLZ3picTBHNnh0RjR2?=
 =?utf-8?B?ZytZVmhzaDVabDNFRU5WT09RTE1MN0NzMEEzQ3V6UHNNWVFNbzZjYXZ2a2Vj?=
 =?utf-8?B?N1hxZE9aUnFWR1lKSHNZeEdXZXdyamdKUERzSzJEYncxMTlSektCdFV6VW85?=
 =?utf-8?B?NG5WS0ZCclBnanhHM2ptdXJIRUxRUmxkc3R3L29sZ05RUWdDME1GbWRwKzlU?=
 =?utf-8?B?aEQyclA2QVVLcURCaUxaZUp0QWZFazhoVXkycmJEZmtscHZ1NVl3MjI3RDZq?=
 =?utf-8?B?TnR2YzZpMzV2bWNTektEY2ZEUmd5RkxRZTVhVzUxVmFINi8zV2w1TnhoQWU1?=
 =?utf-8?B?U3VpL3U3d3drMkNJdmxZVk0vSmJia3lkZHpyTGFmemlXdmZDREZ6ejlKaVpu?=
 =?utf-8?B?dDVsOWdtNkUwUUEzd285TjdIVVJENVpSRHhQRnYyQ0FLOUNwZmp1eE1Mangw?=
 =?utf-8?B?d2tGbHIzeWthdEQwNHp1cXNsTEhoZ3dqMExOa2dQdUJmNmd1NUhuUUVSRDlH?=
 =?utf-8?B?aGIxQ1FyQW5MazJ1VzVtOEN4dVVmWndlL0NUYXc2VUMxL0FoeXVMb3N2U0lS?=
 =?utf-8?B?dUJWL0cyNXlHQ0VZT09ucFI5cVFLZXg0TXpMWVgxaHRBclJobW1uY2xWUnk1?=
 =?utf-8?B?ZVY2dmhZdUwxZDB1ODBKNVRQUDN1NmdYY0NkZUk2QnZLSU5FcUV5SzlZUmdm?=
 =?utf-8?B?TU5oVEdRSVNCWEdZSjRnb2xMemsrUkJLYnZWRWdLdVVQKytxVkEwMDhrcjZo?=
 =?utf-8?B?eFJvc2ltWXVuN3FVVjBrQWx0UkVGNTNZNnJQbW5CamsxUExyMUJMaWY1NkZ1?=
 =?utf-8?B?a2dFNVNVSTdxMlN5S3UrcXVsQmhTRUhybW5XWXBTVkgvek5YQm9YcHhrQ1Q5?=
 =?utf-8?B?THV2WVhWRnQ3bUI0bG1GdDVsMDZRdk9ta3pZajQ1ZnJMdGdLQmRiQStpV2Vm?=
 =?utf-8?B?WndWSlljYWRIYmJla1VELzVwZ0JrQUdMcG0xMUhobFArLzljYlh4aDI4SjBk?=
 =?utf-8?B?OEQ3ZEVYYU5abHIrWTVzd1Y4MGRha2dtZVgzS1JDVzc3M1FwM3JlTXc2Ri9M?=
 =?utf-8?B?L1RGbXNtVVNtUFgweG0xV3Bpa0VZeUpZdlo5VVpNOHhGaGh5dlRCMHBhengy?=
 =?utf-8?B?QjcwNkVvUHNtbHQ2eTR3Um5FWThPamFZdGR3SnplZnlRS1h0anNublBxUEFZ?=
 =?utf-8?B?R210UkFSei9sOHVFbTJybWJkVno1b2JZanZnTXFpN1VqS2xZZVVCWTNEZTNY?=
 =?utf-8?B?bWc0NFltZkVuRGtoY2UzQjJaNThSK2x4NE9KVGprZ2JSam5pRjNMK1IraGhY?=
 =?utf-8?B?dVgrVUcwa2x4cnNpcEF4RHl1QzNTVTlFMURPbGhHRDh4ajRGUmtuZnJSTUcr?=
 =?utf-8?B?OFZJRkFNYkZuVmxlNzF6cXE0bzRlMnYrL3RmbUY0SE9mUVc3UkZZSUc1WExj?=
 =?utf-8?B?TkV1R3BJYjBOQy9VczZuRlpGRStDbU5xaHY2ck51THp6Qkd0V0VJZXFyYWc4?=
 =?utf-8?B?dFVwcGRHQjVURVE0QXFFdjJrMXVTZkhvNlVwQnFmYzNXZ0RXZEJxb01kZWhS?=
 =?utf-8?B?UWYxQjZoTzlZNUhkZXU3ckdtUjNuMHRkRTFBdVpGSDJ4bEFNUC9uUkN2VC80?=
 =?utf-8?B?cGlvbmdZVmFFOWtRMHNpc3pBRW4wQWk3blQvSkNwQkhDcXBjRllZTnh2Nm1R?=
 =?utf-8?B?SkF0VDg0S2NSMFluTFA0NlA3Qmh2TEpkWk0rY1hoQnBIKzdPK1Fka0wzRXpC?=
 =?utf-8?Q?fHgAug?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR12MB8784.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OEFZbEJaMzZ4UjJHbWxrdGd3WVBnSVI5SmJDWk9KdVh6VFgyVXcrQU5iUkZK?=
 =?utf-8?B?V29xeTFyTUVBRGtWaUwrTUVZUFUrbFQ1VXFrUDRqZ0F4bmljSXgzVzl1TWhv?=
 =?utf-8?B?SzBRMDloWDhCZE9zMS9sV1lwVDc3R1dYMHdNZGkvRFJCYjZLbVNobkNwcGJ0?=
 =?utf-8?B?NEI1ZmJUUlBZeVprTVpKR0p2QWphRU1rbHFLTjdnZHh1Y0RkZzFOSFJBNlp5?=
 =?utf-8?B?ZnV0Qk5MVjZ5aEFQbno5NlhVNjJnU0RyTVJCYXhFU3hEc1BkVXpkd3FSbktP?=
 =?utf-8?B?OVpDblZrTS9pelR2ZVhiMXhKcmViVGZGNFdjL0VFelV5YmxXRGpUSEUxNWtS?=
 =?utf-8?B?ZXgwVUtVc0NWbXI4S0FHUVBRRng1bWJRb1ZPcDJqZUcrbTl4d2loZlpXZlEv?=
 =?utf-8?B?dUt6VDMwMXFPMWU2MGFUeHgydTY0Vk00dW5yK1QrekdaV09tbnFNWDZiMmNH?=
 =?utf-8?B?cDFmVGVzS0RJSm9odVdXTzVRUGdDeHJCTk93cFhYSzg3M1NEclVUdTUydE9D?=
 =?utf-8?B?MkFzQlJKa1ZZTTZHVHhMWnp6L0gwSGl6c2Z6bWRQaVhWRytXcXJoYVp3U0hO?=
 =?utf-8?B?OHRUcHdJTUJsVStSSjBxWEVlNENOVXo3Rng0RlpJajNvMUIvVWVMVFlaRWZ6?=
 =?utf-8?B?cE9BbGlQZTR4Q0NTbEthNDJSb0dGYkV2ZlY1THpyK21WMzRVNlVvdldqU2Ns?=
 =?utf-8?B?YVBYU2pSeWZUOTRtcTZPVzFiM2lzRmQwM0xZdE5uTUNkb2N1S1lkVGluS2w0?=
 =?utf-8?B?b25jYkFHRkhFTitCcGxoWUtwejkzQVNOS1FVMW9FZ091NWJMUHFNTHR2ZUJQ?=
 =?utf-8?B?KzR1b2VWZUVUZVZQVmNKekVNTGJDTGRlWWpuL2hRK1U1NzROdG1nQlJYYlNY?=
 =?utf-8?B?c3YxTGNaODQxNFNlck9yYjlXanJYWVNrcmFkb1d0aXZRYVBWYUJlMzZIZE5E?=
 =?utf-8?B?N2FteVMrc2FLV3VxRXB5Zjc4VHhDUmEzanFSeE1JVzVxSXA5ZWgwL2UrSHF0?=
 =?utf-8?B?bndoSUNnTitVSlhScm44aUtWMTlnS2o1WVNOQ3pya0lLb1BWS25ST0RISlhM?=
 =?utf-8?B?N2luK2l4L013SklidjBaaWdaSktxOTVLem9zQ0hMTDJrNWJjU0h1akFMNHU4?=
 =?utf-8?B?Mk5tS1c4TDdTTURPWjk2RlRvUlVrdXBNWk10NHFSalEveVVlNGtCeGhlYlBx?=
 =?utf-8?B?aFFTcERsd1czSURmZHBDZWZaWHY2WmU0bUFPY3RZdWRtV1AzYkRIdVlZcjdR?=
 =?utf-8?B?emk2OHFWWHdZUlJoNkpDYWswb1pRNldndm1MbGhNb0NOWWFkenhaWTJHRG1R?=
 =?utf-8?B?QUpZYkxDblkwMFNrc3RuVnRGT0JhZ2c0ZFpQYWw3T3pVUU5DME9lczB4NkVG?=
 =?utf-8?B?YmtPWDJtcG5RN0NsN0ZRNUxhcXY2eVZyOFBWdE1pRnFPT1VqMXc3cmY4L0Vr?=
 =?utf-8?B?VTVRVDY4SUZMOVRDM1VkQzZ4RUljQWtOak5TaVJNWERsNTBFR3hJOTdCNzYv?=
 =?utf-8?B?c2cwVmQ2L25LQWQ5em5GOSs0QVBJRlhUd3MzUndGT3F3WDliMlI3TkVzTy9R?=
 =?utf-8?B?a2s5d0FPbFVlTnF0V0gxcFdBclhoZnYrRzNOMTNMWlJwdnVoSERXY3JIZHBu?=
 =?utf-8?B?RkQreVM3ZWFKSHN2amFCWVBUL3dlQVFuU1c0ZG1FWEtrZ0pIbjJRNEF6djk4?=
 =?utf-8?B?Q21nQVB6RlBvYm5PWkFoVFlFNzROT2U4N2t4UENtS0t5OE5sMUJCSHZXY0tH?=
 =?utf-8?B?WlVJYkdyV3dGK3NEamVtSlpTZ09La2Z5eloyUG12M0Y3bXNtNVdjWmpBdlNL?=
 =?utf-8?B?ODZ5aEhVR2NTbkU0QXBIQmxJMW03VU4xZUFMY3VPc3F2SXFyNkU5K0d2RVZN?=
 =?utf-8?B?dmZoWWtqemZJSG9RMTIvOXg5c1pOUE54QlZpbkRVL0lKUW8rMm9RckczZEhX?=
 =?utf-8?B?dTc0K0o3Y2tZMVdNWkZGK25oazJnZUR4dy9GL3RRYldNeUNzSy9jU2RHeThD?=
 =?utf-8?B?M2k5R0duWkx6d1ZNLyt1Zjk1blVhbmR3SEJ5SXlCTjh5dFFjSytiZGdtQVFr?=
 =?utf-8?B?UHdVTXRta3ZMUnQrZ2xrUzZXOVJLR05WbkZtTXNRL1VSYTdsb2ovK1phNE50?=
 =?utf-8?B?R2V0WXBiY3pYbmFIMjUrTTRFL2xVOENjamU5V3ZPT1B4MkhCeUxjWi9QcXND?=
 =?utf-8?B?ZjMzWkFaN2JBQXRMcG5SY1V0b2xkTTcxUDJNak1scGtPdWdaTkRkOHJHbENR?=
 =?utf-8?B?OFpIKzgxNlpjSm1JUE9jOUc5bkRxZmMxMy9QbStHZ1hiNkxmN2dHZHhpRGVF?=
 =?utf-8?B?QU9TZzZWWEUyazM1T3BGWnFmbXlyTUhLSWRqOFc0MW1abXAvUGE5QT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e06cf2f-d2f5-4f35-d98b-08de4d078ec4
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 09:39:59.1352 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lCVsIq+4Z0kCrVfTzjjylao1oxMesioQXs7tCHD0JOb1Ldw8+7VrDMP2PahLb4zM5mLw9gHXW9aXTEG9HM+htg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7926
Cc: linux-rtc@vger.kernel.org, linux-efi@vger.kernel.org,
 Cristian Marussi <cristian.marussi@arm.com>, linux-doc@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>,
 linux-security-module@vger.kernel.org, op-tee@lists.trustedfirmware.org,
 keyrings@vger.kernel.org, linux-crypto@vger.kernel.org,
 arm-scmi@vger.kernel.org,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 linux-integrity@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 00/17] tee: Use bus callbacks instead
 of driver callbacks
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

SGkgVXdlLAoKT24gMTUvMTIvMjAyNSAxNDoxNiwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cj4g
SGVsbG8sCj4gCj4gdGhlIG9iamVjdGl2ZSBvZiB0aGlzIHNlcmllcyBpcyB0byBtYWtlIHRlZSBk
cml2ZXIgc3RvcCB1c2luZyBjYWxsYmFja3MKPiBpbiBzdHJ1Y3QgZGV2aWNlX2RyaXZlci4gVGhl
c2Ugd2VyZSBzdXBlcnNlZGVkIGJ5IGJ1cyBtZXRob2RzIGluIDIwMDYKPiAoY29tbWl0IDU5NGM4
MjgxZjkwNSAoIltQQVRDSF0gQWRkIGJ1c190eXBlIHByb2JlLCByZW1vdmUsIHNodXRkb3duCj4g
bWV0aG9kcy4iKSkgYnV0IG5vYm9keSBjYXJlZCB0byBjb252ZXJ0IGFsbCBzdWJzeXN0ZW1zIGFj
Y29yZGluZ2x5Lgo+IAo+IEhlcmUgdGhlIHRlZSBkcml2ZXJzIGFyZSBjb252ZXJ0ZWQuIFRoZSBm
aXJzdCBjb21taXQgaXMgc29tZXdoYXQKPiB1bnJlbGF0ZWQsIGJ1dCBzaW1wbGlmaWVzIHRoZSBj
b252ZXJzaW9uIChhbmQgdGhlIGRyaXZlcnMpLiBJdAo+IGludHJvZHVjZXMgZHJpdmVyIHJlZ2lz
dHJhdGlvbiBoZWxwZXJzIHRoYXQgY2FyZSBhYm91dCBzZXR0aW5nIHRoZSBidXMKPiBhbmQgb3du
ZXIuIChUaGUgbGF0dGVyIGlzIG1pc3NpbmcgaW4gYWxsIGRyaXZlcnMsIHNvIGJ5IHVzaW5nIHRo
ZXNlCj4gaGVscGVycyB0aGUgZHJpdmVycyBiZWNvbWUgbW9yZSBjb3JyZWN0LikKPiAKPiB2MSBv
ZiB0aGlzIHNlcmllcyBpcyBhdmFpbGFibGUgYXQKPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9h
bGwvY292ZXIuMTc2NTQ3MjEyNS5naXQudS5rbGVpbmUta29lbmlnQGJheWxpYnJlLmNvbQo+IAo+
IENoYW5nZXMgc2luY2UgdjE6Cj4gCj4gICAtIHJlYmFzZSB0byB2Ni4xOS1yYzEgKG5vIGNvbmZs
aWN0cykKPiAgIC0gYWRkIHRhZ3MgcmVjZWl2ZWQgc28gZmFyCj4gICAtIGZpeCB3aGl0ZXNwYWNl
IGlzc3VlcyBwb2ludGVkIG91dCBieSBTdW1pdCBHYXJnCj4gICAtIGZpeCBzaHV0ZG93biBjYWxs
YmFjayB0byBzaHV0ZG93biBhbmQgbm90IHJlbW92ZQo+IAo+IEFzIGFscmVhZHkgbm90ZWQgaW4g
djEncyBjb3ZlciBsZXR0ZXIsIHRoaXMgc2VyaWVzIHNob3VsZCBnbyBpbiBkdXJpbmcgYQo+IHNp
bmdsZSBtZXJnZSB3aW5kb3cgYXMgdGhlcmUgYXJlIHJ1bnRpbWUgd2FybmluZ3Mgd2hlbiB0aGUg
c2VyaWVzIGlzCj4gb25seSBhcHBsaWVkIHBhcnRpYWxseS4gU3VtaXQgR2FyZyBzdWdnZXN0ZWQg
dG8gYXBwbHkgdGhlIHdob2xlIHNlcmllcwo+IHZpYSBKZW5zIFdpa2xhbmRlcidzIHRyZWUuCj4g
SWYgdGhpcyBpcyBkb25lIHRoZSBkZXBlbmRlbmNpZXMgaW4gdGhpcyBzZXJpZXMgYXJlIGhvbm9y
ZWQsIGluIGNhc2UgdGhlCj4gcGxhbiBjaGFuZ2VzOiBQYXRjaGVzICM0IC0gIzE3IGRlcGVuZCBv
biB0aGUgZmlyc3QgdHdvLgo+IAo+IE5vdGUgdGhpcyBzZXJpZXMgaXMgb25seSBidWlsZCB0ZXN0
ZWQuCj4gCj4gVXdlIEtsZWluZS1Lw7ZuaWcgKDE3KToKPiAgICB0ZWU6IEFkZCBzb21lIGhlbHBl
cnMgdG8gcmVkdWNlIGJvaWxlcnBsYXRlIGZvciB0ZWUgY2xpZW50IGRyaXZlcnMKPiAgICB0ZWU6
IEFkZCBwcm9iZSwgcmVtb3ZlIGFuZCBzaHV0ZG93biBidXMgY2FsbGJhY2tzIHRvIHRlZV9jbGll
bnRfZHJpdmVyCj4gICAgdGVlOiBBZGFwdCBkb2N1bWVudGF0aW9uIHRvIGNvdmVyIHJlY2VudCBh
ZGRpdGlvbnMKPiAgICBod3JuZzogb3B0ZWUgLSBNYWtlIHVzZSBvZiBtb2R1bGVfdGVlX2NsaWVu
dF9kcml2ZXIoKQo+ICAgIGh3cm5nOiBvcHRlZSAtIE1ha2UgdXNlIG9mIHRlZSBidXMgbWV0aG9k
cwo+ICAgIHJ0Yzogb3B0ZWU6IE1pZ3JhdGUgdG8gdXNlIHRlZSBzcGVjaWZpYyBkcml2ZXIgcmVn
aXN0cmF0aW9uIGZ1bmN0aW9uCj4gICAgcnRjOiBvcHRlZTogTWFrZSB1c2Ugb2YgdGVlIGJ1cyBt
ZXRob2RzCj4gICAgZWZpOiBzdG1tOiBNYWtlIHVzZSBvZiBtb2R1bGVfdGVlX2NsaWVudF9kcml2
ZXIoKQo+ICAgIGVmaTogc3RtbTogTWFrZSB1c2Ugb2YgdGVlIGJ1cyBtZXRob2RzCj4gICAgZmly
bXdhcmU6IGFybV9zY21pOiBvcHRlZTogTWFrZSB1c2Ugb2YgbW9kdWxlX3RlZV9jbGllbnRfZHJp
dmVyKCkKPiAgICBmaXJtd2FyZTogYXJtX3NjbWk6IE1ha2UgdXNlIG9mIHRlZSBidXMgbWV0aG9k
cwo+ICAgIGZpcm13YXJlOiB0ZWVfYm54dDogTWFrZSB1c2Ugb2YgbW9kdWxlX3RlZV9jbGllbnRf
ZHJpdmVyKCkKPiAgICBmaXJtd2FyZTogdGVlX2JueHQ6IE1ha2UgdXNlIG9mIHRlZSBidXMgbWV0
aG9kcwo+ICAgIEtFWVM6IHRydXN0ZWQ6IE1pZ3JhdGUgdG8gdXNlIHRlZSBzcGVjaWZpYyBkcml2
ZXIgcmVnaXN0cmF0aW9uCj4gICAgICBmdW5jdGlvbgo+ICAgIEtFWVM6IHRydXN0ZWQ6IE1ha2Ug
dXNlIG9mIHRlZSBidXMgbWV0aG9kcwo+ICAgIHRwbS90cG1fZnRwbV90ZWU6IE1ha2UgdXNlIG9m
IHRlZSBzcGVjaWZpYyBkcml2ZXIgcmVnaXN0cmF0aW9uCj4gICAgdHBtL3RwbV9mdHBtX3RlZTog
TWFrZSB1c2Ugb2YgdGVlIGJ1cyBtZXRob2RzCgoKT24gdGhlIG5leHQtMjAyNjAxMDUgSSBhbSBz
ZWVpbmcgdGhlIGZvbGxvd2luZyB3YXJuaW5ncyAuLi4KCiAgV0FSTklORyBLRVJOIERyaXZlciAn
b3B0ZWUtcm5nJyBuZWVkcyB1cGRhdGluZyAtIHBsZWFzZSB1c2UgYnVzX3R5cGUgbWV0aG9kcwog
IFdBUk5JTkcgS0VSTiBEcml2ZXIgJ3NjbWktb3B0ZWUnIG5lZWRzIHVwZGF0aW5nIC0gcGxlYXNl
IHVzZSBidXNfdHlwZSBtZXRob2RzCiAgV0FSTklORyBLRVJOIERyaXZlciAndGVlX2JueHRfZncn
IG5lZWRzIHVwZGF0aW5nIC0gcGxlYXNlIHVzZSBidXNfdHlwZSBtZXRob2RzCgpJIGJpc2VjdGVk
IHRoZSBmaXJzdCB3YXJuaW5nIGFuZCB0aGlzIHBvaW50IHRvIHRoZSBmb2xsb3dpbmcKY29tbWl0
IC4uLgoKIyBmaXJzdCBiYWQgY29tbWl0OiBbYTcwN2VkYTMzMGI5MzJiY2Y2OThiZTk0NjBlNTRl
MmYzODllMjRiN10gdGVlOiBBZGQgc29tZSBoZWxwZXJzIHRvIHJlZHVjZSBib2lsZXJwbGF0ZSBm
b3IgdGVlIGNsaWVudCBkcml2ZXJzCgpJIGhhdmUgbm90IGJpc2VjdGVkIHRoZSBvdGhlcnMsIGJ1
dCBndWVzcyB0aGV5IGFyZSByZWxhdGVkCnRvIHRoaXMgc2VyaWVzLiBEbyB5b3Ugb2JzZXJ2ZSB0
aGUgc2FtZT8KClRoYW5rcwpKb24KCi0tIApudnB1YmxpYwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4
LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
