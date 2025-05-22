Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA77AC0990
	for <lists+linux-stm32@lfdr.de>; Thu, 22 May 2025 12:15:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0D2EDC7A825;
	Thu, 22 May 2025 10:15:09 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 330C1C78F98
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 May 2025 10:15:08 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 561DC1FCEF;
 Thu, 22 May 2025 10:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1747908907;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+r7J1xhws6aDU6U1m+dl2K9Zh5x/cHIxtpt6U5qcUxs=;
 b=U5kiFUO6++yJX3ypo91Fl4X7mUP9Sa/hCyWHKJxXAIUJzA0hGe62i5QjAtxHTC6hJPwQMh
 Dmq8nNbv5+Z3TZ2mPxAdW0inOfamKXXS7C2FYZI4fPj/x7mdEl4JcsTBZ0838/iER0w19a
 ww9BPo34dIJzU8eDf9PnZFPG2v0PnK+xzdCTUHpGDn2Xk1mUNVlNEPsI2baCp7PVgoGiwQ
 5LNcZ5y0XduQoK9iu424EtwDNWvJeCiVO+QZq/QC9dpmdUPib1y77bZ99FZ197rJnS9pyU
 sZynPQuN1Sk6Q/fPeeQ6LsWxxhG0Pwa3QSJeLVvB3GmmnZmoC4pc55wsamiOdg==
From: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Date: Thu, 22 May 2025 12:14:39 +0200
Message-Id: <20250522-many_args_arm64-v2-0-d6afdb9cf819@bootlin.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAA/5LmgC/2WNywqDMBREf0XuuinJTeqjq/5HkRL1qoGaSBJEE
 f+9IdtuBg7DnDkhkDcU4Fmc4GkzwTibAG8F9LO2EzEzJAbk+OCInC3aHh/tp5BiKRWru0FWqqK
 yUTWk1eppNHs2vqFbR2Zpj9CmZjYhOn/kq03kPluVEH/WTTDOuJY4UoVSNvTqnItfY++9W6C9r
 usHhr1ZJ7oAAAA=
X-Change-ID: 20250220-many_args_arm64-8bd3747e6948
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Andrii Nakryiko <andrii@kernel.org>, 
 Martin KaFai Lau <martin.lau@linux.dev>, 
 Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, KP Singh <kpsingh@kernel.org>, 
 Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
 Jiri Olsa <jolsa@kernel.org>, Puranjay Mohan <puranjay@kernel.org>, 
 Xu Kuohai <xukuohai@huaweicloud.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Mykola Lysenko <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Florent Revest <revest@chromium.org>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdehieelucdltddurdegfedvrddttddmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhufffkfggtgfgvfevofesthekredtredtjeenucfhrhhomheptehlvgigihhsucfnohhthhhorhoruceorghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefffedvleeltdefkeduledvkedvueffudeiveekvdeitdegfeeuhefgvdeutdfhueenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopegludelvddrudeikedrtddrvddungdpmhgrihhlfhhrohhmpegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedupdhrtghpthhtoheplhhinhhugidqkhhsvghlfhhtvghsthesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegsrghsthhivghnrdgtuhhruhhttghhvghtsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepshhhuhgrhheskhgvrhhnvghlrdhorhhgpdhrt
 ghpthhtohepgihukhhuohhhrghisehhuhgrfigvihgtlhhouhgurdgtohhmpdhrtghpthhtohepjhholhhsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhpshhinhhghheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepgihukhhuohhhrghisehhuhgrfigvihdrtghomhdprhgtphhtthhopegvsghpfheslhhinhhugihfohhunhgurghtihhonhdrohhrgh
X-GND-Sasl: alexis.lothore@bootlin.com
Cc: linux-kselftest@vger.kernel.org,
 Bastien Curutchet <bastien.curutchet@bootlin.com>, ebpf@linuxfoundation.org,
 linux-kernel@vger.kernel.org,
 =?utf-8?q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29?=
 <alexis.lothore@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 bpf@vger.kernel.org, Xu Kuohai <xukuohai@huawei.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH bpf-next v2 0/2] bpf,
	arm64: support up to 12 arguments
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

