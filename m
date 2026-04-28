Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4wO7NLoo8WmteAEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Apr 2026 23:38:02 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 59EDC48C599
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Apr 2026 23:38:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 66EEEC87ECB;
	Tue, 28 Apr 2026 21:38:01 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4A84DC555BE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Apr 2026 21:38:00 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 3E99A1A3479;
 Tue, 28 Apr 2026 21:37:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E94DD601D0;
 Tue, 28 Apr 2026 21:37:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 049BC1072939F; 
 Tue, 28 Apr 2026 23:37:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1777412276; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=m2SIkG8G4dme99QjBJF700FHzCmI2Nw1YXi++Sm72C8=;
 b=BKpyABXYUA3W1yBGbOawA4h4lg+xP/ujDg9fnM/GDmfVvQtFe4V86zv2jRnYLbIW85egeu
 gzsW7by84jCsCEyDe38rcP0G9Lu0O5PyhiJVlX1VH0lqEiLpLLVqCPQ6zb2WFjm+11Eb5Y
 n8RhoTuzI6NlP3mUu2V0iIjtY0wmrD64vrUUDjJFf8c9e/GfSIul/+IfTbDMPsSiDwMCw7
 iSMV2XUHFoLSDmaAwdjiKsMThFnyCYBB9t0d5djhof0yNcYWt/373RotXiqc8RA8Tj6M7F
 lFivzfSQqW2W19Ln1HG5awMplQ6C4gwNMrAWCyzv+PL9twiFGEXnUYVU/us/rQ==
Mime-Version: 1.0
Date: Tue, 28 Apr 2026 23:37:43 +0200
Message-Id: <DI5429HR7UGP.IJHX75ZB16AZ@bootlin.com>
From: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
To: "Ihor Solodrai" <ihor.solodrai@linux.dev>,
 =?utf-8?b?QWxleGlzIExvdGhvcsOpIChlQlBGIEZvdW5kYXRpb24p?=
 <alexis.lothore@bootlin.com>, "Alexei Starovoitov" <ast@kernel.org>,
 "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii Nakryiko"
 <andrii@kernel.org>, "Martin KaFai Lau" <martin.lau@linux.dev>, "Eduard
 Zingerman" <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, "Song Liu" <song@kernel.org>, "Yonghong Song"
 <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>, "John Fastabend"
 <john.fastabend@gmail.com>, "David S. Miller" <davem@davemloft.net>, "David
 Ahern" <dsahern@kernel.org>, "Thomas Gleixner" <tglx@kernel.org>, "Ingo
 Molnar" <mingo@redhat.com>, "Borislav Petkov" <bp@alien8.de>, "Dave Hansen"
 <dave.hansen@linux.intel.com>, <x86@kernel.org>, "H. Peter Anvin"
 <hpa@zytor.com>, "Shuah Khan" <shuah@kernel.org>, "Maxime Coquelin"
 <mcoquelin.stm32@gmail.com>, "Alexandre Torgue"
 <alexandre.torgue@foss.st.com>, "Andrey Ryabinin" <ryabinin.a.a@gmail.com>,
 "Alexander Potapenko" <glider@google.com>, "Andrey Konovalov"
 <andreyknvl@gmail.com>, "Dmitry Vyukov" <dvyukov@google.com>, "Vincenzo
 Frascino" <vincenzo.frascino@arm.com>, "Andrew Morton"
 <akpm@linux-foundation.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260413-kasan-v1-0-1a5831230821@bootlin.com>
 <20260413-kasan-v1-2-1a5831230821@bootlin.com>
 <7dd64547-25a4-46de-a896-98fcec04468e@linux.dev>
