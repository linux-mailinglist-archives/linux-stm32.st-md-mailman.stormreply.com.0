Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VQhfH4feIWrbPwEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 04 Jun 2026 22:22:31 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 232436433F2
	for <lists+linux-stm32@lfdr.de>; Thu, 04 Jun 2026 22:22:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=bootlin.com header.s=dkim header.b=g9hZECUL;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=bootlin.com (policy=reject)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DDC69C8F275;
	Thu,  4 Jun 2026 20:22:30 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 23582C8F275
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Jun 2026 20:22:30 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id CB1394E406E3;
 Thu,  4 Jun 2026 20:22:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 9E7C55FED1;
 Thu,  4 Jun 2026 20:22:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 191B6106A1D38; 
 Thu,  4 Jun 2026 22:22:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1780604547; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=zgpTqib293PeJ1HPHKW/oMt7J0hcVujaLGWwpfesc9M=;
 b=g9hZECULy4U0Df6PU535oPXEz1CTdnLpDUaLPDCdFKUW1EzbMzT3vnSCPj1Yz1RL5AmWSw
 aSWz5Znay4r7aREbuSDeR+Uh/v61xzxZO35IwbqtZxAaEsp2a5e0UmDDpi2XsYzVaUtCm5
 lfZ2Q3W0l5yc3R2qafhW3f0mniN/TSe0qVuzAf0KGzyhpB8kS237iGmDLI3JToKcQzlg0W
 NeLWsZ4ocsKBcL6ySdJOVP8GN9uSnQcE8o6fouYfdU1O/+9osSHF89kp4yrpNH67+3o8fD
 EfolbKvwNMOUdcWT46wWKHkcSO3D+RyfIGff/Aei3m0bt2+XnvBg68mkvOTGgg==
From: =?utf-8?q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29?=
 <alexis.lothore@bootlin.com>
Date: Thu, 04 Jun 2026 22:21:59 +0200
MIME-Version: 1.0
Message-Id: <20260604-kasan-v2-1-c066e627fda8@bootlin.com>
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
Subject: [Linux-stm32] [PATCH bpf-next v2 1/8] bpf: mark instructions
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:from_smtp,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 232436433F2

