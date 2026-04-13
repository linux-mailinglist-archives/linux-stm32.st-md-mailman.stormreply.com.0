Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EKrBM6N732nFTgAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Apr 2026 13:50:59 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 56433404068
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Apr 2026 13:50:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DA61EC8F286;
	Wed, 15 Apr 2026 11:50:58 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 33BB5C3F944
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Apr 2026 18:29:02 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 9FEB0C5B1AC;
 Mon, 13 Apr 2026 18:29:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E99BB5FFB9;
 Mon, 13 Apr 2026 18:29:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DE28C104504C2; 
 Mon, 13 Apr 2026 20:28:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1776104939; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=J6w/vm8RhE1QibuAbeZrZpu+mbFZf/j6v7Old22bTNI=;
 b=cZBSYs587EC2pPG0T0zWnt6Rm3YWgLoLQHo/fERZmvyCcXnMbHG6UHv4UW2EhRe6AcwwK4
 rLJqLN0QcpxJ+eU2wnigOQQIs5tEOULYPsd1eLcu1LilosOrM1UCnTdfl+hYwGPMfNEMV/
 /5Ph0br4h41uQYEnh8/FBrJsTvpWOM11sOt/QM2ZTP7geak6StbyhdakN5Z/m5BxbpCjin
 o8OFL6dggWmiW+3fP5D/aD3dYrcXLqeqZdzncuDbmqmu9QPwy6ZHA14bp/bp5laVHfSfBf
 7xNDlnmSlRRrNNIRvXgvQWAu27n6dhrzs7GZ2IUSyjAbZY1p1dja0IfA16reIg==
From: =?utf-8?q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29?=
 <alexis.lothore@bootlin.com>
Date: Mon, 13 Apr 2026 20:28:41 +0200
MIME-Version: 1.0
Message-Id: <20260413-kasan-v1-1-1a5831230821@bootlin.com>
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
Subject: [Linux-stm32] [PATCH RFC bpf-next 1/8] kasan: expose generic kasan
	helpers
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
	NEURAL_HAM(-0.00)[-0.919];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,bootlin.com:mid,bootlin.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 56433404068
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spam: Yes

