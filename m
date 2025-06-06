Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CAEF2ACFDAA
	for <lists+linux-stm32@lfdr.de>; Fri,  6 Jun 2025 09:46:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 66502C3F930;
	Fri,  6 Jun 2025 07:46:00 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3C677C36B13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Jun 2025 07:45:59 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3B90F442AE;
 Fri,  6 Jun 2025 07:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1749195958;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2+a4tmR/A6ANRwQiGU6A/fzxxPhMQUHBWtsMGAxzq3M=;
 b=FbcBo+GO49Gf4nun+ACzzLWBd7hkcSEKiitgBAVSvqrZiijkTwKBI0uSbwLisokMQt1oD+
 qDpcmFva4f3cqTdmgZTVwjY61/BXc4vuqQM3UzFLSJA5BHlVsHBzlkMa9vTg4KcETJp+sN
 yJ66JPB2utPtj9hgCyWKd57/wxZ5BfRrnZsHixXZxwynbcCfBEycAPgZefFV2OAm0YTuas
 03uBMg5uX+ZbI/KYG2jwsizN8uEb5UQkZOnTwidlDSIdxRgZlDTKmOukYH8rdpD319jPgf
 pGQzZuy3BZ0YrMvdehF+RGesgL2H5RIPdqFTxOZoAKNvQrWWKZLxSK8NJxAAGQ==
Mime-Version: 1.0
Date: Fri, 06 Jun 2025 09:45:51 +0200
Message-Id: <DAFA7QSTVFQF.3MG5408HBVNT7@bootlin.com>
From: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250411-many_args_arm64-v1-0-0a32fe72339e@bootlin.com>
 <20250411-many_args_arm64-v1-1-0a32fe72339e@bootlin.com>
 <CAEf4Bzbn6BdXTOb0dTcsQmOMZpp5=DzGS2hHHQ3+dwcja=gv+w@mail.gmail.com>
 <D98Q8BRNUVS9.11J60C67L1ALR@bootlin.com>
 <CAEf4BzZHMYyGDZ4c4eNXG7Fm=ecxCCbKhKbQTbCjvWmKtdwvBw@mail.gmail.com>
 <D9E9IQQ3QKXM.3UJ17G9CBS1FH@bootlin.com>
 <DADMLIVHMSSO.3AXSI5216WCT6@bootlin.com>
 <9a2ba0ad-b34d-42f8-89a6-d9a44f007bdc@linux.dev>
 <DAEFD2WH7HRV.2SOG9Q00QSEXH@bootlin.com>
 <CAADnVQ+T_s6dAwJ5JKqNqA8tq1P+MdfPvPw0EoY5yOf8PnGT4g@mail.gmail.com>
In-Reply-To: <CAADnVQ+T_s6dAwJ5JKqNqA8tq1P+MdfPvPw0EoY5yOf8PnGT4g@mail.gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdegjeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkvefuhffvofhfjgesthhqredtredtjeenucfhrhhomheptehlvgigihhsucfnohhthhhorhoruceorghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeelkeehiefhfeehvefhtdegueelkeehffffffeuvdekkeekuddvueeguefgieeukeenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdduvddruddthedrudehtddrvdehvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvuddvrddutdehrdduhedtrddvhedvpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfeefpdhrtghpthhtoheprghlvgigvghirdhsthgrrhhovhhoihhtohhvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepihhhohhrrdhsohhlohgurhgriheslhhinhhugidruggvvhdprhgtphhtthhopegrnhgurhhiihdrnhgrkhhrhihikhhosehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghstheskhgvrhhnvghlrdhorhhgpdhrt
 ghpthhtohepuggrnhhivghlsehiohhgvggrrhgsohigrdhnvghtpdhrtghpthhtohepjhhohhhnrdhfrghsthgrsggvnhgusehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghnughrihhisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmrghrthhinhdrlhgruheslhhinhhugidruggvvh
