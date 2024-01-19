Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 218C48324F2
	for <lists+linux-stm32@lfdr.de>; Fri, 19 Jan 2024 08:14:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B9309C6DD73;
	Fri, 19 Jan 2024 07:14:36 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05olkn2029.outbound.protection.outlook.com [40.92.90.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 45A83C6DD6E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Jan 2024 07:14:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LbfBBaSrCjG+Lw9ApzeLRQ/KfwutIJS8VDdK427VDvMAbEdrcMLFUhQEi731s+fyN/YoXAxKC4UkzOQjn7Pvld8BSigbaoj3EhtUsPQPikSSRQtTS424olF8klvIOcaNKUP8Q+PZskPmDVC9+e16Ha1QugEHJFj5WQMvrZzlO0n9b7GelenHOsNWN4CXE+3/G5R5xF3AMT1fi+hbahrMfwlpQmFArklaNGRpVszaFSBC0qFPxMULdCfNOva9qMWASVcBEPBf2siRYztxcNqtnmdWpoX6oDyNNlwNCCzpUwxLf7rjCyoaDfWbNvZms83saGf5z4o5pFXepQX9bn1vqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aeYZVB9wt9c/z5enDpNqA9W1lAPT0qOmgjtWfhGmERg=;
 b=hWP4hxgmVrXkKS2icYwLLuExyUxFgv/rK2ufRvIiwJ6FKKgef0gYomhCljeaC+GIcJ6Q80ktwjx/Pryi3WhJ9144qXB4j3ncDL6HunbOBm2gI3q3dwAMN/eaNA/sCBuK1RYDHaxi3J9A3tZeNwCtlmCtvDuGaZ3E5meICcUAPA4eLVuoLL6Ld0ZgyV6NgevIUAcSqO/iz+/E4CjWo5A5bIq9rEAfgw6HOaPUn6m68tj4lHfKB2G9QQ8aEl2hFwxLopPyLHVrKeWQLLCBwXsRNhgHXIIoFBdoNYci5ATXabsaIghB1dtuzvuShGBVPvvZDf28J0bqNW/1CApp36boxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from AS8P193MB1285.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:333::21)
 by PAXP193MB1438.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:139::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24; Fri, 19 Jan
 2024 07:14:33 +0000
Received: from AS8P193MB1285.EURP193.PROD.OUTLOOK.COM
 ([fe80::897e:cfd5:b29b:c611]) by AS8P193MB1285.EURP193.PROD.OUTLOOK.COM
 ([fe80::897e:cfd5:b29b:c611%6]) with mapi id 15.20.7202.024; Fri, 19 Jan 2024
 07:14:33 +0000
Message-ID: <AS8P193MB1285B34B71F3143FA9B0A053E4702@AS8P193MB1285.EURP193.PROD.OUTLOOK.COM>
Date: Fri, 19 Jan 2024 08:15:31 +0100
User-Agent: Mozilla Thunderbird
To: Jose Abreu <Jose.Abreu@synopsys.com>, Andrew Lunn <andrew@lunn.ch>
References: <AS8P193MB1285DECD77863E02EF45828BE4A1A@AS8P193MB1285.EURP193.PROD.OUTLOOK.COM>
 <AS8P193MB1285EEAFE30C0DE7B201D33CE46C2@AS8P193MB1285.EURP193.PROD.OUTLOOK.COM>
 <6e33c038-45a7-4941-b5d9-ce5704e13d48@lunn.ch>
 <AS8P193MB128591BBF397DC664D7D860EE4722@AS8P193MB1285.EURP193.PROD.OUTLOOK.COM>
 <DM4PR12MB50883D41B18E8627FBDF5E32D3722@DM4PR12MB5088.namprd12.prod.outlook.com>
