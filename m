Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2294E2871E
	for <lists+linux-stm32@lfdr.de>; Thu, 23 May 2019 21:18:53 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BEA6ECD5B9B
	for <lists+linux-stm32@lfdr.de>; Thu, 23 May 2019 19:18:52 +0000 (UTC)
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
 [209.85.167.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3B83ACD5B9A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 May 2019 19:18:50 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id d8so5215781lfb.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 May 2019 12:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7Xq8hDRQty0iPHxqWBmFMiHP5/NEYwgv6qrN0Vc4nP8=;
 b=ElJnN4SIqyVX33y7h7nGUs3agYvp1XeedQRemgpNbRIk5YlpyMiZcdC55lWgxLgh11
 KGA9kvQoiXXYs/58eF04FaDku2dDlD83wtRBSt+M6G1ZAh4arkTz+KAL9TD9eCPYRb/s
 Ml/yCA3Aye5kHbDL64GQjMNXaH7xxCsjKFKk57fS61mAwZZbM5zYQIgvTjCECVGeIZvS
 Vu8BchtkGC9SqVmc9zM+HUOnm3qts+3oDP4vc86hWfjkeMINYmjeEB+owqaNfIjKGnt1
 gaT8dQa9c8myhvRDjgnSpTJpspt1aTRyCZ621kdINUkw1wzbTQr7dwLOXa4U8fvDlT2D
 Gyvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7Xq8hDRQty0iPHxqWBmFMiHP5/NEYwgv6qrN0Vc4nP8=;
 b=UAxAr/OODzOTT+YRxMBo6D9OA9h0JcZNc/DwkeXZNgEA58fpRdlZ/iJ4jHTTUG4/fx
 PlcBmyXUgcU68JsapnWBKfpU/xBwz4LckolXoxvJrwhF+cxVS4PdXSbLxJ8YKellX6R5
 HyFBkMu0gJDcE7ig7S9QnJ12SWxVZBT9R+kTNnXPQYgJNFtjTYGLp6+UeU2HOaBb3Om5
 J6EBoZnav51ysOn+uCwuQMI/fXl4RRC8DVmSMOoGkxx06Z9ee30zNS1b4JObw5m1UPMw
 YiV5uwhGQQwE2kyNIuBujxQIKqJQYEGvP4YsNDRpcC/RtzVMJQlkvHDMQrzOSfpmsJON
 PJLg==
X-Gm-Message-State: APjAAAWZQCZ4qljrM6Tt0guFqgP93hqTBTUAZk2OOdct4W+KiI8hD1Xo
 P8sso4FQy6lbpCHUTzq6dRszh0pjUnXNF2tVbuou6g==
X-Google-Smtp-Source: APXvYqw1XbYiFz5hQUalCxrVjKiO6TIO71hT0hyMX6W3pIGmpBG9+vju9MG+sHieuLq/jz7BZlnOc90KWMXZK2Bxibs=
X-Received: by 2002:a19:189:: with SMTP id 131mr46796309lfb.74.1558639129364; 
 Thu, 23 May 2019 12:18:49 -0700 (PDT)
MIME-Version: 1.0
References: <1558338735-8444-1-git-send-email-amelie.delaunay@st.com>
 <20190522054833.GB4574@dell> <eb8425ec-989a-9701-7fee-61bd1d2b93c1@st.com>
 <20190522084133.GF4574@dell> <bc1b5f1d-23b0-141d-f58f-b54ac303fe20@st.com>
 <CACRpkdYmdpwEvCBrL6i1V+Zxd0OSpZmD8BJPSZu9jYNeJkoimQ@mail.gmail.com>
 <08ea97544018430caf53af36677902b7@SFHDAG3NODE2.st.com>
In-Reply-To: <08ea97544018430caf53af36677902b7@SFHDAG3NODE2.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 23 May 2019 21:18:37 +0200
Message-ID: <CACRpkdZLbMJ5dKiL9J1x=PozBVH777kNNABZi-n0LxD0BOp8mw@mail.gmail.com>
To: Amelie DELAUNAY <amelie.delaunay@st.com>
Cc: Randy Dunlap <rdunlap@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "kbuild-all@01.org" <kbuild-all@01.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] pinctrl: stmfx: Fix compile issue when
 CONFIG_OF_GPIO is not defined
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