X-GND-Sasl: alexis.lothore@bootlin.com
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, Shuah Khan <shuah@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Mykola Lysenko <mykolal@fb.com>,
 Daniel Borkmann <daniel@iogearbox.net>, Will Deacon <will@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>,
 Stanislav Fomichev <sdf@fomichev.me>,
 Bastien Curutchet <bastien.curutchet@bootlin.com>,
 Florent Revest <revest@chromium.org>, Puranjay
 Mohan <puranjay@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 ebpf@linuxfoundation.org, Xu Kuohai <xukuohai@huaweicloud.com>,
 Alexei Starovoitov <ast@kernel.org>, KP Singh <kpsingh@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Hao Luo <haoluo@google.com>, "open list:KERNEL SELFTEST
 FRAMEWORK" <linux-kselftest@vger.kernel.org>, dwarves@vger.kernel.org,
 Ihor Solodrai <ihor.solodrai@linux.dev>, LKML <linux-kernel@vger.kernel.org>,
 Eduard Zingerman <eddyz87@gmail.com>, Jiri Olsa <jolsa@kernel.org>,
 bpf <bpf@vger.kernel.org>, Andrii Nakryiko <andrii.nakryiko@gmail.com>, Martin
 KaFai Lau <martin.lau@linux.dev>
Subject: Re: [Linux-stm32] [Question] attributes encoding in BTF
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

