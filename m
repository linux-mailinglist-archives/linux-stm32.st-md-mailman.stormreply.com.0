Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B572F7129
	for <lists+linux-stm32@lfdr.de>; Fri, 15 Jan 2021 04:51:01 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 00154C424C0;
	Fri, 15 Jan 2021 03:51:00 +0000 (UTC)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2047.outbound.protection.outlook.com [40.107.92.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A5D0CC36B37
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Jan 2021 03:50:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dSBm2/f5l5E7/08dIe8bF4pxI4b1BwmP1DJO+NfM3jSjtR2g6MLOdtbEEbwLl38H/SZaD8DLLVWfpHCZxoECPnJ6GMSwo6jKW7yeHL8YiX9LR43oW72N/OMRGC+ml3eQjN2KyiGfjEZwotvtMAXdq3o/8jrvoO8z6i0KenTPuLR9fsNIFluklt4oBgeaCFWiSRBcLTNhEQoazT0G3nC77UVPLjlaKZRPNCzeyEOm/CPwOOOBQ2p5yOBsgxM0gBImdpaZPU+c4H6aZYf4RFfBrEpMK8Wc6el8qKCzJZmG3StbDv9dRv9M2vOCjmqkk8GXps9++w/soIUVYOWbNhnIZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oP+OWISoctf3LsgM/ywx4HyZFHZdBYUpWIfjLCWuv9g=;
 b=nONO/RNnYXmIA53I3YB7XVhOT/J5bweb3ShnQIEtyF/PPImMTYTmMfU+gwl3INa8IMMdRK5KIdf4X3YDxu4DMXxlVHQxnTaIrZpidVYX0P58HQprrhQv7XyW46rUXkZLR3i/I46SMroduTZV4EyHheO+JeVY5M0+iCjfefYt54NXXZBNjVDaV+kYTqzAuvpaXC/NK2uzN4X+IQ+87pLJx5dm8uAwflM5g5cx36cUAlggFEWiLwYa2RjWbKXXPGqIM1zQvvt10KKgVjNCzBo+TIYAW2aK0sGNPYcQwJGa+ThTvyQY4Gu4t0zTH4aeHZW3YD/mQoFKmqxKvqm7lQNkKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oP+OWISoctf3LsgM/ywx4HyZFHZdBYUpWIfjLCWuv9g=;
 b=JZMm2frla3aw8ZeF2PKVLbkH+g3YTaYx0zMgvPScSVPkAmVylEvfHWWzWCKvhD8hJF9pAl2bqnUud/o9fpCV7xPCJEE2MwjWKPehhpy3+RuICJqMDrGf3nPleehXLJYaeknlWUB3MmJX2Te7jlR51+ev5Hhljlx8uFuaSyoowfU=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=labundy.com;
Received: from SN6PR08MB5517.namprd08.prod.outlook.com (2603:10b6:805:fb::32)
 by SN6PR08MB5631.namprd08.prod.outlook.com (2603:10b6:805:fb::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.12; Fri, 15 Jan
 2021 03:50:56 +0000
Received: from SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::972:c257:aa68:9be0]) by SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::972:c257:aa68:9be0%4]) with mapi id 15.20.3763.010; Fri, 15 Jan 2021
 03:50:56 +0000
Date: Thu, 14 Jan 2021 21:50:50 -0600
From: Jeff LaBundy <jeff@labundy.com>
To: Lee Jones <lee.jones@linaro.org>
Message-ID: <20210115035050.GA27243@labundy.com>
References: <20201228163217.32520-1-post@lespocky.de>
 <20201228163217.32520-2-post@lespocky.de>
 <20210114100312.GL3975472@dell>