T24gVGh1LCBNYXkgMjMsIDIwMTkgYXQgNDoxMSBQTSBBbWVsaWUgREVMQVVOQVkgPGFtZWxpZS5k
ZWxhdW5heUBzdC5jb20+IHdyb3RlOgo+IE9uIDUvMjIvMTkgMTE6NDggUE0sIExpbnVzIFdhbGxl
aWogd3JvdGU6Cj4gPiBPbiBXZWQsIE1heSAyMiwgMjAxOSBhdCAxMToyMSBBTSBBbWVsaWUgREVM
QVVOQVkgPGFtZWxpZS5kZWxhdW5heUBzdC5jb20+IHdyb3RlOgo+ID4KPiA+PiAuLi9kcml2ZXJz
L3BpbmN0cmwvcGluY3RybC1zdG1meC5jOjQwOToyMDogZXJyb3I6Cj4gPj4g4oCYcGluY29uZl9n
ZW5lcmljX2R0X25vZGVfdG9fbWFwX3BpbuKAmSB1bmRlY2xhcmVkIGhlcmUgKG5vdCBpbiBhIGZ1
bmN0aW9uKQo+ID4+ICAgICAuZHRfbm9kZV90b19tYXAgPSBwaW5jb25mX2dlbmVyaWNfZHRfbm9k
ZV90b19tYXBfcGluLAo+ID4+Cj4gPj4gT0ZfR1BJTyBkZXBlbmRzIG9uIE9GLgo+ID4+Cj4gPj4g
U28gZWl0aGVyCj4gPj4gICAgICAgZGVwZW5kcyBvbiBPRiB8fCAoT0YgJiYgQ09NUElMRV9URVNU
KQo+ID4+IG9yCj4gPj4gICAgICAgZGVwZW5kcyBvbiBPRiB8fCAoT0ZfR1BJTyAmJiBDT01QSUxF
X1RFU1QpCj4gPj4KPiA+PiBhbmQKPiA+Pgo+ID4+ICAgICAgIHNlbGVjdCBPRl9HUElPCj4gPgo+
ID4gSSB3b3VsZCB1c2UganVzdDoKPiA+Cj4gPiBkZXBlbmRzIG9uIE9GX0dQSU8KPiA+Cj4gPiBC
ZWNhdXNlIE9GX0dQSU8gYWxyZWFkeSBkZXBlbmRzIG9uIE9GLCBhbmQKPiA+IGNvbXBpbGUgdGVz
dHMgd2lsbCBub3Qgd29yayB3aXRob3V0IE9GX0dQSU8gd2hpY2gKPiA+IHJlcXVpcmUgT0Ygc28u
Li4KPiA+Cj4gPiBCZXNpZGVzIGl0IGlzIHdoYXQgbW9zdCBvdGhlciBHUElPIGRyaXZlcnMgZG8u
Cj4gPgo+ID4gU28ganVzdCBrZWVwIHRoYXQgb25lIGxpbmUgYW5kIGRyb3AgdGhlIHJlc3QuCj4g
Pgo+ID4gWW91cnMsCj4gPiBMaW51cyBXYWxsZWlqCj4gPgo+Cj4gT2sgc28gSSBjYW4gZ2V0IHJp
ZCBvZiBDT01QSUxFX1RFU1QgPwo+ICAgICAgICAgZGVwZW5kcyBvbiBJMkMKPiAgICAgICAgIGRl
cGVuZHMgb24gT0ZfR1BJTwo+ICAgICAgICAgc2VsZWN0IEdFTkVSSUNfUElOQ09ORgo+ICAgICAg
ICAgc2VsZWN0IEdQSU9MSUJfSVJRQ0hJUAo+ICAgICAgICAgc2VsZWN0IE1GRF9TVE1GWAoKWWVw
IGp1c3QgbGlrZSB0aGF0LgoKPiBCZWNhdXNlIEkndmUgbm8gYXJjaCB0byBiYWxhbmNlIENPTVBJ
TEVfVEVTVC4gT3IgbWF5YmUgc29tZXRoaW5nIGxpa2UKPiAgICAgICAgIGRlcGVuZHMgb24gT0Zf
R1BJTyAmJiAoT0YgfHwgQ09NUElMRV9URVNUKQo+IGV2ZW4gaWYgT0ZfR1BJTyAmJiBPRiBpcyBy
ZWR1bmRhbnQgPwoKQ09NUElMRV9URVNUIGlzIGp1c3QgdG8gbWFrZSBzb21ldGhpbmcgYXZhaWxh
YmxlIGZvciB0ZXN0aW5nCm9uIG90aGVyIGFyY2hpdGVjdHVyZXMsIHN1Y2ggYXMgdGVzdGluZyBB
Uk0tc3BlY2lmaWMgZHJpdmVycwpvbiB4ODYuCgpXaXRoIGp1c3QgT0ZfR1BJTyBhcyBkZXBlbmRl
bmN5LCBpdCB3aWxsIGJlIGNvbXBpbGUgdGVzdGVkIGFueXdheXMKYmVjYXVzZSB4ODYgYWxseWVz
Y29uZmlnIHdpbGwgZW5hYmxlIE9GIGFuZCBPRl9HUElPLCBhbmQgYWxzbwphbGwgdGhlIFNUTUZY
IGRyaXZlcnMuCgpZb3VycywKTGludXMgV2FsbGVpagpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3Rt
MzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
