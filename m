Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3182E878C91
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Mar 2024 02:54:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DCE12C6DD9D;
	Tue, 12 Mar 2024 01:53:59 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E960FC6DD73
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Mar 2024 01:53:57 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-6e5eaf5bb3eso3932547b3a.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Mar 2024 18:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1710208436; x=1710813236;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m+8U24REJsycoMY3gapLXd6No4Kdp5va5OvGqVZaNtY=;
 b=Ks8OZWN70FFerpiGNPMzVT1GgTT9k7SQVAz8u96fnbQupdFbrgZan/da7ftP6FlT2f
 T6IciKXzxjhkDvJa0SG8Se8wtWeMht2TSDuC6DPCjYq9nkWjVy8KikSs8JGzNEuMPziX
 V59ebkeSMueyqRzp2diiIxUimuUH1heKDoK+X/wWhNoef0B2CgZP3nRep2cDops1XYas
 /fiSAggOxQUsTenosCyQDynDX5afm1Jg1i2a0TsNMfz0VAb1096fa7uDEfasDaegajP5
 QNUEtyGH364r9LWzprNtN4HfGSYiU3zGTt+v6SABQIUMjB1PKOKJmpM0CLnde8h+TYET
 JqsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710208436; x=1710813236;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m+8U24REJsycoMY3gapLXd6No4Kdp5va5OvGqVZaNtY=;
 b=YMaPLbMn6FDtzb3nuaZWwV7o5ZRpaniaAOsSLIs3+GFeMoyDaxFXy2g+o2e4SzDsTR
 EgjKuxxjDWC78kZTiHTM5taPyfTb0XkTzYzueX/4AYQVfCzCqb2nQhf6+z2qt7UzBtd4
 m0EFwzkrN96b/kqGx1daTRbQTruxKSG31R40aVVagtqnJp9g/HlQqFZUw7KcTWZm28v8
 X1kG1PFMtIcv9qRkLY9ujldSTRD6yxJunWHxMBlZt+XD1jN2kIX0oUkiNU52HluTRAQg
 evd8A4c00dBFSqaZUCMl1xgPK8FdMXFm4jo///C4Yfw+QYaq6v/5agPSXbKS+/J29xdY
 ZGAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrOFHCI7FlA8UUs8lefjJqUmI9TQsnmkTiLHKr24uirnpHmBgjPbr/yYMF1Txx1mKUbRRToN6QHVk71wegr9NDxbiwCq/hgvZs52dVFfppjJ07bccAUCFf
X-Gm-Message-State: AOJu0Yz4rNCObIfPASzTuXJwqYS3jsXY8VeHuC4W6/w5a5vGFO6JswlP
 rxUsRwtABA/tPjFdlD+VzfBNrTrD8jWI+EM4bizCd9tkbvsR9GWOwZKyWZYLr++3X+A1ULlT4Fk
 lvEolg7beLAjknOU5+0MwE3xKok5jXFx/rIzHqA==
X-Google-Smtp-Source: AGHT+IGOVuFmtgDB4ZKZlti8h1HNW5R33qsIGe5aBgT97QBW6StCjxMixdB7ixy5JtN/Q4HVD/m09pDHUBGfcjfmCjc=
X-Received: by 2002:a05:6a20:429a:b0:1a1:4a4c:9f5e with SMTP id
 o26-20020a056a20429a00b001a14a4c9f5emr646029pzj.49.1710208436407; Mon, 11 Mar
 2024 18:53:56 -0700 (PDT)
MIME-Version: 1.0
References: <20240311093526.1010158-1-dongmenglong.8@bytedance.com>
 <20240311093526.1010158-3-dongmenglong.8@bytedance.com>
 <CAADnVQK57PziY+xdzW=d3HaG-bn87E3p9zf7thvmqV1t0iR4Yg@mail.gmail.com>
In-Reply-To: <CAADnVQK57PziY+xdzW=d3HaG-bn87E3p9zf7thvmqV1t0iR4Yg@mail.gmail.com>
From: =?UTF-8?B?5qKm6b6Z6JGj?= <dongmenglong.8@bytedance.com>
Date: Tue, 12 Mar 2024 09:53:45 +0800
Message-ID: <CALz3k9jNY8NmB-=qKogA=WVC1dGA=git_hy95UoJV2=KLfhb5g@mail.gmail.com>
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
Subject: Re: [Linux-stm32] [External] Re: [PATCH bpf-next v2 2/9] bpf:
 refactor the modules_array to ptr_array
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

