Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IbyeNqN732k2UAAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Apr 2026 13:50:59 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 56CA6404069
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Apr 2026 13:50:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F2229C8F293;
	Wed, 15 Apr 2026 11:50:58 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4C1CDC555BE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Apr 2026 18:29:14 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id BC321C5B1AD;
 Mon, 13 Apr 2026 18:29:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 12D465FFB9;
 Mon, 13 Apr 2026 18:29:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C1BDD104504FF; 
 Mon, 13 Apr 2026 20:29:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1776104951; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=EZ9QNHVh4+uhbJNai/qeDRTtUjcNGDJs+CZJDfExdHo=;
 b=tU3LuWoKhbTd/7Bxp1dXOKmfzCbIyM/apO7e06VCsD1jAsO4aLusD9iNvmTwRoTGhYfuwa
 wQZ7Rhbfb4u6sA8kE0gRYqT1AsgMWfuInBNGDoegkt/sWjx5ENCvIIXWwTgo20otsCojZP
 qrlqmy/FI1dRvldQRHMleciN+IrFbLo2xJNLYZvURj2eGuPQxDXbJc0BXHvub1UsIRBf4H
 mkvyg1Tslg616M4ELISPPqoHcW+Kxr1M5uTSiYfx3ITKBUuAg1vOl/i9+jSYHNNg73X48w
 ntFV2SF9Jnvw+i/JAmppuCLNjEJUuRSS7aTexPw9lUZ3mBum9FcJl9syieudEg==
From: =?utf-8?q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29?=
 <alexis.lothore@bootlin.com>
