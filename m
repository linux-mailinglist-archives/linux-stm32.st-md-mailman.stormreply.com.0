Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D33FAD843F
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Jun 2025 09:37:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CD4A2C36B31;
	Fri, 13 Jun 2025 07:37:29 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2212AC36B30
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Jun 2025 07:37:27 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 86F1944503;
 Fri, 13 Jun 2025 07:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1749800247;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=beEBVGnU6qU0wggmtWKWRNXrz1xxl7Gdx9jeDS6+tJk=;
 b=kbxOkqLBWMYw2LKAd/IW2RyGj/nP5qTDA3nQe30746ZNf401cfIfLbPiuY4UCGLIThgg52
 3SDjkKUlcjrkpsB7uie+NFd+q+khw4Qzg1V7FhH7kqzzDUETsK2pGbu4SLKi+3xHGZA5Px
 K8dourdAUK5hDgryw11qFf0uNWCLOjes5mH1frWPNr1onGZSx9hzPoBxJ8F4ePD6fSr9AO
 tPte1M9ivmGyxjku7Xi4XGOT8+ifFHjA0HhTgsLAKFka6UJZWMMHXlJDmbcy5ef57nUIR7
 33LybB/oSKZ4GDWXEWCuppTs2482C4hbZA/bJ1nk+is7e8e0Di4ud3snPwKt0Q==
From: =?utf-8?q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29?=
 <alexis.lothore@bootlin.com>
Date: Fri, 13 Jun 2025 09:37:09 +0200
Message-Id: <20250613-deny_trampoline_structs_on_stack-v1-0-5be9211768c3@bootlin.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIACXVS2gC/x2NQQrCMBAAv1L2bCANtKJfEQnJZquLugnZKErp3
 xu8zVxmVlCqTArnYYVKH1bO0mU8DID3IDcynLqDs26ysz2ZRPLzrYZXyU8W8trqG5v6LB0DPsw
 UIx4jOpvSCD1TKi38/S8uEMsC123bAYJUNa93AAAA
X-Change-ID: 20250609-deny_trampoline_structs_on_stack-5bbc7bc20dd1
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 Martin KaFai Lau <martin.lau@linux.dev>, 
 Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, 
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
 Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
 Jiri Olsa <jolsa@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
 David Ahern <dsahern@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Menglong Dong <imagedong@tencent.com>, 
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@kernel.org>, 
 Pu Lehui <pulehui@huawei.com>, Puranjay Mohan <puranjay@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Ilya Leoshkevich <iii@linux.ibm.com>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, Hari Bathini <hbathini@linux.ibm.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Mykola Lysenko <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddujeefjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffufffkgggtgffvvefosehtkeertdertdejnecuhfhrohhmpeetlhgvgihishcunfhothhhohhrroculdgvuefrhfcuhfhouhhnuggrthhiohhnmdcuoegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheeuuefggeeiuedutdeghffhtefguefffeelledttdfgjeejueeggeeugfdugfevnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddvmeekgedvkeemfhelgegtmegvtddtmeemfhekheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemkeegvdekmehfleegtgemvgdttdemmehfkeehpdhhvghloheplgduledvrdduieekrddurdduleejngdpmhgrihhlfhhrohhmpegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepheekpdhrtghpthhtohepshhonhhgsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrghhorhguvggvvheslhhinhhugidrihgsmhdrtghomhdprhgtphhtthhopehlihhnuhigphhptgdquggvvhesl
 hhishhtshdrohiilhgrsghsrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhhsvghlfhhtvghsthesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhsthhmfedvsehsthdqmhguqdhmrghilhhmrghnrdhsthhorhhmrhgvphhlhidrtghomhdprhgtphhtthhopegrlhgvgigrnhgurhgvrdhtohhrghhuvgesfhhoshhsrdhsthdrtghomhdprhgtphhtthhopehmhihkohhlrghlsehfsgdrtghomhdprhgtphhtthhopehsvhgvnhhssehlihhnuhigrdhisghmrdgtohhm
X-GND-Sasl: alexis.lothore@bootlin.com
Cc: linux-s390@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 ebpf@linuxfoundation.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org,
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@rivosinc.com>,
 =?utf-8?q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29?=
 <alexis.lothore@bootlin.com>,
 Bastien Curutchet <bastien.curutchet@bootlin.com>, bpf@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH bpf 0/7] bpf: deny trampoline attachment if
 args can not be located exactly on stack
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

