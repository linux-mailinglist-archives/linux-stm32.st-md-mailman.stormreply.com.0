Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9209A23C79E
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Aug 2020 10:19:09 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4B7B3C36B3A;
	Wed,  5 Aug 2020 08:19:09 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10olkn2048.outbound.protection.outlook.com [40.92.41.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5AE75C36B32
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Aug 2020 08:19:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IHWJxl4lrpGYpDsGY9ddZ0vfLiBv96FBrHqEadqXTtpwpwJdup3tezZdGynfGHtQDSiwz8XKgK3Fwp6rISzyw3mBs/EDp7Kx9ftcmfrUf0Ag0tDNRsXXjfrqQe78MGx8+46tolQ1z+NGFuH8e3odXNJD9aiUmvgIAKnecdPPxUiWhxKNiezjApHm+xBAmOLIMptlLJYo8igq30bjmOmLXJ35IXhAV3zCYH2lh776BPjp0IeIvzxlUSacPsZLVBQuG4oZdZljc8Ufun/kH8tT9MRiWz2FO/3KkVLEPxf8zNQdo6NBrFzIqumnvQtPgrf/GGmGGKm8ozbgNGhjThAxsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pT6jsd7ZqRq2T9HI0eEUc2+QpY5nzpRA3mJ6GrpgGQM=;
 b=SLJJsh/u2xIFuNOqH0Y3+Wg32kYAv3Bql1wiUTgkTHQg0eR97dE+SByRjQKxqMIz+8/q6u856hqw1nertIYRu2DGYkj4dmv+1EcEADUzmpmPqz2CyBdGijzG7OM4ilqeOCoulzOZYvV/OIFd1qRaV5sVbJjw5KEyIlsNtlwlhzPzXozoIjUT0QQY09XPBMflSHG5mfGzf86WR1FDUU6OFe3eJM84tt5bmpfrSNwqsgqkYgDitKXF9/u9GzKubc6nVThdpvg9cR1bsaEmGohhaLl5LufMZQkpIPjaID893mjmHnFZvwOsz7IgBClux6wOLgzbaMQSMeEKe2NC1kjeGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pT6jsd7ZqRq2T9HI0eEUc2+QpY5nzpRA3mJ6GrpgGQM=;
 b=l7BL2DycXduvZIMab2Sl5YHraJfn8EVPJxjm/PhGZ2S50kbe/5NZV0XXiDoyjjgeIEK9ut1UfiMgVqa3rdi9UN5SWBS63WRXlZBU98sVlK0PomvQPNczUS8NEtNyiRfjccFO/7ODuKHXayqmC1GyWUck5udog4ecLa+h82OUUlQZinWt6o+NYaY85faNlNISW0biX7/cx+LVr0OTbWlMjJ82bvD9P0ja4pQJrkiqtjG34knSpZpsIzGK1RVaer1yAw6iXVcQcgXOOfPVT3iT/UJc31NdMnwE8jIbJXcarUUqu8aZPn1FaKWU1ZL9t1NssJkU8wymXspLkVEPxQZSMg==
Received: from DM6NAM10FT059.eop-nam10.prod.protection.outlook.com
 (2a01:111:e400:7e86::48) by
 DM6NAM10HT134.eop-nam10.prod.protection.outlook.com (2a01:111:e400:7e86::310)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.20; Wed, 5 Aug
 2020 08:19:04 +0000
Received: from BY5PR13MB3063.namprd13.prod.outlook.com
 (2a01:111:e400:7e86::41) by DM6NAM10FT059.mail.protection.outlook.com
 (2a01:111:e400:7e86::327) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.16 via Frontend
 Transport; Wed, 5 Aug 2020 08:19:04 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:63734B54ED9A177E999D79A6824361D22F37060C55609613280A9251CDE83D51;
 UpperCasedChecksum:4CDCE8A6C9CE2BE9CB2C39023636D8CE974B45A854361A96D5F8C6B2B9F07389;
 SizeAsReceived:9881; Count:49
Received: from BY5PR13MB3063.namprd13.prod.outlook.com
 ([fe80::18cb:cc46:28a6:1838]) by BY5PR13MB3063.namprd13.prod.outlook.com
 ([fe80::18cb:cc46:28a6:1838%7]) with mapi id 15.20.3261.016; Wed, 5 Aug 2020
 08:19:04 +0000
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Kukjin Kim <kgene@kernel.org>,
 Simtec Linux Team <linux@simtec.co.uk>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Tomasz Figa <tomasz.figa@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Arnd Bergmann <arnd@arndb.de>,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, patches@opensource.cirrus.com,
 linux-clk@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20200804192654.12783-1-krzk@kernel.org>
From: Lihua Yao <ylhuajnu@outlook.com>
Message-ID: <BY5PR13MB30639E16691A4A601A1D7070C44B0@BY5PR13MB3063.namprd13.prod.outlook.com>
Date: Wed, 5 Aug 2020 16:18:32 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200804192654.12783-1-krzk@kernel.org>
Content-Language: en-US
X-ClientProxiedBy: HK0PR03CA0113.apcprd03.prod.outlook.com
 (2603:1096:203:b0::29) To BY5PR13MB3063.namprd13.prod.outlook.com
 (2603:10b6:a03:189::32)
X-Microsoft-Original-Message-ID: <8e8140a1-bc6b-e88e-7f2c-454e6e9a3ebc@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2408:84f3:7a03:fb46:b1f4:4282:846d:925c]
 (2408:84f3:7a03:fb46:b1f4:4282:846d:925c) by
 HK0PR03CA0113.apcprd03.prod.outlook.com (2603:1096:203:b0::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3261.17 via Frontend Transport; Wed, 5 Aug 2020 08:18:42 +0000
X-Microsoft-Original-Message-ID: <8e8140a1-bc6b-e88e-7f2c-454e6e9a3ebc@outlook.com>
X-TMN: [7wRwfkzV7UUnZ44G4L84i6a0N07efHzwJkpPdIAhZpVsMgS16OxLsQRL1V1VIFlG6M2b3ZDDcF0=]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 49
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 9bfb4968-1556-48b1-c1fd-08d83918373f
X-MS-TrafficTypeDiagnostic: DM6NAM10HT134:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ieWZngt6ZT+QigME7ht0lQlq4FO/13nUB1Q0SG9FMf/zI7W903FYpKny4gFkeZmm4R1zo/wK2Vvzo54AJhPJJkSp+ggkYBdmaIRfCC8oSIugzkCO3waqpKrZE/EiaibKlIwVuP9yOF92XMbni1Fn2XVrs07jCtgZmmS1FEbxSORPo3AbQRcv3f7HfQqs9z5da4cLaArkfqoxnQ6Mx+uCgY1x3mlFRUpyGetskBZr1NWXVV6eHeeoCISGJ0+mqjZK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:0; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR13MB3063.namprd13.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:; SFS:; DIR:OUT; SFP:1901; 
X-MS-Exchange-AntiSpam-MessageData: 12M6GrkYIXy5ytAIqI34qlvLuIX/NWwupaDAuItz4qtYPXwm4vnq1bQWhQy4K5rNgaH1dAivWJK8gMiHQbe91th4jZBXQmhR3B23MuhqmT1N3rrnQUfZjNUKhW3zOfHPSYeIgeGrXgXsJtl+sGpk5C7gIYbg9XPHfpYUEDWYviJOMC/2XW9r7SqThnt5wtgo54tn+oHqtv12VZjpfn7Iag==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bfb4968-1556-48b1-c1fd-08d83918373f
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2020 08:19:04.5346 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM10FT059.eop-nam10.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6NAM10HT134
Cc: Sylwester Nawrocki <snawrocki@kernel.org>, Cedric Roux <sed@free.fr>,
 Sergio Prado <sergio.prado@e-labworks.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [Linux-stm32] [PATCH v2 00/13] clk/watchdog/ARM: Cleanup of
	various S3C bits
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

SGkgS3J6eXN6dG9m77yMCgpPbiA1LzgvMjAyMCAzOjI2IGFtLCBLcnp5c3p0b2YgS296bG93c2tp
IHdyb3RlOgo+IEhpLAo+Cj4gSSB0cmllZCB0byBjbGVhbnVwIGZldyB3YXJuaW5ncyBpbiBTM0Mg
bWFjaGluZSBjb2RlIHdoaWNoIGxlYWQgdG8KPiBmaW5kaW5nIHNvbWUgYmlnZ2VyIGlzc3Vlcy4K
Pgo+IFRoZSBwYXRjaHNldCB0b3VjaGVzIGNsayBhbmQgd2F0Y2hkb2cgdHJlZXMuIEkgd291bGQg
YXBwcmVjaWF0ZSBhY2tzIHNvCj4gSSBjYW4gdGFrZSBldmVyeXRoaW5nIHRocm91Z2ggU2Ftc3Vu
ZyBTb0MgdHJlZS4gSSBoYXZlIGxhdGVyIGEgYmlnZ2VyCj4gc2V0IHdoaWNoIHdvdWxkIGNyZWF0
ZSBjb25mbGljdHMgd2l0aCBpdCBbMV0uCj4KPgo+IENoYW5nZXMgc2luY2UgdjE6Cj4gMS4gRmV3
IG5ldyBwYXRjaGVzLAo+IDIuIEFkZHJlc3NlZCByZXZpZXcgYXJvdW5kIGNsayBhbmQgd2F0Y2hk
b2cgY2hhbmdlcyAoc2VlIGNoYW5nZSBsb2dzIGluCj4gICAgaW5kaXZpZHVhbCBwYXRjaGVzKS4K
Pgo+Cj4gWzFdIHYyIG9mIEFybmQncyB3b3JrIGZvciBtYWtpbmcgUzNDMjR4eCBtdWx0aXBsYXRm
b3JtOgo+IGh0dHBzOi8vZ2l0aHViLmNvbS9rcnprL2xpbnV4L3RyZWUvZm9yLW5leHQvczNjLW11
bHRpcGxhdGZvcm0tY2xlYW51cC13MS13YXJuaW5ncy12MgpJIGdhdmUgYSBidWlsZCBhbmQgYm9v
dCB0ZXN0LiBNeSBUSU5ZNjQxMCBib2FyZCBzdGlsbCB3b3JrcyEKQWN0dWFsbHkgSSBoYWQgZGlk
IHRoZSBzYW1lIHRlc3QgZm9yIEFybmQncyBicmFuY2ggd2l0aCBsaW51eCB2NS41CmFuZCBpdCB3
b3JrcyB0b28hCgpCZXN0IHJlZ2FyZHMKTGlodWEKPgo+IEJlc3QgcmVnYXJkcywKPiBLcnp5c3p0
b2YKPgo+Cj4gS3J6eXN6dG9mIEtvemxvd3NraSAoMTMpOgo+ICAgY2xrOiBzYW1zdW5nOiBzM2M2
NHh4OiBkZWNsYXJlIHMzYzY0eHhfY2xrX2luaXQoKSBpbiBzaGFyZWQgaGVhZGVyCj4gICBjbGs6
IHNhbXN1bmc6IHMzYzI0eHg6IGRlY2xhcmUgczNjMjR4eF9jb21tb25fY2xrX2luaXQoKSBpbiBz
aGFyZWQKPiAgICAgaGVhZGVyCj4gICBBUk06IHMzYzY0eHg6IGluY2x1ZGUgaGVhZGVyIHRvIGZp
eCAtV21pc3NpbmctcHJvdG90eXBlcwo+ICAgQVJNOiBzM2M6IHJlbW92ZSBwbGF0LXNhbXN1bmcv
Li4uL3NhbXN1bmctdGltZS5oCj4gICBBUk06IHNhbXN1bmc6IGZpeCBsYW5ndWFnZSB0eXBvCj4g
ICBBUk06IHNhbXN1bmc6IHJlbW92ZSBIQVZFX1MzQzI0MTBfV0FUQ0hET0cgYW5kIHVzZSBkaXJl
Y3QgZGVwZW5kZW5jaWVzCj4gICBBUk06IHMzYzY0eHg6IHN3aXRjaCB0byBnZW5lcmljIHdhdGNo
ZG9nIGRyaXZlciByZXNldAo+ICAgQVJNOiBzM2MyNHh4OiBmaXggbWlzc2luZyBzeXN0ZW0gcmVz
ZXQKPiAgIEFSTTogczNjMjR4eDogaW5jbHVkZSBjb21tb24uaCBoZWFkZXIgaW4gczNjMjQ0My5j
Cj4gICBBUk06IHMzYzI0eHg6IHNkaGNpOiBpbmNsdWRlIHBsYXQvc2RoY2kuaCBoZWFkZXIKPiAg
IEFSTTogczNjMjR4eDogdHM6IGluY2x1ZGUgcGxhdGZvcm0gZGF0YSBoZWFkZXIKPiAgIEFSTTog
czNjMjR4eDogdHM6IGRvY3VtZW50IGZ1bmN0aW9uIGFyZ3VtZW50Cj4gICBBUk06IHMzYzI0eHg6
IGNhbWlmOiBpbmNsdWRlIGhlYWRlciB3aXRoIHByb3RvdHlwZXMgYW5kIHVuaWZ5Cj4gICAgIGRl
Y2xhcmF0aW9uCj4KPiAgTUFJTlRBSU5FUlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHwgIDEgKwo+ICBhcmNoL2FybS9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgfCAgMyArLQo+ICBhcmNoL2FybS9tYWNoLWV4eW5vcy9LY29uZmlnICAgICAgICAgICAgICAg
ICAgfCAgMSAtCj4gIGFyY2gvYXJtL21hY2gtczNjMjR4eC9jb21tb24uYyAgICAgICAgICAgICAg
ICB8ICAxICsKPiAgYXJjaC9hcm0vbWFjaC1zM2MyNHh4L2NvbW1vbi5oICAgICAgICAgICAgICAg
IHwgMjUgKysrLS0KPiAgYXJjaC9hcm0vbWFjaC1zM2MyNHh4L21hY2gtYW1sbTU5MDAuYyAgICAg
ICAgIHwgIDIgLQo+ICBhcmNoL2FybS9tYWNoLXMzYzI0eHgvbWFjaC1hbnViaXMuYyAgICAgICAg
ICAgfCAgMSAtCj4gIGFyY2gvYXJtL21hY2gtczNjMjR4eC9tYWNoLWF0MjQ0MGV2Yi5jICAgICAg
ICB8ICAxIC0KPiAgYXJjaC9hcm0vbWFjaC1zM2MyNHh4L21hY2gtYmFzdC5jICAgICAgICAgICAg
IHwgIDEgLQo+ICBhcmNoL2FybS9tYWNoLXMzYzI0eHgvbWFjaC1ndGEwMi5jICAgICAgICAgICAg
fCAgMSAtCj4gIGFyY2gvYXJtL21hY2gtczNjMjR4eC9tYWNoLWgxOTQwLmMgICAgICAgICAgICB8
ICAxIC0KPiAgYXJjaC9hcm0vbWFjaC1zM2MyNHh4L21hY2gtaml2ZS5jICAgICAgICAgICAgIHwg
IDEgLQo+ICBhcmNoL2FybS9tYWNoLXMzYzI0eHgvbWFjaC1taW5pMjQ0MC5jICAgICAgICAgfCAg
MSAtCj4gIGFyY2gvYXJtL21hY2gtczNjMjR4eC9tYWNoLW4zMC5jICAgICAgICAgICAgICB8ICAx
IC0KPiAgYXJjaC9hcm0vbWFjaC1zM2MyNHh4L21hY2gtbmV4Y29kZXIuYyAgICAgICAgIHwgIDEg
LQo+ICBhcmNoL2FybS9tYWNoLXMzYzI0eHgvbWFjaC1vc2lyaXMuYyAgICAgICAgICAgfCAgMSAt
Cj4gIGFyY2gvYXJtL21hY2gtczNjMjR4eC9tYWNoLW90b20uYyAgICAgICAgICAgICB8ICAxIC0K
PiAgYXJjaC9hcm0vbWFjaC1zM2MyNHh4L21hY2gtcXQyNDEwLmMgICAgICAgICAgIHwgIDEgLQo+
ICBhcmNoL2FybS9tYWNoLXMzYzI0eHgvbWFjaC1yeDE5NTAuYyAgICAgICAgICAgfCAgMSAtCj4g
IGFyY2gvYXJtL21hY2gtczNjMjR4eC9tYWNoLXJ4MzcxNS5jICAgICAgICAgICB8ICAxIC0KPiAg
YXJjaC9hcm0vbWFjaC1zM2MyNHh4L21hY2gtc21kazI0MTAuYyAgICAgICAgIHwgIDEgLQo+ICBh
cmNoL2FybS9tYWNoLXMzYzI0eHgvbWFjaC1zbWRrMjQxMy5jICAgICAgICAgfCAgMSAtCj4gIGFy
Y2gvYXJtL21hY2gtczNjMjR4eC9tYWNoLXNtZGsyNDE2LmMgICAgICAgICB8ICAxIC0KPiAgYXJj
aC9hcm0vbWFjaC1zM2MyNHh4L21hY2gtc21kazI0NDAuYyAgICAgICAgIHwgIDEgLQo+ICBhcmNo
L2FybS9tYWNoLXMzYzI0eHgvbWFjaC1zbWRrMjQ0My5jICAgICAgICAgfCAgMSAtCj4gIGFyY2gv
YXJtL21hY2gtczNjMjR4eC9tYWNoLXRjdF9oYW1tZXIuYyAgICAgICB8ICAxIC0KPiAgYXJjaC9h
cm0vbWFjaC1zM2MyNHh4L21hY2gtdnIxMDAwLmMgICAgICAgICAgIHwgIDEgLQo+ICBhcmNoL2Fy
bS9tYWNoLXMzYzI0eHgvbWFjaC12c3Rtcy5jICAgICAgICAgICAgfCAgMSAtCj4gIGFyY2gvYXJt
L21hY2gtczNjMjR4eC9zM2MyNDQzLmMgICAgICAgICAgICAgICB8ICAxICsKPiAgYXJjaC9hcm0v
bWFjaC1zM2MyNHh4L3NldHVwLWNhbWlmLmMgICAgICAgICAgIHwgIDUgKy0KPiAgYXJjaC9hcm0v
bWFjaC1zM2MyNHh4L3NldHVwLXNkaGNpLWdwaW8uYyAgICAgIHwgIDEgKwo+ICBhcmNoL2FybS9t
YWNoLXMzYzI0eHgvc2V0dXAtdHMuYyAgICAgICAgICAgICAgfCAgMyArCj4gIGFyY2gvYXJtL21h
Y2gtczNjNjR4eC9LY29uZmlnICAgICAgICAgICAgICAgICB8ICA1ICstCj4gIGFyY2gvYXJtL21h
Y2gtczNjNjR4eC9jb21tb24uYyAgICAgICAgICAgICAgICB8IDE3ICstLS0KPiAgYXJjaC9hcm0v
bWFjaC1zM2M2NHh4L2NvbW1vbi5oICAgICAgICAgICAgICAgIHwgMTcgKysrLQo+ICBhcmNoL2Fy
bS9tYWNoLXMzYzY0eHgvbWFjaC1hbnc2NDEwLmMgICAgICAgICAgfCAgMiAtCj4gIGFyY2gvYXJt
L21hY2gtczNjNjR4eC9tYWNoLWNyYWc2NDEwLmMgICAgICAgICB8ICAyIC0KPiAgYXJjaC9hcm0v
bWFjaC1zM2M2NHh4L21hY2gtaG10LmMgICAgICAgICAgICAgIHwgIDIgLQo+ICBhcmNoL2FybS9t
YWNoLXMzYzY0eHgvbWFjaC1taW5pNjQxMC5jICAgICAgICAgfCAgMiAtCj4gIGFyY2gvYXJtL21h
Y2gtczNjNjR4eC9tYWNoLW5jcC5jICAgICAgICAgICAgICB8ICAyIC0KPiAgYXJjaC9hcm0vbWFj
aC1zM2M2NHh4L21hY2gtcmVhbDY0MTAuYyAgICAgICAgIHwgIDIgLQo+ICBhcmNoL2FybS9tYWNo
LXMzYzY0eHgvbWFjaC1zM2M2NHh4LWR0LmMgICAgICAgfCAxNyAtLS0tCj4gIGFyY2gvYXJtL21h
Y2gtczNjNjR4eC9tYWNoLXNtYXJ0cS5jICAgICAgICAgICB8ICAxIC0KPiAgYXJjaC9hcm0vbWFj
aC1zM2M2NHh4L21hY2gtc21hcnRxNS5jICAgICAgICAgIHwgIDIgLQo+ICBhcmNoL2FybS9tYWNo
LXMzYzY0eHgvbWFjaC1zbWFydHE3LmMgICAgICAgICAgfCAgMiAtCj4gIGFyY2gvYXJtL21hY2gt
czNjNjR4eC9tYWNoLXNtZGs2NDAwLmMgICAgICAgICB8ICAyIC0KPiAgYXJjaC9hcm0vbWFjaC1z
M2M2NHh4L21hY2gtc21kazY0MTAuYyAgICAgICAgIHwgIDIgLQo+ICBhcmNoL2FybS9tYWNoLXMz
YzY0eHgvc2V0dXAtc3BpLmMgICAgICAgICAgICAgfCAgMSArCj4gIGFyY2gvYXJtL21hY2gtczNj
NjR4eC93YXRjaGRvZy1yZXNldC5oICAgICAgICB8IDE2IC0tLS0KPiAgYXJjaC9hcm0vbWFjaC1z
NXB2MjEwL0tjb25maWcgICAgICAgICAgICAgICAgIHwgIDEgLQo+ICBhcmNoL2FybS9wbGF0LXNh
bXN1bmcvS2NvbmZpZyAgICAgICAgICAgICAgICAgfCAxMCArLQo+ICBhcmNoL2FybS9wbGF0LXNh
bXN1bmcvTWFrZWZpbGUgICAgICAgICAgICAgICAgfCAgMSAtCj4gIC4uLi9wbGF0LXNhbXN1bmcv
aW5jbHVkZS9wbGF0L3NhbXN1bmctdGltZS5oICB8IDI2IC0tLS0tLQo+ICBhcmNoL2FybS9wbGF0
LXNhbXN1bmcvd2F0Y2hkb2ctcmVzZXQuYyAgICAgICAgfCA5MyAtLS0tLS0tLS0tLS0tLS0tLS0t
Cj4gIGFyY2gvYXJtNjQvS2NvbmZpZy5wbGF0Zm9ybXMgICAgICAgICAgICAgICAgICB8ICAxIC0K
PiAgZHJpdmVycy9jbGsvc2Ftc3VuZy9jbGstczNjMjQxMC5jICAgICAgICAgICAgIHwgIDEgKwo+
ICBkcml2ZXJzL2Nsay9zYW1zdW5nL2Nsay1zM2MyNDEyLmMgICAgICAgICAgICAgfCAgMSArCj4g
IGRyaXZlcnMvY2xrL3NhbXN1bmcvY2xrLXMzYzI0NDMuYyAgICAgICAgICAgICB8ICAxICsKPiAg
ZHJpdmVycy9jbGsvc2Ftc3VuZy9jbGstczNjNjR4eC5jICAgICAgICAgICAgIHwgIDEgKwo+ICBk
cml2ZXJzL3dhdGNoZG9nL0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgfCAxMCArLQo+ICBp
bmNsdWRlL2xpbnV4L2Nsay9zYW1zdW5nLmggICAgICAgICAgICAgICAgICAgfCA1NiArKysrKysr
KysrKwo+ICA2MSBmaWxlcyBjaGFuZ2VkLCAxMDUgaW5zZXJ0aW9ucygrKSwgMjU2IGRlbGV0aW9u
cygtKQo+ICBkZWxldGUgbW9kZSAxMDA2NDQgYXJjaC9hcm0vbWFjaC1zM2M2NHh4L3dhdGNoZG9n
LXJlc2V0LmgKPiAgZGVsZXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJtL3BsYXQtc2Ftc3VuZy9pbmNs
dWRlL3BsYXQvc2Ftc3VuZy10aW1lLmgKPiAgZGVsZXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJtL3Bs
YXQtc2Ftc3VuZy93YXRjaGRvZy1yZXNldC5jCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRl
L2xpbnV4L2Nsay9zYW1zdW5nLmgKPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
