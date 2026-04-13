Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MKRSM/M13Wl9agkAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Apr 2026 20:29:07 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AD75D3F204D
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Apr 2026 20:29:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 41325C2909A;
	Mon, 13 Apr 2026 18:29:07 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3BE1DC3F95E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Apr 2026 18:29:05 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id A43C0C5B1AD;
 Mon, 13 Apr 2026 18:29:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id F191C5FFB9;
 Mon, 13 Apr 2026 18:29:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C7044104504B7; 
 Mon, 13 Apr 2026 20:28:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1776104943; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=SIbaQ9mg0ZbtaBPZTfhJW0y4Oug6knq3Mk42IMQtkEk=;
 b=KLIXIQrj/Dt6o6ylVSJmfcaGlqn8TQDRCQGBXVjGupGskDl9p5aoxmau6a5GMRftUxpFpP
 XXob2LzYqw709cOvxQ5a6hZGYrx/bejjqgSFQM7M3yCVGCevkepZRsrW22JHoJF1sJdmYj
 i+d3PdzlC1LjCfqZTgrnQ66Lzt9Q7VBJLIq352bEOs30qOllcgBqkwoZ+xBRxoIMSjdmbG
 2XqEp8UhjW1u3aJYbkCV4oPPq+JzqKyxPU/N6g+sv8PuS6VSbWtBmO71EcZ3QVymVhCtlo
 qjIaEb+/iC68dcXGm9wEQ/ZTOVEQ204pR+3wpucVloW80kqFyZL8TKyYRm8oKQ==
From: =?utf-8?q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29?=
 <alexis.lothore@bootlin.com>
Date: Mon, 13 Apr 2026 20:28:42 +0200
MIME-Version: 1.0
Message-Id: <20260413-kasan-v1-2-1a5831230821@bootlin.com>
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
Subject: [Linux-stm32] [PATCH RFC bpf-next 2/8] bpf: mark instructions
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
	NEURAL_HAM(-0.00)[-0.931];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: AD75D3F204D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SW4gb3JkZXIgdG8gcHJlcGFyZSB0byBlbWl0IEtBU0FOIGNoZWNrcyBpbiBKSVRlZCBwcm9ncmFt
