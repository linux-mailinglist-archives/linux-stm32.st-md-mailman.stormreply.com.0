Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Lg3fKK3+J2qQ6wIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 09 Jun 2026 13:53:17 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3531E65FB27
	for <lists+linux-stm32@lfdr.de>; Tue, 09 Jun 2026 13:53:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=bootlin.com header.s=dkim header.b=ew6G7Kqh;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=bootlin.com (policy=reject)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EFCD4C90081;
	Tue,  9 Jun 2026 11:53:16 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6B2C1C8F271
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Jun 2026 20:22:37 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 3344F4E406AC;
 Thu,  4 Jun 2026 20:22:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0635A5FED1;
 Thu,  4 Jun 2026 20:22:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3108D106A1D3D; 
 Thu,  4 Jun 2026 22:22:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1780604555; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=onobyqUpNxQD6/u3MqsXH18ymnmpWqQmDfG8EEUxqLc=;
 b=ew6G7KqhTvHYNtp8yVygJarlPlaU1vsp2QeUIk98VAjxLseyvgvyOuz6Wgj8h4OlRaPjbn
 VdBpElk0eUFDLzcuyO9b43etwltKoEEUjekbphiNWscK4R4l+fzLAtKNIKKz31MZbo7J7K
 2WdJ2ofGmoW00YAtGX/LA5n30J+9TpURm+MAhmrg7s61IoO/mvbb7PDWE2d7gZACq+89bq
 espnfaox5Tr1a/WaS82xLgMM+uuQYRqjePSrWpYC+EgOcNrm7mWbpRtSGEtjHbuBUcuuFZ
 j8yj9B9xjuMFKvWgaFcAH/iRmGe7GHaF7dUbOicoppl6+IXaYaZvG+l5NruraQ==
From: =?utf-8?q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29?=
 <alexis.lothore@bootlin.com>
