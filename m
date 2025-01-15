Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 44024A11696
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Jan 2025 02:28:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DCA24C78F64;
	Wed, 15 Jan 2025 01:28:39 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2069.outbound.protection.outlook.com [40.107.21.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1F31BC78032
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Jan 2025 01:28:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZzBIkt4GuD0HNUtIbr5rw1EaIlPnYqyF4hH7Hvs8ffhUE+ImHm1fqnpc6z2oRL4VUMpk2Ho9uDP4CsF0TWaMS3aXzRg94mPFTkBzwpyg1EajjeKCkbFu8KqSZznIK+5Y4hGUaQowVZBFBxRNxMUb72iLajJzrU3EBfGZ3NeEWoCmgHnS3+Haazw1JhEKjSbijx6Dkmb7my5wmtko4vGzmIGVZuc1Gm8qrAf4NMpzyf7Kc129OOUkBFCHVRJEsLgoObyfEdNjEbF7ONWB82oYAWNfzmrZVEwnjrpBlhUsXGkP5EoLi+SBqGzh4keX8sFWUZJIHLjBbTzCnmdpiL4hHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aw7lQLW01IrMduKkfFlFkcx8DOi6W6/Wp8U0arT92pg=;
 b=xZjQRc/bXGxP1GLeYL/qKDiWhNFlgiW9m9QrOCdX5UMde2bQWuTotiksluNwHBiYTvs38/BEVvWz5JypAfy3yl5XCq6lbmT+1/X1Kc3eQ0hvWfO+D7OvLmL+lVhf/jfaLMHv2IiMDtyhdVcKrIWlEiX99mFOuJD5I9sXdhxJgefAGD2Gg1YaFKAJHnedRbttDdT3EySvcEf/Aa97K6oBTibpX20h7qu5TWfGhIYkt8kim5LJ7wzfu5T1koGZ9y5LSt8tgCeuf8FWUmpK7SJzMz+wOaECiexHJs4RzBdrRWUy3XLYg1u9adM+3+C4ZDX5R9ckerjmftPR/wisNQwsVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aw7lQLW01IrMduKkfFlFkcx8DOi6W6/Wp8U0arT92pg=;
 b=QpY3UjTlyUgPv+DmBi7bc2eSwwdt5hjzX/ZGKhP0q8NVK+A+JNNKGDBOVH3qLoyBpbYtHZZf77I6CwJOSbk04BXrXlq8wbJcP7yf7oq3SIo+eTLUfDom7ygvykMKl1kkaSoQI+0KkF/zf0rKeIQYtCJabuycDPQV/kZc9pQaexbdT8SbEez2z8fAd16f4TeUprqu80Kfde6V//+GTLInCJ0/+UecOPZ8VvsUV0NXDud88OGcjkiyRFKhj+3oBhfExuvJDiybC5GWEG0M6RHXQ1XdSNUZsd6HZy4PPlzNXbDBrZ/gZ27yeRPIR1vPGM6tku+pNWl89nrLxWNf1RKAqw==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI1PR04MB7167.eurprd04.prod.outlook.com (2603:10a6:800:12a::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Wed, 15 Jan
 2025 01:28:28 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8335.017; Wed, 15 Jan 2025
 01:28:28 +0000
From: Peng Fan <peng.fan@nxp.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, "Peng Fan (OSS)"
 <peng.fan@oss.nxp.com>
Thread-Topic: [PATCH v2 01/12] PM: sleep: wakeirq: Introduce device-managed
 variant of dev_pm_set_wake_irq
Thread-Index: AQHbXbtbaOc6zdaBaE+3ADKqgrHCrLMWyAIAgABVbSA=
Date: Wed, 15 Jan 2025 01:28:28 +0000
Message-ID: <PAXPR04MB8459EE38DBDBCA29FB81B6B788192@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20250103-wake_irq-v2-0-e3aeff5e9966@nxp.com>
 <20250103-wake_irq-v2-1-e3aeff5e9966@nxp.com>
 <CAJZ5v0hj7wUU3f_j5QH3fNUFKokaXr0octaP2M1Ho_L_BspoUA@mail.gmail.com>
In-Reply-To: <CAJZ5v0hj7wUU3f_j5QH3fNUFKokaXr0octaP2M1Ho_L_BspoUA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|VI1PR04MB7167:EE_
x-ms-office365-filtering-correlation-id: 79e757cc-9dbc-4cbe-1ed6-08dd3503e9fe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?ZVB4cSt2ekJHME1Sdjd0ekJkelhwS3ZHNFk2WkN3a0ZKMHIxMGhmczRRcHRz?=
 =?utf-8?B?NkFvdTN4M1AxL01FMUphbFlMeEZpMzNnTkNNcnNnMG9JK0k4RVg5VmFPOUtE?=
 =?utf-8?B?NUZ6YnluNWR4NGFKTkhDNTlOcWl1REh3MDhLZGpjNmNaSkJSUENueG9VaWR5?=
 =?utf-8?B?VDVkK0RDeVhkVXVEb3dXSU4xcFllUTcrZ1JKNDdNQ09ReTkyNlFlenVDVzB5?=
 =?utf-8?B?bUh0c2VybzdDMlFqcmxtaVhBcUxLcks3TDg3NUx2U3hSWjZWZmc3QkhCeTZY?=
 =?utf-8?B?RkdoTDVSTDFWYjBNUm5tZ0xNSlZFMTlYcVVtUHZmQTVvRml0V2Vrc0ZKSjZ0?=
 =?utf-8?B?b09LTWM3TC9iS2xoaDBzUjVBa1NSUWpjVkg0ZkdXUUtkQ3djVkpLdGh6dGFm?=
 =?utf-8?B?SjJ2TDh0MmdHY2FXc1VHYnArZEs1RnBWem9RZGY4Y0FoSGxVaEdtWVRYNG5K?=
 =?utf-8?B?MkRxeGpRRXRETkpHcys3ODNTMk12U1Z0ZFdXWkdvTkNUdXhhVHpvbHlaSEFh?=
 =?utf-8?B?WEF2YzRKbW91dTNaRkNqUGY2UFJHWW8zNWFZWDFla1VoaFJqaUdBVWw5OG95?=
 =?utf-8?B?dXhjeUZXcEo1UnhNYzQrbU40UVJ2RTdyZnVjZWJDS1k2S2VRZEFjd2dEYUIr?=
 =?utf-8?B?N3lpSDhjQWVydTNlREVCSDRxNzUxa3hpTjJiWEpSTGtSai9EVGVoSW1ibVBW?=
 =?utf-8?B?a1pMMkl3eXFTalNrbGRBUURDOExHQXphUTVZR0xRUmZwRnJ2aXY5aDFZaXBu?=
 =?utf-8?B?ZGlZa0ZNa3ROVi8xTzB3QVY5eDNtcFRiQmhuYW9ONDEzTWJVZXJnS0p2OTds?=
 =?utf-8?B?VXlFZFBVTHFiMXBLUjhHbDRqV2xoMEhPUFBtRzNub3RkaEFQMExSeGxucjJQ?=
 =?utf-8?B?S3hJd3hZanN3dngvNCt0ZDlYcXNFcjZScS92a215bW8zaUIwS3lpalA2a0kx?=
 =?utf-8?B?b3VHZUp4UUxKYUtISUZZRWRsQ2NESDNJNWdSREl0emxCQjJWUmoxbFljSnRr?=
 =?utf-8?B?OERlanFZdnhLcXQ2TFY5ZGlBVnRSNkVyc0htdFh1aSs0TG01N3NZY2hqb0F0?=
 =?utf-8?B?amxXQVphWEowaWZDM3FGN1d2S2NaRGpTOWZ5Y3QwMzJ2OVJ5WTFOMTd1Q0Zm?=
 =?utf-8?B?aTZCQ0tyVlJsbmlSVlNhdDNxcnFsenVxSVZqTjVhQ29uZWpmVGlZOWlIdGM5?=
 =?utf-8?B?TUpOMmZFM0h2bE5ZdnZpS0wreDRVRldhelJtWE0xOUlqSWFOYXIrNkIwVEZJ?=
 =?utf-8?B?eEt6NVNObFprMzk5TFJLT2hDUUxub1p4bTdyeWxHWC9td2FROXpBdTZsN05G?=
 =?utf-8?B?aTJwbm9KZHYyWUVkVWlCMk1YQ2EzWHNVeE5MZi9nMUdrZXQ4VUVPaVNOMi9X?=
 =?utf-8?B?ZFBJOFNZUU56ejJNWnJPbU5aRWJ6SnBzOWRaWXNyMXlOSkJhUi9TdDBWN2dt?=
 =?utf-8?B?ekRBM2FPWnoyZkYyaGU1K3VxVytOUUh2MHRSbTBrUm5obGZ0ODF4SXU0Vzhh?=
 =?utf-8?B?Sk5HL2s4dkdHVGgvT01ja3FhdFgzaVN4WnRZaDduMUtjaGk4SGxRVkFkTVU5?=
 =?utf-8?B?eC9McEU0QzVTQ3NPQnBJT3FXdTZEUUx0Rm90UUQzM1lpWnQzbExWK1EzNURD?=
 =?utf-8?B?a1l6MFNaQnNUQ2VkSmZmQWIzcFI4enVJbW80NUMvQk9kSzdseC9tL01yZUpM?=
 =?utf-8?B?UDBqU1hqTUhpaEJRNlZIalZBOC9ISTBmd0UyMUpuZFhRZkwwMFA0bElPWXZk?=
 =?utf-8?B?K2pDVm9HT21Md3ltUlh4ZjByaXArWnkvSmxFc1ovcTduZG1aNGFHUW9hSTQz?=
 =?utf-8?B?NHA4RjdwZTVVN3ZPQ1E2MmhDa0xuaWlQSGRkQ1JHbG1sVU1ONkhaR2FSSFNt?=
 =?utf-8?B?eCs2Vm4wckVRNWRmQ0lCVUFlWXFzcmZ3WEhwdmJXRUJkdkVCeUhpcVYzcEdO?=
 =?utf-8?Q?hDBwvySYzS6RY1fcqBkzR2BYqXsZ5V36?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB8459.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?djB1UW1iK0x5MTV2L043RzNqWExEUXVJM1FjaWhtSDgrT09aejlXRHptQ09K?=
 =?utf-8?B?akE2c2tRRVVMWUlndnF1dFBIdkpKL3VRNHFYNVhDZ2hIci9pZk1WNEU3c0VR?=
 =?utf-8?B?eWV4aE1QVThFY1lFYXk4VnFQaCswc1lSVHJSVXVoRlJoOTZDZml3VWw0VVBB?=
 =?utf-8?B?SzMxTkVwL1l3cG0yS1dTNVhsK21mMlFjSkw5RGk4b2JVRUVyVER4dno2UWNu?=
 =?utf-8?B?eU0wbVpzSkVhTktVRmdRTUNNR0t6dHFteW12ZmFBNXZyK0c2N0xBZ0JSb1FG?=
 =?utf-8?B?d2NVR2xiNUdmMWlCSG5XVkxiN1VEVmlGbC9HS0dJMXBhdWdxeE5aRkxzV054?=
 =?utf-8?B?MzMzbkFjM0kwc2Fkb0lodzJHR3hUVnNoVVlDa0xVUzRrK21UY2ZDM0ZRWklX?=
 =?utf-8?B?S25GcXF0ZnlHdnRPakFvVVZBdWhmc3V0ZUFGNkZuS21WRldlZFNUVWgzcUw0?=
 =?utf-8?B?SXhnL3Evait2RUptV05iVlBHY0w0ektvWkJLSGJmbjMwUG80eEVWUkR2YmpZ?=
 =?utf-8?B?NVcxRXh5WXFVTDZ5bHVUSWd4bmxLeERVd3BVa1hka1NRb3pRQk5zcjVUL2Fo?=
 =?utf-8?B?RytFaGZIQW0zWk52RFlzOGNmcUJRdkJDZ2NnbTFnWWozS0t0MU1iVHVSeU4x?=
 =?utf-8?B?VUVMajlxVUwzYVIxOGdUcUEyd0tKcTczQ0dSRm9xM2V4c0JzUGhlL2JSaEdG?=
 =?utf-8?B?TFdYejJneDUrS01YTzBXVmJDOVVpcVVCSXZYdFM0eGVMYlIwNTN3Mnd2YWVS?=
 =?utf-8?B?SFQ0NU1zY3F4cTZ6QTl3enE4YkFEcklJMllGMHVvdkNmTE53VG4wTzg1MzVv?=
 =?utf-8?B?V2J6NTQxL2JRbnNNdzd4QXlCcFNSTlMzV3ZuSHBNY1ZWSXBGbVc5QlQxcTVy?=
 =?utf-8?B?ajBxU2o3bWRva280TXBWL3d4MmRzcWR5MjZPWXdDaG90eWtxdW1pWWsvN2Fx?=
 =?utf-8?B?NEJ2cDlxUHZybnFoekpGWHBGVTZxWkt3aW5yR3JtK0ErRFJPdGxycEd5ekhT?=
 =?utf-8?B?R3k0Q1J5WGhlcXRuMWVDNDZUaEM3bDNIYVRML2JCRlFDVVVJcXBrbXlkRkFo?=
 =?utf-8?B?TzB2TXRxRWI0TkdPSUVlUmliRVpvRW5FTE9WL3lTdCtZQUsvVlBwT2xUSnJM?=
 =?utf-8?B?ZWY3NnlDN1VSc3d2SzlNN1EvdDIxd1BXRXJmSlN5cFY0cXMvbUZkNTF4MlB2?=
 =?utf-8?B?Uzd5dVFVTFJqTGZhUllRelFrTFBKeUVCaHY3ZXllYnNBL3BJak03Qlk2ZGpk?=
 =?utf-8?B?cm5ZMEo4Sk40aU05UXR2akNxVVBvbDhUS1NGMjdRTnlET0Z6M2RiYzdYSnMv?=
 =?utf-8?B?RmZuK2FocGNoY2dxU0FXZDNsS3Zwa3JIUDV5Q1VhMzgyblF5cVhQTnJ4dmZx?=
 =?utf-8?B?dGx6bzI1dGUvUmwycWpaUGpQdnJ3SUtRTmY2UmhPRlZMRzdLRmhnSjdBWEty?=
 =?utf-8?B?WnZDT3hMd2VuTndSTkYySDdTTzBXWmkvZXY3cjdQWDRvc3ZVZmU1WEk5VzJC?=
 =?utf-8?B?TkJRdXBlbGhCNkdRRlkxSzNEWEJDWHhtdjB6YnRLMFUveDQ5ZlpaYXptcyt4?=
 =?utf-8?B?d3ltNUNnZTBTTWpLcGJzYTVyT1oxY05rWUFqQ1hmUGhQOWc5eGF5NHlhQU9Z?=
 =?utf-8?B?bVVXU2tvYVZSeVpBZHRNRjkwU3VrT1U5NjN6eVpPTE5pSCtSN0l6VFJtOU1y?=
 =?utf-8?B?dTV0NEl6clVOakFaME5SczgwUXMzaHozRkdUZUlWd2lMbmZIemNOZFdoWW4x?=
 =?utf-8?B?cHdlS3AyekF6bjBTdlhIdG04RjVwSWtkU29nOVF4Uzd3TjRPZDMxSGVBQ29H?=
 =?utf-8?B?S3F0Yng0b2c4aUxkZEx5TlR5aWhFRXB4Qm1vajNDbVk5MlkvdnhHTWM4aENn?=
 =?utf-8?B?ajdxd0FaRTZyNXRtSkdxTjl5Ty80K1lJdHlua2xQM3Zoc1VmNzJWSkhWU0Fi?=
 =?utf-8?B?d0xEeHdGSmx4VkdFdFRreTFQUkp1TnErVWo5Z0t5ODVoUlBuMHVrSFlxVVU2?=
 =?utf-8?B?Qkt4OUtEaVFiWVdUeFF2MG9Qa1lRb213cjNvdVJIVUhWNGhuaE4wTjQrVFZU?=
 =?utf-8?B?cDl3amdGUzJHckZKaE4wVkFoeFRwMS91V3V0ZGI4Wjcwb1ViemFWd0J0bU4x?=
 =?utf-8?Q?2sDM=3D?=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79e757cc-9dbc-4cbe-1ed6-08dd3503e9fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2025 01:28:28.2858 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y/Ip6zd4fbOyFBjcFowqaiVW4tmVrPWT5CEm8ZY5yuwjYHG42lntFb10TGE8dtPpeb0Uj5L9doudkzYVYfbEPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7167
Cc: "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
 Len Brown <len.brown@intel.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Pavel Machek <pavel@ucw.cz>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v2 01/12] PM: sleep: wakeirq: Introduce
 device-managed variant of dev_pm_set_wake_irq
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

PiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDAxLzEyXSBQTTogc2xlZXA6IHdha2VpcnE6IEludHJv
ZHVjZSBkZXZpY2UtDQo+IG1hbmFnZWQgdmFyaWFudCBvZiBkZXZfcG1fc2V0X3dha2VfaXJxDQo+
IA0KPiBPbiBGcmksIEphbiAzLCAyMDI1IGF0IDk6NDLigK9BTSBQZW5nIEZhbiAoT1NTKSA8cGVu
Zy5mYW5Ab3NzLm54cC5jb20+DQo+IHdyb3RlOg0KPiA+DQo+ID4gRnJvbTogUGVuZyBGYW4gPHBl
bmcuZmFuQG54cC5jb20+DQo+ID4NCj4gPiBBZGQgZGV2aWNlLW1hbmFnZWQgdmFyaWFudCBvZiBk
ZXZfcG1fc2V0X3dha2VfaXJxIHdoaWNoDQo+IGF1dG9tYXRpY2FsbHkNCj4gPiBjbGVhciB0aGUg
d2FrZSBpcnEgb24gZGV2aWNlIGRlc3RydWN0aW9uIHRvIHNpbXBsaWZ5IGVycm9yIGhhbmRsaW5n
DQo+ID4gYW5kIHJlc291cmNlIG1hbmFnZW1lbnQgaW4gZHJpdmVycy4NCj4gPg0KPiA+IFNpZ25l
ZC1vZmYtYnk6IFBlbmcgRmFuIDxwZW5nLmZhbkBueHAuY29tPg0KPiA+IC0tLQ0KPiA+ICBkcml2
ZXJzL2Jhc2UvcG93ZXIvd2FrZWlycS5jIHwgMjYgKysrKysrKysrKysrKysrKysrKysrKysrKysN
Cj4gPiAgaW5jbHVkZS9saW51eC9wbV93YWtlaXJxLmggICB8ICA2ICsrKysrKw0KPiA+ICAyIGZp
bGVzIGNoYW5nZWQsIDMyIGluc2VydGlvbnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2Jhc2UvcG93ZXIvd2FrZWlycS5jDQo+ID4gYi9kcml2ZXJzL2Jhc2UvcG93ZXIvd2FrZWly
cS5jIGluZGV4DQo+ID4NCj4gNWE1YTllOTc4ZTg1ZjNmYzlkODljYjdkNDM1MjdkYzFkZDQyYTli
MS4uOGFhMjhjMDhiMjg5MWYzYWYNCj4gNDkwMTc1MzYyY2MNCj4gPiAxYTc1OTA2OWJkNTAgMTAw
NjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9iYXNlL3Bvd2VyL3dha2VpcnEuYw0KPiA+ICsrKyBiL2Ry
aXZlcnMvYmFzZS9wb3dlci93YWtlaXJxLmMNCj4gPiBAQCAtMTAzLDYgKzEwMywzMiBAQCB2b2lk
IGRldl9wbV9jbGVhcl93YWtlX2lycShzdHJ1Y3QgZGV2aWNlDQo+ICpkZXYpICB9DQo+ID4gRVhQ
T1JUX1NZTUJPTF9HUEwoZGV2X3BtX2NsZWFyX3dha2VfaXJxKTsNCj4gPg0KPiA+ICtzdGF0aWMg
dm9pZCBkZXZtX3BtX2NsZWFyX3dha2VfaXJxKHZvaWQgKmRldikgew0KPiA+ICsgICAgICAgZGV2
X3BtX2NsZWFyX3dha2VfaXJxKGRldik7DQo+ID4gK30NCj4gPiArDQo+ID4gKy8qKg0KPiA+ICsg
KiBkZXZtX3BtX3NldF93YWtlX2lycSAtIGRldmljZS1tYW5hZ2VkIHZhcmlhbnQgb2YNCj4gPiAr
ZGV2X3BtX3NldF93YWtlX2lycQ0KPiA+ICsgKiBAZGV2OiBEZXZpY2UgZW50cnkNCj4gPiArICog
QGlycTogRGV2aWNlIElPIGludGVycnVwdA0KPiA+ICsgKg0KPiA+ICsgKg0KPiA+ICsgKiBBdHRh
Y2ggYSBkZXZpY2UgSU8gaW50ZXJydXB0IGFzIGEgd2FrZSBJUlEsIHNhbWUgd2l0aA0KPiA+ICtk
ZXZfcG1fc2V0X3dha2VfaXJxLA0KPiA+ICsgKiBidXQgdGhlIGRldmljZSB3aWxsIGJlIGF1dG8g
Y2xlYXIgd2FrZSBjYXBhYmlsaXR5IG9uIGRyaXZlciBkZXRhY2guDQo+ID4gKyAqLw0KPiA+ICtp
bnQgZGV2bV9wbV9zZXRfd2FrZV9pcnEoc3RydWN0IGRldmljZSAqZGV2LCBpbnQgaXJxKSB7DQo+
ID4gKyAgICAgICBpbnQgcmV0Ow0KPiA+ICsNCj4gPiArICAgICAgIHJldCA9IGRldl9wbV9zZXRf
d2FrZV9pcnEoZGV2LCBpcnEpOw0KPiA+ICsgICAgICAgaWYgKHJldCkNCj4gPiArICAgICAgICAg
ICAgICAgcmV0dXJuIHJldDsNCj4gPiArDQo+ID4gKyAgICAgICByZXR1cm4gZGV2bV9hZGRfYWN0
aW9uX29yX3Jlc2V0KGRldiwNCj4gZGV2bV9wbV9jbGVhcl93YWtlX2lycSwNCj4gPiArZGV2KTsg
fSBFWFBPUlRfU1lNQk9MX0dQTChkZXZtX3BtX3NldF93YWtlX2lycSk7DQo+ID4gKw0KPiA+ICAv
KioNCj4gPiAgICogaGFuZGxlX3RocmVhZGVkX3dha2VfaXJxIC0gSGFuZGxlciBmb3IgZGVkaWNh
dGVkIHdha2UtdXANCj4gaW50ZXJydXB0cw0KPiA+ICAgKiBAaXJxOiBEZXZpY2Ugc3BlY2lmaWMg
ZGVkaWNhdGVkIHdha2UtdXAgaW50ZXJydXB0IGRpZmYgLS1naXQNCj4gPiBhL2luY2x1ZGUvbGlu
dXgvcG1fd2FrZWlycS5oIGIvaW5jbHVkZS9saW51eC9wbV93YWtlaXJxLmggaW5kZXgNCj4gPg0K
PiBkOTY0MmM2Y2Y4NTIxMWFmNjAzY2UzOWUyODBhNWI0ZGU2NjE3ZWU1Li4yNWI2M2VkNTFiNzY1
YzJjNg0KPiA5MTlmMjU5NjY4YQ0KPiA+IDEyNjc1MzMwODM1ZSAxMDA2NDQNCj4gPiAtLS0gYS9p
bmNsdWRlL2xpbnV4L3BtX3dha2VpcnEuaA0KPiA+ICsrKyBiL2luY2x1ZGUvbGludXgvcG1fd2Fr
ZWlycS5oDQo+ID4gQEAgLTEwLDYgKzEwLDcgQEAgZXh0ZXJuIGludCBkZXZfcG1fc2V0X3dha2Vf
aXJxKHN0cnVjdCBkZXZpY2UNCj4gKmRldiwNCj4gPiBpbnQgaXJxKTsgIGV4dGVybiBpbnQgZGV2
X3BtX3NldF9kZWRpY2F0ZWRfd2FrZV9pcnEoc3RydWN0IGRldmljZQ0KPiA+ICpkZXYsIGludCBp
cnEpOyAgZXh0ZXJuIGludA0KPiA+IGRldl9wbV9zZXRfZGVkaWNhdGVkX3dha2VfaXJxX3JldmVy
c2Uoc3RydWN0IGRldmljZSAqZGV2LCBpbnQgaXJxKTsNCj4gPiBleHRlcm4gdm9pZCBkZXZfcG1f
Y2xlYXJfd2FrZV9pcnEoc3RydWN0IGRldmljZSAqZGV2KTsNCj4gPiArZXh0ZXJuIGludCBkZXZt
X3BtX3NldF93YWtlX2lycShzdHJ1Y3QgZGV2aWNlICpkZXYsIGludCBpcnEpOw0KPiA+DQo+ID4g
ICNlbHNlICAvKiAhQ09ORklHX1BNICovDQo+ID4NCj4gPiBAQCAtMzIsNSArMzMsMTAgQEAgc3Rh
dGljIGlubGluZSB2b2lkDQo+IGRldl9wbV9jbGVhcl93YWtlX2lycShzdHJ1Y3QNCj4gPiBkZXZp
Y2UgKmRldikgIHsgIH0NCj4gPg0KPiA+ICtzdGF0aWMgaW5saW5lIGludCBkZXZtX3BtX3NldF93
YWtlX2lycShzdHJ1Y3QgZGV2aWNlICpkZXYsIGludCBpcnEpIHsNCj4gPiArICAgICAgIHJldHVy
biAwOw0KPiA+ICt9DQo+ID4gKw0KPiA+ICAjZW5kaWYgLyogQ09ORklHX1BNICovDQo+ID4gICNl
bmRpZiAvKiBfTElOVVhfUE1fV0FLRUlSUV9IICovDQo+ID4NCj4gPiAtLQ0KPiANCj4gSSBjYW4g
YXBwbHkgdGhpcyBwYXRjaCBmb3IgNi4xNCwgYnV0IHRoZSByZXN0IG9mIHRoZSBzZXJpZXMgd2ls
bCBuZWVkIHRvIGJlDQo+IHBpY2tlZCB1cCBieSB0aGUgcmVzcGVjdGl2ZSBkcml2ZXIgbWFpbnRh
aW5lcnMuDQo+IA0KPiBJIGhvcGUgdGhpcyB3b3JrcyBmb3IgeW91Pw0KDQpZZXMuIHBsZWFzZSBq
dXN0IHBpY2sgdXAgcGF0Y2ggMS4NClBhdGNoIFsyLTEyXS8xMiBzaG91bGQgZ28gdGhyb3VnaCBS
VEMgYW5kIElOUFVUIG1haW50YWluZXIncyB0cmVlDQoNClRoYW5rcywNClBlbmcuDQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWls
aW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczov
L3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0z
Mgo=
