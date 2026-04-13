Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QF92MAA23Wl9agkAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Apr 2026 20:29:20 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A5BDC3F207B
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Apr 2026 20:29:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6D377C56612;
	Mon, 13 Apr 2026 18:29:20 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C154AC56612
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Apr 2026 18:29:18 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 3E267C5B1AF;
 Mon, 13 Apr 2026 18:29:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 8A00C5FFB9;
 Mon, 13 Apr 2026 18:29:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9615210450503; 
 Mon, 13 Apr 2026 20:29:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1776104956; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=lEqpkfSG4bvQgxtPI4x8t4f5ElxNEGTXzPOFRzqjwCY=;
 b=plX1wAiahNNvYLrmKHyngjgbUZTsjXMi0XkNrQqatZIZfwi5y+MpfMYnpaPSrFPPIx5z1o
 DjTmJalfQiDo3KOvAbGJ1qE8SiwJJI0z30hz7Hh1mg2vocPtrjUgfmRmqgaiTA1AVxu05f
 TSmPLflLKUoX/QhZnH3X4nY86J0jvLHmL8Prsn2b5oH9X82bb0dFnuzoVhoZEXNtsuu8LG
 RYUj2X6gdbavH0vUvSLXR3PcQcqHbq/u/pQ6CScqPoDPnGCm0BxblVPKU5DjB93iCZrcYO
 uXojuVumNxIojmUJCrrBnPbAjhBsiAlqNEnuhQUM5TcX823OQvFjhzlelwNoqg==
From: =?utf-8?q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29?=
 <alexis.lothore@bootlin.com>
Date: Mon, 13 Apr 2026 20:28:45 +0200
MIME-Version: 1.0
Message-Id: <20260413-kasan-v1-5-1a5831230821@bootlin.com>
References: <20260413-kasan-v1-0-1a5831230821@bootlin.com>
In-Reply-To: <20260413-kasan-v1-0-1a5831230821@bootlin.com>
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 Martin KaFai Lau <martin.lau@linux.dev>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 John Fastabend <john.fastabend@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, David Ahern <dsahern@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Shuah Khan <shuah@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
 Alexander Potapenko <glider@google.com>, 
 Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Andrew Morton <akpm@linux-foundation.org>
