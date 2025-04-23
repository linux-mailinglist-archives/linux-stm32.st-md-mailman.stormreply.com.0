Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DFCFA9986D
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Apr 2025 21:24:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D3821C7802F;
	Wed, 23 Apr 2025 19:24:37 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 92E4CC7128A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Apr 2025 19:24:36 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 57DE443D43;
 Wed, 23 Apr 2025 19:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1745436276;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j2tDrkkBQe3JKRslIUmoWfOqe7k2mOTW95nGkd+giIA=;
 b=JyMP61V2AwXdhFa/MfRsPknQuX+9zLoQUYtqvFgqLxqliWXnPJH34GipEY9qLDu8f7SOwF
 L8jxLNkDlXpvpCTUahNBDq64T+h8dShffNbUpErWHn1x/hthcTZ5Vhfb+11gcMowNWfteN
 lMtxy7eNihMWGR1cfiyeiBMHdFAh6/Qkp740gcZF/k3F/n5r2A+L97u2Wp7fBZWy0zuMo+
 PYecer6KKZ/ZgNu1gqyVkTs47GKuuYwTdT3yWzZ9AXC833zqNXwOSMWk8F7fOivfSBFC1Q
 gdPEfuqHmDoodf8h5KichaaTG/S7VwJ99WpomEnNl9DoF7NAvN0SmDDj5OvjeA==
Mime-Version: 1.0
Date: Wed, 23 Apr 2025 21:24:34 +0200
Message-Id: <D9E9IQQ3QKXM.3UJ17G9CBS1FH@bootlin.com>
From: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: "Andrii Nakryiko" <andrii.nakryiko@gmail.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250411-many_args_arm64-v1-0-0a32fe72339e@bootlin.com>
 <20250411-many_args_arm64-v1-1-0a32fe72339e@bootlin.com>
 <CAEf4Bzbn6BdXTOb0dTcsQmOMZpp5=DzGS2hHHQ3+dwcja=gv+w@mail.gmail.com>
 <D98Q8BRNUVS9.11J60C67L1ALR@bootlin.com>
 <CAEf4BzZHMYyGDZ4c4eNXG7Fm=ecxCCbKhKbQTbCjvWmKtdwvBw@mail.gmail.com>
In-Reply-To: <CAEf4BzZHMYyGDZ4c4eNXG7Fm=ecxCCbKhKbQTbCjvWmKtdwvBw@mail.gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeejgeefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkhffvvefuofhfjgesthhqredtredtjeenucfhrhhomheptehlvgigihhsucfnohhthhhorhoruceorghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehveevkeelvdejhffhudfhtdevvddvfffgiedtveejiefgveeljeduveetuddtveenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemkeegvdekmehfleegtgemvgdttdemmehfkeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvkeemfhelgegtmegvtddtmeemfhekhedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeeftddprhgtphhtthhopegrnhgurhhiihdrnhgrkhhrhihikhhosehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghstheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggrnhhivghlsehiohhgvggrrhgsohigrdhnvghtpdhrtghpthhtohepjhhohhhnr
 dhfrghsthgrsggvnhgusehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghnughrihhisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmrghrthhinhdrlhgruheslhhinhhugidruggvvhdprhgtphhtthhopegvugguhiiikeejsehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhonhhgsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: alexis.lothore@bootlin.com
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Catalin
 Marinas <catalin.marinas@arm.com>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, Shuah Khan <shuah@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Mykola Lysenko <mykolal@fb.com>,
 Daniel Borkmann <daniel@iogearbox.net>, Will Deacon <will@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>,
 Stanislav Fomichev <sdf@fomichev.me>,
 Bastien Curutchet <bastien.curutchet@bootlin.com>,
 Florent Revest <revest@chromium.org>, Puranjay Mohan <puranjay@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, ebpf@linuxfoundation.org,
 Xu Kuohai <xukuohai@huaweicloud.com>, Alexei Starovoitov <ast@kernel.org>,
 KP Singh <kpsingh@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Hao Luo <haoluo@google.com>, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, Eduard Zingerman <eddyz87@gmail.com>,
 Jiri Olsa <jolsa@kernel.org>, bpf@vger.kernel.org,
 Martin KaFai Lau <martin.lau@linux.dev>
Subject: Re: [Linux-stm32] [PATCH RFC bpf-next 1/4] bpf: add struct largest
 member size in func model
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

