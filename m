Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A8EA991FD
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Apr 2025 17:38:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3B5FCC71287;
	Wed, 23 Apr 2025 15:38:16 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A60BDC69063
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Apr 2025 15:38:14 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1449D43201;
 Wed, 23 Apr 2025 15:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1745422694;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Abk3WUggpCh+pV9/jGehaWPhGHzsr5iDxN7IoX5cqEk=;
 b=RI7Tw1As9wOTHmRLRlOtw+97DusGjkgz5iMRLKZN4zcskq36CRb9ussT2NX7gXEdh90q7r
 POeVrueShYUjYRyn65z8VBjfO7iTqa/ZspwQMggtDMw3E7uMMC48R6WZou47bJ0oCgze/d
 xb5vD9tIm0T9icAfYRLJuQE1aslLweYHBA0hMYlsY/FV97+ZuevI1AS2ZMiBYPewPNmzHP
 vroE13/rb7Gl2LXV09Id2Du0mc/S0jjLsyK+HNJgSCKUPB9FLTgL3SLZiwDSQ71MgYofaA
 OsbniHoJmQ711I/9rNmlgjJpQ10ueCniBFkZSq8VBczxUgBqcTzGumXVtj+Zww==
Mime-Version: 1.0
Date: Wed, 23 Apr 2025 17:38:09 +0200
Message-Id: <D9E4PE3RTE37.2LU30RI1ZS6XL@bootlin.com>
From: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: "Xu Kuohai" <xukuohai@huaweicloud.com>, "Andrii Nakryiko"
 <andrii.nakryiko@gmail.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250411-many_args_arm64-v1-0-0a32fe72339e@bootlin.com>
 <20250411-many_args_arm64-v1-1-0a32fe72339e@bootlin.com>
 <CAEf4Bzbn6BdXTOb0dTcsQmOMZpp5=DzGS2hHHQ3+dwcja=gv+w@mail.gmail.com>
 <D98Q8BRNUVS9.11J60C67L1ALR@bootlin.com>
 <9da88811-cce0-41df-8069-2e8b67541c39@huaweicloud.com>
 <D9BLCJSCHE9A.1IKHK3XBPF8MU@bootlin.com>
 <8b800c09-eade-4dcf-90f6-2f5a78170bc4@huaweicloud.com>
In-Reply-To: <8b800c09-eade-4dcf-90f6-2f5a78170bc4@huaweicloud.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeeileejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkvefuhffvofhfjgesthhqredtredtjeenucfhrhhomheptehlvgigihhsucfnohhthhhorhoruceorghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeelkeehiefhfeehvefhtdegueelkeehffffffeuvdekkeekuddvueeguefgieeukeenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedtpdhrtghpthhtohepgihukhhuohhhrghisehhuhgrfigvihgtlhhouhgurdgtohhmpdhrtghpthhtoheprghnughrihhirdhnrghkrhihihhkohesghhmrghilhdrtghomhdprhgtphhtthhopegrshhtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegurghnihgvlhesihhoghgvrghrsghogidrnhgvthdprhgtphhtthhopehjohhhn
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

