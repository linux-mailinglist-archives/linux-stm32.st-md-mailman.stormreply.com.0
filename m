Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0RsvIk7PK2rgFQQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 12 Jun 2026 11:20:14 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2540B67832E
	for <lists+linux-stm32@lfdr.de>; Fri, 12 Jun 2026 11:20:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=bootlin.com header.s=dkim header.b="NPUVXd/I";
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=bootlin.com (policy=reject)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C6D16C9AE33;
	Fri, 12 Jun 2026 09:20:13 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EB42FC712B2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Jun 2026 09:20:11 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 23F8F1A38E3;
 Fri, 12 Jun 2026 09:20:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E708560012;
 Fri, 12 Jun 2026 09:20:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 78C43106C8615; 
 Fri, 12 Jun 2026 11:19:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1781256009; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=ncZwz3sNo308KUWItJhOltAt4oaQ+Dyfb6WfEv6tuTQ=;
 b=NPUVXd/IqoKsy6s7A+fdPRQy6EEOpjPaH8ih3ujTyougrpDUztW7Anv/xDTuCzxcIY/9RD
 imNRzYSlcydkukZ0CZtMQSJjh4uOKTT9VQwQ+p0uRTBmwDnthntHxlHl32ILPKKGwZkk3r
 ETMuGlhnGDZZO/FZwNOc6o5+ckd2bOShZZE6IlcVO6d6tX+ExlAMFHwMYUQQs97g4ojmLi
 Eysj++XJxX6NCM+sF4JDtVWGx2eUxr0jBqhuI4TektmgXGBmvOBt/ipTfE5qC6kdqTkWHL
 FZUzNclbZSDOKLOZI+pgkKWxBXEYysKXgQTpCZfu222VDf81u81G8Gvwaapd3A==
Mime-Version: 1.0
Date: Fri, 12 Jun 2026 11:19:58 +0200
Message-Id: <DJ6YJX01138K.SRJQQJFBY73J@bootlin.com>
From: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: <bot+bpf-ci@kernel.org>, <alexis.lothore@bootlin.com>, <ast@kernel.org>,
 <daniel@iogearbox.net>, <andrii@kernel.org>, <martin.lau@linux.dev>,
 <eddyz87@gmail.com>, <memxor@gmail.com>, <song@kernel.org>,
 <yonghong.song@linux.dev>, <jolsa@kernel.org>, <john.fastabend@gmail.com>,
 <tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
 <dave.hansen@linux.intel.com>, <x86@kernel.org>, <hpa@zytor.com>,
 <shuah@kernel.org>, <mcoquelin.stm32@gmail.com>,
 <alexandre.torgue@foss.st.com>, <ihor.solodrai@linux.dev>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260604-kasan-v2-8-c066e627fda8@bootlin.com>
 <8642178be3be8efc7f19ac4a9aa37e699f2baa82cab200909b99997068c6ae7b@mail.kernel.org>
