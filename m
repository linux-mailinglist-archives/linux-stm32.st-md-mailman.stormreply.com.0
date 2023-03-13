Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B1B6B7500
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Mar 2023 12:00:18 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 61C10C6904C;
	Mon, 13 Mar 2023 11:00:18 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A0839C65E60
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Mar 2023 11:00:17 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id h19so12604581qtk.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Mar 2023 04:00:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678705216;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+JRXZxwFQvV/9ugP2yIyDpmVR7lwS7JaHigMB2zQJQQ=;
 b=1mANNpAhzRNcdqeC54wbdkokOtvvOCEZBjxwxIdV0hUDkRzdNRE4gAEvdIXb3Ekd8u
 q+zop1ng8BjeCLiZqU4FJ+KtTvAZPHFb38EmCzbJ8A8QXp7OQLlHRdZZAZ0uE/7DoZvl
 j0Qo5YwASmpIwVBOebBpsf76xkEKF6E2fppf/m/FoRXVUZosQl/3fSJNM2h4qQyPodvM
 EI4LCilcBI0WBa+Hwa/ZV0UJMoMV2cgrvxvXcckUXzIEYeXBqW1+NH+vctj3HYjhGrsL
 N5pJM73uQp1fKQReu8s9u/BVstqQKQL5ixY/qQ1AkzosG7mlPpu1CRTelST51kqfFRwT
 iKhA==
X-Gm-Message-State: AO0yUKUDWJsuL6FWx6/ph4/12Kh/8C45jKWZFBQAryB/XSmlSTT2XVIc
 HeuRCZmLBp+CMTga3hP9BhA70OrJ1cuw3Q==
X-Google-Smtp-Source: AK7set+2xsfdwrutB+lKATF/lYcCu0KIbNtgkxYoHPOVLkwMH++0CE0ljHJh0EIAFcyh60P8H7YChQ==
X-Received: by 2002:a05:622a:291:b0:3b9:a641:aa66 with SMTP id
 z17-20020a05622a029100b003b9a641aa66mr58783415qtw.15.1678705216073; 
 Mon, 13 Mar 2023 04:00:16 -0700 (PDT)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com.
 [209.85.128.172]) by smtp.gmail.com with ESMTPSA id
 u9-20020ac83d49000000b003bfbf16ad08sm5330419qtf.74.2023.03.13.04.00.14
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Mar 2023 04:00:14 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-5416949b35aso108319037b3.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Mar 2023 04:00:14 -0700 (PDT)
X-Received: by 2002:a0d:ec14:0:b0:544:4008:baa1 with SMTP id
 q20-20020a0dec14000000b005444008baa1mr452333ywn.4.1678705213702; Mon, 13 Mar
 2023 04:00:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230310144721.1544669-1-robh@kernel.org>
 <CAMuHMdUaeyHs9fQxS+16F62uHaifJYMXKJpL2-xi-SL5HCrTHQ@mail.gmail.com>
In-Reply-To: <CAMuHMdUaeyHs9fQxS+16F62uHaifJYMXKJpL2-xi-SL5HCrTHQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 13 Mar 2023 12:00:00 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX1=+WwWjfiWDYOjSzTjcYBEY+QR=XKuU+o5_SCyU7rag@mail.gmail.com>
Message-ID: <CAMuHMdX1=+WwWjfiWDYOjSzTjcYBEY+QR=XKuU+o5_SCyU7rag@mail.gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 Samuel Holland <samuel@sholland.org>, Tony Lindgren <tony@atomide.com>,
 Linus Walleij <linus.walleij@linaro.org>, Sean Wang <sean.wang@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
 Chen-Yu Tsai <wens@csie.org>, linux-mediatek@lists.infradead.org,
 Haojian Zhuang <haojian.zhuang@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-omap@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,
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

