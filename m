Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A136B71E1
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Mar 2023 10:01:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 23F6DC6904C;
	Mon, 13 Mar 2023 09:01:05 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E52E1C65E60
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Mar 2023 09:01:02 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id c3so12367933qtc.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Mar 2023 02:01:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678698061;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JMjv67oqH0XcHnu1slnz7obBOYeNA0kXm4szuRMQips=;
 b=ViFoIIL4PYr/63ZlJRZbRSncOxEarX0IAb3R/BKL1bi4k4PfH5Zy5VfuQoHpu5Z/5s
 FVltOlskl5ZbbPzRe5UXIg2VrypN6jJxAeKTTzpGBL2fJ0zsYZaJBw7/TGxMQt9BNCcL
 jvhvDAkD+gnnW02gdlkcFzH4awUjpXJvspgJvchoPu2pVd5jOxqds4EORGDH5x4aJz6C
 8BO4lNBpiXGLNxcAFto/0WUH0acfa6Pc27fcjzbcUsMJHF5W+yCsZfeT0m02V0xlbg0W
 AFEzXIngk3xiA2FRynDcqD3pzlfpg06Z3FL2aBHphiJQXeNdej0uW62d93lqkOkRv6GE
 ulZg==
X-Gm-Message-State: AO0yUKU0qOwNsJVvzdEdFaSl9V+3iQAwC0Q2rtANxX4SK6DgZpXIstby
 2rNqzLDUzt5hEcmGZSpFfAHpGTZ9LwkSEg==
X-Google-Smtp-Source: AK7set9Ds82tSLEqtfcITDOQRQ8p47+cdFWqpX7lWMdWLjYjRQb6j1qLfV9TfbIIjTh8NtCzQo2ZHA==
X-Received: by 2002:ac8:5a4c:0:b0:3b8:6dc8:a9b5 with SMTP id
 o12-20020ac85a4c000000b003b86dc8a9b5mr17187283qta.34.1678698061495; 
 Mon, 13 Mar 2023 02:01:01 -0700 (PDT)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com.
 [209.85.219.170]) by smtp.gmail.com with ESMTPSA id
 n19-20020ac81e13000000b003bfd8e2ab40sm5150415qtl.16.2023.03.13.02.01.00
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Mar 2023 02:01:00 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id z83so6975348ybb.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Mar 2023 02:01:00 -0700 (PDT)
X-Received: by 2002:a25:8b08:0:b0:b14:91e:4d19 with SMTP id
 i8-20020a258b08000000b00b14091e4d19mr14474451ybl.7.1678698060305; Mon, 13 Mar
 2023 02:01:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230310144721.1544669-1-robh@kernel.org>
In-Reply-To: <20230310144721.1544669-1-robh@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 13 Mar 2023 10:00:48 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUaeyHs9fQxS+16F62uHaifJYMXKJpL2-xi-SL5HCrTHQ@mail.gmail.com>
Message-ID: <CAMuHMdUaeyHs9fQxS+16F62uHaifJYMXKJpL2-xi-SL5HCrTHQ@mail.gmail.com>
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

