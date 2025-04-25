Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D01A9C1DC
	for <lists+linux-stm32@lfdr.de>; Fri, 25 Apr 2025 10:47:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8FD86C78F88;
	Fri, 25 Apr 2025 08:47:18 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D7DB5C78F87
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Apr 2025 08:47:17 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5EBCD432E9;
 Fri, 25 Apr 2025 08:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1745570837;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F20bZhqAcFtAHBc8oMhq0YvImZee5ACc/cX8f7eyPuQ=;
 b=XfnHkCqteD1vpSoUt3ytJgWvsKgXhBYCY/VDhoaYvcppi7dX9o7N3sJa/QEBclq2bvIvS2
 8oGE2voC8liDallF7KWtiuCZpafMIKHtPveqUr200YcwxdIxaKUnyBy08CUCDvmQumUHcc
 CbJWVkyDn16/vVWwVae39myfJRsgODUT7oziDllNHVJoAv2lqaCmj+GkRmNHrINV4OXf8Z
 vwa9a87Oq0n5Vo79Wk4l45c7L20tIGyTYunrSm9vcX+JBDZe0j1ryGLZ2U4qloUAH6uo6l
 4ZI8oRkKI94MsvFag4FC6XVg/yArVD+aQQcwN0mhCAm1X0/MZAmVhSjN++Bcww==
Date: Fri, 25 Apr 2025 10:47:15 +0200
Message-Id: <D9FL7V8UX9GP.25220KL6CKOY7@bootlin.com>
From: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
Mime-Version: 1.0
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250411-many_args_arm64-v1-0-0a32fe72339e@bootlin.com>
 <20250411-many_args_arm64-v1-1-0a32fe72339e@bootlin.com>
 <CAEf4Bzbn6BdXTOb0dTcsQmOMZpp5=DzGS2hHHQ3+dwcja=gv+w@mail.gmail.com>
 <D98Q8BRNUVS9.11J60C67L1ALR@bootlin.com>
 <CAEf4BzZHMYyGDZ4c4eNXG7Fm=ecxCCbKhKbQTbCjvWmKtdwvBw@mail.gmail.com>
 <D9E9IQQ3QKXM.3UJ17G9CBS1FH@bootlin.com>
 <6b6472c3-0718-4e60-9972-c166d51962a3@huaweicloud.com>
 <D9EWSDXHDGFJ.FIDSHIR1OP80@bootlin.com>
 <CAADnVQJjQLdc_Chvz9v2-huCb9rmi048heK-eEX30AtW10H+-Q@mail.gmail.com>
In-Reply-To: <CAADnVQJjQLdc_Chvz9v2-huCb9rmi048heK-eEX30AtW10H+-Q@mail.gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvheduledtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegtfffkhffvvefuggfgofhfjgesthhqredtredtjeenucfhrhhomheptehlvgigihhsucfnohhthhhorhoruceorghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeigefgieffvddvvdduuefhvdeivdejtddvfedthefhgefggedtledtueehuddtieenucffohhmrghinheplhhinhhugigsrghsvgdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedupdhrtghpthhtoheprghlvgigvghirdhsthgrrhhovhhoihhtohhvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepgihukhhuohhhrghisehhuhgrfigvihgtlhhouhgurdgtohhmpdhrtghpthhtoheprghnughrihhirdhnrghkrhihihhkohesghhmrghilhdrtghomhdprhgtphhtthhopegrshhts
 ehkvghrnhgvlhdrohhrghdprhgtphhtthhopegurghnihgvlhesihhoghgvrghrsghogidrnhgvthdprhgtphhtthhopehjohhhnhdrfhgrshhtrggsvghnugesghhmrghilhdrtghomhdprhgtphhtthhopegrnhgurhhiiheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgrrhhtihhnrdhlrghusehlihhnuhigrdguvghv
