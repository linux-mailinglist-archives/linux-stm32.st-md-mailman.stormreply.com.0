Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AC7EF7B5419
	for <lists+linux-stm32@lfdr.de>; Mon,  2 Oct 2023 15:37:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6EC53C6C840;
	Mon,  2 Oct 2023 13:37:14 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A05C5C6B456
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Oct 2023 12:55:00 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-40566f8a093so134037195e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 02 Oct 2023 05:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696251300; x=1696856100;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:subject:cc:to:from:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=28IiggInfhdX5TRLSL71Si3g5qgj6uye3wMvj7LWpPw=;
 b=NAop33zkgcpRN2cO9+zDZHiBASAb917V8+8uzRdGPIdV2SHlSm4ykRvw6CIkhekcgY
 NQDkXfumNlsJhZJB0OAiHo80rNMTRN+rs5HN7vgFXDZAC2V7AJgg1g3cR6dBhgHH1JKn
 +pK2B7pLcx51FHegriotzhGPNwVKfUYp2lQD8/RiWDDC/+iXR6Xt/W0VACnyN+VUZBeW
 BEdeTLDtB2wNV+YHQ17BHhdr1TK4yX5uIi874gUHIk18BE7YoJVxfStX5/40V5Qkj3s4
 5k93UQzd1lbZWylyy8pTVvuWhQ8FNvQ7lwHlFhkcbV1BggQx4PumpxjRcEWMAzTfhk+9
 ziYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696251300; x=1696856100;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:subject:cc:to:from:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=28IiggInfhdX5TRLSL71Si3g5qgj6uye3wMvj7LWpPw=;
 b=tIm4CoHc8uIgKbam13Uw2BCT0LTkNR5Wpya6aqbLMT++7jsRuJt8tva3Tz4H68DYMa
 cHJymu5mr8ZHR8hRH6l24KOEPioRHceNrWoA/3qTjS60HYHREZHZofs/xnLwPd6Qsbfl
 CnCqINogN+6LAx4DvcVEDNQcdnMuWlQJKvWm5GUIS/LXZuPMlvokWpkOI7ilb5swOybR
 gwXuM45nXWleAx7R4B0aDQK9Dze2/omqqgUm+kBBgec4podrzVrDbIumkubTVYc53guG
 3DNUd77tJKqJpJlEP94GlQ7iDe9i5k+Xwc6TOIEIFG8gG4n8kf2UPB6Q8SywtqWJC1l3
 ACYw==
X-Gm-Message-State: AOJu0YzE5V9giiUmNmxYNoLQ8eOmHIpuX41robQvvMpErRlpZZYOGfXE
 pPGnqDjHktNFLt0OJGT4K5Q=
X-Google-Smtp-Source: AGHT+IGMOsBeJ1M30+rfvuzbSeaPC6dZyf97ZswVAua76P7jZFwmyAiqKyvI8+Y2NbdOgX4Bsybsag==
X-Received: by 2002:a1c:4b18:0:b0:404:7659:ba39 with SMTP id
 y24-20020a1c4b18000000b004047659ba39mr10368110wma.16.1696251299806; 
 Mon, 02 Oct 2023 05:54:59 -0700 (PDT)