cywgSklUCmNvbXBpbGVycyBuZWVkIHRvIGJlIGF3YXJlIGFib3V0IHdoZXRoZXIgc29tZSBsb2Fk
L3N0b3JlIGluc3RydWN0aW9ucwphcmUgdGFyZ2V0aW5nIHRoZSBicGYgcHJvZ3JhbSBzdGFjaywg
YXMgdGhvc2Ugc2hvdWxkIG5vdCBiZSBtb25pdG9yZWQKKHdlIGFscmVhZHkgaGF2ZSBndWFyZCBw
YWdlcyBmb3IgdGhhdCwgYW5kIGl0IGlzIGRpZmZpY3VsdCBhbnl3YXkgdG8KY29ycmVjdGx5IG1v
bml0b3IgYW55IGtpbmQgb2YgZGF0YSBwYXNzZWQgb24gc3RhY2spLgoKVG8gc3VwcG9ydCB0aGlz
IG5lZWQsIG1ha2UgdGhlIEJQRiB2ZXJpZmllciBtYXJrIHRoZSBpbnN0cnVjdGlvbnMgdGhhdAph
Y2Nlc3MgcHJvZ3JhbSBzdGFjazoKLSBhZGQgYSBzZXR0ZXIgdGhhdCBhbGxvd3MgdGhlIHZlcmlm
aWVyIHRvIG1hcmsgaW5zdHJ1Y3Rpb25zIGFjY2Vzc2luZwogIHRoZSBwcm9ncmFtIHN0YWNrCi0g
YWRkIGEgZ2V0dGVyIHRoYXQgYWxsb3dzIEpJVCBjb21waWxlcnMgdG8gY2hlY2sgd2hldGhlciBp
bnN0cnVjdGlvbnMKICBiZWluZyBKSVRlZCBhcmUgYWNjZXNzaW5nIHRoZSBzdGFjawoKU2lnbmVk
LW9mZi1ieTogQWxleGlzIExvdGhvcsOpIChlQlBGIEZvdW5kYXRpb24pIDxhbGV4aXMubG90aG9y
ZUBib290bGluLmNvbT4KLS0tCiBpbmNsdWRlL2xpbnV4L2JwZi5oICAgICAgICAgIHwgIDIgKysK
IGluY2x1ZGUvbGludXgvYnBmX3ZlcmlmaWVyLmggfCAgMiArKwoga2VybmVsL2JwZi9jb3JlLmMg
ICAgICAgICAgICB8IDEwICsrKysrKysrKysKIGtlcm5lbC9icGYvdmVyaWZpZXIuYyAgICAgICAg
fCAgNyArKysrKysrCiA0IGZpbGVzIGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS9pbmNsdWRlL2xpbnV4L2JwZi5oIGIvaW5jbHVkZS9saW51eC9icGYuaAppbmRleCBiNGI3
MDNjOTBjYTkuLjc3NGEwMzk1YzQ5OCAxMDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9icGYuaAor
KysgYi9pbmNsdWRlL2xpbnV4L2JwZi5oCkBAIC0xNTQzLDYgKzE1NDMsOCBAQCB2b2lkIGJwZl9q
aXRfdW5jaGFyZ2VfbW9kbWVtKHUzMiBzaXplKTsKIGJvb2wgYnBmX3Byb2dfaGFzX3RyYW1wb2xp
bmUoY29uc3Qgc3RydWN0IGJwZl9wcm9nICpwcm9nKTsKIGJvb2wgYnBmX2luc25faXNfaW5kaXJl
Y3RfdGFyZ2V0KGNvbnN0IHN0cnVjdCBicGZfdmVyaWZpZXJfZW52ICplbnYsIGNvbnN0IHN0cnVj
dCBicGZfcHJvZyAqcHJvZywKIAkJCQkgaW50IGluc25faWR4KTsKK2Jvb2wgYnBmX2luc25fYWNj
ZXNzZXNfc3RhY2soY29uc3Qgc3RydWN0IGJwZl92ZXJpZmllcl9lbnYgKmVudiwKKwkJCSAgICAg
Y29uc3Qgc3RydWN0IGJwZl9wcm9nICpwcm9nLCBpbnQgaW5zbl9pZHgpOwogI2Vsc2UKIHN0YXRp
YyBpbmxpbmUgaW50IGJwZl90cmFtcG9saW5lX2xpbmtfcHJvZyhzdHJ1Y3QgYnBmX3RyYW1wX2xp
bmsgKmxpbmssCiAJCQkJCSAgIHN0cnVjdCBicGZfdHJhbXBvbGluZSAqdHIsCmRpZmYgLS1naXQg
YS9pbmNsdWRlL2xpbnV4L2JwZl92ZXJpZmllci5oIGIvaW5jbHVkZS9saW51eC9icGZfdmVyaWZp
ZXIuaAppbmRleCBiMTQ4ZjgxNmYyNWIuLmFiOTllZDRjNDIyNyAxMDA2NDQKLS0tIGEvaW5jbHVk
ZS9saW51eC9icGZfdmVyaWZpZXIuaAorKysgYi9pbmNsdWRlL2xpbnV4L2JwZl92ZXJpZmllci5o
CkBAIC02NjAsNiArNjYwLDggQEAgc3RydWN0IGJwZl9pbnNuX2F1eF9kYXRhIHsKIAl1MTYgY29u
c3RfcmVnX21hcF9tYXNrOwogCXUxNiBjb25zdF9yZWdfc3VicHJvZ19tYXNrOwogCXUzMiBjb25z
dF9yZWdfdmFsc1sxMF07CisJLyogaW5zdHJ1Y3Rpb24gYWNjZXNzZXMgc3RhY2sgKi8KKwlib29s
IGFjY2Vzc2VzX3N0YWNrOwogfTsKIAogI2RlZmluZSBNQVhfVVNFRF9NQVBTIDY0IC8qIG1heCBu
dW1iZXIgb2YgbWFwcyBhY2Nlc3NlZCBieSBvbmUgZUJQRiBwcm9ncmFtICovCmRpZmYgLS1naXQg
YS9rZXJuZWwvYnBmL2NvcmUuYyBiL2tlcm5lbC9icGYvY29yZS5jCmluZGV4IDhiMDE4ZmY0ODg3
NS4uMzQwYWJmZGFkYmVkIDEwMDY0NAotLS0gYS9rZXJuZWwvYnBmL2NvcmUuYworKysgYi9rZXJu
ZWwvYnBmL2NvcmUuYwpAQCAtMTU4Miw2ICsxNTgyLDE2IEBAIGJvb2wgYnBmX2luc25faXNfaW5k
aXJlY3RfdGFyZ2V0KGNvbnN0IHN0cnVjdCBicGZfdmVyaWZpZXJfZW52ICplbnYsIGNvbnN0IHN0
cnVjCiAJaW5zbl9pZHggKz0gcHJvZy0+YXV4LT5zdWJwcm9nX3N0YXJ0OwogCXJldHVybiBlbnYt
Pmluc25fYXV4X2RhdGFbaW5zbl9pZHhdLmluZGlyZWN0X3RhcmdldDsKIH0KKworYm9vbCBicGZf
aW5zbl9hY2Nlc3Nlc19zdGFjayhjb25zdCBzdHJ1Y3QgYnBmX3ZlcmlmaWVyX2VudiAqZW52LAor
CQkJICAgICBjb25zdCBzdHJ1Y3QgYnBmX3Byb2cgKnByb2csIGludCBpbnNuX2lkeCkKK3sKKwlp
ZiAoIWVudikKKwkJcmV0dXJuIGZhbHNlOworCWluc25faWR4ICs9IHByb2ctPmF1eC0+c3VicHJv
Z19zdGFydDsKKwlyZXR1cm4gZW52LT5pbnNuX2F1eF9kYXRhW2luc25faWR4XS5hY2Nlc3Nlc19z
dGFjazsKK30KKwogI2VuZGlmIC8qIENPTkZJR19CUEZfSklUICovCiAKIC8qIEJhc2UgZnVuY3Rp
b24gZm9yIG9mZnNldCBjYWxjdWxhdGlvbi4gTmVlZHMgdG8gZ28gaW50byAudGV4dCBzZWN0aW9u
LApkaWZmIC0tZ2l0IGEva2VybmVsL2JwZi92ZXJpZmllci5jIGIva2VybmVsL2JwZi92ZXJpZmll
ci5jCmluZGV4IDFlMzZiOWU5MTI3Ny4uN2JjZTRmYjRlNTQwIDEwMDY0NAotLS0gYS9rZXJuZWwv
YnBmL3ZlcmlmaWVyLmMKKysrIGIva2VybmVsL2JwZi92ZXJpZmllci5jCkBAIC0zNTAyLDYgKzM1
MDIsMTEgQEAgc3RhdGljIHZvaWQgbWFya19pbmRpcmVjdF90YXJnZXQoc3RydWN0IGJwZl92ZXJp
Zmllcl9lbnYgKmVudiwgaW50IGlkeCkKIAllbnYtPmluc25fYXV4X2RhdGFbaWR4XS5pbmRpcmVj
dF90YXJnZXQgPSB0cnVlOwogfQogCitzdGF0aWMgdm9pZCBtYXJrX2luc25fYWNjZXNzZXNfc3Rh
Y2soc3RydWN0IGJwZl92ZXJpZmllcl9lbnYgKmVudiwgaW50IGlkeCkKK3sKKwllbnYtPmluc25f
YXV4X2RhdGFbaWR4XS5hY2Nlc3Nlc19zdGFjayA9IHRydWU7Cit9CisKICNkZWZpbmUgTFJfRlJB
TUVOT19CSVRTCTMKICNkZWZpbmUgTFJfU1BJX0JJVFMJNgogI2RlZmluZSBMUl9FTlRSWV9CSVRT
CShMUl9TUElfQklUUyArIExSX0ZSQU1FTk9fQklUUyArIDEpCkBAIC02NDkwLDYgKzY0OTUsOCBA
QCBzdGF0aWMgaW50IGNoZWNrX21lbV9hY2Nlc3Moc3RydWN0IGJwZl92ZXJpZmllcl9lbnYgKmVu
diwgaW50IGluc25faWR4LCB1MzIgcmVnbgogCQllbHNlCiAJCQllcnIgPSBjaGVja19zdGFja193
cml0ZShlbnYsIHJlZ25vLCBvZmYsIHNpemUsCiAJCQkJCQl2YWx1ZV9yZWdubywgaW5zbl9pZHgp
OworCisJCW1hcmtfaW5zbl9hY2Nlc3Nlc19zdGFjayhlbnYsIGluc25faWR4KTsKIAl9IGVsc2Ug
aWYgKHJlZ19pc19wa3RfcG9pbnRlcihyZWcpKSB7CiAJCWlmICh0ID09IEJQRl9XUklURSAmJiAh
bWF5X2FjY2Vzc19kaXJlY3RfcGt0X2RhdGEoZW52LCBOVUxMLCB0KSkgewogCQkJdmVyYm9zZShl
bnYsICJjYW5ub3Qgd3JpdGUgaW50byBwYWNrZXRcbiIpOwoKLS0gCjIuNTMuMAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGlu
ZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9z
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
