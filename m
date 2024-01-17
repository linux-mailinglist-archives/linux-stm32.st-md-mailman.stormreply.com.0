Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 25879830B6C
	for <lists+linux-stm32@lfdr.de>; Wed, 17 Jan 2024 17:47:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C8468C6DD73;
	Wed, 17 Jan 2024 16:47:29 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04olkn2102.outbound.protection.outlook.com [40.92.75.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C1257C6DD6E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Jan 2024 16:47:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Eq9Fkaen5QTclbzBoihVQtnngJZlLtc/gbQBVPBwbocrFdCixxmodGyF5p9H6+fCY63mx709a9YUcIx9muZraIEH1NJBWm7meL0vpe+oRCaoYMEXsOuepphfvgYO5QcfANBcGyLan/I74OqUl/BrP1LTplepkTFLlqXzV5QVZ/hRwwb+pQw/CCOKziI8mBipKp1OIPfn2yyKbD8xfwjCJHMDrjvHJvjGZncpHdwWVdSSYkjV8VwC7HKCs0cWurHKS9YUEnxm9ci0qv1eiXaHW/WxHQ3VDo7YDNn8ooI79MvIv4fdQcoDVt2fhuJHPLz0xKVk72Udh6VP+z2/6NT+vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SON1owT1/DioZ7mRVLuf6NxiZTP1z2I3grXoH7Ns5UA=;
 b=UKFaHDS/uPFRw+psCWLd3jHmv9n0+9W6UWwCz16J+L3xS1ZcbI0pgjuRtZcycU9ESfh2FLsMnvX/5wEEhyOQCam3eceJrOuRvUdFDxkqLKBoL3+PhryQef0reLEU2X9o1tX3WUc2hTfGCarnGNNqHR32s2DGnpQanRogh/DWWSn+9g9DFVZiNBCzZTRpajjgsEgtTq3MvjE5U0QcgvnRFv3d65mCjbxKu1lZPOC7wm/1j4iKRoW1m923GyzZ8iltgDBbFbTHdTYIDX62yQycCBdC2qY0lBiFuuBxZk73wxMLgyQZOTLlyH2hc2umC/6t/HCZAii0vhHwWIS0OIcyaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from AS8P193MB1285.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:333::21)
 by AM8P193MB1202.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:368::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.23; Wed, 17 Jan
 2024 16:47:26 +0000
Received: from AS8P193MB1285.EURP193.PROD.OUTLOOK.COM
 ([fe80::897e:cfd5:b29b:c611]) by AS8P193MB1285.EURP193.PROD.OUTLOOK.COM
 ([fe80::897e:cfd5:b29b:c611%6]) with mapi id 15.20.7202.020; Wed, 17 Jan 2024
 16:47:26 +0000
Message-ID: <AS8P193MB128591BBF397DC664D7D860EE4722@AS8P193MB1285.EURP193.PROD.OUTLOOK.COM>
Date: Wed, 17 Jan 2024 17:48:22 +0100
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Andrew Lunn <andrew@lunn.ch>
References: <AS8P193MB1285DECD77863E02EF45828BE4A1A@AS8P193MB1285.EURP193.PROD.OUTLOOK.COM>
 <AS8P193MB1285EEAFE30C0DE7B201D33CE46C2@AS8P193MB1285.EURP193.PROD.OUTLOOK.COM>
 <6e33c038-45a7-4941-b5d9-ce5704e13d48@lunn.ch>
From: Bernd Edlinger <bernd.edlinger@hotmail.de>
In-Reply-To: <6e33c038-45a7-4941-b5d9-ce5704e13d48@lunn.ch>
X-TMN: [MK2bao9eRJ0T4QnzDkecUkPazn0jCA7dF9EjOYpb8BBK5ccWsEzCeiclUSefSSOW]
X-ClientProxiedBy: BEXP281CA0013.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10::23)
 To AS8P193MB1285.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:333::21)