Received: from Ansuel-xps. (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
 by smtp.gmail.com with ESMTPSA id
 p10-20020adff20a000000b0032763287473sm4987101wro.75.2023.10.02.05.54.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Oct 2023 05:54:59 -0700 (PDT)
Message-ID: <651abda3.df0a0220.a04f0.12df@mx.google.com>
X-Google-Original-Message-ID: <ZRq9n/VYcTZOZmJ7@Ansuel-xps.>
Date: Mon, 2 Oct 2023 14:54:55 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Eric Dumazet <edumazet@google.com>
References: <20230922111247.497-1-ansuelsmth@gmail.com>
 <CANn89iJtrpVQZbeAezd7S4p_yCRSFzcsBMgW+y9YhxOrCv463A@mail.gmail.com>
 <65181064.050a0220.7887c.c7ee@mx.google.com>
 <CANn89iJqkpRu8rd_M7HCzaZQV5P_XTCzbKe5DOwnJkTRDZWEWw@mail.gmail.com>
 <651ab7b8.050a0220.e15ed.9d6a@mx.google.com>
 <CANn89iJqFC-Z3NZwT+CXEG7R9rc9g4LRwNm6Zm=nZKpD3Mon7Q@mail.gmail.com>
 <651abb07.050a0220.5435c.9eae@mx.google.com>
 <CANn89iLHMOh9Axt3xquzPjx0Dfn6obmSZJFSpzH51TKAN_nPqQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANn89iLHMOh9Axt3xquzPjx0Dfn6obmSZJFSpzH51TKAN_nPqQ@mail.gmail.com>
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

T24gTW9uLCBPY3QgMDIsIDIwMjMgYXQgMDI6NDk6MTFQTSArMDIwMCwgRXJpYyBEdW1hemV0IHdy
b3RlOgo+IE9uIE1vbiwgT2N0IDIsIDIwMjMgYXQgMjo0M+KAr1BNIENocmlzdGlhbiBNYXJhbmdp
IDxhbnN1ZWxzbXRoQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gTW9uLCBPY3QgMDIsIDIw
MjMgYXQgMDI6MzU6MjJQTSArMDIwMCwgRXJpYyBEdW1hemV0IHdyb3RlOgo+ID4gPiBPbiBNb24s
IE9jdCAyLCAyMDIzIGF0IDI6MjnigK9QTSBDaHJpc3RpYW4gTWFyYW5naSA8YW5zdWVsc210aEBn
bWFpbC5jb20+IHdyb3RlOgo+ID4gPgo+ID4gPiA+IEVoaGggdGhlIGlkZWEgaGVyZSB3YXMgdG8g
cmVkdWNlIGNvZGUgZHVwbGljYXRpb24gc2luY2UgdGhlIHZlcnkgc2FtZQo+ID4gPiA+IHRlc3Qg
d2lsbCBiZSBkb25lIGluIHN0bW1hYy4gU28gSSBndWVzcyB0aGlzIGNvZGUgY2xlYW51cCBpcyBh
IE5BQ0sgYW5kCj4gPiA+ID4gSSBoYXZlIHRvIGR1cGxpY2F0ZSB0aGUgdGVzdCBpbiB0aGUgc3Rt
bWFjIGRyaXZlci4KPiA+ID4KPiA+ID4gSSBzaW1wbHkgd2FudGVkIHRvIGFkZCBhIGNvbW1lbnQg
aW4gZnJvbnQgb2YgdGhpcyBmdW5jdGlvbi9oZWxwZXIsCj4gPiA+IGFkdmlzaW5nIG5vdCB1c2lu
ZyBpdCB1bmxlc3MgYWJzb2x1dGVseSBuZWVkZWQuCj4gPiA+Cj4gPiA+IFRodXMgbXkgcXVlc3Rp
b24gIkluIHdoaWNoIGNvbnRleHQgaXMgaXQgc2FmZSB0byBjYWxsIHRoaXMgaGVscGVyID8iCj4g
PiA+Cj4gPiA+IEFzIGxvbmcgYXMgaXQgd2FzIHByaXZhdGUgd2l0aCBhIGRyaXZlciwgSSBkaWQg
bm90IG1pbmQuCj4gPiA+Cj4gPiA+IEJ1dCBpZiBtYWRlIHB1YmxpYyBpbiBpbmNsdWRlL2xpbnV4
L25ldGRldmljZS5oLCBJIHdvdWxkIHJhdGhlciBub3QKPiA+ID4gaGF2ZSB0byBleHBsYWluCj4g
PiA+IHRvIGZ1dHVyZSB1c2VycyB3aHkgaXQgY2FuIGJlIHByb2JsZW1hdGljLgo+ID4KPiA+IE9o
IG9rIQo+ID4KPiA+IFdlIGhhdmUgcGxlbnR5IG9mIGNhc2Ugc2ltaWxhciB0byB0aGlzLiAoZXhh
bXBsZSBzb21lIGNsb2NrIEFQSSB2ZXJ5Cj4gPiBpbnRlcm5hbCB0aGF0IHNob3VsZCBub3QgYmUg
dXNlZCBub3JtYWxseSBvciByZWdtYXAgcmVsYXRlZCkKPiA+Cj4gPiBJIHdpbGwgaW5jbHVkZSBz
b21lIGNvbW1lbnRzIHdhcm5pbmcgdGhhdCB0aGlzIHNob3VsZCBub3QgYmUgdXNlZCBpbgo+ID4g
bm9ybWFsIGNpcmN1bXN0YW5jZXMgYW5kIG90aGVyIHdhcm5pbmdzLiBJZiB5b3UgaGF2ZSBzdWdn
ZXN0aW9uIG9uIHdoYXQKPiA+IHRvIGFkZCBmZWVsIGZyZWUgdG8gd3JpdGUgdGhlbS4KPiA+Cj4g
PiBBbnkgY2x1ZSBvbiBob3cgdG8gcHJvY2VlZCB3aXRoIHRoZSBzZ2UgZHJpdmVyPwo+ID4KPiAK
PiBJIHdvdWxkIHJlbW92ZSB1c2Ugb2YgdGhpcyBoZWxwZXIgZm9yIHNvbWV0aGluZyB3aXRoIG5v
IHJhY2UgPwo+IAo+IEZlZWwgZnJlZSB0byBzdWJtaXQgdGhpcyA6Cj4gCj4gKEFsdGVybmF0aXZl
IHdvdWxkIGJlIHRvIGNoYW5nZSBuYXBpX3NjaGVkdWxlKCkgdG8gcmV0dXJuIGEgYm9vbGVhbikK
PgoKVGhpbmsgbW9kIG5hcGlfc2NoZWR1bGUoKSB0byByZXR1cm4gYSBib29sIHdvdWxkIHJlc3Vs
dCBpbiBtYXNzaXZlCndhcm5pbmcgKGFjdHVhbGx5IGVycm9yIHdpdGggd2Vycm9yKSB3aXRoIHJl
dHVybiB2YWx1ZSBub3QgaGFuZGxlZC4KCkkgd2lsbCBzdWJtaXQgd2l0aCB5b3VyIFN1Z2dlc3Rl
ZC1ieS4gT2sgZm9yIHlvdT8KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L2No
ZWxzaW8vY3hnYjMvc2dlLmMKPiBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L2NoZWxzaW8vY3hnYjMv
c2dlLmMKPiBpbmRleCAyZTlhNzRmZTA5NzBkZjMzMzIyNmI4MGFmODcxNmYzMDg2NWMwMWI3Li4w
OWQwZTZhYTRkYjk4MmUzNDg4ZTBjMjhiZWQzM2U4MzQ1MzgwMWQwCj4gMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9uZXQvZXRoZXJuZXQvY2hlbHNpby9jeGdiMy9zZ2UuYwo+ICsrKyBiL2RyaXZlcnMv
bmV0L2V0aGVybmV0L2NoZWxzaW8vY3hnYjMvc2dlLmMKPiBAQCAtMjUwMSwxNCArMjUwMSw2IEBA
IHN0YXRpYyBpbnQgbmFwaV9yeF9oYW5kbGVyKHN0cnVjdCBuYXBpX3N0cnVjdAo+ICpuYXBpLCBp
bnQgYnVkZ2V0KQo+ICAgICAgICAgcmV0dXJuIHdvcmtfZG9uZTsKPiAgfQo+IAo+IC0vKgo+IC0g
KiBSZXR1cm5zIHRydWUgaWYgdGhlIGRldmljZSBpcyBhbHJlYWR5IHNjaGVkdWxlZCBmb3IgcG9s
bGluZy4KPiAtICovCj4gLXN0YXRpYyBpbmxpbmUgaW50IG5hcGlfaXNfc2NoZWR1bGVkKHN0cnVj
dCBuYXBpX3N0cnVjdCAqbmFwaSkKPiAtewo+IC0gICAgICAgcmV0dXJuIHRlc3RfYml0KE5BUElf
U1RBVEVfU0NIRUQsICZuYXBpLT5zdGF0ZSk7Cj4gLX0KPiAtCj4gIC8qKgo+ICAgKiAgICAgcHJv
Y2Vzc19wdXJlX3Jlc3BvbnNlcyAtIHByb2Nlc3MgcHVyZSByZXNwb25zZXMgZnJvbSBhIHJlc3Bv
bnNlIHF1ZXVlCj4gICAqICAgICBAYWRhcDogdGhlIGFkYXB0ZXIKPiBAQCAtMjY3NCw5ICsyNjY2
LDkgQEAgc3RhdGljIGludCByc3BxX2NoZWNrX25hcGkoc3RydWN0IHNnZV9xc2V0ICpxcykKPiAg
ewo+ICAgICAgICAgc3RydWN0IHNnZV9yc3BxICpxID0gJnFzLT5yc3BxOwo+IAo+IC0gICAgICAg
aWYgKCFuYXBpX2lzX3NjaGVkdWxlZCgmcXMtPm5hcGkpICYmCj4gLSAgICAgICAgICAgaXNfbmV3
X3Jlc3BvbnNlKCZxLT5kZXNjW3EtPmNpZHhdLCBxKSkgewo+IC0gICAgICAgICAgICAgICBuYXBp
X3NjaGVkdWxlKCZxcy0+bmFwaSk7Cj4gKyAgICAgICBpZiAoaXNfbmV3X3Jlc3BvbnNlKCZxLT5k
ZXNjW3EtPmNpZHhdLCBxKSAmJgo+ICsgICAgICAgICAgIG5hcGlfc2NoZWR1bGVfcHJlcCgmcXMt
Pm5hcGkpKSB7Cj4gKyAgICAgICAgICAgICAgIF9fbmFwaV9zY2hlZHVsZSgmcXMtPm5hcGkpOwo+
ICAgICAgICAgICAgICAgICByZXR1cm4gMTsKPiAgICAgICAgIH0KPiAgICAgICAgIHJldHVybiAw
OwoKLS0gCglBbnN1ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxt
YW4vbGlzdGluZm8vbGludXgtc3RtMzIK
