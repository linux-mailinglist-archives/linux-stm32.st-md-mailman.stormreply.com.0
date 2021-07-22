Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E25D3D1B9C
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Jul 2021 04:07:57 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EC673C5A4C0;
	Thu, 22 Jul 2021 02:07:56 +0000 (UTC)
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com
 [209.85.166.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 358CEC597BE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Jul 2021 02:07:56 +0000 (UTC)
Received: by mail-il1-f175.google.com with SMTP id b14so4042216ilf.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Jul 2021 19:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=90T8pVlNu5R4aARTLjIPZ2shWeZ1pN4LEYWIIMIBA/Y=;
 b=ZrcYlafSzxD0iNHz7hFfuRgsZhERE/FFxN0t89R6+5lbyxC7+FH5iiv/EwOH4RoWLg
 qvxm3vsrC/5fwcDoUGWRvEBxx+MKGXA6auS8Dr5I8xK1XsiTXuJbW7GKLUlPzTqM4W1C
 +2CrFCMeknsDB2dF9Ecr6TqMn14CNC88WEKDpWBUxKEp8Ikpmv9jmxS2x+fQIfTgAnlF
 Z91yHUNCggVbgrcsjthne/UBOvQtsFefHu7S4Vp6UhjPlx2hJH6mbx1YF4xl5AIOlIbm
 DoklVBDaXv1/Eqh3VxLyksW2y5dGQhnsR1DYubiaFaFPi9btcOoHAJ/xROeJC58fY/6f
 TCRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=90T8pVlNu5R4aARTLjIPZ2shWeZ1pN4LEYWIIMIBA/Y=;
 b=RqfSyWNwuct44BOYIaswV4FyeeZtKczjgT7GWL5gd8iOp2RBb8TFmYjnH7yB3AEoqk
 zm2qZ4Vpmmf2K6G4HEq8yDtu5OgXI/oJZO7x33Q12EjVujNofPZHnUIMHnMoJKurpRmk
 /WqU5eqPkjULDBE7rkYA3jrB9yUQomnYCnvWkrnPL7HxIauj8z6rsOFscgM8wThO4SF9
 58LBWtv5U5ewrgPnWyGo2hWD1NqZoaFH8qJGKy69tLkFLftbmS27ymCNmBtslp3i2mLO
 yuZDRy6M7G3uOl7eTpVjUdeNgvahAb7tZwbKKnGeoll0V85/Q35Z1ah5WiPmydHEgUul
 gDcg==
X-Gm-Message-State: AOAM530UiKXNAgp3rZ6rwmhwY+R0Q5Mw+eGPRM0TiGBeiFiOpmxG5HSL
 SRlNz7A4o8+RCzsF6AGvNLYscaZzTXbQF0EgDFA=
X-Google-Smtp-Source: ABdhPJxgBytAWSHe5ssnHfJDN1qf7Ebn8LuKIIxs/cyJ1/sfTsYmEVV6WZ09Y2ktwylhbMFQIAmIrxrDCnDM1ssJyPA=
X-Received: by 2002:a92:c5c5:: with SMTP id s5mr24509368ilt.271.1626919674933; 
 Wed, 21 Jul 2021 19:07:54 -0700 (PDT)
MIME-Version: 1.0
References: <1626853288-31223-1-git-send-email-dillon.minfei@gmail.com>
 <1626853288-31223-4-git-send-email-dillon.minfei@gmail.com>
 <8e091b9c-764d-d410-559e-3c5e25de2a3c@tronnes.org>
In-Reply-To: <8e091b9c-764d-d410-559e-3c5e25de2a3c@tronnes.org>
From: Dillon Min <dillon.minfei@gmail.com>
Date: Thu, 22 Jul 2021 10:07:18 +0800
Message-ID: <CAL9mu0K2yLsG0MXOd4ke8N8zn7311CJ54hL-JcbocJOK+H7W9A@mail.gmail.com>
To: =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Dave Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Doug Anderson <dianders@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sam Ravnborg <sam@ravnborg.org>, linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v2 3/3] drm/panel: Add ilitek ili9341
	panel driver
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

