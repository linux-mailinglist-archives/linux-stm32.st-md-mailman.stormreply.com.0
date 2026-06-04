Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id z0CwFoveIWrcPwEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 04 Jun 2026 22:22:35 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 345796433F7
	for <lists+linux-stm32@lfdr.de>; Thu, 04 Jun 2026 22:22:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=bootlin.com header.s=dkim header.b=W43bDU6s;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=bootlin.com (policy=reject)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F093EC8F275;
	Thu,  4 Jun 2026 20:22:34 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BCA26C8F271
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  4 Jun 2026 20:22:33 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 85A301A07A0;
 Thu,  4 Jun 2026 20:22:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 515805FED1;
 Thu,  4 Jun 2026 20:22:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A8066106A1D0E; 
 Thu,  4 Jun 2026 22:22:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1780604551; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=JWdw38EiI9Mq6OhPMl4z+SwTGgKYfom6pjkQ6/P5SXE=;
 b=W43bDU6svXn0gZBV6DoqwOqs70uuSW0/XAyd2Q078jgcmbCzxIVTV2GdZ088o38TOj3oJ5
 4WAEW3fsczlFsEm5sGkFHT1clJKkfTDLxlfeQSVs/WLMsdKg2uWpFbiv0chnu4U+NBXTBZ
 0GAbixyfx8SqaMATSvIiSEL2CugVww/xt2ulqMPJ2kv74PE3oGqpm6lykWwUklGQPeAjVk
 /bMTlpyI/FubabCtktk0KuDFD++Q7gcMqaD3VIQg5VtuBKLk85tR/Mb6F1uOr0QnTsSb3Q
 s9kuqKANfXlFUoXBE7gH/IflXPCLYJu0Lw65kC/e4YUrHE0hndD9YUlHuj7F/Q==
From: =?utf-8?q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29?=
 <alexis.lothore@bootlin.com>
Date: Thu, 04 Jun 2026 22:22:00 +0200
MIME-Version: 1.0
Message-Id: <20260604-kasan-v2-2-c066e627fda8@bootlin.com>
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
Subject: [Linux-stm32] [PATCH bpf-next v2 2/8] bpf: add BPF_JIT_KASAN for
 KASAN instrumentation of JITed programs
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
X-Rspamd-Queue-Id: 345796433F7