T24gTW9uIEFwciAyMSwgMjAyNSBhdCA0OjE0IEFNIENFU1QsIFh1IEt1b2hhaSB3cm90ZToKPiBP
biA0LzIxLzIwMjUgMTI6MDIgQU0sIEFsZXhpcyBMb3Rob3LDqSB3cm90ZToKPj4gSGkgWHUsCj4+
IAo+PiBPbiBUaHUgQXByIDE3LCAyMDI1IGF0IDQ6MTAgUE0gQ0VTVCwgWHUgS3VvaGFpIHdyb3Rl
Ogo+Pj4gT24gNC8xNy8yMDI1IDM6MTQgUE0sIEFsZXhpcyBMb3Rob3LDqSB3cm90ZToKPj4+PiBI
aSBBbmRyaWksCj4+Pj4KPj4+PiBPbiBXZWQgQXByIDE2LCAyMDI1IGF0IDExOjI0IFBNIENFU1Qs
IEFuZHJpaSBOYWtyeWlrbyB3cm90ZToKPj4+Pj4gT24gRnJpLCBBcHIgMTEsIDIwMjUgYXQgMToz
MuKAr1BNIEFsZXhpcyBMb3Rob3LDqSAoZUJQRiBGb3VuZGF0aW9uKQo+Pj4+PiA8YWxleGlzLmxv
dGhvcmVAYm9vdGxpbi5jb20+IHdyb3RlOgoKWy4uLl0KCj4+IEFoLCB0aGFua3MgZm9yIHRob3Nl
IGNsZWFyIGV4YW1wbGVzLCBJIGNvbXBsZXRlbHkgb3Zlcmxvb2tlZCB0aGlzCj4+IHBvc3NpYmls
aXR5LiBBbmQgbm93IHRoYXQgeW91IG1lbnRpb24gaXQsIEkgZmVlbCBhIGJpdCBkdW1iIGJlY2F1
c2UgSSBub3cKPj4gcmVtZW1iZXIgdGhhdCB5b3UgbWVudGlvbmVkIHRoaXMgaW4gUHVyYW5qYXkn
cyBzZXJpZXMuLi4KPj4gCj4+IEkgdG9vayBhIHF1aWNrIGxvb2sgYXQgdGhlIHg4NiBKSVQgY29t
cGlsZXIgZm9yIHJlZmVyZW5jZSwgYW5kIHNhdyBubyBjb2RlCj4+IHJlbGF0ZWQgdG8gdGhpcyBz
cGVjaWZpYyBjYXNlIG5laXRoZXIuIFNvIEkgc2VhcmNoZWQgaW4gdGhlIGtlcm5lbCBmb3IKPj4g
YWN0dWFsIGZ1bmN0aW9ucyB0YWtpbmcgc3RydWN0IGFyZ3VtZW50cyBieSB2YWx1ZSBBTkQgYmVp
bmcgZGVjbGFyZWQgd2l0aCBzb21lCj4+IHBhY2tlZCBvciBhbGlnbmVkIGF0dHJpYnV0ZS4gSSBv
bmx5IGZvdW5kIGEgaGFuZGZ1bCBvZiB0aG9zZSwgYW5kIG5vbmUKPj4gc2VlbXMgdG8gdGFrZSBl
bm91Z2ggYXJndW1lbnRzIHRvIGhhdmUgdGhlIGNvcnJlc3BvbmRpbmcgc3RydWN0IHBhc3NlZCBv
biB0aGUKPj4gc3RhY2suIFNvIHJhdGhlciB0aGFuIHN1cHBvcnRpbmcgdGhpcyB2ZXJ5IHNwZWNp
ZmljIGNhc2UsIEkgYW0gdGVtcHRlZAo+PiB0byBqdXN0IHJldHVybiBhbiBlcnJvciBmb3Igbm93
IGR1cmluZyB0cmFtcG9saW5lIGNyZWF0aW9uIGlmIHdlIGRldGVjdCBzdWNoCj4+IHN0cnVjdHVy
ZSAoYW5kIHRoZW4gdGhlIEpJVCBjb21waWxlciBjYW4ga2VlcCB1c2luZyBkYXRhIHNpemUgdG8g
Y29tcHV0ZQo+PiBhbGlnbm1lbnQsIG5vdyB0aGF0IGl0IGlzIHN1cmUgbm90IHRvIHJlY2VpdmUg
Y3VzdG9tIGFsaWdubWVudHMpLiBPciBhbSBJCj4+IG1pc3Npbmcgc29tZSBhY3R1YWwgY2FzZXMg
aW52b2x2aW5nIHRob3NlIHZlcnkgc3BlY2lmaWMgYWxpZ25tZW50cyA/Cj4+IAo+Cj4gSG93IGNh
biB3ZSByZWxpYWJseSAnZGV0ZWN0JyB0aGUgY2FzZT8gSWYgYSBmdW5jdGlvbiBoYXMgc3VjaCBh
IHBhcmFtZXRlcgo+IGJ1dCB3ZSBmYWlsIHRvIGRldGVjdCBpdCwgdGhlIEJQRiB0cmFtcG9saW5l
IHdpbGwgcGFzcyBhbiBpbmNvcnJlY3QgdmFsdWUKPiB0byB0aGUgZnVuY3Rpb24sIHdoaWNoIGlz
IGFsc28gdW5hY2NlcHRhYmxlLgoKVGhhdCdzIGEgcXVlc3Rpb24gSSBzdGlsbCBoYXZlIHRvIGFu
c3dlciA6KSBJIGltYWdpbmVkIGJlaW5nIGFibGUgdG8gZGV0ZWN0Cml0IHRoYW5rcyB0byBzb21l
IGluZm8gc29tZXdoZXJlIGluIEJURiwgYnV0IEkgaGF2ZSB0byBkaWcgZnVydGhlciB0byBmaW5k
Cmhvdy4KCgpBbGV4aXMKCi0tIApBbGV4aXMgTG90aG9yw6ksIEJvb3RsaW4KRW1iZWRkZWQgTGlu
dXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29tCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5n
IGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
