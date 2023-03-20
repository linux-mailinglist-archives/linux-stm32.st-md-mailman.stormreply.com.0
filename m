Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2874D6C1F60
	for <lists+linux-stm32@lfdr.de>; Mon, 20 Mar 2023 19:18:08 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E40DEC6A603;
	Mon, 20 Mar 2023 18:18:07 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 376D1C6A5EF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Mar 2023 18:18:06 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2C37A61781
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Mar 2023 18:18:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF7F7C433B3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Mar 2023 18:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679336284;
 bh=vWg765y10j4OS331b9rPl2+YrzmXue9TgKc5uUPg6SE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=d0EShuTb90IYTui1Yvb5dTQm0ZdBzbLHwIdXjNMjBe1t4/PYzPQmrgKqZ9bAcsDOT
 GKvGwIH+xdTtkmTMMyOdiGo67BhnrM2V4uBqV7oONOcdyRoGVLSzOWeKb2Y6Av8sgm
 2Pve+TPBIQMb5xiNwMGaxCLrKdA9f+b/WGE+aWoeTJY8rDFmBkgqiyj8aY0/xrNc+W
 7uTb9rrP+PCxabfTATj2ZosK1TWPRLrUv6rkGo+OwIfhgdb177MgnR8ndTccPIfYD1
 pbEg99edRbwyz7LbDlOYQojGgNYi2hc0LoXGMB755eho1B412HFdkGcXJj9s1brLCw
 h5MqK9ObmFgXg==
Received: by mail-ua1-f49.google.com with SMTP id n17so8551295uaj.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Mar 2023 11:18:04 -0700 (PDT)
X-Gm-Message-State: AO0yUKUTKA+k7o7AIYkgdAh+I3jnZcHGAZK/H8FDh3rDmxVYgPAqyOZ1
 Rp3IX+9D+o8VVpeCrnVvSv2Vfe1e3C/l4cqN1Q==
X-Google-Smtp-Source: AK7set9vhgJMbGJRf/P0PPWHB2mniWwp+5MfPmkCG1+Fia2Jvmr6Jhb32FMBmmkaSyyxxpPtHEVnEx5LGAkbE4I2Yng=
X-Received: by 2002:a1f:2982:0:b0:401:8898:ea44 with SMTP id
 p124-20020a1f2982000000b004018898ea44mr142394vkp.3.1679336283507; Mon, 20 Mar
 2023 11:18:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230310144721.1544669-1-robh@kernel.org>
 <CAMuHMdUaeyHs9fQxS+16F62uHaifJYMXKJpL2-xi-SL5HCrTHQ@mail.gmail.com>
 <CAMuHMdX1=+WwWjfiWDYOjSzTjcYBEY+QR=XKuU+o5_SCyU7rag@mail.gmail.com>
 <CACRpkdaw7TodD0hr3vD8cGB80k0qtEiaC1ne-ivCj6YEefi44w@mail.gmail.com>
In-Reply-To: <CACRpkdaw7TodD0hr3vD8cGB80k0qtEiaC1ne-ivCj6YEefi44w@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 20 Mar 2023 13:17:51 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+pzQvsvk8KiyVZPrebMvV6-PfxFXFXcPOf0C21+-yo9A@mail.gmail.com>
Message-ID: <CAL_Jsq+pzQvsvk8KiyVZPrebMvV6-PfxFXFXcPOf0C21+-yo9A@mail.gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 Samuel Holland <samuel@sholland.org>, Tony Lindgren <tony@atomide.com>,
 Sean Wang <sean.wang@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-gpio@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Haojian Zhuang <haojian.zhuang@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
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

