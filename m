Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D2611878C7D
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Mar 2024 02:49:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7E49BC6DD9D;
	Tue, 12 Mar 2024 01:49:11 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0C301C6DD73
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Mar 2024 01:49:09 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-33e6aca1ca9so4851470f8f.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Mar 2024 18:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710208149; x=1710812949;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ICoXbIzO4I+bZEbVSY6istDZPedE1yOS9/In+VkiPyM=;
 b=QdkK+iW5/3nbaM2evJKU6rTZ2RjuPNSjpcF71LYrLXUTrhnSIIV8xgSXgUU1J4ORuP
 GupN+vMV1TENXzZoIv+H4Jd7181WQ18sCduaTbEBBPZHdp9G9IiaIGgPc6jrL9t23PP6
 5HOzdHH7CXIz3fx41lzhRHXP8JqyN3706R1MkZNh/3Ltz2s+7ZeQ2WUV0xnXZI5vYApi
 YGUJsOF673jDcbtJwLErF9O2pLhxd/vxbvAYat4Kq6D0KTHJ4EjT15dt09TomRcMlng1
 jxuQ6cpBEDwEzG8FADYNgxJ2N6WcTIjCPeGlNGqvy+2P3HgPxNqxh538F9Dt4s7rgbr8
 N9qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710208149; x=1710812949;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ICoXbIzO4I+bZEbVSY6istDZPedE1yOS9/In+VkiPyM=;
 b=hVTfD4NoDIL1QBayqaCBcNXNml/pkLmEDOrBu2KbGywsWCYb6uDIrA1RqzPiA0JiI1
 mtTWJYADdZmnRtxaRAyGNOoCoBEvO6UZZ2cVeC1L+aOHd66tWv0o6c/cqpASpW+AGBx/
 S30ZF4JGHcdxRBFfWIn9tR+XLgKjAgXdtQrHSJ1DpAgBFg7iLduQAJILukL9MeK3tcvz
 jCLtfu4ImfIXG9uSsDftkGgUcSFcXoEEWQ/VzhuhapHOa2ctiBlE3rqFXqYPcb6edJts
 X8efTPhCH6UwSWu1PHaTMNbbXy1LNOm9to14ZCEjG8XXlz7icFi/KqHYkOaspeWb328K
 Cc5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCU32Q4sUyzSFNxEz2BQKYrbZUUDuHr/yBk+swVn5Q+dWY7P65GsGmHx4fJSdwFEMQ2y4/NI7ubzK11NvmQUz0EHxNH/UKC7e7mYMSVktFLYhHNjeAFvpyb8
X-Gm-Message-State: AOJu0YzBjUOiR+NeAQuPUW5Prw5bzOpy+rg8IaX5vD8sr66elI9Jlys3
 n8GV2aaBC1Qz+tbCAYaB+GUCt98x8WgK5wENFKuHxf3JL4G3shXBsBW201vkV7M0oECXXM65p4a
 orNVEkBIExy06kulwTwYdjvzAnkU=
X-Google-Smtp-Source: AGHT+IH0ci03Wi0rl7FcYFahEcFUmauqEvWpxNG5kQwx4t0HGO1FQxQnKW46ZdilMOOTy/X9M79z6M4R5QoZlsdJz5M=
X-Received: by 2002:adf:f045:0:b0:33e:a5e1:eccc with SMTP id
 t5-20020adff045000000b0033ea5e1ecccmr214107wro.68.1710208149304; Mon, 11 Mar
 2024 18:49:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240311093526.1010158-1-dongmenglong.8@bytedance.com>
 <20240311093526.1010158-3-dongmenglong.8@bytedance.com>
In-Reply-To: <20240311093526.1010158-3-dongmenglong.8@bytedance.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Mon, 11 Mar 2024 18:48:58 -0700
Message-ID: <CAADnVQK57PziY+xdzW=d3HaG-bn87E3p9zf7thvmqV1t0iR4Yg@mail.gmail.com>
To: Menglong Dong <dongmenglong.8@bytedance.com>
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
Subject: Re: [Linux-stm32] [PATCH bpf-next v2 2/9] bpf: refactor the
	modules_array to ptr_array
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

