Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MS8sK5HeIWrePwEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 04 Jun 2026 22:22:41 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 53AF26433FB
	for <lists+linux-stm32@lfdr.de>; Thu, 04 Jun 2026 22:22:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=bootlin.com header.s=dkim header.b=DmC5uD7U;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=bootlin.com (policy=reject)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1D1C0C8F275;
	Thu,  4 Jun 2026 20:22:41 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 767CEC8F275
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Jun 2026 20:22:40 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 477A21A07EA;
 Thu,  4 Jun 2026 20:22:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 13DA95FED1;
 Thu,  4 Jun 2026 20:22:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A3C85106A1D2C; 
 Thu,  4 Jun 2026 22:22:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1780604558; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=RfWDnkDwkkfbnuCPMrlh9TY6xMPQgUKPCYmPMT1bj3Y=;
 b=DmC5uD7Ufj+9BtNRuy5VfbgxYZpX1m4cXOJ8liQembdGsvxTu8kssq/pi6HlrhNOWCiWaB
 Tb6vGElU2Vlafl9+fpmnZhj1IaXDxPnt+cjEkjVeABuufocl2HUs3JJhAX2QX+Fj3PpUh3
 g4sZpGl6prt/hZCI+kKP5oS5xY9j0fSYd/Df7hfxqJwlzL0ITG/Z+Ixck7kHpjniNJIMEW
 wt6XfQs3M8gOKP26Y0CMmp/njdD+dyBiKSyFGOMe9GdVDbeYaON6mF9aeyzZjvKbYbgGRJ
 VOkK+/Va/TqY9jKJhpOc2+P4SHS6KNoJZSMU+c85ZaJQKneIcU9Zyt9Gp8xb+A==
From: =?utf-8?q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29?=
 <alexis.lothore@bootlin.com>
Date: Thu, 04 Jun 2026 22:22:02 +0200
MIME-Version: 1.0
Message-Id: <20260604-kasan-v2-4-c066e627fda8@bootlin.com>
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
Subject: [Linux-stm32] [PATCH bpf-next v2 4/8] bpf,
 x86: refactor BPF_ST management in do_jit
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:from_smtp,st-md-mailman.stormreply.com:rdns,bootlin.com:mid,bootlin.com:from_mime,bootlin.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 53AF26433FB

