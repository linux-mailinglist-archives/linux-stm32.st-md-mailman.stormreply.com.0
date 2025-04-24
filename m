Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 73224A9B6D5
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Apr 2025 20:55:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1E1C5C78F70;
	Thu, 24 Apr 2025 18:55:47 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CB332C78F68
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Apr 2025 18:55:45 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-3105ef2a08dso13592611fa.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Apr 2025 11:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745520945; x=1746125745;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pvz3PmaQFn+0EBBAKUfs2w07bVJpHkRF9qQc8oVPxCg=;
 b=ycWzb1uNXhR1S0LZSGY25SsdG7rOy2erzNPvCNeHn8uMreusLfxIOo3LCBP3/oF8mA
 9k/oU/Q1kyitfm8hwwyjuxM1akKtG4cx01vbyQ1q6fl6jlZQcH/nLrL0RHbwqblD9lfI
 yPXhImm61V18vi+13y0egXJTZjIGxAdtmvl3K+SGV+OH+m7vww2oJj4z6MU+d9yBFVc4
 8d7ZgP//ALxy6z2G5YAtYo9zvEmK2ubGEq9nLJOzcdBaWv+eJrbIXFrNbTpfYsyCmWMp
 9BR/5nAXEcKvOKETqgsAc5w/ERxDsD3+j3jZhg949izG+Jz5NXEwLciPoUoqapCfJ//9
 CNDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745520945; x=1746125745;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pvz3PmaQFn+0EBBAKUfs2w07bVJpHkRF9qQc8oVPxCg=;
 b=KZl5NJjdWN8Fc9k6t56reVMx+AEXbcUJOPzTkoWYyqVuVM4UuVduK2jrXz4xaOY4a0
 3EVB9Ol22SyDpH60BoqV6wOKN3vAwegeTaSO8W/WdkWmqKc0tjXhUHxqq/wvq7UJpqB9
 O5wLMUKc1Up1Iv/Mi/Yvp2mMU7Fn/ryuTg/OIwO2kdVI2MzwWTOR5ZOtMaAHUOyASSts
 t2NwE9+1FdNLrkNcpyBxQEQKVlLf4lV5XhFFJRlIH+N/yqGSZCViJ99zsvAfC0WYZtFT
 gexWQ5HJJewDMc9CI1fYw4zhz1gvXXOGnCR7uXzH3eF/ilgOKfYboPNdLKOiTPN55leU
 iihQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMaxoN1zJpfLHfXVUvprMUU2KrzvU/GjyhDWo5mnEeudf99G9NiBGAbco4Z1LQQJL4RHkv+ag/cdocxQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxK4X5E+qJp901RRC5MiAaKApas15qeiQPlvx7wWDCX/ozWWYCD
 lTq70CLWR1e5JWIFjeWbp3MEi1D2Dr2TqCFbfL7J4sE7nPfD0+jPOEL+OTFb7uTkE4Nc2Vz4Sck
 GSiKqBIR82dZfin1l6WJpt7TpXXPEC0x20ifZ3g==
X-Gm-Gg: ASbGncuitI/fwDt0DVSd078rOEtbVWaM0lGGar40e0Dv4xs4utCq5qdayA1lQW7LJ3t
 kiwamxvPhddWazdEK2JUted+H55YAkgolPFfM/g5GvxDSQkU+tOiLliYNlLbBprzwbQpy8RLd0n
 JcGvWP5j2aAlKe6TnqMnY0ARedCuBjEMtXjotcytwLyKe7E2Zqyw0XUA==
X-Google-Smtp-Source: AGHT+IE0c8VGEk3/LwHw0m2axs8IZ9HjpeBp8o188g75mkoErRBNX5c5KptrxgTjbE1qe+vTvqn/BpVZsaupGVwBUJc=
X-Received: by 2002:a05:651c:210f:b0:30b:bfca:bbf2 with SMTP id
 38308e7fff4ca-318a7b0b7f5mr2808701fa.7.1745520944675; Thu, 24 Apr 2025
 11:55:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250424-gpiochip-set-rv-pinctrl-part2-v1-0-504f91120b99@linaro.org>
 <20250424-gpiochip-set-rv-pinctrl-part2-v1-2-504f91120b99@linaro.org>
 <CAGb2v67jH2G_i51fg3T7qu2dDtj7FqUO7q9pBJJw_uKhdGV6uQ@mail.gmail.com>
