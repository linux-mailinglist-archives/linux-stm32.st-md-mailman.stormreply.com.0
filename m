Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C41037B541B
	for <lists+linux-stm32@lfdr.de>; Mon,  2 Oct 2023 15:37:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 81360C6C842;
	Mon,  2 Oct 2023 13:37:14 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8542AC6B456
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Oct 2023 12:56:36 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-50348c54439so5007e87.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 02 Oct 2023 05:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1696251396; x=1696856196;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vhnS1jID/E/HPZQRwttboOmGY8j/6QNBSIOKDXt9Rx0=;
 b=TRLjXKOKrtBap/bjKF4Kooxm6tPhbfZqKikWs9goXzbYfSSWA/Ky/jv8guUhGxEGLd
 onA8VorzpXQDbkY0hbFf20BNntcTwArzGrYPw5fn7/ACHjSPXJ5hdVh8Nd/mZ85EpyMC
 hCk7sqnm08dr2y6Qe0oz1y4ZiYAuEOsqzFL/C0fjSBZl73qpsMBKMqhW4mAJqIpTWx9x
 zU2NOHZRth1QtaG5C6eD8tyvYawdmEE9zGiKZiWfY2eErgWsqGWUHkTjO2Yy1V9ynnn2
 o8ZhR8TxHKCwV4jRV+uvkG4KAiHwEBdAF659J0p1Qj2jhfpoOGamaaBaA09CqRw7FxKY
 zeMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696251396; x=1696856196;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vhnS1jID/E/HPZQRwttboOmGY8j/6QNBSIOKDXt9Rx0=;
 b=fQi0PTyP+CLf8b814WFBzAEnBlo55haJpZXHMkBvOxALA28jA0SRNkD3zfHyTdCRI6
 jqlA7LhLuitfIOKiCW+XsrjWAqJsQrrrJDiPFYkv9ppfUo5DuJEUkogl+ojWjRwgSzcG
 KyuKRUw89jD9HT82todpjWjitu9DP/7TILF3djogatA16U2radP6dDl/BKF8sZI/1cQz
 oOborWs/MiEKG5SvIQLeVP56AJ4ihKbcsTPpnmYInELaIexT1GTizUeldUt8CFdlfesl
 MJHzOh/YdAVjb0VDnjVtvW9uDlHSJkd15Kd9lVGaRqWcJnVQMoJGvpQVmeRpvOWMnIZs
 B7hA==
X-Gm-Message-State: AOJu0YxSc776OyuRDP2p7IQoVzGliIVd04iKyr4D/WpJMBi8WWU+CdQF
 Vnhd7bgORoqubjqEo7MYfLUrzHG4SHnDSfKjHoLv1Q==
X-Google-Smtp-Source: AGHT+IH2BpKCB5EMiwqckAjJ6wIMKO3DV/EsUH2KYkYKWp0emjrHOycC6QBqa5b6EXDe3hYKjUZFW0cUS4ODnBk/VRc=
X-Received: by 2002:ac2:544b:0:b0:502:c615:99b0 with SMTP id
 d11-20020ac2544b000000b00502c61599b0mr68351lfn.4.1696251395319; Mon, 02 Oct
 2023 05:56:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230922111247.497-1-ansuelsmth@gmail.com>
 <CANn89iJtrpVQZbeAezd7S4p_yCRSFzcsBMgW+y9YhxOrCv463A@mail.gmail.com>
 <65181064.050a0220.7887c.c7ee@mx.google.com>
 <CANn89iJqkpRu8rd_M7HCzaZQV5P_XTCzbKe5DOwnJkTRDZWEWw@mail.gmail.com>
 <651ab7b8.050a0220.e15ed.9d6a@mx.google.com>
 <CANn89iJqFC-Z3NZwT+CXEG7R9rc9g4LRwNm6Zm=nZKpD3Mon7Q@mail.gmail.com>
 <651abb07.050a0220.5435c.9eae@mx.google.com>
 <CANn89iLHMOh9Axt3xquzPjx0Dfn6obmSZJFSpzH51TKAN_nPqQ@mail.gmail.com>
 <651abda3.df0a0220.a04f0.12df@mx.google.com>