SW4gb3JkZXIgdG8gcHJlcGFyZSBmb3IgS0FTQU4gY2hlY2tzIGluc2VydGlvbiBiZWZvcmUgZXZl
cnkKbWVtb3J5LXJlbGF0ZWQgbG9hZCBvciBzdG9yZSwgZ3JvdXAgYWxsIEJQRl9TVCBpbnN0cnVj
dGlvbnMgdGhhdCBpbmRlZWQKYWNjZXNzIG1lbW9yeSBpbiBhIHNpbmdsZSBibG9jayBvZiBmYWxs
LXRocm91Z2ggY2FzZXMgdG8gYWxsb3cKaW5zdHJ1bWVudGluZyB0aG9zZSBpbiBvbmUgY2FsbCwg
cmF0aGVyIHRoYW4gaGF2aW5nIHRvIGluc3RydW1lbnQgYWxsCmNhc2VzIGluZGl2aWR1YWxseS4K
ClNpZ25lZC1vZmYtYnk6IEFsZXhpcyBMb3Rob3LDqSAoZUJQRiBGb3VuZGF0aW9uKSA8YWxleGlz
LmxvdGhvcmVAYm9vdGxpbi5jb20+Ci0tLQogYXJjaC94ODYvbmV0L2JwZl9qaXRfY29tcC5jIHwg
NTMgKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgMzEgaW5zZXJ0aW9ucygrKSwgMjIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
YXJjaC94ODYvbmV0L2JwZl9qaXRfY29tcC5jIGIvYXJjaC94ODYvbmV0L2JwZl9qaXRfY29tcC5j
CmluZGV4IDA5ODE3OTEwMTRlYi4uOTQzYTBmMzE1Y2YyIDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9u
ZXQvYnBmX2ppdF9jb21wLmMKKysrIGIvYXJjaC94ODYvbmV0L2JwZl9qaXRfY29tcC5jCkBAIC0y
MzAwLDQxICsyMzAwLDUwIEBAIHN0YXRpYyBpbnQgZG9faml0KHN0cnVjdCBicGZfdmVyaWZpZXJf
ZW52ICplbnYsIHN0cnVjdCBicGZfcHJvZyAqYnBmX3Byb2csIGludCAqCiAJCQlFTUlUX0xGRU5D
RSgpOwogCQkJYnJlYWs7CiAKLQkJCS8qIFNUOiAqKHU4KikoZHN0X3JlZyArIG9mZikgPSBpbW0g
Ki8KIAkJY2FzZSBCUEZfU1QgfCBCUEZfTUVNIHwgQlBGX0I6Ci0JCQlpZiAoaXNfZXJlZyhkc3Rf
cmVnKSkKLQkJCQlFTUlUMigweDQxLCAweEM2KTsKLQkJCWVsc2UKLQkJCQlFTUlUMSgweEM2KTsK
LQkJCWdvdG8gc3Q7CiAJCWNhc2UgQlBGX1NUIHwgQlBGX01FTSB8IEJQRl9IOgotCQkJaWYgKGlz
X2VyZWcoZHN0X3JlZykpCi0JCQkJRU1JVDMoMHg2NiwgMHg0MSwgMHhDNyk7Ci0JCQllbHNlCi0J
CQkJRU1JVDIoMHg2NiwgMHhDNyk7Ci0JCQlnb3RvIHN0OwogCQljYXNlIEJQRl9TVCB8IEJQRl9N
RU0gfCBCUEZfVzoKLQkJCWlmIChpc19lcmVnKGRzdF9yZWcpKQotCQkJCUVNSVQyKDB4NDEsIDB4
QzcpOwotCQkJZWxzZQotCQkJCUVNSVQxKDB4QzcpOwotCQkJZ290byBzdDsKIAkJY2FzZSBCUEZf
U1QgfCBCUEZfTUVNIHwgQlBGX0RXOgotCQkJaWYgKGRzdF9yZWcgPT0gQlBGX1JFR19QQVJBTVMg
JiYgaW5zbi0+b2ZmID09IC04KSB7Ci0JCQkJLyogQXJnIDY6IHN0b3JlIGltbWVkaWF0ZSBpbiBy
OSByZWdpc3RlciAqLwotCQkJCWVtaXRfbW92X2ltbTY0KCZwcm9nLCBYODZfUkVHX1I5LCBpbW0z
MiA+PiAzMSwgKHUzMilpbW0zMik7CisJCQlzd2l0Y2ggKEJQRl9TSVpFKGluc24tPmNvZGUpKSB7
CisJCQljYXNlIEJQRl9COgorCQkJCWlmIChpc19lcmVnKGRzdF9yZWcpKQorCQkJCQlFTUlUMigw
eDQxLCAweEM2KTsKKwkJCQllbHNlCisJCQkJCUVNSVQxKDB4QzYpOworCQkJCWJyZWFrOworCQkJ
Y2FzZSBCUEZfSDoKKwkJCQlpZiAoaXNfZXJlZyhkc3RfcmVnKSkKKwkJCQkJRU1JVDMoMHg2Niwg
MHg0MSwgMHhDNyk7CisJCQkJZWxzZQorCQkJCQlFTUlUMigweDY2LCAweEM3KTsKKwkJCQlicmVh
azsKKwkJCWNhc2UgQlBGX1c6CisJCQkJaWYgKGlzX2VyZWcoZHN0X3JlZykpCisJCQkJCUVNSVQy
KDB4NDEsIDB4QzcpOworCQkJCWVsc2UKKwkJCQkJRU1JVDEoMHhDNyk7CisJCQkJYnJlYWs7CisJ
CQljYXNlIEJQRl9EVzoKKwkJCQlpZiAoZHN0X3JlZyA9PSBCUEZfUkVHX1BBUkFNUyAmJgorCQkJ
CSAgICBpbnNuLT5vZmYgPT0gLTgpIHsKKwkJCQkJLyogQXJnIDY6IHN0b3JlIGltbWVkaWF0ZSBp
biByOSByZWdpc3RlciAqLworCQkJCQllbWl0X21vdl9pbW02NCgmcHJvZywgWDg2X1JFR19SOSwK
KwkJCQkJCSAgICAgICBpbW0zMiA+PiAzMSwgKHUzMilpbW0zMik7CisJCQkJCWJyZWFrOworCQkJ
CX0KKwkJCQlFTUlUMihhZGRfMW1vZCgweDQ4LCBkc3RfcmVnKSwgMHhDNyk7CiAJCQkJYnJlYWs7
CiAJCQl9Ci0JCQlFTUlUMihhZGRfMW1vZCgweDQ4LCBkc3RfcmVnKSwgMHhDNyk7CiAKLXN0OgkJ
CWluc25fb2ZmID0gaW5zbi0+b2ZmOworCQkJaW5zbl9vZmYgPSBpbnNuLT5vZmY7CiAJCQlpZiAo
ZHN0X3JlZyA9PSBCUEZfUkVHX1BBUkFNUykgewogCQkJCS8qCiAJCQkJICogQXJncyA3KzogcmV2
ZXJzZSBCUEYgbmVnYXRpdmUgb2Zmc2V0cyB0bwogCQkJCSAqIHg4NiBwb3NpdGl2ZSByc3Agb2Zm
c2V0cy4KIAkJCQkgKiBCUEYgb2ZmPS0xNiDihpIgW3JzcCswXSwgb2ZmPS0yNCDihpIgW3JzcCs4
XSwgLi4uCiAJCQkJICovCi0JCQkJaW5zbl9vZmYgPSBvdXRnb2luZ19hcmdfYmFzZSAtIG91dGdv
aW5nX3JzcCAtIGluc25fb2ZmIC0gMTY7CisJCQkJaW5zbl9vZmYgPSBvdXRnb2luZ19hcmdfYmFz
ZSAtIG91dGdvaW5nX3JzcCAtCisJCQkJCSAgIGluc25fb2ZmIC0gMTY7CiAJCQkJZHN0X3JlZyA9
IEJQRl9SRUdfRlA7CiAJCQl9CiAJCQlpZiAoaXNfaW1tOChpbnNuX29mZikpCgotLSAKMi41NC4w
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1z
dG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9s
aW51eC1zdG0zMgo=
