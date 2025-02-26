Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 59AA8A46141
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Feb 2025 14:48:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0A2D9C7A833;
	Wed, 26 Feb 2025 13:48:40 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 001D1C78F8B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Feb 2025 10:29:04 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-30a303a656aso69385561fa.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Feb 2025 02:29:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1740565744; x=1741170544;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jd6d/YrQJp7u3Y35vAF2ccKmJq+B0QJtfHp4EK5whA8=;
 b=vxO5vOJOzeE6+Krpmw6m0XSa4oyO2zUf4RDXpVqyEOK7wD+o2NzQn5uufti9VYZfK+
 +b4odeH4jg5Y1ue3pcWqiggoGoi5uJE/YhL9AHhc96gTELK2NF6IN679AB4uk2CIS4D5
 E4H2yQ39p5j9rD9fiODsluiaFdt132SODOFQ37oX05jYAV66zr2IAbNhpxPm5BVnXkZs
 EEFfFz+YcoCBNPwJuNShcT8r7ic6b5kShe6FtC0rn0QcpawTNG9Tr9vmrawmSnsMVmG7
 gZujmOSyj+WbE5PPkaekOyj35m9r0gpdicHN7Ur+OfvDHnG7p3/fWGXkWC5MM7jhhtom
 Fa6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740565744; x=1741170544;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jd6d/YrQJp7u3Y35vAF2ccKmJq+B0QJtfHp4EK5whA8=;
 b=biMIXaRL3w6ryNfbILB8Ryk43+62l4Cg1aUaN51SgIdnikNdHizckaoGc1n2q8UM76
 ZHF1Uewl/SM22CaU/Y5yBei74EXe9isWRuhlY0VkhxIpchYQvtDlZTHHiNluUrnVmZQQ
 6k5m7KwHDOdDhfejvrDYVwOxzTfjQUOShl14IZ1AZB41TDTHe04y801uxgja2K89mZDi
 b4FZ9FB1dEjfQwW6L4GYAhOvkWDCAaP/lAm0eJ+NX/x5qmU5l9YHWk1kAKvx68zDRkCj
 EDOZKQgkUr9Zu4FDFjdJQo92f9MEjDbr6aANyazts0qvLr8dO11afvlFNjhnTgGgovPK
 7OQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVZ9zzgWbhTHc2GQR4JO8eCycluN+/6h6tbLkjrEUt9T2fmhrCmVH+Ew1p1JsXoTLYcUoTjyg6gJrmWA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwLjiLdSIhinxEjFcU6Texxvy45RQbNhMs1qWpwcPjZf1JXow3B
 xeaOmx7/z2702ymhJzPSzlVGs7rLMvhoC0UryMIFjnKx1cvGOA0p9qa85FPviezwmmfQnvyFUuw
 L4RZuj7cbdpkRKvPBkBb4feu/FeN0FuvrFZH34A==
X-Gm-Gg: ASbGncvNomQR07vmb/KSLl+5D6hfh2TTKJr9vkXyJ2vkR300sWOvVnZ0yIpN1xwLRus
 lXTy7Oi3wyQ/n1/WlbOZ0DWd+wYX7YVZuH7Z1qUDxCw2A5ZeCkhbPNcEkaar7JC/+weVfPf0N6k
 rnA7vdLeW3XMVhuEhzHJ+PrapjIhxAIPPuQrH3
X-Google-Smtp-Source: AGHT+IHHpGE08k0eF3GlP5E4RiiF0DoICSftFLqWpeYwYEYJllw2uhxtszoAU4mx0vs+6OEdCixULAjPR4Rd+B9jS3o=
X-Received: by 2002:a2e:98cb:0:b0:308:e803:118e with SMTP id
 38308e7fff4ca-30a5af477d0mr82028861fa.0.1740565744057; Wed, 26 Feb 2025
 02:29:04 -0800 (PST)
MIME-Version: 1.0
References: <20250223121931.579031-1-salah.triki@gmail.com>
In-Reply-To: <20250223121931.579031-1-salah.triki@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 26 Feb 2025 11:28:52 +0100
X-Gm-Features: AQ5f1Jo2WoZUN5CqFOCb6NBQfPETkTmOZejfsXHK-3TG35mQ7MQv0u6erKTTILU
Message-ID: <CAMRc=Mdn1NNKz+2-aA6qCcu=TMDvD8KcbWYgryhi6XDk72Zd1g@mail.gmail.com>
To: Salah Triki <salah.triki@gmail.com>
X-Mailman-Approved-At: Wed, 26 Feb 2025 13:48:39 +0000
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] gpio: gpio-stmpe: Use str_hi_lo() helper
	in stmpe_dbg_show_one()
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

T24gU3VuLCBGZWIgMjMsIDIwMjUgYXQgMTozNeKAr1BNIFNhbGFoIFRyaWtpIDxzYWxhaC50cmlr
aUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gUmVtb3ZlIGhhcmQtY29kZWQgc3RyaW5ncyBieSB1c2lu
ZyBzdHJfaGlfbG8oKSBoZWxwZXIgZnVuY3Rpb24uCj4KPiBTaWduZWQtb2ZmLWJ5OiBTYWxhaCBU
cmlraSA8c2FsYWgudHJpa2lAZ21haWwuY29tPgo+IC0tLQoKVGhpcyBubyBsb25nZXIgYXBwbGll
cywgY2FuIHlvdSByZXNlbmQgaXQgcmViYXNlZCBvbiB0b3Agb2YgY3VycmVudApncGlvL2Zvci1u
ZXh0PwoKQmFydApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9s
aXN0aW5mby9saW51eC1zdG0zMgo=
