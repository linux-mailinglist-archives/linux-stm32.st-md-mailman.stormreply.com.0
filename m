Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A547B5418
	for <lists+linux-stm32@lfdr.de>; Mon,  2 Oct 2023 15:37:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 641F3C6C83E;
	Mon,  2 Oct 2023 13:37:14 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C352DC6B456
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Oct 2023 12:49:25 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-40662119cd0so88495e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 02 Oct 2023 05:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1696250965; x=1696855765;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hDLvwoAl09xn/ODnoM44OyqQjxJOIWQGJH/GqYuQ4IQ=;
 b=Zaynz6qYlF0wv9V/B1ouoAcyAkbumzW+mtcRL59MQ2O/Hpru3vaumwqPsofOUKK4jJ
 QeeDXy9lA8dfQ29og2jr7c9y1FhoEg49/+37ZT/nSWrDNXbvU4C1xSrmbkHQFIJT9hZn
 7T+7fZn2fWC4QtVnQfFoZ5SIC5+NTifZ3kcVGjMAypstMrFo4Nm2JXo5Jk1JplwkGch/
 wvWLgtqFzWSYGFWIOjILWI2k5DozyOY+Tg0yrbD1f8dfibCZqum4lEzrJ+/WBE0a5sks
 3plqI6nh18/ColLh+zUmzt56zvzfd8vkdPytSuuArPkICWRxP1D/vevvXWXmdYog6P2m
 MKLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696250965; x=1696855765;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hDLvwoAl09xn/ODnoM44OyqQjxJOIWQGJH/GqYuQ4IQ=;
 b=dgaEs2VhBO4qzHBMnA4CuYH/rdBAc/bCSznaSSE6LXOTuOP97DvumV2CCs1LnbU9ty
 XAFvnWfPc05P60gTv/pR4FB8CoZXqd4PyHKH801aQEmy26q+eD0KB1kmmjn8Biutj0ps
 qtBT0nwoh9mhwLKQTkSqdf2cZBTMjr00N5vd7a9J+iZiCBzM3Ltgi9cZ/j6EMZFVELnH
 Txj4bQspEmIa+Wo/b+TIIM6+5H/jUa0c9YmEilWTiTTxFaLLf3oaN7ScVQRtGmKAVFGK
 QcgPBX2+A8b0C3KVTNPO35nOgoMqLlG5qhvALu1O8Q1cX3TjDEsw+e6Fpxcf9wtoq9Pd
 i8ew==
X-Gm-Message-State: AOJu0YyB2Dt/8BK06CuxSn/pKFu8f1oRfGpy4i9uuUy+5WqIoBa1dbEK
 0ZzF3dXpkvqHOCq6a+vQaLbKKZ2r6+MA/d5YD9YWlw==
X-Google-Smtp-Source: AGHT+IFkChCr2dgLSNOTtye7/v4YH4Dpn5ajICXk8XtivhRpaTZ37y6Wo/8M6Uei3pQOh65cVLbvNiLxzGIYrb/VTeA=
X-Received: by 2002:a05:600c:4688:b0:405:35bf:7362 with SMTP id
 p8-20020a05600c468800b0040535bf7362mr113965wmo.0.1696250964910; Mon, 02 Oct
 2023 05:49:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230922111247.497-1-ansuelsmth@gmail.com>
 <CANn89iJtrpVQZbeAezd7S4p_yCRSFzcsBMgW+y9YhxOrCv463A@mail.gmail.com>
 <65181064.050a0220.7887c.c7ee@mx.google.com>
 <CANn89iJqkpRu8rd_M7HCzaZQV5P_XTCzbKe5DOwnJkTRDZWEWw@mail.gmail.com>
 <651ab7b8.050a0220.e15ed.9d6a@mx.google.com>
 <CANn89iJqFC-Z3NZwT+CXEG7R9rc9g4LRwNm6Zm=nZKpD3Mon7Q@mail.gmail.com>
 <651abb07.050a0220.5435c.9eae@mx.google.com>
In-Reply-To: <651abb07.050a0220.5435c.9eae@mx.google.com>
From: Eric Dumazet <edumazet@google.com>
Date: Mon, 2 Oct 2023 14:49:11 +0200
Message-ID: <CANn89iLHMOh9Axt3xquzPjx0Dfn6obmSZJFSpzH51TKAN_nPqQ@mail.gmail.com>
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

