Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0FT7FqR732nFTgAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Apr 2026 13:51:00 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D25404089
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Apr 2026 13:51:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 94B76C90083;
	Wed, 15 Apr 2026 11:50:59 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 55628C8F291
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Apr 2026 15:58:28 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-43cfde3c3f3so5812245f8f.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Apr 2026 08:58:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776182308; cv=none;
 d=google.com; s=arc-20240605;
 b=Nwi9p9W8JvHkDN5awWSjYbnmdmrkgPPAsw+6GWm3pF74RDXsi98U/bfKEXxAj0Xtf3
 4A7MlX3nKAMsMip1cWLx1FWQDixxGFFO4Mf9BhZWPgjt81/PhwJS1QHME80wHL1JmUrr
 h+x2wYPbSeZouZ5WjIJE52QCNCBHn+eAq8p7l+wN+buYTOb6jNVGIMb6v7ok+Ui3o6dF
 NYGoCcfXx9lULXSQWzAIbvSyLsUg/AyqflGjLUeDFV9eQR8CnwYv62slxGtGNxeUGAWx
 CF320OKl3wasrFbjwk0R6Ce5kMijU//OIWPxwLBiwldF6+8uGoElZ0W3ZSKdWzNAkEyu
 uVFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=3mMVtHum7zPwks+XDXBRlehlKpwvf1Ihn9S56ZO2pRY=;
 fh=wNwPllPSgZZJ1ePwmrQzQiBobP5/tswNTutyoSk4Lmc=;
 b=WAjG8jHEJxveWliq/xDgZf8dCaj+oPTSyt60RBj+tJ4F0N3CmknwenXY7sYznacFwi
 jAVE+efeyHd+N73bVq4JtrLMsxyHm0HJNRZfOUGKJutxWeNE+Sj98q/slyMpLh+kX6Ae
 EDaC6ymNO2+YpJgb0SY2X5bY3WvqwdMGzCnaQaaM34QhkdN0mi8jF/sYV9XjJNAljUWT
 AaB1rtMo6z95qq86yiYtBu27oHEZ899TvhG2blxOJ8D19tAxn9BqSOnjMjbr/QzMAYHw
 pc36X0WxRjg93Z5/u507YBy0eCJYnB6/PCW2CfLuQLdPnR4Wrrxm7z4XeHqqdFJxMKVq
 1ZZA==; darn=st-md-mailman.stormreply.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776182307; x=1776787107;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3mMVtHum7zPwks+XDXBRlehlKpwvf1Ihn9S56ZO2pRY=;
 b=nMh1XxmwZawM9NJhR+m9dK+QDEwwEHtUtly4W5uIk/QJmEnY99kZaLt2BIk2BhRTib
 2RdpvHxB/eyQ2Yk18Q3LPz/6lPX2tFD4eIT+fpqMZkNe+5NbrKoTs/cDyETMg/OMVKwP
 4jGqqADJii5ycyi5p82fsXK2dPiwD0SjSxbfVmB48eZUzfS3tnTEyoAbc39DIhiZKB72
 Y4RZIBFLEQzyIpjURlKWakcIa+df802yJlxVR+68n/3hYaGtjbK7r1fmXo25ZMXSPeDX
 Zv+zfcpIkXoeqf6a7FauoybvHiC5isnlusCE9E/IPe1S4vYqPRZcd0Me63ZjIAOyoAjL
 pBcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776182308; x=1776787108;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=3mMVtHum7zPwks+XDXBRlehlKpwvf1Ihn9S56ZO2pRY=;
 b=UJ/63SmVN4oWzz5hXG+PWIwstzdQdqAq9F0D4ApIvDAq5VRSEwtv82ztNplbk2m6b2
 CqvuFtbYzV7pWNvjYAQuD5gEqfqt0jzWykUmvpKpJi/FSgevm8IVjpgA0h2Y99KQhimV
 FWWmT0QAmZjiYYZmf1uV1Did2ycCgWoMdjd9lC57Bi16pM60PX5AKIVnt1KZxlvnh91Q
 OnWbhZ53aUXHFyl22GJJjWO+bYhKLbekfnhN8oD4VTQ/6m6U6A4A3sVesh1jo4g3vNeE
 Xedn/sx5fjdn0cL6XHz4xqrbVkGjyt4SdccqHturKHJE6pMzmyTZsV11DsA6HdvEDQzB
 yC9g==