SGkgQW5kcmlpLAoKT24gV2VkIEFwciAyMywgMjAyNSBhdCA3OjE1IFBNIENFU1QsIEFuZHJpaSBO
YWtyeWlrbyB3cm90ZToKPiBPbiBUaHUsIEFwciAxNywgMjAyNSBhdCAxMjoxNOKAr0FNIEFsZXhp
cyBMb3Rob3LDqQo+IDxhbGV4aXMubG90aG9yZUBib290bGluLmNvbT4gd3JvdGU6Cj4+Cj4+IEhp
IEFuZHJpaSwKPj4KPj4gT24gV2VkIEFwciAxNiwgMjAyNSBhdCAxMToyNCBQTSBDRVNULCBBbmRy
aWkgTmFrcnlpa28gd3JvdGU6Cj4+ID4gT24gRnJpLCBBcHIgMTEsIDIwMjUgYXQgMTozMuKAr1BN
IEFsZXhpcyBMb3Rob3LDqSAoZUJQRiBGb3VuZGF0aW9uKQo+PiA+IDxhbGV4aXMubG90aG9yZUBi
b290bGluLmNvbT4gd3JvdGU6CgpbLi4uXQoKPj4gSW5kZWVkIEkgaW5pdGlhbGx5IGNoZWNrZWQg
d2hldGhlciBJIGNvdWxkIHJldHVybiBkaXJlY3RseSBzb21lIGFsaWdubWVudAo+PiBpbmZvIGZy
b20gYnRmLCBidXQgaXQgdGhlbiBpbnZvbHZlcyB0aGUgYWxpZ25tZW50IGNvbXB1dGF0aW9uIGlu
IHRoZSBidGYKPj4gbW9kdWxlLiBTaW5jZSB0aGVyZSBjb3VsZCBiZSBtaW5vciBkaWZmZXJlbmNl
cyBiZXR3ZWVuIGFyY2hpdGVjdHVyZXMgYWJvdXQKPj4gYWxpZ25tZW50IHJlcXVpcmVtZW50cywg
SSB0aG91Z2ggaXQgd291bGQgYmUgYmV0dGVyIHRvIGluIGZhY3Qga2VlcCBhbGlnbm1lbnQKPj4g
Y29tcHV0YXRpb24gb3V0IG9mIHRoZSBidGYgbW9kdWxlLiBGb3IgZXhhbXBsZSwgSSBzZWUgdGhh
dCAxMjggYml0cyB2YWx1ZXMKPj4gYXJlIGFsaWduZWQgb24gMTYgYnl0ZXMgb24gQVJNNjQsIHdo
aWxlIGJlaW5nIGFsaWduZWQgb24gOCBieXRlcyBvbiBTMzkwLgo+Pgo+PiBBbmQgc2luY2UgZm9y
IEFSTTY0LCBhbGwgbmVlZGVkIGFsaWdubWVudHMgYXJlIHNvbWVob3cgZGVyaXZlZCBmcm9tIHNp
emUKPj4gKGl0IGlzIGVpdGhlciBkaXJlY3RseSBzaXplIGZvciBmdW5kYW1lbnRhbCB0eXBlcywg
b3IgYWxpZ25tZW50IG9mIHRoZQo+PiBsYXJnZXN0IG1lbWJlciBmb3Igc3RydWN0cywgd2hpY2gg
aXMgdGhlbiBzaXplIG9mIGxhcmdlc3QgbWVtYmVyKSwKPj4gcmV0dXJuaW5nIHRoZSBzaXplIHNl
ZW1zIHRvIGJlIGVub3VnaCB0byBhbGxvdyB0aGUgSklUIHNpZGUgdG8gY29tcHV0ZQo+PiBhbGln
bm1lbnRzLgo+Cj4gSWYgeW91IG1lYW4gdGhlIHNpemUgb2YgInByaW1pdGl2ZSIgZmllbGQgYW5k
L29yIGFycmF5IGVsZW1lbnQKPiAoYXBwbGllZCByZWN1cnNpdmVseSBmb3IgYWxsIGVtYmVkZGVk
IHN0cnVjdHMvdW5pb25zKSB0aGVuIHllcywgdGhhdCdzCj4gY2xvc2UgZW5vdWdoLiBCdXQgc2F5
aW5nIGp1c3QgImxhcmdlc3Qgc3RydWN0IG1lbWJlciIgaXMgd3JvbmcsCj4gYmVjYXVzZSBmb3IK
Pgo+IHN0cnVjdCBibGFoIHsKPiAgICAgc3RydWN0IHsKPiAgICAgICAgIGludCB3aGF0ZXZlclsx
MjhdOwo+ICAgICB9IGhleWE7Cj4gfTsKPgo+Cj4gYmxhaC5oZXlhIGhhcyBhIGxhcmdlIHNpemUs
IGJ1dCBhbGlnbm1lbnQgaXMgc3RpbGwganVzdCA0IGJ5dGVzLgoKSW5kZWVkLCB0aGF0J3MgYW5v
dGhlciBjYXNlIG1ha2luZyBteSBwcm9wb3NhbCBmYWlsIDopCgo+IEknZCBzdWdnZXN0IGxvb2tp
bmcgYXQgYnRmX19hbGlnbl9vZigpIGluIGxpYmJwZiAodG9vbHMvbGliL2JwZi9idGYuYykKPiB0
byBzZWUgaG93IHdlIGNhbGN1bGF0ZSBhbGlnbm1lbnQgdGhlcmUuIEl0IHNlZW1zIHRvIHdvcmsg
ZGVjZW50bHkKPiBlbm91Z2guIEl0IHdvbid0IGNvdmVyIGFueSBhcmNoLXNwZWNpZmljIGV4dHJh
IHJ1bGVzIGxpa2UgZG91YmxlCj4gbmVlZGluZyAxNi1ieXRlIGFsaWdubWVudCAoSSB2YWd1ZWx5
IHJlbWVtYmVyIHNvbWV0aGluZyBsaWtlIHRoYXQgZm9yCj4gc29tZSBhcmNoaXRlY3R1cmVzLCBi
dXQgSSBtaWdodCBiZSBtaXNyZW1lbWJlcmluZyksIG9yIGFueXRoaW5nCj4gc2ltaWxhci4gSXQg
YWxzbyB3b24ndCBkZXRlY3QgKEkgZG9uJ3QgdGhpbmsgaXQncyBwb3NzaWJsZSB3aXRob3V0Cj4g
RFdBUkYpIGFydGlmaWNpYWxseSBpbmNyZWFzZWQgYWxpZ25tZW50IHdpdGggYXR0cmlidXRlKChh
bGlnbmVkKE4pKSkuCgpUaGFua3MgZm9yIHRoZSBwb2ludGVyLCBJJ2xsIHRha2UgYSBsb29rIGF0
IGl0LiBUaGUgbW9yZSB3ZSBkaXNjdXNzIHRoaXMKc2VyaWVzLCB0aGUgbGVzcyBtZW1iZXIgc2l6
ZSBzb3VuZHMgcmVsZXZhbnQgZm9yIHdoYXQgSSdtIHRyeWluZyB0byBhY2hpZXZlCmhlcmUuCgpG
b2xsb3dpbmcgWHUncyBjb21tZW50cywgSSBoYXZlIGJlZW4gdGhpbmtpbmcgYWJvdXQgaG93IEkg
Y291bGQgZGV0ZWN0IHRoZQpjdXN0b20gYWxpZ25tZW50cyBhbmQgcGFja2luZyBvbiBzdHJ1Y3R1
cmVzLCBhbmQgSSB3YXMgd29uZGVyaW5nIGlmIEkgY291bGQKc29tZWhvdyBiZW5lZml0IGZyb20g
X19hdHRyaWJ1dGVfXyBlbmNvZGluZyBpbiBCVEYgaW5mbyAoWzFdKS4gQnV0CmZvbGxvd2luZyB5
b3VyIGhpbnQsIEkgYWxzbyBzZWUgc29tZSBidGZfaXNfc3RydWN0X3BhY2tlZCgpIGluCnRvb2xz
L2xpYi9icGYvYnRmX2R1bXAuYyB0aGF0IGNvdWxkIGhlbHAuIEknbGwgZGlnIHRoaXMgZnVydGhl
ciBhbmQgc2VlIGlmCkkgY2FuIG1hbmFnZSB0byBtYWtlIHNvbWV0aGluZyB3b3JrIHdpdGggYWxs
IG9mIHRoaXMuCgpUaGFua3MsCgpBbGV4aXMKClsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9i
cGYvMjAyNTAxMzAyMDEyMzkuMTQyOTY0OC0xLWlob3Iuc29sb2RyYWlAbGludXguZGV2LwoKLS0g
CkFsZXhpcyBMb3Rob3LDqSwgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2lu
ZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBz
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