In-Reply-To: <8642178be3be8efc7f19ac4a9aa37e699f2baa82cab200909b99997068c6ae7b@mail.kernel.org>
X-Last-TLS-Session-Version: TLSv1.3
Cc: thomas.petazzoni@bootlin.com, ebpf@linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 bpf@vger.kernel.org, bastien.curutchet@bootlin.com, clm@meta.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 martin.lau@kernel.org
Subject: Re: [Linux-stm32] [PATCH bpf-next v2 8/8] selftests/bpf: add tests
 to validate KASAN on JIT programs
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [5.89 / 15.00];
	DMARC_POLICY_REJECT(2.00)[bootlin.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[bootlin.com:s=dkim];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MV_CASE(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,bootlin.com,iogearbox.net,linux.dev,gmail.com,redhat.com,alien8.de,linux.intel.com,zytor.com,foss.st.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bot+bpf-ci@kernel.org,m:alexis.lothore@bootlin.com,m:ast@kernel.org,m:daniel@iogearbox.net,m:andrii@kernel.org,m:martin.lau@linux.dev,m:eddyz87@gmail.com,m:memxor@gmail.com,m:song@kernel.org,m:yonghong.song@linux.dev,m:jolsa@kernel.org,m:john.fastabend@gmail.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:shuah@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:ihor.solodrai@linux.dev,m:thomas.petazzoni@bootlin.com,m:ebpf@linuxfoundation.org,m:linux-kernel@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:bpf@vger.kernel.org,m:bastien.curutchet@bootlin.com,m:clm@meta.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:martin.lau@kernel.org,m:bot@kernel.org,m:johnfastabend@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[alexis.lothore@bootlin.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[32];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[bootlin.com:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexis.lothore@bootlin.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,bpf-ci];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:mid,bootlin.com:url,bootlin.com:from_mime,st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2540B67832E

T24gVGh1IEp1biA0LCAyMDI2IGF0IDExOjQ1IFBNIENFU1QsIGJvdCticGYtY2kgd3JvdGU6Cgpb
Li4uXQoKPiBUaGUgU2FzaGlrbyBBSSByZXZpZXcgb24gdGhlIFJGQyB2MSA4LzggcG9zdGluZyBy
YWlzZWQgYSBjb25jZXJuIGhlcmUgdGhhdAo+IGRvZXMgbm90IHNlZW0gdG8gaGF2ZSBiZWVuIGFk
ZHJlc3NlZCBpbiB2MjoKPgo+ICAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYnBmLzIwMjYwNDI1
MDY1MDQ5LkJFQzYzQzJCQ0IwQHNtdHAua2VybmVsLm9yZwo+Cj4gVGhlIG9yaWdpbmFsIHF1ZXN0
aW9uIHdhczoKPgo+ICAgS0FTQU4gb3BlcmF0ZXMgaW4gc2luZ2xlLXNob3QgbW9kZSBieSBkZWZh
dWx0LiBBZnRlciB0aGUgZmlyc3Qgc3VidGVzdAo+ICAgdHJpZ2dlcnMgYSByZXBvcnQsIHdpbGwg
c3Vic2VxdWVudCByZXBvcnRzIGJlIHN1cHByZXNzZWQsIGNhdXNpbmcgdGhlCj4gICByZW1haW5p
bmcgc3VidGVzdHMgdG8gZmFpbD8gQWxzbywgc2luY2UgQlBGIENJIHJ1bnMgd2l0aCBwYW5pY19v
bl93YXJuPTEsCj4gICB3aWxsIHRoZSBmaXJzdCBLQVNBTiBzcGxhdCBpbnZva2UgY2hlY2tfcGFu
aWNfb25fd2FybigpIGFuZCBpbW1lZGlhdGVseQo+ICAgcGFuaWMgdGhlIENJIHJ1bm5lcj8KPgo+
IEtBU0FOIHJ1bnMgaW4gc2luZ2xlLXNob3QgbW9kZSBieSBkZWZhdWx0LiBtbS9rYXNhbi9yZXBv
cnQuYyBzdXBwcmVzc2VzCj4gcmVwb3J0cyBhZnRlciB0aGUgZmlyc3Qgb25lIHVubGVzcyBrYXNh
bl9tdWx0aV9zaG90IGlzIHNldC4KPgo+IFRoaXMgbG9vcCBydW5zIHJvdWdobHkgNTAgc3VidGVz
dHMsIGFuZCBlYWNoIG9uZSBleHBlY3RzIGEgZnJlc2ggS0FTQU4KPiByZXBvcnQgZW1pdHRlZCB2
aWEgdGhlIEpJVC1pbnNlcnRlZCBfX2FzYW5fbG9hZC9fX2FzYW5fc3RvcmUgY2FsbHMgdGhhdCBn
bwo+IHRocm91Z2gga2FzYW5fcmVwb3J0KCkuCj4KPiBVbmRlciBkZWZhdWx0IHNpbmdsZS1zaG90
IEtBU0FOLCB3b3VsZCB0aGUgc3VidGVzdHMgYWZ0ZXIgdGhlIGZpcnN0IG9uZSBzZWUKPiBubyBy
ZXBvcnQgYW5kIGZhaWwgdGhlIHBvc2l0aXZlIGFzc2VydGlvbnM/Cj4KPiBTZXBhcmF0ZWx5LCBC
UEYgQ0kgcnVucyB3aXRoIHBhbmljX29uX3dhcm49MSAoY29uZmlnLnBwYzY0ZWwgc3RpbGwgc2V0
cwo+IHBhbmljX29uX3dhcm49MSkuIFdvdWxkIHRoZSBmaXJzdCBLQVNBTiBzcGxhdCByZWFjaCBj
aGVja19wYW5pY19vbl93YXJuKCkKPiBhbmQgcGFuaWMgdGhlIHJ1bm5lcj8KPgo+IE5vdGhpbmcg
aW4gdjIgYXBwZWFycyB0byBlbmFibGUga2FzYW5fbXVsdGlfc2hvdCBvciBndWFyZCBhZ2FpbnN0
Cj4gcGFuaWNfb25fd2Fybi4gV2FzIHRoaXMgaW50ZW5kZWQgdG8gYmUgaGFuZGxlZCBzb21ld2hl
cmU/CgpIb3BpbmcgdG8gc2lsZW5jZSB0aGlzIG9uZSBvbiB0aGUgbmV4dCByZXZpc2lvbjogQ0kg
aGFzIGJlZW4gdXBkYXRlZApzZXBhcmF0ZWx5IHRvIGVuYWJsZSBrYXNhbl9tdWx0aV9zaG90LCBh
bmQgc28gYWxsIHN1YnRlc3RzIGluIHYyCnByb3Blcmx5IHRyaWdnZXJlZCB0aGUgcmVwb3J0cyBp
bmRpdmlkdWFsbHkuIFRoZSBjb21taXQgaXMgbGFja2luZwpkb2N1bWVudGF0aW9uIGFib3V0IHRo
aXMgbmVlZCB0aG91Z2guCgotLSAKQWxleGlzIExvdGhvcsOpLCBCb290bGluCkVtYmVkZGVkIExp
bnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcKaHR0cHM6Ly9ib290bGluLmNvbQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGlu
ZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9z
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