SGkgTm9yYWxmCgpUaGFua3MgZm9yIHlvdXIgdGltZSB0byByZXZpZXcgbXkgcGF0Y2guCgpPbiBU
aHUsIDIyIEp1bCAyMDIxIGF0IDAxOjQyLCBOb3JhbGYgVHLDuG5uZXMgPG5vcmFsZkB0cm9ubmVz
Lm9yZz4gd3JvdGU6Cj4KPgo+Cj4gRGVuIDIxLjA3LjIwMjEgMDkuNDEsIHNrcmV2IGRpbGxvbi5t
aW5mZWlAZ21haWwuY29tOgo+ID4gRnJvbTogRGlsbG9uIE1pbiA8ZGlsbG9uLm1pbmZlaUBnbWFp
bC5jb20+Cj4gPgo+ID4gVGhpcyBkcml2ZXIgY29tYmluZSB0aW55L2lsaTkzNDEuYyBtaXBpX2Ri
aV9pbnRlcmZhY2UgZHJpdmVyCj4gPiB3aXRoIG1pcGlfZHBpX2ludGVyZmFjZSBkcml2ZXIsIGNh
biBzdXBwb3J0IGlsaTkzNDEgd2l0aCBzZXJpYWwKPiA+IG1vZGUgb3IgcGFyYWxsZWwgcmdiIGlu
dGVyZmFjZSBtb2RlIGJ5IHJlZ2lzdGVyIGNvbmZpZ3VyYXRpb24uCj4gPgo+ID4gQ2M6IExpbnVz
IFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KPiA+IFNpZ25lZC1vZmYtYnk6IERp
bGxvbiBNaW4gPGRpbGxvbi5taW5mZWlAZ21haWwuY29tPgo+ID4gLS0tCj4KPiA+ICtzdGF0aWMg
Y29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBpbGk5MzQxX29mX21hdGNoW10gPSB7Cj4gPiArICAg
ICB7Cj4gPiArICAgICAgICAgICAgIC5jb21wYXRpYmxlID0gInN0LHNmLXRjMjQwdC05MzcwLXQi
LAo+ID4gKyAgICAgICAgICAgICAuZGF0YSA9ICZpbGk5MzQxX3N0bTMyZjQyOV9kaXNjb19kYXRh
LAo+ID4gKyAgICAgfSwKPiA+ICsgICAgIHsKPiA+ICsgICAgICAgICAgICAgLyogcG9ydGluZyBm
cm9tIHRpbnkvaWxpOTM0MS5jCj4gPiArICAgICAgICAgICAgICAqIGZvciBvcmlnaW5hbCBtaXBp
IGRiaSBjb21waXRhYmxlCj4gPiArICAgICAgICAgICAgICAqLwo+ID4gKyAgICAgICAgICAgICAu
Y29tcGF0aWJsZSA9ICJhZGFmcnVpdCx5eDI0MHF2MjkiLAo+Cj4gSSBkb24ndCB1bmRlcnN0YW5k
IHRoaXMsIG5vdyB0aGVyZSB3aWxsIGJlIDIgZHJpdmVycyB0aGF0IHN1cHBvcnQgdGhlCj4gc2Ft
ZSBkaXNwbGF5PwoKVGhlcmUgaXMgbm8gcmVhc29uIHRvIGNyZWF0ZSB0d28gZHJpdmVycyB0byBz
dXBwb3J0IHRoZSBzYW1lIGRpc3BsYXkuCgpUbyBzdXBwb3J0IG9ubHktZGJpIGFuZCBkYmkrZHBp
IHBhbmVsIGF0IGRybS9wYW5lbCBvciBkcm0vdGlueSBib3RoCmZpbmUgd2l0aCBtZS4KCj4KPiBB
RkFJQ1QgZHJtL3RpbnkvaWxpOTM0MS5jIGlzIGp1c3QgY29waWVkIGludG8gdGhpcyBkcml2ZXIs
IGlzIHRoZSBwbGFuCj4gdG8gcmVtb3ZlIHRoZSB0aW55LyBkcml2ZXI/IElmIHNvIEkgY291bGRu
J3Qgc2VlIHRoaXMgbWVudGlvbmVkIGFueXdoZXJlLgoKWWVzLCBJJ2QgbGlrZSB0byBtZXJnZSB0
aGUgY29kZSBmcm9tIGRybS90aW55L2lsaTkzNDEuYyB0byB0aGlzIGRyaXZlcgoodG8gbWFrZSBh
IHNpbmdsZSBkcml2ZXIgdG8gc3VwcG9ydCBkaWZmZXJlbnQgYnVzKS4KCkkgaGF2ZSB0d28gcHVy
cG9zZSB0byBleHRlbmQgdGhlIGZlYXR1cmUgZHJtL3RpbnkvaWxpOTM0MS5jCgotIGtlZXAgY29t
cGF0aWJsZSA9ICJhZGFmcnVpdCx5eDI0MHF2MjkiLCBhZGQgYnVzIG1vZGUgZHRzIGJpbmRpbmdz
IChwYW5lbF9idXMpCiAgdG8gZGVmaW5lIHRoZSBpbnRlcmZhY2Ugd2hpY2ggaG9zdCB3YW50cyB0
byB1c2UuIHN1Y2ggYXMKcGFuZWxfYnVzPSJkYmkiIG9yICJyZ2IiCiAgb3IgImk4MCIgZm9yIHRo
aXMgY2FzZSwgaSB3aWxsIGFkZCBkcGkgY29kZSB0byBkcm0vdGlueS9pbGk5MzQxLmMuCgotIG1l
cmdlIHRpbnkvaWxpOTM0MS5jIHRvIHRoaXMgZHJpdmVyLHJlbW92ZSBkcm0vdGlueS9pbGk5MzQx
LmMsIGFkZApuZXcgZHRzIGNvbXBhdGlibGUKICBzdHJpbmcgdG8gc3VwcG9ydCBvdGhlciBpbnRl
cmZhY2VzLiBqdXN0IGxpa2Ugd2hhdCBpJ20gZG9pbmcgbm93LgoKSSBoYXZlIG5vIGlkZWEgYWJv
dXQgeW91ciBwbGFuIG9uIGRybS90aW55IGRyaXZlcnMsIGFjdHVhbGx5IHNvbWUgb2YKdGhlc2Ug
cGFuZWxzIHVuZGVyCnRoZSBkaW55IGZvbGRlciBjYW4gc3VwcG9ydCBib3RoIGRiaSBhbmQgZGJp
K2RwaSAobXVjaCBmYXN0ZXIsIG5lZWQKbW9yZSBwaW5zKS4gbm8KZG91YnQgdGhlIHJlcXVpcmVt
ZW50IHRvIHN1cHBvcnQgZHBpIGlzIGFsd2F5cyB0aGVyZS4KCldoYXQgaXMgeW91ciBwcmVmZXJl
bmNlPwoKVGhhbmtzICYgUmVnYXJkcwpEaWxsb24KCj4KPiBOb3JhbGYuCj4KPiA+ICsgICAgICAg
ICAgICAgLmRhdGEgPSBOVUxMLAo+ID4gKyAgICAgfSwKPiA+ICt9Owo+ID4gK01PRFVMRV9ERVZJ
Q0VfVEFCTEUob2YsIGlsaTkzNDFfb2ZfbWF0Y2gpOwpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3Rt
MzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