In-Reply-To: <7dd64547-25a4-46de-a896-98fcec04468e@linux.dev>
X-Last-TLS-Session-Version: TLSv1.3
Cc: linux-kselftest@vger.kernel.org,
 Bastien Curutchet <bastien.curutchet@bootlin.com>, netdev@vger.kernel.org,
 ebpf@linuxfoundation.org, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-mm@kvack.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, bpf@vger.kernel.org,
 Xu Kuohai <xukuohai@huawei.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH RFC bpf-next 2/8] bpf: mark instructions
 accessing program stack
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
X-Rspamd-Queue-Id: 59EDC48C599
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.89 / 15.00];
	DMARC_POLICY_REJECT(2.00)[bootlin.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[bootlin.com:s=dkim];
	MV_CASE(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[41];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[linux.dev,bootlin.com,kernel.org,iogearbox.net,gmail.com,davemloft.net,redhat.com,alien8.de,linux.intel.com,zytor.com,foss.st.com,google.com,arm.com,linux-foundation.org];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS(0.00)[m:ihor.solodrai@linux.dev,m:alexis.lothore@bootlin.com,m:ast@kernel.org,m:daniel@iogearbox.net,m:andrii@kernel.org,m:martin.lau@linux.dev,m:eddyz87@gmail.com,m:memxor@gmail.com,m:song@kernel.org,m:yonghong.song@linux.dev,m:jolsa@kernel.org,m:john.fastabend@gmail.com,m:davem@davemloft.net,m:dsahern@kernel.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:shuah@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:ryabinin.a.a@gmail.com,m:glider@google.com,m:andreyknvl@gmail.com,m:dvyukov@google.com,m:vincenzo.frascino@arm.com,m:akpm@linux-foundation.org,m:linux-kselftest@vger.kernel.org,m:bastien.curutchet@bootlin.com,m:netdev@vger.kernel.org,m:ebpf@linuxfoundation.org,m:linux-kernel@vger.kernel.org,m:kasan-dev@googlegroups.com,m:linux-mm@kvack.org,m:thomas.petazzoni@bootlin.com,m:bpf@vger.kernel.org,m:xukuohai@huawei.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-
 arm-kernel@lists.infradead.org,m:johnfastabend@gmail.com,m:mcoquelinstm32@gmail.com,m:ryabininaa@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[alexis.lothore@bootlin.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	GREYLIST(0.00)[pass,meta];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	NEURAL_SPAM(0.00)[0.994];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexis.lothore@bootlin.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[bootlin.com:-];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:url,bootlin.com:mid,bootlin.com:email]

T24gU2F0IEFwciAyNSwgMjAyNiBhdCAxOjE4IEFNIENFU1QsIElob3IgU29sb2RyYWkgd3JvdGU6
Cj4gT24gNC8xMy8yNiAxMToyOCBBTSwgQWxleGlzIExvdGhvcsODwqkgKGVCUEYgRm91bmRhdGlv
bikgd3JvdGU6Cj4+IEluIG9yZGVyIHRvIHByZXBhcmUgdG8gZW1pdCBLQVNBTiBjaGVja3MgaW4g
SklUZWQgcHJvZ3JhbXMsIEpJVAo+PiBjb21waWxlcnMgbmVlZCB0byBiZSBhd2FyZSBhYm91dCB3
aGV0aGVyIHNvbWUgbG9hZC9zdG9yZSBpbnN0cnVjdGlvbnMKPj4gYXJlIHRhcmdldGluZyB0aGUg
YnBmIHByb2dyYW0gc3RhY2ssIGFzIHRob3NlIHNob3VsZCBub3QgYmUgbW9uaXRvcmVkCj4+ICh3
ZSBhbHJlYWR5IGhhdmUgZ3VhcmQgcGFnZXMgZm9yIHRoYXQsIGFuZCBpdCBpcyBkaWZmaWN1bHQg
YW55d2F5IHRvCj4+IGNvcnJlY3RseSBtb25pdG9yIGFueSBraW5kIG9mIGRhdGEgcGFzc2VkIG9u
IHN0YWNrKS4KPj4gCj4+IFRvIHN1cHBvcnQgdGhpcyBuZWVkLCBtYWtlIHRoZSBCUEYgdmVyaWZp
ZXIgbWFyayB0aGUgaW5zdHJ1Y3Rpb25zIHRoYXQKPj4gYWNjZXNzIHByb2dyYW0gc3RhY2s6Cj4+
IC0gYWRkIGEgc2V0dGVyIHRoYXQgYWxsb3dzIHRoZSB2ZXJpZmllciB0byBtYXJrIGluc3RydWN0
aW9ucyBhY2Nlc3NpbmcKPj4gICB0aGUgcHJvZ3JhbSBzdGFjawo+PiAtIGFkZCBhIGdldHRlciB0
aGF0IGFsbG93cyBKSVQgY29tcGlsZXJzIHRvIGNoZWNrIHdoZXRoZXIgaW5zdHJ1Y3Rpb25zCj4+
ICAgYmVpbmcgSklUZWQgYXJlIGFjY2Vzc2luZyB0aGUgc3RhY2sKPj4gCj4+IFNpZ25lZC1vZmYt
Ynk6IEFsZXhpcyBMb3Rob3LDqSAoZUJQRiBGb3VuZGF0aW9uKSA8YWxleGlzLmxvdGhvcmVAYm9v
dGxpbi5jb20+Cj4+IC0tLQo+PiAgaW5jbHVkZS9saW51eC9icGYuaCAgICAgICAgICB8ICAyICsr
Cj4+ICBpbmNsdWRlL2xpbnV4L2JwZl92ZXJpZmllci5oIHwgIDIgKysKPj4gIGtlcm5lbC9icGYv
Y29yZS5jICAgICAgICAgICAgfCAxMCArKysrKysrKysrCj4+ICBrZXJuZWwvYnBmL3ZlcmlmaWVy
LmMgICAgICAgIHwgIDcgKysrKysrKwo+PiAgNCBmaWxlcyBjaGFuZ2VkLCAyMSBpbnNlcnRpb25z
KCspCj4+IAo+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9icGYuaCBiL2luY2x1ZGUvbGlu
dXgvYnBmLmgKPj4gaW5kZXggYjRiNzAzYzkwY2E5Li43NzRhMDM5NWM0OTggMTAwNjQ0Cj4+IC0t
LSBhL2luY2x1ZGUvbGludXgvYnBmLmgKPj4gKysrIGIvaW5jbHVkZS9saW51eC9icGYuaAo+PiBA
QCAtMTU0Myw2ICsxNTQzLDggQEAgdm9pZCBicGZfaml0X3VuY2hhcmdlX21vZG1lbSh1MzIgc2l6
ZSk7Cj4+ICBib29sIGJwZl9wcm9nX2hhc190cmFtcG9saW5lKGNvbnN0IHN0cnVjdCBicGZfcHJv
ZyAqcHJvZyk7Cj4+ICBib29sIGJwZl9pbnNuX2lzX2luZGlyZWN0X3RhcmdldChjb25zdCBzdHJ1
Y3QgYnBmX3ZlcmlmaWVyX2VudiAqZW52LCBjb25zdCBzdHJ1Y3QgYnBmX3Byb2cgKnByb2csCj4+
ICAJCQkJIGludCBpbnNuX2lkeCk7Cj4+ICtib29sIGJwZl9pbnNuX2FjY2Vzc2VzX3N0YWNrKGNv
bnN0IHN0cnVjdCBicGZfdmVyaWZpZXJfZW52ICplbnYsCj4+ICsJCQkgICAgIGNvbnN0IHN0cnVj
dCBicGZfcHJvZyAqcHJvZywgaW50IGluc25faWR4KTsKPj4gICNlbHNlCj4+ICBzdGF0aWMgaW5s
aW5lIGludCBicGZfdHJhbXBvbGluZV9saW5rX3Byb2coc3RydWN0IGJwZl90cmFtcF9saW5rICps
aW5rLAo+PiAgCQkJCQkgICBzdHJ1Y3QgYnBmX3RyYW1wb2xpbmUgKnRyLAo+PiBkaWZmIC0tZ2l0
IGEvaW5jbHVkZS9saW51eC9icGZfdmVyaWZpZXIuaCBiL2luY2x1ZGUvbGludXgvYnBmX3Zlcmlm
aWVyLmgKPj4gaW5kZXggYjE0OGY4MTZmMjViLi5hYjk5ZWQ0YzQyMjcgMTAwNjQ0Cj4+IC0tLSBh
L2luY2x1ZGUvbGludXgvYnBmX3ZlcmlmaWVyLmgKPj4gKysrIGIvaW5jbHVkZS9saW51eC9icGZf
dmVyaWZpZXIuaAo+PiBAQCAtNjYwLDYgKzY2MCw4IEBAIHN0cnVjdCBicGZfaW5zbl9hdXhfZGF0
YSB7Cj4+ICAJdTE2IGNvbnN0X3JlZ19tYXBfbWFzazsKPj4gIAl1MTYgY29uc3RfcmVnX3N1YnBy
b2dfbWFzazsKPj4gIAl1MzIgY29uc3RfcmVnX3ZhbHNbMTBdOwo+PiArCS8qIGluc3RydWN0aW9u
IGFjY2Vzc2VzIHN0YWNrICovCj4+ICsJYm9vbCBhY2Nlc3Nlc19zdGFjazsKPj4gIH07Cj4+ICAK
Pj4gICNkZWZpbmUgTUFYX1VTRURfTUFQUyA2NCAvKiBtYXggbnVtYmVyIG9mIG1hcHMgYWNjZXNz
ZWQgYnkgb25lIGVCUEYgcHJvZ3JhbSAqLwo+PiBkaWZmIC0tZ2l0IGEva2VybmVsL2JwZi9jb3Jl
LmMgYi9rZXJuZWwvYnBmL2NvcmUuYwo+PiBpbmRleCA4YjAxOGZmNDg4NzUuLjM0MGFiZmRhZGJl
ZCAxMDA2NDQKPj4gLS0tIGEva2VybmVsL2JwZi9jb3JlLmMKPj4gKysrIGIva2VybmVsL2JwZi9j
b3JlLmMKPj4gQEAgLTE1ODIsNiArMTU4MiwxNiBAQCBib29sIGJwZl9pbnNuX2lzX2luZGlyZWN0
X3RhcmdldChjb25zdCBzdHJ1Y3QgYnBmX3ZlcmlmaWVyX2VudiAqZW52LCBjb25zdCBzdHJ1Ywo+
PiAgCWluc25faWR4ICs9IHByb2ctPmF1eC0+c3VicHJvZ19zdGFydDsKPj4gIAlyZXR1cm4gZW52
LT5pbnNuX2F1eF9kYXRhW2luc25faWR4XS5pbmRpcmVjdF90YXJnZXQ7Cj4+ICB9Cj4+ICsKPj4g
K2Jvb2wgYnBmX2luc25fYWNjZXNzZXNfc3RhY2soY29uc3Qgc3RydWN0IGJwZl92ZXJpZmllcl9l
bnYgKmVudiwKPj4gKwkJCSAgICAgY29uc3Qgc3RydWN0IGJwZl9wcm9nICpwcm9nLCBpbnQgaW5z
bl9pZHgpCj4+ICt7Cj4+ICsJaWYgKCFlbnYpCj4+ICsJCXJldHVybiBmYWxzZTsKPj4gKwlpbnNu
X2lkeCArPSBwcm9nLT5hdXgtPnN1YnByb2dfc3RhcnQ7Cj4+ICsJcmV0dXJuIGVudi0+aW5zbl9h
dXhfZGF0YVtpbnNuX2lkeF0uYWNjZXNzZXNfc3RhY2s7Cj4+ICt9Cj4+ICsKPj4gICNlbmRpZiAv
KiBDT05GSUdfQlBGX0pJVCAqLwo+PiAgCj4+ICAvKiBCYXNlIGZ1bmN0aW9uIGZvciBvZmZzZXQg
Y2FsY3VsYXRpb24uIE5lZWRzIHRvIGdvIGludG8gLnRleHQgc2VjdGlvbiwKPj4gZGlmZiAtLWdp
dCBhL2tlcm5lbC9icGYvdmVyaWZpZXIuYyBiL2tlcm5lbC9icGYvdmVyaWZpZXIuYwo+PiBpbmRl
eCAxZTM2YjllOTEyNzcuLjdiY2U0ZmI0ZTU0MCAxMDA2NDQKPj4gLS0tIGEva2VybmVsL2JwZi92
ZXJpZmllci5jCj4+ICsrKyBiL2tlcm5lbC9icGYvdmVyaWZpZXIuYwo+PiBAQCAtMzUwMiw2ICsz
NTAyLDExIEBAIHN0YXRpYyB2b2lkIG1hcmtfaW5kaXJlY3RfdGFyZ2V0KHN0cnVjdCBicGZfdmVy
aWZpZXJfZW52ICplbnYsIGludCBpZHgpCj4+ICAJZW52LT5pbnNuX2F1eF9kYXRhW2lkeF0uaW5k
aXJlY3RfdGFyZ2V0ID0gdHJ1ZTsKPj4gIH0KPj4gIAo+PiArc3RhdGljIHZvaWQgbWFya19pbnNu
X2FjY2Vzc2VzX3N0YWNrKHN0cnVjdCBicGZfdmVyaWZpZXJfZW52ICplbnYsIGludCBpZHgpCj4+
ICt7Cj4+ICsJZW52LT5pbnNuX2F1eF9kYXRhW2lkeF0uYWNjZXNzZXNfc3RhY2sgPSB0cnVlOwo+
PiArfQo+PiArCj4+ICAjZGVmaW5lIExSX0ZSQU1FTk9fQklUUwkzCj4+ICAjZGVmaW5lIExSX1NQ
SV9CSVRTCTYKPj4gICNkZWZpbmUgTFJfRU5UUllfQklUUwkoTFJfU1BJX0JJVFMgKyBMUl9GUkFN
RU5PX0JJVFMgKyAxKQo+PiBAQCAtNjQ5MCw2ICs2NDk1LDggQEAgc3RhdGljIGludCBjaGVja19t
ZW1fYWNjZXNzKHN0cnVjdCBicGZfdmVyaWZpZXJfZW52ICplbnYsIGludCBpbnNuX2lkeCwgdTMy
IHJlZ24KPj4gIAkJZWxzZQo+PiAgCQkJZXJyID0gY2hlY2tfc3RhY2tfd3JpdGUoZW52LCByZWdu
bywgb2ZmLCBzaXplLAo+PiAgCQkJCQkJdmFsdWVfcmVnbm8sIGluc25faWR4KTsKPj4gKwo+PiAr
CQltYXJrX2luc25fYWNjZXNzZXNfc3RhY2soZW52LCBpbnNuX2lkeCk7Cj4KPiBJIGFtIG5vdCBz
dXJlIHRoaXMgY2FuIGJlIGRvbmUgdW5jb25kaXRpb25hbGx5IGhlcmUuCj4KPiBJdCBtYXkgYmUg
cG9zc2libGUgaW4gZGlmZmVyZW50IHN0YXRlcyB0byBoYXZlIGRpZmZlcmVudCBwb2ludGVyCj4g
dHlwZXMgZm9yIHRoZSBhZmZlY3RlZCByZWcgKFBUUl9UT19TVEFDSyBpbiBvbmUgZXhlY3V0aW9u
IHBhdGggYW5kIHNheQo+IFBUUl9UT19NQVBfVkFMVUUgaW4gYW5vdGhlcikuIEFuZCBpZiBzZXQg
dW5jb2RpdGlvbmFsbHksCj4gaW5zdHJ1bWVudGF0aW9uIG1heSBiZSBza2lwcGVkIGZvciBsZWdp
dGltYXRlIHRhcmdldHMuCj4KPiBNYXliZSByZXNldCBieSBkZWZhdWx0IGluIGNoZWNrX21lbV9h
Y2Nlc3MoKT8KCkhtbSwgb2ssIHRoYW5rcywgSSBtaXNzZWQgdGhpcyBzdWJ0bGV0eS4gSSBzdGls
bCBuZWVkIHRvIGRpZyBpbiB0aGVyZSB0bwptYWtlIHN1cmUgdG8gcmVhbGx5IHVuZGVyc3RhbmQg
aG93IHRoZSB2ZXJpZmllciBoYW5kbGVzIHRob3NlIHN0YXRlcywKYnV0IGlmIEkgdW5kZXJzdGFu
ZCBjb3JyZWN0bHkgeW91ciBwb2ludCwgSSBndWVzcyB0aGF0IGp1c3QgcmVzZXR0aW5nCnRoZSAi
YWNjZXNzZXMgc3RhY2siIGZsYWcgYXQgdGhlIGVudHJ5IG9mIGNoZWNrX21lbV9hY2Nlc3MgaXMg
bm90CmVub3VnaDogaXQgd291bGQgbWFrZSB0aGUgZmluYWwgcmVzdWx0IGRlcGVuZCBvbiB0aGUg
b3JkZXIgb2YgdGhlIHN0YXRlcwpiZWluZyBjaGVja2VkLCBlZzoKLSBmaXJzdCBzdGF0ZSBiZWlu
ZyBjaGVja2VkIHJlc3VsdCBpbiBQVFJfVE9fTUFQX1ZBTFVFLCBubyBmbGFnIHNldAotIHNlY29u
ZCAoYW5kIGZpbmFsKSBzdGF0ZSBiZWluZyBjaGVja2VkIHJlc3VsdCBpbiBQVFJfVE9fU1RBQ0ss
IGZsYWcgaXMKICBub3cgc2V0Ci0gaWYgbm8gb3RoZXIgc3RhdGU6IGluc24gZW5kcyB1cCBiZWlu
ZyAod3JvbmdseSkgbWFya2VkIHRvIGJlIGlnbm9yZWQgCgpTbyB1bmxlc3MgSSBhbSBtaXN1bmRl
cnN0YW5kaW5nIHRoaW5ncyBoZXJlLCB0aGUgcXVlc3Rpb24gcmF0aGVyIGJlY29tZXMKImZvciB0
aGlzIHNwZWNpZmljIGluc24sIGlzIHRoZXJlIGFueSBzdGF0ZSBpbiB3aGljaCB0aGUgYWNjZXNz
ZWQgbWVtb3J5CmlzIGFueXRoaW5nIGVsc2Ugb3RoZXIgdGhhbiBQVFJfVE9fU1RBQ0siLiBUaGUg
ZmxhZyBjb3VsZCBqdXN0IGJlCmludmVydGVkIChpZSBzZXQgdG8gdHJ1ZSBieSBkZWZhdWx0KSwg
YW5kIHJlc2V0IGJ5IGFueSBzdGF0ZSByZXN1bHRpbmcKaW4gc29tZXRoaW5nIG90aGVyIHRoYW4g
UFRSX1RPX1NUQUNLLgoKQWxleGlzCi0tIApBbGV4aXMgTG90aG9yw6ksIEJvb3RsaW4KRW1iZWRk
ZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29tCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBt
YWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRw
czovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1z
dG0zMgo=