X-GND-Sasl: alexis.lothore@bootlin.com
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Alexei Starovoitov <ast@kernel.org>,
 Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, Shuah
 Khan <shuah@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Mykola Lysenko <mykolal@fb.com>, Daniel
 Borkmann <daniel@iogearbox.net>, Will Deacon <will@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>,
 Stanislav Fomichev <sdf@fomichev.me>,
 Bastien Curutchet <bastien.curutchet@bootlin.com>,
 Florent Revest <revest@chromium.org>, Puranjay
 Mohan <puranjay@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 ebpf@linuxfoundation.org, Xu Kuohai <xukuohai@huaweicloud.com>,
 KP Singh <kpsingh@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Hao Luo <haoluo@google.com>, "open list:KERNEL SELFTEST
 FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, Eduard Zingerman <eddyz87@gmail.com>,
 Jiri Olsa <jolsa@kernel.org>, bpf <bpf@vger.kernel.org>,
 Andrii Nakryiko <andrii.nakryiko@gmail.com>, Martin
 KaFai Lau <martin.lau@linux.dev>
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

SGVsbG8gQWxleGVpLAoKT24gRnJpIEFwciAyNSwgMjAyNSBhdCAxOjE0IEFNIENFU1QsIEFsZXhl
aSBTdGFyb3ZvaXRvdiB3cm90ZToKPiBPbiBUaHUsIEFwciAyNCwgMjAyNSBhdCA2OjM44oCvQU0g
QWxleGlzIExvdGhvcsOpCj4gPGFsZXhpcy5sb3Rob3JlQGJvb3RsaW4uY29tPiB3cm90ZToKClsu
Li5dCgo+PiA+IFdpdGggRFdBUkYgaW5mbywgd2UgbWlnaHQgbm90IG5lZWQgdG8gZGV0ZWN0IHRo
ZSBzdHJ1Y3R1cmUgYWxpZ25tZW50IGFueW1vcmUsCj4+ID4gc2luY2UgdGhlIERXX0FUX2xvY2F0
aW9uIGF0dHJpYnV0ZSB0ZWxscyB1cyB3aGVyZSB0aGUgc3RydWN0dXJlIHBhcmFtZXRlciBpcwo+
PiA+IGxvY2F0ZWQgb24gdGhlIHN0YWNrLCBhbmQgRFdfQVRfYnl0ZV9zaXplIGdpdmVzIHVzIHRo
ZSBzaXplIG9mIHRoZSBzdHJ1Y3R1cmUuCj4+Cj4+IEkgYW0gbm90IHN1cmUgdG8gZm9sbG93IHlv
dSBoZXJlLCBiZWNhdXNlIERXQVJGIGluZm8gaXMgbm90IGFjY2Vzc2libGUKPj4gZnJvbSBrZXJu
ZWwgYXQgcnVudGltZSwgcmlnaHQgPyBPciBhcmUgeW91IG1lYW5pbmcgdGhhdCB3ZSBjb3VsZCwg
YXQgYnVpbGQKPj4gdGltZSwgZW5yaWNoIHRoZSBCVEYgaW5mbyBlbWJlZGRlZCBpbiB0aGUga2Vy
bmVsIHRoYW5rcyB0byBEV0FSRiBpbmZvID8KPgo+IFNvdW5kcyBsaWtlIGFybTY0IGhhcyBjb21w
bGljYXRlZCBydWxlcyBmb3Igc3RhY2sgYWxpZ25tZW50IGFuZAo+IHN0YWNrIG9mZnNldCBjb21w
dXRhdGlvbiBmb3IgcGFzc2luZyA5dGgrIGFyZ3VtZW50LgoKQUZBSUNULCBhcm02NCBoYXMgc29t
ZSBzcGVjaWZpY2l0aWVzIGZvciBsYXJnZSB0eXBlcywgYnV0IG5vdCB0aGF0IG11Y2gKY29tcGFy
ZWQgdG8geDg2IGZvciBleGFtcGxlLiBJZiBJIHRha2UgYSBsb29rIGF0IFN5c3RlbSBWIEFCSSAo
WzFdKSwgSSBzZWUKcHJldHR5IG11Y2ggdGhlIHNhbWUgY29uc3RyYWludHM6Ci0gcC4xODogIkFy
Z3VtZW50cyBvZiB0eXBlIF9faW50MTI4IG9mZmVyIHRoZSBzYW1lIG9wZXJhdGlvbnMgYXMgSU5U
RUdFUnMsCiAgWy4uLl0gd2l0aCB0aGUgZXhjZXB0aW9uIHRoYXQgYXJndW1lbnRzIG9mIHR5cGUg
X19pbnQxMjggdGhhdCBhcmUgc3RvcmVkCiAgaW4gbWVtb3J5IG11c3QgYmUgYWxpZ25lZCBvbiBh
IDE2LWJ5dGUgYm91bmRhcnkiCi0gcC4xMzogIlN0cnVjdHVyZXMgYW5kIHVuaW9ucyBhc3N1bWUg
dGhlIGFsaWdubWVudCBvZiB0aGVpciBtb3N0IHN0cmljdGx5CiAgYWxpZ25lZCBjb21wb25lbnQi
Ci0gdGhlIGN1c3RvbSBwYWNraW5nIGFuZCBhbGlnbm1lbnRzIGF0dHJpYnV0ZXMgd2lsbCBlbmQg
dXAgaGF2aW5nIHRoZSBzYW1lCiAgY29uc2VxdWVuY2Ugb24gYm90aCBhcmNoaXRlY3R1cmVzCgpB
cyBJIG1lbnRpb25lZCBpbiBteSBjb3ZlciBsZXR0ZXIsIHRoZSBuZXcgdGVzdHMgY292ZXJpbmcg
dGhvc2Ugc2FtZQphbGlnbm1lbnQgY29uc3RyYWludHMgZm9yIEFSTTY0IGJyZWFrIG9uIHg4Niwg
d2hpY2ggbWFrZXMgbWUgdGhpbmsgb3RoZXIKYXJjaHMgYXJlIGFsc28gc2lsZW50bHkgaWdub3Jp
bmcgdGhvc2UgY2FzZXMuCgo+IFNpbmNlIHlvdXIgYW5hbHlzaXMgc2hvd3M6Cj4gInRoZXJlIGFy
ZSBhYm91dCAyMDAgZnVuY3Rpb25zIGFjY2VwdCA5IHRvIDEyIGFyZ3VtZW50cywgc28gYWRkaW5n
IHN1cHBvcnQKPiBmb3IgdXAgdG8gMTIgZnVuY3Rpb24gYXJndW1lbnRzLiIKPiBJIHNheSwgbGV0
J3Mga2VlcCB0aGUgZXhpc3RpbmcgbGltaXRhdGlvbjoKPiAgICAgICAgIGlmIChucmVncyA+IDgp
Cj4gICAgICAgICAgICAgICAgIHJldHVybiAtRU5PVFNVUFA7Cj4KPiBJZiB0aGVyZSBpcyBhIHNp
bXBsZSBhbmQgZHVtYiB3YXkgdG8gZGV0ZWN0IHRoYXQgYXJnOSsgYXJlIHNjYWxhcnMKPiB3aXRo
IHNpbXBsZSBzdGFjayBwYXNzaW5nIHJ1bGVzLCB0aGVuLCBzdXJlLCBsZXQncyBzdXBwb3J0IHRo
b3NlIHRvbywKPiBidXQgZmFuY3kgcGFja2VkL2FsaWduKHgpL2V0YyBsZXQncyBpZ25vcmUuCgoK
WzFdIGh0dHBzOi8vcmVmc3BlY3MubGludXhiYXNlLm9yZy9lbGYveDg2XzY0LWFiaS0wLjk5LnBk
ZgoKCi0tIApBbGV4aXMgTG90aG9yw6ksIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5l
bCBlbmdpbmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29tCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgt
c3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
