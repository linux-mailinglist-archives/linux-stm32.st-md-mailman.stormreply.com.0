Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F47ACEAEA
	for <lists+linux-stm32@lfdr.de>; Thu,  5 Jun 2025 09:35:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E97BEC32E93;
	Thu,  5 Jun 2025 07:35:21 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CAE44C35E3F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Jun 2025 07:35:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5236843935;
 Thu,  5 Jun 2025 07:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1749108920;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5Yg2TszODfSWyu/tkAewlOKe9bmGQWD5HRPUFzitAq0=;
 b=kj784Nm5ZgltuTXJv+pbKGMDA1t5/ru/eck+iLsRHT9bh9dUAeKg1UtiSce3r6Rlkt7NZG
 qIToZTnegQa10FbPzHFs+21XG8fPMSJ9luRmHf0Tcez7mIKtXf9cvIyEX0qlJeupy/3EGv
 MrWDfRryvUUNfeFlQnZP3sB5mO5Z0Q7yCadc1YSb2Q4hFOq0DMbigaRqE5MeN8JAuyOXOS
 tdRwbxKu/TiRONaFFbT1o0xDZe9esDi5hlY10LwDmFTJoQ+xZELZxa87B0WtIdPEUOanPV
 hRLRzekmcstDQk4EaSTKY5DBrLMkgQ6hPQxyzj9+v0rfzvpRPaSdlch0EXpxZg==
Mime-Version: 1.0
Date: Thu, 05 Jun 2025 09:35:15 +0200
Message-Id: <DAEFD2WH7HRV.2SOG9Q00QSEXH@bootlin.com>
From: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: "Ihor Solodrai" <ihor.solodrai@linux.dev>, "Andrii Nakryiko"
 <andrii.nakryiko@gmail.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250411-many_args_arm64-v1-0-0a32fe72339e@bootlin.com>
 <20250411-many_args_arm64-v1-1-0a32fe72339e@bootlin.com>
 <CAEf4Bzbn6BdXTOb0dTcsQmOMZpp5=DzGS2hHHQ3+dwcja=gv+w@mail.gmail.com>
 <D98Q8BRNUVS9.11J60C67L1ALR@bootlin.com>
 <CAEf4BzZHMYyGDZ4c4eNXG7Fm=ecxCCbKhKbQTbCjvWmKtdwvBw@mail.gmail.com>
 <D9E9IQQ3QKXM.3UJ17G9CBS1FH@bootlin.com>
 <DADMLIVHMSSO.3AXSI5216WCT6@bootlin.com>
 <9a2ba0ad-b34d-42f8-89a6-d9a44f007bdc@linux.dev>
In-Reply-To: <9a2ba0ad-b34d-42f8-89a6-d9a44f007bdc@linux.dev>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdeffedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkvefuhffvofhfjgesthhqredtredtjeenucfhrhhomheptehlvgigihhsucfnohhthhhorhoruceorghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffvddufffhieffheetfffggeeugedtieduheeilefguddvheegvdeuffeuveeltdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvuddvrddutdehrdduhedtrddvhedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdduvddruddthedrudehtddrvdehvddphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefvddprhgtphhtthhopehihhhorhdrshholhhoughrrghisehlihhnuhigrdguvghvpdhrtghpthhtoheprghnughrihhirdhnrghkrhihihhkohesghhmrghilhdrtghomhdprhgtphhtthhopegrshhtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegurghnihgvlhesihhoghgvrghrsghogidrnhgvt
 hdprhgtphhtthhopehjohhhnhdrfhgrshhtrggsvghnugesghhmrghilhdrtghomhdprhgtphhtthhopegrnhgurhhiiheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgrrhhtihhnrdhlrghusehlihhnuhigrdguvghvpdhrtghpthhtohepvgguugihiiekjeesghhmrghilhdrtghomh
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
 dwarves@vger.kernel.org, linux-kernel@vger.kernel.org,
 Eduard Zingerman <eddyz87@gmail.com>, Jiri Olsa <jolsa@kernel.org>,
 bpf@vger.kernel.org, Martin KaFai Lau <martin.lau@linux.dev>
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

