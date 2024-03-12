Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF68878D6A
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Mar 2024 04:14:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 43CEDC6DD73;
	Tue, 12 Mar 2024 03:14:04 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0B03BC6B476
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Mar 2024 03:14:02 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id
 98e67ed59e1d1-29bf998872fso1088699a91.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Mar 2024 20:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1710213241; x=1710818041;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OXlf8eE/kb9hUjEHRg6KiaZYrPX7zppIuDOk01qdNjA=;
 b=JdV8Pd4OWfFczE4PnV7COBeiCp2jylj9mUpHU5tnNblTlqvDhniGKBpPwob9B0s4oz
 nMzk+h/Nl1SUAUPZb+4URc1FbPUBUVrV/BVc5ZlxhdSjId42UpovaMzOsjqDDrJSiro5
 z7PVQhE/qdO92zwSPIuVtIQr5dhpsJm24jWK05ZWKeSD4cR95vmqxmW95o6au/sscTh+
 Xc3EeUnLqub1DsjoNOsEySrmdwOlDS6kgiJ/OM4r9FvudKuT2E/HMXqxfghFCusfbGFW
 U2FWVS4rkCcYAlqnq+8Ohixq3XJQtMy2i4pf6EdI/zOT2JUKEWCPRvw4wq/JRccSQ8Fc
 xYKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710213241; x=1710818041;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OXlf8eE/kb9hUjEHRg6KiaZYrPX7zppIuDOk01qdNjA=;
 b=QF1gxJiyVmfUmTNMZcYqB+/oSBcaBfE3Ccdtva+yYhKTtc7i9ruq9KWR+nxaQgQrW0
 +mYEVOQjafu12rATL4+gOHluD6osT0FnjcGWj2rClPkbH51MNxE0IhyY1j7ohSrxBbt9
 AvpLqONCaEFIA84NKusHdECdB8VlwgN1M3DcAoDmfejbUR1FcB8Sd9rwkEmQ6OICaXjq
 fp4thDcBFAMB/rtgCusKo4aOkoyelC+p+PRuce5jzQhDl1Hh1acRDTLrDD6gd158jgSt
 mTFvc8iL8hW/Pzj/Ws9JJRFZirrI6PDC8ZkAht2NElDntUPiiYEDJB7gJWw+dJBEbl2W
 be2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTg4BkDgrhzoDTjn9ild65mTgyQ5JXRxnjlaeE0VtjOQ9+SNn6NtGgxDdFaiY16A/LiBfDGIBVMUxpeojBMxkDe5KskNpLaw5hd8HOQgV+JhT+r02omljO
X-Gm-Message-State: AOJu0YwMpYBPwlb5wNrlP00NETduk1idFRCa1HINRSrKRMTMtf0tGz6c
 i3dWjk+q5CyhxRKBbPTKdMIsJO2BtaZjiRLP8phpgX1s3Lp+6LuNZp4uo6zp1Ig2JGwLhU3W7sS
 BN6XUIt81cXax/MjPIUa+lxwptJ9x1rMPGvyO/g==
X-Google-Smtp-Source: AGHT+IFrJd1b6cRe3N1bdjRPMDm6UQYIWuBJWFP813OtCjwvKtB/NBwZvIOHJ5+UKRNsfrlwra9CEE8kwZK9x+jxh4c=
X-Received: by 2002:a17:90a:c684:b0:299:5b95:cd7d with SMTP id
 n4-20020a17090ac68400b002995b95cd7dmr5190887pjt.45.1710213241618; Mon, 11 Mar
 2024 20:14:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240311093526.1010158-1-dongmenglong.8@bytedance.com>
 <20240311093526.1010158-6-dongmenglong.8@bytedance.com>
 <CAADnVQKw4HUbwvivysVBQPpA2MC2e56MwrvJy89qs8rx_ixOnw@mail.gmail.com>
In-Reply-To: <CAADnVQKw4HUbwvivysVBQPpA2MC2e56MwrvJy89qs8rx_ixOnw@mail.gmail.com>
From: =?UTF-8?B?5qKm6b6Z6JGj?= <dongmenglong.8@bytedance.com>
Date: Tue, 12 Mar 2024 11:13:50 +0800
Message-ID: <CALz3k9iiP5msNtL5c0ZhwRoYyEZtxZoWGbFiPrVcL3To6hj4wQ@mail.gmail.com>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, Alexei Starovoitov <ast@kernel.org>,
 Song Liu <song@kernel.org>, Stanislav Fomichev <sdf@google.com>,
 Yonghong Song <yonghong.song@linux.dev>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linux-s390 <linux-s390@vger.kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, X86 ML <x86@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Quentin Monnet <quentin@isovalent.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 linux-trace-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 KP Singh <kpsingh@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Hao Luo <haoluo@google.com>, Network Development <netdev@vger.kernel.org>,
 David Ahern <dsahern@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 Eddy Z <eddyz87@gmail.com>, Sven Schnelle <svens@linux.ibm.com>,
 Jiri Olsa <jolsa@kernel.org>, bpf <bpf@vger.kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [External] Re: [PATCH bpf-next v2 5/9] bpf:
 verifier: add btf to the function args of bpf_check_attach_target
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