Date: Mon, 13 Apr 2026 20:28:44 +0200
MIME-Version: 1.0
Message-Id: <20260413-kasan-v1-4-1a5831230821@bootlin.com>
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
X-Mailman-Approved-At: Wed, 15 Apr 2026 11:50:57 +0000
Cc: linux-kselftest@vger.kernel.org,
 Bastien Curutchet <bastien.curutchet@bootlin.com>, netdev@vger.kernel.org,
 ebpf@linuxfoundation.org, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-mm@kvack.org,
 =?utf-8?q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29?=
 <alexis.lothore@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 bpf@vger.kernel.org, Xu Kuohai <xukuohai@huawei.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH RFC bpf-next 4/8] bpf,
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
X-Spamd-Result: default: False [6.39 / 15.00];
	DMARC_POLICY_REJECT(2.00)[bootlin.com : SPF not aligned (relaxed),reject];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[bootlin.com:s=dkim];
	DATE_IN_PAST(1.00)[41];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[40];
	FORGED_RECIPIENTS(0.00)[m:ast@kernel.org,m:daniel@iogearbox.net,m:andrii@kernel.org,m:martin.lau@linux.dev,m:eddyz87@gmail.com,m:memxor@gmail.com,m:song@kernel.org,m:yonghong.song@linux.dev,m:jolsa@kernel.org,m:john.fastabend@gmail.com,m:davem@davemloft.net,m:dsahern@kernel.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:shuah@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:ryabinin.a.a@gmail.com,m:glider@google.com,m:andreyknvl@gmail.com,m:dvyukov@google.com,m:vincenzo.frascino@arm.com,m:akpm@linux-foundation.org,m:linux-kselftest@vger.kernel.org,m:bastien.curutchet@bootlin.com,m:netdev@vger.kernel.org,m:ebpf@linuxfoundation.org,m:linux-kernel@vger.kernel.org,m:kasan-dev@googlegroups.com,m:linux-mm@kvack.org,m:alexis.lothore@bootlin.com,m:thomas.petazzoni@bootlin.com,m:bpf@vger.kernel.org,m:xukuohai@huawei.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead
 .org,m:johnfastabend@gmail.com,m:mcoquelinstm32@gmail.com,m:ryabininaa@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[alexis.lothore@bootlin.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_TO(0.00)[kernel.org,iogearbox.net,linux.dev,gmail.com,davemloft.net,redhat.com,alien8.de,linux.intel.com,zytor.com,foss.st.com,google.com,arm.com,linux-foundation.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexis.lothore@bootlin.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[bootlin.com:-];
	NEURAL_HAM(-0.00)[-0.935];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,bootlin.com:mid,bootlin.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 56CA6404069
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
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
aXplIG9mIHRoZSBhY2Nlc3MuCi0gcmVzdG9yZXMgcmVnaXN0ZXJlcwoKVGhlIHNwZWNpYWwgY2Fy
ZSBuZWVkZWQgd2hlbiBpbnNlcnRpbmcgdGhpcyBpbnN0cnVtZW50YXRpb24gY29tZXMgYXQgdGhl
CmNvc3Qgb2YgYSBub24gbmVnbGlnZWFibGUgaW5jcmVhc2UgaW4gSklUZWQgY29kZSBzaXplLiBG
b3IgZXhhbXBsZSwgYQpiYXJlCgogIG1vdiAJMHgwKCVzaSkscmJ4ICMgTG9hZCBpbiByYnggY29u
dGVudCBhdCBhZGRyZXNzIHN0b3JlZCBpbiByc2kKCmJlY29tZXMKCiAgcHVzaCAgICAlcmF4CiAg
cHVzaCAgICAlcmN4CiAgcHVzaCAgICAlcmR4CiAgcHVzaCAgICAlcnNpCiAgcHVzaCAgICAlcmRp
CiAgcHVzaCAgICAlcjgKICBwdXNoICAgICVyOQogIHB1c2ggICAgJXIxMAogIHB1c2ggICAgJXIx
MQogIHN1YiAgICAgJDB4OCwlcnNwCiAgbW92ICAgICAlcnNpLCVyZGkKICBjYWxsICAgIDB4ZmZm
ZmZmZmY4MWRhMGE2MCA8X19hc2FuX2xvYWQ4PgogIGFkZCAgICAgJDB4OCwlcnNwCiAgcG9wICAg
ICAlcjExCiAgcG9wICAgICAlcjEwCiAgcG9wICAgICAlcjkKICBwb3AgICAgICVyOAogIHBvcCAg
ICAgJXJkaQogIHBvcCAgICAgJXJzaQogIHBvcCAgICAgJXJkeAogIHBvcCAgICAgJXJjeAogIHBv
cCAgICAgJXJheAogIG1vdiAgICAgMHgwKCVyc2kpLHJieAoKU2lnbmVkLW9mZi1ieTogQWxleGlz
IExvdGhvcsOpIChlQlBGIEZvdW5kYXRpb24pIDxhbGV4aXMubG90aG9yZUBib290bGluLmNvbT4K
LS0tCiBhcmNoL3g4Ni9uZXQvYnBmX2ppdF9jb21wLmMgfCA5MyArKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA5MyBpbnNlcnRpb25z
KCspCgpkaWZmIC0tZ2l0IGEvYXJjaC94ODYvbmV0L2JwZl9qaXRfY29tcC5jIGIvYXJjaC94ODYv
bmV0L2JwZl9qaXRfY29tcC5jCmluZGV4IGVhOWU3MDdlOGFiZi4uYjkwMTAzYmQwMDgwIDEwMDY0
NAotLS0gYS9hcmNoL3g4Ni9uZXQvYnBmX2ppdF9jb21wLmMKKysrIGIvYXJjaC94ODYvbmV0L2Jw
Zl9qaXRfY29tcC5jCkBAIC0yMCw2ICsyMCwxMCBAQAogI2luY2x1ZGUgPGFzbS91bndpbmQuaD4K
ICNpbmNsdWRlIDxhc20vY2ZpLmg+CiAKKyNpZmRlZiBDT05GSUdfQlBGX0pJVF9LQVNBTgorI2lu
Y2x1ZGUgPGxpbnV4L2thc2FuLmg+CisjZW5kaWYKKwogc3RhdGljIGJvb2wgYWxsX2NhbGxlZV9y
ZWdzX3VzZWRbNF0gPSB7dHJ1ZSwgdHJ1ZSwgdHJ1ZSwgdHJ1ZX07CiAKIHN0YXRpYyB1OCAqZW1p
dF9jb2RlKHU4ICpwdHIsIHUzMiBieXRlcywgdW5zaWduZWQgaW50IGxlbikKQEAgLTEzMDEsNiAr
MTMwNSw5NSBAQCBzdGF0aWMgdm9pZCBlbWl0X3N0b3JlX3N0YWNrX2ltbTY0KHU4ICoqcHByb2cs
IGludCByZWcsIGludCBzdGFja19vZmYsIHU2NCBpbW02NAogCWVtaXRfc3R4KHBwcm9nLCBCUEZf
RFcsIEJQRl9SRUdfRlAsIHJlZywgc3RhY2tfb2ZmKTsKIH0KIAorc3RhdGljIGludCBlbWl0X2th
c2FuX2NoZWNrKHU4ICoqcHByb2csIHUzMiBhZGRyX3JlZywgc3RydWN0IGJwZl9pbnNuICppbnNu
LAorCQkJICAgIHU4ICppcCwgYm9vbCBhY2Nlc3Nlc19zdGFjaykKK3sKKyNpZmRlZiBDT05GSUdf
QlBGX0pJVF9LQVNBTgorCWJvb2wgaXNfd3JpdGUgPSBCUEZfQ0xBU1MoaW5zbi0+Y29kZSkgPT0g
QlBGX1NUWDsKKwl1MzIgYnBmX3NpemUgPSBCUEZfU0laRShpbnNuLT5jb2RlKTsKKwlzMzIgb2Zm
ID0gaW5zbi0+b2ZmOworCXU4ICpwcm9nID0gKnBwcm9nOworCXZvaWQgKmthc2FuX2Z1bmM7CisK
KwlpZiAoYWNjZXNzZXNfc3RhY2spCisJCXJldHVybiAwOworCisJLyogRGVyaXZlIEtBU0FOIGNo
ZWNrIGZ1bmN0aW9uIGZyb20gYWNjZXNzIHR5cGUgYW5kIHNpemUgKi8KKwlzd2l0Y2ggKGJwZl9z
aXplKSB7CisJY2FzZSBCUEZfQjoKKwkJa2FzYW5fZnVuYyA9IGlzX3dyaXRlID8gX19hc2FuX3N0
b3JlMSA6IF9fYXNhbl9sb2FkMTsKKwkJYnJlYWs7CisJY2FzZSBCUEZfSDoKKwkJa2FzYW5fZnVu
YyA9IGlzX3dyaXRlID8gX19hc2FuX3N0b3JlMiA6IF9fYXNhbl9sb2FkMjsKKwkJYnJlYWs7CisJ
Y2FzZSBCUEZfVzoKKwkJa2FzYW5fZnVuYyA9IGlzX3dyaXRlID8gX19hc2FuX3N0b3JlNCA6IF9f
YXNhbl9sb2FkNDsKKwkJYnJlYWs7CisJY2FzZSBCUEZfRFc6CisJCWthc2FuX2Z1bmMgPSBpc193
cml0ZSA/IF9fYXNhbl9zdG9yZTggOiBfX2FzYW5fbG9hZDg7CisJCWJyZWFrOworCWRlZmF1bHQ6
CisJCXJldHVybiAtRUlOVkFMOworCX0KKworCS8qIFNhdmUgcmF4ICovCisJRU1JVDEoMHg1MCk7
CisJLyogU2F2ZSByY3ggKi8KKwlFTUlUMSgweDUxKTsKKwkvKiBTYXZlIHJkeCAqLworCUVNSVQx
KDB4NTIpOworCS8qIFNhdmUgcnNpICovCisJRU1JVDEoMHg1Nik7CisJLyogU2F2ZSByZGkgKi8K
KwlFTUlUMSgweDU3KTsKKwkvKiBTYXZlIHI4ICovCisJRU1JVDIoMHg0MSwgMHg1MCk7CisJLyog
U2F2ZSByOSAqLworCUVNSVQyKDB4NDEsIDB4NTEpOworCS8qIFNhdmUgcjEwICovCisJRU1JVDIo
MHg0MSwgMHg1Mik7CisJLyogU2F2ZSByMTEgKi8KKwlFTUlUMigweDQxLCAweDUzKTsKKwkvKiBX
ZSBoYXZlIHB1c2hlZCA3MiBieXRlcywgcmVhbGlnbiBzdGFjayB0byAxNiBieXRlczogc3ViIHJz
cCwgOCAqLworCUVNSVQ0KDB4NDgsIDB4ODMsIDB4RUMsIDgpOworCisJLyogbW92IHJkaSwgYWRk
cl9yZWcgKi8KKwlFTUlUX21vdihCUEZfUkVHXzEsIGFkZHJfcmVnKTsKKworCS8qIGFkZCByZGks
IG9mZiAoaWYgb2Zmc2V0IGlzIG5vbi16ZXJvKSAqLworCWlmIChvZmYpIHsKKwkJaWYgKGlzX2lt
bTgob2ZmKSkgeworCQkJLyogYWRkIHJkaSwgaW1tOCAqLworCQkJRU1JVDQoMHg0OCwgMHg4Mywg
MHhDNywgKHU4KW9mZik7CisJCX0gZWxzZSB7CisJCQkvKiBhZGQgcmRpLCBpbW0zMiAqLworCQkJ
RU1JVDNfb2ZmMzIoMHg0OCwgMHg4MSwgMHhDNywgb2ZmKTsKKwkJfQorCX0KKworCS8qIEFkanVz
dCBpcCB0byBhY2NvdW50IGZvciB0aGUgaW5zdHJ1bWVudGF0aW9uIGdlbmVyYXRlZCBzbyBmYXIg
Ki8KKwlpcCArPSAocHJvZyAtICpwcHJvZyk7CisJLyogY2FsbCBrYXNhbl9mdW5jICovCisJaWYg
KGVtaXRfY2FsbCgmcHJvZywga2FzYW5fZnVuYywgaXApKQorCQlyZXR1cm4gLUVSQU5HRTsKKwor
CS8qIFJlc3RvcmUgcmVnaXN0ZXJzICovCisJRU1JVDQoMHg0OCwgMHg4MywgMHhDNCwgOCk7CisJ
RU1JVDIoMHg0MSwgMHg1Qik7CisJRU1JVDIoMHg0MSwgMHg1QSk7CisJRU1JVDIoMHg0MSwgMHg1
OSk7CisJRU1JVDIoMHg0MSwgMHg1OCk7CisJRU1JVDEoMHg1Rik7CisJRU1JVDEoMHg1RSk7CisJ
RU1JVDEoMHg1QSk7CisJRU1JVDEoMHg1OSk7CisJRU1JVDEoMHg1OCk7CisKKwkqcHByb2cgPSBw
cm9nOworI2VuZGlmIC8qIENPTkZJR19CUEZfSklUX0tBU0FOICovCisJcmV0dXJuIDA7Cit9CisK
IHN0YXRpYyBpbnQgZW1pdF9hdG9taWNfcm13KHU4ICoqcHByb2csIHUzMiBhdG9taWNfb3AsCiAJ
CQkgICB1MzIgZHN0X3JlZywgdTMyIHNyY19yZWcsIHMxNiBvZmYsIHU4IGJwZl9zaXplKQogewoK
LS0gCjIuNTMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4v
bGlzdGluZm8vbGludXgtc3RtMzIK
