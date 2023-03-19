Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C63196C0503
	for <lists+linux-stm32@lfdr.de>; Sun, 19 Mar 2023 21:55:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7719CC6A5E7;
	Sun, 19 Mar 2023 20:55:42 +0000 (UTC)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com
 [209.85.219.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 90916C57B6A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 19 Mar 2023 20:55:41 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id e71so10880619ybc.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 19 Mar 2023 13:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679259340;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ac/NF/X3Ce1vR1hDDyKBTJ707og2BXuZP/lMQW+OCrs=;
 b=H/USSk17Fu5IdWFmU2HYEVwZ92SC2T/aL/5nOvlVpJeD0L0do87jcAsTliaBEz0MCA
 mMqeZBU9urZirZ7zxW11auSX7+tkHYp0K9XThAE/wLNlnvSVJ8GdNjd8zqxEnyfC6R+S
 bF0GNyNi0+l9Pp7ASmve9a2w4hwTf3i3d+4y1vux+85gQW4f0GI7kaHZLVj6jXu3zltE
 7jVl7Q6CBsq+1I5qhe0Ga3XfgMounIvMwgwAAF156gYYGaIPQ8+xRHnk/kIV9uZT6MuK
 aofXXYTTc5isXyhzb02mMH9GFNLJv1AQNxp4DslX98DqL+NC2qt8ieSTjsvVDSUikCvp
 WBRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679259340;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ac/NF/X3Ce1vR1hDDyKBTJ707og2BXuZP/lMQW+OCrs=;
 b=tirTNELuoNpKK45iLOkKzeP/aH68RmyKekYUelW6OchDsZV/Fl2rbUxM+5eRtN3GbG
 NNWLu69F+A7PsBh+iTUP0zWeKLHTS8Zl1FSuxBhhld3gijbIlUqMVU7fV9Qw69vays2V
 zNGywlQt7lU5kPLVQ5KxoO6XywMzwvFJ7AiWPRVLjv194S1v97weX0uGIZ7LacuKQgGg
 qYXNUQuvKe6+s8wUG3VRxZblwhXjC64wS1dyO3dUAQdKlOBwDEWGwwwh88t24cEKpBPd
 hM4kz15dsWCddy3dWuIgbOgnngcjrITJGONayMyL+S13xln+wZWtaMer6+syC1dYGoZt
 n8bg==
X-Gm-Message-State: AO0yUKUL36BYtZHTwxmO5ob6Ey94jw8FKhCG8lycuvTxrRlmtNyTiYrl
 K85lMP8sMsREEOgZBLAOSjJt/0GJ75NumoYn/CGUaQ==
X-Google-Smtp-Source: AK7set96jMMXsU1lpAmC3W40A6khl6vhFPSlLdYAPpPspd35ltaJhYbiXGg5BwG99gy+Dk9b8AqTCwMdTjF2Un45KI0=
X-Received: by 2002:a05:6902:110e:b0:b26:47f3:6cb with SMTP id
 o14-20020a056902110e00b00b2647f306cbmr3222772ybu.4.1679259340445; Sun, 19 Mar
 2023 13:55:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230310144721.1544669-1-robh@kernel.org>
 <CAMuHMdUaeyHs9fQxS+16F62uHaifJYMXKJpL2-xi-SL5HCrTHQ@mail.gmail.com>
 <CAMuHMdX1=+WwWjfiWDYOjSzTjcYBEY+QR=XKuU+o5_SCyU7rag@mail.gmail.com>
In-Reply-To: <CAMuHMdX1=+WwWjfiWDYOjSzTjcYBEY+QR=XKuU+o5_SCyU7rag@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 19 Mar 2023 21:55:29 +0100
Message-ID: <CACRpkdaw7TodD0hr3vD8cGB80k0qtEiaC1ne-ivCj6YEefi44w@mail.gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
X-Topics: 
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

T24gTW9uLCBNYXIgMTMsIDIwMjMgYXQgMTI6MDDigK9QTSBHZWVydCBVeXR0ZXJob2V2ZW4KPGdl
ZXJ0QGxpbnV4LW02OGsub3JnPiB3cm90ZToKPiBPbiBNb24sIE1hciAxMywgMjAyMyBhdCAxMDow
MOKAr0FNIEdlZXJ0IFV5dHRlcmhvZXZlbgo+IDxnZWVydEBsaW51eC1tNjhrLm9yZz4gd3JvdGU6
Cj4gPiBPbiBGcmksIE1hciAxMCwgMjAyMyBhdCAzOjU24oCvUE0gUm9iIEhlcnJpbmcgPHJvYmhA
a2VybmVsLm9yZz4gd3JvdGU6Cj4gPiA+IEl0IGlzIHByZWZlcnJlZCB0byB1c2UgdHlwZWQgcHJv
cGVydHkgYWNjZXNzIGZ1bmN0aW9ucyAoaS5lLgo+ID4gPiBvZl9wcm9wZXJ0eV9yZWFkXzx0eXBl
PiBmdW5jdGlvbnMpIHJhdGhlciB0aGFuIGxvdy1sZXZlbAo+ID4gPiBvZl9nZXRfcHJvcGVydHkv
b2ZfZmluZF9wcm9wZXJ0eSBmdW5jdGlvbnMgZm9yIHJlYWRpbmcgcHJvcGVydGllcy4gQXMKPiA+
ID4gcGFydCBvZiB0aGlzLCBjb252ZXJ0IG9mX2dldF9wcm9wZXJ0eS9vZl9maW5kX3Byb3BlcnR5
IGNhbGxzIHRvIHRoZQo+ID4gPiByZWNlbnRseSBhZGRlZCBvZl9wcm9wZXJ0eV9wcmVzZW50KCkg
aGVscGVyIHdoZW4gd2UganVzdCB3YW50IHRvIHRlc3QKPiA+ID4gZm9yIHByZXNlbmNlIG9mIGEg
cHJvcGVydHkgYW5kIG5vdGhpbmcgbW9yZS4KPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogUm9i
IEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KPiA+Cj4gPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2gh
Cj4gPgo+ID4gPiAtLS0gYS9kcml2ZXJzL3BpbmN0cmwvcmVuZXNhcy9waW5jdHJsLmMKPiA+ID4g
KysrIGIvZHJpdmVycy9waW5jdHJsL3JlbmVzYXMvcGluY3RybC5jCj4gPiA+IEBAIC0xMjUsOCAr
MTI1LDggQEAgc3RhdGljIGludCBzaF9wZmNfZHRfc3Vibm9kZV90b19tYXAoc3RydWN0IHBpbmN0
cmxfZGV2ICpwY3RsZGV2LAo+ID4gPiAgICAgICAgICAqIGluc2lkZSBhIHN1Ym5vZGUgbm9yIGFj
cm9zcyBzdWJub2Rlcy4KPiA+ID4gICAgICAgICAgKi8KPiA+ID4gICAgICAgICBpZiAoIXBteC0+
ZnVuY19wcm9wX25hbWUpIHsKPiA+ID4gLSAgICAgICAgICAgICAgIGlmIChvZl9maW5kX3Byb3Bl
cnR5KG5wLCAiZ3JvdXBzIiwgTlVMTCkgfHwKPiA+ID4gLSAgICAgICAgICAgICAgICAgICBvZl9m
aW5kX3Byb3BlcnR5KG5wLCAicGlucyIsIE5VTEwpKSB7Cj4gPiA+ICsgICAgICAgICAgICAgICBp
ZiAob2ZfcHJvcGVydHlfcHJlc2VudChucCwgImdyb3VwcyIpfHwKPiA+ID4gKyAgICAgICAgICAg
ICAgICAgICBvZl9wcm9wZXJ0eV9wcmVzZW50KG5wLCAicGlucyIpKSB7Cj4gPiA+ICAgICAgICAg
ICAgICAgICAgICAgICAgIHBteC0+ZnVuY19wcm9wX25hbWUgPSAiZnVuY3Rpb24iOwo+ID4gPiAg
ICAgICAgICAgICAgICAgICAgICAgICBwbXgtPmdyb3Vwc19wcm9wX25hbWUgPSAiZ3JvdXBzIjsK
PiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgcG14LT5waW5zX3Byb3BfbmFtZSA9ICJwaW5z
IjsKPiA+Cj4gPiBSZXZpZXdlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2Fz
QGdsaWRlci5iZT4KPiA+Cj4gPiBUaGlzIGNoZWNrIGlzIHVzZWQgdG8gYXV0by1kZXRlY3QgaWYg
dGhlIHN0YW5kYXJkIHByb3BlcnR5IG5hbWVzCj4gPiBzaG91bGQgYmUgdXNlZCwgb3IgdGhlICJy
ZW5lc2FzLCItcHJlZml4ZWQgb25lcy4KPiA+IEFzIHRoZSBsYXN0IHVzZXJzIG9mIHRoZSBsYXR0
ZXIgd2VyZSByZW1vdmVkIGZyb20gRFRTIGluIHY0LjEwLAo+ID4gcGVyaGFwcyBJIHNob3VsZCBq
dXN0IHJlbW92ZSB0aGVzZSBjaGVja3MgaW5zdGVhZD8KPgo+IFNlbnQgYSBwYXRjaCBqdXN0IGRv
aW5nIHRoYXQsIHNvIHlvdSBjYW4gZHJvcCB0aGlzIGNodW5rLgo+IGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL2xpbnV4LXJlbmVzYXMtc29jL2ZmOWMxNDc4MTExMGJiZjE5YjU2YjQ1ZGQxZjAxZTZk
YTkwMzE5YWQuMTY3ODcwNDQ0MS5naXQuZ2VlcnQrcmVuZXNhc0BnbGlkZXIuYmUKClNvIEkgbmVl
ZCBhIG5ldyB2ZXJzaW9uIG9mIHRoaXMgcGF0Y2ggYmVmb3JlIEkgY2FuIGFwcGx5IGl0CkkgZ3Vl
c3MsIG9yIHRoZXJlIHdpbGwgYmUgY29uZmxpY3Qgd2l0aCBSZXNlYXMgc3R1ZmY/CgpZb3VycywK
TGludXMgV2FsbGVpagpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1h
bi9saXN0aW5mby9saW51eC1zdG0zMgo=
