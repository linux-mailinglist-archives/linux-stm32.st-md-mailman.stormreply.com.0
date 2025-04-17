Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0A0A914D3
	for <lists+linux-stm32@lfdr.de>; Thu, 17 Apr 2025 09:14:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9CB94C78F74;
	Thu, 17 Apr 2025 07:14:24 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8339EC78034
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Apr 2025 07:14:22 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4313F439D4;
 Thu, 17 Apr 2025 07:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1744874062;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YYgBl4XslUIPANcfaH0UDI8ZQnEJjTNt9jHQJbKWOHU=;
 b=YEhNjld6ymNJqLjNHhBzpSnN7oxSp7ezkwtyyDXqHLLiBD8JhNvqejYTXoBMtvZDkSP9do
 k/g8vZ3fmZQuP3/3LiwBWp9ucZU5wxsKptb6ID4sRXNlXlDzNCdwKBE4ud8E4tGTCxlp8L
 r8mhLATCbpRcjr3kWeU0PDea0TtRrFjiETGwKZZLdbapYValXtnWGRLPuXGOGxpyB6ZoN+
 ox0SjwLvBXBPurAx36kStx7furqEBRLvFub9fqKWABp708RJsO3lOioWNEgT0zqj7dQbbR
 7wM7fZzmaeCPebZvlE5TDNCHnvG32PEWeTnAiwHpspnGjirRTX/je3h/ohWATw==
Date: Thu, 17 Apr 2025 09:14:16 +0200
Message-Id: <D98Q8BRNUVS9.11J60C67L1ALR@bootlin.com>
From: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: "Andrii Nakryiko" <andrii.nakryiko@gmail.com>
Mime-Version: 1.0
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250411-many_args_arm64-v1-0-0a32fe72339e@bootlin.com>
 <20250411-many_args_arm64-v1-1-0a32fe72339e@bootlin.com>
 <CAEf4Bzbn6BdXTOb0dTcsQmOMZpp5=DzGS2hHHQ3+dwcja=gv+w@mail.gmail.com>
In-Reply-To: <CAEf4Bzbn6BdXTOb0dTcsQmOMZpp5=DzGS2hHHQ3+dwcja=gv+w@mail.gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdekieefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegtfffkvefuhffvggfgofhfjgesthhqredtredtjeenucfhrhhomheptehlvgigihhsucfnohhthhhorhoruceorghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedvhfdvjeektefggfdvhfejveehleeugfeiieelgfffheeggefhvddvudefiedtfeenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedtpdhrtghpthhtoheprghnughrihhirdhnrghkrhihihhkohesghhmrghilhdrtghomhdprhgtphhtthhopegrshhtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegurghnihgvlhesihhoghgvrghrsghogidrnhgvthdprhgtphhtthhopehjohhhnhdrfhgrshhtrggsvghnugesghhmrghilhdrtghomhdprhgtphhtthhopegrnhgur
 hhiiheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgrrhhtihhnrdhlrghusehlihhnuhigrdguvghvpdhrtghpthhtohepvgguugihiiekjeesghhmrghilhdrtghomhdprhgtphhtthhopehsohhngheskhgvrhhnvghlrdhorhhg
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