In-Reply-To: <CAGb2v67jH2G_i51fg3T7qu2dDtj7FqUO7q9pBJJw_uKhdGV6uQ@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 24 Apr 2025 20:55:33 +0200
X-Gm-Features: ATxdqUGQRJTk1Y9jikLuWRcOSvqi5BIyaHo-9YdHMReWW67MF95w4__wq5ceBqw
Message-ID: <CAMRc=McmRB8iNPrTztoSLbEXX2WxNp5d3t5--AAqzqU2LQ+FGw@mail.gmail.com>
To: wens@csie.org
Cc: Andrew Lunn <andrew@lunn.ch>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Paul Cercueil <paul@crapouillou.net>, Alim Akhtar <alim.akhtar@samsung.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-samsung-soc@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
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

T24gVGh1LCBBcHIgMjQsIDIwMjUgYXQgNzo0M+KAr1BNIENoZW4tWXUgVHNhaSA8d2Vuc0Bjc2ll
Lm9yZz4gd3JvdGU6Cj4KPiBPbiBUaHUsIEFwciAyNCwgMjAyNSBhdCA0OjM14oCvUE0gQmFydG9z
eiBHb2xhc3pld3NraSA8YnJnbEBiZ2Rldi5wbD4gd3JvdGU6Cj4gPgo+ID4gRnJvbTogQmFydG9z
eiBHb2xhc3pld3NraSA8YmFydG9zei5nb2xhc3pld3NraUBsaW5hcm8ub3JnPgo+ID4KPiA+IHN0
cnVjdCBncGlvX2NoaXAgbm93IGhhcyBjYWxsYmFja3MgZm9yIHNldHRpbmcgbGluZSB2YWx1ZXMg
dGhhdCByZXR1cm4KPiA+IGFuIGludGVnZXIsIGFsbG93aW5nIHRvIGluZGljYXRlIGZhaWx1cmVz
LiBDb252ZXJ0IHRoZSBkcml2ZXIgdG8gdXNpbmcKPiA+IHRoZW0uCj4gPgo+ID4gU2lnbmVkLW9m
Zi1ieTogQmFydG9zeiBHb2xhc3pld3NraSA8YmFydG9zei5nb2xhc3pld3NraUBsaW5hcm8ub3Jn
Pgo+Pgo+ID4gICAgICAgICAvKiBBWFAyMDkgaGFzIEdQSU8zIHN0YXR1cyBzaGFyaW5nIHRoZSBz
ZXR0aW5ncyByZWdpc3RlciAqLwo+ID4gICAgICAgICBpZiAob2Zmc2V0ID09IDMpIHsKPiA+IC0g
ICAgICAgICAgICAgICByZWdtYXBfdXBkYXRlX2JpdHMocGN0bC0+cmVnbWFwLCBBWFAyMFhfR1BJ
TzNfQ1RSTCwKPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQVhQMjBYX0dQ
SU8zX0ZVTkNUSU9OUywKPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdmFs
dWUgPyBBWFAyMFhfR1BJTzNfRlVOQ1RJT05fT1VUX0hJR0ggOgo+ID4gLSAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBBWFAyMFhfR1BJTzNfRlVOQ1RJT05fT1VUX0xPVyk7Cj4gPiAt
ICAgICAgICAgICAgICAgcmV0dXJuOwo+ID4gKyAgICAgICAgICAgICAgIHJldHVybiByZWdtYXBf
dXBkYXRlX2JpdHMocGN0bC0+cmVnbWFwLCBBWFAyMFhfR1BJTzNfQ1RSTCwKPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEFYUDIwWF9HUElPM19GVU5DVElPTlMs
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB2YWx1ZSA/Cj4g
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBBWFAyMFhf
R1BJTzNfRlVOQ1RJT05fT1VUX0hJR0ggOgo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgQVhQMjBYX0dQSU8zX0ZVTkNUSU9OX09VVF9MT1cpOwo+ID4g
ICAgICAgICB9Cj4KPiBJIGd1ZXNzIHlvdSBjb3VsZCBhbHNvIGRyb3AgdGhlIGN1cmx5IGJyYWNl
cywgYnV0IG90aGVyd2lzZQo+Cj4gUmV2aWV3ZWQtYnk6IENoZW4tWXUgVHNhaSA8d2Vuc0Bjc2ll
Lm9yZz4KPgoKUmlnaHQuIExpbnVzOiBjYW4geW91IHJlbW92ZSB0aGVtIHdoaWxlIGFwcGx5aW5n
PwoKQmFydApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0
aW5mby9saW51eC1zdG0zMgo=