SGVsbG8sCnRoaXMgc2VyaWVzIGZvbGxvd3Mgc29tZSBkaXNjdXNzaW9ucyBzdGFydGVkIGluIFsx
XSBhcm91bmQgYnBmCnRyYW1wb2xpbmVzIGxpbWl0YXRpb25zIG9uIHNwZWNpZmljIGNhc2VzLiBX
aGVuIGEgdHJhbXBvbGluZSBpcwpnZW5lcmF0ZWQgZm9yIGEgdGFyZ2V0IGZ1bmN0aW9uIGludm9s
dmluZyBtYW55IGFyZ3VtZW50cywgaXQgaGFzIHRvCnByb3Blcmx5IGZpbmQgYW5kIHNhdmUgdGhl
IGFyZ3VtZW50cyB0aGF0IGhhcyBiZWVuIHBhc3NlZCB0aHJvdWdoIHN0YWNrLgpXaGlsZSB0aGlz
IGlzIGRvYWJsZSB3aXRoIGJhc2ljIHR5cGVzIChlZzogc2NhbGFycyksIGl0IGJyaW5ncyBtb3Jl
CnVuY2VydGFpbnR5IHdoZW4gZGVhbGluZyB3aXRoIHNwZWNpZmljIHR5cGVzIGxpa2Ugc3RydWN0
cyAobWFueSBBQklzCmFsbG93IHRvIHBhc3Mgc3RydWN0dXJlcyBieSB2YWx1ZSBpZiB0aGV5IGZp
dCBpbiBhIHJlZ2lzdGVyIG9yIGEgcGFpciBvZgpyZWdpc3RlcnMpLiBUaGUgaXNzdWUgaXMgdGhh
dCB0aG9zZSBzdHJ1Y3R1cmVzIGxheW91dCBhbmQgbG9jYXRpb24gb24KdGhlIHN0YWNrIGNhbiBi
ZSBhbHRlcmVkIChpZSB3aXRoIGF0dHJpYnV0ZXMsIGxpa2UgcGFja2VkIG9yCmFsaWduZWQoeCkp
LCBhbmQgdGhpcyBraW5kIG9mIGFsdGVyYXRpb24gaXMgbm90IGVuY29kZWQgaW4gZHdhcmYgb3Ig
QlRGLAptYWtpbmcgdGhlIHRyYW1wb2xpbmVzIGNsdWVsZXNzIGFib3V0IHRoZSBuZWVkZWQgYWRq
dXN0bWVudHMuIFJhdGhlcgp0aGFuIHRyeWluZyB0byBzdXBwb3J0IHRoaXMgc3BlY2lmaWMgY2Fz
ZSwgYXMgYWdyZWVkIGluIFsyXSwgdGhpcyBzZXJpZXMKYWltcyB0byBwcm9wZXJseSBkZW55IGl0
LgoKSXQgdGFyZ2V0cyBhbGwgdGhlIGFyY2hpdGVjdHVyZXMgY3VycmVudGx5IGltcGxlbWVudGlu
ZwphcmNoX3ByZXBhcmVfYnBmX3RyYW1wb2xpbmUgKGV4Y2VwdCBhYXJjaDY0LCBzaW5jZSBpdCBo
YXMgYmVlbiBoYW5kbGVkCndoaWxlIGFkZGluZyB0aGUgc3VwcG9ydCBmb3IgbWFueSBhcmdzKToK
LSB4ODYKLSBzMzkwCi0gcmlzY3YKLSBwb3dlcnBjCgpBIHNtYWxsIHZhbGlkYXRpb24gZnVuY3Rp
b24gaXMgYWRkZWQgaW4gdGhlIEpJVCBjb21waWxlciBmb3IgZWFjaCBvZgp0aG9zZSBhcmNoaXRl
Y3R1cmVzLCBlbnN1cmluZyB0aGF0IG5vIGFyZ3VtZW50IHBhc3NlZCBvbiBzdGFjayBpcyBhCnN0
cnVjdC4gSWYgc28sIHRoZSB0cmFtcG9saW5lIGNyZWF0aW9uIGlzIGNhbmNlbGxlZC4gQW55IGNo
ZWNrIG9uIGFyZ3MKYWxyZWFkeSBpbXBsZW1lbnRlZCBpbiBhIEpJVCBjb21wIGhhcyBiZWVuIG1v
dmVkIGluIHRoaXMgbmV3IGZ1bmN0aW9uLgpPbiB0b3Agb2YgdGhhdCwgaXQgdXBkYXRlcyB0aGUg
dHJhY2luZ19zdHJ1Y3RfbWFueV9hcmdzIHRlc3QsIHdoaWNoCm5vdyBtZXJlbHkgY2hlY2tzIHRo
YXQgdGhpcyBjYXNlIGlzIGluZGVlZCBkZW5pZWQuCgpbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvYnBmLzIwMjUwNDExLW1hbnlfYXJnc19hcm02NC12MS0wLTBhMzJmZTcyMzM5ZUBib290bGlu
LmNvbS8KWzJdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2JwZi9DQUFEblZRS3IzZnROdDF1UVZy
WEJFMGEybzM3WllSbzJQSHFDb0hVbnc2UEU1VDJMb0FAbWFpbC5nbWFpbC5jb20vCgpTaWduZWQt
b2ZmLWJ5OiBBbGV4aXMgTG90aG9yw6kgKGVCUEYgRm91bmRhdGlvbikgPGFsZXhpcy5sb3Rob3Jl
QGJvb3RsaW4uY29tPgotLS0KQWxleGlzIExvdGhvcsOpIChlQlBGIEZvdW5kYXRpb24pICg3KToK
ICAgICAgYnBmL3g4NjogdXNlIGRlZmluZSBmb3IgbWF4IHJlZ3MgY291bnQgdXNlZCBmb3IgYXJn
dW1lbnRzCiAgICAgIGJwZi94ODY6IHByZXZlbnQgdHJhbXBvbGluZSBhdHRhY2htZW50IHdoZW4g
YXJncyBsb2NhdGlvbiBvbiBzdGFjayBpcyB1bmNlcnRhaW4KICAgICAgYnBmL3Jpc2N2OiBwcmV2
ZW50IHRyYW1wb2xpbmUgYXR0YWNobWVudCB3aGVuIGFyZ3MgbG9jYXRpb24gb24gc3RhY2sgaXMg
dW5jZXJ0YWluCiAgICAgIGJwZi9zMzkwOiBwcmV2ZW50IHRyYW1wb2xpbmUgYXR0YWNobWVudCB3
aGVuIGFyZ3MgbG9jYXRpb24gb24gc3RhY2sgaXMgdW5jZXJ0YWluCiAgICAgIGJwZi9wb3dlcnBj
NjQ6IHVzZSBkZWZpbmUgZm9yIG1heCByZWdzIGNvdW50IHVzZWQgZm9yIGFyZ3VtZW50cwogICAg
ICBicGYvcG93ZXJwYzY0OiBwcmV2ZW50IHRyYW1wb2xpbmUgYXR0YWNobWVudCB3aGVuIGFyZ3Mg
bG9jYXRpb24gb24gc3RhY2sgaXMgdW5jZXJ0YWluCiAgICAgIHNlbGZ0ZXN0cy9icGY6IGVuc3Vy
ZSB0aGF0IGZ1bmN0aW9ucyBwYXNzaW5nIHN0cnVjdHMgb24gc3RhY2sgY2FuIG5vdCBiZSBob29r
ZWQKCiBhcmNoL3Bvd2VycGMvbmV0L2JwZl9qaXRfY29tcC5jICAgICAgICAgICAgICAgICAgICB8
IDM4ICsrKysrKysrKystLQogYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wNjQuYyAgICAgICAg
ICAgICAgICAgICAgfCAyNiArKysrKysrLQogYXJjaC9zMzkwL25ldC9icGZfaml0X2NvbXAuYyAg
ICAgICAgICAgICAgICAgICAgICAgfCAzMyArKysrKysrKy0tCiBhcmNoL3g4Ni9uZXQvYnBmX2pp
dF9jb21wLmMgICAgICAgICAgICAgICAgICAgICAgICB8IDUwICsrKysrKysrKysrKy0tLS0KIC4u
Li9zZWxmdGVzdHMvYnBmL3Byb2dfdGVzdHMvdHJhY2luZ19zdHJ1Y3QuYyAgICAgIHwgMzcgKy0t
LS0tLS0tLS0tCiAuLi4vc2VsZnRlc3RzL2JwZi9wcm9ncy90cmFjaW5nX3N0cnVjdF9tYW55X2Fy
Z3MuYyB8IDcwIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIC4uLi90ZXN0aW5nL3NlbGZ0ZXN0cy9i
cGYvdGVzdF9rbW9kcy9icGZfdGVzdG1vZC5jIHwgNDMgKystLS0tLS0tLS0tLQogNyBmaWxlcyBj
aGFuZ2VkLCAxMjkgaW5zZXJ0aW9ucygrKSwgMTY4IGRlbGV0aW9ucygtKQotLS0KYmFzZS1jb21t
aXQ6IGM0ZjRmOGRhNzAwNDRkOGIyOGZjY2Y3MzAxNmI0MTE5ZjNlMmZkNTAKY2hhbmdlLWlkOiAy
MDI1MDYwOS1kZW55X3RyYW1wb2xpbmVfc3RydWN0c19vbl9zdGFjay01YmJjN2JjMjBkZDEKCkJl
c3QgcmVnYXJkcywKLS0gCkFsZXhpcyBMb3Rob3LDqSwgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBh
bmQgS2VybmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlz
dApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