X-Microsoft-Original-Message-ID: <f992bc4a-e871-41a8-bab2-69093e991e4f@hotmail.de>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P193MB1285:EE_|AM8P193MB1202:EE_
X-MS-Office365-Filtering-Correlation-Id: 562a42a8-8f36-4410-3360-08dc177bfc49
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8SBNLY1nKyzAVXv6OjxihSzf9rqgH/0TyM5QwFK63QU1IHZrYfGNGdDeJffgA9ZP5mNWlwZLJsJIFIL4JBUMpu012KjaCy5RKc5JOGVC7cTVg10Qv8JYyOwr7KLcyDqY8TtFu+KgzFDjRnP1lcjMLT9wmiUn2ovO5dRidzx+aWdAk0p1bpBtSQ0jX9vuputB4m4n6u76YJwONy63I073/Q1PU/5C9HuJ7mWYmPkEWPvVpXcub3G2zu9rpQxzEvd4OCKroBtMPCJ7nS9iU89wJCeRzdyMMRcmLqunZPxa8FNo5Zbp0UCKXXLNv2ZpOh8W520SwcgOdB7goT/DvnCXGK0HDBWwXxHdT6+jawn2AJmSP/w/J5ZDwZ6pW+8vhtc/ztjvSeV4k4Hi+03hRzeIB/1+C4gH446A4/1EkjSN8+LzVaajVBKoezCiQ5hIT3+LMm477lswsIt0Y57fC7NY3z/LygKMm8pnNjWYiYvAzOHeaWlAafEve4kuVCc28yi6MnFNtTu5xFabQtJ9TFebnPELYwYcTfjgrkHgab4Kkx+G12Stt5ftThQyjF5Zwe7i
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dkpyVXJOT1gvalNVNFg1a2Fha0tvOWlCbkdGVjBscERMVnh6V0d1RmFPSlJ5?=
 =?utf-8?B?QlM0cGdCRGxzSUN3enVnNktBaXdGM25uRFZRNmZLMWYwT1YxUGRlRXE5eTZa?=
 =?utf-8?B?bWVOVFpyMUs3SG1qTnpEOTlVSlpUQW9KYXM2eVNiV21QVHF1RlVubit4RVlI?=
 =?utf-8?B?cTdsTWR1eEVQc1BZR21oTDFja0htcS9ueVhzaThZYzUvckhiNmdEa3BnY3pJ?=
 =?utf-8?B?YjBxQnE1WUFIOWVmT1VISnRqZXpzYVUyN1R6a3VzVXV2SUlqa0E3QXh0aXlT?=
 =?utf-8?B?ei9yNDk3L010WHJRaGF4TWszQldaSCtwbHp6My9xazJ6NnVuU3ZrQ3NlTFZZ?=
 =?utf-8?B?aE4vcGZBbGRUTGhxd1NJRVE4YW10Q1A5NTNRR2RMZnVoVmRDZC82dkhMWXd4?=
 =?utf-8?B?N0dLUnp2ZVNUcHhUOFhOamVuQ2VabittSC9IT1Vjc2NJUXBvcVFhVVBFYVhJ?=
 =?utf-8?B?R0gvdlBKQmNhSllRa2ZTa3ZSVmFHQitvcFlucEtkajZMeWxlTjVBN2t5N0k1?=
 =?utf-8?B?S2NEMEhudHJWaDUvV3lhakxSVlFDTy9vYmJmTWRyMjVjTnNPbjN6djRuK1Y3?=
 =?utf-8?B?OEk1MW5pUkJuRTdaNHV3alRZNmZFMXdFSFYyOVRoejQ1a2RadjY4UGlydDFo?=
 =?utf-8?B?T3lIc1lQbmhNU3BHaitZNTZJYlhwTHV0b09SUG1BaWVjQUFqYjZKMDZjbWJI?=
 =?utf-8?B?YjNUZVk4aTB6TThqWXpsNkhJMTJvTUtGeFE5am4za3N4bFVXNmdTWm1rOFV0?=
 =?utf-8?B?ZlFrMU40NTdwQWlyaHk1Z0hlNi82NGhWWEd5VEVaTG1uaEtrbFVxbm1tVzAx?=
 =?utf-8?B?dENUTlF6UGVwdGQ1L2VCTDh4dUhKQ0VwT05HNDRSSUhIRDRtM0dDYS9mUFNO?=
 =?utf-8?B?SkhZVjNhT1ZrWnQ4a0ZzVHR2ZS9CbFJTT0IwTTJpYXIyRHc3TnVTcVJ2Tjd6?=
 =?utf-8?B?ei93MDBxVDNkazFEYVJCTXJ4MVB5UXFiSUliajVSakxBbk5UK3hMd0JOTnNq?=
 =?utf-8?B?ZUQ1SndzbUNJU2Q2Q1haRW03L1k2SWQvb21yNVFaMDV4OEt5b2Q3SUpzUnl5?=
 =?utf-8?B?OEZlaDRwdlFpb1Z1MzBmaGpkTmc0VkRPTTVjZjhtaEp3RVhCVHppZm91NDJs?=
 =?utf-8?B?Z1pQbVhSdmtXM3E5Smd4czViZWh3anNVR2NnMXNrNlVZcWJiOFAyVmlTRVZ3?=
 =?utf-8?B?a3VNYnNnWVhZVGZHZC9xZDFqU08rQ1lyMHlkU2xrcThFb3NlbzJwazlSNzlt?=
 =?utf-8?B?ekszWUtURlI2OTJMd0M2K2dkTTFLVGFUUzVLRU9OYWlIR3pxOUJXZUg0eExH?=
 =?utf-8?B?OHdZNXp2ZWF5dmlmSUFDcXdjUnNZUUhsY1NIMXU5cUpUd09SNUIva29tQ2pO?=
 =?utf-8?B?aFltbnBkaUlZRGt6YldzSGhyVCt1QU1ONEJHYWFkdms1VjRZSFBQT1JJQXps?=
 =?utf-8?B?UVpEZ0xseHRWSFJ0dkY5SWZidTBsblEzOVEwWXBKNlE2MzhObUZEcStQQ1BC?=
 =?utf-8?B?VkE3dDlPTTFQc0E4QllxMGo2NjI4eDlxOFdvYzRRaGhLSVFSaktZbGp2cTdU?=
 =?utf-8?B?UFU4clN4OG9NZm96d0lIRjQ3MllXTHNYVWQ2eHJHck81QWwwS3M2SXlvdkFR?=
 =?utf-8?B?Q2hxTjZvbnNrWlQ3THgvVzVKVytPZnNETDV1REtRK0owbkpEU0NZeHdBMTdD?=
 =?utf-8?B?cjlVMGR4RW1weHF5cWNTaHdtU1g3cnJSOWdXaTg1ejR6NlVIcTlqZ25Ma1lE?=
 =?utf-8?Q?PAqUCCIKA1N3Fl/slY=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-80ceb.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 562a42a8-8f36-4410-3360-08dc177bfc49
