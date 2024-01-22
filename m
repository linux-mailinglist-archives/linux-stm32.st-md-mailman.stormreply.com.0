Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 069E0836AE8
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Jan 2024 17:36:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A2C6CC6DD6B;
	Mon, 22 Jan 2024 16:36:20 +0000 (UTC)
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01olkn2093.outbound.protection.outlook.com [40.92.53.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2790BC6DD66
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Jan 2024 16:36:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KjWquVqT0WD1YpkjuXu2wHj0pWIKYTfekAYJdT5qyrmlxTERaMcPJ/3cBHI7J+MajSEjJoO72yS7oj7EEWYtGlkTo0YLEn5mV0Z40KL11BiUgA7uUE6S1c0tt7AhoDV2mRNAPw+5xdRjmwIAfLbV/yyAuJd4pYcn+5emWnvKXwi2SbzvDh3HWX8OmWPrgGi8moGWZ9jjHG3rvz4BIbRmYFTQFA47iRiJEgWZ2t7D1N3ubc6ba2vE5p+Km70CDDg9Pu4Ujb2a4kKqHrsZqc5c5EBeJCyd0cAZkZnLU5R8M8N+7L58WQthE9SqImY1YlDk9KuX2u1bsb5aED6AYxEPKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R+PBNr8qfWwc2fSfin/Ly2CKli0vrATLMNzz6YnqfpM=;
 b=UgcOj8MdZ45/6xhoVYgA0fH9O79R/+5A5gcjnEBNXHvMrLOMqJmoT4an5y3F+UzzhNlrbHHodEmJeuH6jOHs+5MSwylJAAyeMSr+Bgot4z0z+QUUdwGh9R9xbn9PgZAuzl0RNj1MkLlBG/QF9CMM0t0q+JJe8qZKCEDt1CPH+0IhhqL4vdJLnd32lnK20AFbyp2f24XWV+TPYLQQgdPsIw4e3PGRKP+Tjcjig7oh5elvq0w+i4KT1ar9d5nZkhkz6nYNTrtZM1N3+Fx1dniX5jNToidphhWl4RMIHfpwKde67uAJXJpKcsQd3xo3rXWfpSuBI+/Q65xdRxHb90c4sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R+PBNr8qfWwc2fSfin/Ly2CKli0vrATLMNzz6YnqfpM=;
 b=E/FwMl5/f4tyCua5be0eAfMV9FQ3F5UpXaVsy5fiEa8bcNwM9DPcKiNCLfrKOo9LD4OzWjZ4G2QcC3z4qS75t7xYuZ8oh9Xi7PinKxohLCCq9M91rq1oFQtXepq6up9qZzwY2EbZZF3t29B6ggY5aTbCynJJ9we7/aMQlQWWO28Jezp07b8hPYg3OcXxxlG38ToGtbD/rRhzpk9nrI+kyVy1prE9GNcDLPeimXANIkydmmtyXSyTcQ+xItDEWoWyQmXe/uGtzTbbgZKr2FpGugDSDaCLaJORQTUZOTRW0K6VImRfUKW14SBrjZWUvdIwNRu5uFaOxaSJo9XCaS1clQ==
Received: from TYZPR01MB5556.apcprd01.prod.exchangelabs.com
 (2603:1096:400:363::9) by TY0PR01MB5410.apcprd01.prod.exchangelabs.com
 (2603:1096:400:27b::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.32; Mon, 22 Jan
 2024 16:36:13 +0000
Received: from TYZPR01MB5556.apcprd01.prod.exchangelabs.com
 ([fe80::a639:b02c:5189:7140]) by TYZPR01MB5556.apcprd01.prod.exchangelabs.com
 ([fe80::a639:b02c:5189:7140%7]) with mapi id 15.20.7202.031; Mon, 22 Jan 2024
 16:36:13 +0000
Message-ID: <TYZPR01MB55565998F43009AD351AC07EC9752@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
Date: Tue, 23 Jan 2024 00:35:22 +0800
User-Agent: Mozilla Thunderbird
To: Andrew Lunn <andrew@lunn.ch>
References: <TYZPR01MB55563BD6A2B78402E4BB44D4C9762@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
 <TYZPR01MB5556DEA3D4740441EC561414C9762@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
 <28cca132-d5bb-4cff-ba2f-9be241a5ce83@lunn.ch>
From: Ziyang Huang <hzyitc@outlook.com>
In-Reply-To: <28cca132-d5bb-4cff-ba2f-9be241a5ce83@lunn.ch>
X-TMN: [2+4/1UrGzweW/mU9TWVSb3sKLGtdip+K]
X-ClientProxiedBy: SG2PR02CA0038.apcprd02.prod.outlook.com
 (2603:1096:3:18::26) To TYZPR01MB5556.apcprd01.prod.exchangelabs.com
 (2603:1096:400:363::9)
X-Microsoft-Original-Message-ID: <0084a8a4-6aa3-443f-8def-0995824c6df3@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR01MB5556:EE_|TY0PR01MB5410:EE_
X-MS-Office365-Filtering-Correlation-Id: 6133cf9f-d0f5-438a-0ff6-08dc1b683f0a
X-MS-Exchange-SLBlob-MailProps: obhAqMD0nT+gBgqCImLTqb4mdYBvtNPT4iXzvBtdNRMk2oDSCCTMQLW8L7CJOf39Pa0AFQMgPlx+mmSJmu2Ow/8C/lRsGDIlRSyWhq30V4uesq8QpT2QYlqxhdV9GEjGpY1u9jfxHZ3bn+/HIr/GBxOKxVMIYs44TgEDv3FJKU5z2JnMnEESA2HbYLjVM9wc3pvmba0WXxukhcpyNQmCBqqKmtmMPJtXokaoxhMdDY7HsRWtbwyiWFiCdrUDHuv2l4M/dmQhq0EGGQkwy7xEdvmQGQZ+1t6AEDHzjCxj2LRZSzdiwnUCN5Xl4hjwGPFBYGvMFcfw8QEpqL7sPwyWJhQlrHUUs1EUwZaxdDeKDse4omTNzET/VeMjHzaiMGcv4kNvmZ006mKd5EiMzjxG/x6SpiORKjnliwwOhQf0xdSMfZzEUMLgl5HlZDF9CIo8vLv04eIlXsZw72rNg0pcddDZo7P7gZoXD3igtWKjv8uP2RyZN++cq+7QKKAENXlVHkfqZGxr00ExYBhkmRm+Fuhf0T1+J4XuVMtUxARTNbYvy8CMUVzSDBKyT7WINxOF2v8RM3+u488ymJCD0JBsMr/BTNS/H/cWsrEK71p/bbTDQfbFA+u5AdtPIu7nh5ZkxE10b5kPEX1g6RuIoA+jBwHRUWR2LxSEw4yhtKEqj/YSOfHXjdU9QDS0PhCfIwwgVcm5Pkm+eeed/YKiSNfr3d2gSucRij1L1I+yw4WrYUtHd/Er7wVgkejCSyfGihP1dTX6dJEM9wvg7Wua129IuYXOxt9eeeTzeg+zg5GOusN/HvZBYKScVrBuK+m4OoMc
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OSa6DPc8PLaytwzy++j1+JkLJrlBOUfyspnJooYIj4oSO5eY/gxgjDu4cUdX9AhOhqlyMx04/dKqhmP7mczGBVo5WyHqtVxEIrc7POOcDaC4CDrK8PLZ83HqVus9lrUXn7Ek3YsqrWaNxGJC4G4VCkLkp7F2d/YSMcD+FmXMWvhVhOQREQA9vYwwROJqW11hIGO5jfGUj9xhfaWl8oDhTb3kESrOKQHk9X6RQ07X9lqtKn2X0d6UeR1m2Gep4ZFJJDZ9uhT+W/9yajH6VeNPZ+mQeXqFSUlxAhfa5rTkXNdmaMo9Wf0Ea1j2WE1JIUc49kZQsLBjad8/FiCJ9RUaA462EUBVTqw7T9nibcIiuPbZr8ZgxymmGYivmmq4q6hpPDv2x9NWzB3phDHnO/8yy8R92iEQGs0E2WOssDthoRxpeRs72Lgqcg0zwQZMdf9P2CdG4Oo6ZLrNgpdIJuIyMU3u6LUc576D0old6PDpDkSsaooKSd55rx5bAEubA1jq8Kd/Dm1nBKteU9YVSUBGwb8toVMWWtwaPL2qS6bm8Ijm/QU4ESVFVAhhMefQx/AKx1uE3ZHOmrn+rD2pJ5j5rGDrd3AFIEp7H/PC70Q1OOU=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aWY4U1doeUpEcW5tLzJ6L282T2ZHU08yWVB0YXlHMDhaaDZJWFVERS9sb0c5?=
 =?utf-8?B?cWhGaTNuTzc3Q09TWUxETDVPbGpaUlpNa2ZJMFlWUTIyNHFxRGNQc2dvdTlk?=
 =?utf-8?B?RktDVENmZmljdmF6bmZCNWxGMmdqcjRrSUFlcW9zME5GenB5azNhMi90RXM0?=
 =?utf-8?B?R3oyamgrQVk5ZnRwYTVVOVZtSUNLakRtRHJlMnQwd2hhUUJ5aGRJb2JpSVdL?=
 =?utf-8?B?dklTWDJVeGNheWJEK1VYQkRYTlpyNWN0Y3BxVU5nYjJqbWh6VkptY1daS3lG?=
 =?utf-8?B?ajZKN1k3Y3VXUGQxSDQwaXppckVaZVdseEE2cTRzZUZjVy8xWG5FNlhWN1hJ?=
 =?utf-8?B?RUlqRnZYUFFtbThBZkVISFdDMUMxTXI0WlhlOTZOQkh1MkltQTB2dklkaHlt?=
 =?utf-8?B?OXNDc1JIaUkyaWxqZURoRUpVT0RvaXFUODdxcWFWWGt1LzdYYjQ3bVVqakxu?=
 =?utf-8?B?eFFOTXlZK25MNlFMbHdUVDZoZmtSYVNsZnZDV0dWWjJRbVpTV3JabklqTzhn?=
 =?utf-8?B?UjEyOW9WQ2VDbXR1c1hrV1YzakQ5OEZMQ3UwaEtoYjZKd21jUTJYZ1B1S2ZV?=
 =?utf-8?B?S1VBdDBwUVQ3bExYWFRrdzIxTGIzMmFhbG9iYUdKVTIwdml3YkJsS0hseHlL?=
 =?utf-8?B?NXc0NXFyOXNQSG5XL05WT01GYkZwMHZNYkJTUjcwalRIWjJ4aGk1M3Rhd09n?=
 =?utf-8?B?Z3dZSWU4cG5MOEdNVUU3SURIYjh3alg3Z0J6cnd4ZVRVdUJlbmY5YlFTaDRw?=
 =?utf-8?B?aUI5OVgvZTZpd1NQVzdFb1ZEZlVxMitsTWdJeHVnNzd3SFVQWkZHMUdRaTUv?=
 =?utf-8?B?cytheUpBbVZOOHhzZlRiUDdqdERTUWphNXdVc3VoNnd0N3FHZlRFNzl2M2NW?=
 =?utf-8?B?WUxhZDkvZWwzNm1PWFlqUjArNSszT1lNNmM4ck91TTV2SWlHQWVPSlpQLzJz?=
 =?utf-8?B?WFQ2TFBCMkxOeEFHNE9OQXlMTDVNZlRoTWlodVJ1SzdsQ01iSTI1NXVmWkhx?=
 =?utf-8?B?Rzk1Zm4ycWd3QmxCTFBtbXlnUDM0R296c3JRTDdITTkxbE9HNm9YWWwxaGdQ?=
 =?utf-8?B?N0ROWlpIM0Z0TW5JTkhVMHpkN3RldzJXVmk0QmRCWXZzeGx2MVhQWkxMaUN1?=
 =?utf-8?B?TW56N3JYaVlIUEhsSlFETEhML3R1Nk9PSUlaY2tWVzlqeVpMdk9HeHAvSmxm?=
 =?utf-8?B?ZzF0RkF2Q3pWU0RobC9za0gram9oaGlsNUdpckh0a09WS0NySUZXVkdUYUMr?=
 =?utf-8?B?RWJTQ0JSOUN1NnkxVFlkVUMrSU9wa0tWWlpmZ0pxT2l3N25pUFR1NXNQMFJL?=
 =?utf-8?B?TG1ET1E2bHBBUVY1WW91SzBEMHBuTEVPYUlMTi9hMmR4VFNhZHNobndUUGpv?=
 =?utf-8?B?bzMwVU1JMHNyblpjS3p3djZyOWpRcHg4MWc0RDhwcGhBL2JON0tXUGdPaTla?=
 =?utf-8?B?eWZNbGNIOFNFaTRxaWZNTXBsZlI1aW90czJQUEZCUmtkY1Nsb2RQQm1PQkRo?=
 =?utf-8?B?L2E3ODc2R0o5aGVKZWk2VXZpbXRjRGxlZ0JLRXpuak84WDBQR3VoNXlTaU5o?=
 =?utf-8?B?eG9MMEc5cWtGTzl6ZTRFcEs1eGlLSzZacUM4VXdXOHFTLzVLdVRpd0FiUkRY?=
 =?utf-8?B?K0MrRUd0bGlmZmZRMnYyTGpqSUptYnc9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6133cf9f-d0f5-438a-0ff6-08dc1b683f0a
X-MS-Exchange-CrossTenant-AuthSource: TYZPR01MB5556.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2024 16:36:12.9183 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR01MB5410
Cc: mcoquelin.stm32@gmail.com, netdev@vger.kernel.org, richardcochran@gmail.com,
 linux-kernel@vger.kernel.org, Abhishek Sahu <absahu@codeaurora.org>,
 linux-mediatek@lists.infradead.org, Praveenkumar I <ipkumar@codeaurora.org>,
 p.zabel@pengutronix.de, matthias.bgg@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Subject: Re: [Linux-stm32] [PATCH 5/8] clk: qcom: support for duplicate freq
 in RCG2 freq table
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

5ZyoIDIwMjQvMS8yMiAwOjU3LCBBbmRyZXcgTHVubiDlhpnpgZM6Cj4gT24gU3VuLCBKYW4gMjEs
IDIwMjQgYXQgMDg6NDI6MzRQTSArMDgwMCwgWml5YW5nIEh1YW5nIHdyb3RlOgo+PiBGcm9tOiBQ
cmF2ZWVua3VtYXIgSSA8aXBrdW1hckBjb2RlYXVyb3JhLm9yZz4KPj4KPj4gQ3VycmVudGx5IFJD
RyBjb2RlIGxvb2tzIHVwIHRoZSBmcmVxdWVuY3kgdGFibGUgZHVyaW5nIHNldAo+PiByYXRlIGFu
ZCByZXR1cm4gdGhlIGZpcnN0IGF2YWlsYWJsZSBmcmVxdWVuY3kgZ3JlYXRlciB0aGFuCj4+IHJl
cXVlc3RlZCByYXRlLiBJZiBDTEtfU0VUX1JBVEVfUEFSRU5UIGZsYWcgaXMgc2V0IHRoZW4gdGhl
Cj4+IHNldF9yYXRlIHJlcXVlc3Qgd2lsbCBnbyB0byBpdHMgcGFyZW50IG90aGVyd2lzZSB0aGUg
Y2xvY2sKPj4gZnJhbWV3b3JrIHdpbGwgY29uZmlndXJlIHByZS1kaXYsIG0gYW5kIG4gYWNjb3Jk
aW5nIHRvIHRoZQo+PiByZXR1cm5lZCBmcmVxdWVuY3kgdGFibGUgZW50cnkuIEluIHRoaXMgY2Fz
ZSwgaXQgaXMgYXNzdW1pbmcKPj4gdGhhdCBwYXJlbnQgY2xvY2sgd2lsbCBydW4gaW4gdGhlIHNh
bWUgZnJlcXVlbmN5IHdpdGggd2hpY2gKPj4gcHJlLWRpdiwgbSBhbmQgbiBoYXMgYmVlbiBkZXJp
dmVkLiBCdXQgaXQgbWF5IGJlIHBvc3NpYmxlCj4+IHRoYXQgdGhlIHBhcmVudCBjbG9jayBzdXBw
b3J0cyBtdWx0aXBsZSBmcmVxdWVuY3kgYW5kIHRoZQo+PiBzYW1lIGZyZXF1ZW5jeSBjYW4gYmUg
ZGVyaXZlZCB3aXRoIGRpZmZlcmVudCBwcmUtZGl2LCBtIGFuZAo+PiBuIHZhbHVlcyBkZXBlbmRp
bmcgdXBvbiBjdXJyZW50IGZyZXF1ZW5jeS4gIEFsc28sIHRoZSBzYW1lCj4+IGZyZXF1ZW5jeSBj
YW4gYmUgZGVyaXZlZCBmcm9tIGRpZmZlcmVudCBwYXJlbnQgc291cmNlcyBhbmQKPj4gY3VycmVu
dGx5IHRoZXJlIGlzIG5vIG9wdGlvbiBmb3IgaGF2aW5nIGR1cGxpY2F0ZQo+PiBmcmVxdWVuY2ll
cyBpbiBmcmVxdWVuY3kgdGFibGUgYW5kIGNob29zaW5nIHRoZSBiZXN0IG9uZQo+PiBhY2NvcmRp
bmcgdG8gY3VycmVudCByYXRlLgo+Pgo+PiBOb3cgdGhpcyBwYXRjaCBhZGRzIHRoZSBzdXBwb3J0
IGZvciBoYXZpbmcgZHVwbGljYXRlCj4+IGZyZXF1ZW5jaWVzIGluIGZyZXF1ZW5jeSB0YWJsZS4g
RHVyaW5nIHNldCByYXRlLCBpdCB3aWxsCj4+IGNvbXBhcmUgdGhlIGFjdHVhbCByYXRlIGZvciBl
YWNoIGVudHJ5IHdpdGggcmVxdWVzdGVkIHJhdGUKPj4gYW5kIHdpbGwgc2VsZWN0IHRoZSBiZXN0
IGVudHJ5IGluIHdoaWNoIHRoZSBkaWZmZXJlbmNlIHdpbGwKPj4gYmUgbGVzcy4KPj4KPj4gVGhl
IGV4aXN0aW5nIGZ1bmN0aW9uYWxpdHkgd29u4oCZdCBiZSBhZmZlY3RlZCB3aXRoIHRoaXMgY29k
ZQo+PiBjaGFuZ2Ugc2luY2UgdGhpcyBjb2RlIGNoYW5nZSB3aWxsIGhpdCBvbmx5IGlmIGZyZXF1
ZW5jeQo+PiB0YWJsZSBoYXMgZHVwbGljYXRlIHZhbHVlcy4KPiAKPiBBIGdvb2QgY29tbWl0IG1l
c3NhZ2UgZm9yIGEgY2hhbmdlIQo+IAo+Pgo+PiBDaGFuZ2UtSWQ6IEk5N2Q5ZTFiNTVkOGYzZWUw
OTVmNmYwMTcyOWFmNTI3YmE5MGU1MGU1Cj4+IFNpZ25lZC1vZmYtYnk6IEFiaGlzaGVrIFNhaHUg
PGFic2FodUBjb2RlYXVyb3JhLm9yZz4KPj4gKGNoZXJyeSBwaWNrZWQgZnJvbSBjb21taXQgNzc1
ZTdkM2I2OWZmYzk3YWZiNWJkNWE2YzljNDIzZjJmNGQ4YTBiMikKPj4gU2lnbmVkLW9mZi1ieTog
UHJhdmVlbmt1bWFyIEkgPGlwa3VtYXJAY29kZWF1cm9yYS5vcmc+Cj4+Cj4+IENoYW5nZS1JZDog
SWYxMDE5M2ZjNzlhM2MxMzc1YWI3MzU5NzgxMzc0NWZmMWY0ZGYwYWQKPj4KPj4gUGljayBmcm9t
IGh0dHBzOi8vZ2l0LmNvZGVsaW5hcm8ub3JnL2Nsby9xc2RrL29zcy9rZXJuZWwvbGludXgtaXBx
LTUuNC8tL2NvbW1pdC82ZGZiMzY4YmFlMTMwYmVlNThlMDBkZGY4MzMwYjU1MDY2ZTFjOGM1Cj4+
Cj4+IFNpZ25lZC1vZmYtYnk6IFppeWFuZyBIdWFuZyA8aHp5aXRjQG91dGxvb2suY29tPgo+IAo+
IFBsZWFzZSBjbGVhbiB1cCB0aGVzZSB0YWdzLiBUaGVzZSBDaGFuZ2UtSUQgdGFncyBhcmUgbWVh
bmluZ2xlc3MgaW4KPiBtYWlubGluZS4gNzc1ZTdkM2I2OWZmYzk3YWZiNWJkNWE2YzljNDIzZjJm
NGQ4YTBiMiBpcyBub3QgaW4gbWFpbmxpbmUKPiBlaXRoZXIuIFRoZSBwaWNrZWQgZnJvbSBtaWdo
dCBiZSBpbnRlcmVzdGluZywgYnV0IHBsZWFzZSBwdXQgaXQgaW50bwo+IHRoZSBib2R5IG9mIHRo
ZSBjb21taXQgbWVzc2FnZSwgbm90IG1peGVkIGluIHdpdGggdGhlIHRhZ3MuCj4gCj4gV2hvIGFj
dHVhbGx5IHdyb3RlIHRoaXMgcGF0Y2g/IFRoZSBmaXJzdCBTaWduZWQtb2ZmLWJ5OiBpcyBmcm9t
Cj4gQWJoaXNoZWsgU2FodS4gQnV0IHlvdSBoYXZlIGEgRnJvbSBvZiBQcmF2ZWVua3VtYXIgSSA/
CgpJIGhhdmUgbm8gaWRlYSBhYm91dCB0aGlzLiBUaGlzIHBhdGNoIGlzIGZyb20gUXVhbGNvbW0g
dmVuZG9yIGxpbnV4IApjb2RlLiBBbmQgaXQncyBuZWNlc3NhcnkgZm9yIGNob29zaW5nIHBhcmVu
dCBhbmQgY2FsY3VsYXRpbmcgY2xvY2sgcmF0ZSAKY29ycmVjdGx5LgoKV2hhdCdzIG1vcmUsIEkg
ZG9uJ3Qga25vd24gaG93IHRvIGRlYWwgd2l0aCB0aGVzZSBjb21taXQgbWVzc2FnZSBzaW5jZSAK
SSdtIG5vdCB0aGUgYXV0aG9yIGFuZCBJJ20gbm90IHN1cmUgZG8gSSBoYXZlIHJpZ2h0IHRvIGVk
aXQgdGhlbSBldmVuIAp0aG91Z2ggdGhpcyBpcyBHUEwgY29kZS4KCj4gCj4gICAgICBBbmRyZXcK
PiAKPiAtLS0KPiBwdy1ib3Q6IGNyCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