SGkgSWhvciwKCk9uIFdlZCBKdW4gNCwgMjAyNSBhdCA3OjMxIFBNIENFU1QsIElob3IgU29sb2Ry
YWkgd3JvdGU6Cj4gT24gNi80LzI1IDI6MDIgQU0sIEFsZXhpcyBMb3Rob3LDg8KpIHdyb3RlOgoK
Wy4uLl0KCj4+IENvdWxkIEkgYmUgbWlzc2luZyBzb21ldGhpbmcgb2J2aW91cyA/IE9yIGRpZCBJ
IG1pc3VuZGVyc3RhbmQgdGhlIGFjdHVhbAo+PiBhdHRyaWJ1dGUgZW5jb2RpbmcgZmVhdHVyZSA/
Cj4KPiBIaSBBbGV4aXMuCj4KPiBUaGUgY2hhbmdlcyByZWNlbnRseSBsYW5kZWQgaW4gcGFob2xl
IGFuZCBsaWJicGYgcmUgYXR0cmlidXRlcyBoYWQgYSAKPiB2ZXJ5IG5hcnJvdyBnb2FsOiBwYXNz
aW5nIHRocm91Z2ggcGFydGljdWxhciBhdHRyaWJ1dGVzIGZvciBzb21lIEJQRiAKPiBrZnVuY3Mg
ZnJvbSB0aGUga2VybmVsIHNvdXJjZSB0byB2bWxpbnV4LmgKPgo+IEJURiBub3cgaGFzIGEgd2F5
IG9mIGVuY29kaW5nIGFueSBhdHRyaWJ1dGUgKGFzIG9wcG9zZWQgdG8gb25seSBicGYgCj4gdHlw
ZS9kZWNsIHRhZ3MpIGJ5IHNldHRpbmcgdHlwZS9kZWNsIHRhZyBraW5kIGZsYWcgWzFdLiBTbyBp
dCBpcyAKPiBwb3NzaWJsZSB0byByZXByZXNlbnQgYXR0cmlidXRlcyBsaWtlIHBhY2tlZCBhbmQg
YWxpZ25lZCBpbiBCVEYuCj4KPiBIb3dldmVyLCB0aGUgQlRGIHRhZ3MgbmVlZCB0byBiZSBnZW5l
cmF0ZWQgYnkgc29tZXRoaW5nLCBpbiBjYXNlIG9mIAo+IHZtbGludXggYnkgcGFob2xlLiBQYWhv
bGUgZ2VuZXJhdGVzIEJURiBieSBwYXJzaW5nIERXQVJGLiBBbmQsIGFzIGZhciBhcyAKPiBJIHVu
ZGVyc3RhbmQsIGF0dHJpYnV0ZXMgYXJlIG5vdCAoY2FuIG5vdCBiZT8pIHJlcHJlc2VudGVkIGlu
IERXQVJGIGluIGEgCj4gZ2VuZXJpYyB3YXksIGl0IHJlYWxseSBkZXBlbmRzIG9uIHNwZWNpZmlj
cyBvZiB0aGUgYXR0cmlidXRlLgo+Cj4gSW4gb3JkZXIgdG8gc3VwcG9ydCBwYWNrZWQvYWxpZ25l
ZCwgcGFob2xlIG5lZWRzIHRvIGtub3cgaG93IHRvIGZpZ3VyZSAKPiB0aGVtIG91dCBmcm9tIERX
QVJGIGlucHV0IGFuZCBhZGQgdGhlIHRhZ3MgdG8gQlRGLiBBbmQgdGhpcyBkb2VzIG5vdCAKPiBo
YXBwZW4gcmlnaHQgbm93LCB3aGljaCBpcyB3aHkgeW91IGRvbid0IHNlZSBhbnl0aGluZyBpbiBi
cGZ0b29sIG91dHB1dC4KPgo+IFsxXSAKPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9icGYvMjAy
NTAxMzAyMDEyMzkuMTQyOTY0OC0xLWlob3Iuc29sb2RyYWlAbGludXguZGV2LwoKVGhhbmtzIGZv
ciB0aGUgZGV0YWlscyAhIEkgaGF2ZSBtaXNzZWQgdGhpcyBwb3NzaWJpbGl0eSwgYXMgSSBoYXZl
IGJlZW4KYXNzdW1pbmcgdGhhdCBEV0FSRiBpbmZvIHdhcyBleHBvc2luZyB0aGUgbmVlZGVkIGlu
Zm8uIEknbGwgdGFrZSBhIGxvb2sgYXQKaXQsIGJ1dCBpZiB0aG9zZSBhdHRyaWJ1dGVzIGNhbiBu
b3QgYmUgcmVwcmVzZW50ZWQgYnkgRFdBUkYsIEknbGwgaGF2ZSB0bwpmaW5kIGFub3RoZXIgd2F5
IG9mIGdldHRpbmcgdGhvc2UgcGFja2luZy9hbGlnbm1lbnQgbW9kaWZpY2F0aW9ucyBvbiBkYXRh
CnR5cGUgKGVnOiByZS11c2Uvc2hhcmUgYnRmX19hbGlnbl9vZiBmcm9tIGxpYmJwZiwgYXMgc3Vn
Z2VzdGVkIGJ5IEFuZHJpaSwKYnV0IGl0IG1heSBub3QgYWJsZSB0byBjb3ZlciBhbGwgY2FzZXMp
LgoKVGhhbmtzLAoKQWxleGlzCgotLSAKQWxleGlzIExvdGhvcsOpLCBCb290bGluCkVtYmVkZGVk
IExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcKaHR0cHM6Ly9ib290bGluLmNvbQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFp
bGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6
Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3Rt
MzIK