T24gVHVlLCBNYXIgMTIsIDIwMjQgYXQgOTo0OeKAr0FNIEFsZXhlaSBTdGFyb3ZvaXRvdgo8YWxl
eGVpLnN0YXJvdm9pdG92QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBNb24sIE1hciAxMSwgMjAy
NCBhdCAyOjM04oCvQU0gTWVuZ2xvbmcgRG9uZwo+IDxkb25nbWVuZ2xvbmcuOEBieXRlZGFuY2Uu
Y29tPiB3cm90ZToKPiA+Cj4gPiBSZWZhY3RvciB0aGUgc3RydWN0IG1vZHVsZXNfYXJyYXkgdG8g
bW9yZSBnZW5lcmFsIHN0cnVjdCBwdHJfYXJyYXksIHdoaWNoCj4gPiBpcyB1c2VkIHRvIHN0b3Jl
IHRoZSBwb2ludGVycy4KPiA+Cj4gPiBNZWFud2hpbGVzLCBpbnRyb2R1Y2UgdGhlIGJwZl90cnlf
YWRkX3B0cigpLCB3aGljaCBjaGVja3MgdGhlIGV4aXN0aW5nIG9mCj4gPiB0aGUgcHRyIGJlZm9y
ZSBhZGRpbmcgaXQgdG8gdGhlIGFycmF5Lgo+ID4KPiA+IFNlZW1zIGl0IHNob3VsZCBiZSBtb3Zl
ZCB0byBhbm90aGVyIGZpbGVzIGluICJsaWIiLCBhbmQgSSdtIG5vdCBzdXJlIHdoZXJlCj4gPiB0
byBhZGQgaXQgbm93LCBhbmQgbGV0J3MgbW92ZSBpdCB0byBrZXJuZWwvYnBmL3N5c2NhbGwuYyBm
b3Igbm93Lgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IE1lbmdsb25nIERvbmcgPGRvbmdtZW5nbG9u
Zy44QGJ5dGVkYW5jZS5jb20+Cj4gPiAtLS0KPiA+ICBpbmNsdWRlL2xpbnV4L2JwZi5oICAgICAg
fCAxMCArKysrKysrKysKPiA+ICBrZXJuZWwvYnBmL3N5c2NhbGwuYyAgICAgfCAzNyArKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrCj4gPiAga2VybmVsL3RyYWNlL2JwZl90cmFjZS5jIHwg
NDggKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ID4gIDMgZmlsZXMg
Y2hhbmdlZCwgNTQgaW5zZXJ0aW9ucygrKSwgNDEgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAt
LWdpdCBhL2luY2x1ZGUvbGludXgvYnBmLmggYi9pbmNsdWRlL2xpbnV4L2JwZi5oCj4gPiBpbmRl
eCAwZjY3N2ZkY2ZjYzcuLjk5Nzc2NWNkZjQ3NCAxMDA2NDQKPiA+IC0tLSBhL2luY2x1ZGUvbGlu
dXgvYnBmLmgKPiA+ICsrKyBiL2luY2x1ZGUvbGludXgvYnBmLmgKPiA+IEBAIC0zMDQsNiArMzA0
LDE2IEBAIHN0cnVjdCBicGZfbWFwIHsKPiA+ICAgICAgICAgczY0IF9fcGVyY3B1ICplbGVtX2Nv
dW50Owo+ID4gIH07Cj4gPgo+ID4gK3N0cnVjdCBwdHJfYXJyYXkgewo+ID4gKyAgICAgICB2b2lk
ICoqcHRyczsKPiA+ICsgICAgICAgaW50IGNudDsKPiA+ICsgICAgICAgaW50IGNhcDsKPiA+ICt9
Owo+ID4gKwo+ID4gK2ludCBicGZfYWRkX3B0cihzdHJ1Y3QgcHRyX2FycmF5ICphcnIsIHZvaWQg
KnB0cik7Cj4gPiArYm9vbCBicGZfaGFzX3B0cihzdHJ1Y3QgcHRyX2FycmF5ICphcnIsIHN0cnVj
dCBtb2R1bGUgKm1vZCk7Cj4gPiAraW50IGJwZl90cnlfYWRkX3B0cihzdHJ1Y3QgcHRyX2FycmF5
ICphcnIsIHZvaWQgKnB0cik7Cj4gPiArCj4gPiAgc3RhdGljIGlubGluZSBjb25zdCBjaGFyICpi
dGZfZmllbGRfdHlwZV9uYW1lKGVudW0gYnRmX2ZpZWxkX3R5cGUgdHlwZSkKPiA+ICB7Cj4gPiAg
ICAgICAgIHN3aXRjaCAodHlwZSkgewo+ID4gZGlmZiAtLWdpdCBhL2tlcm5lbC9icGYvc3lzY2Fs
bC5jIGIva2VybmVsL2JwZi9zeXNjYWxsLmMKPiA+IGluZGV4IGY2M2Y0ZGE0ZGI1ZS4uNGYyMzBm
ZDFmOGU0IDEwMDY0NAo+ID4gLS0tIGEva2VybmVsL2JwZi9zeXNjYWxsLmMKPiA+ICsrKyBiL2tl
cm5lbC9icGYvc3lzY2FsbC5jCj4gPiBAQCAtNDc5LDYgKzQ3OSw0MyBAQCBzdGF0aWMgdm9pZCBi
cGZfbWFwX3JlbGVhc2VfbWVtY2coc3RydWN0IGJwZl9tYXAgKm1hcCkKPiA+ICB9Cj4gPiAgI2Vu
ZGlmCj4gPgo+ID4gK2ludCBicGZfYWRkX3B0cihzdHJ1Y3QgcHRyX2FycmF5ICphcnIsIHZvaWQg
KnB0cikKPiA+ICt7Cj4gPiArICAgICAgIHZvaWQgKipwdHJzOwo+ID4gKwo+ID4gKyAgICAgICBp
ZiAoYXJyLT5jbnQgPT0gYXJyLT5jYXApIHsKPiA+ICsgICAgICAgICAgICAgICBhcnItPmNhcCA9
IG1heCgxNiwgYXJyLT5jYXAgKiAzIC8gMik7Cj4gPiArICAgICAgICAgICAgICAgcHRycyA9IGty
ZWFsbG9jX2FycmF5KGFyci0+cHRycywgYXJyLT5jYXAsIHNpemVvZigqcHRycyksIEdGUF9LRVJO
RUwpOwo+ID4gKyAgICAgICAgICAgICAgIGlmICghcHRycykKPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgIHJldHVybiAtRU5PTUVNOwo+ID4gKyAgICAgICAgICAgICAgIGFyci0+cHRycyA9IHB0
cnM7Cj4gPiArICAgICAgIH0KPiA+ICsKPiA+ICsgICAgICAgYXJyLT5wdHJzW2Fyci0+Y250XSA9
IHB0cjsKPiA+ICsgICAgICAgYXJyLT5jbnQrKzsKPiA+ICsgICAgICAgcmV0dXJuIDA7Cj4gPiAr
fQo+ID4gKwo+ID4gK2Jvb2wgYnBmX2hhc19wdHIoc3RydWN0IHB0cl9hcnJheSAqYXJyLCBzdHJ1
Y3QgbW9kdWxlICptb2QpCj4KPiBEb24ndCB5b3UgbmVlZCAndm9pZCAqbW9kJyBoZXJlPwo+CgpP
b3BzLCBpdCBzaG91bGQgYmUgdm9pZCAqcHRyIGhlcmUsIG15IG1pc3Rha2V+Cgo+ID4gK3sKPiA+
ICsgICAgICAgaW50IGk7Cj4gPiArCj4gPiArICAgICAgIGZvciAoaSA9IGFyci0+Y250IC0gMTsg
aSA+PSAwOyBpLS0pIHsKPiA+ICsgICAgICAgICAgICAgICBpZiAoYXJyLT5wdHJzW2ldID09IG1v
ZCkKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiB0cnVlOwo+ID4gKyAgICAgICB9
Cj4gPiArICAgICAgIHJldHVybiBmYWxzZTsKPiA+ICt9Cj4KPiAuLi4KPgo+ID4gLSAgICAgICAg
ICAgICAgIGtwcm9iZV9tdWx0aV9wdXRfbW9kdWxlcyhhcnIubW9kcywgYXJyLm1vZHNfY250KTsK
PiA+IC0gICAgICAgICAgICAgICBrZnJlZShhcnIubW9kcyk7Cj4gPiArICAgICAgICAgICAgICAg
a3Byb2JlX211bHRpX3B1dF9tb2R1bGVzKChzdHJ1Y3QgbW9kdWxlICoqKWFyci5wdHJzLCBhcnIu
Y250KTsKPgo+IERvIHlvdSByZWFsbHkgbmVlZCB0byB0eXBlIGNhc3Q/IENvbXBpbGVyIGRvZXNu
J3QgY29udmVydCB2b2lkKioKPiBhdXRvbWF0aWNhbGx5PwoKWWVhaCwgdGhlIGNvbXBpbGVyIHJl
cG9ydHMgZXJyb3JzIHdpdGhvdXQgdGhpcyBjYXN0aW5nLgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgt
c3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
