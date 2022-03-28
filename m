Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D42C4E8F14
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Mar 2022 09:35:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4D6ECC5C842;
	Mon, 28 Mar 2022 07:35:40 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 67C36C57B6F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Mar 2022 07:35:38 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id a11so11603026qtb.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Mar 2022 00:35:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NSmS9k73z1IP3D2QdHYwh4TDW9fTJmU9UMoo6xsufQI=;
 b=M08XhC70fG1GhRYfVYeuP02PwjJ7IWkBFZi9WQqkToQ26hjLLJFTgWSR74vySc04pX
 1rVUCL8JKmB4vjei6beLUxyHv3NX2nLRSMytuIDKaOO0VYWefdh+oujeZArEO5/Lh3Mc
 DIpT9BrGCO7qB2mpXbHbhCRUFmnupCC2h/pROm88Eh4T52H6264PujBVNeOCHsxWjpUI
 +42uc/qbT8FjVJDDbFg/Z9z1ZbrhkRZttSEX9eb8hG3+U1mQGY47Q0Jax6BDigJyrP2M
 itZgclAIffE5SSvKO7YW7JwJ0rbGKMZnCiyLn7vmZ6PBZysdB7Mz3GGGZakVbQtJKuLR
 o1Fw==
X-Gm-Message-State: AOAM533LecgKtRs26sRq4RjcPNwSrissZovASu8AmuS14A1BpYKv3aJe
 FpHDohTtxoWSoMn/hzx+ZFq0n1mIzDH2Yw==
X-Google-Smtp-Source: ABdhPJyYCENDAcLW+SRApXtFyFu4TCwqa2PaCgSNF4hxkswjiTsbPopy/XNj8kPWu94MXqm6ADoP5A==
X-Received: by 2002:ac8:5c81:0:b0:2e1:a55d:35d5 with SMTP id
 r1-20020ac85c81000000b002e1a55d35d5mr20177589qta.514.1648452937350; 
 Mon, 28 Mar 2022 00:35:37 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com.
 [209.85.219.181]) by smtp.gmail.com with ESMTPSA id
 a9-20020ac85b89000000b002e2072c9dedsm12505679qta.67.2022.03.28.00.35.36
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Mar 2022 00:35:37 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id y38so21856999ybi.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Mar 2022 00:35:36 -0700 (PDT)
X-Received: by 2002:a05:6902:101:b0:633:ccde:cfca with SMTP id
 o1-20020a056902010100b00633ccdecfcamr20853450ybh.207.1648452936744; Mon, 28
 Mar 2022 00:35:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220325200338.54270-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20220325200338.54270-1-andriy.shevchenko@linux.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 28 Mar 2022 09:35:25 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXJo=XWNLKpFFe65fx-c7oPXmydvXxiPzGicNaxYthGbg@mail.gmail.com>
Message-ID: <CAMuHMdXJo=XWNLKpFFe65fx-c7oPXmydvXxiPzGicNaxYthGbg@mail.gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [Linux-stm32] [PATCH v1 1/5] gpiolib: Introduce
	gpiochip_count() helper
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

SGkgQW5keSwKCk9uIEZyaSwgTWFyIDI1LCAyMDIyIGF0IDk6MDQgUE0gQW5keSBTaGV2Y2hlbmtv
CjxhbmRyaXkuc2hldmNoZW5rb0BsaW51eC5pbnRlbC5jb20+IHdyb3RlOgo+IFRoZSBncGlvY2hp
cF9jb3VudCgpIGhlbHBlciBpdGVyYXRlcyBvdmVyIHRoZSBkZXZpY2UgY2hpbGQgbm9kZXMgdGhh
dCBoYXZlCj4gdGhlICJncGlvLWNvbnRyb2xsZXIiIHByb3BlcnR5IHNldC4gSXQgcmV0dXJucyB0
aGUgbnVtYmVyIG9mIHN1Y2ggbm9kZXMKPiB1bmRlciBnaXZlbiBkZXZpY2UuCj4KPiBTaWduZWQt
b2ZmLWJ5OiBBbmR5IFNoZXZjaGVua28gPGFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNv
bT4KClRoYW5rcyBmb3IgeW91ciBwYXRjaCEKCj4gLS0tIGEvaW5jbHVkZS9saW51eC9ncGlvL2Ry
aXZlci5oCj4gKysrIGIvaW5jbHVkZS9saW51eC9ncGlvL2RyaXZlci5oCj4gQEAgLTc1MCw0ICs3
NTEsMTcgQEAgc3RhdGljIGlubGluZSB2b2lkIGdwaW9jaGlwX3VubG9ja19hc19pcnEoc3RydWN0
IGdwaW9fY2hpcCAqZ2MsCj4gIH0KPiAgI2VuZGlmIC8qIENPTkZJR19HUElPTElCICovCj4KPiAr
c3RhdGljIGlubGluZSB1bnNpZ25lZCBpbnQgZ3Bpb2NoaXBfY291bnQoc3RydWN0IGRldmljZSAq
ZGV2KQo+ICt7Cj4gKyAgICAgICBzdHJ1Y3QgZndub2RlX2hhbmRsZSAqY2hpbGQ7Cj4gKyAgICAg
ICB1bnNpZ25lZCBpbnQgY291bnQgPSAwOwo+ICsKPiArICAgICAgIGRldmljZV9mb3JfZWFjaF9j
aGlsZF9ub2RlKGRldiwgY2hpbGQpIHsKPiArICAgICAgICAgICAgICAgaWYgKGRldmljZV9wcm9w
ZXJ0eV9yZWFkX2Jvb2woY2hpbGQsICJncGlvLWNvbnRyb2xsZXIiKSkKCmVycm9yOiBwYXNzaW5n
IGFyZ3VtZW50IDEgb2Yg4oCYZGV2aWNlX3Byb3BlcnR5X3JlYWRfYm9vbOKAmSBmcm9tCmluY29t
cGF0aWJsZSBwb2ludGVyIHR5cGUgWy1XZXJyb3I9aW5jb21wYXRpYmxlLXBvaW50ZXItdHlwZXNd
CgpTbyBJJ20gYWZyYWlkIEkgY2Fubm90IHRlc3QgcGF0Y2ggMy81IHlldCA7LSkKCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgY291bnQrKzsKPiArICAgICAgIH0KPiArCj4gKyAgICAgICByZXR1
cm4gY291bnQ7Cj4gK30KPiArCj4gICNlbmRpZiAvKiBfX0xJTlVYX0dQSU9fRFJJVkVSX0ggKi8K
Ckdye29ldGplLGVldGluZ31zLAoKICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQKCi0tCkdl
ZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0g
Z2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNo
bmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKd2hlbiBJJ20gdGFsa2lu
ZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlr
ZSB0aGF0LgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRz
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0
bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
Cmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXN0bTMyCg==
