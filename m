Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 154B86C0BAC
	for <lists+linux-stm32@lfdr.de>; Mon, 20 Mar 2023 09:01:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BA637C6A5EF;
	Mon, 20 Mar 2023 08:01:19 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B915BC65068
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Mar 2023 08:01:18 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id i24so12106653qtm.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Mar 2023 01:01:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679299277;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9YDU8IzF0EsSpDkzRDjzs/d7Q1NfYw1Ou2xNB8kfdm8=;
 b=GhdIfFySXRDYNEh0UA9kPLgHQngPb3SBJ8V17ouCpEipeolvB0VeMtFXJyoy0i4JDc
 vWjnB897CuHpMkHlwhSpQgGTsMJkWbjQ4tYZq8j8SbGBW7GJT4yH9cWOa5cI56TgPCsa
 mBtL6Fu2892T8eRI82qF+oEafcPUBPHYfE2QEXzhltvtQdmOrZZRyFU0PSifrZP6d5Ly
 Fuy9UPt55qcWtZ8mSD7NbhkyWu3QdFwJebWvcfZ/Sigm6sLHY5TZEjK0kj4x3Q+u9Bzm
 TQitTgM9qNY7Ii0YMrnQ3OHeu4yrpx4ypCWDDxgtkLA9M5SgddomABOkprx+3XxRdsUV
 2HTA==
X-Gm-Message-State: AO0yUKWE3gnD/KTe9+Fcz5eQi7j9hDLnNJ746BdMHA6qhb0xLVm9Kjyu
 wo1LMGbz2j7HjJIhv4CLHwkTXeHtKAXa/Q==
X-Google-Smtp-Source: AK7set83fIcEJbwtI06vl+DTT+iMWFz/k3yCxsGg3A5DkXZupbqm2rbkvwMa6uiwveWMK+RXcDTv6w==
X-Received: by 2002:a05:622a:4c:b0:3dc:4d81:aa40 with SMTP id
 y12-20020a05622a004c00b003dc4d81aa40mr14308068qtw.30.1679299277131; 
 Mon, 20 Mar 2023 01:01:17 -0700 (PDT)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com.
 [209.85.128.173]) by smtp.gmail.com with ESMTPSA id
 p11-20020a05620a22ab00b0074583bda590sm6856983qkh.10.2023.03.20.01.01.14
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Mar 2023 01:01:16 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-5419d4c340aso209223687b3.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Mar 2023 01:01:14 -0700 (PDT)
X-Received: by 2002:a81:e508:0:b0:544:5fc7:f01f with SMTP id
 s8-20020a81e508000000b005445fc7f01fmr9057012ywl.4.1679299274592; Mon, 20 Mar
 2023 01:01:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230310144721.1544669-1-robh@kernel.org>
 <CAMuHMdUaeyHs9fQxS+16F62uHaifJYMXKJpL2-xi-SL5HCrTHQ@mail.gmail.com>
 <CAMuHMdX1=+WwWjfiWDYOjSzTjcYBEY+QR=XKuU+o5_SCyU7rag@mail.gmail.com>
 <CACRpkdaw7TodD0hr3vD8cGB80k0qtEiaC1ne-ivCj6YEefi44w@mail.gmail.com>
In-Reply-To: <CACRpkdaw7TodD0hr3vD8cGB80k0qtEiaC1ne-ivCj6YEefi44w@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 20 Mar 2023 09:01:02 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVgWne0goeJ3A1=v8FZCz3hmHC2j_UEYPn51gD1jz-9uA@mail.gmail.com>
Message-ID: <CAMuHMdVgWne0goeJ3A1=v8FZCz3hmHC2j_UEYPn51gD1jz-9uA@mail.gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Samuel Holland <samuel@sholland.org>, Tony Lindgren <tony@atomide.com>,
 Sean Wang <sean.wang@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-gpio@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 linux-mediatek@lists.infradead.org, Haojian Zhuang <haojian.zhuang@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-omap@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
 devicetree@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [Linux-stm32] [PATCH] pinctrl: Use of_property_present() for
 testing DT property presence
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