Date: Thu, 04 Jun 2026 22:22:01 +0200
MIME-Version: 1.0
Message-Id: <20260604-kasan-v2-3-c066e627fda8@bootlin.com>
References: <20260604-kasan-v2-0-c066e627fda8@bootlin.com>
In-Reply-To: <20260604-kasan-v2-0-c066e627fda8@bootlin.com>
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 Martin KaFai Lau <martin.lau@linux.dev>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Shuah Khan <shuah@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Approved-At: Tue, 09 Jun 2026 11:53:15 +0000
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, ebpf@linuxfoundation.org,
 linux-kernel@vger.kernel.org,
 =?utf-8?q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29?=
 <alexis.lothore@bootlin.com>, linux-kselftest@vger.kernel.org,
 bpf@vger.kernel.org, Bastien Curutchet <bastien.curutchet@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH bpf-next v2 3/8] bpf,
 x86: add helper to emit kasan checks in x86 JITed programs
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
X-Rspamd-Action: add header
X-Spamd-Result: default: False [6.39 / 15.00];
	DMARC_POLICY_REJECT(2.00)[bootlin.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[bootlin.com:s=dkim];
	DATE_IN_PAST(1.00)[111];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORGED_RECIPIENTS(0.00)[m:ast@kernel.org,m:daniel@iogearbox.net,m:andrii@kernel.org,m:martin.lau@linux.dev,m:eddyz87@gmail.com,m:memxor@gmail.com,m:song@kernel.org,m:yonghong.song@linux.dev,m:jolsa@kernel.org,m:john.fastabend@gmail.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:shuah@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:ihor.solodrai@linux.dev,m:thomas.petazzoni@bootlin.com,m:ebpf@linuxfoundation.org,m:linux-kernel@vger.kernel.org,m:alexis.lothore@bootlin.com,m:linux-kselftest@vger.kernel.org,m:bpf@vger.kernel.org,m:bastien.curutchet@bootlin.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:johnfastabend@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[alexis.lothore@bootlin.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_TO(0.00)[kernel.org,iogearbox.net,linux.dev,gmail.com,redhat.com,alien8.de,linux.intel.com,zytor.com,foss.st.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexis.lothore@bootlin.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[bootlin.com:-];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,bootlin.com:mid,bootlin.com:from_mime,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp,stormreply.com:url,stormreply.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3531E65FB27
X-Spam: Yes

QWRkIHRoZSBlbWl0X2thc2FuX2NoZWNrKCkgZnVuY3Rpb24gdGhhdCBlbWl0cyBLQVNBTiBzaGFk
b3cgbWVtb3J5CmNoZWNrcyBiZWZvcmUgbWVtb3J5IGFjY2Vzc2VzIGluIEpJVC1jb21waWxlZCBC
UEYgcHJvZ3JhbXMuIFRoZQppbXBsZW1lbnRhdGlvbiByZWxpZXMgb24gdGhlIGV4aXN0aW5nIF9f
YXNhbl97bG9hZCxzdG9yZX1YIGZ1bmN0aW9ucwpmcm9tIEtBU0FOIHN1YnN5c3RlbS4gVGhlIGhl
bHBlcjoKLSBlbnN1cmVzIHRoYXQgdGhlIGthc2FuIGluc3RydW1lbnRpb24gaXMgYWN0dWFsbHkg
bmVlZGVkOiBpZiB0aGUKICBpbnN0cnVjdGlvbiBiZWluZyBwcm9jZXNzZWQgYWNjZXNzZXMgdGhl
IHByb2dyYW0gc3RhY2ssIHdlIHNraXAgdGhlCiAgaW5zdHJ1bWVudGF0aW9uLCBhcyB0aG9zZSBh
Y2Nlc3NlcyBhcmUgYWxyZWFkeSBwcm90ZWN0ZWQgd2l0aCBwYWdlCiAgZ3VhcmRzCi0gc2F2ZXMg
cmVnaXN0ZXJzLiBUaGlzIGluY2x1ZGVzIGNhbGxlci1zYXZlZCByZWdpc3RlcnMsIGJ1dCBhbHNv
CiAgdGVtcG9yYXJ5IHJlZ2lzdGVycywgYXMgdGhvc2Ugd2VyZSBwb3NzaWJseSB1c2VkIGJ5IHRo
ZQogIGFmZmVjdGVkIHByb2dyYW0KLSBjb21wdXRlcyB0aGUgYWNjZXNzZWQgYWRkcmVzcyBhbmQg
c3RvcmVzIGl0IGluICVyZGkKLSBjYWxscyB0aGUgcmVsZXZhbnQgZnVuY3Rpb24sIGRlcGVuZGlu
ZyBvbiB0aGUgaW5zdHJ1Y3Rpb24gYmVpbmcgYSBsb2FkCiAgb3IgYSBzdG9yZSwgYW5kIHRoZSBz
aXplIG9mIHRoZSBhY2Nlc3MuCi0gcmVzdG9yZXMgcmVnaXN0ZXJzCgpUaGUgc3BlY2lhbCBjYXJl
IG5lZWRlZCB3aGVuIGluc2VydGluZyB0aGlzIGluc3RydW1lbnRhdGlvbiBjb21lcyBhdCB0aGUK
Y29zdCBvZiBhIG5vbiBuZWdsaWdlYWJsZSBpbmNyZWFzZSBpbiBKSVRlZCBjb2RlIHNpemUuIEZv
ciBleGFtcGxlLCBhCmJhcmUKCiAgbW92IAkweDAoJXNpKSxyYnggIyBMb2FkIGluIHJieCBjb250
ZW50IGF0IGFkZHJlc3Mgc3RvcmVkIGluIHJzaQoKYmVjb21lcwoKICBwdXNoICAgICVyYXgKICBw
dXNoICAgICVyY3gKICBwdXNoICAgICVyZHgKICBwdXNoICAgICVyc2kKICBwdXNoICAgICVyZGkK
ICBwdXNoICAgICVyOAogIHB1c2ggICAgJXI5CiAgbW92ICAgICAlcnNpLCVyZGkKICBjYWxsICAg
IDB4ZmZmZmZmZmY4MWRhMGE2MCA8X19hc2FuX2xvYWQ4PgogIHBvcCAgICAgJXI5CiAgcG9wICAg
ICAlcjgKICBwb3AgICAgICVyZGkKICBwb3AgICAgICVyc2kKICBwb3AgICAgICVyZHgKICBwb3Ag
ICAgICVyY3gKICBwb3AgICAgICVyYXgKICBtb3YgICAgIDB4MCglcnNpKSxyYngKClNpZ25lZC1v
ZmYtYnk6IEFsZXhpcyBMb3Rob3LDqSAoZUJQRiBGb3VuZGF0aW9uKSA8YWxleGlzLmxvdGhvcmVA
Ym9vdGxpbi5jb20+Ci0tLQpDaGFuZ2VzIGluIHYyOgotIG1vdmUgYXNhbiBmdW5jdGlvbnMgZGVj
bGFyYXRpb24gZGlyZWN0bHkgaW50byBqaXQgY29tcGlsZXIsIGFuZCBndWFyZAogIHRoZW0gd2l0
aCBJU19FTkFCTEVECi0gcmVtb3ZlIGZhdWx0eSBzdGFjayBhbGlnbm1lbnQsIG5vIGFyZyBpcyBw
YXNzZWQgdG8ga2FzYW4gZnVuY3Mgb24gdGhlCiAgc3RhY2sgYW55d2F5Ci0gbWFrZSBzdXJlIHRv
IGVtaXQgY2FsbCBkZXB0aCBhY2NvdW50aW5nIGNvZGUKLSBkbyBub3Qgc2F2ZSB1bm5lZWRlZCBy
ZWdpc3RlcnMKLSB1cGRhdGUgaGVscGVyIHNpZ25hdHVyZSB0byBsZXQgY2FsbGVyIGNvbmZpZ3Vy
ZSBzb21lIHZhbHVlcyAoZWc6CiAgaXNfd3JpdGUpCgpTaWduZWQtb2ZmLWJ5OiBBbGV4aXMgTG90
aG9yw6kgKGVCUEYgRm91bmRhdGlvbikgPGFsZXhpcy5sb3Rob3JlQGJvb3RsaW4uY29tPgotLS0K
IGFyY2gveDg2L25ldC9icGZfaml0X2NvbXAuYyB8IDkzICsrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDkzIGluc2VydGlvbnMoKykK
CmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9uZXQvYnBmX2ppdF9jb21wLmMgYi9hcmNoL3g4Ni9uZXQv
YnBmX2ppdF9jb21wLmMKaW5kZXggYTBjNTQxYTQ0MWNmLi4wOTgxNzkxMDE0ZWIgMTAwNjQ0Ci0t
LSBhL2FyY2gveDg2L25ldC9icGZfaml0X2NvbXAuYworKysgYi9hcmNoL3g4Ni9uZXQvYnBmX2pp
dF9jb21wLmMKQEAgLTIxLDYgKzIxLDE5IEBACiAjaW5jbHVkZSA8YXNtL3Vud2luZC5oPgogI2lu
Y2x1ZGUgPGFzbS9jZmkuaD4KIAorI2lmIElTX0VOQUJMRUQoQ09ORklHX0JQRl9KSVRfS0FTQU4p
Cit2b2lkIF9fYXNhbl9sb2FkMSh2b2lkICpwKTsKK3ZvaWQgX19hc2FuX3N0b3JlMSh2b2lkICpw
KTsKK3ZvaWQgX19hc2FuX2xvYWQyKHZvaWQgKnApOwordm9pZCBfX2FzYW5fc3RvcmUyKHZvaWQg
KnApOwordm9pZCBfX2FzYW5fbG9hZDQodm9pZCAqcCk7Cit2b2lkIF9fYXNhbl9zdG9yZTQodm9p
ZCAqcCk7Cit2b2lkIF9fYXNhbl9sb2FkOCh2b2lkICpwKTsKK3ZvaWQgX19hc2FuX3N0b3JlOCh2
b2lkICpwKTsKK3ZvaWQgX19hc2FuX2xvYWQxNih2b2lkICpwKTsKK3ZvaWQgX19hc2FuX3N0b3Jl
MTYodm9pZCAqcCk7CisjZW5kaWYKKwogc3RhdGljIGJvb2wgYWxsX2NhbGxlZV9yZWdzX3VzZWRb
NF0gPSB7dHJ1ZSwgdHJ1ZSwgdHJ1ZSwgdHJ1ZX07CiAKIHN0YXRpYyB1OCAqZW1pdF9jb2RlKHU4
ICpwdHIsIHUzMiBieXRlcywgdW5zaWduZWQgaW50IGxlbikKQEAgLTEzMzAsNiArMTM0Myw4NiBA
QCBzdGF0aWMgdm9pZCBlbWl0X3N0b3JlX3N0YWNrX2ltbTY0KHU4ICoqcHByb2csIGludCByZWcs
IGludCBzdGFja19vZmYsIHU2NCBpbW02NAogCWVtaXRfc3R4KHBwcm9nLCBCUEZfRFcsIEJQRl9S
RUdfRlAsIHJlZywgc3RhY2tfb2ZmKTsKIH0KIAorc3RhdGljIGludCBlbWl0X2thc2FuX2NoZWNr
KHU4ICoqcHByb2csIHUzMiBhZGRyX3JlZywgc3RydWN0IGJwZl9pbnNuICppbnNuLAorCQkJICAg
IHU4ICppcCwgYm9vbCBpc193cml0ZSwgYm9vbCBhY2Nlc3Nlc19zdGFja19vbmx5KQoreworI2lm
ZGVmIENPTkZJR19CUEZfSklUX0tBU0FOCisJdTMyIGJwZl9zaXplID0gQlBGX1NJWkUoaW5zbi0+
Y29kZSk7CisJczMyIG9mZiA9IGluc24tPm9mZjsKKwl1OCAqcHJvZyA9ICpwcHJvZzsKKwl2b2lk
ICprYXNhbl9mdW5jOworCisJaWYgKGFjY2Vzc2VzX3N0YWNrX29ubHkpCisJCXJldHVybiAwOwor
CisJLyogRGVyaXZlIEtBU0FOIGNoZWNrIGZ1bmN0aW9uIGZyb20gYWNjZXNzIHR5cGUgYW5kIHNp
emUgKi8KKwlzd2l0Y2ggKGJwZl9zaXplKSB7CisJY2FzZSBCUEZfQjoKKwkJa2FzYW5fZnVuYyA9
IGlzX3dyaXRlID8gX19hc2FuX3N0b3JlMSA6IF9fYXNhbl9sb2FkMTsKKwkJYnJlYWs7CisJY2Fz
ZSBCUEZfSDoKKwkJa2FzYW5fZnVuYyA9IGlzX3dyaXRlID8gX19hc2FuX3N0b3JlMiA6IF9fYXNh
bl9sb2FkMjsKKwkJYnJlYWs7CisJY2FzZSBCUEZfVzoKKwkJa2FzYW5fZnVuYyA9IGlzX3dyaXRl
ID8gX19hc2FuX3N0b3JlNCA6IF9fYXNhbl9sb2FkNDsKKwkJYnJlYWs7CisJY2FzZSBCUEZfRFc6
CisJCWthc2FuX2Z1bmMgPSBpc193cml0ZSA/IF9fYXNhbl9zdG9yZTggOiBfX2FzYW5fbG9hZDg7
CisJCWJyZWFrOworCWRlZmF1bHQ6CisJCXJldHVybiAtRUlOVkFMOworCX0KKworCS8qIFNhdmUg
cmF4ICovCisJRU1JVDEoMHg1MCk7CisJLyogU2F2ZSByY3ggKi8KKwlFTUlUMSgweDUxKTsKKwkv
KiBTYXZlIHJkeCAqLworCUVNSVQxKDB4NTIpOworCS8qIFNhdmUgcnNpICovCisJRU1JVDEoMHg1
Nik7CisJLyogU2F2ZSByZGkgKi8KKwlFTUlUMSgweDU3KTsKKwkvKiBTYXZlIHI4ICovCisJRU1J
VDIoMHg0MSwgMHg1MCk7CisJLyogU2F2ZSByOSAqLworCUVNSVQyKDB4NDEsIDB4NTEpOworCisJ
LyogbW92IHJkaSwgYWRkcl9yZWcgKi8KKwlFTUlUX21vdihCUEZfUkVHXzEsIGFkZHJfcmVnKTsK
KworCS8qIGFkZCByZGksIG9mZiAoaWYgb2Zmc2V0IGlzIG5vbi16ZXJvKSAqLworCWlmIChvZmYp
IHsKKwkJaWYgKGlzX2ltbTgob2ZmKSkgeworCQkJLyogYWRkIHJkaSwgaW1tOCAqLworCQkJRU1J
VDQoMHg0OCwgMHg4MywgMHhDNywgKHU4KW9mZik7CisJCX0gZWxzZSB7CisJCQkvKiBhZGQgcmRp
LCBpbW0zMiAqLworCQkJRU1JVDNfb2ZmMzIoMHg0OCwgMHg4MSwgMHhDNywgb2ZmKTsKKwkJfQor
CX0KKworCS8qIEFkanVzdCBpcCB0byBhY2NvdW50IGZvciB0aGUgaW5zdHJ1bWVudGF0aW9uIGdl
bmVyYXRlZCBzbyBmYXIgKi8KKwlpcCArPSAocHJvZyAtICpwcHJvZyk7CisJLyogV2UgZW1pdCBh
IGNhbGwsIHNvIHVwZGF0ZSBjYWxsIGRlcHRoIGNvdW50aW5nICovCisJaXAgKz0geDg2X2NhbGxf
ZGVwdGhfZW1pdF9hY2NvdW50aW5nKCZwcm9nLCBrYXNhbl9mdW5jLCBpcCk7CisJLyogY2FsbCBr
YXNhbl9mdW5jICovCisJaWYgKGVtaXRfY2FsbCgmcHJvZywga2FzYW5fZnVuYywgaXApKQorCQly
ZXR1cm4gLUVSQU5HRTsKKworCUVNSVQyKDB4NDEsIDB4NTkpOworCUVNSVQyKDB4NDEsIDB4NTgp
OworCUVNSVQxKDB4NUYpOworCUVNSVQxKDB4NUUpOworCUVNSVQxKDB4NUEpOworCUVNSVQxKDB4
NTkpOworCUVNSVQxKDB4NTgpOworCisJKnBwcm9nID0gcHJvZzsKKyNlbmRpZiAvKiBDT05GSUdf
QlBGX0pJVF9LQVNBTiAqLworCXJldHVybiAwOworfQorCiBzdGF0aWMgaW50IGVtaXRfYXRvbWlj
X3Jtdyh1OCAqKnBwcm9nLCB1MzIgYXRvbWljX29wLAogCQkJICAgdTMyIGRzdF9yZWcsIHUzMiBz
cmNfcmVnLCBzMTYgb2ZmLCB1OCBicGZfc2l6ZSkKIHsKCi0tIAoyLjU0LjAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcg
bGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
