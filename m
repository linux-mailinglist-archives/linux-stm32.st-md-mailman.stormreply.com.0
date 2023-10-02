Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D61D17B541C
	for <lists+linux-stm32@lfdr.de>; Mon,  2 Oct 2023 15:37:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8FFCFC6C844;
	Mon,  2 Oct 2023 13:37:14 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ADC6CC6B456
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Oct 2023 12:59:38 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-51e24210395so14034a12.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 02 Oct 2023 05:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1696251578; x=1696856378;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GQNNYMHbbXj3ScZMcNdV4XQ6wHyCHAuYoxBdko5O+4A=;
 b=U6R/ZTrcRU7XleXY4s+6hGWs63TuTyUeNpUBIXpLQFPTQ2lKBS+1UZgG0hWbHKC/Pa
 tobCLmtKUM9XieIJKvkZQx55I4jPys7v24CiWUhjhTB75UWGIxDeIsv0tdvMVzp9jZ5k
 Hdai82ct8lHtckdtThYAZLD3TCUPBi6/8brtL5v5GXo1ZWv5/h89xZa/ibEu7XW/e3Oy
 /Kop6SkY/Uxt1xxrOi2IoUgHRN26IHI68c7gr7MpzqLynS3GX4v0DsT+FX3IVKJOlpSL
 e1o2q2tpW3BU7Zfs8+wqx3qsQnCRepry1B+8cGgEenW3QCYEniX0hd8Ec+eKdr5/TbhX
 9mTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696251578; x=1696856378;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GQNNYMHbbXj3ScZMcNdV4XQ6wHyCHAuYoxBdko5O+4A=;
 b=AjKphF5v1RLvUDpTeDvdL9YXkZgHrlizzwu8JZEOQPR3oWJL4jMXTdpyyAs+nsTPPE
 TBV6APbiVboROBnQkELFoGiQGzEpDPqUcCZER1C3Fs9gLXPNR7XLop2DFtzre5sTia7G
 j64uHPglaKZscNQb6rj0qKEXOPa/TVwh6MfrFbeboTA0LUu728rd0e49L9Vsvrlxd+gw
 3NfEXXTce4t9cRjQzNZ9iDvZQEour48HBcC/74tNaP2dsy0YMC2AdCsBMtSh5HLcP+2y
 ZUtIDKkCLjO/gk98RK63M4dK++1HWPZYNCTgo3WZy/iLgj18wEqf8HLEU5X8KLlmREvM
 UHmQ==
X-Gm-Message-State: AOJu0Yx2pbUZTj5JnHwWH3NLYdWQxcE6Qyq9oFmfTG9V918Ev0gM6cI0
 p7GHonkpgo0V4kKXqQG/FtZqPrG6W8ytRh+GBFkz1g==
X-Google-Smtp-Source: AGHT+IHioJWOPzoI5EaTx/MPQvZESSXI2u2AEjqrkEOsD9g2pkbMR/w1XAKTmdUWaRmWmyFQohh7L3YNRqOavMQhIcw=
X-Received: by 2002:a50:8d17:0:b0:52f:5697:8dec with SMTP id
 s23-20020a508d17000000b0052f56978decmr116826eds.4.1696251577874; Mon, 02 Oct
 2023 05:59:37 -0700 (PDT)
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
 <CANn89iLKBqsV6=jP1viSNMpA1W8r5mJEitjH3+RU5gEOQFYEtg@mail.gmail.com>
In-Reply-To: <CANn89iLKBqsV6=jP1viSNMpA1W8r5mJEitjH3+RU5gEOQFYEtg@mail.gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Mon, 2 Oct 2023 14:59:26 +0200
Message-ID: <CANn89iKuTLk+pWGxR36VgWUVnz2inYdqPvJP6_e8nu4TRgUO=w@mail.gmail.com>
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