X-MS-Exchange-CrossTenant-AuthSource: AS8P193MB1285.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2024 16:47:26.4878 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8P193MB1202
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jiri Pirko <jiri@nvidia.com>,
 Jakub Kicinski <kuba@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
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

On 1/16/24 23:35, Andrew Lunn wrote:
> On Mon, Jan 15, 2024 at 08:21:42PM +0100, Bernd Edlinger wrote:
>> otherwise the synopsys_id value may be read out wrong,
>> because the GMAC_VERSION register might still be in reset
>> state, for at least 1 us after the reset is de-asserted.
>>
>> Add a wait for 10 us before continuing to be on the safe side.
>>
>>> From what have you got that delay value?
>>
>> Just try and error, with very old linux versions and old gcc versions
>> the synopsys_id was read out correctly most of the time (but not always),
>> with recent linux versions and recnet gcc versions it was read out
>> wrongly most of the time, but again not always.
>> I don't have access to the VHDL code in question, so I cannot
>> tell why it takes so long to get the correct values, I also do not
>> have more than a few hardware samples, so I cannot tell how long
>> this timeout must be in worst case.
>> Experimentally I can tell that the register is read several times
>> as zero immediately after the reset is de-asserted
> 
> Is zero a valid synopsys_id? If its not, maybe do the wait conditional
> on the first read returning 0?
> 

I don't know at all.  And actually, I am more concerned that other registers
might be unreliable within the first microsecond after reset is de-asserted.

As I mentioned earlier the VHDL source code is obfuscated and I cannot
tell anything about it, maybe people from synopsys can shed some light
on the issue.


Thanks
Bernd.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
