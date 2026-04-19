Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id /JZhOKKG72n/CAEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Apr 2026 17:54:10 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5384759C9
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Apr 2026 17:54:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 605E0C57B41;
	Mon, 27 Apr 2026 15:54:09 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B7813C87EDB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 19 Apr 2026 22:51:40 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-43cfbd17589so1754351f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 19 Apr 2026 15:51:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776639100; cv=none;
 d=google.com; s=arc-20240605;
 b=NbTmBlTIKAdicO2z2OFvjKxHNvc4jlQk5HoUv9fAgb15irBY7Z8vZQJz06Z1V1U9Ak
 OP38GhQZbNW/8ZjX3894FRQafDABBkIEg6D/FZ/STVDYICCkSaN1sfWnZBWdbfWOBv1B
 Yw33dZovlmO4nBltkTqyl7DK8XLmFlvskk+bwwj7RIKn/2YYmyRDnFtk4GcHDPtZ8vBX
 m2O8a27Umx5Lv+n4mll8VoJwyE/G1mjXSjzUG4aKtcrJigADYolSZKjRv9+4r9JnIGjK
 aCwyD5gvPzhVoarhGmRhHZik7w+R78C/a1xfaKWwBDlmgVYQxzLfV6tjH81ysdND5jik
 EyQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=nGI8q1vIW2YCqL8DB2swQpMBunXNj9M7QpTu5vxe99c=;
 fh=6x2v/1CTX8yTH1xJZNy/9CK5kRo0x2fgCY5hZ8mYd+4=;
 b=X09xdHvps12ZpxdMNAfnQLoI8TML8yTT+A2ET30Zz4wlM8RKR+u+6sUCymj3XEpt1C
 iMMYtSUI03nFGXsOIKMaeDPLwQ/PCm2eDqN8dZ2eeQ2lwIPoiQNaTnUd2wJyk0OKJJiF
 1MT3Fz+6pK0Jsc4AeD6r9SogyCjvSTT1QsVzAHA9itqr/whnBhgGgPjga+lBOYTgpP5K
 W9lnCKukD/A9bgWkGGyVjKMm4g+hYanQtt+c52D3agkvAFPBhXMLhldspE9H6oly+0Nh
 PlXHDypL2SZFoGJxClkx1cuyJKlnbzb7k2yR4MSISmScUvhd0Gw//uJzh0m+gh+dOuBO
 LwEg==; darn=st-md-mailman.stormreply.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776639100; x=1777243900;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nGI8q1vIW2YCqL8DB2swQpMBunXNj9M7QpTu5vxe99c=;
 b=hCNUcDpgo0q8qFA4kZcsa8fmL8A3w3dLsV0AISLmzyxxxqzY3NOq9ely6bGtxON9wT
 IfMXLY0MMVfblroR4pkuJbRQFsE5vpF2E2EGNiU1ghk1vHPFeCRVhzLMZ2UQ/JTHnXDr
 m2AEml4czpXwNbT4u/YyLYotTz4i6d9bZoWZdonWCKCz58DUv5KVCWTUh8xxSlFdUsmh
 9XqHQKnB1RYb3GU876bpXPSD6LOoW86PrzppXkHiLrhJT/UtOiMydIsPjyu3Qzn8yJST
 gs6DOQYUhjbXMhgsVsPgBQW3k7YbcGktgCfq7Yo9Keun4gOQQ6S1jzczzMrXCGbKJ+FR
 2MeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776639100; x=1777243900;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=nGI8q1vIW2YCqL8DB2swQpMBunXNj9M7QpTu5vxe99c=;
 b=K79q/N0vyaymOpubuW2FVce1mQ6ptqBRaj0X4HVbAemOxcJ50F3+96ORb4K3vN+GTb
 j+PsLwn0zQrc8X2+lwlIA/9JF3ORuYlb698cuAvTjow8jtaS7GwjTu/NIDCMxVYsXxJg
 JzLi+t1dQB069OhkDg6AjlimMeMatEHkh2NszTJsOdEGiRaBVqM2myolre0iesdMX83x
 +aB6S7jk8uUknqM1s6U9+nGe4JGJB2KKzgbTXp32+0v+MuAjX1rYEvh2e/492XgTo3W2
 w2oMLdSKL9VU06ZFj80jfoU2gugyIpsjZWIGvW1E6du+1cZ7a8fs+tRNO4HJhfg43EOV
 GjSg==