T24gTW9uLCBPY3QgMiwgMjAyMyBhdCAyOjU24oCvUE0gRXJpYyBEdW1hemV0IDxlZHVtYXpldEBn
b29nbGUuY29tPiB3cm90ZToKPgo+IE9uIE1vbiwgT2N0IDIsIDIwMjMgYXQgMjo1NeKAr1BNIENo
cmlzdGlhbiBNYXJhbmdpIDxhbnN1ZWxzbXRoQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24g
TW9uLCBPY3QgMDIsIDIwMjMgYXQgMDI6NDk6MTFQTSArMDIwMCwgRXJpYyBEdW1hemV0IHdyb3Rl
Ogo+ID4gPiBPbiBNb24sIE9jdCAyLCAyMDIzIGF0IDI6NDPigK9QTSBDaHJpc3RpYW4gTWFyYW5n
aSA8YW5zdWVsc210aEBnbWFpbC5jb20+IHdyb3RlOgo+ID4gPiA+Cj4gPiA+ID4gT24gTW9uLCBP
Y3QgMDIsIDIwMjMgYXQgMDI6MzU6MjJQTSArMDIwMCwgRXJpYyBEdW1hemV0IHdyb3RlOgo+ID4g
PiA+ID4gT24gTW9uLCBPY3QgMiwgMjAyMyBhdCAyOjI54oCvUE0gQ2hyaXN0aWFuIE1hcmFuZ2kg
PGFuc3VlbHNtdGhAZ21haWwuY29tPiB3cm90ZToKPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IEVoaGgg
dGhlIGlkZWEgaGVyZSB3YXMgdG8gcmVkdWNlIGNvZGUgZHVwbGljYXRpb24gc2luY2UgdGhlIHZl
cnkgc2FtZQo+ID4gPiA+ID4gPiB0ZXN0IHdpbGwgYmUgZG9uZSBpbiBzdG1tYWMuIFNvIEkgZ3Vl
c3MgdGhpcyBjb2RlIGNsZWFudXAgaXMgYSBOQUNLIGFuZAo+ID4gPiA+ID4gPiBJIGhhdmUgdG8g
ZHVwbGljYXRlIHRoZSB0ZXN0IGluIHRoZSBzdG1tYWMgZHJpdmVyLgo+ID4gPiA+ID4KPiA+ID4g
PiA+IEkgc2ltcGx5IHdhbnRlZCB0byBhZGQgYSBjb21tZW50IGluIGZyb250IG9mIHRoaXMgZnVu
Y3Rpb24vaGVscGVyLAo+ID4gPiA+ID4gYWR2aXNpbmcgbm90IHVzaW5nIGl0IHVubGVzcyBhYnNv
bHV0ZWx5IG5lZWRlZC4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBUaHVzIG15IHF1ZXN0aW9uICJJbiB3
aGljaCBjb250ZXh0IGlzIGl0IHNhZmUgdG8gY2FsbCB0aGlzIGhlbHBlciA/Igo+ID4gPiA+ID4K
PiA+ID4gPiA+IEFzIGxvbmcgYXMgaXQgd2FzIHByaXZhdGUgd2l0aCBhIGRyaXZlciwgSSBkaWQg
bm90IG1pbmQuCj4gPiA+ID4gPgo+ID4gPiA+ID4gQnV0IGlmIG1hZGUgcHVibGljIGluIGluY2x1
ZGUvbGludXgvbmV0ZGV2aWNlLmgsIEkgd291bGQgcmF0aGVyIG5vdAo+ID4gPiA+ID4gaGF2ZSB0
byBleHBsYWluCj4gPiA+ID4gPiB0byBmdXR1cmUgdXNlcnMgd2h5IGl0IGNhbiBiZSBwcm9ibGVt
YXRpYy4KPiA+ID4gPgo+ID4gPiA+IE9oIG9rIQo+ID4gPiA+Cj4gPiA+ID4gV2UgaGF2ZSBwbGVu
dHkgb2YgY2FzZSBzaW1pbGFyIHRvIHRoaXMuIChleGFtcGxlIHNvbWUgY2xvY2sgQVBJIHZlcnkK
PiA+ID4gPiBpbnRlcm5hbCB0aGF0IHNob3VsZCBub3QgYmUgdXNlZCBub3JtYWxseSBvciByZWdt
YXAgcmVsYXRlZCkKPiA+ID4gPgo+ID4gPiA+IEkgd2lsbCBpbmNsdWRlIHNvbWUgY29tbWVudHMg
d2FybmluZyB0aGF0IHRoaXMgc2hvdWxkIG5vdCBiZSB1c2VkIGluCj4gPiA+ID4gbm9ybWFsIGNp
cmN1bXN0YW5jZXMgYW5kIG90aGVyIHdhcm5pbmdzLiBJZiB5b3UgaGF2ZSBzdWdnZXN0aW9uIG9u
IHdoYXQKPiA+ID4gPiB0byBhZGQgZmVlbCBmcmVlIHRvIHdyaXRlIHRoZW0uCj4gPiA+ID4KPiA+
ID4gPiBBbnkgY2x1ZSBvbiBob3cgdG8gcHJvY2VlZCB3aXRoIHRoZSBzZ2UgZHJpdmVyPwo+ID4g
PiA+Cj4gPiA+Cj4gPiA+IEkgd291bGQgcmVtb3ZlIHVzZSBvZiB0aGlzIGhlbHBlciBmb3Igc29t
ZXRoaW5nIHdpdGggbm8gcmFjZSA/Cj4gPiA+Cj4gPiA+IEZlZWwgZnJlZSB0byBzdWJtaXQgdGhp
cyA6Cj4gPiA+Cj4gPiA+IChBbHRlcm5hdGl2ZSB3b3VsZCBiZSB0byBjaGFuZ2UgbmFwaV9zY2hl
ZHVsZSgpIHRvIHJldHVybiBhIGJvb2xlYW4pCj4gPiA+Cj4gPgo+ID4gVGhpbmsgbW9kIG5hcGlf
c2NoZWR1bGUoKSB0byByZXR1cm4gYSBib29sIHdvdWxkIHJlc3VsdCBpbiBtYXNzaXZlCj4gPiB3
YXJuaW5nIChhY3R1YWxseSBlcnJvciB3aXRoIHdlcnJvcikgd2l0aCByZXR1cm4gdmFsdWUgbm90
IGhhbmRsZWQuCj4gPgo+Cj4gSXQgc2hvdWxkIG5vdCwgdW5sZXNzIHdlIGFkZGVkIGEgX19tdXN0
X2NoZWNrCgpUaGlzIHdhcyB3aGF0IEkgd2FzIHRoaW5raW5nIDoKCmRpZmYgLS1naXQgYS9pbmNs
dWRlL2xpbnV4L25ldGRldmljZS5oIGIvaW5jbHVkZS9saW51eC9uZXRkZXZpY2UuaAppbmRleCBl
MDcwYTQ1NDBmYmFmNGE5Y2YzMTBkNWY1M2M0NDAxODQwYzcyNzc2Li42YWEyYmMzMTU0MTFkMWEw
ZjdkYjMxNGYxZmJmYjExYWFlN2MzMWZlCjEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L25ldGRl
dmljZS5oCisrKyBiL2luY2x1ZGUvbGludXgvbmV0ZGV2aWNlLmgKQEAgLTQ5MSwxMCArNDkxLDEz
IEBAIGJvb2wgbmFwaV9zY2hlZHVsZV9wcmVwKHN0cnVjdCBuYXBpX3N0cnVjdCAqbik7CiAgKiBT
Y2hlZHVsZSBOQVBJIHBvbGwgcm91dGluZSB0byBiZSBjYWxsZWQgaWYgaXQgaXMgbm90IGFscmVh
ZHkKICAqIHJ1bm5pbmcuCiAgKi8KLXN0YXRpYyBpbmxpbmUgdm9pZCBuYXBpX3NjaGVkdWxlKHN0
cnVjdCBuYXBpX3N0cnVjdCAqbikKK3N0YXRpYyBpbmxpbmUgYm9vbCBuYXBpX3NjaGVkdWxlKHN0
cnVjdCBuYXBpX3N0cnVjdCAqbikKIHsKLSAgICAgICBpZiAobmFwaV9zY2hlZHVsZV9wcmVwKG4p
KQorICAgICAgIGlmIChuYXBpX3NjaGVkdWxlX3ByZXAobikpIHsKICAgICAgICAgICAgICAgIF9f
bmFwaV9zY2hlZHVsZShuKTsKKyAgICAgICAgICAgICAgIHJldHVybiB0cnVlOworICAgICAgIH0K
KyAgICAgICByZXR1cm4gZmFsc2U7CiB9CgogLyoqCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0z
MkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
