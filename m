Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B528C7E02
	for <lists+linux-stm32@lfdr.de>; Thu, 16 May 2024 23:24:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7CA41C6C83A;
	Thu, 16 May 2024 21:24:27 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2D4A7C69066
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 May 2024 21:24:20 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id BF38988410;
 Thu, 16 May 2024 23:24:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1715894659;
 bh=0io0g3AWBQsg1lVWjX0OfURgfAbrBcVZSYkBGvi99/E=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=h17qqsgof+PMaZHBzXY7LZAtE3I3o/cIG5/yp+yPp0HIrVmE5NxXmFKCI6dTMdSnt
 IKOrAGM8TJQAcvpVpbOzZYqOGzeGZnqF5QGYwtjbUIyDBuJLStjxl/8BoRzhcvFpv2
 NDQYZjWtgLpWpfFWPriTS1VffovMM5X8WZRNadeMQzLsSGcclxQgMDnglUt7Qdhsy3
 5MLJunCFGwE5D35hlU5glrl5/WD2qxcjCStNOloAlVdAiWufeLcK19Ajl8FZTGO5V2
 WDjwGm7gb0uwOgMNPWrXlPFajtqLNuQs7sUUwIZbTQjhtfReJBXcvwR8m1dfShTu7o
 lopIPNzcDJ8ag==
Message-ID: <c28e39e3-64d8-4ed7-a2e5-48ee124ef8e3@denx.de>
Date: Thu, 16 May 2024 22:01:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>,
 linux-crypto@vger.kernel.org
References: <20240513220349.183568-1-marex@denx.de>
 <b2d0dfcb-37d6-4375-a4ad-ca96a5339840@foss.st.com>
 <cc6f98eb-f6b2-4a34-a8ed-c0f759fa4c79@denx.de>
 <51951dd4-8e8c-4e67-89f6-6a710022e34f@foss.st.com>
 <3257e8f8-5bb0-4c75-a3a3-e5685b65de2a@denx.de>
 <5b39b5b6-7008-4362-a578-3faab87cd23b@foss.st.com>
 <2eb2b80e-8650-46cf-9d8f-6dd6a884558a@denx.de>
 <eb3a2581-efc6-40c3-a7ea-551865017d40@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <eb3a2581-efc6-40c3-a7ea-551865017d40@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Rob Herring <robh@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Yang Yingliang <yangyingliang@huawei.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Olivia Mackall <olivia@selenic.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] [RFC] clk: stm32mp1: Keep RNG1 clock
	always running
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

