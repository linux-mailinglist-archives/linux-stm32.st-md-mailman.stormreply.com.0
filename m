Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3F596D73C
	for <lists+linux-stm32@lfdr.de>; Thu,  5 Sep 2024 13:34:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AB55EC78013;
	Thu,  5 Sep 2024 11:34:18 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 54C7CC6C83A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Sep 2024 11:34:11 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-533521cd1c3so811525e87.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 05 Sep 2024 04:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725536050; x=1726140850;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bLDmb4u45gfKegGAaWlNWOEqcWS6avYoGfdiMI2tkYc=;
 b=tsCKetg4cGzfBLZrpf//eSVrQXcssGgd3+f1L8kjFth23P7vKoY2Blz6G/IBmySCOn
 YrtJSLsuI6xefSX2meHm7eAhnJxxMJbwOCcAfEnO3ziqXeYHPR9BdUNsIJXIx0RGksB3
 Gek+yhVife6sRt5DEwgcdAfugDuuKB521Wbr2OnjIJxNqjUf1XVoON5zq/t8WqJfWpxP
 fAuqisF04RWBI6UkZ/4NmgeM08DBKFFzB0LvgSPXzlyB4wrhr3lOaPAS9DL0jZNV2GqA
 1GnhXgr9O04oD5KYZj7bdl4h+KQD5n2vS1c4sPC9pONosPRq9dCLe6Fur6gulUF5LqhI
 dkCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725536050; x=1726140850;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bLDmb4u45gfKegGAaWlNWOEqcWS6avYoGfdiMI2tkYc=;
 b=rrUt73KFG9EpngDoMXCYLgJ/vgssRpgbBYhBKINoeDzhzNNkEi6x9kXnNgMw/Ld31Y
 KDxVPyR+aqt8xkt8J+Gh3lYtV5wJq66JVgOGfQdx5XJhxLMxXsRFBylmkg/a5EESJEfI
 dtBNYkT4sU0zf5O9bFYGjAPgBu/+3sa+UHHRg49Wb/9twRbTRA/cuD48nVCLEzYTwV8k
 VfW2ee9TFr//lEMor2LOh9WZSxYVGPnIHGQTimVv+5+PIftGM8ZY+BFG1FcgZ4AM8ESP
 xsLp2TCZt57xKO1ZgD2tzEMYWbOT2z5dBGsMZCJzsqtqwyUTU7jUFMArbkQRjtaBKwJa
 qIrQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjW6BoVkOBgNX45C44nCco3K+9jVY2fEdZ7J/X6CJmuCC63l1Gfma5FYsRkhkPIo48zxrn42egHjDm0g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwFZXZ0ZQoC80gQTdHuXW6By5K0Bl9va21hgvZJp2NspwuUrx+H
 NcezSGWBcVAcZWflqzOeIr793B3P1DedlqHgueQSRd+DGjpBAkNz7yXdJjEQZ1p7nyzRrdCQ1nB
 HeYYEMbglpM/qcrbgUiLjwuF7tE3hoom2mznBMA==
X-Google-Smtp-Source: AGHT+IGzsgH7C+tzPtSN8VBNWiDdDaXjEPSwwJUrmvuJsG+F6lPhfUKhjc6NKXyqkx2vA55fxHGPX68sblNZHKLWO6o=
X-Received: by 2002:a05:6512:3da4:b0:530:e0fd:4a97 with SMTP id
 2adb3069b0e04-53546a55137mr16340997e87.0.1725536049827; Thu, 05 Sep 2024
 04:34:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240902133148.2569486-1-andriy.shevchenko@linux.intel.com>
 <20240902133148.2569486-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20240902133148.2569486-2-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 5 Sep 2024 13:33:56 +0200
Message-ID: <CACRpkdbskty+v0V90MrP5nm=S-mqHQq1B5C07QciaYJr09-88g@mail.gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v1 1/5] gpio: stmpe: Fix IRQ related error
	messages
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

T24gTW9uLCBTZXAgMiwgMjAyNCBhdCAzOjMy4oCvUE0gQW5keSBTaGV2Y2hlbmtvCjxhbmRyaXku
c2hldmNoZW5rb0BsaW51eC5pbnRlbC5jb20+IHdyb3RlOgoKPiBGaXJzdCBvZiBhbGwsIHJlbW92
ZSBkdXBsaWNhdGUgbWVzc2FnZSB0aGF0IHBsYXRmb3JtX2dldF9pcnEoKQo+IGRvZXMgYWxyZWFk
eSBwcmludC4gU2Vjb25kLCBjb3JyZWN0IHRoZSBlcnJvciBtZXNzYWdlIHdoZW4gdW5hYmxlCj4g
dG8gcmVnaXN0ZXIgYSBoYW5kbGVyLCB3aGljaCBpcyBicm9rZW4gaW4gdHdvIHdheXM6Cj4gMSkg
dGhlIG1pc2xlYWRpbmcgJ2dldCcgdnMuICdyZWdpc3Rlcic7Cj4gMikgbWlzc2luZyAnXG4nIGF0
IHRoZSBlbmQuCj4KPiAoWWVzLCBmb3IgdGhlIGN1cmlvdXMgb25lcywgdGhlIGRldl8qKCkgY2Fz
ZXMgZG8gbm90IHJlcXVpcmUgJ1xuJwo+IGFuZCBpc3N1ZSBpdCBhdXRvbWF0aWNhbGx5LCBidXQg
aXQncyBiZXR0ZXIgdG8gaGF2ZSB0aGVtIGV4cGxpY2l0KQo+Cj4gRml4IGFsbCB0aGlzIGhlcmUu
Cj4KPiBGaXhlczogMTg4MmU3NjkzNjJiICgiZ3Bpbzogc3RtcGU6IFNpbXBsaWZ5IHdpdGggZGV2
X2Vycl9wcm9iZSgpIikKPiBTaWduZWQtb2ZmLWJ5OiBBbmR5IFNoZXZjaGVua28gPGFuZHJpeS5z
aGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbT4KClJldmlld2VkLWJ5OiBMaW51cyBXYWxsZWlqIDxs
aW51cy53YWxsZWlqQGxpbmFyby5vcmc+CgpZb3VycywKTGludXMgV2FsbGVpagpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5n
IGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
