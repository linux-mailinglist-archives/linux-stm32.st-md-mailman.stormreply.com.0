Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D08B7B5412
	for <lists+linux-stm32@lfdr.de>; Mon,  2 Oct 2023 15:37:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 19A3EC6C832;
	Mon,  2 Oct 2023 13:37:14 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7BBA1C6B479
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 30 Sep 2023 12:00:05 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-51e24210395so5526a12.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 30 Sep 2023 05:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1696075205; x=1696680005;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7GTxYazO7tslop+1R5e/LRP9/RgHOwT+uOuEWmbMhAw=;
 b=o62CcHH8VLO85NPLc8gam0EQ7010q8ZMrCPKxjWc0+nvXp8V3AoEATORnUCfat5h4J
 YHsGN8Bf7BxzH/alUNBhiyOUy6zn+2bcvAkdZpKFoPbk4tSUswWPefLi1JtL9TDr0lio
 DG1dMeqrgnWfxhiJh+6ikqdAS15dsoVhomBDtZfqGe7Sj8a8WCYua+58bPiwInUSSLNR
 /xtUAPfubEj9nRTAQxfyZrb7BxXkPbxyCX3BfPhUp6LfuZgt/kS6EEf+lxyNddOt2wjd
 hKHAv8gqzr1EujtW5SPJJMYbYJQhHE+CLOnOZO1ubLm/Ua2eseFxpEkKd8VV770hHQCW
 JlFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696075205; x=1696680005;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7GTxYazO7tslop+1R5e/LRP9/RgHOwT+uOuEWmbMhAw=;
 b=b7PCbkEuRgM2gGFOOQhxE3Po0JmQwyTVcWeJEox/IkQ5FZuAxM+gcUIYz+ZNQ/58Sm
 qbNle6W6SdJkkjumK867q39A7790Ax9h7wSoW0RehSnv4ygAJ7qohaL8nE9ayPjmrwoS
 T3A4zmAReKOVhvHvm6wJN5iHrqjwyrTTWF9FsoHV2stqRMELidrh57BlhE+zw4u6nwAg
 kMvT7mz6Uzg4Mve60VSqcXCAF7tQrkbgI9LsXfLPOUolUAbw/aymvxpoin10epqHfRbD
 MQ8w8T/UM6ysOhd09P6KWYwNCrEU+yrWPs9xkaaAT0vG1oWmLQIJithzxxF801eidZFY
 fOWA==
X-Gm-Message-State: AOJu0Ywh1UiRQ1FG+LDEzcmLD3aUxUng/MF/yIwRFttiMP5A4CbOuJJs
 dy6IHJQAlf/GiNZDdRN3spvZzYoCNj+WFu9dnCClmg==
X-Google-Smtp-Source: AGHT+IGdzCjX3EBgqb4QPmapoSPJsqAAEbYgJDuzEACgLn7JbDrTrmgIjPOsc2vqbMgvrU34OmWNrGJLKX84Jip4SOo=
X-Received: by 2002:a50:8d17:0:b0:52f:5697:8dec with SMTP id
 s23-20020a508d17000000b0052f56978decmr32444eds.4.1696075204644; Sat, 30 Sep
 2023 05:00:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230922111247.497-1-ansuelsmth@gmail.com>
In-Reply-To: <20230922111247.497-1-ansuelsmth@gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Sat, 30 Sep 2023 13:59:53 +0200
Message-ID: <CANn89iJtrpVQZbeAezd7S4p_yCRSFzcsBMgW+y9YhxOrCv463A@mail.gmail.com>
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