T24gNS8xNi8yNCA0OjM1IFBNLCBHYXRpZW4gQ0hFVkFMTElFUiB3cm90ZToKCkhpLAoKPj4+Pj4+
PiBXaGF0IGlmIHlvdSBhZGQgYSB0cmFjZSBpbiBhIHJhbmRvbSBnZW5lcmF0aW9uIGZ1bmN0aW9u
IGluIHJhbmRvbS5jPwo+Pj4+Pj4KPj4+Pj4+IERvIHlvdSBoYXZlIGEgZnVuY3Rpb24gbmFtZSBv
ciBsaW5lIG51bWJlciBmb3IgbWUgPwo+Pj4+Pgo+Pj4+PiBJIHB1dCBhIHRyYWNlIGluIF9nZXRf
cmFuZG9tX2J5dGVzKCkgaW4gZHJpdmVycy9jaGFyL3JhbmRvbS5jLiBJJ20gbm90Cj4+Pj4+IDEw
MCUgc3VyZSBidXQgdGhpcyBzaG91bGQgYmUgdGhlIGVudHJ5IHBvaW50IHdoZW4gZ2V0dGluZyBh
IHJhbmRvbSAKPj4+Pj4gbnVtYmVyLgo+Pj4+Cj4+Pj4gWW91J3JlIHJpZ2h0LCB0aGVyZSBpcyBh
IHJlYWQgYXR0ZW1wdCByaWdodCBiZWZvcmUgdGhlIGhhbmcsIGFuZCAKPj4+PiBfX2Nsa19pc19l
bmFibGVkKCkgcmV0dXJucyAwIGluIHN0bTMyX3JlYWRfcm5nKCkgLiBJbiBmYWN0LCBpdCBpcyAK
Pj4+PiB0aGUgcG1fcnVudGltZV9nZXRfc3luYygpIHdoaWNoIGlzIHJldHVybmluZyAtRUFDQ0VT
IGluc3RlYWQgb2YgCj4+Pj4gemVybywgYW5kIHRoaXMgaXMgY3VycmVudGx5IG5vdCBjaGVja2Vk
IHNvIHRoZSBmYWlsdXJlIGlzIG5vdCAKPj4+PiBkZXRlY3RlZCBiZWZvcmUgcmVnaXN0ZXIgYWNj
ZXNzIHRha2VzIHBsYWNlLCB0byByZWdpc3RlciBmaWxlIHdpdGggCj4+Pj4gY2xvY2sgZGlzYWJs
ZWQsIHdoaWNoIHRyaWdnZXJzIGEgaGFyZCBoYW5nLgo+Pj4+Cj4+Pj4gSSdsbCBiZSBzZW5kaW5n
IGEgcGF0Y2ggc2hvcnRseSwgdGhhbmtzIGZvciB0aGlzIGhpbnQgIQo+Pj4+Cj4+Pgo+Pj4gR3Jl
YXQgbmV3cywgaW5kZWVkIHRoZSByZXR1cm4gY29kZSBpc24ndCBjaGVja2VkLiBMZXQncyB1c2UK
Pj4+IHBtX3J1bnRpbWVfcmVzdW1lX2FuZF9nZXQoKS4KPj4KPj4gWWVzIHBsZWFzZS4KPj4KPj4g
SSB3aWxsIHdvbmRlciB3aHkgd2UgZ2V0IEVBQ0NFUyB0aG91Z2gsIHRoYXQgYmFzaWNhbGx5IG1l
YW5zIHdlIGFyZSAKPj4gc3VzcGVuZGluZyBhbHJlYWR5LiBJcyBpdCBzYWZlIHRvIHJldHVybiAt
ZXJybm8gZnJvbSBybmcgcmVhZCBmdW5jdGlvbiAKPj4gaW4gdGhhdCBjYXNlID8KPiAKPiBUaGUg
ZnJhbWV3b3JrIGV4cGVjdHMgYSBmdW5jdGlvbiB0aGF0IGNhbiByZXR1cm4gYW4gZXJyb3IgY29k
ZSBzbyBJCj4gZG9uJ3Qgc2VlIHdoeSBub3QuIEVsc2UgdGhlIGZyYW1ld29yayB3b3VsZCBoYXZl
IGFuIGlzc3VlLgo+IAo+IEkgc3RpbGwgaGF2ZW4ndCBmaWd1cmVkIG91dCB3aGF0IGlzIGhhcHBl
bmluZy4KPiAKPiBDb3VsZCBpdCBiZSB0aGF0IHRoZSBrZXJuZWwgaXMgZ2V0dGluZyBlbnRyb3B5
IHdpdGggaHdybmdfZmlsbGZuKCkKPiBsaWtlIGl0IGRvZXMgcGVyaW9kaWNhbGx5IHRvIGZlZWQg
dGhlIGVudHJvcHkgcG9vbCBhbmQgaXQgaGFwcGVucyBhdCB0aGUKPiBzYW1lIHRpbWUgYXMgeW91
ciBwbSB0ZXN0IHNlcXVlbmNlPwoKUG9zc2libHkuIEkgdXNlIHNjcmlwdCBhcyBpbml0IHdoaWNo
IGNvbnRhaW5zIGJhc2ljYWxseSAjIS9iaW4vc2ggLCAKbW91bnQgb2YgYSBmZXcgZmlsZXN5c3Rl
bXMgbGlrZSBkZXYsIHByb2MsIHN5cywgYW5kIHRoZW4gdGhlIHBtX3Rlc3QgCnNlcXVlbmNlIHRv
IGF2b2lkIHdhc3RpbmcgdGltZSBib290aW5nIGZ1bGwgdXNlcnNwYWNlLgoKPiBGWUksIEkgaGF2
ZSBiZWVuIHJ1bm5pbmcgeW91ciBzY3JpcHQgd2l0aCAoZWNobyBkZXZpY2VzID4gCj4gL3N5cy9w
b3dlci9wbV90ZXN0KSBmb3IgNSBob3VycyBub3cgYW5kIGhhdmVuJ3QgYmVlbiBhYmxlIHRvIHJl
cHJvZHVjZSAKPiB0aGUgaXNzdWUuCgpNYXliZSB0aGUgJ2RldmljZXMnIHRlc3QgaXMgbm90IGVu
b3VnaCBhbmQgdGhlIGRlZXBlciBwbV90ZXN0IHN0YXRlcyAKaGF2ZSBzb21lIHNvcnQgb2YgaW1w
YWN0ID8KCj4+Pj4+Pj4gQWZ0ZXIgdGhpcywgSSdsbCB0cnkgdG8gcmVwcm9kdWNlIHRoZSBpc3N1
ZS4KPj4+Pj4+Cj4+Pj4+PiBJZiB5b3UgaGF2ZSBhIG1pbnV0ZSB0byB0ZXN0IGl0IG9uIHNvbWUg
U1QgTVAxNSBib2FyZCwgdGhhdCB3b3VsZCAKPj4+Pj4+IGJlIHJlYWwgbmljZS4gVGhhbmtzICEK
Pj4+Pj4KPj4+Pj4gSSB0cmllZCB0byByZXByb2R1Y2UgdGhlIGlzc3VlIHlvdSdyZSBmYWNpbmcg
b24gYSBTVE0zMk1QMTU3Qy1ESzIgbm8KPj4+Pj4gU0NNSSBvbiB0aGUgNi45LXJjNyBrZXJuZWwg
dGFnLiBJIHVzZXMgT1AtVEVFIGFuZCBURi1BIGluIHRoZSAKPj4+Pj4gYm9vdGNoYWluCj4+Pj4+
IGJ1dCB0aGlzIHNob3VsZCBub3QgaGF2ZSBhbiBpbXBhY3QgaGVyZS4KPj4+Pj4KPj4+Pj4gSG93
IGRpZCB5b3UgbWFuYWdlIHRvIHRlc3QgdXNpbmcgImVjaG8gY29yZSA+IC9zeXMvcG93ZXIvcG1f
dGVzdCI/Cj4+Pj4+IEluIGtlcm5lbC9wb3dlci9zdXNwZW5kLmMsIGVudGVyX3N0YXRlKCkuIElm
IHRoZSBwbV90ZXN0X2xldmVsIGlzIAo+Pj4+PiBjb3JlLAo+Pj4+PiB0aGVuIGFuIGVycm9yIGlz
IGZpcmVkIHdpdGggdGhlIGZvbGxvd2luZyB0cmFjZToKPj4+Pj4gIlVuc3VwcG9ydGVkIHRlc3Qg
bW9kZSBmb3Igc3VzcGVuZCB0byBpZGxlLCBwbGVhc2UgY2hvb3NlIAo+Pj4+PiBub25lL2ZyZWV6
ZXIvZGV2aWNlcy9wbGF0Zm9ybS4iCj4+Pj4KPj4+PiBDb3VsZCB0aGlzIGJlIGZpcm13YXJlIHJl
bGF0ZWQgPwo+Pj4+Cj4+Pj4+IEkndmUgdHJpZWQgdXNpbmcgImVjaG8gZGV2aWNlcyA+IC9zeXMv
cG93ZXIvcG1fdGVzdCIgc28gdGhhdCBJIGNhbiAKPj4+Pj4gYXQgbGVhc3QgdGVzdCB0aGF0IHRo
ZSBkcml2ZXIgaXMgcHV0IHRvIHNsZWVwIHRoZW4gd2FrZXMgdXAuIEkgZG8gbm90Cj4+Pj4+IHJl
cHJvZHVjZSB5b3VyIGlzc3VlLgo+Pj4+Cj4+Pj4gQ2FuIHlvdSB0cnkgJ3Byb2Nlc3NvcnMnID8K
Pj4+Pgo+Pj4KPj4+IEdpdmVuIHRoaXM6Cj4+PiAjaWZkZWYgQ09ORklHX1BNX0RFQlVHCj4+PiDC
oMKgwqDCoMKgwqDCoMKgIGlmIChwbV90ZXN0X2xldmVsICE9IFRFU1RfTk9ORSAmJiBwbV90ZXN0
X2xldmVsIDw9IFRFU1RfQ1BVUykgewo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHByX3dh
cm4oIlVuc3VwcG9ydGVkIHRlc3QgbW9kZSBmb3Igc3VzcGVuZCB0byBpZGxlCj4+Cj4+IFlvdSdy
ZSBzdXBwb3NlZCB0byBiZSBzdXNwZW5kaW5nIHRvICdtZW0nICwgbm90ICdpZGxlJyAuIENvdWxk
IHRoYXQgYmUgCj4+IGl0ID8KPiAKPiBZZXMgeW91J3JlIHJpZ2h0LCBJJ3ZlIGJlZW4gbWlzc2lu
ZyB0aGF0LiBJIGRvIG5vdCBoYXZlICJkZWVwIiBhdmFpbGFibGUKPiBpbiAvc3lzL3Bvd2VyL21l
bV9zbGVlcC4uLiBub3QgdXBzdHJlYW1lZCB5ZXQgbWF5YmUuLi4gSGF2ZSB5b3UgY29kZWQgYQo+
IFBTQ0kgc2VydmljZSBmb3IgdGhpcyBpbiBVLUJvb3Q/Cj4gCj4gSSdtIGVpdGhlciBtaXNzaW5n
IHNvbWV0aGluZyBvciBJIGNhbid0IHJlcHJvZHVjZSB5b3VyIHNldHVwLgoKVGhlIFBTQ0kgcHJv
dmlkZXIgaW4gVS1Cb290IGhhcyBiZWVuIGluIHBsYWNlIGZvciB5ZWFycywgdGhlcmUncyBubyBu
ZWVkIAp0byBjb2RlIGFueXRoaW5nLCBqdXN0IGNvbXBpbGUgaXQgYW5kIHRoYXQncyBhbGw6Cgok
IG1ha2Ugc3RtMzJtcDE1X2Jhc2ljX2RlZmNvbmZpZyAmJiBtYWtlIC1qYG5wcm9jYAoKVGhpcyBn
ZXRzIHlvdSB1LWJvb3Qtc3BsLnN0bTMyIGFuZCB1LWJvb3QuaXRiIGFzIEZTQkwvU1NCTCAuCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMy
IG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0
dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXN0bTMyCg==