SGkgQWxleGVpLAoKT24gVGh1IEp1biA1LCAyMDI1IGF0IDY6MDkgUE0gQ0VTVCwgQWxleGVpIFN0
YXJvdm9pdG92IHdyb3RlOgo+IE9uIFRodSwgSnVuIDUsIDIwMjUgYXQgMTI6MzXigK9BTSBBbGV4
aXMgTG90aG9yw6kKPiA8YWxleGlzLmxvdGhvcmVAYm9vdGxpbi5jb20+IHdyb3RlOgo+Pgo+PiBI
aSBJaG9yLAo+Pgo+PiBPbiBXZWQgSnVuIDQsIDIwMjUgYXQgNzozMSBQTSBDRVNULCBJaG9yIFNv
bG9kcmFpIHdyb3RlOgo+PiA+IE9uIDYvNC8yNSAyOjAyIEFNLCBBbGV4aXMgTG90aG9yw4PCqSB3
cm90ZToKClsuLi5dCgo+PiBUaGFua3MgZm9yIHRoZSBkZXRhaWxzICEgSSBoYXZlIG1pc3NlZCB0
aGlzIHBvc3NpYmlsaXR5LCBhcyBJIGhhdmUgYmVlbgo+PiBhc3N1bWluZyB0aGF0IERXQVJGIGlu
Zm8gd2FzIGV4cG9zaW5nIHRoZSBuZWVkZWQgaW5mby4gSSdsbCB0YWtlIGEgbG9vayBhdAo+PiBp
dCwgYnV0IGlmIHRob3NlIGF0dHJpYnV0ZXMgY2FuIG5vdCBiZSByZXByZXNlbnRlZCBieSBEV0FS
RiwgSSdsbCBoYXZlIHRvCj4+IGZpbmQgYW5vdGhlciB3YXkgb2YgZ2V0dGluZyB0aG9zZSBwYWNr
aW5nL2FsaWdubWVudCBtb2RpZmljYXRpb25zIG9uIGRhdGEKPj4gdHlwZSAoZWc6IHJlLXVzZS9z
aGFyZSBidGZfX2FsaWduX29mIGZyb20gbGliYnBmLCBhcyBzdWdnZXN0ZWQgYnkgQW5kcmlpLAo+
PiBidXQgaXQgbWF5IG5vdCBhYmxlIHRvIGNvdmVyIGFsbCBjYXNlcykuCj4KPiBOb3Qgc3VyZSBh
bGwgdGhlIHRyb3VibGUgaXMgd29ydGggaXQuCj4gSSBmZWVsIGl0J3MgYSBjb3JuZXIgY2FzZS4g
U29tZXRoaW5nIHdlIGRvbid0IG5lZWQgdG8gZml4LgoKVEJIIEkgZG9uJ3Qgb3duIGFueSBzcGVj
aWZpYyB1c2UgY2FzZSByZWFsbHkgbmVlZGluZyB0aGlzIGhhbmRsaW5nLCBzbyBpZgppdCBkb2Vz
IG5vdCBmZWVsIHdvcnRoIHRoZSB0cm91YmxlLCBJJ20gZmluZSB3aXRoIG5vdCB0cnlpbmcgdG8g
c3VwcG9ydAp0aGlzLiBNeSBlZmZvcnQgaXMgcmF0aGVyIG1vdGl2YXRlZCBieSB0aGUgZ29hbCBv
ZiBhbGlnbmluZyB0aGUgQVJNNjQKZmVhdHVyZXMgd2l0aCBvdGhlciBwbGF0Zm9ybSwgYW5kIHNv
IG9mIGdldHRpbmcgcmlkIG9mCnRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi9ERU5ZTElTVC5h
YXJjaDY0LgoKRm9yIHRoZSByZWNvcmQsIHRoaXMgZWZmb3J0IGFsc28gc2hvd2VkIHRoYXQgdGhl
IHNhbWUga2luZCBvZiBpc3N1ZSBhZmZlY3RzCm90aGVyIHBsYXRmb3JtcyBhbHJlYWR5IHN1cHBv
cnRpbmcgbWFueSBhcmdzICsgc3RydWN0cyBwYXNzZWQgYnkgdmFsdWUgKFsxXSkKLSBzdHJ1Y3Rz
IGFsaWdubWVudCB3aXRoIHNwZWNpZmljIGFsaWdubWVudCBjb25zdHJhaW50cyBhcmUgbm90CiAg
c3BlY2lmaWNhbGx5IGhhbmRsZWQgKGVnOiBhIHN0cnVjdCB3aXRoIGFuIF9faW50MTI4IGFzIGEg
dG9wLWxldmVsCiAgbWVtYmVyLCBsZWFkaW5nIHRvIGEgMTYgYnl0ZSBhbGlnbm1lbnQgcmVxdWly
ZW1lbnQpCi0gcGFja2luZyBhbmQgY3VzdG9tIGFsaWdubWVudCBpcyBub3QgaGFuZGxlZAoKRnJv
bSB0aGVyZSwgSSBjb3VsZCBkbyB0d28gZGlmZmVyZW50IHRoaW5nczoKMS4gZG8gbm90aGluZywg
a2VlcCBBUk02NCBhcy1pcyB3aXRoIHRoZSBjdXJyZW50IHZlcnNpb24gd2hpY2ggaGFzIGJlZW4K
ICByZWNlbnRseSBtZXJnZWQ6IEFSTTY0IHRoZW4gZGVuaWVzIGF0dGFjaG1lbnQgdG8gYW55IGZ1
bmN0aW9uIHRyeWluZyB0bwogIHBhc3MgYSBzdHJ1Y3QgYnkgdmFsdWUgb24gc3RhY2suIFdlIGtl
ZXAgdGhlIHRyYWNpbmdfc3RydWN0IHRlc3RzIGRlbmllZAogIGZvciBBUk02NC4gT3RoZXIgcGxh
dGZvcm1zIHN0aWxsIGFsbG93IHRvIGF0dGFjaCBzdWNoIGZ1bmN0aW9ucywgYnV0IG1heQogIGJl
IHBhcnNpbmcgd3JvbmdseSBhcmd1bWVudHMgaW4gdGhvc2Ugc3BlY2lmaWMgY2FzZXMuCjIuIGFk
ZCB0aGUgY29uc3RyYWludCBhcHBsaWVkIG9uIEFSTTY0IChyZWZ1c2luZyBhdHRhY2htZW50IHdo
ZW4gc3RydWN0cyBhcmUKICBwYXNzZWQgdGhyb3VnaCBzdGFjaykgdG8gb3RoZXIgSklUIGNvbXBp
bGVycy4gVGhlbiB1cGRhdGUgdGhlCiAgdHJhY2luZ19zdHJ1Y3QgdGVzdCB0byBlbnN1cmUgdGhp
cyBzcGVjaWZpYyBjYXNlIGlzIHByb3Blcmx5IGRlbmllZCBvbgogIGFsbCBwbGF0Zm9ybXMgdG8g
YXZvaWQgcmlza2luZyByZWFkaW5nIHdyb25nbHkgYXJndW1lbnRzIHBhc3NlZCB0aHJvdWdoCiAg
c3RhY2sgd2hlbiBzdHJ1Y3RzIG9yIGxhcmdlIHR5cGVzIGFyZSBpbnZvbHZlZC4KCkkgdGVuZCB0
byB0aGluayAyLiBpcyBiZXR0ZXIsIGJ1dCBsZXQgbWUga25vdyBpZiB5b3UgaGF2ZSBhIGRpZmZl
cmVudApvcGluaW9uIGhlcmUuCgpUaGFua3MsCgpBbGV4aXMKCi0tIApBbGV4aXMgTG90aG9yw6ks
IEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwpodHRwczovL2Jv
b3RsaW4uY29tCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9s
aXN0aW5mby9saW51eC1zdG0zMgo=