QWRkIGEgbmV3IEtjb25maWcgb3B0aW9uIENPTkZJR19CUEZfSklUX0tBU0FOIHRoYXQgYXV0b21h
dGljYWxseSBlbmFibGVzCmdlbmVyaWMgS0FTQU4gKEtlcm5lbCBBZGRyZXNzIFNBTml0aXplcikg
bWVtb3J5IGFjY2VzcyBjaGVja3MgZm9yCkpJVC1jb21waWxlZCBCUEYgcHJvZ3JhbXMgYXMgd2Vs
bCwgd2hlbiBib3RoIEtBU0FOX0dFTkVSSUMgYW5kIEpJVApjb21waWxlciBhcmUgZW5hYmxlZC4g
VGhpcyBuZXcgS2NvbmZpZyBpcyBub3QgYSB1c2VyIHNlbGVjdGFibGUgb25lOiBpdAppcyBlaXRo
ZXIgYXV0b21hdGljYWxseSBlbmFibGVkIGlmIEtBU0FOIGlzIGVuYWJsZWQgb24gYSBjb21wYXRp
YmxlCnBsYXRmb3JtLCBvciBkaXNhYmxlZC4gV2hlbiBlbmFibGVkLCB0aGUgSklUIGNvbXBpbGVy
IHdpbGwgZW1pdCBzaGFkb3cKbWVtb3J5IGNoZWNrcyBiZWZvcmUgbWVtb3J5IGxvYWRzIGFuZCBz
dG9yZXMgdG8gZGV0ZWN0IHVzZS1hZnRlci1mcmVlIG9yCm91dC1vZi1ib3VuZHMgYWNjZXNzZXMg
YXQgcnVudGltZS4gVGhlIG9wdGlvbiBpcyBnYXRlZCBiZWhpbmQKSEFWRV9FQlBGX0pJVF9LQVNB
TiwgYXMgaXQgbmVlZHMgcHJvcGVyIGFyY2gtc3BlY2lmaWMgaW1wbGVtZW50YXRpb24uCgpBcyBL
QVNBTiBpbnN0cnVtZW50YXRpb24gZm9yIGVCUEYgcHJvZ3JhbSB3aWxsIGRlcGVuZCBvbiB0aGUg
aW5mbyB0aGF0CmNhbiBiZSBhY2Nlc3NlZCBkdXJpbmcgZWFjaCBpbnN0cnVjdGlvbiB2ZXJpZmlj
YXRpb24sIHRoZXJlIG1heSBiZQppbnN0cnVjdGlvbnMgdGhhdCB3aWxsIGJlIGluc3RydW1lbnRl
ZCBldmVuIGlmIHRoZXkgZG9uJ3QgcmVhbGx5IG5lZWQgdG8KKGVnOiBnbG9iYWwgc3VicHJvZ3Jh
bXMgdGhhdCBhY2Nlc3MgY2FsbGVyIHN0YWNrIG1lbW9yeSBwYXNzZWQgYXMKYXJndW1lbnQpLiBU
byBtYWtlIHN1cmUgdGhhdCB0aG9zZSBhZGRpdGlvbmFsIGNoZWNrcyBkbyBub3QgdHJpZ2dlciBh
bnkKY3Jhc2gsIG1ha2Ugc3VyZSB0aGF0IFZNQVBfU1RBQ0sgaXMgZW5hYmxlZCBzbyB0aGF0IHBy
b2dyYW1zIHN0YWNrIGhhcwpzaGFkb3cgbWVtb3J5IGFsbG9jYXRlZC4KClNpZ25lZC1vZmYtYnk6
IEFsZXhpcyBMb3Rob3LDqSAoZUJQRiBGb3VuZGF0aW9uKSA8YWxleGlzLmxvdGhvcmVAYm9vdGxp
bi5jb20+Ci0tLQpDaGFuZ2VzIGluIHYyOgotIGFkZCBkZXBlbmRlbmN5IG9uIGthc2FuIGZvciB2
bWFsbG9jIGFuZCB2bWFsbG9jJ2VkIHN0YWNrCi0tLQoga2VybmVsL2JwZi9LY29uZmlnIHwgOSAr
KysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9r
ZXJuZWwvYnBmL0tjb25maWcgYi9rZXJuZWwvYnBmL0tjb25maWcKaW5kZXggZWIzZGUzNTczNGYw
Li5hOGUwMDRmODhiOTIgMTAwNjQ0Ci0tLSBhL2tlcm5lbC9icGYvS2NvbmZpZworKysgYi9rZXJu
ZWwvYnBmL0tjb25maWcKQEAgLTE3LDYgKzE3LDEwIEBAIGNvbmZpZyBIQVZFX0NCUEZfSklUCiBj
b25maWcgSEFWRV9FQlBGX0pJVAogCWJvb2wKIAorIyBLQVNBTiBzdXBwb3J0IGZvciBKSVQgY29t
cGlsZXIKK2NvbmZpZyBIQVZFX0VCUEZfSklUX0tBU0FOCisJYm9vbAorCiAjIFVzZWQgYnkgYXJj
aHMgdG8gdGVsbCB0aGF0IHRoZXkgd2FudCB0aGUgQlBGIEpJVCBjb21waWxlciBlbmFibGVkIGJ5
CiAjIGRlZmF1bHQgZm9yIGtlcm5lbHMgdGhhdCB3ZXJlIGNvbXBpbGVkIHdpdGggQlBGIEpJVCBz
dXBwb3J0LgogY29uZmlnIEFSQ0hfV0FOVF9ERUZBVUxUX0JQRl9KSVQKQEAgLTEwMSw0ICsxMDUs
OSBAQCBjb25maWcgQlBGX0xTTQogCiAJICBJZiB5b3UgYXJlIHVuc3VyZSBob3cgdG8gYW5zd2Vy
IHRoaXMgcXVlc3Rpb24sIGFuc3dlciBOLgogCitjb25maWcgQlBGX0pJVF9LQVNBTgorCWJvb2wK
KwlkZXBlbmRzIG9uIEhBVkVfRUJQRl9KSVRfS0FTQU4KKwlkZWZhdWx0IHkgaWYgQlBGX0pJVCAm
JiBLQVNBTl9HRU5FUklDICYmIEtBU0FOX1ZNQUxMT0MgJiYgVk1BUF9TVEFDSworCiBlbmRtZW51
ICMgIkJQRiBzdWJzeXN0ZW0iCgotLSAKMi41NC4wCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3Rt
MzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