X-Forwarded-Encrypted: i=1;
 AFNElJ+j74L4a7Asa+ZMBQUfjD5g1TYTvJyVh14kyQlQuvAO1+M8QO71jQvnHZg0Qe8Y/UAr8QezqZV/yB0taw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yzy6csF/P9Nmswyw2keVT1edlqw5cVtYisP5Maph24wVKTMqSJO
 dpmtSTerfJ4XNl68X9O5g0dt/oEKcPOIctUdip5yPx6mAnw3YhZ+leezksblhA25Gto83X4+aUT
 CM/kC0d19xZ8G/n3ISjRf7Su3mxIovWc=
X-Gm-Gg: AeBDieuIs3Y0QdyNHdqzMBCqI2HleusOejUIBfUHX16NB355o7qWrQqK4bH1LInh4nF
 ZaatLsay0Qh1/mnvIZzErqtTCz0ykpGFRvJlQwLyiUTtp9XP0HY+rJzmi29dAM5EqhEPS/mujSP
 zBsy4BFE1ZojXG0Z6VbAaPOXTfnMn/a9W+/b0kDb/T5+k7cEV5ZkcO/h2d6wolLluvb2ulC2vp4
 oUWeE9piqFaEBJX3cNEFJE8LdxqkCD22d7zgkuoVb9mopFbzrWX0IQISz96RHh3wx0PStcyA/r2
 JJ873mjfDr6FqMPLcWDTKdCHFCQHFonBjtVnq0tEfxPO6eUnMK7eebbxu5l72jNZurzPgVoEaeZ
 UzG4YEkDTwUL0Ut6QlaxgIhtQDxs/4cEhiS5B
X-Received: by 2002:a05:6000:22ca:b0:43d:7883:87ce with SMTP id
 ffacd0b85a97d-43fe3dfd265mr15420059f8f.34.1776639099627; Sun, 19 Apr 2026
 15:51:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260413-kasan-v1-0-1a5831230821@bootlin.com>
 <20260413-kasan-v1-1-1a5831230821@bootlin.com>
 <CA+fCnZfubV6LgRjO3NQvhrG2Q5o0ftkFFupLWVYS50XDnmCaog@mail.gmail.com>
 <DHSWK17EZUDP.GIJ6BX2NFR6U@bootlin.com>
 <CAADnVQLJ=fJ7t1i2+_RYqU1gqYqiLP9Zrwo4vdZsgzjK_yzJTQ@mail.gmail.com>
 <CA+fCnZd31GzdpEqR8VhfK4JtUKyyRMgbBoAbeGACJgm7WvB6Vw@mail.gmail.com>
 <CAADnVQKv5y+gq=TnOAEXSqgBRpmHNjwqCfxpLaw5XkcbQ+23bg@mail.gmail.com>
 <CA+fCnZe-b0Qqbo5gGv3HN20twquQETDfYYkE1r9tPr9zUFbW9Q@mail.gmail.com>
In-Reply-To: <CA+fCnZe-b0Qqbo5gGv3HN20twquQETDfYYkE1r9tPr9zUFbW9Q@mail.gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Sun, 19 Apr 2026 15:51:28 -0700
X-Gm-Features: AQROBzDew-foTfJLq_z3E45rMJ3PdE7WT5G5Kb1cNLd7o7s_NLhMVNDGxKf8D94
Message-ID: <CAADnVQKuptG_opA12O=Xb9_+cHf3f=ycAZdfUp17P2HBYQzdsg@mail.gmail.com>
To: Andrey Konovalov <andreyknvl@gmail.com>
X-Mailman-Approved-At: Mon, 27 Apr 2026 15:54:08 +0000
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Song Liu <song@kernel.org>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>,
 Yonghong Song <yonghong.song@linux.dev>, "H. Peter Anvin" <hpa@zytor.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, Shuah Khan <shuah@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Xu Kuohai <xukuohai@huawei.com>,
 Daniel Borkmann <daniel@iogearbox.net>, X86 ML <x86@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>,
 kasan-dev <kasan-dev@googlegroups.com>, Ingo Molnar <mingo@redhat.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Bastien Curutchet <bastien.curutchet@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, ebpf@linuxfoundation.org,
 Alexei Starovoitov <ast@kernel.org>, Borislav Petkov <bp@alien8.de>,
 =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 bpf <bpf@vger.kernel.org>, Dmitry Vyukov <dvyukov@google.com>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 linux-mm <linux-mm@kvack.org>, Network Development <netdev@vger.kernel.org>,
 David Ahern <dsahern@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 Eduard Zingerman <eddyz87@gmail.com>, Thomas Gleixner <tglx@kernel.org>,
 Jiri Olsa <jolsa@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Martin KaFai Lau <martin.lau@linux.dev>,
 "David S. Miller" <davem@davemloft.net>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>