SW4gb3JkZXIgdG8gcHJlcGFyZSB0byBlbWl0IEtBU0FOIGNoZWNrcyBpbiBKSVRlZCBwcm9ncmFt
cywgSklUCmNvbXBpbGVycyBuZWVkIHRvIGJlIGF3YXJlIGFib3V0IHdoZXRoZXIgc29tZSBsb2Fk
L3N0b3JlIGluc3RydWN0aW9ucwphcmUgdGFyZ2V0aW5nIHRoZSBicGYgcHJvZ3JhbSBzdGFjaywg
YXMgdGhvc2Ugc2hvdWxkIG5vdCBiZSBtb25pdG9yZWQKKHdlIGFscmVhZHkgaGF2ZSBndWFyZCBw
YWdlcyBmb3IgdGhhdCwgYW5kIGl0IGlzIGRpZmZpY3VsdCBhbnl3YXkgdG8KY29ycmVjdGx5IG1v
bml0b3IgYW55IGtpbmQgb2YgZGF0YSBwYXNzZWQgb24gc3RhY2spLgoKVG8gc3VwcG9ydCB0aGlz
IG5lZWQsIG1ha2UgdGhlIEJQRiB2ZXJpZmllciBtYXJrIHRoZSBpbnN0cnVjdGlvbnMKZGVwZW5k
aW5nIG9uIHdoZXRoZXIgdGhleSBjb3VsZCBhY2Nlc3Mgb3Igbm90IG1lbW9yeSBvdGhlciB0aGFu
IHN0YWNrOgotIGFkZCBhIHNldHRlciB0aGF0IGFsbG93cyB0aGUgdmVyaWZpZXIgdG8gbWFyayBp
bnN0cnVjdGlvbnMgYWNjZXNzaW5nCiAgbm9uLXN0YWNrIG1lbW9yeQotIGFkZCBhIGdldHRlciB0
aGF0IGFsbG93cyBKSVQgY29tcGlsZXJzIHRvIGNoZWNrIHdoZXRoZXIgaW5zdHJ1Y3Rpb25zCiAg
YmVpbmcgSklUZWQgYXJlIGFjY2Vzc2luZyB0aGUgc3RhY2sgX2FuZCBvbmx5XyB0aGUgc3RhY2su
IElmIG5vIGVudiBpcwogIHByb3ZpZGVkIChlZyB0aGlzIGlzIGEgY0JQRiBwcm9ncmFtKSwgZG8g
YSBiZXN0LWVmZm9ydCBjaGVjayBiYXNlZCBvbgogIHNvdXJjZSBhbmQgZGVzdGluYXRpb24gcmVn
aXN0ZXJzLgoKQXMgZGlmZmVyZW50IHN0YXRlcyBpbiB0aGUgdmVyaWZpZXIgY291bGQgbGVhZCB0
byBkaWZmZXJlbnQgbWVtb3J5IHR5cGVzCmZvciB0aGUgc2FtZSBhY2Nlc3MsIGp1c3QgbWFya2lu
ZyBhbiBpbnN0cnVjdGlvbiBhcyBhY2Nlc3Npbmcgc3RhY2sgb25seQppcyBub3QgZW5vdWdoIChp
dCBjb3VsZCBiZSBzb21lIG90aGVyIG1lbW9yeSB0eXBlIGluIGFub3RoZXIgdmVyaWZpZXIKc3Rh
dGUpLCBzbyB0aGUgYWxnb3JpdGhtIHJhdGhlciBzZXRzIGJ5IGRlZmF1bHQgYW55IGxvYWQvc3Rv
cmUKaW5zdHJ1Y3Rpb24gYXMgc3RhY2sgb25seSwgYW5kIGlmIF9hbnlfIHN0YXRlIGxlYWRzIHRv
IGFueSBtZW1vcnkgYWNjZXNzCnR5cGUgb3RoZXIgdGhhbiBQVFJfVE9fU1RBQ0ssIGl0IG92ZXJy
aWRlcyB0aGlzIHNldHRpbmcuIEl0IGFsc28gdGFrZXMKY2FyZSBhYm91dCBzaGlmdGluZyBiYWNr
IHRoZSBpbnN0cnVjdGlvbiBtYXJraW5nIGluIGFkanVzdF9pbnNuX2F1eF9kYXRhCmlmIHRoZSB2
ZXJpZmllciBwYXRjaGVzIGluc3RydWN0aW9ucy4KClNpZ25lZC1vZmYtYnk6IEFsZXhpcyBMb3Ro
b3LDqSAoZUJQRiBGb3VuZGF0aW9uKSA8YWxleGlzLmxvdGhvcmVAYm9vdGxpbi5jb20+Ci0tLQpD
aGFuZ2VzIGluIHYyOgotIGludmVydCBtYXJraW5nIGxvZ2ljIHRvIGNvdmVyIHBvc3NpYmxlIGRp
ZmZlcmVudCByZWcgdHlwZXMgd2hlbiB0aGUKICB2ZXJpZmllciBjb3ZlcnMgZGlmZmVyZW50IHN0
YXRlcwotIGFkZCBhIGJlc3QtZWZmb3J0IHByb2Nlc3NpbmcgZm9yIGNsYXNzaWNhbCBicGYgcHJv
Z3JhbXMsIGluc3BlY3RpbmcKICBkaXJlY3RseSBzcmMgYW5kIGRzdCByZWdpc3RlcnMgc2luY2Ug
d2UgZG9uJ3QgaGF2ZSB2ZXJpZmllciBlbnYKLSBtYWtlIHN1cmUgdG8ga2VlcCBtYXJraW5nIGlu
IHN5bmMgd2l0aCBwcm9nIHdoZW4gaXQgaXMgcGF0Y2hlZCBieQogIHZlcmlmaWVyCi0tLQogaW5j
bHVkZS9saW51eC9icGYuaCAgICAgICAgICB8ICAyICsrCiBpbmNsdWRlL2xpbnV4L2JwZl92ZXJp
Zmllci5oIHwgIDIgKysKIGtlcm5lbC9icGYvY29yZS5jICAgICAgICAgICAgfCAxNyArKysrKysr
KysrKysrKysrKwoga2VybmVsL2JwZi9maXh1cHMuYyAgICAgICAgICB8IDE2ICsrKysrKysrKysr
LS0tLS0KIGtlcm5lbC9icGYvdmVyaWZpZXIuYyAgICAgICAgfCAgOSArKysrKysrKysKIDUgZmls
ZXMgY2hhbmdlZCwgNDEgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9pbmNsdWRlL2xpbnV4L2JwZi5oIGIvaW5jbHVkZS9saW51eC9icGYuaAppbmRleCA4NTk5YjQ1
MWRkN2EuLmZmODBkMWQ2MmJmZiAxMDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9icGYuaAorKysg
Yi9pbmNsdWRlL2xpbnV4L2JwZi5oCkBAIC0xNTYwLDYgKzE1NjAsOCBAQCB2b2lkIGJwZl9qaXRf
dW5jaGFyZ2VfbW9kbWVtKHUzMiBzaXplKTsKIGJvb2wgYnBmX3Byb2dfaGFzX3RyYW1wb2xpbmUo
Y29uc3Qgc3RydWN0IGJwZl9wcm9nICpwcm9nKTsKIGJvb2wgYnBmX2luc25faXNfaW5kaXJlY3Rf
dGFyZ2V0KGNvbnN0IHN0cnVjdCBicGZfdmVyaWZpZXJfZW52ICplbnYsIGNvbnN0IHN0cnVjdCBi
cGZfcHJvZyAqcHJvZywKIAkJCQkgaW50IGluc25faWR4KTsKK2Jvb2wgYnBmX2luc25fYWNjZXNz
ZXNfc3RhY2tfb25seShjb25zdCBzdHJ1Y3QgYnBmX3ZlcmlmaWVyX2VudiAqZW52LAorCQkJCSAg
Y29uc3Qgc3RydWN0IGJwZl9wcm9nICpwcm9nLCBpbnQgaW5zbl9pZHgpOwogdTE2IGJwZl9vdXRf
c3RhY2tfYXJnX2NudChjb25zdCBzdHJ1Y3QgYnBmX3ZlcmlmaWVyX2VudiAqZW52LCBjb25zdCBz
dHJ1Y3QgYnBmX3Byb2cgKnByb2cpOwogI2Vsc2UKIHN0YXRpYyBpbmxpbmUgaW50IGJwZl90cmFt
cG9saW5lX2xpbmtfcHJvZyhzdHJ1Y3QgYnBmX3RyYW1wX2xpbmsgKmxpbmssCmRpZmYgLS1naXQg
YS9pbmNsdWRlL2xpbnV4L2JwZl92ZXJpZmllci5oIGIvaW5jbHVkZS9saW51eC9icGZfdmVyaWZp
ZXIuaAppbmRleCBjMjQ4ZmY0MWY0MmEuLjBmM2YwNTVkNmMxNCAxMDA2NDQKLS0tIGEvaW5jbHVk
ZS9saW51eC9icGZfdmVyaWZpZXIuaAorKysgYi9pbmNsdWRlL2xpbnV4L2JwZl92ZXJpZmllci5o
CkBAIC03MjIsNiArNzIyLDggQEAgc3RydWN0IGJwZl9pbnNuX2F1eF9kYXRhIHsKIAl1MTYgY29u
c3RfcmVnX21hcF9tYXNrOwogCXUxNiBjb25zdF9yZWdfc3VicHJvZ19tYXNrOwogCXUzMiBjb25z
dF9yZWdfdmFsc1sxMF07CisJLyogaW5zdHJ1Y3Rpb24gY2FuIGFjY2VzcyBub24tc3RhY2sgbWVt
b3J5ICovCisJYm9vbCBub25fc3RhY2tfYWNjZXNzOwogfTsKIAogI2RlZmluZSBNQVhfVVNFRF9N
QVBTIDY0IC8qIG1heCBudW1iZXIgb2YgbWFwcyBhY2Nlc3NlZCBieSBvbmUgZUJQRiBwcm9ncmFt
ICovCmRpZmYgLS1naXQgYS9rZXJuZWwvYnBmL2NvcmUuYyBiL2tlcm5lbC9icGYvY29yZS5jCmlu
ZGV4IGE2NTZhODU3MmJkYi4uMzkzZDllYWNkMjE1IDEwMDY0NAotLS0gYS9rZXJuZWwvYnBmL2Nv
cmUuYworKysgYi9rZXJuZWwvYnBmL2NvcmUuYwpAQCAtMTU4Myw2ICsxNTgzLDIyIEBAIGJvb2wg
YnBmX2luc25faXNfaW5kaXJlY3RfdGFyZ2V0KGNvbnN0IHN0cnVjdCBicGZfdmVyaWZpZXJfZW52
ICplbnYsIGNvbnN0IHN0cnVjCiAJcmV0dXJuIGVudi0+aW5zbl9hdXhfZGF0YVtpbnNuX2lkeF0u
aW5kaXJlY3RfdGFyZ2V0OwogfQogCitib29sIGJwZl9pbnNuX2FjY2Vzc2VzX3N0YWNrX29ubHko
Y29uc3Qgc3RydWN0IGJwZl92ZXJpZmllcl9lbnYgKmVudiwKKwkJCQkgIGNvbnN0IHN0cnVjdCBi
cGZfcHJvZyAqcHJvZywgaW50IGluc25faWR4KQoreworCXN0cnVjdCBicGZfaW5zbiAqaW5zbjsK
KworCS8qIGNCUEY6IHdlIGhhdmUgbm8gdmVyaWZpZXIgc3RhdGUsIGRvIGEgYmVzdC1lZmZvcnQg
Y2hlY2sgYmFzZWQgb24KKwkgKiBkc3Qvc3JjIHJlZworCSAqLworCWluc25faWR4ICs9IHByb2ct
PmF1eC0+c3VicHJvZ19zdGFydDsKKwlpbnNuID0gKHN0cnVjdCBicGZfaW5zbiAqKXByb2ctPmlu
c25zaSArIGluc25faWR4OworCWlmICghZW52KQorCQlyZXR1cm4gaW5zbi0+ZHN0X3JlZyA9PSBC
UEZfUkVHX0ZQIHx8CisJCSAgICAgICBpbnNuLT5zcmNfcmVnID09IEJQRl9SRUdfRlA7CisJcmV0
dXJuICFlbnYtPmluc25fYXV4X2RhdGFbaW5zbl9pZHhdLm5vbl9zdGFja19hY2Nlc3M7Cit9CisK
IHUxNiBicGZfb3V0X3N0YWNrX2FyZ19jbnQoY29uc3Qgc3RydWN0IGJwZl92ZXJpZmllcl9lbnYg
KmVudiwgY29uc3Qgc3RydWN0IGJwZl9wcm9nICpwcm9nKQogewogCWNvbnN0IHN0cnVjdCBicGZf
c3VicHJvZ19pbmZvICpzdWI7CkBAIC0xNTkyLDYgKzE2MDgsNyBAQCB1MTYgYnBmX291dF9zdGFj
a19hcmdfY250KGNvbnN0IHN0cnVjdCBicGZfdmVyaWZpZXJfZW52ICplbnYsIGNvbnN0IHN0cnVj
dCBicGZfcAogCXN1YiA9ICZlbnYtPnN1YnByb2dfaW5mb1twcm9nLT5hdXgtPmZ1bmNfaWR4XTsK
IAlyZXR1cm4gc3ViLT5zdGFja19hcmdfY250IC0gYnBmX2luX3N0YWNrX2FyZ19jbnQoc3ViKTsK
IH0KKwogI2VuZGlmIC8qIENPTkZJR19CUEZfSklUICovCiAKIC8qIEJhc2UgZnVuY3Rpb24gZm9y
IG9mZnNldCBjYWxjdWxhdGlvbi4gTmVlZHMgdG8gZ28gaW50byAudGV4dCBzZWN0aW9uLApkaWZm
IC0tZ2l0IGEva2VybmVsL2JwZi9maXh1cHMuYyBiL2tlcm5lbC9icGYvZml4dXBzLmMKaW5kZXgg
NWFhM2Y3ZDk5YWM5Li41MjI4YzkxMGZiZjUgMTAwNjQ0Ci0tLSBhL2tlcm5lbC9icGYvZml4dXBz
LmMKKysrIGIva2VybmVsL2JwZi9maXh1cHMuYwpAQCAtMTg1LDE2ICsxODUsMjIgQEAgc3RhdGlj
IHZvaWQgYWRqdXN0X2luc25fYXV4X2RhdGEoc3RydWN0IGJwZl92ZXJpZmllcl9lbnYgKmVudiwK
IAl9CiAKIAkvKgotCSAqIFRoZSBpbmRpcmVjdF90YXJnZXQgZmxhZyBvZiB0aGUgb3JpZ2luYWwg
aW5zdHJ1Y3Rpb24gd2FzIG1vdmVkIHRvIHRoZSBsYXN0IG9mIHRoZQotCSAqIG5ldyBpbnN0cnVj
dGlvbnMgYnkgdGhlIGFib3ZlIG1lbW1vdmUgYW5kIG1lbXNldCwgYnV0IHRoZSBpbmRpcmVjdCBq
dW1wIHRhcmdldCBpcwotCSAqIGFjdHVhbGx5IHRoZSBmaXJzdCBpbnN0cnVjdGlvbiwgc28gbW92
ZSBpdCBiYWNrLiBUaGlzIGFsc28gbWF0Y2hlcyB3aXRoIHRoZSBiZWhhdmlvcgotCSAqIG9mIGJw
Zl9pbnNuX2FycmF5X2FkanVzdCgpLCB3aGljaCBwcmVzZXJ2ZXMgeGxhdGVkX29mZiB0byBwb2lu
dCB0byB0aGUgZmlyc3QgbmV3Ci0JICogaW5zdHJ1Y3Rpb24uCisJICogVGhlIGluZGlyZWN0X3Rh
cmdldCBhbmQgbm9uX3N0YWNrX2FjY2VzcyBmbGFncyBvZiB0aGUgb3JpZ2luYWwKKwkgKiBpbnN0
cnVjdGlvbiB3ZXJlIG1vdmVkIHRvIHRoZSBsYXN0IG9mIHRoZSBuZXcgaW5zdHJ1Y3Rpb25zIGJ5
IHRoZQorCSAqIGFib3ZlIG1lbW1vdmUgYW5kIG1lbXNldCwgYnV0IHRob3NlIGFjdHVhbGx5IG1h
dGNoIHRoZSBmaXJzdAorCSAqIGluc3RydWN0aW9uLCBzbyBtb3ZlIHRoZW0gYmFjay4gVGhpcyBh
bHNvIG1hdGNoZXMgd2l0aCB0aGUgYmVoYXZpb3IKKwkgKiBvZiBicGZfaW5zbl9hcnJheV9hZGp1
c3QoKSwgd2hpY2ggcHJlc2VydmVzIHhsYXRlZF9vZmYgdG8gcG9pbnQgdG8KKwkgKiB0aGUgZmly
c3QgbmV3IGluc3RydWN0aW9uLgogCSAqLwogCWlmIChkYXRhW29mZiArIGNudCAtIDFdLmluZGly
ZWN0X3RhcmdldCkgewogCQlkYXRhW29mZl0uaW5kaXJlY3RfdGFyZ2V0ID0gMTsKIAkJZGF0YVtv
ZmYgKyBjbnQgLSAxXS5pbmRpcmVjdF90YXJnZXQgPSAwOwogCX0KKworCWlmIChkYXRhW29mZiAr
IGNudCAtIDFdLm5vbl9zdGFja19hY2Nlc3MpIHsKKwkJZGF0YVtvZmZdLm5vbl9zdGFja19hY2Nl
c3MgPSAxOworCQlkYXRhW29mZiArIGNudCAtIDFdLm5vbl9zdGFja19hY2Nlc3MgPSAwOworCX0K
IH0KIAogc3RhdGljIHZvaWQgYWRqdXN0X3N1YnByb2dfc3RhcnRzKHN0cnVjdCBicGZfdmVyaWZp
ZXJfZW52ICplbnYsIHUzMiBvZmYsIHUzMiBsZW4pCmRpZmYgLS1naXQgYS9rZXJuZWwvYnBmL3Zl
cmlmaWVyLmMgYi9rZXJuZWwvYnBmL3ZlcmlmaWVyLmMKaW5kZXggOGVkNDg0Y2IxYThhLi5iM2Yw
ZjQzMGFkNmEgMTAwNjQ0Ci0tLSBhL2tlcm5lbC9icGYvdmVyaWZpZXIuYworKysgYi9rZXJuZWwv
YnBmL3ZlcmlmaWVyLmMKQEAgLTMxNDMsNiArMzE0MywxMSBAQCBzdGF0aWMgdm9pZCBtYXJrX2lu
ZGlyZWN0X3RhcmdldChzdHJ1Y3QgYnBmX3ZlcmlmaWVyX2VudiAqZW52LCBpbnQgaWR4KQogCWVu
di0+aW5zbl9hdXhfZGF0YVtpZHhdLmluZGlyZWN0X3RhcmdldCA9IHRydWU7CiB9CiAKK3N0YXRp
YyB2b2lkIG1hcmtfbm9uX3N0YWNrX2FjY2VzcyhzdHJ1Y3QgYnBmX3ZlcmlmaWVyX2VudiAqZW52
LCBpbnQgaWR4KQoreworCWVudi0+aW5zbl9hdXhfZGF0YVtpZHhdLm5vbl9zdGFja19hY2Nlc3Mg
PSB0cnVlOworfQorCiAjZGVmaW5lIExSX0ZSQU1FTk9fQklUUwkzCiAjZGVmaW5lIExSX1NQSV9C
SVRTCTYKICNkZWZpbmUgTFJfRU5UUllfQklUUwkoTFJfU1BJX0JJVFMgKyBMUl9GUkFNRU5PX0JJ
VFMgKyAxKQpAQCAtNjMwMCw2ICs2MzA1LDEwIEBAIHN0YXRpYyBpbnQgY2hlY2tfbWVtX2FjY2Vz
cyhzdHJ1Y3QgYnBmX3ZlcmlmaWVyX2VudiAqZW52LCBpbnQgaW5zbl9pZHgsIHN0cnVjdCBiCiAJ
CWVsc2UKIAkJCWNvZXJjZV9yZWdfdG9fc2l6ZV9zeCgmcmVnc1t2YWx1ZV9yZWdub10sIHNpemUp
OwogCX0KKworCWlmICghZXJyICYmIHJlZy0+dHlwZSAhPSBQVFJfVE9fU1RBQ0spCisJCW1hcmtf
bm9uX3N0YWNrX2FjY2VzcyhlbnYsIGluc25faWR4KTsKKwogCXJldHVybiBlcnI7CiB9CiAKCi0t
IAoyLjU0LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXN0bTMyCg==
