Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E42228315C
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Oct 2020 10:04:55 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 813D4C32EA7;
	Mon,  5 Oct 2020 08:04:54 +0000 (UTC)
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
 [209.85.221.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C331DC32EA5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Oct 2020 08:04:52 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id n18so590704wrs.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 05 Oct 2020 01:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=IeiNTBeAySgxF765tOCATEDwXLrm3RiAjoTBQHN6wK0=;
 b=QT2sz2z2T2ObbOF9cBuqPj/xMs2V2JkpGaC1yQPewHnLjCK6KfpJxnFBd52Yg4AGmP
 VJxRGRPxaRQLhLWf/cJj+4TFWIvc5S6rpMyihLW8guAo+UvNRqZKoELqvBpOePuA/Etp
 z293SdQf8ZGebrwCEz1gY7IlvwFjzz13UZb9UEwJiawxT5K21aKdmv/U8ZWx8aU8cdsz
 g1EJ2lezQTBEJzLkUS6vaHwbRc5HEANA2MQBDDgPE/harsOdRDrcIYwSmq3urQxn7+oQ
 VI6XlJwzca0RWlRBNRLXanZ5iKvZaicHTe2BxzY/5qO5xvvbJ/G2d1fmd5VfFwE503zT
 3Stw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=IeiNTBeAySgxF765tOCATEDwXLrm3RiAjoTBQHN6wK0=;
 b=qr/wHNmbF1W0NRyASQt7Sb6lkp5nGtD3y9uIPIOS9ZNU+73hB1WXOVx+MU9A7bZ3d5
 ax3Stccu37O1SdIgRU4koYdNDN7rdqXXEohM0vzzl0tr1KTi8xXA2ZecaZsRMmfmJ7E4
 vqTSism5BMwT4/vRVM6AsxF2JbJTKa0eFwxVZd9DwwcE1Er0wnpK1JnQJ2z7rRYwJLrh
 iBBKo36p76juxx+eaUiLuomC4AkCxR/rZqu/3WPTjuKtaNS9Ri7B97fWMAIkmZ8QAISm
 BgwRo7htto1fNOMWu2CuYPQ0zgq85/qv7cD7rwwZYELJN58pIUhiiD5Vbx3438xxUO6J
 Zzew==
X-Gm-Message-State: AOAM531IwK112FbIgVfzsQDfi2tAHDNTiz40qPBJYRsa8d4zcpr6LjQs
 wnf7wHfnXdqw95A/qmuqhbi+Ng==
X-Google-Smtp-Source: ABdhPJxB5n46P+iT3QRjzewwc6VgfO5oWkwQMA51B+oAEZSgUCF8P3GFXLcjkKteouHQRqUkrIZvVQ==
X-Received: by 2002:adf:f10e:: with SMTP id r14mr9419051wro.337.1601885092289; 
 Mon, 05 Oct 2020 01:04:52 -0700 (PDT)
Received: from dell ([91.110.221.236])
 by smtp.gmail.com with ESMTPSA id x2sm11899009wrl.13.2020.10.05.01.04.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Oct 2020 01:04:51 -0700 (PDT)
Date: Mon, 5 Oct 2020 09:04:48 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Rob Herring <robh@kernel.org>
Message-ID: <20201005080448.GT6148@dell>
References: <20201002234143.3570746-1-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201002234143.3570746-1-robh@kernel.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-iio@vger.kernel.org,
 linux-pci@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 linux-remoteproc@vger.kernel.org, alsa-devel@alsa-project.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, linux-clk@vger.kernel.org,
 linux-leds@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-rockchip@lists.infradead.org,
 linux-serial@vger.kernel.org, linux-mips@vger.kernel.org,
 Guenter Roeck <linux@roeck-us.net>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-gpio@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 openipmi-developer@lists.sourceforge.net,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-hwmon@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-spi@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 netdev@vger.kernel.org, Baolin Wang <baolin.wang7@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: Another round of adding
 missing 'additionalProperties'
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

T24gRnJpLCAwMiBPY3QgMjAyMCwgUm9iIEhlcnJpbmcgd3JvdGU6Cgo+IEFub3RoZXIgcm91bmQg
b2Ygd2Fjay1hLW1vbGUuIFRoZSBqc29uLXNjaGVtYSBkZWZhdWx0IGlzIGFkZGl0aW9uYWwKPiB1
bmtub3duIHByb3BlcnRpZXMgYXJlIGFsbG93ZWQsIGJ1dCBmb3IgRFQgYWxsIHByb3BlcnRpZXMg
c2hvdWxkIGJlCj4gZGVmaW5lZC4KPiAKPiBDYzogVGhpZXJyeSBSZWRpbmcgPHRoaWVycnkucmVk
aW5nQGdtYWlsLmNvbT4KPiBDYzogTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8u
b3JnPgo+IENjOiBTdGVwaGVuIEJveWQgPHNib3lkQGtlcm5lbC5vcmc+Cj4gQ2M6IFNoYXduIEd1
byA8c2hhd25ndW9Aa2VybmVsLm9yZz4KPiBDYzogQmpvcm4gQW5kZXJzc29uIDxiam9ybi5hbmRl
cnNzb25AbGluYXJvLm9yZz4KPiBDYzogQmFvbGluIFdhbmcgPGJhb2xpbi53YW5nN0BnbWFpbC5j
b20+Cj4gQ2M6IEd1ZW50ZXIgUm9lY2sgPGxpbnV4QHJvZWNrLXVzLm5ldD4KPiBDYzogSm9uYXRo
YW4gQ2FtZXJvbiA8amljMjNAa2VybmVsLm9yZz4KPiBDYzogTWF1cm8gQ2FydmFsaG8gQ2hlaGFi
IDxtY2hlaGFiQGtlcm5lbC5vcmc+Cj4gQ2M6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGlu
Y2hhcnQrcmVuZXNhc0BpZGVhc29uYm9hcmQuY29tPgo+IENjOiBMZWUgSm9uZXMgPGxlZS5qb25l
c0BsaW5hcm8ub3JnPgo+IENjOiBVbGYgSGFuc3NvbiA8dWxmLmhhbnNzb25AbGluYXJvLm9yZz4K
PiBDYzogIkRhdmlkIFMuIE1pbGxlciIgPGRhdmVtQGRhdmVtbG9mdC5uZXQ+Cj4gQ2M6IEJqb3Ju
IEhlbGdhYXMgPGJoZWxnYWFzQGdvb2dsZS5jb20+Cj4gQ2M6IFZpbm9kIEtvdWwgPHZrb3VsQGtl
cm5lbC5vcmc+Cj4gQ2M6IExpYW0gR2lyZHdvb2QgPGxnaXJkd29vZEBnbWFpbC5jb20+Cj4gQ2M6
IE1hcmsgQnJvd24gPGJyb29uaWVAa2VybmVsLm9yZz4KPiBDYzogR3JlZyBLcm9haC1IYXJ0bWFu
IDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4KPiBDYzogRGFuaWVsIExlemNhbm8gPGRhbmll
bC5sZXpjYW5vQGxpbmFyby5vcmc+Cj4gQ2M6IGxpbnV4LWNsa0B2Z2VyLmtlcm5lbC5vcmcKPiBD
YzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IENjOiBsaW51eC1zcGlAdmdlci5r
ZXJuZWwub3JnCj4gQ2M6IGxpbnV4LWdwaW9Admdlci5rZXJuZWwub3JnCj4gQ2M6IGxpbnV4LWh3
bW9uQHZnZXIua2VybmVsLm9yZwo+IENjOiBsaW51eC1paW9Admdlci5rZXJuZWwub3JnCj4gQ2M6
IG9wZW5pcG1pLWRldmVsb3BlckBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKPiBDYzogbGludXgtbGVk
c0B2Z2VyLmtlcm5lbC5vcmcKPiBDYzogbGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnCj4gQ2M6
IGxpbnV4LXJvY2tjaGlwQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBDYzogbGludXgtc3RtMzJAc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQo+IENjOiBsaW51eC1taXBzQHZnZXIua2VybmVsLm9y
Zwo+IENjOiBsaW51eC1tbWNAdmdlci5rZXJuZWwub3JnCj4gQ2M6IG5ldGRldkB2Z2VyLmtlcm5l
bC5vcmcKPiBDYzogbGludXgtcGNpQHZnZXIua2VybmVsLm9yZwo+IENjOiBsaW51eC1wbUB2Z2Vy
Lmtlcm5lbC5vcmcKPiBDYzogbGludXgtcmVtb3RlcHJvY0B2Z2VyLmtlcm5lbC5vcmcKPiBDYzog
bGludXgtc2VyaWFsQHZnZXIua2VybmVsLm9yZwo+IENjOiBhbHNhLWRldmVsQGFsc2EtcHJvamVj
dC5vcmcKPiBDYzogbGludXgtdXNiQHZnZXIua2VybmVsLm9yZwo+IFNpZ25lZC1vZmYtYnk6IFJv
YiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Cj4gLS0tCj4gCj4gSSdsbCB0YWtlIHRoaXMgdGhy
dSB0aGUgRFQgdHJlZS4KClsuLi5dCgo+ICAuLi4vYmluZGluZ3MvbWZkL2dhdGV3b3Jrcy1nc2Mu
eWFtbCAgICAgICAgICAgfCAgMiArKwo+ICAuLi4vYmluZGluZ3MvbWZkL3h5bG9uLGxvZ2ljdmMu
eWFtbCAgICAgICAgICAgfCAxNCArKysrKysrKysrKy0tCgpBY2tlZC1ieTogTGVlIEpvbmVzIDxs
ZWUuam9uZXNAbGluYXJvLm9yZz4KCi0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KU2VuaW9yIFRl
Y2huaWNhbCBMZWFkIC0gRGV2ZWxvcGVyIFNlcnZpY2VzCkxpbmFyby5vcmcg4pSCIE9wZW4gc291
cmNlIHNvZnR3YXJlIGZvciBBcm0gU29DcwpGb2xsb3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0
ZXIgfCBCbG9nCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXN0bTMyCg==