X-Forwarded-Encrypted: i=1;
 AFNElJ+2H7GJc0OgyHB9IEGRAoPd43eLWDatSYfzR4f+LiTCBqJQOSymAZOJJwh3s7ZZqwpSP/GmGfy92GZI+g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw4ZVRt7DxTkPRx9JQl2iVO97QLz4b4BunEp623i3JUBc+BB6vb
 jL+UXGanhs1L1tI3l1FavnFZudc12mVMUuSazgXGXpF2L8sPVG/5tZsLxJX8tCIorwI+L9nmI/8
 8lACsjrqhQIHN3Nb5tLgRQhPfhsAyoBU=
X-Gm-Gg: AeBDievGsmHlCfcs0elE+hkhL6pZ/Sxs0NxSfstuXXtfcyV6tj0pPXz1L7KqAENLrOS
 s7i3c9SLT7nAuWlGMbVVhrGekHNorpfNJg1OV9NgmSMSn2NJ/+34wFW9tcfqgfrNV6imlbtnK27
 PKxELEIy7xnSV61DdZPlYnzQJEGYbJ24Rtup2dsl7YES0Z4aQfIZv3gf6RofHN35xrhWYazK7RQ
 AGukg5da6mElQke27dwFnkuX9cKSid+UiEF9ZeUXVUZztBVvFiMxnkwlfQGvIc/mzshOXEx752M
 CKpzDPuplPVlj3DS/Xfesoo4rJMfWMCGkpYmP7+d4fjhZqIyX/i8t79hWxZcgPlcCxuCGnpBdDS
 1G9RRPrPepdPpNdxNAhpMs3959V+inN3DgoEv
X-Received: by 2002:a05:6000:290b:b0:43e:a703:3665 with SMTP id
 ffacd0b85a97d-43ea7033872mr4250710f8f.25.1776182307210; Tue, 14 Apr 2026
 08:58:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260413-kasan-v1-0-1a5831230821@bootlin.com>
 <20260413-kasan-v1-1-1a5831230821@bootlin.com>
 <CA+fCnZfubV6LgRjO3NQvhrG2Q5o0ftkFFupLWVYS50XDnmCaog@mail.gmail.com>
 <DHSWK17EZUDP.GIJ6BX2NFR6U@bootlin.com>
 <CAADnVQLJ=fJ7t1i2+_RYqU1gqYqiLP9Zrwo4vdZsgzjK_yzJTQ@mail.gmail.com>
 <CA+fCnZd31GzdpEqR8VhfK4JtUKyyRMgbBoAbeGACJgm7WvB6Vw@mail.gmail.com>
