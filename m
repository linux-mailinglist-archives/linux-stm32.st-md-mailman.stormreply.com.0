Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9707B5413
	for <lists+linux-stm32@lfdr.de>; Mon,  2 Oct 2023 15:37:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 424D6C6C838;
	Mon,  2 Oct 2023 13:37:14 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 20A16C6B463
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Oct 2023 12:29:46 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-406609df1a6so25455725e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 02 Oct 2023 05:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696249785; x=1696854585;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:subject:cc:to:from:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=7Z0fPrHFEa9nkjOAEG6EVjtNAzWmIJKQAHce/juD4dg=;
 b=V36r1Mt1c8l6nSBi1SzGs0qBcK1amf4WSWaM0w+30apmMsz5NKOFJIHvYx13JUwDwB
 pqYogA25tiBHfnK7tXpn69eGUEgImOmNrQeVVFp5amn/puioHiByIJCJkxdsVUfqO88m
 1Y7KCTkgk2P9Vk/239JfiNdkGWgbU+i144aWUZs9dKa4/VfvZKnj/+pUO0XZ0Pj/gKi4
 t+Q2GE/L4D6IHl5PEexFhMCePyYwjSIkcC+xuNhxAirHEReMdFIBJGXt5U4pc4cKdm0t
 D5katTGQI7pcCfzFZ79LPd9B2kuxReRw/JHVP9gd6Eg5p5Juw5C01Pi/iHw8X2KjzoaI
 D2vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696249785; x=1696854585;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:subject:cc:to:from:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7Z0fPrHFEa9nkjOAEG6EVjtNAzWmIJKQAHce/juD4dg=;
 b=dxAW0hsg1myEU2F8Pk8YSjHNLrzDezf6xRFEQMcAQ5xM8DxTeX1xLHKN9KkiqBb2Ge
 4OGWErjACKiOLAh+v21Fwr4wdsKu3FXllEMnQceuf+oj/ZbxOcnfWZAbxDwUoofxj1uq
 S2gUDJwJ43el9ngAfOLuAZLsG4H8jETmx5CaqNnM5p+JGRPJwxl7WtHE8kGDq+QGm1WH
 rF+j7MxAQ+VHdf0ZOX47iRooVw+XSjp9o6UCh9DZR5mjPkBuAljwP5139ySpv+gBXm8D
 Q38r5LLA8gm5H75rFV8hsuIttkIbKqu/6hvSFdFIbXlm6MSrblRz49KA6BClpZggFMaK
 G+eQ==
X-Gm-Message-State: AOJu0YzubrFairpUeqBJSkEMAtaiF9YGB6bnXfoe71h/wkMX8YzKbvzK
 ZyKnhWbIAH3IKI7hjASuAD0=
X-Google-Smtp-Source: AGHT+IGHwYg7Qrz6bLRE2viP7h0QHkA3r0DuEv3bOzVZxN12evX9inbIYCNXUQglnd9gyl4BLSs0RA==
X-Received: by 2002:a05:600c:5101:b0:406:6964:7e96 with SMTP id
 o1-20020a05600c510100b0040669647e96mr4282239wms.13.1696249785131; 
 Mon, 02 Oct 2023 05:29:45 -0700 (PDT)