SW4gb3JkZXIgdG8gcHJlcGFyZSBLQVNBTiBoZWxwZXJzIHRvIGJlIGNhbGxlZCBmcm9tIHRoZSBl
QlBGIHN1YnN5c3RlbQoodG8gYWRkIEtBU0FOIGluc3RydW1lbnRhdGlvbiBhdCBydW50aW1lIHdo
ZW4gSklUaW5nIGVCUEYgcHJvZ3JhbXMpLApleHBvc2UgdGhlIF9fYXNhbl97bG9hZCxzdG9yZX1Y
IGZ1bmN0aW9ucyBpbiBsaW51eC9rYXNhbi5oCgpTaWduZWQtb2ZmLWJ5OiBBbGV4aXMgTG90aG9y
w6kgKGVCUEYgRm91bmRhdGlvbikgPGFsZXhpcy5sb3Rob3JlQGJvb3RsaW4uY29tPgotLS0KIGlu
Y2x1ZGUvbGludXgva2FzYW4uaCB8IDEzICsrKysrKysrKysrKysKIG1tL2thc2FuL2thc2FuLmgg
ICAgICB8IDEwIC0tLS0tLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwg
MTAgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9rYXNhbi5oIGIvaW5j
bHVkZS9saW51eC9rYXNhbi5oCmluZGV4IDMzOGExOTIxYTUwYS4uNmY1ODBkNGEzOWU0IDEwMDY0
NAotLS0gYS9pbmNsdWRlL2xpbnV4L2thc2FuLmgKKysrIGIvaW5jbHVkZS9saW51eC9rYXNhbi5o
CkBAIC03MTAsNCArNzEwLDE3IEBAIHZvaWQga2FzYW5fbm9uX2Nhbm9uaWNhbF9ob29rKHVuc2ln
bmVkIGxvbmcgYWRkcik7CiBzdGF0aWMgaW5saW5lIHZvaWQga2FzYW5fbm9uX2Nhbm9uaWNhbF9o
b29rKHVuc2lnbmVkIGxvbmcgYWRkcikgeyB9CiAjZW5kaWYgLyogQ09ORklHX0tBU0FOX0dFTkVS
SUMgfHwgQ09ORklHX0tBU0FOX1NXX1RBR1MgKi8KIAorI2lmZGVmIENPTkZJR19LQVNBTl9HRU5F
UklDCit2b2lkIF9fYXNhbl9sb2FkMSh2b2lkICpwKTsKK3ZvaWQgX19hc2FuX3N0b3JlMSh2b2lk
ICpwKTsKK3ZvaWQgX19hc2FuX2xvYWQyKHZvaWQgKnApOwordm9pZCBfX2FzYW5fc3RvcmUyKHZv
aWQgKnApOwordm9pZCBfX2FzYW5fbG9hZDQodm9pZCAqcCk7Cit2b2lkIF9fYXNhbl9zdG9yZTQo
dm9pZCAqcCk7Cit2b2lkIF9fYXNhbl9sb2FkOCh2b2lkICpwKTsKK3ZvaWQgX19hc2FuX3N0b3Jl
OCh2b2lkICpwKTsKK3ZvaWQgX19hc2FuX2xvYWQxNih2b2lkICpwKTsKK3ZvaWQgX19hc2FuX3N0
b3JlMTYodm9pZCAqcCk7CisjZW5kaWYgLyogQ09ORklHX0tBU0FOX0dFTkVSSUMgKi8KKwogI2Vu
ZGlmIC8qIExJTlVYX0tBU0FOX0ggKi8KZGlmZiAtLWdpdCBhL21tL2thc2FuL2thc2FuLmggYi9t
bS9rYXNhbi9rYXNhbi5oCmluZGV4IGZjOTE2OWE1NDc2Ni4uM2JmY2U4ZWIzMTM1IDEwMDY0NAot
LS0gYS9tbS9rYXNhbi9rYXNhbi5oCisrKyBiL21tL2thc2FuL2thc2FuLmgKQEAgLTU5NCwxNiAr
NTk0LDYgQEAgdm9pZCBfX2FzYW5faGFuZGxlX25vX3JldHVybih2b2lkKTsKIHZvaWQgX19hc2Fu
X2FsbG9jYV9wb2lzb24odm9pZCAqLCBzc2l6ZV90IHNpemUpOwogdm9pZCBfX2FzYW5fYWxsb2Nh
c191bnBvaXNvbih2b2lkICpzdGFja190b3AsIHNzaXplX3Qgc3RhY2tfYm90dG9tKTsKIAotdm9p
ZCBfX2FzYW5fbG9hZDEodm9pZCAqKTsKLXZvaWQgX19hc2FuX3N0b3JlMSh2b2lkICopOwotdm9p
ZCBfX2FzYW5fbG9hZDIodm9pZCAqKTsKLXZvaWQgX19hc2FuX3N0b3JlMih2b2lkICopOwotdm9p
ZCBfX2FzYW5fbG9hZDQodm9pZCAqKTsKLXZvaWQgX19hc2FuX3N0b3JlNCh2b2lkICopOwotdm9p
ZCBfX2FzYW5fbG9hZDgodm9pZCAqKTsKLXZvaWQgX19hc2FuX3N0b3JlOCh2b2lkICopOwotdm9p
ZCBfX2FzYW5fbG9hZDE2KHZvaWQgKik7Ci12b2lkIF9fYXNhbl9zdG9yZTE2KHZvaWQgKik7CiB2
b2lkIF9fYXNhbl9sb2FkTih2b2lkICosIHNzaXplX3Qgc2l6ZSk7CiB2b2lkIF9fYXNhbl9zdG9y
ZU4odm9pZCAqLCBzc2l6ZV90IHNpemUpOwogCgotLSAKMi41My4wCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QK
TGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