In-Reply-To: <CA+fCnZd31GzdpEqR8VhfK4JtUKyyRMgbBoAbeGACJgm7WvB6Vw@mail.gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 14 Apr 2026 08:58:15 -0700
X-Gm-Features: AQROBzCLeOrIcZKaiQb6Cd-OuEC8rfDXHtXvBFTPGfyaVO0Jqt2FWke0BxyjjQs
Message-ID: <CAADnVQKv5y+gq=TnOAEXSqgBRpmHNjwqCfxpLaw5XkcbQ+23bg@mail.gmail.com>
To: Andrey Konovalov <andreyknvl@gmail.com>
X-Mailman-Approved-At: Wed, 15 Apr 2026 11:50:57 +0000
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
X-Spamd-Result: default: False [4.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:andreyknvl@gmail.com,m:thomas.petazzoni@bootlin.com,m:dave.hansen@linux.intel.com,m:song@kernel.org,m:ryabinin.a.a@gmail.com,m:glider@google.com,m:yonghong.song@linux.dev,m:hpa@zytor.com,m:vincenzo.frascino@arm.com,m:shuah@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:xukuohai@huawei.com,m:daniel@iogearbox.net,m:x86@kernel.org,m:john.fastabend@gmail.com,m:andrii@kernel.org,m:kasan-dev@googlegroups.com,m:mingo@redhat.com,m:linux-arm-kernel@lists.infradead.org,m:bastien.curutchet@bootlin.com,m:mcoquelin.stm32@gmail.com,m:ebpf@linuxfoundation.org,m:ast@kernel.org,m:bp@alien8.de,m:alexis.lothore@bootlin.com,m:bpf@vger.kernel.org,m:dvyukov@google.com,m:linux-kselftest@vger.kernel.org,m:linux-mm@kvack.org,m:netdev@vger.kernel.org,m:dsahern@kernel.org,m:linux-kernel@vger.kernel.org,m:eddyz87@gmail.com,m:tglx@kernel.org,m:jolsa@kernel.org,m:akpm@linux-foundation.org,m:martin.lau@linux.dev,m:davem@davemloft.net,m:memxor@gmail.com,m:ryabininaa@gmail.com,m:j
 ohnfastabend@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[alexeistarovoitov@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[39];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	TAGGED_FROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[bootlin.com,linux.intel.com,kernel.org,gmail.com,google.com,linux.dev,zytor.com,arm.com,st-md-mailman.stormreply.com,huawei.com,iogearbox.net,googlegroups.com,redhat.com,lists.infradead.org,linuxfoundation.org,alien8.de,vger.kernel.org,kvack.org,linux-foundation.org,davemloft.net];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[alexeistarovoitov@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	MISSING_XM_UA(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_SPAM(0.00)[0.082];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,mail.gmail.com:mid,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 38D25404089
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gVHVlLCBBcHIgMTQsIDIwMjYgYXQgODoxMOKAr0FNIEFuZHJleSBLb25vdmFsb3YgPGFuZHJl
eWtudmxAZ21haWwuY29tPiB3cm90ZToKPgo+IE9uIFR1ZSwgQXByIDE0LCAyMDI2IGF0IDQ6Mzbi
gK9QTSBBbGV4ZWkgU3Rhcm92b2l0b3YKPiA8YWxleGVpLnN0YXJvdm9pdG92QGdtYWlsLmNvbT4g
d3JvdGU6Cj4gPgo+ID4gPiBBQ0ssIEknbGwgdHJ5IHRvIHVzZSB0aG9zZSBrYXNhbl9jaGVja19y
ZWFkIGFuZCBrYXNhbl9jaGVja193cml0ZSByYXRoZXIKPiA+ID4gdGhhbiBfX2FzYW5fe2xvYWQs
c3RvcmV9WC4KPiA+Cj4gPiBOby4gVGhlIHBlcmZvcm1hbmNlIHBlbmFsdHkgd2lsbCBiZSB0b28g
aGlnaC4KPgo+IFdpdGggdXNpbmcgX19hc2FuX2xvYWQvc3RvcmVYKCksIGl0IHdpbGwgYmUgb25l
IGZ1bmN0aW9uIGNhbGwgdG8gZ2V0Cj4gdG8gY2hlY2tfcmVnaW9uX2lubGluZSgpOiBfX2FzYW5f
bG9hZC9zdG9yZVgtPmNoZWNrX3JlZ2lvbl9pbmxpbmUuCj4KPiBXaXRoIGthc2FuX2NoZWNrX3Jl
YWQvd3JpdGUoKSwgcmlnaHQgbm93LCBpdCB3b3VsZCBiZSB0d28gZnVuY3Rpb24KPiBjYWxsczog
X19rYXNhbl9jaGVja19yZWFkLT5rYXNhbl9jaGVja19yYW5nZS0+Y2hlY2tfcmVnaW9uX2lubGlu
ZS4KPgo+IEkgZG91YnQgYW4gZXh0cmEgZnVuY3Rpb24gY2FsbCB3b3VsZCBtYWtlIGEgZGlmZmVy
ZW5jZSBpbiB0ZXJtcyBvZgo+IHBlcmZvcm1hbmNlOiB0aGUgc2hhZG93IGNoZWNraW5nIGl0c2Vs
ZiBpcyBhbHNvIGV4cGVuc2l2ZS4KPgo+IEJ1dCBpZiB0aGUgc2Vjb25kIGNhbGwgaXMgYSBjb25j
ZXJuLCB3ZSBjYW4gbW92ZSBrYXNhbl9jaGVja19yYW5nZSgpCj4gYW5kIGxvd2VyLWxldmVsIGZ1
bmN0aW9ucyBpbnRvIG1tL2thc2FuL2dlbmVyaWMuaCBhbmQgaW5jbHVkZSBpdCBpbnRvCj4gc2hh
ZG93LmMsIGFuZCB0aGVuIGl0IHdpbGwgYmUganVzdCBvbmUgZnVuY3Rpb24gY2FsbC4KPgo+IFRv
IGltcHJvdmUgcGVyZm9ybWFuY2UgZnVydGhlciwgdGhlIEpJVCBjb21waWxlciBjb3VsZCBlbWl0
IGlubGluZWQKPiBzaGFkb3cgY2hlY2tpbmcgaW5zdHJ1Y3Rpb25zLCBzYW1lIGFzIHRoZSBDIGNv
bXBpbGVyIGRvZXMgd2l0aAo+IEtBU0FOX0lOTElORT15Lgo+Cj4gPiBod190YWdzIHdvbid0IHdv
cmsgd2l0aG91dCBjb3JyZXNwb25kaW5nIEpJVCB3b3JrLgo+Cj4gWW91IHByb2JhYmx5IG1lYW50
IFNXX1RBR1MgaGVyZS4KPgo+IEhXX1RBR1Mgd2lsbCBsaWtlbHkganVzdCB3b3JrIHdpdGhvdXQg
YW55IEpJVCBjaGFuZ2VzIChldmVuIHRoZQo+IGthc2FuX2NoZWNrX2J5dGUoKSB0aGluZyBJIG1l
bnRpb25lZCBzaG91bGQgbm90IGJlIHJlcXVpcmVkKSwgYXNzdW1pbmcKPiBKSVQnZWQgQlBGIGNv
ZGUganVzdCBhY2Nlc3NlcyBrZXJuZWwtcmV0dXJuZWQgcG9pbnRlcnMgYXMgaXMuCj4KPiA+IEkg
c2VlIG5vIHBvaW50IHNhY3JpZmljaW5nIHBlcmZvcm1hbmNlIGZvciBhZXN0aGV0aWNzLgo+Cj4g
V2l0aCB0aGUgY2hhbmdlIEkgc3VnZ2VzdGVkIGFib3ZlLCB0aGVyZSB3b3VsZCBiZSBubyBwZXJm
b3JtYW5jZQo+IGRpZmZlcmVuY2UuIEFuZCB0aGUgY29kZSBzdGF5cyBjbGVhbmVyLgo+Cj4gPiBf
X2FzYW5fbG9hZC9zdG9yZVggaXMgd2hhdCBjb21waWxlcnMgZW1pdC4KPgo+IEZvciBHZW5lcmlj
IG1vZGUuIEZvciBTV19UQUdTLCB0aGUgZnVuY3Rpb24gbmFtZXMgYXJlIGRpZmZlcmVudC4KPiBL
ZWVwaW5nIHRoaXMgZGV0YWlsIHdpdGhpbiB0aGUgS0FTQU4gY29kZSBpcyBjbGVhbmVyLgoKSSB0
aGluayB3ZSdyZSB0YWxraW5nIHBhc3QgZWFjaCBvdGhlci4KV2UncmUgbm90IGludGVyZXN0ZWQg
aW4gS0FTQU5fU1dfVEFHUyBvciBLQVNBTl9IV19UQUdTLgpXZSdyZSBub3QgZ29pbmcgdG8gbW9k
aWZ5IGFybTY0IEpJVCBhdCBhbGwuCgpUaGlzIGlzIHB1cmVseSBLQVNBTl9HRU5SSUMgYW5kIG9u
bHkgb24geDg2LTY0LgpKSVQgd2lsbCBlbWl0IGV4YWN0bHkgd2hhdCBjb21waWxlcnMgZW1pdCBm
b3IgZ2VuZXJpYwp3aGljaCBpcyBfX2FzYW5fbG9hZC9zdG9yZS4gVGhpcyBpcyBhcyBzdGFibGUg
QUJJIGFzIGl0IGNhbiBnZXQKYW5kIHdlIGRvbid0IHdhbnQgdG8gZGV2aWF0ZSBmcm9tIGl0LgoK
VGhlIGdvYWwgaGVyZSBpcyB0byBmaW5kIGJ1Z3MgaW4gdGhlIHZlcmlmaWVyLgpJZiBzb21ldGhp
bmcgZ290IHBhc3QgaXQsIHRoYXQgc2hvdWxkbid0IGhhdmUsCmthc2FuIGdlbmVyaWMgb24geDg2
LTY0IGlzIGVub3VnaC4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxt
YW4vbGlzdGluZm8vbGludXgtc3RtMzIK