In-Reply-To: <651abda3.df0a0220.a04f0.12df@mx.google.com>
From: Eric Dumazet <edumazet@google.com>
Date: Mon, 2 Oct 2023 14:56:24 +0200
Message-ID: <CANn89iLKBqsV6=jP1viSNMpA1W8r5mJEitjH3+RU5gEOQFYEtg@mail.gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>
X-Mailman-Approved-At: Mon, 02 Oct 2023 13:37:12 +0000
Cc: linux-wireless@vger.kernel.org, Ping-Ke Shih <pkshih@realtek.com>,
 Jiri Pirko <jiri@resnulli.us>, Simon Horman <horms@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org,
 Kalle Valo <kvalo@kernel.org>,
 Vincent Whitchurch <vincent.whitchurch@axis.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Hangbin Liu <liuhangbin@gmail.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Raju Rangoju <rajur@chelsio.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [net-next PATCH 1/3] net: introduce
	napi_is_scheduled helper
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

T24gTW9uLCBPY3QgMiwgMjAyMyBhdCAyOjU14oCvUE0gQ2hyaXN0aWFuIE1hcmFuZ2kgPGFuc3Vl
bHNtdGhAZ21haWwuY29tPiB3cm90ZToKPgo+IE9uIE1vbiwgT2N0IDAyLCAyMDIzIGF0IDAyOjQ5
OjExUE0gKzAyMDAsIEVyaWMgRHVtYXpldCB3cm90ZToKPiA+IE9uIE1vbiwgT2N0IDIsIDIwMjMg
YXQgMjo0M+KAr1BNIENocmlzdGlhbiBNYXJhbmdpIDxhbnN1ZWxzbXRoQGdtYWlsLmNvbT4gd3Jv
dGU6Cj4gPiA+Cj4gPiA+IE9uIE1vbiwgT2N0IDAyLCAyMDIzIGF0IDAyOjM1OjIyUE0gKzAyMDAs
IEVyaWMgRHVtYXpldCB3cm90ZToKPiA+ID4gPiBPbiBNb24sIE9jdCAyLCAyMDIzIGF0IDI6Mjni
gK9QTSBDaHJpc3RpYW4gTWFyYW5naSA8YW5zdWVsc210aEBnbWFpbC5jb20+IHdyb3RlOgo+ID4g
PiA+Cj4gPiA+ID4gPiBFaGhoIHRoZSBpZGVhIGhlcmUgd2FzIHRvIHJlZHVjZSBjb2RlIGR1cGxp
Y2F0aW9uIHNpbmNlIHRoZSB2ZXJ5IHNhbWUKPiA+ID4gPiA+IHRlc3Qgd2lsbCBiZSBkb25lIGlu
IHN0bW1hYy4gU28gSSBndWVzcyB0aGlzIGNvZGUgY2xlYW51cCBpcyBhIE5BQ0sgYW5kCj4gPiA+
ID4gPiBJIGhhdmUgdG8gZHVwbGljYXRlIHRoZSB0ZXN0IGluIHRoZSBzdG1tYWMgZHJpdmVyLgo+
ID4gPiA+Cj4gPiA+ID4gSSBzaW1wbHkgd2FudGVkIHRvIGFkZCBhIGNvbW1lbnQgaW4gZnJvbnQg
b2YgdGhpcyBmdW5jdGlvbi9oZWxwZXIsCj4gPiA+ID4gYWR2aXNpbmcgbm90IHVzaW5nIGl0IHVu
bGVzcyBhYnNvbHV0ZWx5IG5lZWRlZC4KPiA+ID4gPgo+ID4gPiA+IFRodXMgbXkgcXVlc3Rpb24g
IkluIHdoaWNoIGNvbnRleHQgaXMgaXQgc2FmZSB0byBjYWxsIHRoaXMgaGVscGVyID8iCj4gPiA+
ID4KPiA+ID4gPiBBcyBsb25nIGFzIGl0IHdhcyBwcml2YXRlIHdpdGggYSBkcml2ZXIsIEkgZGlk
IG5vdCBtaW5kLgo+ID4gPiA+Cj4gPiA+ID4gQnV0IGlmIG1hZGUgcHVibGljIGluIGluY2x1ZGUv
bGludXgvbmV0ZGV2aWNlLmgsIEkgd291bGQgcmF0aGVyIG5vdAo+ID4gPiA+IGhhdmUgdG8gZXhw
bGFpbgo+ID4gPiA+IHRvIGZ1dHVyZSB1c2VycyB3aHkgaXQgY2FuIGJlIHByb2JsZW1hdGljLgo+
ID4gPgo+ID4gPiBPaCBvayEKPiA+ID4KPiA+ID4gV2UgaGF2ZSBwbGVudHkgb2YgY2FzZSBzaW1p
bGFyIHRvIHRoaXMuIChleGFtcGxlIHNvbWUgY2xvY2sgQVBJIHZlcnkKPiA+ID4gaW50ZXJuYWwg
dGhhdCBzaG91bGQgbm90IGJlIHVzZWQgbm9ybWFsbHkgb3IgcmVnbWFwIHJlbGF0ZWQpCj4gPiA+
Cj4gPiA+IEkgd2lsbCBpbmNsdWRlIHNvbWUgY29tbWVudHMgd2FybmluZyB0aGF0IHRoaXMgc2hv
dWxkIG5vdCBiZSB1c2VkIGluCj4gPiA+IG5vcm1hbCBjaXJjdW1zdGFuY2VzIGFuZCBvdGhlciB3
YXJuaW5ncy4gSWYgeW91IGhhdmUgc3VnZ2VzdGlvbiBvbiB3aGF0Cj4gPiA+IHRvIGFkZCBmZWVs
IGZyZWUgdG8gd3JpdGUgdGhlbS4KPiA+ID4KPiA+ID4gQW55IGNsdWUgb24gaG93IHRvIHByb2Nl
ZWQgd2l0aCB0aGUgc2dlIGRyaXZlcj8KPiA+ID4KPiA+Cj4gPiBJIHdvdWxkIHJlbW92ZSB1c2Ug
b2YgdGhpcyBoZWxwZXIgZm9yIHNvbWV0aGluZyB3aXRoIG5vIHJhY2UgPwo+ID4KPiA+IEZlZWwg
ZnJlZSB0byBzdWJtaXQgdGhpcyA6Cj4gPgo+ID4gKEFsdGVybmF0aXZlIHdvdWxkIGJlIHRvIGNo
YW5nZSBuYXBpX3NjaGVkdWxlKCkgdG8gcmV0dXJuIGEgYm9vbGVhbikKPiA+Cj4KPiBUaGluayBt
b2QgbmFwaV9zY2hlZHVsZSgpIHRvIHJldHVybiBhIGJvb2wgd291bGQgcmVzdWx0IGluIG1hc3Np
dmUKPiB3YXJuaW5nIChhY3R1YWxseSBlcnJvciB3aXRoIHdlcnJvcikgd2l0aCByZXR1cm4gdmFs
dWUgbm90IGhhbmRsZWQuCj4KCkl0IHNob3VsZCBub3QsIHVubGVzcyB3ZSBhZGRlZCBhIF9fbXVz
dF9jaGVjawoKPiBJIHdpbGwgc3VibWl0IHdpdGggeW91ciBTdWdnZXN0ZWQtYnkuIE9rIGZvciB5
b3U/CgpBYnNvbHV0ZWx5LCB0aGFua3MuCgo+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQv
ZXRoZXJuZXQvY2hlbHNpby9jeGdiMy9zZ2UuYwo+ID4gYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9j
aGVsc2lvL2N4Z2IzL3NnZS5jCj4gPiBpbmRleCAyZTlhNzRmZTA5NzBkZjMzMzIyNmI4MGFmODcx
NmYzMDg2NWMwMWI3Li4wOWQwZTZhYTRkYjk4MmUzNDg4ZTBjMjhiZWQzM2U4MzQ1MzgwMWQwCj4g
PiAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L2NoZWxzaW8vY3hnYjMvc2dl
LmMKPiA+ICsrKyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L2NoZWxzaW8vY3hnYjMvc2dlLmMKPiA+
IEBAIC0yNTAxLDE0ICsyNTAxLDYgQEAgc3RhdGljIGludCBuYXBpX3J4X2hhbmRsZXIoc3RydWN0
IG5hcGlfc3RydWN0Cj4gPiAqbmFwaSwgaW50IGJ1ZGdldCkKPiA+ICAgICAgICAgcmV0dXJuIHdv
cmtfZG9uZTsKPiA+ICB9Cj4gPgo+ID4gLS8qCj4gPiAtICogUmV0dXJucyB0cnVlIGlmIHRoZSBk
ZXZpY2UgaXMgYWxyZWFkeSBzY2hlZHVsZWQgZm9yIHBvbGxpbmcuCj4gPiAtICovCj4gPiAtc3Rh
dGljIGlubGluZSBpbnQgbmFwaV9pc19zY2hlZHVsZWQoc3RydWN0IG5hcGlfc3RydWN0ICpuYXBp
KQo+ID4gLXsKPiA+IC0gICAgICAgcmV0dXJuIHRlc3RfYml0KE5BUElfU1RBVEVfU0NIRUQsICZu
YXBpLT5zdGF0ZSk7Cj4gPiAtfQo+ID4gLQo+ID4gIC8qKgo+ID4gICAqICAgICBwcm9jZXNzX3B1
cmVfcmVzcG9uc2VzIC0gcHJvY2VzcyBwdXJlIHJlc3BvbnNlcyBmcm9tIGEgcmVzcG9uc2UgcXVl
dWUKPiA+ICAgKiAgICAgQGFkYXA6IHRoZSBhZGFwdGVyCj4gPiBAQCAtMjY3NCw5ICsyNjY2LDkg
QEAgc3RhdGljIGludCByc3BxX2NoZWNrX25hcGkoc3RydWN0IHNnZV9xc2V0ICpxcykKPiA+ICB7
Cj4gPiAgICAgICAgIHN0cnVjdCBzZ2VfcnNwcSAqcSA9ICZxcy0+cnNwcTsKPiA+Cj4gPiAtICAg
ICAgIGlmICghbmFwaV9pc19zY2hlZHVsZWQoJnFzLT5uYXBpKSAmJgo+ID4gLSAgICAgICAgICAg
aXNfbmV3X3Jlc3BvbnNlKCZxLT5kZXNjW3EtPmNpZHhdLCBxKSkgewo+ID4gLSAgICAgICAgICAg
ICAgIG5hcGlfc2NoZWR1bGUoJnFzLT5uYXBpKTsKPiA+ICsgICAgICAgaWYgKGlzX25ld19yZXNw
b25zZSgmcS0+ZGVzY1txLT5jaWR4XSwgcSkgJiYKPiA+ICsgICAgICAgICAgIG5hcGlfc2NoZWR1
bGVfcHJlcCgmcXMtPm5hcGkpKSB7Cj4gPiArICAgICAgICAgICAgICAgX19uYXBpX3NjaGVkdWxl
KCZxcy0+bmFwaSk7Cj4gPiAgICAgICAgICAgICAgICAgcmV0dXJuIDE7Cj4gPiAgICAgICAgIH0K
PiA+ICAgICAgICAgcmV0dXJuIDA7Cj4KPiAtLQo+ICAgICAgICAgQW5zdWVsCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcg
bGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
