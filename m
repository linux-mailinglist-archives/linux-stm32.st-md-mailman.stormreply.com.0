Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vfqFI5TeIWrfPwEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 04 Jun 2026 22:22:44 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 734F6643402
	for <lists+linux-stm32@lfdr.de>; Thu, 04 Jun 2026 22:22:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=bootlin.com header.s=dkim header.b=SDLnofRd;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=bootlin.com (policy=reject)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3C31AC8F275;
	Thu,  4 Jun 2026 20:22:44 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 79E69C8F273
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Jun 2026 20:22:43 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 489631A07F0;
 Thu,  4 Jun 2026 20:22:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 14D1F5FED1;
 Thu,  4 Jun 2026 20:22:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B7E44106A1D2E; 
 Thu,  4 Jun 2026 22:22:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1780604561; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=UoqSqntIzj8Teup4Ktkq7Hy+tOt6BUYqG7fRFULwZGI=;
 b=SDLnofRdJQjkWpFQ6LGyaG2sZP86FbyHIls5X2QUP/GRqr01kMjATXSEiWElfffb9fHpHO
 SqLnK5hi9Q0E4KWiVd7iND83r6UBBXhxoxFKxp4a8IWFec5dnraufsGFdUHfBVMl/Qk3sh
 eAh/CxqaHu6M2u7ZtRd55oDSOzTUCIJx9Uiha+AE8Ru11L67+DVHUyDHqS0ePUtAt/pblU
 Hy3P8O2m1WTPdbi2ePIcGbLurB1oyRXStQWk+VwZg9mJT/FYFzjeSUCzJkefdiOQh/x73i
 dFJoDeSktVCsoQ3SeQ19KNc21/3/EpBVTbkKciVVtEG9XzRrrNN6WctnVsqY8A==
From: =?utf-8?q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29?=
 <alexis.lothore@bootlin.com>
