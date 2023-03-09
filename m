Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FEDA6B25A0
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Mar 2023 14:40:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C639CC6A60D;
	Thu,  9 Mar 2023 13:40:44 +0000 (UTC)
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2124.outbound.protection.outlook.com [40.107.96.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DFF94C65042
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Mar 2023 13:40:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h2bHRrDeF9FD8XxJbGa+AJgC4/lRt54Cwf4oofJxnjIx3uy16NUcpGQCxAvkYFx9J5dj50GWcm0b0kHfw/nLVuPXdRse1rVtciq/i2v7WDojXpLdAY7uStqn1Pw3T+A0fYpBYccoIRPFsZZWmkUiF/9Vgl3ffydD5wRN5ecRCW2U03/WFTs7gQs9iMkeKYNWNIsOgiBZcktHw59pGCPZcGeeNfFKEJgm1VzlQcGfPEQO+IQAiKTigXXDzFZwfeS22jStBLRPehOWeM1XHI3QCYBJL+xcoKK8OZNJojytMSf+AKZeYEwHfs+O/TZysetx5TDKJQTJ2Tblc7BEPShDdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eAoiYdj5XO5HY8fbXMDjjrjbKvQFDLqr4nM16eeJphA=;
 b=NRGRE7K65nU00NMnJvdhGeJkdrUEs6PS/Hs3GXmjx/ZsTMZjr0K7pKe1iZZ+7S6rQ9OLFcm+RclyR3VhjVGuHpsGKfEDnfqtUzorXsgvhNbBhpzTi2ZAM74r8NS+12NnNQ/CW4eP3VvZGa3lssue0ID0pI22nGjaHPI5kRp55evU9BcGePmhX4e7+FmII7/haDdpVfGhukTkWmE1bSMSZlfqG0JGIRNMLAWcKI2zHhZUQCYbEH+Y+d0F2dLZ4t25hXJHWa25xpyrRGHmglH60ceITStAVkvxGDmEaNev11DFTpQgLXdNiWWbgKGNOebYCtuNE76XU1l9GjD9K1q2pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=corigine.com; dmarc=pass action=none header.from=corigine.com;
 dkim=pass header.d=corigine.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=corigine.onmicrosoft.com; s=selector2-corigine-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eAoiYdj5XO5HY8fbXMDjjrjbKvQFDLqr4nM16eeJphA=;
 b=XOT3uNl6gKHB/cE5JtaRjt027I467yzPP/mrHm5uRt/t1bFf3BSvN9+J9sLlwvYkL0JyO/RpLPh9eoOHzzvZEPqhq4JGUBVrJd8mtcaLXH4JZUs7BN1W9575QHb0b33HVtjaKBRSAYXbS2vkHQcdMGh4kihD5UwC8p66rCSismI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=corigine.com;
Received: from PH0PR13MB4842.namprd13.prod.outlook.com (2603:10b6:510:78::6)
 by CH2PR13MB4412.namprd13.prod.outlook.com (2603:10b6:610:61::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.16; Thu, 9 Mar
 2023 13:40:41 +0000
Received: from PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::85f5:bdb:fb9e:294c]) by PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::85f5:bdb:fb9e:294c%2]) with mapi id 15.20.6178.019; Thu, 9 Mar 2023
 13:40:41 +0000