T24gTW9uLCBNYXIgMTMsIDIwMjMgYXQgMTA6MDDigK9BTSBHZWVydCBVeXR0ZXJob2V2ZW4KPGdl
ZXJ0QGxpbnV4LW02OGsub3JnPiB3cm90ZToKPiBPbiBGcmksIE1hciAxMCwgMjAyMyBhdCAzOjU2
4oCvUE0gUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiBJdCBpcyBwcmVm
ZXJyZWQgdG8gdXNlIHR5cGVkIHByb3BlcnR5IGFjY2VzcyBmdW5jdGlvbnMgKGkuZS4KPiA+IG9m
X3Byb3BlcnR5X3JlYWRfPHR5cGU+IGZ1bmN0aW9ucykgcmF0aGVyIHRoYW4gbG93LWxldmVsCj4g
PiBvZl9nZXRfcHJvcGVydHkvb2ZfZmluZF9wcm9wZXJ0eSBmdW5jdGlvbnMgZm9yIHJlYWRpbmcg
cHJvcGVydGllcy4gQXMKPiA+IHBhcnQgb2YgdGhpcywgY29udmVydCBvZl9nZXRfcHJvcGVydHkv
b2ZfZmluZF9wcm9wZXJ0eSBjYWxscyB0byB0aGUKPiA+IHJlY2VudGx5IGFkZGVkIG9mX3Byb3Bl
cnR5X3ByZXNlbnQoKSBoZWxwZXIgd2hlbiB3ZSBqdXN0IHdhbnQgdG8gdGVzdAo+ID4gZm9yIHBy
ZXNlbmNlIG9mIGEgcHJvcGVydHkgYW5kIG5vdGhpbmcgbW9yZS4KPiA+Cj4gPiBTaWduZWQtb2Zm
LWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgo+Cj4gVGhhbmtzIGZvciB5b3VyIHBh
dGNoIQo+Cj4gPiAtLS0gYS9kcml2ZXJzL3BpbmN0cmwvcmVuZXNhcy9waW5jdHJsLmMKPiA+ICsr
KyBiL2RyaXZlcnMvcGluY3RybC9yZW5lc2FzL3BpbmN0cmwuYwo+ID4gQEAgLTEyNSw4ICsxMjUs
OCBAQCBzdGF0aWMgaW50IHNoX3BmY19kdF9zdWJub2RlX3RvX21hcChzdHJ1Y3QgcGluY3RybF9k
ZXYgKnBjdGxkZXYsCj4gPiAgICAgICAgICAqIGluc2lkZSBhIHN1Ym5vZGUgbm9yIGFjcm9zcyBz
dWJub2Rlcy4KPiA+ICAgICAgICAgICovCj4gPiAgICAgICAgIGlmICghcG14LT5mdW5jX3Byb3Bf
bmFtZSkgewo+ID4gLSAgICAgICAgICAgICAgIGlmIChvZl9maW5kX3Byb3BlcnR5KG5wLCAiZ3Jv
dXBzIiwgTlVMTCkgfHwKPiA+IC0gICAgICAgICAgICAgICAgICAgb2ZfZmluZF9wcm9wZXJ0eShu
cCwgInBpbnMiLCBOVUxMKSkgewo+ID4gKyAgICAgICAgICAgICAgIGlmIChvZl9wcm9wZXJ0eV9w
cmVzZW50KG5wLCAiZ3JvdXBzIil8fAo+ID4gKyAgICAgICAgICAgICAgICAgICBvZl9wcm9wZXJ0
eV9wcmVzZW50KG5wLCAicGlucyIpKSB7Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICBwbXgt
PmZ1bmNfcHJvcF9uYW1lID0gImZ1bmN0aW9uIjsKPiA+ICAgICAgICAgICAgICAgICAgICAgICAg
IHBteC0+Z3JvdXBzX3Byb3BfbmFtZSA9ICJncm91cHMiOwo+ID4gICAgICAgICAgICAgICAgICAg
ICAgICAgcG14LT5waW5zX3Byb3BfbmFtZSA9ICJwaW5zIjsKPgo+IFJldmlld2VkLWJ5OiBHZWVy
dCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPgo+Cj4gVGhpcyBjaGVjayBp
cyB1c2VkIHRvIGF1dG8tZGV0ZWN0IGlmIHRoZSBzdGFuZGFyZCBwcm9wZXJ0eSBuYW1lcwo+IHNo
b3VsZCBiZSB1c2VkLCBvciB0aGUgInJlbmVzYXMsIi1wcmVmaXhlZCBvbmVzLgo+IEFzIHRoZSBs
YXN0IHVzZXJzIG9mIHRoZSBsYXR0ZXIgd2VyZSByZW1vdmVkIGZyb20gRFRTIGluIHY0LjEwLAo+
IHBlcmhhcHMgSSBzaG91bGQganVzdCByZW1vdmUgdGhlc2UgY2hlY2tzIGluc3RlYWQ/CgpTZW50
IGEgcGF0Y2gganVzdCBkb2luZyB0aGF0LCBzbyB5b3UgY2FuIGRyb3AgdGhpcyBjaHVuay4KaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmVuZXNhcy1zb2MvZmY5YzE0NzgxMTEwYmJmMTli
NTZiNDVkZDFmMDFlNmRhOTAzMTlhZC4xNjc4NzA0NDQxLmdpdC5nZWVydCtyZW5lc2FzQGdsaWRl
ci5iZQoKR3J7b2V0amUsZWV0aW5nfXMsCgogICAgICAgICAgICAgICAgICAgICAgICBHZWVydAoK
LS0gCkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlh
MzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0
aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKd2hlbiBJJ20g
dGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhp
bmcgbGlrZSB0aGF0LgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRv
cnZhbGRzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXN0bTMyCg==