Subject: Re: [Linux-stm32] [PATCH RFC bpf-next 1/8] kasan: expose generic
	kasan helpers
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
X-Rspamd-Queue-Id: 5F5384759C9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	DATE_IN_PAST(1.00)[185];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[39];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS(0.00)[m:andreyknvl@gmail.com,m:thomas.petazzoni@bootlin.com,m:dave.hansen@linux.intel.com,m:song@kernel.org,m:ryabinin.a.a@gmail.com,m:glider@google.com,m:yonghong.song@linux.dev,m:hpa@zytor.com,m:vincenzo.frascino@arm.com,m:shuah@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:xukuohai@huawei.com,m:daniel@iogearbox.net,m:x86@kernel.org,m:john.fastabend@gmail.com,m:andrii@kernel.org,m:kasan-dev@googlegroups.com,m:mingo@redhat.com,m:linux-arm-kernel@lists.infradead.org,m:bastien.curutchet@bootlin.com,m:mcoquelin.stm32@gmail.com,m:ebpf@linuxfoundation.org,m:ast@kernel.org,m:bp@alien8.de,m:alexis.lothore@bootlin.com,m:bpf@vger.kernel.org,m:dvyukov@google.com,m:linux-kselftest@vger.kernel.org,m:linux-mm@kvack.org,m:netdev@vger.kernel.org,m:dsahern@kernel.org,m:linux-kernel@vger.kernel.org,m:eddyz87@gmail.com,m:tglx@kernel.org,m:jolsa@kernel.org,m:akpm@linux-foundation.org,m:martin.lau@linux.dev,m:davem@davemloft.net,m:memxor@gmail.com,m:ryabininaa@gmail.com,m:j
 ohnfastabend@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[alexeistarovoitov@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[alexeistarovoitov@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_CC(0.00)[bootlin.com,linux.intel.com,kernel.org,gmail.com,google.com,linux.dev,zytor.com,arm.com,st-md-mailman.stormreply.com,huawei.com,iogearbox.net,googlegroups.com,redhat.com,lists.infradead.org,linuxfoundation.org,alien8.de,vger.kernel.org,kvack.org,linux-foundation.org,davemloft.net];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_SPAM(0.00)[0.975];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]

T24gU3VuLCBBcHIgMTksIDIwMjYgYXQgMjo0OeKAr1BNIEFuZHJleSBLb25vdmFsb3YgPGFuZHJl
eWtudmxAZ21haWwuY29tPiB3cm90ZToKPgo+IE9uIFR1ZSwgQXByIDE0LCAyMDI2IGF0IDU6NTji
gK9QTSBBbGV4ZWkgU3Rhcm92b2l0b3YKPiA8YWxleGVpLnN0YXJvdm9pdG92QGdtYWlsLmNvbT4g
d3JvdGU6Cj4gPgo+ID4gSSB0aGluayB3ZSdyZSB0YWxraW5nIHBhc3QgZWFjaCBvdGhlci4KPiA+
IFdlJ3JlIG5vdCBpbnRlcmVzdGVkIGluIEtBU0FOX1NXX1RBR1Mgb3IgS0FTQU5fSFdfVEFHUy4K
PiA+IFdlJ3JlIG5vdCBnb2luZyB0byBtb2RpZnkgYXJtNjQgSklUIGF0IGFsbC4KPiA+Cj4gPiBU
aGlzIGlzIHB1cmVseSBLQVNBTl9HRU5SSUMgYW5kIG9ubHkgb24geDg2LTY0Lgo+ID4gSklUIHdp
bGwgZW1pdCBleGFjdGx5IHdoYXQgY29tcGlsZXJzIGVtaXQgZm9yIGdlbmVyaWMKPiA+IHdoaWNo
IGlzIF9fYXNhbl9sb2FkL3N0b3JlLiBUaGlzIGlzIGFzIHN0YWJsZSBBQkkgYXMgaXQgY2FuIGdl
dAo+ID4gYW5kIHdlIGRvbid0IHdhbnQgdG8gZGV2aWF0ZSBmcm9tIGl0Lgo+Cj4gT0ssIEkgc3Vw
cG9zZWQgdGhhdCdzIGZhaXIuIFlvdSBkaWQgdGhyb3cgbWUgb2ZmIHBvaW50IHdpdGggeW91cgo+
IHBlcmZvcm1hbmNlIGNvbW1lbnQuIEJ1dCBpZiB5b3UgZGVjaWRlIHRvIGFkZCBTV19UQUdTIHN1
cHBvcnQgYXQgc29tZQo+IHBvaW50LCBJIHRoaW5rIHRoaXMgZGlzY3Vzc2lvbiBuZWVkcyB0byBi
ZSByZXZpc2l0ZWQuCj4KPiBCdXQgcGxlYXNlIGFkZCBhIGNvbW1lbnQgc2F5aW5nIHRoYXQgdGhv
c2UgZnVuY3Rpb25zIGFyZSBvbmx5IGV4cG9zZWQKPiBmb3IgQlBGIEpJVCBhbmQgdGhleSBhcmUg
bm90IHN1cHBvc2VkIHRvIGJlIHVzZWQgYnkgb3RoZXIgcGFydHMgb2YgdGhlCj4ga2VybmVsLiBB
bmQgaW4gY2FzZSB5b3UgZG8gZW5kIHVwIGFkZGluZyBhIG5ldyBjb25maWcgb3B0aW9uLCBndWFy
ZAo+IHRoZSBwdWJsaWMgZGVjbGFyYXRpb25zIGJ5IGEgY29ycmVzcG9uZGluZyBpZmRlZi4KCkkg
ZmVlbCBjb25jZXJucyBvZiBtaXN1c2UgYXJlIG92ZXJibG93bi4KQmVpbmcgaW4gaW5jbHVkZS9s
aW51eC9rYXNhbi5oIGRvZXNuJ3QgbWFrZSB0aGVtIGZyZWUtZm9yLWFsbAphbGwgb2YgYSBzdWRk
ZW4sIGJ1dCBpZiB5b3UgcHJlZmVyIHdlIGNhbiBqdXN0IGNvcHkgcGFzdGU6Cit2b2lkIF9fYXNh
bl9sb2FkMSh2b2lkICpwKTsKK3ZvaWQgX19hc2FuX3N0b3JlMSh2b2lkICpwKTsKaW50byBicGZf
aml0X2NvbXAuYwoKPiA+IFRoZSBnb2FsIGhlcmUgaXMgdG8gZmluZCBidWdzIGluIHRoZSB2ZXJp
Zmllci4KPiA+IElmIHNvbWV0aGluZyBnb3QgcGFzdCBpdCwgdGhhdCBzaG91bGRuJ3QgaGF2ZSwK
PiA+IGthc2FuIGdlbmVyaWMgb24geDg2LTY0IGlzIGVub3VnaC4KPgo+IEZXSVcsIEkgc3VzcGVj
dCBIV19UQUdTIEtBU0FOIGFscmVhZHkganVzdCB3b3JrcyB3aXRoIEpJVGVkIEJQRiBjb2RlLgoK
T2hoLiBHb29kIHBvaW50LiBMb29rcyBsaWtlIG1vZGVybiBhcm02NCBjcHVzIGluIHB1YmxpYyBj
bG91ZHMKZG9uJ3QgaGF2ZSB0aGF0IGVuYWJsZWQsIHNvIG9uZSB3b3VsZCBuZWVkIHBpeGVsIHBo
b25lIHRvCmNhdGNoIHZlcmlmaWVyIGJ1Z3MgdmlhIGh3X3RhZ3MuClNvIHdlIHN0aWxsIG5lZWQg
dGhpcyB4ODYtc3BlY2lmaWMgaml0IGthc2FuLgpJIGd1ZXNzIGV2ZW50dWFsbHkgaXQgY2FuIGJl
IHJlbW92ZWQgd2hlbiBod190YWdzIHN1cHBvcnQgaXMgd2lkZXNwcmVhZC4KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBs
aXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
