Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kHhRLfc13Wl9agkAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Apr 2026 20:29:11 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 853413F205E
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Apr 2026 20:29:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4E06AC2909A;
	Mon, 13 Apr 2026 18:29:11 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7524BC01FB5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Apr 2026 18:29:09 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id E733CC5B1AF;
 Mon, 13 Apr 2026 18:29:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 40C755FFB9;
 Mon, 13 Apr 2026 18:29:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8D5D4104504DF; 
 Mon, 13 Apr 2026 20:29:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1776104947; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Y5yh+jPLjYdbpM+lAMSIEbKZx9jBkdUNIqhhBJUSD7U=;
 b=o44sVXLepMBqSnOEDpzehWYEkyLJ277S4ZD0mX5x0/hGbON8nbocYIKweTKmZgSaODHeop
 Gk1QZ0KlMKDF6U1D/i7rG0MsPoJurHcz2wDn/C9O4mxht3VdU9u8za91gWE95CrtwzSa2w
 o2xxrib2bvulpRAYCkWrLZAtfAw9kTqQn74z1/EQj7LuL/TVuTGJM10yXYkNFUqAiZGL5L
 CMOT2PZnOSIQuXQLtFWLrdTzAkeZuuzxsF2HCU5UG2JVuExsPqUjNkFb/FdLta7lUaCx8Y
 XLZbAmvi9zcDbQVvjBohG/kgnUmIxAsfWXAYZsXwpmK2NQb3P7FKaD7qaDJQrQ==
From: =?utf-8?q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29?=
 <alexis.lothore@bootlin.com>
Date: Mon, 13 Apr 2026 20:28:43 +0200
MIME-Version: 1.0
Message-Id: <20260413-kasan-v1-3-1a5831230821@bootlin.com>
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
Subject: [Linux-stm32] [PATCH RFC bpf-next 3/8] bpf: add BPF_JIT_KASAN for
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
	NEURAL_HAM(-0.00)[-0.939];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 853413F205E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

QWRkIGEgbmV3IEtjb25maWcgb3B0aW9uIENPTkZJR19CUEZfSklUX0tBU0FOIHRoYXQgYXV0b21h
dGljYWxseSBlbmFibGVzCktBU0FOIChLZXJuZWwgQWRkcmVzcyBTYW5pdGl6ZXIpIG1lbW9yeSBh
Y2Nlc3MgY2hlY2tzIGZvciBKSVQtY29tcGlsZWQKQlBGIHByb2dyYW1zLCB3aGVuIGJvdGggS0FT
QU4gYW5kIEpJVCBjb21waWxlciBhcmUgZW5hYmxlZC4gV2hlbgplbmFibGVkLCB0aGUgSklUIGNv
bXBpbGVyIHdpbGwgZW1pdCBzaGFkb3cgbWVtb3J5IGNoZWNrcyBiZWZvcmUgbWVtb3J5CmxvYWRz
IGFuZCBzdG9yZXMgdG8gZGV0ZWN0IHVzZS1hZnRlci1mcmVlLCBvdXQtb2YtYm91bmRzLCBhbmQg
b3RoZXIKbWVtb3J5IHNhZmV0eSBidWdzIGF0IHJ1bnRpbWUuIFRoZSBvcHRpb24gaXMgZ2F0ZWQg
YmVoaW5kCkhBVkVfRUJQRl9KSVRfS0FTQU4sIGFzIGl0IG5lZWRzIHByb3BlciBhcmNoLXNwZWNp
ZmljIGltcGxlbWVudGF0aW9uLgoKU2lnbmVkLW9mZi1ieTogQWxleGlzIExvdGhvcsOpIChlQlBG
IEZvdW5kYXRpb24pIDxhbGV4aXMubG90aG9yZUBib290bGluLmNvbT4KLS0tCiBrZXJuZWwvYnBm
L0tjb25maWcgfCA5ICsrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKQoK
ZGlmZiAtLWdpdCBhL2tlcm5lbC9icGYvS2NvbmZpZyBiL2tlcm5lbC9icGYvS2NvbmZpZwppbmRl
eCBlYjNkZTM1NzM0ZjAuLjI4MzkyYWRiM2Q3ZSAxMDA2NDQKLS0tIGEva2VybmVsL2JwZi9LY29u
ZmlnCisrKyBiL2tlcm5lbC9icGYvS2NvbmZpZwpAQCAtMTcsNiArMTcsMTAgQEAgY29uZmlnIEhB
VkVfQ0JQRl9KSVQKIGNvbmZpZyBIQVZFX0VCUEZfSklUCiAJYm9vbAogCisjIEtBU0FOIHN1cHBv
cnQgZm9yIEpJVCBjb21waWxlcgorY29uZmlnIEhBVkVfRUJQRl9KSVRfS0FTQU4KKwlib29sCisK
ICMgVXNlZCBieSBhcmNocyB0byB0ZWxsIHRoYXQgdGhleSB3YW50IHRoZSBCUEYgSklUIGNvbXBp
bGVyIGVuYWJsZWQgYnkKICMgZGVmYXVsdCBmb3Iga2VybmVscyB0aGF0IHdlcmUgY29tcGlsZWQg
d2l0aCBCUEYgSklUIHN1cHBvcnQuCiBjb25maWcgQVJDSF9XQU5UX0RFRkFVTFRfQlBGX0pJVApA
QCAtMTAxLDQgKzEwNSw5IEBAIGNvbmZpZyBCUEZfTFNNCiAKIAkgIElmIHlvdSBhcmUgdW5zdXJl
IGhvdyB0byBhbnN3ZXIgdGhpcyBxdWVzdGlvbiwgYW5zd2VyIE4uCiAKK2NvbmZpZyBCUEZfSklU
X0tBU0FOCisJYm9vbAorCWRlcGVuZHMgb24gSEFWRV9FQlBGX0pJVF9LQVNBTgorCWRlZmF1bHQg
eSBpZiBCUEZfSklUICYmIEtBU0FOX0dFTkVSSUMKKwogZW5kbWVudSAjICJCUEYgc3Vic3lzdGVt
IgoKLS0gCjIuNTMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxt
YW4vbGlzdGluZm8vbGludXgtc3RtMzIK