SGkgUm9iLAoKT24gRnJpLCBNYXIgMTAsIDIwMjMgYXQgMzo1NuKAr1BNIFJvYiBIZXJyaW5nIDxy
b2JoQGtlcm5lbC5vcmc+IHdyb3RlOgo+IEl0IGlzIHByZWZlcnJlZCB0byB1c2UgdHlwZWQgcHJv
cGVydHkgYWNjZXNzIGZ1bmN0aW9ucyAoaS5lLgo+IG9mX3Byb3BlcnR5X3JlYWRfPHR5cGU+IGZ1
bmN0aW9ucykgcmF0aGVyIHRoYW4gbG93LWxldmVsCj4gb2ZfZ2V0X3Byb3BlcnR5L29mX2ZpbmRf
cHJvcGVydHkgZnVuY3Rpb25zIGZvciByZWFkaW5nIHByb3BlcnRpZXMuIEFzCj4gcGFydCBvZiB0
aGlzLCBjb252ZXJ0IG9mX2dldF9wcm9wZXJ0eS9vZl9maW5kX3Byb3BlcnR5IGNhbGxzIHRvIHRo
ZQo+IHJlY2VudGx5IGFkZGVkIG9mX3Byb3BlcnR5X3ByZXNlbnQoKSBoZWxwZXIgd2hlbiB3ZSBq
dXN0IHdhbnQgdG8gdGVzdAo+IGZvciBwcmVzZW5jZSBvZiBhIHByb3BlcnR5IGFuZCBub3RoaW5n
IG1vcmUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgoK
VGhhbmtzIGZvciB5b3VyIHBhdGNoIQoKPiAtLS0gYS9kcml2ZXJzL3BpbmN0cmwvcmVuZXNhcy9w
aW5jdHJsLmMKPiArKysgYi9kcml2ZXJzL3BpbmN0cmwvcmVuZXNhcy9waW5jdHJsLmMKPiBAQCAt
MTI1LDggKzEyNSw4IEBAIHN0YXRpYyBpbnQgc2hfcGZjX2R0X3N1Ym5vZGVfdG9fbWFwKHN0cnVj
dCBwaW5jdHJsX2RldiAqcGN0bGRldiwKPiAgICAgICAgICAqIGluc2lkZSBhIHN1Ym5vZGUgbm9y
IGFjcm9zcyBzdWJub2Rlcy4KPiAgICAgICAgICAqLwo+ICAgICAgICAgaWYgKCFwbXgtPmZ1bmNf
cHJvcF9uYW1lKSB7Cj4gLSAgICAgICAgICAgICAgIGlmIChvZl9maW5kX3Byb3BlcnR5KG5wLCAi
Z3JvdXBzIiwgTlVMTCkgfHwKPiAtICAgICAgICAgICAgICAgICAgIG9mX2ZpbmRfcHJvcGVydHko
bnAsICJwaW5zIiwgTlVMTCkpIHsKPiArICAgICAgICAgICAgICAgaWYgKG9mX3Byb3BlcnR5X3By
ZXNlbnQobnAsICJncm91cHMiKXx8Cj4gKyAgICAgICAgICAgICAgICAgICBvZl9wcm9wZXJ0eV9w
cmVzZW50KG5wLCAicGlucyIpKSB7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgcG14LT5mdW5j
X3Byb3BfbmFtZSA9ICJmdW5jdGlvbiI7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgcG14LT5n
cm91cHNfcHJvcF9uYW1lID0gImdyb3VwcyI7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgcG14
LT5waW5zX3Byb3BfbmFtZSA9ICJwaW5zIjsKClJldmlld2VkLWJ5OiBHZWVydCBVeXR0ZXJob2V2
ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPgoKVGhpcyBjaGVjayBpcyB1c2VkIHRvIGF1dG8t
ZGV0ZWN0IGlmIHRoZSBzdGFuZGFyZCBwcm9wZXJ0eSBuYW1lcwpzaG91bGQgYmUgdXNlZCwgb3Ig
dGhlICJyZW5lc2FzLCItcHJlZml4ZWQgb25lcy4KQXMgdGhlIGxhc3QgdXNlcnMgb2YgdGhlIGxh
dHRlciB3ZXJlIHJlbW92ZWQgZnJvbSBEVFMgaW4gdjQuMTAsCnBlcmhhcHMgSSBzaG91bGQganVz
dCByZW1vdmUgdGhlc2UgY2hlY2tzIGluc3RlYWQ/CgpHcntvZXRqZSxlZXRpbmd9cywKCiAgICAg
ICAgICAgICAgICAgICAgICAgIEdlZXJ0CgotLSAKR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJl
J3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZwoKSW4g
cGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNl
bGYgYSBoYWNrZXIuIEJ1dAp3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBz
YXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuCiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0
bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