Date: Thu, 04 Jun 2026 22:22:03 +0200
MIME-Version: 1.0
Message-Id: <20260604-kasan-v2-5-c066e627fda8@bootlin.com>
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, ebpf@linuxfoundation.org,
 linux-kernel@vger.kernel.org,
 =?utf-8?q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29?=
 <alexis.lothore@bootlin.com>, linux-kselftest@vger.kernel.org,
 bpf@vger.kernel.org, Bastien Curutchet <bastien.curutchet@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH bpf-next v2 5/8] bpf,
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [5.39 / 15.00];
	DMARC_POLICY_REJECT(2.00)[bootlin.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[bootlin.com:s=dkim];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ast@kernel.org,m:daniel@iogearbox.net,m:andrii@kernel.org,m:martin.lau@linux.dev,m:eddyz87@gmail.com,m:memxor@gmail.com,m:song@kernel.org,m:yonghong.song@linux.dev,m:jolsa@kernel.org,m:john.fastabend@gmail.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:shuah@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:ihor.solodrai@linux.dev,m:thomas.petazzoni@bootlin.com,m:ebpf@linuxfoundation.org,m:linux-kernel@vger.kernel.org,m:alexis.lothore@bootlin.com,m:linux-kselftest@vger.kernel.org,m:bpf@vger.kernel.org,m:bastien.curutchet@bootlin.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:johnfastabend@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,iogearbox.net,linux.dev,gmail.com,redhat.com,alien8.de,linux.intel.com,zytor.com,foss.st.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[alexis.lothore@bootlin.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[bootlin.com:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[alexis.lothore@bootlin.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TAGGED_RCPT(0.00)[linux-stm32];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:mid,bootlin.com:from_mime,bootlin.com:email,st-md-mailman.stormreply.com:from_smtp,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 734F6643402

SW5zZXJ0IEtBU0FOIHNoYWRvdyBtZW1vcnkgY2hlY2tzIGJlZm9yZSBtZW1vcnkgbG9hZCBhbmQg
c3RvcmUKb3BlcmF0aW9ucyBpbiBKSVQtY29tcGlsZWQgQlBGIHByb2dyYW1zLiBUaGlzIGhlbHBz
IGRldGVjdCBtZW1vcnkgc2FmZXR5CmJ1Z3Mgc3VjaCBhcyB1c2UtYWZ0ZXItZnJlZSBhbmQgb3V0
LW9mLWJvdW5kcyBhY2Nlc3NlcyBhdCBydW50aW1lLgoKVGhlIG1haW4gaW5zdHJ1Y3Rpb25zIGJl
aW5nIHRhcmdldGVkIGFyZSBCUEZfU1QsIEJQRl9TVFggYW5kIEJQRl9MRFgsCmJ1dCBub3QgYWxs
IG9mIHRoZW0gYXJlIGJlaW5nIGluc3RydW1lbnRlZDoKLSBpZiB0aGUgbG9hZC9zdG9yZSBpbnN0
cnVjdGlvbiBpcyBpbiBmYWN0IGFjY2Vzc2luZyB0aGUgcHJvZ3JhbSBzdGFjaywKICBlbWl0X2th
c2FuX2NoZWNrIHNpbGVudGx5IHNraXBzIHRoZSBpbnN0cnVtZW50YXRpb24sIGFzIHdlIGFscmVh
ZHkKICBoYXZlIHBhZ2UgZ3VhcmRzIHRvIG1vbml0b3Igc3RhY2sgYWNjZXNzZXMuCi0gaWYgdGhl
IGxvYWQvc3RvcmUgaW5zdHJ1Y3Rpb24gaXMgYSBCUEZfUFJPQkVfTUVNIG9yIGEgQlBGX1BST0JF
X0FUT01JQwogIGluc3RydWN0aW9uLCB3ZSBkbyBub3QgaW5zdHJ1bWVudCBpdCwgYXMgdGhlIHBh
c3NlZCBhZGRyZXNzIGNhbiBmYXVsdAogIChoZW5jZSB0aGUgY3VzdG9tIGZhdWx0IG1hbmFnZW1l
bnQgd2l0aCBCUEZfUFJPQkVfWFhYIGluc3RydWN0aW9ucyksCiAgYW5kIHNvIHRoZSBjb3JyZXNw
b25kaW5nIGthc2FuIGNoZWNrIGNvdWxkIGZhdWx0IGFzIHdlbGwuCgpTaWduZWQtb2ZmLWJ5OiBB
bGV4aXMgTG90aG9yw6kgKGVCUEYgRm91bmRhdGlvbikgPGFsZXhpcy5sb3Rob3JlQGJvb3RsaW4u
Y29tPgotLS0KQ2hhbmdlcyBpbiB2MjoKLSBzdXBwb3J0IEJQRl9BVE9NSUNTCi0gc3VwcG9ydCBC
UEZfU1QKLSBtYWtlIHN1cmUgdG8gc3lzdGVtYXRpY2FsbHkgcGFzcyBjb3JyZWN0IGluc3RydWN0
aW9uIHRvIGthc2FuIGNoZWNrCi0tLQogYXJjaC94ODYvbmV0L2JwZl9qaXRfY29tcC5jIHwgNjMg
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tCiAxIGZpbGUgY2hh
bmdlZCwgNTMgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJj
aC94ODYvbmV0L2JwZl9qaXRfY29tcC5jIGIvYXJjaC94ODYvbmV0L2JwZl9qaXRfY29tcC5jCmlu
ZGV4IDk0M2EwZjMxNWNmMi4uY2IzYzAzZWRjNGJkIDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9uZXQv
YnBmX2ppdF9jb21wLmMKKysrIGIvYXJjaC94ODYvbmV0L2JwZl9qaXRfY29tcC5jCkBAIC0xNTE2
LDE3ICsxNTE2LDMwIEBAIHN0YXRpYyBpbnQgZW1pdF9hdG9taWNfcm13X2luZGV4KHU4ICoqcHBy
b2csIHUzMiBhdG9taWNfb3AsIHUzMiBzaXplLAogCXJldHVybiAwOwogfQogCi1zdGF0aWMgaW50
IGVtaXRfYXRvbWljX2xkX3N0KHU4ICoqcHByb2csIHUzMiBhdG9taWNfb3AsIHUzMiBkc3RfcmVn
LAotCQkJICAgICB1MzIgc3JjX3JlZywgczE2IG9mZiwgdTggYnBmX3NpemUpCitzdGF0aWMgaW50
IGVtaXRfYXRvbWljX2xkX3N0KHU4ICoqcHByb2csIHN0cnVjdCBicGZfaW5zbiAqaW5zbiwgdTgg
KmlwLAorCQkJICAgICB1MzIgZHN0X3JlZywgdTMyIHNyY19yZWcsIGJvb2wgYWNjZXNzZXNfc3Rh
Y2tfb25seSkKIHsKKwl1MzIgYXRvbWljX29wID0gaW5zbi0+aW1tOworCWludCBlcnI7CisKIAlz
d2l0Y2ggKGF0b21pY19vcCkgewogCWNhc2UgQlBGX0xPQURfQUNROgorCQllcnIgPSBlbWl0X2th
c2FuX2NoZWNrKHBwcm9nLCBzcmNfcmVnLCBpbnNuLCBpcCwgZmFsc2UsCisJCQkJICAgICAgIGFj
Y2Vzc2VzX3N0YWNrX29ubHkpOworCQlpZiAoZXJyKQorCQkJcmV0dXJuIGVycjsKIAkJLyogZHN0
X3JlZyA9IHNtcF9sb2FkX2FjcXVpcmUoc3JjX3JlZyArIG9mZjE2KSAqLwotCQllbWl0X2xkeChw
cHJvZywgYnBmX3NpemUsIGRzdF9yZWcsIHNyY19yZWcsIG9mZik7CisJCWVtaXRfbGR4KHBwcm9n
LCBCUEZfU0laRShpbnNuLT5jb2RlKSwgZHN0X3JlZywgc3JjX3JlZywKKwkJCSBpbnNuLT5vZmYp
OwogCQlicmVhazsKIAljYXNlIEJQRl9TVE9SRV9SRUw6CisJCWVyciA9IGVtaXRfa2FzYW5fY2hl
Y2socHByb2csIGRzdF9yZWcsIGluc24sIGlwLCB0cnVlLAorCQkJCSAgICAgICBhY2Nlc3Nlc19z
dGFja19vbmx5KTsKKwkJaWYgKGVycikKKwkJCXJldHVybiBlcnI7CiAJCS8qIHNtcF9zdG9yZV9y
ZWxlYXNlKGRzdF9yZWcgKyBvZmYxNiwgc3JjX3JlZykgKi8KLQkJZW1pdF9zdHgocHByb2csIGJw
Zl9zaXplLCBkc3RfcmVnLCBzcmNfcmVnLCBvZmYpOworCQllbWl0X3N0eChwcHJvZywgQlBGX1NJ
WkUoaW5zbi0+Y29kZSksIGRzdF9yZWcsIHNyY19yZWcsCisJCQkgaW5zbi0+b2ZmKTsKIAkJYnJl
YWs7CiAJZGVmYXVsdDoKIAkJcHJfZXJyKCJicGZfaml0OiB1bmtub3duIGF0b21pYyBsb2FkL3N0
b3JlIG9wY29kZSAlMDJ4XG4iLApAQCAtMTkwNCw2ICsxOTE3LDcgQEAgc3RhdGljIGludCBkb19q
aXQoc3RydWN0IGJwZl92ZXJpZmllcl9lbnYgKmVudiwgc3RydWN0IGJwZl9wcm9nICpicGZfcHJv
ZywgaW50ICoKIAkJY29uc3QgczMyIGltbTMyID0gaW5zbi0+aW1tOwogCQl1MzIgZHN0X3JlZyA9
IGluc24tPmRzdF9yZWc7CiAJCXUzMiBzcmNfcmVnID0gaW5zbi0+c3JjX3JlZzsKKwkJYm9vbCBh
Y2Nlc3Nlc19zdGFja19vbmx5OwogCQl1OCBiMiA9IDAsIGIzID0gMDsKIAkJdTggKnN0YXJ0X29m
X2xkeDsKIAkJczY0IGptcF9vZmZzZXQ7CkBAIC0xOTI0LDYgKzE5MzgsOCBAQCBzdGF0aWMgaW50
IGRvX2ppdChzdHJ1Y3QgYnBmX3ZlcmlmaWVyX2VudiAqZW52LCBzdHJ1Y3QgYnBmX3Byb2cgKmJw
Zl9wcm9nLCBpbnQgKgogCQkJRU1JVF9FTkRCUigpOwogCiAJCWlwID0gaW1hZ2UgKyBhZGRyc1tp
IC0gMV0gKyAocHJvZyAtIHRlbXApOworCQlhY2Nlc3Nlc19zdGFja19vbmx5ID0KKwkJCWJwZl9p
bnNuX2FjY2Vzc2VzX3N0YWNrX29ubHkoZW52LCBicGZfcHJvZywgaSAtIDEpOwogCiAJCXN3aXRj
aCAoaW5zbi0+Y29kZSkgewogCQkJLyogQUxVICovCkBAIC0yMzA0LDYgKzIzMjAsMTAgQEAgc3Rh
dGljIGludCBkb19qaXQoc3RydWN0IGJwZl92ZXJpZmllcl9lbnYgKmVudiwgc3RydWN0IGJwZl9w
cm9nICpicGZfcHJvZywgaW50ICoKIAkJY2FzZSBCUEZfU1QgfCBCUEZfTUVNIHwgQlBGX0g6CiAJ
CWNhc2UgQlBGX1NUIHwgQlBGX01FTSB8IEJQRl9XOgogCQljYXNlIEJQRl9TVCB8IEJQRl9NRU0g
fCBCUEZfRFc6CisJCQllcnIgPSBlbWl0X2thc2FuX2NoZWNrKCZwcm9nLCBkc3RfcmVnLCBpbnNu
LCBpcCwgdHJ1ZSwKKwkJCQkJICAgICAgIGFjY2Vzc2VzX3N0YWNrX29ubHkpOworCQkJaWYgKGVy
cikKKwkJCQlyZXR1cm4gZXJyOwogCQkJc3dpdGNoIChCUEZfU0laRShpbnNuLT5jb2RlKSkgewog
CQkJY2FzZSBCUEZfQjoKIAkJCQlpZiAoaXNfZXJlZyhkc3RfcmVnKSkKQEAgLTIzNjksNiArMjM4
OSwxMCBAQCBzdGF0aWMgaW50IGRvX2ppdChzdHJ1Y3QgYnBmX3ZlcmlmaWVyX2VudiAqZW52LCBz
dHJ1Y3QgYnBmX3Byb2cgKmJwZl9wcm9nLCBpbnQgKgogCQkJCWluc25fb2ZmID0gb3V0Z29pbmdf
YXJnX2Jhc2UgLSBvdXRnb2luZ19yc3AgLSBpbnNuX29mZiAtIDE2OwogCQkJCWRzdF9yZWcgPSBC
UEZfUkVHX0ZQOwogCQkJfQorCQkJZXJyID0gZW1pdF9rYXNhbl9jaGVjaygmcHJvZywgZHN0X3Jl
ZywgaW5zbiwgaXAsIHRydWUsCisJCQkJCSAgICAgICBhY2Nlc3Nlc19zdGFja19vbmx5KTsKKwkJ
CWlmIChlcnIpCisJCQkJcmV0dXJuIGVycjsKIAkJCWVtaXRfc3R4KCZwcm9nLCBCUEZfU0laRShp
bnNuLT5jb2RlKSwgZHN0X3JlZywgc3JjX3JlZywgaW5zbl9vZmYpOwogCQkJYnJlYWs7CiAKQEAg
LTI1MzAsNiArMjU1NCwxMiBAQCBzdGF0aWMgaW50IGRvX2ppdChzdHJ1Y3QgYnBmX3ZlcmlmaWVy
X2VudiAqZW52LCBzdHJ1Y3QgYnBmX3Byb2cgKmJwZl9wcm9nLCBpbnQgKgogCQkJCS8qIHBvcHVs
YXRlIGptcF9vZmZzZXQgZm9yIEpBRSBhYm92ZSB0byBqdW1wIHRvIHN0YXJ0X29mX2xkeCAqLwog
CQkJCXN0YXJ0X29mX2xkeCA9IHByb2c7CiAJCQkJZW5kX29mX2ptcFstMV0gPSBzdGFydF9vZl9s
ZHggLSBlbmRfb2Zfam1wOworCQkJfSBlbHNlIHsKKwkJCQllcnIgPSBlbWl0X2thc2FuX2NoZWNr
KCZwcm9nLCBzcmNfcmVnLCBpbnNuLCBpcCwKKwkJCQkJCSAgICAgICBmYWxzZSwKKwkJCQkJCSAg
ICAgICBhY2Nlc3Nlc19zdGFja19vbmx5KTsKKwkJCQlpZiAoZXJyKQorCQkJCQlyZXR1cm4gZXJy
OwogCQkJfQogCQkJaWYgKEJQRl9NT0RFKGluc24tPmNvZGUpID09IEJQRl9QUk9CRV9NRU1TWCB8
fAogCQkJICAgIEJQRl9NT0RFKGluc24tPmNvZGUpID09IEJQRl9NRU1TWCkKQEAgLTI1OTIsMTMg
KzI2MjIsMTMgQEAgc3RhdGljIGludCBkb19qaXQoc3RydWN0IGJwZl92ZXJpZmllcl9lbnYgKmVu
diwgc3RydWN0IGJwZl9wcm9nICpicGZfcHJvZywgaW50ICoKIAkJCWZhbGx0aHJvdWdoOwogCQlj
YXNlIEJQRl9TVFggfCBCUEZfQVRPTUlDIHwgQlBGX1c6CiAJCWNhc2UgQlBGX1NUWCB8IEJQRl9B
VE9NSUMgfCBCUEZfRFc6CisJCQlib29sIGlzNjQgPSBCUEZfU0laRShpbnNuLT5jb2RlKSA9PSBC
UEZfRFc7CisJCQl1MzIgcmVhbF9zcmNfcmVnID0gc3JjX3JlZzsKKwkJCXUzMiByZWFsX2RzdF9y
ZWcgPSBkc3RfcmVnOworCQkJdTggKmJyYW5jaF90YXJnZXQ7CiAJCQlpZiAoaW5zbi0+aW1tID09
IChCUEZfQU5EIHwgQlBGX0ZFVENIKSB8fAogCQkJICAgIGluc24tPmltbSA9PSAoQlBGX09SIHwg
QlBGX0ZFVENIKSB8fAogCQkJICAgIGluc24tPmltbSA9PSAoQlBGX1hPUiB8IEJQRl9GRVRDSCkp
IHsKLQkJCQlib29sIGlzNjQgPSBCUEZfU0laRShpbnNuLT5jb2RlKSA9PSBCUEZfRFc7Ci0JCQkJ
dTMyIHJlYWxfc3JjX3JlZyA9IHNyY19yZWc7Ci0JCQkJdTMyIHJlYWxfZHN0X3JlZyA9IGRzdF9y
ZWc7Ci0JCQkJdTggKmJyYW5jaF90YXJnZXQ7CiAKIAkJCQkvKgogCQkJCSAqIENhbid0IGJlIGlt
cGxlbWVudGVkIHdpdGggYSBzaW5nbGUgeDg2IGluc24uCkBAIC0yNjEyLDcgKzI2NDIsMTkgQEAg
c3RhdGljIGludCBkb19qaXQoc3RydWN0IGJwZl92ZXJpZmllcl9lbnYgKmVudiwgc3RydWN0IGJw
Zl9wcm9nICpicGZfcHJvZywgaW50ICoKIAkJCQlpZiAoZHN0X3JlZyA9PSBCUEZfUkVHXzApCiAJ
CQkJCXJlYWxfZHN0X3JlZyA9IEJQRl9SRUdfQVg7CiAKKwkJCQlpcCArPSAzOworCQkJfQorCQkJ
aWYgKCFicGZfYXRvbWljX2lzX2xvYWRfc3RvcmUoaW5zbikpIHsKKwkJCQllcnIgPSBlbWl0X2th
c2FuX2NoZWNrKCZwcm9nLCByZWFsX2RzdF9yZWcsCisJCQkJCQkgICAgICAgaW5zbiwgaXAsIGZh
bHNlLAorCQkJCQkJICAgICAgIGFjY2Vzc2VzX3N0YWNrX29ubHkpOworCQkJCWlmIChlcnIpCisJ
CQkJCXJldHVybiBlcnI7CiAJCQkJYnJhbmNoX3RhcmdldCA9IHByb2c7CisJCQl9CisJCQlpZiAo
aW5zbi0+aW1tID09IChCUEZfQU5EIHwgQlBGX0ZFVENIKSB8fAorCQkJICAgIGluc24tPmltbSA9
PSAoQlBGX09SIHwgQlBGX0ZFVENIKSB8fAorCQkJICAgIGluc24tPmltbSA9PSAoQlBGX1hPUiB8
IEJQRl9GRVRDSCkpIHsKIAkJCQkvKiBMb2FkIG9sZCB2YWx1ZSAqLwogCQkJCWVtaXRfbGR4KCZw
cm9nLCBCUEZfU0laRShpbnNuLT5jb2RlKSwKIAkJCQkJIEJQRl9SRUdfMCwgcmVhbF9kc3RfcmVn
LCBpbnNuLT5vZmYpOwpAQCAtMjY0NCw4ICsyNjg2LDkgQEAgc3RhdGljIGludCBkb19qaXQoc3Ry
dWN0IGJwZl92ZXJpZmllcl9lbnYgKmVudiwgc3RydWN0IGJwZl9wcm9nICpicGZfcHJvZywgaW50
ICoKIAkJCX0KIAogCQkJaWYgKGJwZl9hdG9taWNfaXNfbG9hZF9zdG9yZShpbnNuKSkKLQkJCQll
cnIgPSBlbWl0X2F0b21pY19sZF9zdCgmcHJvZywgaW5zbi0+aW1tLCBkc3RfcmVnLCBzcmNfcmVn
LAotCQkJCQkJCWluc24tPm9mZiwgQlBGX1NJWkUoaW5zbi0+Y29kZSkpOworCQkJCWVyciA9IGVt
aXRfYXRvbWljX2xkX3N0KCZwcm9nLCBpbnNuLCBpcCwKKwkJCQkJCQlkc3RfcmVnLCBzcmNfcmVn
LAorCQkJCQkJCWFjY2Vzc2VzX3N0YWNrX29ubHkpOwogCQkJZWxzZQogCQkJCWVyciA9IGVtaXRf
YXRvbWljX3JtdygmcHJvZywgaW5zbi0+aW1tLCBkc3RfcmVnLCBzcmNfcmVnLAogCQkJCQkJICAg
ICAgaW5zbi0+b2ZmLCBCUEZfU0laRShpbnNuLT5jb2RlKSk7CgotLSAKMi41NC4wCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWls
aW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczov
L3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0z
Mgo=