Date: Thu, 9 Mar 2023 14:40:33 +0100
From: Simon Horman <simon.horman@corigine.com>
To: Leesoo Ahn <lsahn@ooseel.net>
Message-ID: <ZAnh0TGtDkVUl/1m@corigine.com>
References: <20230308162619.329372-1-lsahn@ooseel.net>
Content-Disposition: inline
In-Reply-To: <20230308162619.329372-1-lsahn@ooseel.net>
X-ClientProxiedBy: AM8P190CA0006.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:219::11) To PH0PR13MB4842.namprd13.prod.outlook.com
 (2603:10b6:510:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR13MB4842:EE_|CH2PR13MB4412:EE_
X-MS-Office365-Filtering-Correlation-Id: 18f7af00-7026-4cb8-a1d8-08db20a3dfbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Urh7pR8EZzKSmRKAgdH+FNzyVQ3zqPoMZ3pRqKgRLSoWlaRtgimq7mM8Whc4ko+7rezqOQaUYDqHdiGJC+eiXbngHwe3FB/Qh1O/GGGzDp9cKw7Y32VY3u48g8ED59iKp/nFuVTSwtyQxDzNm1tKJw+glu45jcLKPj8NICOr8MC7EUHdXuSMMA8VV0wN6AYWC2GXvHlj2t5SioFdgK5S50h+ziqn9H/7IltWyhEmLIsuYCHIWma0x2R2BCIaZCwk9jwusNdMRibklN9phyeedU2tRGJgtDK4fqPbu1YI4Vi2YgxNZcDSCjvPMZC4qQRfqDqZILeBa0SN+tJuvUuJ1Cw+gbsIDS65255L/0TOvQw7T5Mf33tPF0sZLVxy260SWjLcfu4T8lb+Tcqwbwjbk6/+duxBWZS5QRFUVJ+m40V5YK6g1UB0OTbthGhtKvgdeF+LsfHboUlses7EbT0M6dKqpbbL85xWIPXGk+7kho8604Fn1sfw7ApiQXUdENSEwnxlCECT7bdzXYYKx6gm55vxMd3roQg29Ms2aPHatSAmUZ/pQchsuwTAGf4ulfux4xOvlaFoTbt9dMyWr9oSMe71AOQcMQGRwyWwwWCc3Huzea+mDD17FrGAnIxr6giD
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR13MB4842.namprd13.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(136003)(346002)(366004)(39840400004)(376002)(451199018)(2906002)(6486002)(38100700002)(186003)(966005)(6666004)(6512007)(6506007)(86362001)(66946007)(41300700001)(66556008)(66476007)(4326008)(8676002)(54906003)(478600001)(6916009)(316002)(2616005)(7416002)(44832011)(36756003)(8936002)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NmttajZFa1kwM05JQjFidlAzVzJTMUU5MlltdU15QmN5eENiQWdLdnlmYlAz?=
 =?utf-8?B?dHlDWklnOGxEak4vZnl3ZnFZeHV5ZlBCNU9aYnlISWFrT3BrUmJSNmFHZEVK?=
 =?utf-8?B?S0JSejlEZHR1TkxCZTRzUWhzTXc3d2dsSW5RdlFDa2ZEaXU4eWRuSHg0dm1y?=
 =?utf-8?B?SWFXanEvZEpGeEhPdFhuZHVCZXlWWWRZb1VLaVhpd1pYZThlQlZxTVVVZTVS?=
 =?utf-8?B?aC83VlFlbnZIcjg0Q0tLa0lTb2x1QlF5bFJ4N1BkNkMvQnhIZ3AxUFlVc0o5?=
 =?utf-8?B?SGw0SExZdG9Hc1JnWklDdWhocnVsSnllcUdsME9Zbk5uaHJSSksyMEdMN3ZF?=
 =?utf-8?B?d3E0MDRGaUFNWStYOUJ3RHBISzBocExHWmhvS1VGMjgxc3IxREwwMWc1b2Jn?=
 =?utf-8?B?Y1FSWTB3aG1SZ2JVdENiT1FXZmE1ekZ3RWRVejZFU1dGUy9jbm55Syt2bkl5?=
 =?utf-8?B?UDNWYWxidjdJVFBxZXo2ZGc5NHlXUVJDZEFqSlM1OXhJUkFjSk1JTXdsUkMy?=
 =?utf-8?B?Nk1XQ05pdi9NZ1BlYzZ6QTdZQ3ZoL2xEUTB6ejdCbVpRTGlrOGw2emZyQStT?=
 =?utf-8?B?dVpJSmJlbitjNnFoWTQ2THE1UldJcG5Oejd6OTU3M0FacS9SaGZ1WXdHY25k?=
 =?utf-8?B?enVEVW5DZVpKajJtVHhvVFFYbzFOK0lyd2FndXVwdTIwNW5wSHlGdUEySjRR?=
 =?utf-8?B?T0ZGMytVQ3RSOCtFNWFIbTA3RU9VcGhsa3FqUHZSeThwakEzY1RLWHFIZEhD?=
 =?utf-8?B?d3VtWHZ6WU1LNFRZNVB0d29lK2xhVmJwUUV1VHVLemxQNWNKWWJTdm81RkdE?=
 =?utf-8?B?TENDVDhxa3RYaEZPMVVwekhDTVNoYXNnbWRQaXVDcURhRk1KRFQ4eHZkbXJn?=
 =?utf-8?B?eGg1SDJRZUFsN1p4a1Fnci9NdUZEQUthVkQ4dERHam9vYnd3M0hDNmxWYk9h?=
 =?utf-8?B?OWpXUU0wazZDSSttRm1ubWY5YnoxN05ReUt3dGwrM090cEp4RUpLdDV1bExD?=
 =?utf-8?B?MjRycWMwMVRjRkF3dWJBUHVlVE41VGVTVU5UZWJvSlY1T2RVUkVBRURLdGZU?=
 =?utf-8?B?aitGQVZ2cnhvaU55MkQyS0xudlBHWDJoN2xMUVdvR3dSaFZxVE1pYTVPRlEr?=
 =?utf-8?B?ZTh6VHozTExDUlJSL0lKNGh2K3BOOHV5TERUTUJkY25sbGh3T3pWNk1lL0FH?=
 =?utf-8?B?OFpha3M4SmhJd011YWJDdFoxVEhYK2lBSGU4ajBXVm84a2tqeWRuNEl6cFYv?=
 =?utf-8?B?ekNwZ0FsQkc4V0orSmxXSnluQ25OMXFBNTk1TWRtSHUyTVBwSytkNENqRmFm?=
 =?utf-8?B?ZCthSzFCU3pJOWNLcUFOZTlCYkRrNWQ2QTYxRW9nT2pBNXBLUTZ3WHdwNFRU?=
 =?utf-8?B?YnM0a2RNYmJtUkRZQTJaUmlwNmV0M2tTZWNnWmhhamZWeXlqd0RpZjJndFhS?=
 =?utf-8?B?RlJNcHcyQ05yRkMvVXo2aW8yR3pObmJ1eTBjZENZMmR5UjZQdFVIbUZFQTJr?=
 =?utf-8?B?YlpqZktpL2xvdFc4ZUlvd1ZOZE9KTHVIRTNqUW85UmJqdHVkRWNXTDNQSEtN?=
 =?utf-8?B?SndMV1RMYlB1MVRCTnRlNDhONVU0elRFaVR2V3p0MTZvNDUxVFozeVArRjVx?=
 =?utf-8?B?dzlvc1Z3SU9XSXEvRi9TckhtQXZQcGZKdGpiN0pKa2JIR3dmMjh6VkRQVnFz?=
 =?utf-8?B?emZFNDVUeHIvZnZRK2tNN1VaMHQwRE1COXRPU1owaTZqQ2sraTZsVmRKamFu?=
 =?utf-8?B?TGVCU0dhUkdDOXdmbDRjREN0ZWd4cWVFb3dydFI4M3A5T3JSblJ0bzZFWi8x?=
 =?utf-8?B?cVNhNDM2cC90ODZUa21rYnQ1MTltZ1o2TzJXTUoybmpWWUVQVjg3WkF5aDlm?=
 =?utf-8?B?cUoya29FVlZYUlBsOVFDMnRmZEVwZWxoTjZxY3lha29sWW0rQW1uOWJzcUFr?=
 =?utf-8?B?eEduMTJDMHczVGw3VjMycEdVOTZGUHh5Vk50dDVuTXR0MzJ4eDNOMWM5VEF2?=
 =?utf-8?B?U0dwQ0lOQldpVVAzTWczZmYvOGo5RFZVLzBaVWM5d3Z3ZkJoZnNBT3M3SUxU?=
 =?utf-8?B?SUVIdFdEWGN4QlB2NW9IdjJ0L2lCQnpXait2S09EVXFyYTlaK2lZa2Y4dEN3?=
 =?utf-8?B?K0k4MzlkcThOT2plckZpamJ2Rk92aldwYjFnNldHdnJPVXRoK3hzYmRPM1NM?=
 =?utf-8?B?dmpPQUcyWFRDa0ZwTDI4Rmx6Z1pXa2k0bWRrbEFZSUU1K1JrYlAxZDcrTjNT?=
 =?utf-8?B?WnN2eHhvMDBOSW5udTVYM2Z3czFnPT0=?=
X-OriginatorOrg: corigine.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18f7af00-7026-4cb8-a1d8-08db20a3dfbe
X-MS-Exchange-CrossTenant-AuthSource: PH0PR13MB4842.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2023 13:40:41.0346 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fe128f2c-073b-4c20-818e-7246a585940c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WQ44CydNN2c/fEzcPKfamF42PPCc68wSYwUVa5WnLEpyZZ058Onmeb1E1CEeWUZF+d4v8hZSKF3Kz3avh1bJGxPx/wWlgHTR6Rr+cAohEhg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR13MB4412
Cc: linux-kernel@vger.kernel.org, Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, bpf@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: call
 stmmac_finalize_xdp_rx() on a condition
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

T24gVGh1LCBNYXIgMDksIDIwMjMgYXQgMDE6MjY6MThBTSArMDkwMCwgTGVlc29vIEFobiB3cm90
ZToKPiBUaGUgY3VycmVudCBjb2RlYmFzZSBjYWxscyB0aGUgZnVuY3Rpb24gbm8gbWF0dGVyIG5l
dCBkZXZpY2UgaGFzIFhEUAo+IHByb2dyYW1zIG9yIG5vdC4gU28gdGhlIGZpbmFsaXplIGZ1bmN0
aW9uIGlzIGJlaW5nIGNhbGxlZCBldmVyeXRpbWUgd2hlbiBSWAo+IGJvdHRvbS1oYWxmIGluIHBy
b2dyZXNzLiBJdCBuZWVkcyBhIGZldyBtYWNoaW5lIGluc3RydWN0aW9ucyBmb3Igbm90aGluZwo+
IGluIHRoZSBjYXNlIHRoYXQgWERQIHByb2dyYW1zIGFyZSBub3QgYXR0YWNoZWQgYXQgYWxsLgo+
IAo+IExldHMgaXQgY2FsbCB0aGUgZnVuY3Rpb24gb24gYSBjb25kaXRpb24gdGhhdCBpZiB4ZHBf
c3RhdHVzIHZhcmlhYmxlIGhhcwo+IG5vdCB6ZXJvIHZhbHVlLiBUaGF0IG1lYW5zIFhEUCBwcm9n
cmFtcyBhcmUgYXR0YWNoZWQgdG8gdGhlIG5ldCBkZXZpY2UKPiBhbmQgaXQgc2hvdWxkIGJlIGZp
bmFsaXplZCBiYXNlZCBvbiB0aGUgdmFyaWFibGUuCj4gCj4gVGhlIGZvbGxvd2luZyBpbnN0cnVj
dGlvbnMgc2hvdyB0aGF0IGl0J3MgYmV0dGVyIHRoYW4gY2FsbGluZyB0aGUgZnVuY3Rpb24KPiB1
bmNvbmRpdGlvbmFsbHkuCj4gCj4gICAwLjMxIOKUgjZiODogICBsZHIgICAgIHcwLCBbc3AsICMx
OTZdCj4gICAgICAgIOKUgiAgICDilIzilIDilIBjYnogICAgIHcwLCA2Y2MKPiAgICAgICAg4pSC
ICAgIOKUgiAgbW92ICAgICB4MSwgeDAKPiAgICAgICAg4pSCICAgIOKUgiAgbW92ICAgICB4MCwg
eDI3Cj4gICAgICAgIOKUgiAgICDilILihpIgYmwgICAgIHN0bW1hY19maW5hbGl6ZV94ZHBfcngK
PiAgICAgICAg4pSCNmNjOuKUlOKUgOKGkmxkciAgICB4MSwgW3NwLCAjMTc2XQo+IAo+IHdpdGgg
J2lmICh4ZHBfc3RhdHVzKScgc3RhdGVtZW50LCBqdW1wIHRvICc2Y2MnIGxhYmVsIGlmIHhkcF9z
dGF0dXMgaGFzCj4gemVybyB2YWx1ZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBMZWVzb28gQWhuIDxs
c2FobkBvb3NlZWwubmV0PgoKSGkgTGVlc29vLAoKSSBhbSBjdXJpb3VzIHRvIGtub3cgaWYgeW91
IGNvbnNpZGVyZWQgZ29pbmcgYSBzdGVwIGZ1cnRoZXIgYW5kIHVzaW5nCmEgc3RhdGljIGtleS4K
Ckxpbms6IGh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvZG9jL2h0bWwvbGF0ZXN0L3N0YWdpbmcvc3Rh
dGljLWtleXMuaHRtbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1h
bi9saXN0aW5mby9saW51eC1zdG0zMgo=