SGkgTGludXMsCgpPbiBTdW4sIE1hciAxOSwgMjAyMyBhdCA5OjU14oCvUE0gTGludXMgV2FsbGVp
aiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPiB3cm90ZToKPiBPbiBNb24sIE1hciAxMywgMjAy
MyBhdCAxMjowMOKAr1BNIEdlZXJ0IFV5dHRlcmhvZXZlbgo+IDxnZWVydEBsaW51eC1tNjhrLm9y
Zz4gd3JvdGU6Cj4gPiBPbiBNb24sIE1hciAxMywgMjAyMyBhdCAxMDowMOKAr0FNIEdlZXJ0IFV5
dHRlcmhvZXZlbgo+ID4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPiB3cm90ZToKPiA+ID4gT24gRnJp
LCBNYXIgMTAsIDIwMjMgYXQgMzo1NuKAr1BNIFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+
IHdyb3RlOgo+ID4gPiA+IEl0IGlzIHByZWZlcnJlZCB0byB1c2UgdHlwZWQgcHJvcGVydHkgYWNj
ZXNzIGZ1bmN0aW9ucyAoaS5lLgo+ID4gPiA+IG9mX3Byb3BlcnR5X3JlYWRfPHR5cGU+IGZ1bmN0
aW9ucykgcmF0aGVyIHRoYW4gbG93LWxldmVsCj4gPiA+ID4gb2ZfZ2V0X3Byb3BlcnR5L29mX2Zp
bmRfcHJvcGVydHkgZnVuY3Rpb25zIGZvciByZWFkaW5nIHByb3BlcnRpZXMuIEFzCj4gPiA+ID4g
cGFydCBvZiB0aGlzLCBjb252ZXJ0IG9mX2dldF9wcm9wZXJ0eS9vZl9maW5kX3Byb3BlcnR5IGNh
bGxzIHRvIHRoZQo+ID4gPiA+IHJlY2VudGx5IGFkZGVkIG9mX3Byb3BlcnR5X3ByZXNlbnQoKSBo
ZWxwZXIgd2hlbiB3ZSBqdXN0IHdhbnQgdG8gdGVzdAo+ID4gPiA+IGZvciBwcmVzZW5jZSBvZiBh
IHByb3BlcnR5IGFuZCBub3RoaW5nIG1vcmUuCj4gPiA+ID4KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5
OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgo+ID4gPgo+ID4gPiBUaGFua3MgZm9yIHlv
dXIgcGF0Y2ghCj4gPiA+Cj4gPiA+ID4gLS0tIGEvZHJpdmVycy9waW5jdHJsL3JlbmVzYXMvcGlu
Y3RybC5jCj4gPiA+ID4gKysrIGIvZHJpdmVycy9waW5jdHJsL3JlbmVzYXMvcGluY3RybC5jCj4g
PiA+ID4gQEAgLTEyNSw4ICsxMjUsOCBAQCBzdGF0aWMgaW50IHNoX3BmY19kdF9zdWJub2RlX3Rv
X21hcChzdHJ1Y3QgcGluY3RybF9kZXYgKnBjdGxkZXYsCj4gPiA+ID4gICAgICAgICAgKiBpbnNp
ZGUgYSBzdWJub2RlIG5vciBhY3Jvc3Mgc3Vibm9kZXMuCj4gPiA+ID4gICAgICAgICAgKi8KPiA+
ID4gPiAgICAgICAgIGlmICghcG14LT5mdW5jX3Byb3BfbmFtZSkgewo+ID4gPiA+IC0gICAgICAg
ICAgICAgICBpZiAob2ZfZmluZF9wcm9wZXJ0eShucCwgImdyb3VwcyIsIE5VTEwpIHx8Cj4gPiA+
ID4gLSAgICAgICAgICAgICAgICAgICBvZl9maW5kX3Byb3BlcnR5KG5wLCAicGlucyIsIE5VTEwp
KSB7Cj4gPiA+ID4gKyAgICAgICAgICAgICAgIGlmIChvZl9wcm9wZXJ0eV9wcmVzZW50KG5wLCAi
Z3JvdXBzIil8fAo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgb2ZfcHJvcGVydHlfcHJlc2Vu
dChucCwgInBpbnMiKSkgewo+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIHBteC0+ZnVu
Y19wcm9wX25hbWUgPSAiZnVuY3Rpb24iOwo+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAg
IHBteC0+Z3JvdXBzX3Byb3BfbmFtZSA9ICJncm91cHMiOwo+ID4gPiA+ICAgICAgICAgICAgICAg
ICAgICAgICAgIHBteC0+cGluc19wcm9wX25hbWUgPSAicGlucyI7Cj4gPiA+Cj4gPiA+IFJldmll
d2VkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPgo+ID4g
Pgo+ID4gPiBUaGlzIGNoZWNrIGlzIHVzZWQgdG8gYXV0by1kZXRlY3QgaWYgdGhlIHN0YW5kYXJk
IHByb3BlcnR5IG5hbWVzCj4gPiA+IHNob3VsZCBiZSB1c2VkLCBvciB0aGUgInJlbmVzYXMsIi1w
cmVmaXhlZCBvbmVzLgo+ID4gPiBBcyB0aGUgbGFzdCB1c2VycyBvZiB0aGUgbGF0dGVyIHdlcmUg
cmVtb3ZlZCBmcm9tIERUUyBpbiB2NC4xMCwKPiA+ID4gcGVyaGFwcyBJIHNob3VsZCBqdXN0IHJl
bW92ZSB0aGVzZSBjaGVja3MgaW5zdGVhZD8KPiA+Cj4gPiBTZW50IGEgcGF0Y2gganVzdCBkb2lu
ZyB0aGF0LCBzbyB5b3UgY2FuIGRyb3AgdGhpcyBjaHVuay4KPiA+IGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL2xpbnV4LXJlbmVzYXMtc29jL2ZmOWMxNDc4MTExMGJiZjE5YjU2YjQ1ZGQxZjAxZTZk
YTkwMzE5YWQuMTY3ODcwNDQ0MS5naXQuZ2VlcnQrcmVuZXNhc0BnbGlkZXIuYmUKPgo+IFNvIEkg
bmVlZCBhIG5ldyB2ZXJzaW9uIG9mIHRoaXMgcGF0Y2ggYmVmb3JlIEkgY2FuIGFwcGx5IGl0Cj4g
SSBndWVzcywgb3IgdGhlcmUgd2lsbCBiZSBjb25mbGljdCB3aXRoIFJlc2VhcyBzdHVmZj8KCkl0
IHdvdWxkIGJlIGEgbWlub3IgY29uZmxpY3QsIHRob3VnaCwgYW5kIHlvdSB3b3VsZCBoYXZlIHRv
IHJlc29sdmUKdGhhdCB5b3Vyc2VsZiwgd2hlbiBtZXJnaW5nIG15IHJlbmVzYXMtcGluY3RybCBQ
Ui4gIFNvIHdoZW4geW91CndpbGwgc2VuZCBhIFBSIHRvIFRoZSBPdGhlciBMaW51cywgdGhlcmUg
d29uJ3QgYmUgYSBjb25mbGljdCBhbnltb3JlLAphbmQgbm8gYW5ncmluZXNzIDstKQoKVGhhbmtz
IQoKR3J7b2V0amUsZWV0aW5nfXMsCgogICAgICAgICAgICAgICAgICAgICAgICBHZWVydAoKLS0g
CkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIg
LS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0
ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKd2hlbiBJJ20gdGFs
a2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcg
bGlrZSB0aGF0LgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZh
bGRzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXN0bTMyCg==
