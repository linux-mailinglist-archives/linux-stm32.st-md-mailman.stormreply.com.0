Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A19A9AF63
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Apr 2025 15:38:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D63D8C78F68;
	Thu, 24 Apr 2025 13:38:40 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4A084C71289
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Apr 2025 13:38:39 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DD20543A18;
 Thu, 24 Apr 2025 13:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1745501918;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JT9l/+e3r1Y05jUzOsZqr8YD8XUbFvoCajdKIzKQ9jU=;
 b=gI9Qi8iAoHo/gBxh9R+vG0T3VpMLo5YARKDaRzoVfMvD3Kkj1HD5Uvt33GjFv5WHHyIurg
 ECYtVZKxvk99eb/wdY73MvgT6BzLddjF5SjDB51Tw5uNtdrI33XtLLs80gHarB744Bkjc8
 DWrmSkphdd1Al/1SSUT7QCcJtagYi/1cUE7+PJ4EEaJDPM57AcgG2SDDwq8/AKzS/+FWLy
 kwRznWKkWuxRt2VhPK65YLXmKWOid1ZPnDfDQYQF93h6yR1YeZIAcY73oWHtOV17t61Y2q
 E2lW9ycVZgB6kUDduFAin8Sbas/RVeP+GBA5ls/GR2BGECqPv+IEs2bEhMpV2A==
Mime-Version: 1.0
Date: Thu, 24 Apr 2025 15:38:35 +0200
Message-Id: <D9EWSDXHDGFJ.FIDSHIR1OP80@bootlin.com>
From: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: "Xu Kuohai" <xukuohai@huaweicloud.com>, "Andrii Nakryiko"
 <andrii.nakryiko@gmail.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250411-many_args_arm64-v1-0-0a32fe72339e@bootlin.com>
 <20250411-many_args_arm64-v1-1-0a32fe72339e@bootlin.com>
 <CAEf4Bzbn6BdXTOb0dTcsQmOMZpp5=DzGS2hHHQ3+dwcja=gv+w@mail.gmail.com>
 <D98Q8BRNUVS9.11J60C67L1ALR@bootlin.com>
 <CAEf4BzZHMYyGDZ4c4eNXG7Fm=ecxCCbKhKbQTbCjvWmKtdwvBw@mail.gmail.com>
 <D9E9IQQ3QKXM.3UJ17G9CBS1FH@bootlin.com>
 <6b6472c3-0718-4e60-9972-c166d51962a3@huaweicloud.com>
In-Reply-To: <6b6472c3-0718-4e60-9972-c166d51962a3@huaweicloud.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeelieduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkvefuhffvofhfjgesthhqredtredtjeenucfhrhhomheptehlvgigihhsucfnohhthhhorhoruceorghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeelkeehiefhfeehvefhtdegueelkeehffffffeuvdekkeekuddvueeguefgieeukeenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedtpdhrtghpthhtohepgihukhhuohhhrghisehhuhgrfigvihgtlhhouhgurdgtohhmpdhrtghpthhtoheprghnughrihhirdhnrghkrhihihhkohesghhmrghilhdrtghomhdprhgtphhtthhopegrshhtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegurghnihgvlhesihhoghgvrghrsghogidrnhgvthdprhgtphhtthhopehjohhhn
 hdrfhgrshhtrggsvghnugesghhmrghilhdrtghomhdprhgtphhtthhopegrnhgurhhiiheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgrrhhtihhnrdhlrghusehlihhnuhigrdguvghvpdhrtghpthhtohepvgguugihiiekjeesghhmrghilhdrtghomh
X-GND-Sasl: alexis.lothore@bootlin.com
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, Shuah Khan <shuah@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Mykola Lysenko <mykolal@fb.com>,
 Daniel Borkmann <daniel@iogearbox.net>, Will
 Deacon <will@kernel.org>, John Fastabend <john.fastabend@gmail.com>,
 Andrii Nakryiko <andrii@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>,
 Bastien Curutchet <bastien.curutchet@bootlin.com>,
 Florent Revest <revest@chromium.org>, Puranjay Mohan <puranjay@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, ebpf@linuxfoundation.org,
 Alexei Starovoitov <ast@kernel.org>, KP Singh <kpsingh@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Hao Luo <haoluo@google.com>,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 Eduard Zingerman <eddyz87@gmail.com>, Jiri Olsa <jolsa@kernel.org>,
 bpf@vger.kernel.org, Martin KaFai Lau <martin.lau@linux.dev>
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