Content-Disposition: inline
In-Reply-To: <20210114100312.GL3975472@dell>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [136.49.173.128]
X-ClientProxiedBy: SA9PR03CA0016.namprd03.prod.outlook.com
 (2603:10b6:806:20::21) To SN6PR08MB5517.namprd08.prod.outlook.com
 (2603:10b6:805:fb::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from labundy.com (136.49.173.128) by
 SA9PR03CA0016.namprd03.prod.outlook.com (2603:10b6:806:20::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3700.27 via Frontend Transport; Fri, 15 Jan 2021 03:50:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c1a831da-fe7c-41f0-cc0f-08d8b908c31f
X-MS-TrafficTypeDiagnostic: SN6PR08MB5631:
X-Microsoft-Antispam-PRVS: <SN6PR08MB56317AE91CD8649D1F10B816D3A70@SN6PR08MB5631.namprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:913;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AVyIz+G7UrKBI6TenJROJmNzfpRqgs7DXtgfJQeDmEinlJMyQPNTvJKKOPWYaMvq0X488pztfHcSsxYKwgz2gxyYavtdQ6Hnle6d7gdvIvbqa6nIH6k3aLSf6lDKZbsGSK0/5TRA9E4on9tsIW0GJCVkUuG+AtV2Q5Pcbw16ciIy4J9r9ihfeMTUOlZ3Y1pWnYoy5njucQDu1NdslWGW1sQURRrlISgHtwEI+AE/cTOPnqRq3RmmISFaX5cqSmu/DI8sa2KmUS5iQ5mqmq54WNJJWqxb76Di6u6f8NJ2+S4iX0o666G58RanFGguQxo+OzkUsIsYXo5kGjUBh7UisUrW4VaDQmhXsXBcWRnIn1hyeviJhJFVj+6bWEhXHy/7kNeB7XIAVGmS88SWCFRQ2Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR08MB5517.namprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39830400003)(366004)(376002)(396003)(136003)(346002)(316002)(7696005)(86362001)(55016002)(7416002)(8936002)(36756003)(2616005)(16526019)(186003)(8886007)(1076003)(26005)(54906003)(956004)(8676002)(52116002)(478600001)(5660300002)(4326008)(66946007)(66476007)(66556008)(33656002)(83380400001)(6916009)(2906002)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MDJOUXVIbmhZRDZpY1ljUTA4c0NSZnZDSkZIVHVuVFF4Q3VQNkdTSUpZdkR5?=
 =?utf-8?B?SS8zRm5DQ3JKNUZFamNESnoxeVE1bnRLM2pVZnkwRUNBdlRsdUhQY0lDdVFj?=
 =?utf-8?B?OW5xTUVDNFZwS2R5RndCVElud3hZalQ0TjZiQk9KeXVTVEpKMVdiWEtrYmZC?=
 =?utf-8?B?Z3o2Vlg0NXZyS3V5ZHI1cU41bzU2NHB3Q2VQcXJiZEE0NGJsUVJ2dHo1bjY3?=
 =?utf-8?B?ejduem55Z1B0OEVmcDlybFZ0dDJxZC9sWXZocWxqd0lnL2o5ZU1ZZWtBMUFP?=
 =?utf-8?B?cjkrdU0rbmN5d05hQWRmaHVkNVBqeXROclEyQXFrUy85MGx0S2dhbHBGNHlv?=
 =?utf-8?B?U0FWemJpSW5aazkyQVUxb1hndEowSEkxa0dkQlhpRHUraUhQTGI3cmF2dnJY?=
 =?utf-8?B?bEdLVWJhK2FuUEZZVjY2Q2tWbzVCdWxYUUk0Z2hhOEMxcGlzeHk1YmY2eFBW?=
 =?utf-8?B?UnpnWmxTNlpFNk16RTFoM2RrSm5QNHI4QzE1TlFKU0pmb3BSL0N3QkpRejVM?=
 =?utf-8?B?QzF1NnRJak00bGpobmU2ckk0UEZ4Q2hteHY2MVNueUc2a3lOTEwrUEgwUHMz?=
 =?utf-8?B?WVhabXhoVmk0UnNQSGhveXpFWmJHVmxNTFAxbkk5NCtQcnFYVSs0Zm5JRDc2?=
 =?utf-8?B?dlRtS2RlK0daUXhNYkZDUzZUL1A0dlRIaGp6NThWbSt6UmRQWklkRHkrYWtS?=
 =?utf-8?B?eDVKb0lFVUhpVXgyclhodWFCcGRZQ3ZNN0dkZnN0aDJQUDB1MTFGVHg5Lzdo?=
 =?utf-8?B?eng0RmRtcEEvcGR5WVRzZmdWZWRXOWt1MFBLTUJCOTJ6OGlRejRIQk9vRXZi?=
 =?utf-8?B?N3hZbGduUHFzM0hBaDVkY1BtdFlteW52MGpMcUpoS1NFSVhnbktYL0M0UUd1?=
 =?utf-8?B?Q2xlYUp6ejNJWHdCWEQrZmhibERQYkI0V2w0K1ZVRllGS0J6S2tXNUtXTnAr?=
 =?utf-8?B?OXdYTjJXNkNYei9aVVVQbEtGckx0WUt5UXdGTHVWN2Q2WmxCQkVobmFicjlm?=
 =?utf-8?B?UEE2MUtkOFRoS0c3bVdqdmJUcFc3VG1pWkRCaENPODdDU3ZUTWxHekMxa0RP?=
 =?utf-8?B?Q0wvTXo5MGowNnI5MXNjSzg4Q0NnMmFYT2UwTmtoWm5DZkYwTXFDQzlFYjhX?=
 =?utf-8?B?ZnFhdEozUFBtdU9IYzhrVE9XNmg1Um9RMWdhZEUyQURWTkpVdUNmd2ZGYTZp?=
 =?utf-8?B?WlJtZ2dUVmtUWGpaRGM1dWkxWGl3ZkY1MlR5b1luV1I5eDdiNTViWndTRXJH?=
 =?utf-8?B?K0lsNmtiM1ZaTUVEamtBSFlDeGg4Ujl5cWRVU0p6SlNoTkhDcmFUdFAyN3FN?=
 =?utf-8?Q?BF0SOJS2IESMw9+UDo8fsCBMMplVpZKyqK?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1a831da-fe7c-41f0-cc0f-08d8b908c31f
X-MS-Exchange-CrossTenant-AuthSource: SN6PR08MB5517.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2021 03:50:56.2259 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uPQ+XkRa/WifLQHaIah9lOGP8SFFov18edVQEvPE73Sx81BgVU78tLKgnz871n5hNv5kRcHze/tPbDG5F8nfBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR08MB5631
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Alexander Dahl <ada@thorsis.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Alexander Dahl <post@lespocky.de>,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-leds@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v9 1/4] dt-bindings: mfd: Fix schema
	warnings for pwm-leds
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