T24gU3VuLCBNYXIgMTksIDIwMjMgYXQgMzo1NeKAr1BNIExpbnVzIFdhbGxlaWogPGxpbnVzLndh
bGxlaWpAbGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBPbiBNb24sIE1hciAxMywgMjAyMyBhdCAxMjow
MOKAr1BNIEdlZXJ0IFV5dHRlcmhvZXZlbgo+IDxnZWVydEBsaW51eC1tNjhrLm9yZz4gd3JvdGU6
Cj4gPiBPbiBNb24sIE1hciAxMywgMjAyMyBhdCAxMDowMOKAr0FNIEdlZXJ0IFV5dHRlcmhvZXZl
bgo+ID4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPiB3cm90ZToKPiA+ID4gT24gRnJpLCBNYXIgMTAs
IDIwMjMgYXQgMzo1NuKAr1BNIFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+IHdyb3RlOgo+
ID4gPiA+IEl0IGlzIHByZWZlcnJlZCB0byB1c2UgdHlwZWQgcHJvcGVydHkgYWNjZXNzIGZ1bmN0
aW9ucyAoaS5lLgo+ID4gPiA+IG9mX3Byb3BlcnR5X3JlYWRfPHR5cGU+IGZ1bmN0aW9ucykgcmF0
aGVyIHRoYW4gbG93LWxldmVsCj4gPiA+ID4gb2ZfZ2V0X3Byb3BlcnR5L29mX2ZpbmRfcHJvcGVy
dHkgZnVuY3Rpb25zIGZvciByZWFkaW5nIHByb3BlcnRpZXMuIEFzCj4gPiA+ID4gcGFydCBvZiB0
aGlzLCBjb252ZXJ0IG9mX2dldF9wcm9wZXJ0eS9vZl9maW5kX3Byb3BlcnR5IGNhbGxzIHRvIHRo
ZQo+ID4gPiA+IHJlY2VudGx5IGFkZGVkIG9mX3Byb3BlcnR5X3ByZXNlbnQoKSBoZWxwZXIgd2hl
biB3ZSBqdXN0IHdhbnQgdG8gdGVzdAo+ID4gPiA+IGZvciBwcmVzZW5jZSBvZiBhIHByb3BlcnR5
IGFuZCBub3RoaW5nIG1vcmUuCj4gPiA+ID4KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBSb2IgSGVy
cmluZyA8cm9iaEBrZXJuZWwub3JnPgo+ID4gPgo+ID4gPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2gh
Cj4gPiA+Cj4gPiA+ID4gLS0tIGEvZHJpdmVycy9waW5jdHJsL3JlbmVzYXMvcGluY3RybC5jCj4g
PiA+ID4gKysrIGIvZHJpdmVycy9waW5jdHJsL3JlbmVzYXMvcGluY3RybC5jCj4gPiA+ID4gQEAg
LTEyNSw4ICsxMjUsOCBAQCBzdGF0aWMgaW50IHNoX3BmY19kdF9zdWJub2RlX3RvX21hcChzdHJ1
Y3QgcGluY3RybF9kZXYgKnBjdGxkZXYsCj4gPiA+ID4gICAgICAgICAgKiBpbnNpZGUgYSBzdWJu
b2RlIG5vciBhY3Jvc3Mgc3Vibm9kZXMuCj4gPiA+ID4gICAgICAgICAgKi8KPiA+ID4gPiAgICAg
ICAgIGlmICghcG14LT5mdW5jX3Byb3BfbmFtZSkgewo+ID4gPiA+IC0gICAgICAgICAgICAgICBp
ZiAob2ZfZmluZF9wcm9wZXJ0eShucCwgImdyb3VwcyIsIE5VTEwpIHx8Cj4gPiA+ID4gLSAgICAg
ICAgICAgICAgICAgICBvZl9maW5kX3Byb3BlcnR5KG5wLCAicGlucyIsIE5VTEwpKSB7Cj4gPiA+
ID4gKyAgICAgICAgICAgICAgIGlmIChvZl9wcm9wZXJ0eV9wcmVzZW50KG5wLCAiZ3JvdXBzIil8
fAo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgb2ZfcHJvcGVydHlfcHJlc2VudChucCwgInBp
bnMiKSkgewo+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIHBteC0+ZnVuY19wcm9wX25h
bWUgPSAiZnVuY3Rpb24iOwo+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIHBteC0+Z3Jv
dXBzX3Byb3BfbmFtZSA9ICJncm91cHMiOwo+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAg
IHBteC0+cGluc19wcm9wX25hbWUgPSAicGlucyI7Cj4gPiA+Cj4gPiA+IFJldmlld2VkLWJ5OiBH
ZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPgo+ID4gPgo+ID4gPiBU
aGlzIGNoZWNrIGlzIHVzZWQgdG8gYXV0by1kZXRlY3QgaWYgdGhlIHN0YW5kYXJkIHByb3BlcnR5
IG5hbWVzCj4gPiA+IHNob3VsZCBiZSB1c2VkLCBvciB0aGUgInJlbmVzYXMsIi1wcmVmaXhlZCBv
bmVzLgo+ID4gPiBBcyB0aGUgbGFzdCB1c2VycyBvZiB0aGUgbGF0dGVyIHdlcmUgcmVtb3ZlZCBm
cm9tIERUUyBpbiB2NC4xMCwKPiA+ID4gcGVyaGFwcyBJIHNob3VsZCBqdXN0IHJlbW92ZSB0aGVz
ZSBjaGVja3MgaW5zdGVhZD8KPiA+Cj4gPiBTZW50IGEgcGF0Y2gganVzdCBkb2luZyB0aGF0LCBz
byB5b3UgY2FuIGRyb3AgdGhpcyBjaHVuay4KPiA+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xp
bnV4LXJlbmVzYXMtc29jL2ZmOWMxNDc4MTExMGJiZjE5YjU2YjQ1ZGQxZjAxZTZkYTkwMzE5YWQu
MTY3ODcwNDQ0MS5naXQuZ2VlcnQrcmVuZXNhc0BnbGlkZXIuYmUKPgo+IFNvIEkgbmVlZCBhIG5l
dyB2ZXJzaW9uIG9mIHRoaXMgcGF0Y2ggYmVmb3JlIEkgY2FuIGFwcGx5IGl0Cj4gSSBndWVzcywg
b3IgdGhlcmUgd2lsbCBiZSBjb25mbGljdCB3aXRoIFJlc2VhcyBzdHVmZj8KCkNhbiB5b3UganVz
dCBkcm9wIGRyaXZlcnMvcGluY3RybC9yZW5lc2FzL3BpbmN0cmwuYyBmcm9tIHRoaXMgcGF0Y2g/
CgpSb2IKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtc3RtMzIK