T24gTW9uLCBPY3QgMiwgMjAyMyBhdCAyOjQz4oCvUE0gQ2hyaXN0aWFuIE1hcmFuZ2kgPGFuc3Vl
bHNtdGhAZ21haWwuY29tPiB3cm90ZToKPgo+IE9uIE1vbiwgT2N0IDAyLCAyMDIzIGF0IDAyOjM1
OjIyUE0gKzAyMDAsIEVyaWMgRHVtYXpldCB3cm90ZToKPiA+IE9uIE1vbiwgT2N0IDIsIDIwMjMg
YXQgMjoyOeKAr1BNIENocmlzdGlhbiBNYXJhbmdpIDxhbnN1ZWxzbXRoQGdtYWlsLmNvbT4gd3Jv
dGU6Cj4gPgo+ID4gPiBFaGhoIHRoZSBpZGVhIGhlcmUgd2FzIHRvIHJlZHVjZSBjb2RlIGR1cGxp
Y2F0aW9uIHNpbmNlIHRoZSB2ZXJ5IHNhbWUKPiA+ID4gdGVzdCB3aWxsIGJlIGRvbmUgaW4gc3Rt
bWFjLiBTbyBJIGd1ZXNzIHRoaXMgY29kZSBjbGVhbnVwIGlzIGEgTkFDSyBhbmQKPiA+ID4gSSBo
YXZlIHRvIGR1cGxpY2F0ZSB0aGUgdGVzdCBpbiB0aGUgc3RtbWFjIGRyaXZlci4KPiA+Cj4gPiBJ
IHNpbXBseSB3YW50ZWQgdG8gYWRkIGEgY29tbWVudCBpbiBmcm9udCBvZiB0aGlzIGZ1bmN0aW9u
L2hlbHBlciwKPiA+IGFkdmlzaW5nIG5vdCB1c2luZyBpdCB1bmxlc3MgYWJzb2x1dGVseSBuZWVk
ZWQuCj4gPgo+ID4gVGh1cyBteSBxdWVzdGlvbiAiSW4gd2hpY2ggY29udGV4dCBpcyBpdCBzYWZl
IHRvIGNhbGwgdGhpcyBoZWxwZXIgPyIKPiA+Cj4gPiBBcyBsb25nIGFzIGl0IHdhcyBwcml2YXRl
IHdpdGggYSBkcml2ZXIsIEkgZGlkIG5vdCBtaW5kLgo+ID4KPiA+IEJ1dCBpZiBtYWRlIHB1Ymxp
YyBpbiBpbmNsdWRlL2xpbnV4L25ldGRldmljZS5oLCBJIHdvdWxkIHJhdGhlciBub3QKPiA+IGhh
dmUgdG8gZXhwbGFpbgo+ID4gdG8gZnV0dXJlIHVzZXJzIHdoeSBpdCBjYW4gYmUgcHJvYmxlbWF0
aWMuCj4KPiBPaCBvayEKPgo+IFdlIGhhdmUgcGxlbnR5IG9mIGNhc2Ugc2ltaWxhciB0byB0aGlz
LiAoZXhhbXBsZSBzb21lIGNsb2NrIEFQSSB2ZXJ5Cj4gaW50ZXJuYWwgdGhhdCBzaG91bGQgbm90
IGJlIHVzZWQgbm9ybWFsbHkgb3IgcmVnbWFwIHJlbGF0ZWQpCj4KPiBJIHdpbGwgaW5jbHVkZSBz
b21lIGNvbW1lbnRzIHdhcm5pbmcgdGhhdCB0aGlzIHNob3VsZCBub3QgYmUgdXNlZCBpbgo+IG5v
cm1hbCBjaXJjdW1zdGFuY2VzIGFuZCBvdGhlciB3YXJuaW5ncy4gSWYgeW91IGhhdmUgc3VnZ2Vz
dGlvbiBvbiB3aGF0Cj4gdG8gYWRkIGZlZWwgZnJlZSB0byB3cml0ZSB0aGVtLgo+Cj4gQW55IGNs
dWUgb24gaG93IHRvIHByb2NlZWQgd2l0aCB0aGUgc2dlIGRyaXZlcj8KPgoKSSB3b3VsZCByZW1v
dmUgdXNlIG9mIHRoaXMgaGVscGVyIGZvciBzb21ldGhpbmcgd2l0aCBubyByYWNlID8KCkZlZWwg
ZnJlZSB0byBzdWJtaXQgdGhpcyA6CgooQWx0ZXJuYXRpdmUgd291bGQgYmUgdG8gY2hhbmdlIG5h
cGlfc2NoZWR1bGUoKSB0byByZXR1cm4gYSBib29sZWFuKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
bmV0L2V0aGVybmV0L2NoZWxzaW8vY3hnYjMvc2dlLmMKYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9j
aGVsc2lvL2N4Z2IzL3NnZS5jCmluZGV4IDJlOWE3NGZlMDk3MGRmMzMzMjI2YjgwYWY4NzE2ZjMw
ODY1YzAxYjcuLjA5ZDBlNmFhNGRiOTgyZTM0ODhlMGMyOGJlZDMzZTgzNDUzODAxZDAKMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L2NoZWxzaW8vY3hnYjMvc2dlLmMKKysrIGIvZHJp
dmVycy9uZXQvZXRoZXJuZXQvY2hlbHNpby9jeGdiMy9zZ2UuYwpAQCAtMjUwMSwxNCArMjUwMSw2
IEBAIHN0YXRpYyBpbnQgbmFwaV9yeF9oYW5kbGVyKHN0cnVjdCBuYXBpX3N0cnVjdAoqbmFwaSwg
aW50IGJ1ZGdldCkKICAgICAgICByZXR1cm4gd29ya19kb25lOwogfQoKLS8qCi0gKiBSZXR1cm5z
IHRydWUgaWYgdGhlIGRldmljZSBpcyBhbHJlYWR5IHNjaGVkdWxlZCBmb3IgcG9sbGluZy4KLSAq
Lwotc3RhdGljIGlubGluZSBpbnQgbmFwaV9pc19zY2hlZHVsZWQoc3RydWN0IG5hcGlfc3RydWN0
ICpuYXBpKQotewotICAgICAgIHJldHVybiB0ZXN0X2JpdChOQVBJX1NUQVRFX1NDSEVELCAmbmFw
aS0+c3RhdGUpOwotfQotCiAvKioKICAqICAgICBwcm9jZXNzX3B1cmVfcmVzcG9uc2VzIC0gcHJv
Y2VzcyBwdXJlIHJlc3BvbnNlcyBmcm9tIGEgcmVzcG9uc2UgcXVldWUKICAqICAgICBAYWRhcDog
dGhlIGFkYXB0ZXIKQEAgLTI2NzQsOSArMjY2Niw5IEBAIHN0YXRpYyBpbnQgcnNwcV9jaGVja19u
YXBpKHN0cnVjdCBzZ2VfcXNldCAqcXMpCiB7CiAgICAgICAgc3RydWN0IHNnZV9yc3BxICpxID0g
JnFzLT5yc3BxOwoKLSAgICAgICBpZiAoIW5hcGlfaXNfc2NoZWR1bGVkKCZxcy0+bmFwaSkgJiYK
LSAgICAgICAgICAgaXNfbmV3X3Jlc3BvbnNlKCZxLT5kZXNjW3EtPmNpZHhdLCBxKSkgewotICAg
ICAgICAgICAgICAgbmFwaV9zY2hlZHVsZSgmcXMtPm5hcGkpOworICAgICAgIGlmIChpc19uZXdf
cmVzcG9uc2UoJnEtPmRlc2NbcS0+Y2lkeF0sIHEpICYmCisgICAgICAgICAgIG5hcGlfc2NoZWR1
bGVfcHJlcCgmcXMtPm5hcGkpKSB7CisgICAgICAgICAgICAgICBfX25hcGlfc2NoZWR1bGUoJnFz
LT5uYXBpKTsKICAgICAgICAgICAgICAgIHJldHVybiAxOwogICAgICAgIH0KICAgICAgICByZXR1
cm4gMDsKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtc3RtMzIK