X-Mailer: b4 0.15.1
X-Last-TLS-Session-Version: TLSv1.3
Cc: linux-kselftest@vger.kernel.org,
 Bastien Curutchet <bastien.curutchet@bootlin.com>, netdev@vger.kernel.org,
 ebpf@linuxfoundation.org, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-mm@kvack.org,
 =?utf-8?q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29?=
 <alexis.lothore@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 bpf@vger.kernel.org, Xu Kuohai <xukuohai@huawei.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RFC bpf-next 5/8] bpf,
 x86: emit KASAN checks into x86 JITed programs
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
X-Spamd-Result: default: False [5.39 / 15.00];
	DMARC_POLICY_REJECT(2.00)[bootlin.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[bootlin.com:s=dkim];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[40];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS(0.00)[m:ast@kernel.org,m:daniel@iogearbox.net,m:andrii@kernel.org,m:martin.lau@linux.dev,m:eddyz87@gmail.com,m:memxor@gmail.com,m:song@kernel.org,m:yonghong.song@linux.dev,m:jolsa@kernel.org,m:john.fastabend@gmail.com,m:davem@davemloft.net,m:dsahern@kernel.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:shuah@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:ryabinin.a.a@gmail.com,m:glider@google.com,m:andreyknvl@gmail.com,m:dvyukov@google.com,m:vincenzo.frascino@arm.com,m:akpm@linux-foundation.org,m:linux-kselftest@vger.kernel.org,m:bastien.curutchet@bootlin.com,m:netdev@vger.kernel.org,m:ebpf@linuxfoundation.org,m:linux-kernel@vger.kernel.org,m:kasan-dev@googlegroups.com,m:linux-mm@kvack.org,m:alexis.lothore@bootlin.com,m:thomas.petazzoni@bootlin.com,m:bpf@vger.kernel.org,m:xukuohai@huawei.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead
 .org,m:johnfastabend@gmail.com,m:mcoquelinstm32@gmail.com,m:ryabininaa@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[alexis.lothore@bootlin.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_TO(0.00)[kernel.org,iogearbox.net,linux.dev,gmail.com,davemloft.net,redhat.com,alien8.de,linux.intel.com,zytor.com,foss.st.com,google.com,arm.com,linux-foundation.org];
	GREYLIST(0.00)[pass,meta];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexis.lothore@bootlin.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[bootlin.com:-];
	NEURAL_HAM(-0.00)[-0.941];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: A5BDC3F207B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SW5zZXJ0IEtBU0FOIHNoYWRvdyBtZW1vcnkgY2hlY2tzIGJlZm9yZSBtZW1vcnkgbG9hZCBhbmQg
c3RvcmUKb3BlcmF0aW9ucyBpbiBKSVQtY29tcGlsZWQgQlBGIHByb2dyYW1zLiBUaGlzIGhlbHBz
IGRldGVjdCBtZW1vcnkgc2FmZXR5CmJ1Z3Mgc3VjaCBhcyB1c2UtYWZ0ZXItZnJlZSBhbmQgb3V0
LW9mLWJvdW5kcyBhY2Nlc3NlcyBhdCBydW50aW1lLgoKVGhlIG1haW4gaW5zdHJ1Y3Rpb25zIGJl
aW5nIHRhcmdldGVkIGFyZSBCUEZfTERYIGFuZCBCUEZfU1RYLCBidXQgbm90CmFsbCBvZiB0aGVt
IGFyZSBiZWluZyBpbnN0cnVtZW50ZWQ6Ci0gaWYgdGhlIGxvYWQvc3RvcmUgaW5zdHJ1Y3Rpb24g
aXMgaW4gZmFjdCBhY2Nlc3NpbmcgdGhlIHByb2dyYW0gc3RhY2ssCiAgZW1pdF9rYXNhbl9jaGVj
ayBzaWxlbnRseSBza2lwcyB0aGUgaW5zdHJ1bWVudGF0aW9uLCBhcyB3ZSBhbHJlYWR5CiAgaGF2
ZSBwYWdlIGd1YXJkcyB0byBtb25pdG9yIHN0YWNrIGFjY2Vzc2VzLiBTdGFjayBhY2Nlc3NlcyBf
Y291bGRfIGJlCiAgbW9uaXRvcmVkIG1vcmUgZmluZWx5IGJ5IGFkZGluZyBrYXNhbiBjaGVja3Ms
IGJ1dCBpdCB3b3VsZCBuZWVkIEpJVAogIGNvbXBpbGVyIHRvIGluc2VydCByZWQgem9uZXMgYXJv
dW5kIGFueSB2YXJpYWJsZSBvbiBzdGFjaywgYW5kIHdlIGxpa2VseQogIGRvIG5vdCBoYXZlIGVu
b3VnaCBpbmZvIGluIEpJVCBjb21waWxlciB0byBkbyBzby4KLSBpZiB0aGUgbG9hZC9zdG9yZSBp
bnN0cnVjdGlvbiBpcyBhIEJQRl9QUk9CRV9NRU0gb3IgYSBCUEZfUFJPQkVfQVRPTUlDCiAgaW5z
dHJ1Y3Rpb24sIHdlIGRvIG5vdCBpbnN0cnVtZW50IGl0LCBhcyB0aGUgcGFzc2VkIGFkZHJlc3Mg
Y2FuIGZhdWx0CiAgKGhlbmNlIHRoZSBjdXN0b20gZmF1bHQgbWFuYWdlbWVudCB3aXRoIEJQRl9Q
Uk9CRV9YWFggaW5zdHJ1Y3Rpb25zKSwKICBhbmQgc28gdGhlIGNvcnJlc3BvbmRpbmcga2FzYW4g
Y2hlY2sgY291bGQgZmF1bHQgYXMgd2VsbC4KClNpZ25lZC1vZmYtYnk6IEFsZXhpcyBMb3Rob3LD
qSAoZUJQRiBGb3VuZGF0aW9uKSA8YWxleGlzLmxvdGhvcmVAYm9vdGxpbi5jb20+Ci0tLQpUaGlz
IFJGQyBhbHNvIGlnbm9yZXMgZm9yIG5vdyBhdG9taWMgb3BlcmF0aW9ucywgYmVjYXVzZSBJIGFt
IG5vdApwZXJmZWN0bHkgY2xlYXIgeWV0IGFib3V0IGhvdyB0aGV5IGFyZSBKSVRlZCBhbmQgc28g
aG93IG11Y2gga2FzYW4KaW5zdHJ1bWVudGF0aW9uIGlzIGxlZ2l0aW1hdGUgaGVyZS4KLS0tCiBh
cmNoL3g4Ni9uZXQvYnBmX2ppdF9jb21wLmMgfCAxMyArKysrKysrKysrKysrCiAxIGZpbGUgY2hh
bmdlZCwgMTMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gveDg2L25ldC9icGZfaml0
X2NvbXAuYyBiL2FyY2gveDg2L25ldC9icGZfaml0X2NvbXAuYwppbmRleCBiOTAxMDNiZDAwODAu
LjExMWZlMWQ1NTEyMSAxMDA2NDQKLS0tIGEvYXJjaC94ODYvbmV0L2JwZl9qaXRfY29tcC5jCisr
KyBiL2FyY2gveDg2L25ldC9icGZfaml0X2NvbXAuYwpAQCAtMTgxMSw2ICsxODExLDcgQEAgc3Rh
dGljIGludCBkb19qaXQoc3RydWN0IGJwZl92ZXJpZmllcl9lbnYgKmVudiwgc3RydWN0IGJwZl9w
cm9nICpicGZfcHJvZywgaW50ICoKIAkJY29uc3QgczMyIGltbTMyID0gaW5zbi0+aW1tOwogCQl1
MzIgZHN0X3JlZyA9IGluc24tPmRzdF9yZWc7CiAJCXUzMiBzcmNfcmVnID0gaW5zbi0+c3JjX3Jl
ZzsKKwkJYm9vbCBhY2Nlc3Nlc19zdGFjazsKIAkJdTggYjIgPSAwLCBiMyA9IDA7CiAJCXU4ICpz
dGFydF9vZl9sZHg7CiAJCXM2NCBqbXBfb2Zmc2V0OwpAQCAtMTgzMSw2ICsxODMyLDcgQEAgc3Rh
dGljIGludCBkb19qaXQoc3RydWN0IGJwZl92ZXJpZmllcl9lbnYgKmVudiwgc3RydWN0IGJwZl9w
cm9nICpicGZfcHJvZywgaW50ICoKIAkJCUVNSVRfRU5EQlIoKTsKIAogCQlpcCA9IGltYWdlICsg
YWRkcnNbaSAtIDFdICsgKHByb2cgLSB0ZW1wKTsKKwkJYWNjZXNzZXNfc3RhY2sgPSBicGZfaW5z
bl9hY2Nlc3Nlc19zdGFjayhlbnYsIGJwZl9wcm9nLCBpIC0gMSk7CiAKIAkJc3dpdGNoIChpbnNu
LT5jb2RlKSB7CiAJCQkvKiBBTFUgKi8KQEAgLTIyNDIsNiArMjI0NCwxMSBAQCBzdDoJCQlpZiAo
aXNfaW1tOChpbnNuLT5vZmYpKQogCQljYXNlIEJQRl9TVFggfCBCUEZfTUVNIHwgQlBGX0g6CiAJ
CWNhc2UgQlBGX1NUWCB8IEJQRl9NRU0gfCBCUEZfVzoKIAkJY2FzZSBCUEZfU1RYIHwgQlBGX01F
TSB8IEJQRl9EVzoKKwkJCWVyciA9IGVtaXRfa2FzYW5fY2hlY2soJnByb2csIGRzdF9yZWcsIGlu
c24sCisJCQkJCSAgICAgICBpbWFnZSArIGFkZHJzW2kgLSAxXSwKKwkJCQkJICAgICAgIGFjY2Vz
c2VzX3N0YWNrKTsKKwkJCWlmIChlcnIpCisJCQkJcmV0dXJuIGVycjsKIAkJCWVtaXRfc3R4KCZw
cm9nLCBCUEZfU0laRShpbnNuLT5jb2RlKSwgZHN0X3JlZywgc3JjX3JlZywgaW5zbi0+b2ZmKTsK
IAkJCWJyZWFrOwogCkBAIC0yMzkwLDYgKzIzOTcsMTIgQEAgc3Q6CQkJaWYgKGlzX2ltbTgoaW5z
bi0+b2ZmKSkKIAkJCQkvKiBwb3B1bGF0ZSBqbXBfb2Zmc2V0IGZvciBKQUUgYWJvdmUgdG8ganVt
cCB0byBzdGFydF9vZl9sZHggKi8KIAkJCQlzdGFydF9vZl9sZHggPSBwcm9nOwogCQkJCWVuZF9v
Zl9qbXBbLTFdID0gc3RhcnRfb2ZfbGR4IC0gZW5kX29mX2ptcDsKKwkJCX0gZWxzZSB7CisJCQkJ
ZXJyID0gZW1pdF9rYXNhbl9jaGVjaygmcHJvZywgc3JjX3JlZywgaW5zbiwKKwkJCQkJCSAgICAg
ICBpbWFnZSArIGFkZHJzW2kgLSAxXSwKKwkJCQkJCSAgICAgICBhY2Nlc3Nlc19zdGFjayk7CisJ
CQkJaWYgKGVycikKKwkJCQkJcmV0dXJuIGVycjsKIAkJCX0KIAkJCWlmIChCUEZfTU9ERShpbnNu
LT5jb2RlKSA9PSBCUEZfUFJPQkVfTUVNU1ggfHwKIAkJCSAgICBCUEZfTU9ERShpbnNuLT5jb2Rl
KSA9PSBCUEZfTUVNU1gpCgotLSAKMi41My4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJA
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