Received: from Ansuel-xps. (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
 by smtp.gmail.com with ESMTPSA id
 m5-20020a05600c280500b0040535648639sm7189510wmb.36.2023.10.02.05.29.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Oct 2023 05:29:44 -0700 (PDT)
Message-ID: <651ab7b8.050a0220.e15ed.9d6a@mx.google.com>
X-Google-Original-Message-ID: <ZRq3tD70jmNB/ZIo@Ansuel-xps.>
Date: Mon, 2 Oct 2023 14:29:40 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Eric Dumazet <edumazet@google.com>
References: <20230922111247.497-1-ansuelsmth@gmail.com>
 <CANn89iJtrpVQZbeAezd7S4p_yCRSFzcsBMgW+y9YhxOrCv463A@mail.gmail.com>
 <65181064.050a0220.7887c.c7ee@mx.google.com>
 <CANn89iJqkpRu8rd_M7HCzaZQV5P_XTCzbKe5DOwnJkTRDZWEWw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANn89iJqkpRu8rd_M7HCzaZQV5P_XTCzbKe5DOwnJkTRDZWEWw@mail.gmail.com>
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

T24gU2F0LCBTZXAgMzAsIDIwMjMgYXQgMDM6NDI6MjBQTSArMDIwMCwgRXJpYyBEdW1hemV0IHdy
b3RlOgo+IE9uIFNhdCwgU2VwIDMwLCAyMDIzIGF0IDI6MTHigK9QTSBDaHJpc3RpYW4gTWFyYW5n
aSA8YW5zdWVsc210aEBnbWFpbC5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIFNhdCwgU2VwIDMwLCAy
MDIzIGF0IDAxOjU5OjUzUE0gKzAyMDAsIEVyaWMgRHVtYXpldCB3cm90ZToKPiA+ID4gT24gRnJp
LCBTZXAgMjIsIDIwMjMgYXQgMToxM+KAr1BNIENocmlzdGlhbiBNYXJhbmdpIDxhbnN1ZWxzbXRo
QGdtYWlsLmNvbT4gd3JvdGU6Cj4gPiA+ID4KPiA+ID4gPiBXZSBjdXJyZW50bHkgaGF2ZSBuYXBp
X2lmX3NjaGVkdWxlZF9tYXJrX21pc3NlZCB0aGF0IGNhbiBiZSB1c2VkIHRvCj4gPiA+ID4gY2hl
Y2sgaWYgbmFwaSBpcyBzY2hlZHVsZWQgYnV0IHRoYXQgZG9lcyBtb3JlIHRoaW5nIHRoYW4gc2lt
cGx5IGNoZWNraW5nCj4gPiA+ID4gaXQgYW5kIHJldHVybiBhIGJvb2wuIFNvbWUgZHJpdmVyIGFs
cmVhZHkgaW1wbGVtZW50IGN1c3RvbSBmdW5jdGlvbiB0bwo+ID4gPiA+IGNoZWNrIGlmIG5hcGkg
aXMgc2NoZWR1bGVkLgo+ID4gPiA+Cj4gPiA+ID4gRHJvcCB0aGVzZSBjdXN0b20gZnVuY3Rpb24g
YW5kIGludHJvZHVjZSBuYXBpX2lzX3NjaGVkdWxlZCB0aGF0IHNpbXBseQo+ID4gPiA+IGNoZWNr
IGlmIG5hcGkgaXMgc2NoZWR1bGVkIGF0b21pY2FsbHkuCj4gPiA+ID4KPiA+ID4gPiBVcGRhdGUg
YW55IGRyaXZlciBhbmQgY29kZSB0aGF0IGltcGxlbWVudCBhIHNpbWlsYXIgY2hlY2sgYW5kIGlu
c3RlYWQKPiA+ID4gPiB1c2UgdGhpcyBuZXcgaGVscGVyLgo+ID4gPiA+Cj4gPiA+ID4gU2lnbmVk
LW9mZi1ieTogQ2hyaXN0aWFuIE1hcmFuZ2kgPGFuc3VlbHNtdGhAZ21haWwuY29tPgo+ID4gPiA+
IC0tLQo+ID4gPiA+ICBkcml2ZXJzL25ldC9ldGhlcm5ldC9jaGVsc2lvL2N4Z2IzL3NnZS5jICB8
IDggLS0tLS0tLS0KPiA+ID4gPiAgZHJpdmVycy9uZXQvd2lyZWxlc3MvcmVhbHRlay9ydHc4OS9j
b3JlLmMgfCAyICstCj4gPiA+ID4gIGluY2x1ZGUvbGludXgvbmV0ZGV2aWNlLmggICAgICAgICAg
ICAgICAgIHwgNSArKysrKwo+ID4gPiA+ICBuZXQvY29yZS9kZXYuYyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB8IDIgKy0KPiA+ID4gPiAgNCBmaWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMo
KyksIDEwIGRlbGV0aW9ucygtKQo+ID4gPiA+Cj4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
bmV0L2V0aGVybmV0L2NoZWxzaW8vY3hnYjMvc2dlLmMgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9j
aGVsc2lvL2N4Z2IzL3NnZS5jCj4gPiA+ID4gaW5kZXggMmU5YTc0ZmUwOTcwLi43MWZhMmRjMTkw
MzQgMTAwNjQ0Cj4gPiA+ID4gLS0tIGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvY2hlbHNpby9jeGdi
My9zZ2UuYwo+ID4gPiA+ICsrKyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L2NoZWxzaW8vY3hnYjMv
c2dlLmMKPiA+ID4gPiBAQCAtMjUwMSwxNCArMjUwMSw2IEBAIHN0YXRpYyBpbnQgbmFwaV9yeF9o
YW5kbGVyKHN0cnVjdCBuYXBpX3N0cnVjdCAqbmFwaSwgaW50IGJ1ZGdldCkKPiA+ID4gPiAgICAg
ICAgIHJldHVybiB3b3JrX2RvbmU7Cj4gPiA+ID4gIH0KPiA+ID4gPgo+ID4gPiA+IC0vKgo+ID4g
PiA+IC0gKiBSZXR1cm5zIHRydWUgaWYgdGhlIGRldmljZSBpcyBhbHJlYWR5IHNjaGVkdWxlZCBm
b3IgcG9sbGluZy4KPiA+ID4gPiAtICovCj4gPiA+ID4gLXN0YXRpYyBpbmxpbmUgaW50IG5hcGlf
aXNfc2NoZWR1bGVkKHN0cnVjdCBuYXBpX3N0cnVjdCAqbmFwaSkKPiA+ID4gPiAtewo+ID4gPiA+
IC0gICAgICAgcmV0dXJuIHRlc3RfYml0KE5BUElfU1RBVEVfU0NIRUQsICZuYXBpLT5zdGF0ZSk7
Cj4gPiA+ID4gLX0KPiA+ID4gPiAtCj4gPiA+ID4gIC8qKgo+ID4gPiA+ICAgKiAgICAgcHJvY2Vz
c19wdXJlX3Jlc3BvbnNlcyAtIHByb2Nlc3MgcHVyZSByZXNwb25zZXMgZnJvbSBhIHJlc3BvbnNl
IHF1ZXVlCj4gPiA+ID4gICAqICAgICBAYWRhcDogdGhlIGFkYXB0ZXIKPiA+ID4gPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9uZXQvd2lyZWxlc3MvcmVhbHRlay9ydHc4OS9jb3JlLmMgYi9kcml2ZXJz
L25ldC93aXJlbGVzcy9yZWFsdGVrL3J0dzg5L2NvcmUuYwo+ID4gPiA+IGluZGV4IDEzM2JmMjg5
YmFjYi4uYmJmNGVhMzYzOWQ0IDEwMDY0NAo+ID4gPiA+IC0tLSBhL2RyaXZlcnMvbmV0L3dpcmVs
ZXNzL3JlYWx0ZWsvcnR3ODkvY29yZS5jCj4gPiA+ID4gKysrIGIvZHJpdmVycy9uZXQvd2lyZWxl
c3MvcmVhbHRlay9ydHc4OS9jb3JlLmMKPiA+ID4gPiBAQCAtMTc0NCw3ICsxNzQ0LDcgQEAgc3Rh
dGljIHZvaWQgcnR3ODlfY29yZV9yeF90b19tYWM4MDIxMShzdHJ1Y3QgcnR3ODlfZGV2ICpydHdk
ZXYsCj4gPiA+ID4gICAgICAgICBzdHJ1Y3QgbmFwaV9zdHJ1Y3QgKm5hcGkgPSAmcnR3ZGV2LT5u
YXBpOwo+ID4gPiA+Cj4gPiA+ID4gICAgICAgICAvKiBJbiBsb3cgcG93ZXIgbW9kZSwgbmFwaSBp
c24ndCBzY2hlZHVsZWQuIFJlY2VpdmUgaXQgdG8gbmV0aWYuICovCj4gPiA+ID4gLSAgICAgICBp
ZiAodW5saWtlbHkoIXRlc3RfYml0KE5BUElfU1RBVEVfU0NIRUQsICZuYXBpLT5zdGF0ZSkpKQo+
ID4gPiA+ICsgICAgICAgaWYgKHVubGlrZWx5KCFuYXBpX2lzX3NjaGVkdWxlZChuYXBpKSkpCj4g
PiA+ID4gICAgICAgICAgICAgICAgIG5hcGkgPSBOVUxMOwo+ID4gPiA+Cj4gPiA+ID4gICAgICAg
ICBydHc4OV9jb3JlX2h3X3RvX3NiYW5kX3JhdGUocnhfc3RhdHVzKTsKPiA+ID4gPiBkaWZmIC0t
Z2l0IGEvaW5jbHVkZS9saW51eC9uZXRkZXZpY2UuaCBiL2luY2x1ZGUvbGludXgvbmV0ZGV2aWNl
LmgKPiA+ID4gPiBpbmRleCBkYjNkODQyOWQ1MGQuLjhlYWMwMGNkM2I5MiAxMDA2NDQKPiA+ID4g
PiAtLS0gYS9pbmNsdWRlL2xpbnV4L25ldGRldmljZS5oCj4gPiA+ID4gKysrIGIvaW5jbHVkZS9s
aW51eC9uZXRkZXZpY2UuaAo+ID4gPiA+IEBAIC00ODIsNiArNDgyLDExIEBAIHN0YXRpYyBpbmxp
bmUgYm9vbCBuYXBpX3ByZWZlcl9idXN5X3BvbGwoc3RydWN0IG5hcGlfc3RydWN0ICpuKQo+ID4g
PiA+ICAgICAgICAgcmV0dXJuIHRlc3RfYml0KE5BUElfU1RBVEVfUFJFRkVSX0JVU1lfUE9MTCwg
Jm4tPnN0YXRlKTsKPiA+ID4gPiAgfQo+ID4gPiA+Cj4gPiA+Cj4gPiA+Cj4gPiA+IEluIHdoaWNo
IGNvbnRleHQgaXMgaXQgc2FmZSB0byBjYWxsIHRoaXMgaGVscGVyID8KPiA+ID4KPiA+Cj4gPiB0
ZXN0X2JpdCBpcyBhdG9taWMgc28gaXQgc2hvdWxkIGJlIGFsd2F5cyBzYWZlLiBBbHNvIHRoZSBp
ZGVhIG9mIHRoaXMKPiA+IGNoZWNrIChhbmQgZnJvbSB3aGF0IEkgY2FuIHNlZSB0aGlzIGFwcGx5
IGFsc28gdG8gdGhlIG90aGVyIDIgdXNlcikgaXMKPiA+IHNvbWVob3cgYmVzdCBlZmZvcnQsIHdl
IGNoZWNrIGlmIGluIHRoZSBjdXJyZW50IGlzdGFudCB0aGVyZSBpcyBhIG5hcGkKPiA+IHNjaGVk
dWxlZCBhbmQgd2UgYWN0Lgo+IAo+IEkgdGhpbmsgdGVzdGluZyBhIGJpdCBoZXJlIGlzIG5vdCBl
bm91Z2ggdG8gdGFrZSBhbnkga2luZCBvZiB1c2VmdWwgZGVjaXNpb24sCj4gdW5sZXNzIHVzZWQg
aW4gYSBwYXJ0aWN1bGFyIGNvbnRleHQuCj4KCkVoaGggdGhlIGlkZWEgaGVyZSB3YXMgdG8gcmVk
dWNlIGNvZGUgZHVwbGljYXRpb24gc2luY2UgdGhlIHZlcnkgc2FtZQp0ZXN0IHdpbGwgYmUgZG9u
ZSBpbiBzdG1tYWMuIFNvIEkgZ3Vlc3MgdGhpcyBjb2RlIGNsZWFudXAgaXMgYSBOQUNLIGFuZApJ
IGhhdmUgdG8gZHVwbGljYXRlIHRoZSB0ZXN0IGluIHRoZSBzdG1tYWMgZHJpdmVyLgoKPiA+Cj4g
PiA+IEkgZmVhciB0aGF0IG1ha2luZyB0aGlzIGF2YWlsYWJsZSB3aWxsIGFkZCBtb3JlIGJ1Z3Mu
Cj4gPiA+Cj4gPiA+IEZvciBpbnN0YW5jZSByc3BxX2NoZWNrX25hcGkoKSBzZWVtcyBidWdneSB0
byBtZS4KPiA+ID4KPiA+Cj4gPiBNaGhoIHdoeT8gQW0gSSBvcGVuaW5nIGEgY2FuIG9mIHdvcm1z
Pwo+IAo+IFllcyBJIHRoaW5rIDovCj4gCj4gQmVjYXVzZSBvbmx5IHRoZSB0aHJlYWQgdGhhdCBo
YXMgZ3JhYmJlZCB0aGUgYml0IGNhbiBtYWtlIGFueSBzZW5zZSBvZiBpdC4KPiAKPiBBbm90aGVy
IHRocmVhZCByZWFkaW5nIGl0IHdvdWxkIG5vdCByZWFsbHkga25vdyBpZiB0aGUgdmFsdWUgaXMg
bm90IGdvaW5nIHRvCj4gY2hhbmdlIGltbWVkaWF0ZWx5LiBTbyB3aGF0IHdvdWxkIGJlIHRoZSBw
b2ludCA/Cj4gCj4gSXQgc2VlbXMgcnNwcV9jaGVja19uYXBpKCkgcmVhbCBpbnRlbnQgd2FzIG1h
eWJlIHRoZSBmb2xsb3dpbmcsCj4gYnV0IHJlYWxseSB0aGlzIGlzIGhhcmQgdG8ga25vdyBpZiB0
aGUgY3VycmVudCByYWNlIGluIHRoaXMgY29kZSBpcyBva2F5IG9yIG5vdC4KPiAKPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvY2hlbHNpby9jeGdiMy9zZ2UuYwo+IGIvZHJpdmVy
cy9uZXQvZXRoZXJuZXQvY2hlbHNpby9jeGdiMy9zZ2UuYwo+IGluZGV4IDJlOWE3NGZlMDk3MGRm
MzMzMjI2YjgwYWY4NzE2ZjMwODY1YzAxYjcuLmUxNTNjOTU5MGIzNmIzOGU0MzBiYzkzNjYwMTQ2
YjQyOGU5YjMzNDcKPiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9jaGVsc2lv
L2N4Z2IzL3NnZS5jCj4gKysrIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvY2hlbHNpby9jeGdiMy9z
Z2UuYwo+IEBAIC0yNjc2LDggKzI2NzYsMTAgQEAgc3RhdGljIGludCByc3BxX2NoZWNrX25hcGko
c3RydWN0IHNnZV9xc2V0ICpxcykKPiAKPiAgICAgICAgIGlmICghbmFwaV9pc19zY2hlZHVsZWQo
JnFzLT5uYXBpKSAmJgo+ICAgICAgICAgICAgIGlzX25ld19yZXNwb25zZSgmcS0+ZGVzY1txLT5j
aWR4XSwgcSkpIHsKPiAtICAgICAgICAgICAgICAgbmFwaV9zY2hlZHVsZSgmcXMtPm5hcGkpOwo+
IC0gICAgICAgICAgICAgICByZXR1cm4gMTsKPiArICAgICAgICAgICAgICAgaWYgKG5hcGlfc2No
ZWR1bGVfcHJlcCgmcXMtPm5hcGkpKSB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgX19uYXBp
X3NjaGVkdWxlKCZxcy0+bmFwaSk7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIDE7
Cj4gKyAgICAgICAgICAgICAgIH0KPiAgICAgICAgIH0KPiAgICAgICAgIHJldHVybiAwOwo+ICB9
CgotLSAKCUFuc3VlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1h
bi9saXN0aW5mby9saW51eC1zdG0zMgo=
