Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 522F2A71442
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Mar 2025 10:57:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 04284C78F73;
	Wed, 26 Mar 2025 09:57:42 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2075.outbound.protection.outlook.com [40.107.21.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 17BF2C71280
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Mar 2025 09:57:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RIb1da1vvggSJdAoqySEPVYGMwdrE4vs+eMneQEnemwNNljd8Ha3xe9OhFGZtfnrxOtfTdgMx5GTdbBgtgfL3EGWOa1Vha0zrfgW79IwDiqQhoR44Mvou0ZcEi9tlLKrnwF7Olmpb73UTpvSvZYmnKMh+uhIeeSpelLkUUATLaHheJ7Y+oe+Mw5fEPaNiHttfWZjJ6d3Cv55m39UU6XcLtzn3GHArrgwiYlzbK7n0Cl+xDUnSnUhPsJllyQWORgJbvuaiXlTJODvUrKSsFkw8dcHu5BIIocORhQgrq9ekWsZPNd2Ae86U91edwm+CdQba+btGmGeqw0FBGyGHj4ZOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2lUFK7rQaLUJE1yFyO/j7KykDoa74+4nuUL4KWL7gVQ=;
 b=IhcV2NGL/XQtBVntlULKHEYZDoyU6uBtWyM2d9xgCV+WMW0FmwvCO6HVHeMVSBE1DWNTQOcNGEYq4E+37s2BnEXTP5pMYhTTCrGEsoL8CFIs799GEgNir8HZA6Kj42fk5mWRGbThMGWl+RTuID9IouH7nq6b4U39G0d8tX9IBOe6zXFoGTUf666jrP+wkDqNpspfYTJC5pKdcR01ZUviHHbp3T30BR3ENjGQFicP/7nGj3k7JnzKxEK2OzdTRoQWblmJGp5OvpiZozRiyVhMjwwsI7DgCLzlbVLyo/61MvKVGgmyyGoz8WMKgQpE4lYXs0hZk3Xa3QI5KVgtj9oUww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2lUFK7rQaLUJE1yFyO/j7KykDoa74+4nuUL4KWL7gVQ=;
 b=SPNffz9t36LIV+x/fewKia7PqiT7JvVLdQUGrTfi3AyjCs5xCFXyVpFwpgiLL7QNxVMxoCWLk+zkWupEyd4Tobc68CHbAoX988EouCYYMxmbbQeMDsy5OuhDn/rSfWgV3AxFVWTjsMpp6acKjGfWDLZU2R+4+nWBRVRHczqZ5WsK5hKeeHU39jUhtHZ1XbY14N6yocaTZUTffF9cayOdxPSQzkdERBCiKlq1Tkv2kIdfKoxEAyhB2FIMKhNjmn57Dp7mEyifuYTF6VF5gpvF4RGpeEoRfNu7z/0UkYjvZgNl6FG83VTTcJnk+ZRdcbLisAkqDNI7fABJTOxDpmyWAg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU2PR04MB8582.eurprd04.prod.outlook.com (2603:10a6:10:2d9::24)
 by PA3PR04MB11228.eurprd04.prod.outlook.com (2603:10a6:102:4b0::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 26 Mar
 2025 09:57:37 +0000
Received: from DU2PR04MB8582.eurprd04.prod.outlook.com
 ([fe80::c96e:12f1:67b7:ed74]) by DU2PR04MB8582.eurprd04.prod.outlook.com
 ([fe80::c96e:12f1:67b7:ed74%5]) with mapi id 15.20.8534.043; Wed, 26 Mar 2025
 09:57:37 +0000
Message-ID: <2d7b18bf-31ed-abfc-20db-7f5b54c812af@oss.nxp.com>
Date: Wed, 26 Mar 2025 11:57:32 +0200
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
 <50d2c651-746e-4ddd-4036-f72742a622f8@oss.nxp.com>
 <e8054f85-2a23-4ceb-8e1c-7cdfe7c87628@linaro.org>
 <a31a575b-8f6d-6317-f172-b4f8b1a5cda7@oss.nxp.com>
 <f1268261-c900-4adc-aefe-795f23faba59@linaro.org>
From: Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
In-Reply-To: <f1268261-c900-4adc-aefe-795f23faba59@linaro.org>
X-ClientProxiedBy: AS4P190CA0001.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5de::7) To DU2PR04MB8582.eurprd04.prod.outlook.com
 (2603:10a6:10:2d9::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8582:EE_|PA3PR04MB11228:EE_
X-MS-Office365-Filtering-Correlation-Id: e084fed7-943e-4a39-c099-08dd6c4ca33e
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Qzh3WFplbkZ2SmZMWGtoQTFRQVB0Rk5VUTlpSStqSkw5Rjk1WUpJcE5IdVVY?=
 =?utf-8?B?Rk9zZ2F4aXpvZlVoZDNQK3RWR0hSWlNqUG5NRnROUzhnTnlPSjM2cllmZGVr?=
 =?utf-8?B?VGw5clJzaWhCZDhLVi9OcFZCNGZ4QS9qaTNhMXY0eWJmL002VXZOWTZYZFdj?=
 =?utf-8?B?SUJ4cXN6TmxoVGJvY0RxR3dmK2IwSFpFaDdRT29Ca3Y3Zm54YURYbUx0RG5o?=
 =?utf-8?B?d0dNZGxJc3dXTWVtM0k0eTBMOUdqWnN5WUpyNUx4UXJJNFQrcjlBTDBRaC84?=
 =?utf-8?B?UkRUMGFRMFZNZG1aK0pIU2d1Qm54V0g5QUZ6VTJRMGhZL2laZXB5OXNqRUl5?=
 =?utf-8?B?RmpIUktheTZKQ3IvVHZOQkoraXVBQTdNUmJiKzJUQUN3eVdpS2k4QkV6eWEw?=
 =?utf-8?B?S21Qa0VKRFQ0RkFucHd1YjJRQXVLWTBQQjRkbFFtSFE1TG9YbjlEWTBOdTBJ?=
 =?utf-8?B?MjFTaFBkNU5BQkN2bUpoUnVHT0xCRll0REpIZnhwb0hUZUE5eXlrOVlNMThm?=
 =?utf-8?B?OGV2azgzNjAySWIzNHZpTElwQzZlQytYaE9RQ3lWVzBnUERNYTIzLzJIWXBH?=
 =?utf-8?B?enllRTRGV2hkSU1DUnYzQkZtc0FxOGFXSFBhTFIxRGVtWGdFbHFNNzYwbExv?=
 =?utf-8?B?RDBtRDFsb3lFYUNuckVVdGxiVUI3RFJuY2pSNjVwU05XY1BYMEZqSUh3dmY5?=
 =?utf-8?B?OTlJaUgwVTBNTTh2NEZ3eE9oM1RSQXhpNFM2czNENExoSXBjSThVdGNSM3hO?=
 =?utf-8?B?c3lCSDFvWks4eFdIQ09jdkM4a2QyOG13czUxdHkzNklFRWMrbzU2SEZaYU1Q?=
 =?utf-8?B?M2t6dzFBQkZlNy8zNk9STVJ2bjRQNnUyY004VGRMV09ZbU5KSVJudzJQS0ZE?=
 =?utf-8?B?clVVWGdCSC91Snp0ajg3VnlFZktBSnRHaVhSUi85QnFnZTNLTTkxczZkVW8r?=
 =?utf-8?B?ZzNaYnBNT0xFZllZbXl3ZEJueSsrNmwxT0dMRi9yb1d0Z2ZCLzlqYjVMZXpW?=
 =?utf-8?B?TlN4MS96WkpIRlZiQ0gzTnptZkR2S2QyM0gyd3N0YUhFM1VlNjEralpZZm9F?=
 =?utf-8?B?SE9YeVErNkYvckk1YTBkOXpIcFBXR3FSbEswaytwWk5tMWN5bjQrcVNkZjdI?=
 =?utf-8?B?dW5pOGNQajA5SFJES2dFYTBEbVROdE10TVlwSWV4aGZYUmJhWFhBaHh5NkZh?=
 =?utf-8?B?aGFuck5aMnFDUjdiNXAxUkdYRStZTlFPRVN4eXNQTkxRSTJqeDE1Nyswa0lt?=
 =?utf-8?B?aHBpNGc2dDdmdkhEM2FibWJ2aHpaUUZCM0xGcFRCaEZDdkJtRFNYVVRwTCtK?=
 =?utf-8?B?L01wR0VGa0dLdEY1KzNVbzNMSy9sNkVDZEFYUlByZjJ6Y2ZlQ3hrN0o5Y243?=
 =?utf-8?B?dmliaXkrTFlSL1BSNjZ6S0hrMzIrMzZRa3Y3VnlGZlBMY3NNa0o1MERHM1pm?=
 =?utf-8?B?STdWRFlqMUJ5YWVhUG0yWll6TTBOc3dTeTBSWC85bzh0aDg5NzRoeTlDRlVq?=
 =?utf-8?B?cWhIMGNXaVBlU1dkQ3owTkdna0M2d0d2U1A3K1NrY0JUUlcrWmlZdHQvbUJ3?=
 =?utf-8?B?THRYdzAyMFpFUy9VNytjZENDRlAzMEhXNS9PK2x3MzYwcWRoSkZvckhudlF0?=
 =?utf-8?B?QUloSE5lWU9CZHJvUVY3blBsa04raXpZY3EwRUJIemNGY3NDdUViVTV6MEk0?=
 =?utf-8?B?Z2F2d0lDdXpFWGN0UDkrdjNzVlFIaEhjQUFNSmFyL2phaEJpNDRPMGFxaFZE?=
 =?utf-8?B?V1pOQ0tLTUc0RE5RSlZreEw3MnQ0eVRxSE1QdWRIOVZRKzlYMWV3TFBiclJR?=
 =?utf-8?B?dEtUanJKN1MrMXYxYXNodFBrU213UEs4TmEyczBqeDFjd1EyQlFwYU03TTZF?=
 =?utf-8?Q?548oW9ZPBuvmG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU2PR04MB8582.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WDdrWWhiSHNOWGlxMncrWXQzSEN5ejBROTA0aEliQ0NHRXpnRjRWUGtLVU0x?=
 =?utf-8?B?K1AzOG1kYWc5Y0hjZVJ5RWxPaldGYktDd2FBYVpBenBxSWxuMFRCTENiMnhw?=
 =?utf-8?B?VkQ3MkJBYks4blJlSzUxc0pvZmJSSEdZdjUvSVdDQmI3bExremFVTjJTWkp1?=
 =?utf-8?B?USs2T3MzU3dlVzdnWldHZWY0SU9LUkIzMlVSVlhDQ2VpK2dGQXhmNEJmTGJP?=
 =?utf-8?B?WGd4UXpGaUdLblBSOHNJa2sxQ2Q5b1JlZG9CcmpBbWlKYnZsVWlhOTg2VWdP?=
 =?utf-8?B?eEtiam80WThBVXNWeVNITTVzRkpzYmVvNlUvQmpjRWJpWDYwY2FjRkNSNmcx?=
 =?utf-8?B?bVJhOUVpeDR3aXNKbFhWSVRzOHJMSFhtU1pyam5hcXVPajc2c3hCNi9mcEgz?=
 =?utf-8?B?MEtBOThSdzJZRUk2SERQLy9uMnNaMzJXdlkrV3ZCN1Jpc1RtRzVMejF4U01t?=
 =?utf-8?B?RFJ4U2FBckNrbFYwZlFsc2tJS3JMREp5UWY5UkFsMFZTaHoyUXRjVmp1ZDdJ?=
 =?utf-8?B?eHFlMFJpTkp3d0JSbUxoSC95N3pKZXRlZnNFRjl0a2d1ZVdSU1Fmak9JSCtO?=
 =?utf-8?B?K2VuQWZCNVNsUzlURjd6M0Z0WFljcmYrZG1YakN4MGJvTTE1UjJMMjY0V3px?=
 =?utf-8?B?aUhBU3dGZ01tRnJDY0V5UDFOZkJYeUNLWVRUTHdDVjUyemZaMXptRU9XWVhq?=
 =?utf-8?B?dkpKT0FUVzhROG9jc1AxdUFmQVUzd2Y5elJtcEZkWDhIc1RsdHhYQTZGSU96?=
 =?utf-8?B?bzU3WWdPQWQ3REFyMVFWdXFrc1VnWWhNUGJ2YWdrMjVvdDVFR1JtYi9SdEhh?=
 =?utf-8?B?Y2JNUC9mUGNsYlk4cmRXcWdHTkFKOWxWcFZHZTJ5TkR3ZjZWWHdhd0NCKzN2?=
 =?utf-8?B?L0RMckhrQ0Zua21zVFA5VUw5bm1LSGd2N0R2NytGN3RWMDdkRUxVWXhjeElM?=
 =?utf-8?B?SnRhUm9zdnJqeTU1ZlV4UExibWhtUDlWUGNxYVhPc3VkZDJnVDdrMGRZSDdI?=
 =?utf-8?B?MFdDK20wNHJycGVJb1FyQVZ6dWxGd3VjNkU2N2tBSGlWdzFONVZFSDVKNUpB?=
 =?utf-8?B?NytYWG1kN2U4Q0FKVEhUa0dBTXlwUngyNGIzd2YzbWNBRmt6czZEUkk2dEJp?=
 =?utf-8?B?TVlBUWQ4Z3BkRU9HbG4rd3JhSUpPa1RUR0NhSVV6YWNadWZVTytya1FaaGt4?=
 =?utf-8?B?WXBiK1BVMVJhSVhCSFZxREZlVmQyRVpIZW9PM2dZcjVZL1IwdFg3TDV1d2JG?=
 =?utf-8?B?Y1FsRGxvd3NiclVtbm54eElzaXhnOUNEZXNRQlRKU1BoWTZZR3lNMTd4Z1dN?=
 =?utf-8?B?RlFFdlo3TklscVZoR09DMTBKN1dxWTBPOGplNzY5UXNWT2hXT2lsVGdab0py?=
 =?utf-8?B?UlFqV0ZDUUdwTzRJSlN2R0VPcHhyVmdxNUR5ajJ2TEVlbDZvVm52aVQrLzM1?=
 =?utf-8?B?UVV1VTFPVDdOMUx2ZFk5MUdXaXczSmFXLzFiYWxyeTRMVEdSZi85RnFHSy9C?=
 =?utf-8?B?d3M5Q1RhVGFvWitieDh4T1BjQlBnWDRMZEhiU3Nzd3JoY1BRcThrRy9mczhp?=
 =?utf-8?B?SXRXL3Q1VUR6U3IyUEtNQUdhL1hpcmlMWkZ3ZnhkUzhHSGxxN0pYR0FocDFv?=
 =?utf-8?B?bTVOeEhGUElIcWNOSnJjcnRyRFdVVm9PQi92Yno4SWJBeXE0OG9HR0VWZGly?=
 =?utf-8?B?eFczN2RyY1dpL29FN0lkbHNtSExiWUVBYnhMV1d3clRYY0wxVWhhNTIwYnEw?=
 =?utf-8?B?bTlpQi80VG1RMUFmVHZqb3pTbktuQ2dRTDJNdG0vM3pBbXR3SzNyNnYwZFJI?=
 =?utf-8?B?ZkVuSkFrcWRJQlZ3b2psSDZrRHFoUHltQWYvNXNKZHlsYUJWOTV5Y04yMDU3?=
 =?utf-8?B?MWo2SWd1SThvZ29hbUxMaktNaGprL1RNb21vRy9TT09FUllySG5PRDVYaWo2?=
 =?utf-8?B?NXREVlRrWXAybktyK2hzVXl2S3lRazdGRzRvMGlHNDU2c05jMzd1Q1NwaWhF?=
 =?utf-8?B?RDBxWFhKcllER054Z2dscjJRUVNnbHJFSnJ1bFJrejNUMkl1ZGJ2aVM5ZGNl?=
 =?utf-8?B?L3AxU09Lc0Y1c1haSTdGSE5IaDg4RUtnajg3NDR4UC81Mnh3a3d0dGQ1T0RJ?=
 =?utf-8?B?VHpZa1Vrem15OGYzNG5xSGs2TzFsYm43MVo0WVNDcFVZOENrOXRsdm5BTW1i?=
 =?utf-8?Q?BweWTcxY7jgMktO43lECRMk=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e084fed7-943e-4a39-c099-08dd6c4ca33e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8582.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 09:57:37.4081 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y18GUsjNKwNp4/dSo73i6whJ+8TsVcG3DNSY7bX6ovsoVFqjkdqya0plXCMlSVss/qB2C9N+SE76oOk5TmFKcxKEWwHcbJrRxJBwKIKH+iU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA3PR04MB11228
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

T24gMy8yNi8yMDI1IDExOjE5IEFNLCBEYW5pZWwgTGV6Y2FubyB3cm90ZToKPiBPbiAyNi8wMy8y
MDI1IDA4OjQ0LCBHaGVubmFkaSBQcm9jb3BjaXVjIHdyb3RlOgo+PiBPbiAzLzI1LzIwMjUgMzo1
NCBQTSwgRGFuaWVsIExlemNhbm8gd3JvdGU6Cj4+PiBPbiAyNS8wMy8yMDI1IDE0OjIxLCBHaGVu
bmFkaSBQcm9jb3BjaXVjIHdyb3RlOgo+Pj4+IE9uIDMvMjUvMjAyNSAyOjUxIFBNLCBEYW5pZWwg
TGV6Y2FubyB3cm90ZToKPj4+PiBbIC4uLiBdCj4+Pj4+Pj4+Pj4+ICtzdGF0aWMgaW50IF9faW5p
dCBueHBfc3RtX3RpbWVyX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UKPj4+Pj4+Pj4+Pj4g
KnBkZXYpCj4+Pj4+Pj4+Pj4+ICt7Cj4+Pj4+Pj4+Pj4+ICvCoMKgwqAgc3RydWN0IGRldmljZSAq
ZGV2ID0gJnBkZXYtPmRldjsKPj4+Pj4+Pj4+Pj4gK8KgwqDCoCBzdHJ1Y3QgZGV2aWNlX25vZGUg
Km5wID0gZGV2LT5vZl9ub2RlOwo+Pj4+Pj4+Pj4+PiArwqDCoMKgIHN0cnVjdCBzdG1faW5zdGFu
Y2VzICpzdG1faW5zdGFuY2VzOwo+Pj4+Pj4+Pj4+PiArwqDCoMKgIGNvbnN0IGNoYXIgKm5hbWUg
PSBvZl9ub2RlX2Z1bGxfbmFtZShucCk7Cj4+Pj4+Pj4+Pj4+ICvCoMKgwqAgdm9pZCBfX2lvbWVt
ICpiYXNlOwo+Pj4+Pj4+Pj4+PiArwqDCoMKgIGludCBpcnEsIHJldDsKPj4+Pj4+Pj4+Pj4gK8Kg
wqDCoCBzdHJ1Y3QgY2xrICpjbGs7Cj4+Pj4+Pj4+Pj4+ICsKPj4+Pj4+Pj4+Pj4gK8KgwqDCoCBz
dG1faW5zdGFuY2VzID0KPj4+Pj4+Pj4+Pj4gKHR5cGVvZihzdG1faW5zdGFuY2VzKSlvZl9kZXZp
Y2VfZ2V0X21hdGNoX2RhdGEoZGV2KTsKPj4+Pj4+Pj4+Pj4gK8KgwqDCoCBpZiAoIXN0bV9pbnN0
YW5jZXMpIHsKPj4+Pj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGRldl9lcnIoZGV2LCAiTm8gU1RN
IGluc3RhbmNlcyBhc3NvY2lhdGVkIHdpdGggYSBjcHUiKTsKPj4+Pj4+Pj4+Pj4gK8KgwqDCoMKg
wqDCoMKgIHJldHVybiAtRUlOVkFMOwo+Pj4+Pj4+Pj4+PiArwqDCoMKgIH0KPj4+Pj4+Pj4+Pj4g
Kwo+Pj4+Pj4+Pj4+PiArwqDCoMKgIGJhc2UgPSBkZXZtX29mX2lvbWFwKGRldiwgbnAsIDAsIE5V
TEwpOwo+Pj4+Pj4+Pj4+PiArwqDCoMKgIGlmIChJU19FUlIoYmFzZSkpIHsKPj4+Pj4+Pj4+Pj4g
K8KgwqDCoMKgwqDCoMKgIGRldl9lcnIoZGV2LCAiRmFpbGVkIHRvIGlvbWFwICVwT0ZuXG4iLCBu
cCk7Cj4+Pj4+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gUFRSX0VSUihiYXNlKTsKPj4+
Pj4+Pj4+Pj4gK8KgwqDCoCB9Cj4+Pj4+Pj4+Pj4+ICsKPj4+Pj4+Pj4+Pj4gK8KgwqDCoCBpcnEg
PSBpcnFfb2ZfcGFyc2VfYW5kX21hcChucCwgMCk7Cj4+Pj4+Pj4+Pj4+ICvCoMKgwqAgaWYgKGly
cSA8PSAwKSB7Cj4+Pj4+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBkZXZfZXJyKGRldiwgIkZhaWxl
ZCB0byBwYXJzZSBhbmQgbWFwIElSUTogJWRcbiIsIGlycSk7Cj4+Pj4+Pj4+Pj4+ICvCoMKgwqDC
oMKgwqDCoCByZXR1cm4gLUVJTlZBTDsKPj4+Pj4+Pj4+Pj4gK8KgwqDCoCB9Cj4+Pj4+Pj4+Pj4K
Pj4+Pj4+Pj4+PiDCoMKgwqDCoMKgRnJvbSBjb21taXQgZGVzY3JpcHRpb246Cj4+Pj4+Pj4+Pj4K
Pj4+Pj4+Pj4+Pj4gVGhlIGZpcnN0IHByb2JlZCBTVE0gaXMgdXNlZCBhcyBhIGNsb2Nrc291cmNl
LCB0aGUgc2Vjb25kCj4+Pj4+Pj4+Pj4+IHdpbGwgYmUKPj4+Pj4+Pj4+Pj4gdGhlCj4+Pj4+Pj4+
Pj4+IGJyb2FkY2FzdCB0aW1lciBhbmQgdGhlIHJlc3QgYXJlIHVzZWQgYXMgYSBjbG9ja2V2ZW50
IHdpdGggdGhlCj4+Pj4+Pj4+Pj4+IGFmZmluaXR5IHNldCB0byBhIENQVS4KPj4+Pj4+Pj4+Pgo+
Pj4+Pj4+Pj4+IFdoeSBpcyB0aGUgaW50ZXJydXB0IG1hbmRhdG9yeSB3aGVuIHRoZSBub2RlIGlz
IHByb2JlZCBhcyBhCj4+Pj4+Pj4+Pj4gY2xvY2tzb3VyY2U/Cj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4g
SXQgcmVsaWVzIG9uIHRoZSBEVCBkZXNjcmlwdGlvbiBhbmQgaXQgZG9lcyBub3QgaHVydCB0byBo
YXZlIGEKPj4+Pj4+Pj4+IGNvbnNpc3RlbnQgY29kZSBwYXRoIGZvciBjbG9ja2V2ZW50IC8gY2xv
Y2tzb3VyY2UgZXZlbiBpZiB0aGUKPj4+Pj4+Pj4+IGludGVycnVwdAo+Pj4+Pj4+Pj4gaXMgbm90
IHJlcXVlc3RlZCBmb3IgdGhlIGNsb2Nrc291cmNlIGxhdGVyLgo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4K
Pj4+Pj4+Pj4gSWYgc28sIGluIG15IG9waW5pb24sIGl0IHdvdWxkIG1ha2Ugc2Vuc2UgdG8gdXNl
IHRoZSBzYW1lIFNUTQo+Pj4+Pj4+PiBpbnN0YW5jZQo+Pj4+Pj4+PiBmb3IgYm90aCB0aGUgY2xv
Y2tzb3VyY2UgYW5kIGJyb2FkY2FzdCBjbG9ja2V2ZW50LCBhcyBib3RoCj4+Pj4+Pj4+IGZ1bmN0
aW9ucwo+Pj4+Pj4+PiBjYW4KPj4+Pj4+Pj4gYmUgYWNjb21tb2RhdGVkIHdpdGhpbiBhIHNpbmds
ZSBTVE0gaW5zdGFuY2UsIHdoaWNoIHdpbGwgaGVscAo+Pj4+Pj4+PiByZWR1Y2UKPj4+Pj4+Pj4g
dGhlCj4+Pj4+Pj4+IG51bWJlciBvZiBTVE0gaW5zdGFuY2VzIHVzZWQuCj4+Pj4+Pj4KPj4+Pj4+
PiBUaGUgYnJvYWRjYXN0IHRpbWVyIGlzIHN0b3BwZWQgd2hlbiBpdCBpcyB1bnVzZWQgd2hpY2gg
aXMgdGhlCj4+Pj4+Pj4gY2FzZSBmb3IKPj4+Pj4+PiB0aGUgczMyIGJlY2F1c2UgdGhlcmUgYXJl
IG5vIGlkbGUgc3RhdGUgcG93ZXJpbmcgZG93biB0aGUgbG9jYWwKPj4+Pj4+PiB0aW1lcnMuCj4+
Pj4+Pj4gVGhleSBoYXZlIHRvIGhhdmUgYmUgc2VwYXJhdGVkLgo+Pj4+Pj4+Cj4+Pj4+Pgo+Pj4+
Pj4gVGhpcyB3b3VsZG4ndCBiZSB0aGUgY2FzZSBpZiB0aGUgU1RNIGlzIGtlcHQgcnVubmluZy9j
b3VudGluZyBkdXJpbmcKPj4+Pj4+IHRoZQo+Pj4+Pj4gY2xvY2sgZXZlbnQgc2V0dXAsIHdpdGgg
b25seSB0aGUgY2xvY2sgZXZlbnQgaW50ZXJydXB0IGJlaW5nIGRpc2FibGVkCj4+Pj4+PiAoQ0NS
LkNFTikuCj4+Pj4+Cj4+Pj4+IEFyZSB5b3UgYXNraW5nIHRvIHVzZSB0d28gZGlmZmVyZW50IGNo
YW5uZWxzIGZvciB0aGUgc2FtZSBTVE0KPj4+Pj4gaW5zdGFuY2UsCj4+Pj4+IG9uZSBmb3IgdGhl
IGNsb2Nrc291cmNlIGFuZCBvbmUgZm9yIHRoZSBjbG9ja2V2ZW50ID8KPj4+Pj4KPj4+Pgo+Pj4+
IEkgc3VnZ2VzdGVkIHVzaW5nIHRoZSBDTlQgcmVnaXN0ZXIgdG8gb2J0YWluIHRoZSBjb3VudCBm
b3IgdGhlIGNsb2NrCj4+Pj4gc291cmNlLCB3aGlsZSB1c2luZyBvbmUgb2YgdGhlIFNUTSBjaGFu
bmVscyBmb3IgdGhlIGNsb2NrIGV2ZW50Lgo+Pj4KPj4+IEFoLCBvay4KPj4+Cj4+PiBJIHRoaW5r
IGl0IGlzIHByZWZlcmFibGUgdG8ga2VlcCB0aGVtIHNlcGFyYXRlZCB0byBrZWVwIHRoZSBjb2Rl
Cj4+PiBtb2R1bGFyLiBHaXZlbiB0aGUgbnVtYmVyIG9mIFNUTSBvbiB0aGUgcGxhdGZvcm0sIGl0
IGRvZXMgbm90IGh1cnQKPj4+Cj4+Cj4+IFRoZSBTMzJHMiBhbmQgUzMyRzMgYXJlIFNvQ3MgZmVh
dHVyaW5nIGEgZGl2ZXJzZSBzZXQgb2YgY29yZXMuIExpbnV4IGlzCj4+IGV4cGVjdGVkIHRvIHJ1
biBvbiBDb3J0ZXgtQTUzIGNvcmVzLCB3aGlsZSBvdGhlciBzb2Z0d2FyZSBzdGFja3Mgd2lsbAo+
PiBvcGVyYXRlIG9uIENvcnRleC1NIGNvcmVzLiBUaGUgbnVtYmVyIG9mIFNUTSBpbnN0YW5jZXMg
aGFzIGJlZW4gc2l6ZWQgdG8KPj4gaW5jbHVkZSBhdCBtb3N0IG9uZSBpbnN0YW5jZSBwZXIgY29y
ZS4gQWxsb2NhdGluZyBzaXggaW5zdGFuY2VzICgxIGNsb2NrCj4+IHNvdXJjZSwgMSBicm9hZGNh
c3QgY2xvY2sgZXZlbnQsIGFuZCA0IGNsb2NrIGV2ZW50cyBmb3IgYWxsIEE1MyBjb3JlcykKPj4g
dG8gTGludXggb24gdGhlIFMzMkcyIGxlYXZlcyB0aGUgTTcgc29mdHdhcmUgc3RhY2tzIHdpdGhv
dXQgYWRlcXVhdGUgU1RNCj4+IGNvdmVyYWdlLgo+IAo+IEdpdmVuIHRoaXMgZGVzY3JpcHRpb24g
SSdtIHdvbmRlcmluZyB3aHkgb25lIFNUTSBoYXMgdG8gYmUgdXNlZCBhcyBhCj4gY2xvY2tzb3Vy
Y2UgaWYgdGhlIFNUTV8wNyBpcyBhbHJlYWR5IGEgVFMgb25lLiBBbmQgYWxzbywgd2UgY2FuIGdl
dCByaWQKPiBvZiB0aGUgYnJvYWRjYXN0IHRpbWVyIGFzIHRoZXJlIGlzIG5vIGlkbGUgc3RhdGUg
Zm9yY2luZyBhIHN3aXRjaCB0byBhbgo+IGFsd2F5cy1vbiB0aW1lci4KCkluZGVlZCwgU1RNXzA3
IGNhbiBiZSB1c2VkIGFzIGEgc3lzdGVtIGNsb2NrIHNvdXJjZSwgYnV0IExpbnV4IHNob3VsZApu
b3QgYXNzdW1lIG93bmVyc2hpcCBvZiBpdC4KCj4gCj4gSUlVQywgb24gdGhlIFMzMmcyIHRoZXJl
IGFyZSA0IHggQ29ydGV4LUE1MyBhbmQgMyB4IENvcnRleC1NMywgdGhhdAo+IG1lYW5zIHdlIG5l
ZWQgNyB0aW1lcnMuCj4gCj4gVGhlIHN5c3RlbSBoYXMgNyB0aW1lcnMgKyBhIHNwZWNpYWwgb25l
IGZvciB0aW1lc3RhbXAuCj4gCj4gU28gaWYgSSBmb2xsb3cgdGhlIHJlYXNvbmluZywgdGhlIGJy
b2FkY2FzdCB0aW1lciBzaG91bGQgbm90IGJlIHVzZWQKPiBvdGhlcndpc2Ugb25lIGNvcnRleC1N
MyB3aWxsIGVuZCB1cCB3aXRob3V0IGEgdGltZXIuCj4gCgpPbiB0aGUgUzMyRzIsIHRoZXJlIGFy
ZSBlaWdodCBTVE0gdGltZXJzIGFuZCBTVE1fVFMuIFRoZXJlZm9yZSwgdGhlcmUKc2hvdWxkIGJl
IGVub3VnaCBpbnN0YW5jZXMgdG8gYWNjb21tb2RhdGUgNHhBNTMgYW5kIDN4TTcgY29yZXMuCgo+
IFRoYXQgbGVhZHMgdXMgdG8gb25lIGNsb2Nrc291cmNlIGZvciB0aGUgZmlyc3QgcGVyIENQVSB0
aW1lciBpbml0aWFsaXplZAo+IG9yIGFsdGVybmF0aXZlbHkgb25lIFNUTSBpbnN0YW5jZSA9PSAx
IGNsb2Nrc291cmNlIGFuZCAxIGNsb2NrZXZlbnQKPiB3aGljaCBtYWtlcyB0aGluZ3Mgc2ltcGxl
cgo+CkknbSBub3Qgc3VyZSBJIHVuZGVyc3Rvb2QgdGhlIGVudGlyZSBkZXNjcmlwdGlvbi4gQXMg
SSBzZWUgaXQsIHR3byBTVE0KaW5zdGFuY2VzIHNob3VsZCBiZSB1c2VkIHRvIGFjY29tbW9kYXRl
IG9uZSBjbG9jayBzb3VyY2UsIGEgYnJvYWRjYXN0CmNsb2NrIGV2ZW50LCBhbmQgZm91ciBjbG9j
ayBldmVudHPigJRvbmUgcGVyIGNvcmUuCgpFLmcuClNUTV8wCgktIGNsb2Nrc291cmNlIChiYXNl
ZCBvbiBDTlQpCgktIGJyb2FkY2FzdCBjbG9jayBldmVudCAoY2hhbm5lbCAwKQoKU1RNXzEKCS0g
Q29ydGV4LUE1MyAwIChjaGFubmVsIDApCgktIENvcnRleC1BNTMgMSAoY2hhbm5lbCAxKQoJLSBD
b3J0ZXgtQTUzIDIgKGNoYW5uZWwgMikKCS0gQ29ydGV4LUE1MyAzIChjaGFubmVsIDMpCgotLSAK
UmVnYXJkcywKR2hlbm5hZGkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
