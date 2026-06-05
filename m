Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id H4EcLZL+J2pe6wIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 09 Jun 2026 13:52:50 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E40D65FAC5
	for <lists+linux-stm32@lfdr.de>; Tue, 09 Jun 2026 13:52:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=linux.dev header.s=key1 header.b="BxFUAK/A";
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=linux.dev (policy=none)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D2F3BC8F282;
	Tue,  9 Jun 2026 11:52:49 +0000 (UTC)
Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com
 [91.218.175.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EDE78C01FB6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Jun 2026 14:54:25 +0000 (UTC)
Message-ID: <78009c06-4233-4e0a-88ec-33eba10ad8b3@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1780671264;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7T10tbTpcV2pUBQyWyrHxm7GXYtp6nDFJhaWs/Lxnh8=;
 b=BxFUAK/AN0wgD8eGGuFvdxWnrnCkHUxSLZUNCUu//z2V+cA/zvbouPYpYAlPSkzosrFZU4
 J/W40RsQpiE5xjC0yjYu9DCCYN3v6ILmOEpt/EJFIv4gFx4ius1bqklwFG5NlxcYMFStI9
 OVRzcmh7CdTWQmTPodFF0Il4jS6egCY=
Date: Fri, 5 Jun 2026 07:54:10 -0700
MIME-Version: 1.0
Content-Language: en-GB
To: =?UTF-8?Q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29?=
 <alexis.lothore@bootlin.com>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman
 <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 Song Liu <song@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Thomas Gleixner
 <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Shuah Khan <shuah@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Ihor Solodrai <ihor.solodrai@linux.dev>
References: <20260604-kasan-v2-0-c066e627fda8@bootlin.com>
 <20260604-kasan-v2-5-c066e627fda8@bootlin.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Yonghong Song <yonghong.song@linux.dev>
In-Reply-To: <20260604-kasan-v2-5-c066e627fda8@bootlin.com>
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Tue, 09 Jun 2026 11:52:48 +0000
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, ebpf@linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 bpf@vger.kernel.org, Bastien Curutchet <bastien.curutchet@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH bpf-next v2 5/8] bpf,
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [4.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DATE_IN_PAST(1.00)[92];
	R_DKIM_REJECT(1.00)[linux.dev:s=key1];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[linux.dev : SPF not aligned (relaxed),none];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alexis.lothore@bootlin.com,m:ast@kernel.org,m:daniel@iogearbox.net,m:andrii@kernel.org,m:martin.lau@linux.dev,m:eddyz87@gmail.com,m:memxor@gmail.com,m:song@kernel.org,m:jolsa@kernel.org,m:john.fastabend@gmail.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:shuah@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:ihor.solodrai@linux.dev,m:thomas.petazzoni@bootlin.com,m:ebpf@linuxfoundation.org,m:linux-kernel@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:bpf@vger.kernel.org,m:bastien.curutchet@bootlin.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:johnfastabend@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[bootlin.com,kernel.org,iogearbox.net,linux.dev,gmail.com,redhat.com,alien8.de,linux.intel.com,zytor.com,foss.st.com];
	FORGED_SENDER(0.00)[yonghong.song@linux.dev,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[28];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yonghong.song@linux.dev,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[linux.dev:-];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,linux.dev:mid,linux.dev:from_mime,st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2E40D65FAC5

CgpPbiA2LzQvMjYgMToyMiBQTSwgQWxleGlzIExvdGhvcsOpIChlQlBGIEZvdW5kYXRpb24pIHdy
b3RlOgo+IEluc2VydCBLQVNBTiBzaGFkb3cgbWVtb3J5IGNoZWNrcyBiZWZvcmUgbWVtb3J5IGxv
YWQgYW5kIHN0b3JlCj4gb3BlcmF0aW9ucyBpbiBKSVQtY29tcGlsZWQgQlBGIHByb2dyYW1zLiBU
aGlzIGhlbHBzIGRldGVjdCBtZW1vcnkgc2FmZXR5Cj4gYnVncyBzdWNoIGFzIHVzZS1hZnRlci1m
cmVlIGFuZCBvdXQtb2YtYm91bmRzIGFjY2Vzc2VzIGF0IHJ1bnRpbWUuCj4KPiBUaGUgbWFpbiBp
bnN0cnVjdGlvbnMgYmVpbmcgdGFyZ2V0ZWQgYXJlIEJQRl9TVCwgQlBGX1NUWCBhbmQgQlBGX0xE
WCwKPiBidXQgbm90IGFsbCBvZiB0aGVtIGFyZSBiZWluZyBpbnN0cnVtZW50ZWQ6Cj4gLSBpZiB0
aGUgbG9hZC9zdG9yZSBpbnN0cnVjdGlvbiBpcyBpbiBmYWN0IGFjY2Vzc2luZyB0aGUgcHJvZ3Jh
bSBzdGFjaywKPiAgICBlbWl0X2thc2FuX2NoZWNrIHNpbGVudGx5IHNraXBzIHRoZSBpbnN0cnVt
ZW50YXRpb24sIGFzIHdlIGFscmVhZHkKPiAgICBoYXZlIHBhZ2UgZ3VhcmRzIHRvIG1vbml0b3Ig
c3RhY2sgYWNjZXNzZXMuCj4gLSBpZiB0aGUgbG9hZC9zdG9yZSBpbnN0cnVjdGlvbiBpcyBhIEJQ
Rl9QUk9CRV9NRU0gb3IgYSBCUEZfUFJPQkVfQVRPTUlDCj4gICAgaW5zdHJ1Y3Rpb24sIHdlIGRv
IG5vdCBpbnN0cnVtZW50IGl0LCBhcyB0aGUgcGFzc2VkIGFkZHJlc3MgY2FuIGZhdWx0Cj4gICAg
KGhlbmNlIHRoZSBjdXN0b20gZmF1bHQgbWFuYWdlbWVudCB3aXRoIEJQRl9QUk9CRV9YWFggaW5z
dHJ1Y3Rpb25zKSwKPiAgICBhbmQgc28gdGhlIGNvcnJlc3BvbmRpbmcga2FzYW4gY2hlY2sgY291
bGQgZmF1bHQgYXMgd2VsbC4KPgo+IFNpZ25lZC1vZmYtYnk6IEFsZXhpcyBMb3Rob3LDqSAoZUJQ
RiBGb3VuZGF0aW9uKSA8YWxleGlzLmxvdGhvcmVAYm9vdGxpbi5jb20+Cj4gLS0tCj4gQ2hhbmdl
cyBpbiB2MjoKPiAtIHN1cHBvcnQgQlBGX0FUT01JQ1MKPiAtIHN1cHBvcnQgQlBGX1NUCj4gLSBt
YWtlIHN1cmUgdG8gc3lzdGVtYXRpY2FsbHkgcGFzcyBjb3JyZWN0IGluc3RydWN0aW9uIHRvIGth
c2FuIGNoZWNrCj4gLS0tCj4gICBhcmNoL3g4Ni9uZXQvYnBmX2ppdF9jb21wLmMgfCA2MyArKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0KPiAgIDEgZmlsZSBjaGFu
Z2VkLCA1MyBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9h
cmNoL3g4Ni9uZXQvYnBmX2ppdF9jb21wLmMgYi9hcmNoL3g4Ni9uZXQvYnBmX2ppdF9jb21wLmMK
PiBpbmRleCA5NDNhMGYzMTVjZjIuLmNiM2MwM2VkYzRiZCAxMDA2NDQKPiAtLS0gYS9hcmNoL3g4
Ni9uZXQvYnBmX2ppdF9jb21wLmMKPiArKysgYi9hcmNoL3g4Ni9uZXQvYnBmX2ppdF9jb21wLmMK
PiBAQCAtMTUxNiwxNyArMTUxNiwzMCBAQCBzdGF0aWMgaW50IGVtaXRfYXRvbWljX3Jtd19pbmRl
eCh1OCAqKnBwcm9nLCB1MzIgYXRvbWljX29wLCB1MzIgc2l6ZSwKPiAgIAlyZXR1cm4gMDsKPiAg
IH0KPiAgIAo+IC1zdGF0aWMgaW50IGVtaXRfYXRvbWljX2xkX3N0KHU4ICoqcHByb2csIHUzMiBh
dG9taWNfb3AsIHUzMiBkc3RfcmVnLAo+IC0JCQkgICAgIHUzMiBzcmNfcmVnLCBzMTYgb2ZmLCB1
OCBicGZfc2l6ZSkKPiArc3RhdGljIGludCBlbWl0X2F0b21pY19sZF9zdCh1OCAqKnBwcm9nLCBz
dHJ1Y3QgYnBmX2luc24gKmluc24sIHU4ICppcCwKPiArCQkJICAgICB1MzIgZHN0X3JlZywgdTMy
IHNyY19yZWcsIGJvb2wgYWNjZXNzZXNfc3RhY2tfb25seSkKPiAgIHsKPiArCXUzMiBhdG9taWNf
b3AgPSBpbnNuLT5pbW07Cj4gKwlpbnQgZXJyOwo+ICsKPiAgIAlzd2l0Y2ggKGF0b21pY19vcCkg
ewo+ICAgCWNhc2UgQlBGX0xPQURfQUNROgo+ICsJCWVyciA9IGVtaXRfa2FzYW5fY2hlY2socHBy
b2csIHNyY19yZWcsIGluc24sIGlwLCBmYWxzZSwKPiArCQkJCSAgICAgICBhY2Nlc3Nlc19zdGFj
a19vbmx5KTsKPiArCQlpZiAoZXJyKQo+ICsJCQlyZXR1cm4gZXJyOwo+ICAgCQkvKiBkc3RfcmVn
ID0gc21wX2xvYWRfYWNxdWlyZShzcmNfcmVnICsgb2ZmMTYpICovCj4gLQkJZW1pdF9sZHgocHBy
b2csIGJwZl9zaXplLCBkc3RfcmVnLCBzcmNfcmVnLCBvZmYpOwo+ICsJCWVtaXRfbGR4KHBwcm9n
LCBCUEZfU0laRShpbnNuLT5jb2RlKSwgZHN0X3JlZywgc3JjX3JlZywKPiArCQkJIGluc24tPm9m
Zik7Cj4gICAJCWJyZWFrOwo+ICAgCWNhc2UgQlBGX1NUT1JFX1JFTDoKPiArCQllcnIgPSBlbWl0
X2thc2FuX2NoZWNrKHBwcm9nLCBkc3RfcmVnLCBpbnNuLCBpcCwgdHJ1ZSwKPiArCQkJCSAgICAg
ICBhY2Nlc3Nlc19zdGFja19vbmx5KTsKPiArCQlpZiAoZXJyKQo+ICsJCQlyZXR1cm4gZXJyOwo+
ICAgCQkvKiBzbXBfc3RvcmVfcmVsZWFzZShkc3RfcmVnICsgb2ZmMTYsIHNyY19yZWcpICovCj4g
LQkJZW1pdF9zdHgocHByb2csIGJwZl9zaXplLCBkc3RfcmVnLCBzcmNfcmVnLCBvZmYpOwo+ICsJ
CWVtaXRfc3R4KHBwcm9nLCBCUEZfU0laRShpbnNuLT5jb2RlKSwgZHN0X3JlZywgc3JjX3JlZywK
PiArCQkJIGluc24tPm9mZik7Cj4gICAJCWJyZWFrOwo+ICAgCWRlZmF1bHQ6Cj4gICAJCXByX2Vy
cigiYnBmX2ppdDogdW5rbm93biBhdG9taWMgbG9hZC9zdG9yZSBvcGNvZGUgJTAyeFxuIiwKPiBA
QCAtMTkwNCw2ICsxOTE3LDcgQEAgc3RhdGljIGludCBkb19qaXQoc3RydWN0IGJwZl92ZXJpZmll
cl9lbnYgKmVudiwgc3RydWN0IGJwZl9wcm9nICpicGZfcHJvZywgaW50ICoKPiAgIAkJY29uc3Qg
czMyIGltbTMyID0gaW5zbi0+aW1tOwo+ICAgCQl1MzIgZHN0X3JlZyA9IGluc24tPmRzdF9yZWc7
Cj4gICAJCXUzMiBzcmNfcmVnID0gaW5zbi0+c3JjX3JlZzsKPiArCQlib29sIGFjY2Vzc2VzX3N0
YWNrX29ubHk7Cj4gICAJCXU4IGIyID0gMCwgYjMgPSAwOwo+ICAgCQl1OCAqc3RhcnRfb2ZfbGR4
Owo+ICAgCQlzNjQgam1wX29mZnNldDsKPiBAQCAtMTkyNCw2ICsxOTM4LDggQEAgc3RhdGljIGlu
dCBkb19qaXQoc3RydWN0IGJwZl92ZXJpZmllcl9lbnYgKmVudiwgc3RydWN0IGJwZl9wcm9nICpi
cGZfcHJvZywgaW50ICoKPiAgIAkJCUVNSVRfRU5EQlIoKTsKPiAgIAo+ICAgCQlpcCA9IGltYWdl
ICsgYWRkcnNbaSAtIDFdICsgKHByb2cgLSB0ZW1wKTsKPiArCQlhY2Nlc3Nlc19zdGFja19vbmx5
ID0KPiArCQkJYnBmX2luc25fYWNjZXNzZXNfc3RhY2tfb25seShlbnYsIGJwZl9wcm9nLCBpIC0g
MSk7Cj4gICAKPiAgIAkJc3dpdGNoIChpbnNuLT5jb2RlKSB7Cj4gICAJCQkvKiBBTFUgKi8KPiBA
QCAtMjMwNCw2ICsyMzIwLDEwIEBAIHN0YXRpYyBpbnQgZG9faml0KHN0cnVjdCBicGZfdmVyaWZp
ZXJfZW52ICplbnYsIHN0cnVjdCBicGZfcHJvZyAqYnBmX3Byb2csIGludCAqCj4gICAJCWNhc2Ug
QlBGX1NUIHwgQlBGX01FTSB8IEJQRl9IOgo+ICAgCQljYXNlIEJQRl9TVCB8IEJQRl9NRU0gfCBC
UEZfVzoKPiAgIAkJY2FzZSBCUEZfU1QgfCBCUEZfTUVNIHwgQlBGX0RXOgo+ICsJCQllcnIgPSBl
bWl0X2thc2FuX2NoZWNrKCZwcm9nLCBkc3RfcmVnLCBpbnNuLCBpcCwgdHJ1ZSwKPiArCQkJCQkg
ICAgICAgYWNjZXNzZXNfc3RhY2tfb25seSk7Cj4gKwkJCWlmIChlcnIpCj4gKwkJCQlyZXR1cm4g
ZXJyOwo+ICAgCQkJc3dpdGNoIChCUEZfU0laRShpbnNuLT5jb2RlKSkgewo+ICAgCQkJY2FzZSBC
UEZfQjoKPiAgIAkJCQlpZiAoaXNfZXJlZyhkc3RfcmVnKSkKPiBAQCAtMjM2OSw2ICsyMzg5LDEw
IEBAIHN0YXRpYyBpbnQgZG9faml0KHN0cnVjdCBicGZfdmVyaWZpZXJfZW52ICplbnYsIHN0cnVj
dCBicGZfcHJvZyAqYnBmX3Byb2csIGludCAqCj4gICAJCQkJaW5zbl9vZmYgPSBvdXRnb2luZ19h
cmdfYmFzZSAtIG91dGdvaW5nX3JzcCAtIGluc25fb2ZmIC0gMTY7Cj4gICAJCQkJZHN0X3JlZyA9
IEJQRl9SRUdfRlA7Cj4gICAJCQl9Cj4gKwkJCWVyciA9IGVtaXRfa2FzYW5fY2hlY2soJnByb2cs
IGRzdF9yZWcsIGluc24sIGlwLCB0cnVlLAo+ICsJCQkJCSAgICAgICBhY2Nlc3Nlc19zdGFja19v
bmx5KTsKPiArCQkJaWYgKGVycikKPiArCQkJCXJldHVybiBlcnI7Cj4gICAJCQllbWl0X3N0eCgm
cHJvZywgQlBGX1NJWkUoaW5zbi0+Y29kZSksIGRzdF9yZWcsIHNyY19yZWcsIGluc25fb2ZmKTsK
PiAgIAkJCWJyZWFrOwo+ICAgCj4gQEAgLTI1MzAsNiArMjU1NCwxMiBAQCBzdGF0aWMgaW50IGRv
X2ppdChzdHJ1Y3QgYnBmX3ZlcmlmaWVyX2VudiAqZW52LCBzdHJ1Y3QgYnBmX3Byb2cgKmJwZl9w
cm9nLCBpbnQgKgo+ICAgCQkJCS8qIHBvcHVsYXRlIGptcF9vZmZzZXQgZm9yIEpBRSBhYm92ZSB0
byBqdW1wIHRvIHN0YXJ0X29mX2xkeCAqLwo+ICAgCQkJCXN0YXJ0X29mX2xkeCA9IHByb2c7Cj4g
ICAJCQkJZW5kX29mX2ptcFstMV0gPSBzdGFydF9vZl9sZHggLSBlbmRfb2Zfam1wOwo+ICsJCQl9
IGVsc2Ugewo+ICsJCQkJZXJyID0gZW1pdF9rYXNhbl9jaGVjaygmcHJvZywgc3JjX3JlZywgaW5z
biwgaXAsCj4gKwkJCQkJCSAgICAgICBmYWxzZSwKPiArCQkJCQkJICAgICAgIGFjY2Vzc2VzX3N0
YWNrX29ubHkpOwo+ICsJCQkJaWYgKGVycikKPiArCQkJCQlyZXR1cm4gZXJyOwo+ICAgCQkJfQo+
ICAgCQkJaWYgKEJQRl9NT0RFKGluc24tPmNvZGUpID09IEJQRl9QUk9CRV9NRU1TWCB8fAo+ICAg
CQkJICAgIEJQRl9NT0RFKGluc24tPmNvZGUpID09IEJQRl9NRU1TWCkKPiBAQCAtMjU5MiwxMyAr
MjYyMiwxMyBAQCBzdGF0aWMgaW50IGRvX2ppdChzdHJ1Y3QgYnBmX3ZlcmlmaWVyX2VudiAqZW52
LCBzdHJ1Y3QgYnBmX3Byb2cgKmJwZl9wcm9nLCBpbnQgKgo+ICAgCQkJZmFsbHRocm91Z2g7Cj4g
ICAJCWNhc2UgQlBGX1NUWCB8IEJQRl9BVE9NSUMgfCBCUEZfVzoKPiAgIAkJY2FzZSBCUEZfU1RY
IHwgQlBGX0FUT01JQyB8IEJQRl9EVzoKPiArCQkJYm9vbCBpczY0ID0gQlBGX1NJWkUoaW5zbi0+
Y29kZSkgPT0gQlBGX0RXOwo+ICsJCQl1MzIgcmVhbF9zcmNfcmVnID0gc3JjX3JlZzsKPiArCQkJ
dTMyIHJlYWxfZHN0X3JlZyA9IGRzdF9yZWc7CgpXaXRoIGxsdm0yMywgSSBnb3QgdGhlIGZvbGxv
d2luZyBidWlsZCBmYWlsdXJlOgoKICAgICAvaG9tZS95aHMvd29yay9icGYtbmV4dC9hcmNoL3g4
Ni9uZXQvYnBmX2ppdF9jb21wLmM6MjYyNTo0OiBlcnJvcjoKICAgICAgICAgICAgIGxhYmVsIGZv
bGxvd2VkIGJ5IGEgZGVjbGFyYXRpb24gaXMgYSBDMjMgZXh0ZW5zaW9uIFstV2Vycm9yLC1XYzIz
LWV4dGVuc2lvbnNdCiAgICAgIDI2MjUgfCAgICAgICAgICAgICAgICAgICAgICAgICBib29sIGlz
NjQgPSBCUEZfU0laRShpbnNuLT5jb2RlKSA9PSBCUEZfRFc7CiAgICAgICAgICAgfCAgICAgICAg
ICAgICAgICAgICAgICAgICBeCiAgICAgMSBlcnJvciBnZW5lcmF0ZWQuCgpUaGUgYmVsb3cgaXMg
YSBmaXg6CgpkaWZmIC0tZ2l0IGEvYXJjaC94ODYvbmV0L2JwZl9qaXRfY29tcC5jIGIvYXJjaC94
ODYvbmV0L2JwZl9qaXRfY29tcC5jCmluZGV4IGNiM2MwM2VkYzRiZC4uNjFmYWY4ZDhmMTU3IDEw
MDY0NAotLS0gYS9hcmNoL3g4Ni9uZXQvYnBmX2ppdF9jb21wLmMKKysrIGIvYXJjaC94ODYvbmV0
L2JwZl9qaXRfY29tcC5jCkBAIC0yNjIxLDcgKzI2MjEsNyBAQCBzdGF0aWMgaW50IGRvX2ppdChz
dHJ1Y3QgYnBmX3ZlcmlmaWVyX2VudiAqZW52LCBzdHJ1Y3QgYnBmX3Byb2cgKmJwZl9wcm9nLCBp
bnQgKgogICAgICAgICAgICAgICAgICAgICAgICAgfQogICAgICAgICAgICAgICAgICAgICAgICAg
ZmFsbHRocm91Z2g7CiAgICAgICAgICAgICAgICAgY2FzZSBCUEZfU1RYIHwgQlBGX0FUT01JQyB8
IEJQRl9XOgotICAgICAgICAgICAgICAgY2FzZSBCUEZfU1RYIHwgQlBGX0FUT01JQyB8IEJQRl9E
VzoKKyAgICAgICAgICAgICAgIGNhc2UgQlBGX1NUWCB8IEJQRl9BVE9NSUMgfCBCUEZfRFc6IHsK
ICAgICAgICAgICAgICAgICAgICAgICAgIGJvb2wgaXM2NCA9IEJQRl9TSVpFKGluc24tPmNvZGUp
ID09IEJQRl9EVzsKICAgICAgICAgICAgICAgICAgICAgICAgIHUzMiByZWFsX3NyY19yZWcgPSBz
cmNfcmVnOwogICAgICAgICAgICAgICAgICAgICAgICAgdTMyIHJlYWxfZHN0X3JlZyA9IGRzdF9y
ZWc7CkBAIC0yNjk1LDYgKzI2OTUsNyBAQCBzdGF0aWMgaW50IGRvX2ppdChzdHJ1Y3QgYnBmX3Zl
cmlmaWVyX2VudiAqZW52LCBzdHJ1Y3QgYnBmX3Byb2cgKmJwZl9wcm9nLCBpbnQgKgogICAgICAg
ICAgICAgICAgICAgICAgICAgaWYgKGVycikKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgcmV0dXJuIGVycjsKICAgICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOworICAgICAgICAg
ICAgICAgfQogIAogICAgICAgICAgICAgICAgIGNhc2UgQlBGX1NUWCB8IEJQRl9QUk9CRV9BVE9N
SUMgfCBCUEZfQjoKICAgICAgICAgICAgICAgICBjYXNlIEJQRl9TVFggfCBCUEZfUFJPQkVfQVRP
TUlDIHwgQlBGX0g6Cgo+ICsJCQl1OCAqYnJhbmNoX3RhcmdldDsKPiAgIAkJCWlmIChpbnNuLT5p
bW0gPT0gKEJQRl9BTkQgfCBCUEZfRkVUQ0gpIHx8Cj4gICAJCQkgICAgaW5zbi0+aW1tID09IChC
UEZfT1IgfCBCUEZfRkVUQ0gpIHx8Cj4gICAJCQkgICAgaW5zbi0+aW1tID09IChCUEZfWE9SIHwg
QlBGX0ZFVENIKSkgewo+IC0JCQkJYm9vbCBpczY0ID0gQlBGX1NJWkUoaW5zbi0+Y29kZSkgPT0g
QlBGX0RXOwo+IC0JCQkJdTMyIHJlYWxfc3JjX3JlZyA9IHNyY19yZWc7Cj4gLQkJCQl1MzIgcmVh
bF9kc3RfcmVnID0gZHN0X3JlZzsKPiAtCQkJCXU4ICpicmFuY2hfdGFyZ2V0Owo+ICAgCj4gICAJ
CQkJLyoKPiAgIAkJCQkgKiBDYW4ndCBiZSBpbXBsZW1lbnRlZCB3aXRoIGEgc2luZ2xlIHg4NiBp
bnNuLgo+IEBAIC0yNjEyLDcgKzI2NDIsMTkgQEAgc3RhdGljIGludCBkb19qaXQoc3RydWN0IGJw
Zl92ZXJpZmllcl9lbnYgKmVudiwgc3RydWN0IGJwZl9wcm9nICpicGZfcHJvZywgaW50ICoKPiAg
IAkJCQlpZiAoZHN0X3JlZyA9PSBCUEZfUkVHXzApCj4gICAJCQkJCXJlYWxfZHN0X3JlZyA9IEJQ
Rl9SRUdfQVg7Cj4gICAKPiArCQkJCWlwICs9IDM7Cj4gKwkJCX0KPiArCQkJaWYgKCFicGZfYXRv
bWljX2lzX2xvYWRfc3RvcmUoaW5zbikpIHsKPiArCQkJCWVyciA9IGVtaXRfa2FzYW5fY2hlY2so
JnByb2csIHJlYWxfZHN0X3JlZywKPiArCQkJCQkJICAgICAgIGluc24sIGlwLCBmYWxzZSwKPiAr
CQkJCQkJICAgICAgIGFjY2Vzc2VzX3N0YWNrX29ubHkpOwo+ICsJCQkJaWYgKGVycikKPiArCQkJ
CQlyZXR1cm4gZXJyOwo+ICAgCQkJCWJyYW5jaF90YXJnZXQgPSBwcm9nOwo+ICsJCQl9Cj4gKwkJ
CWlmIChpbnNuLT5pbW0gPT0gKEJQRl9BTkQgfCBCUEZfRkVUQ0gpIHx8Cj4gKwkJCSAgICBpbnNu
LT5pbW0gPT0gKEJQRl9PUiB8IEJQRl9GRVRDSCkgfHwKPiArCQkJICAgIGluc24tPmltbSA9PSAo
QlBGX1hPUiB8IEJQRl9GRVRDSCkpIHsKPiAgIAkJCQkvKiBMb2FkIG9sZCB2YWx1ZSAqLwo+ICAg
CQkJCWVtaXRfbGR4KCZwcm9nLCBCUEZfU0laRShpbnNuLT5jb2RlKSwKPiAgIAkJCQkJIEJQRl9S
RUdfMCwgcmVhbF9kc3RfcmVnLCBpbnNuLT5vZmYpOwo+IEBAIC0yNjQ0LDggKzI2ODYsOSBAQCBz
dGF0aWMgaW50IGRvX2ppdChzdHJ1Y3QgYnBmX3ZlcmlmaWVyX2VudiAqZW52LCBzdHJ1Y3QgYnBm
X3Byb2cgKmJwZl9wcm9nLCBpbnQgKgo+ICAgCQkJfQo+ICAgCj4gICAJCQlpZiAoYnBmX2F0b21p
Y19pc19sb2FkX3N0b3JlKGluc24pKQo+IC0JCQkJZXJyID0gZW1pdF9hdG9taWNfbGRfc3QoJnBy
b2csIGluc24tPmltbSwgZHN0X3JlZywgc3JjX3JlZywKPiAtCQkJCQkJCWluc24tPm9mZiwgQlBG
X1NJWkUoaW5zbi0+Y29kZSkpOwo+ICsJCQkJZXJyID0gZW1pdF9hdG9taWNfbGRfc3QoJnByb2cs
IGluc24sIGlwLAo+ICsJCQkJCQkJZHN0X3JlZywgc3JjX3JlZywKPiArCQkJCQkJCWFjY2Vzc2Vz
X3N0YWNrX29ubHkpOwo+ICAgCQkJZWxzZQo+ICAgCQkJCWVyciA9IGVtaXRfYXRvbWljX3Jtdygm
cHJvZywgaW5zbi0+aW1tLCBkc3RfcmVnLCBzcmNfcmVnLAo+ICAgCQkJCQkJICAgICAgaW5zbi0+
b2ZmLCBCUEZfU0laRShpbnNuLT5jb2RlKSk7Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0z
MkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