SGkgWHUsCgpPbiBUaHUgQXByIDI0LCAyMDI1IGF0IDI6MDAgUE0gQ0VTVCwgWHUgS3VvaGFpIHdy
b3RlOgo+IE9uIDQvMjQvMjAyNSAzOjI0IEFNLCBBbGV4aXMgTG90aG9yw6kgd3JvdGU6Cj4+IEhp
IEFuZHJpaSwKPj4gCj4+IE9uIFdlZCBBcHIgMjMsIDIwMjUgYXQgNzoxNSBQTSBDRVNULCBBbmRy
aWkgTmFrcnlpa28gd3JvdGU6Cj4+PiBPbiBUaHUsIEFwciAxNywgMjAyNSBhdCAxMjoxNOKAr0FN
IEFsZXhpcyBMb3Rob3LDqQo+Pj4gPGFsZXhpcy5sb3Rob3JlQGJvb3RsaW4uY29tPiB3cm90ZToK
Pj4+Pgo+Pj4+IEhpIEFuZHJpaSwKPj4+Pgo+Pj4+IE9uIFdlZCBBcHIgMTYsIDIwMjUgYXQgMTE6
MjQgUE0gQ0VTVCwgQW5kcmlpIE5ha3J5aWtvIHdyb3RlOgo+Pj4+PiBPbiBGcmksIEFwciAxMSwg
MjAyNSBhdCAxOjMy4oCvUE0gQWxleGlzIExvdGhvcsOpIChlQlBGIEZvdW5kYXRpb24pCj4+Pj4+
IDxhbGV4aXMubG90aG9yZUBib290bGluLmNvbT4gd3JvdGU6CgpbLi4uXQoKPj4gVGhhbmtzIGZv
ciB0aGUgcG9pbnRlciwgSSdsbCB0YWtlIGEgbG9vayBhdCBpdC4gVGhlIG1vcmUgd2UgZGlzY3Vz
cyB0aGlzCj4+IHNlcmllcywgdGhlIGxlc3MgbWVtYmVyIHNpemUgc291bmRzIHJlbGV2YW50IGZv
ciB3aGF0IEknbSB0cnlpbmcgdG8gYWNoaWV2ZQo+PiBoZXJlLgo+PiAKPj4gRm9sbG93aW5nIFh1
J3MgY29tbWVudHMsIEkgaGF2ZSBiZWVuIHRoaW5raW5nIGFib3V0IGhvdyBJIGNvdWxkIGRldGVj
dCB0aGUKPj4gY3VzdG9tIGFsaWdubWVudHMgYW5kIHBhY2tpbmcgb24gc3RydWN0dXJlcywgYW5k
IEkgd2FzIHdvbmRlcmluZyBpZiBJIGNvdWxkCj4+IHNvbWVob3cgYmVuZWZpdCBmcm9tIF9fYXR0
cmlidXRlX18gZW5jb2RpbmcgaW4gQlRGIGluZm8gKFsxXSkuIEJ1dAo+PiBmb2xsb3dpbmcgeW91
ciBoaW50LCBJIGFsc28gc2VlIHNvbWUgYnRmX2lzX3N0cnVjdF9wYWNrZWQoKSBpbgo+PiB0b29s
cy9saWIvYnBmL2J0Zl9kdW1wLmMgdGhhdCBjb3VsZCBoZWxwLiBJJ2xsIGRpZyB0aGlzIGZ1cnRo
ZXIgYW5kIHNlZSBpZgo+PiBJIGNhbiBtYW5hZ2UgdG8gbWFrZSBzb21ldGhpbmcgd29yayB3aXRo
IGFsbCBvZiB0aGlzLgo+Pgo+Cj4gV2l0aCBEV0FSRiBpbmZvLCB3ZSBtaWdodCBub3QgbmVlZCB0
byBkZXRlY3QgdGhlIHN0cnVjdHVyZSBhbGlnbm1lbnQgYW55bW9yZSwKPiBzaW5jZSB0aGUgRFdf
QVRfbG9jYXRpb24gYXR0cmlidXRlIHRlbGxzIHVzIHdoZXJlIHRoZSBzdHJ1Y3R1cmUgcGFyYW1l
dGVyIGlzCj4gbG9jYXRlZCBvbiB0aGUgc3RhY2ssIGFuZCBEV19BVF9ieXRlX3NpemUgZ2l2ZXMg
dXMgdGhlIHNpemUgb2YgdGhlIHN0cnVjdHVyZS4KCkkgYW0gbm90IHN1cmUgdG8gZm9sbG93IHlv
dSBoZXJlLCBiZWNhdXNlIERXQVJGIGluZm8gaXMgbm90IGFjY2Vzc2libGUKZnJvbSBrZXJuZWwg
YXQgcnVudGltZSwgcmlnaHQgPyBPciBhcmUgeW91IG1lYW5pbmcgdGhhdCB3ZSBjb3VsZCwgYXQg
YnVpbGQKdGltZSwgZW5yaWNoIHRoZSBCVEYgaW5mbyBlbWJlZGRlZCBpbiB0aGUga2VybmVsIHRo
YW5rcyB0byBEV0FSRiBpbmZvID8KClRoYW5rcywKCkFsZXhpcwoKLS0gCkFsZXhpcyBMb3Rob3LD
qSwgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8v
Ym9vdGxpbi5jb20KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