T24gRnJpLCBTZXAgMjIsIDIwMjMgYXQgMToxM+KAr1BNIENocmlzdGlhbiBNYXJhbmdpIDxhbnN1
ZWxzbXRoQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBXZSBjdXJyZW50bHkgaGF2ZSBuYXBpX2lmX3Nj
aGVkdWxlZF9tYXJrX21pc3NlZCB0aGF0IGNhbiBiZSB1c2VkIHRvCj4gY2hlY2sgaWYgbmFwaSBp
cyBzY2hlZHVsZWQgYnV0IHRoYXQgZG9lcyBtb3JlIHRoaW5nIHRoYW4gc2ltcGx5IGNoZWNraW5n
Cj4gaXQgYW5kIHJldHVybiBhIGJvb2wuIFNvbWUgZHJpdmVyIGFscmVhZHkgaW1wbGVtZW50IGN1
c3RvbSBmdW5jdGlvbiB0bwo+IGNoZWNrIGlmIG5hcGkgaXMgc2NoZWR1bGVkLgo+Cj4gRHJvcCB0
aGVzZSBjdXN0b20gZnVuY3Rpb24gYW5kIGludHJvZHVjZSBuYXBpX2lzX3NjaGVkdWxlZCB0aGF0
IHNpbXBseQo+IGNoZWNrIGlmIG5hcGkgaXMgc2NoZWR1bGVkIGF0b21pY2FsbHkuCj4KPiBVcGRh
dGUgYW55IGRyaXZlciBhbmQgY29kZSB0aGF0IGltcGxlbWVudCBhIHNpbWlsYXIgY2hlY2sgYW5k
IGluc3RlYWQKPiB1c2UgdGhpcyBuZXcgaGVscGVyLgo+Cj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0
aWFuIE1hcmFuZ2kgPGFuc3VlbHNtdGhAZ21haWwuY29tPgo+IC0tLQo+ICBkcml2ZXJzL25ldC9l
dGhlcm5ldC9jaGVsc2lvL2N4Z2IzL3NnZS5jICB8IDggLS0tLS0tLS0KPiAgZHJpdmVycy9uZXQv
d2lyZWxlc3MvcmVhbHRlay9ydHc4OS9jb3JlLmMgfCAyICstCj4gIGluY2x1ZGUvbGludXgvbmV0
ZGV2aWNlLmggICAgICAgICAgICAgICAgIHwgNSArKysrKwo+ICBuZXQvY29yZS9kZXYuYyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB8IDIgKy0KPiAgNCBmaWxlcyBjaGFuZ2VkLCA3IGluc2Vy
dGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2V0
aGVybmV0L2NoZWxzaW8vY3hnYjMvc2dlLmMgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9jaGVsc2lv
L2N4Z2IzL3NnZS5jCj4gaW5kZXggMmU5YTc0ZmUwOTcwLi43MWZhMmRjMTkwMzQgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvY2hlbHNpby9jeGdiMy9zZ2UuYwo+ICsrKyBiL2Ry
aXZlcnMvbmV0L2V0aGVybmV0L2NoZWxzaW8vY3hnYjMvc2dlLmMKPiBAQCAtMjUwMSwxNCArMjUw
MSw2IEBAIHN0YXRpYyBpbnQgbmFwaV9yeF9oYW5kbGVyKHN0cnVjdCBuYXBpX3N0cnVjdCAqbmFw
aSwgaW50IGJ1ZGdldCkKPiAgICAgICAgIHJldHVybiB3b3JrX2RvbmU7Cj4gIH0KPgo+IC0vKgo+
IC0gKiBSZXR1cm5zIHRydWUgaWYgdGhlIGRldmljZSBpcyBhbHJlYWR5IHNjaGVkdWxlZCBmb3Ig
cG9sbGluZy4KPiAtICovCj4gLXN0YXRpYyBpbmxpbmUgaW50IG5hcGlfaXNfc2NoZWR1bGVkKHN0
cnVjdCBuYXBpX3N0cnVjdCAqbmFwaSkKPiAtewo+IC0gICAgICAgcmV0dXJuIHRlc3RfYml0KE5B
UElfU1RBVEVfU0NIRUQsICZuYXBpLT5zdGF0ZSk7Cj4gLX0KPiAtCj4gIC8qKgo+ICAgKiAgICAg
cHJvY2Vzc19wdXJlX3Jlc3BvbnNlcyAtIHByb2Nlc3MgcHVyZSByZXNwb25zZXMgZnJvbSBhIHJl
c3BvbnNlIHF1ZXVlCj4gICAqICAgICBAYWRhcDogdGhlIGFkYXB0ZXIKPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9uZXQvd2lyZWxlc3MvcmVhbHRlay9ydHc4OS9jb3JlLmMgYi9kcml2ZXJzL25ldC93
aXJlbGVzcy9yZWFsdGVrL3J0dzg5L2NvcmUuYwo+IGluZGV4IDEzM2JmMjg5YmFjYi4uYmJmNGVh
MzYzOWQ0IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbmV0L3dpcmVsZXNzL3JlYWx0ZWsvcnR3ODkv
Y29yZS5jCj4gKysrIGIvZHJpdmVycy9uZXQvd2lyZWxlc3MvcmVhbHRlay9ydHc4OS9jb3JlLmMK
PiBAQCAtMTc0NCw3ICsxNzQ0LDcgQEAgc3RhdGljIHZvaWQgcnR3ODlfY29yZV9yeF90b19tYWM4
MDIxMShzdHJ1Y3QgcnR3ODlfZGV2ICpydHdkZXYsCj4gICAgICAgICBzdHJ1Y3QgbmFwaV9zdHJ1
Y3QgKm5hcGkgPSAmcnR3ZGV2LT5uYXBpOwo+Cj4gICAgICAgICAvKiBJbiBsb3cgcG93ZXIgbW9k
ZSwgbmFwaSBpc24ndCBzY2hlZHVsZWQuIFJlY2VpdmUgaXQgdG8gbmV0aWYuICovCj4gLSAgICAg
ICBpZiAodW5saWtlbHkoIXRlc3RfYml0KE5BUElfU1RBVEVfU0NIRUQsICZuYXBpLT5zdGF0ZSkp
KQo+ICsgICAgICAgaWYgKHVubGlrZWx5KCFuYXBpX2lzX3NjaGVkdWxlZChuYXBpKSkpCj4gICAg
ICAgICAgICAgICAgIG5hcGkgPSBOVUxMOwo+Cj4gICAgICAgICBydHc4OV9jb3JlX2h3X3RvX3Ni
YW5kX3JhdGUocnhfc3RhdHVzKTsKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9uZXRkZXZp
Y2UuaCBiL2luY2x1ZGUvbGludXgvbmV0ZGV2aWNlLmgKPiBpbmRleCBkYjNkODQyOWQ1MGQuLjhl
YWMwMGNkM2I5MiAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2xpbnV4L25ldGRldmljZS5oCj4gKysr
IGIvaW5jbHVkZS9saW51eC9uZXRkZXZpY2UuaAo+IEBAIC00ODIsNiArNDgyLDExIEBAIHN0YXRp
YyBpbmxpbmUgYm9vbCBuYXBpX3ByZWZlcl9idXN5X3BvbGwoc3RydWN0IG5hcGlfc3RydWN0ICpu
KQo+ICAgICAgICAgcmV0dXJuIHRlc3RfYml0KE5BUElfU1RBVEVfUFJFRkVSX0JVU1lfUE9MTCwg
Jm4tPnN0YXRlKTsKPiAgfQo+CgoKSW4gd2hpY2ggY29udGV4dCBpcyBpdCBzYWZlIHRvIGNhbGwg
dGhpcyBoZWxwZXIgPwoKSSBmZWFyIHRoYXQgbWFraW5nIHRoaXMgYXZhaWxhYmxlIHdpbGwgYWRk
IG1vcmUgYnVncy4KCkZvciBpbnN0YW5jZSByc3BxX2NoZWNrX25hcGkoKSBzZWVtcyBidWdneSB0
byBtZS4KCj4gK3N0YXRpYyBpbmxpbmUgYm9vbCBuYXBpX2lzX3NjaGVkdWxlZChzdHJ1Y3QgbmFw
aV9zdHJ1Y3QgKm4pCgpjb25zdCAuLi4KCj4gK3sKPiArICAgICAgIHJldHVybiB0ZXN0X2JpdChO
QVBJX1NUQVRFX1NDSEVELCAmbi0+c3RhdGUpOwo+ICt9Cj4gKwo+ICBib29sIG5hcGlfc2NoZWR1
bGVfcHJlcChzdHJ1Y3QgbmFwaV9zdHJ1Y3QgKm4pOwo+Cj4gIC8qKgo+IGRpZmYgLS1naXQgYS9u
ZXQvY29yZS9kZXYuYyBiL25ldC9jb3JlL2Rldi5jCj4gaW5kZXggY2MwM2E1NzU4ZDJkLi4zMmJh
ODAwMmY2NWEgMTAwNjQ0Cj4gLS0tIGEvbmV0L2NvcmUvZGV2LmMKPiArKysgYi9uZXQvY29yZS9k
ZXYuYwo+IEBAIC02NTIzLDcgKzY1MjMsNyBAQCBzdGF0aWMgaW50IF9fbmFwaV9wb2xsKHN0cnVj
dCBuYXBpX3N0cnVjdCAqbiwgYm9vbCAqcmVwb2xsKQo+ICAgICAgICAgICogYWNjaWRlbnRhbGx5
IGNhbGxpbmcgLT5wb2xsKCkgd2hlbiBOQVBJIGlzIG5vdCBzY2hlZHVsZWQuCj4gICAgICAgICAg
Ki8KPiAgICAgICAgIHdvcmsgPSAwOwo+IC0gICAgICAgaWYgKHRlc3RfYml0KE5BUElfU1RBVEVf
U0NIRUQsICZuLT5zdGF0ZSkpIHsKPiArICAgICAgIGlmIChuYXBpX2lzX3NjaGVkdWxlZChuKSkg
ewo+ICAgICAgICAgICAgICAgICB3b3JrID0gbi0+cG9sbChuLCB3ZWlnaHQpOwo+ICAgICAgICAg
ICAgICAgICB0cmFjZV9uYXBpX3BvbGwobiwgd29yaywgd2VpZ2h0KTsKPiAgICAgICAgIH0KPiAt
LQo+IDIuNDAuMQo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