SGVsbG8sCgp0aGlzIGlzIHRoZSB2MiBvZiB0aGUgbWFueSBhcmdzIHNlcmllcyBmb3IgYXJtNjQs
IGJlaW5nIGl0c2VsZiBhIHJldml2YWwKb2YgWHUgS3Vob2FpJ3Mgd29yayB0byBlbmFibGUgbGFy
Z2VyIGFyZ3VtZW50cyBjb3VudCBmb3IgQlBGIHByb2dyYW1zIG9uCkFSTTY0IChbMV0pLgoKVGhl
IGRpc2N1c3Npb25zIGluIHYxIHNoZWQgc29tZSBsaWdodCBvbiBzb21lIGlzc3VlcyBhcm91bmQg
c3BlY2lmaWMKY2FzZXMsIGZvciBleGFtcGxlIHdpdGggZnVuY3Rpb25zIHBhc3Npbmcgc3RydWN0
IG9uIHN0YWNrIHdpdGggY3VzdG9tCnBhY2tpbmcvYWxpZ25tZW50IGF0dHJpYnV0ZXM6IHRob3Nl
IGNhc2VzIGNhbiBub3QgYmUgcHJvcGVybHkgZGV0ZWN0ZWQKd2l0aCB0aGUgY3VycmVudCBCVEYg
aW5mby4gU28gdGhpcyBuZXcgcmV2aXNpb24gYWltcyB0byBzZXBhcmF0ZQpjb25jZXJucyB3aXRo
IGEgc2ltcGxlciBpbXBsZW1lbnRhdGlvbiwganVzdCBhY2NlcHRpbmcgYWRkaXRpb25hbCBhcmdz
Cm9uIHN0YWNrIGlmIHdlIGNhbiBtYWtlIHN1cmUgYWJvdXQgdGhlIGFsaWdubWVudCBjb25zdHJh
aW50cyAoYW5kIHNvLApyZWZ1c2luZyBhdHRhY2htZW50IHRvIGZ1bmN0aW9ucyBwYXNzaW5nIHN0
cnVjdHMgb24gc3RhY2tzKS4gSSB0aGVuCmNoZWNrZWQgaWYgdGhlIHNwZWNpZmljIGFsaWdubWVu
dCBjb25zdHJhaW50cyBjb3VsZCBiZSBjaGVja2VkIHdpdGgKbGFyZ2VyIHNjYWxhciB0eXBlcyBy
YXRoZXIgdGhhbiBzdHJ1Y3RzLCBidXQgaXQgYXBwZWFycyB0aGF0IHRoaXMgdXNlCmNhc2UgaXMg
aW4gZmFjdCByZWplY3RlZCBhdCB0aGUgdmVyaWZpZXIgbGV2ZWwgKHNlZSBhOWI1OTE1OWQzMzgg
KCJicGY6CkRvIG5vdCBhbGxvdyBidGZfY3R4X2FjY2VzcyB3aXRoIF9faW50MTI4IHR5cGVzIikp
LiBTbyBpbiB0aGUgZW5kIHRoZQpzcGVjaWZpYyBhbGlnbm1lbnQgY29ybmVyIGNhc2VzIHJhaXNl
ZCBpbiBbMV0gY2FuIG5vdCByZWFsbHkgaGFwcGVuIGluCnRoZSBrZXJuZWwgaW4gaXRzIGN1cnJl
bnQgc3RhdGUuIFRoaXMgbmV3IHJldmlzaW9uIHN0aWxsIGJyaW5ncyBzdXBwb3J0CmZvciB0aGUg
c3RhbmRhcmQgY2FzZXMgYXMgYSBmaXJzdCBzdGVwLCBpdCB3aWxsIHRoZW4gYmUgcG9zc2libGUg
dG8KaXRlcmF0ZSBvbiB0b3Agb2YgaXQgdG8gYWRkIHRoZSBtb3JlIHNwZWNpZmljIGNhc2VzIGxp
a2Ugc3RydWN0IHBhc3NlZApvbiBzdGFjayBhbmQgbGFyZ2VyIHR5cGVzLgoKWzFdIGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2FsbC8yMDIzMDkxNzE1MDc1Mi42OTYxMi0xLXh1a3VvaGFpQGh1YXdl
aWNsb3VkLmNvbS8jdAoKU2lnbmVkLW9mZi1ieTogQWxleGlzIExvdGhvcsOpIChlQlBGIEZvdW5k
YXRpb24pIDxhbGV4aXMubG90aG9yZUBib290bGluLmNvbT4KLS0tCkNoYW5nZXMgaW4gdjI6Ci0g
cmVtb3ZlIGFsaWdubWVudCBjb21wdXRhdGlvbiBmcm9tIGJ0Zi5jCi0gZGVkdWNlIGFsaWdubWVu
dCBjb25zdHJhaW50cyBkaXJlY3RseSBpbiBqaXQgY29tcGlsZXIgZm9yIHNpbXBsZSB0eXBlcwot
IGRlbnkgYXR0YWNobWVudCB0byBmdW5jdGlvbnMgd2l0aCAiY29ybmVyLWNhc2VzIiBhcmd1bWVu
dHMgKGllOgogIHN0cnVjdHMgb24gc3RhY2spCi0gcmVtb3ZlIGN1c3RvbSB0ZXN0cywgYXMgdGhl
IGNvcnJlc3BvbmRpbmcgdXNlIGNhc2VzIGFyZSBsb2NrZWQgZWl0aGVyCiAgYnkgdGhlIEpJVCBj
b21wIG9yIHRoZSB2ZXJpZmllcgotIGRyb3AgUkZDCi0gTGluayB0byB2MTogaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvci8yMDI1MDQxMS1tYW55X2FyZ3NfYXJtNjQtdjEtMC0wYTMyZmU3MjMzOWVA
Ym9vdGxpbi5jb20KCi0tLQpBbGV4aXMgTG90aG9yw6kgKGVCUEYgRm91bmRhdGlvbikgKDEpOgog
ICAgICBzZWxmdGVzdHMvYnBmOiBlbmFibGUgbWFueS1hcmdzIHRlc3RzIGZvciBhcm02NAoKWHUg
S3VvaGFpICgxKToKICAgICAgYnBmLCBhcm02NDogU3VwcG9ydCB1cCB0byAxMiBmdW5jdGlvbiBh
cmd1bWVudHMKCiBhcmNoL2FybTY0L25ldC9icGZfaml0X2NvbXAuYyAgICAgICAgICAgICAgICB8
IDIzNCArKysrKysrKysrKysrKysrKysrKy0tLS0tLS0KIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3Rz
L2JwZi9ERU5ZTElTVC5hYXJjaDY0IHwgICAyIC0KIDIgZmlsZXMgY2hhbmdlZCwgMTgwIGluc2Vy
dGlvbnMoKyksIDU2IGRlbGV0aW9ucygtKQotLS0KYmFzZS1jb21taXQ6IDk0MzUxMzhjMDY5MTE3
Y2Q1OWE0OTEyYjVlYTJhZTQ0Y2MyYzVmZmEKY2hhbmdlLWlkOiAyMDI1MDIyMC1tYW55X2FyZ3Nf
YXJtNjQtOGJkMzc0N2U2OTQ4CgpCZXN0IHJlZ2FyZHMsCi0tIApBbGV4aXMgTG90aG9yw6ksIEJv
b3RsaW4KRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwpodHRwczovL2Jvb3Rs
aW4uY29tCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0
aW5mby9saW51eC1zdG0zMgo=