T24gVHVlLCBNYXIgMTIsIDIwMjQgYXQgOTo1MeKAr0FNIEFsZXhlaSBTdGFyb3ZvaXRvdgo8YWxl
eGVpLnN0YXJvdm9pdG92QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBNb24sIE1hciAxMSwgMjAy
NCBhdCAyOjM14oCvQU0gTWVuZ2xvbmcgRG9uZwo+IDxkb25nbWVuZ2xvbmcuOEBieXRlZGFuY2Uu
Y29tPiB3cm90ZToKPiA+Cj4gPiBBZGQgdGFyZ2V0IGJ0ZiB0byB0aGUgZnVuY3Rpb24gYXJncyBv
ZiBicGZfY2hlY2tfYXR0YWNoX3RhcmdldCgpLCB0aGVuCj4gPiB0aGUgY2FsbGVyIGNhbiBzcGVj
aWZ5IHRoZSBidGYgdG8gY2hlY2suCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogTWVuZ2xvbmcgRG9u
ZyA8ZG9uZ21lbmdsb25nLjhAYnl0ZWRhbmNlLmNvbT4KPiA+IC0tLQo+ID4gIGluY2x1ZGUvbGlu
dXgvYnBmX3ZlcmlmaWVyLmggfCAxICsKPiA+ICBrZXJuZWwvYnBmL3N5c2NhbGwuYyAgICAgICAg
IHwgNiArKysrLS0KPiA+ICBrZXJuZWwvYnBmL3RyYW1wb2xpbmUuYyAgICAgIHwgMSArCj4gPiAg
a2VybmVsL2JwZi92ZXJpZmllci5jICAgICAgICB8IDggKysrKystLS0KPiA+ICA0IGZpbGVzIGNo
YW5nZWQsIDExIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdp
dCBhL2luY2x1ZGUvbGludXgvYnBmX3ZlcmlmaWVyLmggYi9pbmNsdWRlL2xpbnV4L2JwZl92ZXJp
Zmllci5oCj4gPiBpbmRleCA0YjBmNjYwMGU0OTkuLjZjYjIwZWZjZmFjMyAxMDA2NDQKPiA+IC0t
LSBhL2luY2x1ZGUvbGludXgvYnBmX3ZlcmlmaWVyLmgKPiA+ICsrKyBiL2luY2x1ZGUvbGludXgv
YnBmX3ZlcmlmaWVyLmgKPiA+IEBAIC04MTEsNiArODExLDcgQEAgc3RhdGljIGlubGluZSB2b2lk
IGJwZl90cmFtcG9saW5lX3VucGFja19rZXkodTY0IGtleSwgdTMyICpvYmpfaWQsIHUzMiAqYnRm
X2lkKQo+ID4gIGludCBicGZfY2hlY2tfYXR0YWNoX3RhcmdldChzdHJ1Y3QgYnBmX3ZlcmlmaWVy
X2xvZyAqbG9nLAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCBi
cGZfcHJvZyAqcHJvZywKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBzdHJ1
Y3QgYnBmX3Byb2cgKnRndF9wcm9nLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0
cnVjdCBidGYgKmJ0ZiwKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1MzIgYnRmX2lk
LAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBicGZfYXR0YWNoX3Rhcmdl
dF9pbmZvICp0Z3RfaW5mbyk7Cj4gPiAgdm9pZCBicGZfZnJlZV9rZnVuY19idGZfdGFiKHN0cnVj
dCBicGZfa2Z1bmNfYnRmX3RhYiAqdGFiKTsKPiA+IGRpZmYgLS1naXQgYS9rZXJuZWwvYnBmL3N5
c2NhbGwuYyBiL2tlcm5lbC9icGYvc3lzY2FsbC5jCj4gPiBpbmRleCBkMWNkNjQ1ZWY5YWMuLjYx
MjhjMzEzMTE0MSAxMDA2NDQKPiA+IC0tLSBhL2tlcm5lbC9icGYvc3lzY2FsbC5jCj4gPiArKysg
Yi9rZXJuZWwvYnBmL3N5c2NhbGwuYwo+ID4gQEAgLTM0MDEsOSArMzQwMSwxMSBAQCBzdGF0aWMg
aW50IGJwZl90cmFjaW5nX3Byb2dfYXR0YWNoKHN0cnVjdCBicGZfcHJvZyAqcHJvZywKPiA+ICAg
ICAgICAgICAgICAgICAgKiBuZWVkIGEgbmV3IHRyYW1wb2xpbmUgYW5kIGEgY2hlY2sgZm9yIGNv
bXBhdGliaWxpdHkKPiA+ICAgICAgICAgICAgICAgICAgKi8KPiA+ICAgICAgICAgICAgICAgICBz
dHJ1Y3QgYnBmX2F0dGFjaF90YXJnZXRfaW5mbyB0Z3RfaW5mbyA9IHt9Owo+ID4gKyAgICAgICAg
ICAgICAgIHN0cnVjdCBidGYgKmJ0ZjsKPiA+Cj4gPiAtICAgICAgICAgICAgICAgZXJyID0gYnBm
X2NoZWNrX2F0dGFjaF90YXJnZXQoTlVMTCwgcHJvZywgdGd0X3Byb2csIGJ0Zl9pZCwKPiA+IC0g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmdGd0X2luZm8pOwo+
ID4gKyAgICAgICAgICAgICAgIGJ0ZiA9IHRndF9wcm9nID8gdGd0X3Byb2ctPmF1eC0+YnRmIDog
cHJvZy0+YXV4LT5hdHRhY2hfYnRmOwo+Cj4gSSB0aGluayBpdCdzIGJldHRlciB0byBrZWVwIHRo
aXMgYml0IGluc2lkZSBicGZfY2hlY2tfYXR0YWNoX3RhcmdldCgpLAo+IHNpbmNlIGEgbG90IG9m
IG90aGVyIGNvZGUgaW4gdGhlcmUgaXMgd29ya2luZyB3aXRoIGlmICh0Z3RfcHJvZykgLi4uCj4g
c28gaWYgdGhlIGNhbGxlciBtZXNzZXMgdXAgcGFzc2luZyB0Z3RfcHJvZy0+YXV4LT5idGYgd2l0
aCB0Z3RfcHJvZwo+IHRoZSBidWcgd2lsbCBiZSBkaWZmaWN1bHQgdG8gZGVidWcuCgpJbiB0aGUg
cHJldmlvdXMgdmVyc2lvbiwgSSBwYXNzIHRoZSBhdHRhY2hfYnRmIHdpdGggdGhlIGZvbGxvd2lu
Zwp3YXk6CgorICAgICAgICAgICAgb3JpZ2luX2J0ZiA9IHByb2ctPmF1eC0+YXR0YWNoX2J0ZjsK
KyAgICAgICAgICAgICAvKiB1c2UgdGhlIG5ldyBhdHRhY2hfYnRmIHRvIGNoZWNrIHRoZSB0YXJn
ZXQgKi8KKyAgICAgICAgICAgICBwcm9nLT5hdXgtPmF0dGFjaF9idGYgPSBhdHRhY2hfYnRmOwog
ICAgICAgICAgICAgIGVyciA9IGJwZl9jaGVja19hdHRhY2hfdGFyZ2V0KE5VTEwsIHByb2csIHRn
dF9wcm9nLCBidGZfaWQsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgJnRndF9pbmZvKTsKKyAgICAgICAgICAgICBwcm9nLT5hdXgtPmF0dGFjaF9idGYgPSBvcmln
aW5fYnRmOwoKQW5kIEppcmkgc3VnZ2VzdGVkIHRvIGFkZCB0aGUgYXR0YWNoX2J0ZiB0byB0aGUg
ZnVuY3Rpb24gYXJncwpvZiBicGZfY2hlY2tfYXR0YWNoX3RhcmdldCgpLgoKRW5ubi4uLi5TaG91
bGQgSSBjb252ZXJ0IHRvIHRoZSBvbGQgd2F5PwoKVGhhbmtzIQpNZW5nbG9uZyBEb25nCgo+Cj4g
PiArICAgICAgICAgICAgICAgZXJyID0gYnBmX2NoZWNrX2F0dGFjaF90YXJnZXQoTlVMTCwgcHJv
ZywgdGd0X3Byb2csIGJ0ZiwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBidGZfaWQsICZ0Z3RfaW5mbyk7Cl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0z
MkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