SGkgQW5kcmlpLAoKT24gV2VkIEFwciAxNiwgMjAyNSBhdCAxMToyNCBQTSBDRVNULCBBbmRyaWkg
TmFrcnlpa28gd3JvdGU6Cj4gT24gRnJpLCBBcHIgMTEsIDIwMjUgYXQgMTozMuKAr1BNIEFsZXhp
cyBMb3Rob3LDqSAoZUJQRiBGb3VuZGF0aW9uKQo+IDxhbGV4aXMubG90aG9yZUBib290bGluLmNv
bT4gd3JvdGU6Cj4+Cj4+IEluIG9yZGVyIHRvIHByb3Blcmx5IEpJVCB0aGUgdHJhbXBvbGluZXMg
bmVlZGVkIHRvIGF0dGFjaCBCUEYgcHJvZ3JhbXMKPj4gdG8gZnVuY3Rpb25zLCBzb21lIGFyY2hp
dGVjdHVyZXMgbGlrZSBBUk02NCBuZWVkIHRvIGtub3cgYWJvdXQgdGhlCj4+IGFsaWdubWVudCBu
ZWVkZWQgZm9yIHRoZSBmdW5jdGlvbiBhcmd1bWVudHMuIFN1Y2ggYWxpZ25tZW50IGNhbgo+PiBn
ZW5lcmFsbHkgYmUgZGVkdWNlZCBmcm9tIHRoZSBhcmd1bWVudCBzaXplLCBidXQgdGhhdCdzIG5v
dCBjb21wbGV0ZWx5Cj4+IHRydWUgZm9yIGNvbXBvc2l0ZSB0eXBlcy4gSW4gdGhlIHNwZWNpZmlj
IGNhc2Ugb2YgQVJNNjQsIHRoZSBBQVBDUzY0IEFCSQo+PiBkZWZpbmVzIHRoYXQgYSBjb21wb3Np
dGUgdHlwZSB3aGljaCBuZWVkcyB0byBiZSBwYXNzZWQgdGhyb3VnaCBzdGFjawo+PiBtdXN0IGJl
IGFsaWduZWQgb24gdGhlIG1heGltdW0gYmV0d2VlbiA4IGFuZCB0aGUgbGFyZ2VzdCBhbGlnbm1l
bnQKPj4gY29uc3RyYWludCBvZiBpdHMgZmlyc3QtbGV2ZWwgbWVtYmVycy4gU28gdGhlIEpJVCBj
b21waWxlciBuZWVkcyBtb3JlCj4+IGluZm9ybWF0aW9uIGFib3V0IHRoZSBhcmd1bWVudHMgdG8g
bWFrZSBzdXJlIHRvIGdlbmVyYXRlIGNvZGUgdGhhdAo+PiByZXNwZWN0cyB0aG9zZSBhbGlnbm1l
bnQgY29uc3RyYWludHMuCj4+Cj4+IEZvciBzdHJ1Y3QgYXJndW1lbnRzLCBhZGQgaW5mb3JtYXRp
b24gYWJvdXQgdGhlIHNpemUgb2YgdGhlIGxhcmdlc3QKPj4gZmlyc3QtbGV2ZWwgbWVtYmVyIGlu
IHRoZSBzdHJ1Y3QgYnRmX2Z1bmNfbW9kZWwgdG8gYWxsb3cgdGhlIEpJVAo+PiBjb21waWxlciB0
byBndWVzcyB0aGUgbmVlZGVkIGFsaWdubWVudC4gVGhlIGluZm9ybWF0aW9uIGlzIHF1aXRlCj4K
PiBJIG1pZ2h0IGJlIG1pc3Npbmcgc29tZXRoaW5nLCBidXQgaG93IGNhbiB0aGUgKnNpemUqIG9m
IHRoZSBmaWVsZCBiZQo+IHVzZWQgdG8gY2FsY3VsYXRlIHRoYXQgYXJndW1lbnQncyAqYWxpZ25t
ZW50Kj8gaS5lLiwgSSBkb24ndAo+IHVuZGVyc3RhbmQgd2h5IGFyZ19sYXJnZXN0X21lbWJlcl9z
aXplIG5lZWRzIHRvIGJlIGNhbGN1bGF0ZWQgaW5zdGVhZAo+IG9mIGFyZ19sYXJnZXN0X21lbWJl
cl9hbGlnbm1lbnQuLi4KCkluZGVlZCBJIGluaXRpYWxseSBjaGVja2VkIHdoZXRoZXIgSSBjb3Vs
ZCByZXR1cm4gZGlyZWN0bHkgc29tZSBhbGlnbm1lbnQKaW5mbyBmcm9tIGJ0ZiwgYnV0IGl0IHRo
ZW4gaW52b2x2ZXMgdGhlIGFsaWdubWVudCBjb21wdXRhdGlvbiBpbiB0aGUgYnRmCm1vZHVsZS4g
U2luY2UgdGhlcmUgY291bGQgYmUgbWlub3IgZGlmZmVyZW5jZXMgYmV0d2VlbiBhcmNoaXRlY3R1
cmVzIGFib3V0CmFsaWdubWVudCByZXF1aXJlbWVudHMsIEkgdGhvdWdoIGl0IHdvdWxkIGJlIGJl
dHRlciB0byBpbiBmYWN0IGtlZXAgYWxpZ25tZW50CmNvbXB1dGF0aW9uIG91dCBvZiB0aGUgYnRm
IG1vZHVsZS4gRm9yIGV4YW1wbGUsIEkgc2VlIHRoYXQgMTI4IGJpdHMgdmFsdWVzCmFyZSBhbGln
bmVkIG9uIDE2IGJ5dGVzIG9uIEFSTTY0LCB3aGlsZSBiZWluZyBhbGlnbmVkIG9uIDggYnl0ZXMg
b24gUzM5MC4gCgpBbmQgc2luY2UgZm9yIEFSTTY0LCBhbGwgbmVlZGVkIGFsaWdubWVudHMgYXJl
IHNvbWVob3cgZGVyaXZlZCBmcm9tIHNpemUKKGl0IGlzIGVpdGhlciBkaXJlY3RseSBzaXplIGZv
ciBmdW5kYW1lbnRhbCB0eXBlcywgb3IgYWxpZ25tZW50IG9mIHRoZQpsYXJnZXN0IG1lbWJlciBm
b3Igc3RydWN0cywgd2hpY2ggaXMgdGhlbiBzaXplIG9mIGxhcmdlc3QgbWVtYmVyKSwKcmV0dXJu
aW5nIHRoZSBzaXplIHNlZW1zIHRvIGJlIGVub3VnaCB0byBhbGxvdyB0aGUgSklUIHNpZGUgdG8g
Y29tcHV0ZQphbGlnbm1lbnRzLgoKPj4gc3BlY2lmaWMsIGJ1dCBpdCBhbGxvd3MgdG8ga2VlcCBh
cmNoLXNwZWNpZmljIGNvbmNlcm5zIChpZTogZ3Vlc3NpbmcgdGhlCj4+IGZpbmFsIG5lZWRlZCBh
bGlnbm1lbnQgZm9yIGFuIGFyZ3VtZW50KSBpc29sYXRlZCBpbiBlYWNoIEpJVCBjb21waWxlci4K
Pgo+IGNvdWxkbid0IGFsbCB0aGlzIGluZm9ybWF0aW9uIGJlIGNhbGN1bGF0ZWQgaW4gdGhlIEpJ
VCBjb21waWxlciAoaWYKPiBKSVQgbmVlZHMgdGhhdCkgZnJvbSBCVEY/CgpGcm9tIHdoYXQgSSB1
bmRlcnN0YW5kLCB0aGUgSklUIGNvbXBpbGVyIGRvZXMgbm90IGhhdmUgYWNjZXNzIHRvIEJURiBp
bmZvLApvbmx5IGEgc3Vic3RyYWN0IGZyb20gaXQsIGFycmFuZ2VkIGluIGEgc3RydWN0IGJ0Zl9m
dW5jX21vZGVsID8gVGhpcwpzdHJ1Y3QgYnRmX2Z1bmNfbW9kZWwgYWxyZWFkeSBoYXMgc2l6ZSBp
bmZvIGZvciBzdGFuZGFyZCB0eXBlcywgYnV0IGZvcgpzdHJ1Y3RzIHdlIG5lZWQgc29tZSBhZGRp
dGlvbmFsIGluZm8gYWJvdXQgdGhlIG1lbWJlcnMsIGhlbmNlIHRoaXMKYXJnX2xhcmdlc3RfbWVt
YmVyX2FsaWdubWVudCBhZGRpdGlvbiBpbiBidGZfZnVuY19tb2RlbC4KClRoYW5rcywKCkFsZXhp
cwoKLS0gCkFsZXhpcyBMb3Rob3LDqSwgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVs
IGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1z
dG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
