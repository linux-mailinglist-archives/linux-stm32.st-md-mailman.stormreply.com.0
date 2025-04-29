Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 479F1AA05CF
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Apr 2025 10:31:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E8776C78F63;
	Tue, 29 Apr 2025 08:31:34 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 623F5C57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Apr 2025 08:31:34 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-549967c72bcso6329000e87.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Apr 2025 01:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1745915493; x=1746520293;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gF3fPF6CllcQs9x0YHwVW91aBk4339QyjWLq4v3kcvo=;
 b=jURBoH8TlU1pKalFAIssZE3bZQZ+sW/R9oxc+IRDSNhqRws4EPQbBrjhYQCKhDH1OE
 EsD1TXHChlYPytqTfqAosWdDCjKExxC1tnTzKhI8SLV5c0879J0V9tp4r1wC9zoUV3/h
 3s6oKHtRW+FlM66I+AaakVXTp9s/8J1FI102Z+HpJQC4wsZN6twnPCNCYIdwGt6NQAXI
 IdihdypYbeqSavH6toGYbUExB3wW0RYkyqjfXMedn42NLkr5bQ7B3GGr/FSCf2kXuJ2e
 JXJqXK42zb9VORuyecT8ei7Mxx2J50jYbyoO703KCDT0nUUc3hcvhJGkwFK5YvvCeX3G
 jOyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745915493; x=1746520293;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gF3fPF6CllcQs9x0YHwVW91aBk4339QyjWLq4v3kcvo=;
 b=M1M1k6X5bAkUC0FNWmNMR9UhF61CIgLyBr0VSI7ZA40Edduh2LMImHnURFtTjXom9j
 O8l+/e0hUkX9cdc8vFLED9uQh5fwAjS0sTspqwMfyJqKPeK3mR3VPLA5f2NPvmDmdKJY
 sCLgjItwxh3kRHkk5H7KRwJZZbHfBdHME3vfVp2SCplEILm/O35mv0Q2SNb09B01d9T2
 lcfmSDT9x9GsVzKM6Jj7d8MNQZBbcwDWvZv3/bWz41j+MBBqMfJznG6md4nyJYkwQwHs
 eJqbMWM7OUivfmVOTXmGffWavZSRoUe3cVZ6Btl/fKp9qzH/BOm/qV/0Bp6Mr0egiL97
 TwzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFdpiRNnGPAdt1NknbYEOfZA7vkk7+TvR6BHppeULS/N5GSOWnCsLYrO0PprknMgYBRmR4M+17HBNYng==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyrWMxDzxCN2dESNW4dnXWC8AYIgsvs5g1Fj3/wMSgK2V3naDBn
 E3cSlh6vld4Q9OWq2jq/i8btk4yeRNd50QMYyYvgFvXZ7w6HpiLaZvqAtKqcy+NinWgIUr+FQS4
 nmYO8QHKsyc2ea0ZYX/t+1xVHgHhU+uQjt1/J6w==
X-Gm-Gg: ASbGncvr132EYWemGn7TGfAkmGi7/lXQIJQ4kuWM9F/Cn/KRKH7h3IddUerVT/w8Fwe
 0D4xydMUgn/unMseR13b/XYZFqtpSfxCUF1xHLfpKzaO4c//0zCHnz8q+p+0ViTi5ScoeCQ4Qw4
 1+sBxl61v4dJaJ1V/vAAVm2Q==
X-Google-Smtp-Source: AGHT+IEQGZYoiDX6agThY6MEttiXW/phwPHOzvMp4EUn15NcMCCtvMBuCxgvpSJ2KIlE88xdOI9ul/LqAjmdMjo0Oj0=
X-Received: by 2002:a05:651c:b08:b0:30d:e104:b67c with SMTP id
 38308e7fff4ca-31d36ad1ac0mr6506481fa.39.1745915493462; Tue, 29 Apr 2025
 01:31:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250424-gpiochip-set-rv-pinctrl-part2-v1-0-504f91120b99@linaro.org>
In-Reply-To: <20250424-gpiochip-set-rv-pinctrl-part2-v1-0-504f91120b99@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 29 Apr 2025 10:31:22 +0200
X-Gm-Features: ATxdqUEwnjlawzkertE2U747LwGdYLhBGRSu2FbSCTDtMI-ddocvoVo9dn0tQa0
Message-ID: <CACRpkdYbf4zSrkzrGLn9+Sn0Wh5LvZxW3omCdMP4w1VdFf-iZg@mail.gmail.com>
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
 Krzysztof Kozlowski <krzk@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 linux-mips@vger.kernel.org,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Daniel Machon <daniel.machon@microchip.com>,
 Gregory Clement <gregory.clement@bootlin.com>, linux-kernel@vger.kernel.org,
 linux-actions@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, UNGLinuxDriver@microchip.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Subject: Re: [Linux-stm32] [PATCH 00/12] pinctrl: convert GPIO chips to
 using new value setters - part 2 for v6.16
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

T24gVGh1LCBBcHIgMjQsIDIwMjUgYXQgMTA6MzXigK9BTSBCYXJ0b3N6IEdvbGFzemV3c2tpIDxi
cmdsQGJnZGV2LnBsPiB3cm90ZToKCj4gc3RydWN0IGdwaW9fY2hpcCBub3cgaGFzIGNhbGxiYWNr
cyBmb3Igc2V0dGluZyBsaW5lIHZhbHVlcyB0aGF0IHJldHVybgo+IGFuIGludGVnZXIsIGFsbG93
aW5nIHRvIGluZGljYXRlIGZhaWx1cmVzLiBXZSdyZSBpbiB0aGUgcHJvY2VzcyBvZgo+IGNvbnZl
cnRpbmcgYWxsIEdQSU8gZHJpdmVycyB0byB1c2luZyB0aGUgbmV3IEFQSS4gVGhpcyBzZXJpZXMg
Y29udmVydHMKPiB0aGUgYW5vdGhlciByb3VuZCBvZiBwaW5jdHJsIEdQSU8gY29udHJvbGxlcnMu
Cj4KPiBTaWduZWQtb2ZmLWJ5OiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiYXJ0b3N6LmdvbGFzemV3
c2tpQGxpbmFyby5vcmc+CgpQYXRjaGVzIGFwcGxpZWQhCgpZb3VycywKTGludXMgV2FsbGVpagpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0z
MiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpo
dHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51
eC1zdG0zMgo=
