Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 70270AA05DB
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Apr 2025 10:35:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 347F7C6DD9F;
	Tue, 29 Apr 2025 08:35:30 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 54862C57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Apr 2025 08:35:29 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-30bef9b04adso55660111fa.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Apr 2025 01:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1745915728; x=1746520528;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ydLDKnQ91OvT5IwY/23gzsrsTpAlhEMjzxMQZcD1sso=;
 b=k3t8TldZmZhW49acVGlTKt+g5DctJA4Y6hK9IuEtS4l18XpyreYJWiNIaeSzhwH/df
 QwNppWBjTmD7lpgx1dpxsAcYBVTLJ2VDaqzRQrLM3sIvEEk2lfcL9HKWGaDgYzOMVycg
 zZCbw6jPcjx84i0LmppVVqXRlt6+zmZ+HVOJ94/fJih0sV3pddc68YXoC/h1NSlKoY+j
 c8+UfKtwI7NafvAaWe2RB2/3iQrp5DG9V3peIZ2uPLqb9nTrcuhuu/I97P9vIkZg6o5g
 8hX1E/xfWyb6e8jHy5HAvxCh3baD+lBntKjaS0jH85iP8kDhkW/JR5M+Vqb3TJeku2gJ
 rL5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745915728; x=1746520528;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ydLDKnQ91OvT5IwY/23gzsrsTpAlhEMjzxMQZcD1sso=;
 b=gMzySl7mIYdzGZV9MRHBffn7Son3431V+fAGn4z87dTkA65+Z5J1o/8Xo8TJqtIAio
 4uD18Cw+Lp/SZ2ady2UBP79ctt6gv/q48zsacj50ELDeRVAyTISmBhMH5GLipCSRjn9Q
 ud7Bm57tNEuJx+9G7gC+ifqeBv9eNqmhVo+OXNUCFpY3jJ2wmNZI9e4UDtGmpfdr26I6
 3fDvjrhNKKqhZE9sWklz7oG7cEk+UFjKTXkrNk/z3vh+vSvgUEx+pe3kGY4C/lkRd606
 Fh6ZIHkYpsUuIZk2x3+UF/f0vk32CVePeDl6VH+nq8zv2CIm9u0Rd9bo2a9Q+xw9k+gj
 vx6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCU97PAB59rT1r8pf55vqilI2oh64OuAmuISe3WkW8fitEOP3lYz+bN4ws6H17GZsM58l6IaBTrwP1nqoQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwmJ5mFD98PjiIUoXNgwHIf8GyY6kx21HXyrDJJ7JPQxGQAJYJ7
 mSvR/VksgkTnwLdF6t/BBtm2k3jqsXy5sNdxplQtmfDVC/QbacGhTlwnL4tUNhfvR2dMi+7yHfO
 cp5cFzq6sOoaTWzypZSRnpk13MrPo0lc3OSB+CQ==
X-Gm-Gg: ASbGncuQaGqjnFV/Egx9dtm9fo5hk36FgGeGm9VUsj7O0EL1IAMkTAzWHg4yZggqgD0
 ocBwJbI4PR0vHvjeDj0VQskdFRYQM60jT6mT8NGr2P5mxXzlpDEbN2cYuTrZ2gaSqZHmLSlkYEf
 hg6g66jcoWFXS6yH2g/qNWnw==
X-Google-Smtp-Source: AGHT+IEsezp5muMVAY/lE/H7DEdH8WV2VmTWB3mmT7yKNRZ/0B58jZOoyjXMik/+mxI9FIbD9XZIJdk/S7T9DrPLhZQ=
X-Received: by 2002:a05:651c:30cb:b0:30b:b7c3:949a with SMTP id
 38308e7fff4ca-31d5b13bdb9mr4753431fa.18.1745915728423; Tue, 29 Apr 2025
 01:35:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250424-gpiochip-set-rv-pinctrl-part2-v1-0-504f91120b99@linaro.org>
 <20250424-gpiochip-set-rv-pinctrl-part2-v1-2-504f91120b99@linaro.org>
 <CAGb2v67jH2G_i51fg3T7qu2dDtj7FqUO7q9pBJJw_uKhdGV6uQ@mail.gmail.com>
 <CAMRc=McmRB8iNPrTztoSLbEXX2WxNp5d3t5--AAqzqU2LQ+FGw@mail.gmail.com>
In-Reply-To: <CAMRc=McmRB8iNPrTztoSLbEXX2WxNp5d3t5--AAqzqU2LQ+FGw@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 29 Apr 2025 10:35:17 +0200
X-Gm-Features: ATxdqUFfjlFyz-8zlCBHswKX86tkhKgqvxLDp3L8XiORh1-aFhf72vJ7elWy1Tk
Message-ID: <CACRpkdYRCx8_zLa_OtcFwjmL6_pCsU0hcUe0_PP3=EbukbM7Jg@mail.gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andrew Lunn <andrew@lunn.ch>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Paul Cercueil <paul@crapouillou.net>, Alim Akhtar <alim.akhtar@samsung.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-samsung-soc@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, wens@csie.org,
 linux-mips@vger.kernel.org,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Daniel Machon <daniel.machon@microchip.com>,
 Gregory Clement <gregory.clement@bootlin.com>, linux-kernel@vger.kernel.org,
 linux-actions@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, UNGLinuxDriver@microchip.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Subject: Re: [Linux-stm32] [PATCH 02/12] pinctrl: axp209: use new GPIO line
	value setter callbacks
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

T24gVGh1LCBBcHIgMjQsIDIwMjUgYXQgODo1NeKAr1BNIEJhcnRvc3ogR29sYXN6ZXdza2kgPGJy
Z2xAYmdkZXYucGw+IHdyb3RlOgo+IE9uIFRodSwgQXByIDI0LCAyMDI1IGF0IDc6NDPigK9QTSBD
aGVuLVl1IFRzYWkgPHdlbnNAY3NpZS5vcmc+IHdyb3RlOgoKPiA+IEkgZ3Vlc3MgeW91IGNvdWxk
IGFsc28gZHJvcCB0aGUgY3VybHkgYnJhY2VzLCBidXQgb3RoZXJ3aXNlCj4gPgo+ID4gUmV2aWV3
ZWQtYnk6IENoZW4tWXUgVHNhaSA8d2Vuc0Bjc2llLm9yZz4KPgo+IFJpZ2h0LiBMaW51czogY2Fu
IHlvdSByZW1vdmUgdGhlbSB3aGlsZSBhcHBseWluZz8KCkZpeGVkIGl0IQoKWW91cnMsCkxpbnVz
IFdhbGxlaWoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlz
dGluZm8vbGludXgtc3RtMzIK