T24gTW9uLCBNYXIgMTEsIDIwMjQgYXQgMjozNOKAr0FNIE1lbmdsb25nIERvbmcKPGRvbmdtZW5n
bG9uZy44QGJ5dGVkYW5jZS5jb20+IHdyb3RlOgo+Cj4gUmVmYWN0b3IgdGhlIHN0cnVjdCBtb2R1
bGVzX2FycmF5IHRvIG1vcmUgZ2VuZXJhbCBzdHJ1Y3QgcHRyX2FycmF5LCB3aGljaAo+IGlzIHVz
ZWQgdG8gc3RvcmUgdGhlIHBvaW50ZXJzLgo+Cj4gTWVhbndoaWxlcywgaW50cm9kdWNlIHRoZSBi
cGZfdHJ5X2FkZF9wdHIoKSwgd2hpY2ggY2hlY2tzIHRoZSBleGlzdGluZyBvZgo+IHRoZSBwdHIg
YmVmb3JlIGFkZGluZyBpdCB0byB0aGUgYXJyYXkuCj4KPiBTZWVtcyBpdCBzaG91bGQgYmUgbW92
ZWQgdG8gYW5vdGhlciBmaWxlcyBpbiAibGliIiwgYW5kIEknbSBub3Qgc3VyZSB3aGVyZQo+IHRv
IGFkZCBpdCBub3csIGFuZCBsZXQncyBtb3ZlIGl0IHRvIGtlcm5lbC9icGYvc3lzY2FsbC5jIGZv
ciBub3cuCj4KPiBTaWduZWQtb2ZmLWJ5OiBNZW5nbG9uZyBEb25nIDxkb25nbWVuZ2xvbmcuOEBi
eXRlZGFuY2UuY29tPgo+IC0tLQo+ICBpbmNsdWRlL2xpbnV4L2JwZi5oICAgICAgfCAxMCArKysr
KysrKysKPiAga2VybmVsL2JwZi9zeXNjYWxsLmMgICAgIHwgMzcgKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKwo+ICBrZXJuZWwvdHJhY2UvYnBmX3RyYWNlLmMgfCA0OCArKysrKystLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gIDMgZmlsZXMgY2hhbmdlZCwgNTQgaW5z
ZXJ0aW9ucygrKSwgNDEgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51
eC9icGYuaCBiL2luY2x1ZGUvbGludXgvYnBmLmgKPiBpbmRleCAwZjY3N2ZkY2ZjYzcuLjk5Nzc2
NWNkZjQ3NCAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2xpbnV4L2JwZi5oCj4gKysrIGIvaW5jbHVk
ZS9saW51eC9icGYuaAo+IEBAIC0zMDQsNiArMzA0LDE2IEBAIHN0cnVjdCBicGZfbWFwIHsKPiAg
ICAgICAgIHM2NCBfX3BlcmNwdSAqZWxlbV9jb3VudDsKPiAgfTsKPgo+ICtzdHJ1Y3QgcHRyX2Fy
cmF5IHsKPiArICAgICAgIHZvaWQgKipwdHJzOwo+ICsgICAgICAgaW50IGNudDsKPiArICAgICAg
IGludCBjYXA7Cj4gK307Cj4gKwo+ICtpbnQgYnBmX2FkZF9wdHIoc3RydWN0IHB0cl9hcnJheSAq
YXJyLCB2b2lkICpwdHIpOwo+ICtib29sIGJwZl9oYXNfcHRyKHN0cnVjdCBwdHJfYXJyYXkgKmFy
ciwgc3RydWN0IG1vZHVsZSAqbW9kKTsKPiAraW50IGJwZl90cnlfYWRkX3B0cihzdHJ1Y3QgcHRy
X2FycmF5ICphcnIsIHZvaWQgKnB0cik7Cj4gKwo+ICBzdGF0aWMgaW5saW5lIGNvbnN0IGNoYXIg
KmJ0Zl9maWVsZF90eXBlX25hbWUoZW51bSBidGZfZmllbGRfdHlwZSB0eXBlKQo+ICB7Cj4gICAg
ICAgICBzd2l0Y2ggKHR5cGUpIHsKPiBkaWZmIC0tZ2l0IGEva2VybmVsL2JwZi9zeXNjYWxsLmMg
Yi9rZXJuZWwvYnBmL3N5c2NhbGwuYwo+IGluZGV4IGY2M2Y0ZGE0ZGI1ZS4uNGYyMzBmZDFmOGU0
IDEwMDY0NAo+IC0tLSBhL2tlcm5lbC9icGYvc3lzY2FsbC5jCj4gKysrIGIva2VybmVsL2JwZi9z
eXNjYWxsLmMKPiBAQCAtNDc5LDYgKzQ3OSw0MyBAQCBzdGF0aWMgdm9pZCBicGZfbWFwX3JlbGVh
c2VfbWVtY2coc3RydWN0IGJwZl9tYXAgKm1hcCkKPiAgfQo+ICAjZW5kaWYKPgo+ICtpbnQgYnBm
X2FkZF9wdHIoc3RydWN0IHB0cl9hcnJheSAqYXJyLCB2b2lkICpwdHIpCj4gK3sKPiArICAgICAg
IHZvaWQgKipwdHJzOwo+ICsKPiArICAgICAgIGlmIChhcnItPmNudCA9PSBhcnItPmNhcCkgewo+
ICsgICAgICAgICAgICAgICBhcnItPmNhcCA9IG1heCgxNiwgYXJyLT5jYXAgKiAzIC8gMik7Cj4g
KyAgICAgICAgICAgICAgIHB0cnMgPSBrcmVhbGxvY19hcnJheShhcnItPnB0cnMsIGFyci0+Y2Fw
LCBzaXplb2YoKnB0cnMpLCBHRlBfS0VSTkVMKTsKPiArICAgICAgICAgICAgICAgaWYgKCFwdHJz
KQo+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAtRU5PTUVNOwo+ICsgICAgICAgICAg
ICAgICBhcnItPnB0cnMgPSBwdHJzOwo+ICsgICAgICAgfQo+ICsKPiArICAgICAgIGFyci0+cHRy
c1thcnItPmNudF0gPSBwdHI7Cj4gKyAgICAgICBhcnItPmNudCsrOwo+ICsgICAgICAgcmV0dXJu
IDA7Cj4gK30KPiArCj4gK2Jvb2wgYnBmX2hhc19wdHIoc3RydWN0IHB0cl9hcnJheSAqYXJyLCBz
dHJ1Y3QgbW9kdWxlICptb2QpCgpEb24ndCB5b3UgbmVlZCAndm9pZCAqbW9kJyBoZXJlPwoKPiAr
ewo+ICsgICAgICAgaW50IGk7Cj4gKwo+ICsgICAgICAgZm9yIChpID0gYXJyLT5jbnQgLSAxOyBp
ID49IDA7IGktLSkgewo+ICsgICAgICAgICAgICAgICBpZiAoYXJyLT5wdHJzW2ldID09IG1vZCkK
PiArICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gdHJ1ZTsKPiArICAgICAgIH0KPiArICAg
ICAgIHJldHVybiBmYWxzZTsKPiArfQoKLi4uCgo+IC0gICAgICAgICAgICAgICBrcHJvYmVfbXVs
dGlfcHV0X21vZHVsZXMoYXJyLm1vZHMsIGFyci5tb2RzX2NudCk7Cj4gLSAgICAgICAgICAgICAg
IGtmcmVlKGFyci5tb2RzKTsKPiArICAgICAgICAgICAgICAga3Byb2JlX211bHRpX3B1dF9tb2R1
bGVzKChzdHJ1Y3QgbW9kdWxlICoqKWFyci5wdHJzLCBhcnIuY250KTsKCkRvIHlvdSByZWFsbHkg
bmVlZCB0byB0eXBlIGNhc3Q/IENvbXBpbGVyIGRvZXNuJ3QgY29udmVydCB2b2lkKioKYXV0b21h
dGljYWxseT8KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlz
dGluZm8vbGludXgtc3RtMzIK