SGkgQWxleGFuZGVyLAoKT24gVGh1LCBKYW4gMTQsIDIwMjEgYXQgMTA6MDM6MTJBTSArMDAwMCwg
TGVlIEpvbmVzIHdyb3RlOgo+IE9uIE1vbiwgMjggRGVjIDIwMjAsIEFsZXhhbmRlciBEYWhsIHdy
b3RlOgo+IAo+ID4gVGhlIG5vZGUgbmFtZXMgZm9yIGRldmljZXMgdXNpbmcgdGhlIHB3bS1sZWRz
IGRyaXZlciBmb2xsb3cgYSBjZXJ0YWluCj4gPiBuYW1pbmcgc2NoZW1lIChub3cpLiAgUGFyZW50
IG5vZGUgbmFtZSBpcyBub3QgZW5mb3JjZWQsIGJ1dCByZWNvbW1lbmRlZAo+ID4gYnkgRFQgcHJv
amVjdC4KPiA+IAo+ID4gICBEVEMgICAgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9tZmQvaXFzNjJ4LmV4YW1wbGUuZHQueWFtbAo+ID4gICBDSEVDSyAgIERvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9tZmQvaXFzNjJ4LmV4YW1wbGUuZHQueWFtbAo+ID4gL2hvbWUv
YWxleC9idWlsZC9saW51eC9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWZkL2lx
czYyeC5leGFtcGxlLmR0LnlhbWw6IHB3bWxlZHM6ICdwYW5lbCcgZG9lcyBub3QgbWF0Y2ggYW55
IG9mIHRoZSByZWdleGVzOiAnXmxlZCgtWzAtOWEtZl0rKT8kJywgJ3BpbmN0cmwtWzAtOV0rJwo+
ID4gICAgICAgICBGcm9tIHNjaGVtYTogL2hvbWUvYWxleC9zcmMvbGludXgvbGVkcy9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbGVkcy9sZWRzLXB3bS55YW1sCj4gPiAKPiA+IFNp
Z25lZC1vZmYtYnk6IEFsZXhhbmRlciBEYWhsIDxwb3N0QGxlc3BvY2t5LmRlPgo+ID4gQWNrZWQt
Ynk6IEplZmYgTGFCdW5keSA8amVmZkBsYWJ1bmR5LmNvbT4KPiA+IEFja2VkLWJ5OiBSb2IgSGVy
cmluZyA8cm9iaEBrZXJuZWwub3JnPgo+ID4gLS0tCj4gPiAKPiA+IE5vdGVzOgo+ID4gICAgIHY4
IC0+IHY5Ogo+ID4gICAgICAgKiBhZGRlZCBmb3Jnb3R0ZW4gQWNrZWQtYnkgKEplZmYgTGFCdW5k
eSkKPiA+ICAgICAgICogcmViYXNlZCBvbiB2NS4xMS1yYzEKPiA+ICAgICAKPiA+ICAgICB2NyAt
PiB2ODoKPiA+ICAgICAgICogcmViYXNlZCBvbiByZWNlbnQgcGF2ZWwvZm9yLW5leHQgKHBvc3Qg
djUuMTAtcmMxKQo+ID4gICAgICAgKiBhZGRlZCBBY2tlZC1ieSAoUm9iIEhlcnJpbmcpCj4gPiAg
ICAgCj4gPiAgICAgdjYgLT4gdjc6Cj4gPiAgICAgICAqIGFkZGVkIHdhcm5pbmcgbWVzc2FnZSB0
byBjb21taXQgbWVzc2FnZSAoS3J6eXN6dG9mIEtvemxvd3NraSkKPiA+ICAgICAKPiA+ICAgICB2
NjoKPiA+ICAgICAgICogYWRkZWQgdGhpcyBwYXRjaCB0byBzZXJpZXMKPiA+IAo+ID4gIERvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZmQvaXFzNjJ4LnlhbWwgfCA1ICsrKy0tCj4g
PiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBG
YWlsZWQgdG8gYXBwbHk6Cj4gCj4gQXBwbHlpbmc6IGR0LWJpbmRpbmdzOiBtZmQ6IEZpeCBzY2hl
bWEgd2FybmluZ3MgZm9yIHB3bS1sZWRzCj4gVXNpbmcgaW5kZXggaW5mbyB0byByZWNvbnN0cnVj
dCBhIGJhc2UgdHJlZS4uLgo+IE0JRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21m
ZC9pcXM2MngueWFtbAo+IC9ob21lL2xlZS9wcm9qZWN0cy9saW51eC9rZXJuZWwvLmdpdC93b3Jr
dHJlZXMvbWZkL3JlYmFzZS1hcHBseS9wYXRjaDozNDogaW5kZW50IHdpdGggc3BhY2VzLgo+ICAg
ICAgICAgICAgIGxlZC0xIHsKPiAvaG9tZS9sZWUvcHJvamVjdHMvbGludXgva2VybmVsLy5naXQv
d29ya3RyZWVzL21mZC9yZWJhc2UtYXBwbHkvcGF0Y2g6MzU6IGluZGVudCB3aXRoIHNwYWNlcy4K
PiAgICAgICAgICAgICAgICAgICAgIGxhYmVsID0gInBhbmVsIjsKPiB3YXJuaW5nOiAyIGxpbmVz
IGFkZCB3aGl0ZXNwYWNlIGVycm9ycy4KPiBGYWxsaW5nIGJhY2sgdG8gcGF0Y2hpbmcgYmFzZSBh
bmQgMy13YXkgbWVyZ2UuLi4KPiBBdXRvLW1lcmdpbmcgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL21mZC9pcXM2MngueWFtbAo+IENPTkZMSUNUIChjb250ZW50KTogTWVyZ2UgY29u
ZmxpY3QgaW4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21mZC9pcXM2MngueWFt
bAo+IFJlY29yZGVkIHByZWltYWdlIGZvciAnRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL21mZC9pcXM2MngueWFtbCcKCkl0IGxvb2tzIGxpa2UgdGhlIGZvbGxvd2luZyBwYXRjaCBh
bHJlYWR5IGJlYXQgdGhpcyB0byB0aGUgcHVuY2g6Cgo4MjM3ZTgzODI0OTggKCJkdC1iaW5kaW5n
czogbWZkOiBDb3JyZWN0IHRoZSBub2RlIG5hbWUgb2YgdGhlIHBhbmVsIExFRCIpCgpUaGF0IHBh
dGNoIGRvZXMgbm90IHJldGFpbiB0aGUgTEVEJ3MgbGFiZWwgb3IgcmVuYW1lIHRoZSBwYXJlbnQg
bm9kZSB0bwpsZWQtY29udHJvbGxlciwgaG93ZXZlci4gVGhlIGxhYmVsIGhhcmRseSBtYXR0ZXJz
IGZvciB0aGlzIGV4YW1wbGUsIGJ1dApwZXJoYXBzIHdlIHN0aWxsIHdhbnQgdGhlIHBhcmVudCBu
b2RlIGNoYW5nZSB0byBmb2xsb3cgbGVkcy1wd20ueWFtbC4KCj4gCj4gLS0gCj4gTGVlIEpvbmVz
IFvmnY7nkLzmlq9dCj4gU2VuaW9yIFRlY2huaWNhbCBMZWFkIC0gRGV2ZWxvcGVyIFNlcnZpY2Vz
Cj4gTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFybSBTb0NzCj4gRm9s
bG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwoKS2luZCByZWdhcmRzLApKZWZm
IExhQnVuZHkKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlz
dGluZm8vbGludXgtc3RtMzIK