Content-Language: en-US
From: Bernd Edlinger <bernd.edlinger@hotmail.de>
In-Reply-To: <DM4PR12MB50883D41B18E8627FBDF5E32D3722@DM4PR12MB5088.namprd12.prod.outlook.com>
X-TMN: [cY+JBWZZZtoOHiW2BVQYL8qRM6pVmABFE/DvxCRRL2pRMENToR421OAzjcTsAgOi]
X-ClientProxiedBy: FR3P281CA0063.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::13) To AS8P193MB1285.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:333::21)
X-Microsoft-Original-Message-ID: <fe1f1201-31ec-49bd-99c8-e49fb42ff6ee@hotmail.de>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P193MB1285:EE_|PAXP193MB1438:EE_
X-MS-Office365-Filtering-Correlation-Id: de6019a3-c598-4282-c1ab-08dc18be496f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pzaqQdZil9BdMK/aDQI1zzeb2wLDSo4/KKsIg7pOX46pqonlQc4sr1cvHbJ9PE1omsuqEaWS611KE1GXYH8Fe7/0aGwm0qhh9KZLaYv4NihMgXeP/YxBpX9KWAQSTxU2/MRzn75e57dPeW1/rtqSFk8reaE5DBYtlOQ23SQ91U7mtBEOOv6IqDnAd0itAVIjYtYMsH7S7V08Srpgp6k/sLf3oLPOSH9wC0T9jAHdOpxja4RNHG3RBfSWHzEeEss+NNxu4zwG6wZJmNscbw6sCz8pH6qmcWLXyB8dF1aFXiQqDXo7bkPZIGV/n7a6TWrVszb73p5ueQ89gjqxV/bE7PRZQUGn4VXC45WichlvHRabqOAMRulvgUq8/rsO7wedjnbTdSqJq1svHrCjkhvvhb0y41qq732nb3iEO59sENRYF7cqdkJXv8Sa/8VZjugPRUxudBb9OBaY1651Uyau5qKiXVBOUlPPZR7+HVBN1nvsQcR96uy5ibXcdnMw19lVtGxjIXqIb41wHOSaH+obMVGXXCYAhkYGGjL3vQEbt3EJq2xBieH063Msjsj4tATo
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V0JxWVRKalBHVVNIcnFaSSt5eU4vYkczSVNKSzRibHliUWttUTVLMDBUeUt1?=
 =?utf-8?B?RFJ1SlN0a2NleVJ1RlBDQnhFNjgzUUpRdDhvM1llZUtmeXlMdkZlSkV0UUxl?=
 =?utf-8?B?K0pEQlZDVFZjUWxDTUVWcjgyd1hVKzJWNUhhMzAzak9vZnJkTVFSZEJjMGpU?=
 =?utf-8?B?N3BkRUYzVFpKaHRXTWl0QW9KbG5vNndBWHdCM1lRSHR1T0ZSNERQSUhVRmth?=
 =?utf-8?B?L1Fmc25oNklsMlN5MlkwaTVFeFc5Wm8wWEd0SGwyRDUrQS94blZ2R253QzVh?=
 =?utf-8?B?NmxuWStHVENzV2dHc3NlTXBLUTVwRlNzM25MbDU3eGFRTFRHVUpJSXpsWHdN?=
 =?utf-8?B?SWFBRnpkM2lzN2NTckpVYW5WZURNZndvN2g0ZUFSMVQ0MXRYSnlNYXZBaUEz?=
 =?utf-8?B?VkNQUEk2NDBWL0ZzWlNkcmpJaFFtN1dIRVN4bW14T1J2Y2NKQ0p1elpmNDVz?=
 =?utf-8?B?NTJuWlhRVm9HVTBuMHVqMVFXSi9lajVkc05mekpldXh3aVdHcndsbHJNejlh?=
 =?utf-8?B?Z1ZWUVRzZ1ZENXNHRDliQWNaYktLOS9SdTBxMEh5b1pzUTdPR3JUdE12aUFM?=
 =?utf-8?B?UitIWEtYQllUdXAvdFU5YUIwNGZOWGo2czNOL1pldkZCWWg3Ujk4QmVJYjRR?=
 =?utf-8?B?OHVUMmF6YUluL1lZR25KYmhTblpOLzVrV3dtOUtLT2hKTElXTk92dFp2Q1p4?=
 =?utf-8?B?cEtteXNLWDlwcW9wRmt1cXI2V2FaOHdXcE02SGdwY0RqNThrQTBRSzhLZ2Jq?=
 =?utf-8?B?cjM4QWhpWjg4WjlKdUxjeVFvZ00xc2JZSVRVQzZQT3NHVVpOQ2dkeDlIVUw3?=
 =?utf-8?B?NVNPUU9NdVZ3Ulh4SGVqelVsM2RPMldkU084OUhUbDB2ZVlCdHhodGQvQkU2?=
 =?utf-8?B?MVpqalBzS0xBMlRCUHJzNW9uSzhveEI4bEwxakVHSjRUc2R3cjUrUjFjR1RJ?=
 =?utf-8?B?MVp6MlUvY2lXWTR4ais1cWRUTmJFTnhCNVlZdkdhUE9IU2FlbTBmQVU3TTBW?=
 =?utf-8?B?c09xVFdEV2VITFdRVFlPUmlWMEVXeU5FNE55Ri9YYTA2aG8reFo5Tlhqbmxa?=
 =?utf-8?B?ODREUXl6Q0xTTk0rSFhUT1RhcUlxNkZ6ZzZnNGIvSzk0UXd3cmhsaC9DK2tI?=
 =?utf-8?B?SFhsYjFwaDJQY1kxbnZRNHVGaDBoM2dUaERwRW56YTB5dlVFU0pYcmxiYnV3?=
 =?utf-8?B?OWloR09IK2NKb05wZzJobWdhWGFNSTZSL0t4bGphdW1YczJRcVkzaS9KR201?=
 =?utf-8?B?bVhmcE1lY0NUZERnTmN0TFJFRkg2MEVMNGM2SnNCeDFVNTFNd0RHQ2FrNGJ2?=
 =?utf-8?B?K0MvRk1NeFJ3VGQ3WUVjN0l3TGtKZjlLUTJJcjIvNVhiQUZNSFhCeW5WcVN1?=
 =?utf-8?B?MTJxVXU5cjRNYWovU25PSmY5UWxpNGQ5akl1dk50ZWZGbHp5SnFCMm10YXBC?=
 =?utf-8?B?d2pjK2xLak9kZURUVG9ZZkNTSHBwRHNvM0VTNFVVUU92TkNzT1hCa2ZXQVBF?=
 =?utf-8?B?cy9KN3VMRVRMSXlpRThoK2d6a2pPcnI0ZkhMN3dtVlpJZU9wNW9ZemxnVTJU?=
 =?utf-8?B?a0V1Qk1BUlJ1WjBBSHdqVU1MT3FNMGQrZnUrb1ROVys5QTNZQWd6NnRDZlI5?=
 =?utf-8?B?RWFYenpBT1dMMTNxdm5hNW9veHpxajc5eEpxaEhLSmRqMVVLbS8yK2ZoYk5i?=
 =?utf-8?B?V0plNldSQ0gyNWtWZDhsUkxhWUg5dlVLRzNLckNUU2xScm9KNVUwQ3VPTitp?=
 =?utf-8?Q?q4E0JMXABU6R4kTpgk=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-80ceb.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: de6019a3-c598-4282-c1ab-08dc18be496f
X-MS-Exchange-CrossTenant-AuthSource: AS8P193MB1285.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2024 07:14:33.8063 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXP193MB1438
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jiri Pirko <jiri@nvidia.com>,
 Jakub Kicinski <kuba@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v2] net: stmmac: Wait a bit for the reset
	to take effect
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 1/17/24 17:55, Jose Abreu wrote:
> From: Bernd Edlinger <bernd.edlinger@hotmail.de>
> Date: Wed, Jan 17, 2024 at 16:48:22
> 
>> I don't know at all.  And actually, I am more concerned that other registers
>> might be unreliable within the first microsecond after reset is de-asserted.
> 
> Are you guaranteeing that the documented PoR time is achieved before reading registers?
> 

Yes, that is the idea, why I added the udelay directly after releasing the reset,
thus simply delaying the execution of the stmmac_hw_init function, and not directly
where the synopsys_id register is accessed.


Thanks
Bernd.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
