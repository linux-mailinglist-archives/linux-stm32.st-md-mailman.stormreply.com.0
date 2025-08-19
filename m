Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF84B2BDC2
	for <lists+linux-stm32@lfdr.de>; Tue, 19 Aug 2025 11:44:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9B47EC3F949;
	Tue, 19 Aug 2025 09:44:10 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 221EEC3F945
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Aug 2025 09:44:10 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-55ce4d3b746so5770588e87.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Aug 2025 02:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755596649; x=1756201449;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OOZDAaZrI66ydwRO+2rFbEiHfOOLnYyWJFOFD28ZEkM=;
 b=MX6oZLAxZ8KVX7dmbnWPSlBtr2XwbIsVesdbpgXyucXhLfGApr5y2SyUFE1OhQybKK
 ks+ejrRFkkOMiYQ/2jl8UDig848sqFBC6q7c0z6rLCx628fqlVHpIw23++EASLYlHqWI
 6bn3H9rIJdAeiVMvXgvmo2m1aoADZMI5QAMqe7DQ/U+k63uY+dxdnAU5LXpAfbKcps71
 UTYd8RtDdnha8hpOVV9JoXOwAe1KNmzLnv9czYkiSsY6Z31Fsjit6rA1Kvl4ETRS6wBX
 caGNBVyuh3uSnKg+BTh4Vd3gXLqWcJZaeEthI7e7yMGvDYoBSz06mN5x9lDVD4KVn3Kh
 iPjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755596649; x=1756201449;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OOZDAaZrI66ydwRO+2rFbEiHfOOLnYyWJFOFD28ZEkM=;
 b=e4I0DOs2GejU3/SCsCJI9ogz6KF6zBlegOIlYIHEspgOx5d4GYtbQsbCBnLKY2PVLj
 4/MwBNToZ4vDb+UFw1DrrNMIQy7897yDrS9/c9P5jzs/Pqdtt49nX+qtM0HpkUuSWSmW
 0lefBHoYaSaPJor3EbNSNV2KYKCrSCFQMWAilNTKqKC4SaZC0knj8vjLHt89SMmhzWop
 0MnoudV1ZOXnjH7HTqrSd8qz8X+0urhJYkhVNSA+mddOt1qjHI7o2cp2+BDzjZuWNOQb
 RSW5ZBxXbA0gqko7U9UGkwF3d9AfPDmum+2TeBf5spOMEBSoSRp9oEYAPDyvSo30T0AV
 4p8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxZC33iJE/4WWHWewOwlaGkFwufxEp1c/F4gSHTJYAiAU438yOcI9lLWkpwybjgdeJJO8IxBnK+1LAog==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyofvRHr0xxpcRWRUrR0Nn0nYh/IHRjP2lHbmIbyWKhdUFwPtTT
 qZO1hmmNSkt+gG/w9xi5jXRUrC+xDORpDNRsVkuBUMBKAML2r17rT27RJb5C4GAfTAtdTNbRjVR
 P2nJ1aSel0oJCZEeXRbGTRfCDK+Hf2TugxLm0TRlyZQ==
X-Gm-Gg: ASbGncukapuh1oXei6kjxckewTFVfPlywBqE8yMPs+/QcqiY7awoyd+T+mZQ1YanRB7
 /kNUha62i2PPK0F4Ixd5gJdWsd6iNh0e0jXl11lBNukxWKFITK7fnF2fjLYPP9KYDpLAQZuPkaq
 bAQpYGw25r8hPlraMI0ARQAw79+CBBnN5DTF2vs3WL45WIIUtvRp3SoWUk/86UgWWklw+en/p0E
 LCzKW9sm9yB
X-Google-Smtp-Source: AGHT+IEb5axoDvieP94ahUcvQF4Cdj/DI1kgL87CBZO05dhRfNXWtWdEPdVzxE8EKpKiDOV7nU9/phOY4imeW35mO0s=
X-Received: by 2002:a05:6512:3984:b0:55b:79e8:bf83 with SMTP id
 2adb3069b0e04-55e00e3ab16mr476219e87.14.1755596649121; Tue, 19 Aug 2025
 02:44:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250811-gpio-mmio-pinctrl-conv-v1-0-a84c5da2be20@linaro.org>
In-Reply-To: <20250811-gpio-mmio-pinctrl-conv-v1-0-a84c5da2be20@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 19 Aug 2025 11:43:58 +0200
X-Gm-Features: Ac12FXxWHK9Y341YvKoMtvojeGQDJurTuXUIgTK46n0rp4Sv0-QLWOBJFmGfpkc
Message-ID: <CACRpkdYungF_01g0XO=u7meo7pq+9y2YHP5XCBDtKHByee8yPA@mail.gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-kernel@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>,
 linux-gpio@vger.kernel.org, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>, openbmc@lists.ozlabs.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Tali Perry <tali.perry1@gmail.com>, Nancy Yuen <yuenn@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Benjamin Fair <benjaminfair@google.com>
Subject: Re: [Linux-stm32] [PATCH 0/5] pinctrl: replace legacy bgpio_init()
 with its modernized alternative
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

T24gTW9uLCBBdWcgMTEsIDIwMjUgYXQgNTowMuKAr1BNIEJhcnRvc3ogR29sYXN6ZXdza2kgPGJy
Z2xAYmdkZXYucGw+IHdyb3RlOgoKPiBXZSBhcmUgaW4gdGhlIHByb2Nlc3Mgb2YgbW9kZXJuaXpp
bmcgdGhlIGdwaW8tbW1pbyBpbnRlcmZhY2UuIFRoaXMKPiBzZXJpZXMgY29udmVydHMgYWxsIHBp
bmN0cmwgZHJpdmVycyBjYWxsaW5nIGJncGlvX2luaXQoKSB0byB1c2luZyB0aGUKPiBuZXcgdmFy
aWFudCBmcm9tIGxpbnV4L2dwaW8vZ2VuZXJpYy5oLgo+Cj4gTGludXM6IFBsZWFzZSBjcmVhdGUg
YW4gaW1tdXRhYmxlIGJyYW5jaCBjb250YWluaW5nIHRoZXNlIGNvbW1pdHMgb25jZQo+IHF1ZXVl
ZCBhcyBJJ2xsIGhhdmUgc29tZSBtb3JlIGNoYW5nZXMgY29tbWluZyBvbiB0b3Agb2YgdGhlbSAt
IG1vc3QKPiBpbXBvcnRhbnRseTogcmVtb3ZpbmcgdGhlIG9sZCBpbnRlcmZhY2UuIEkgd2lsbCBu
ZWVkIHRoZW0gaW4gbXkgdHJlZS4KCkFsbCBwYXRjaGVzIGFwcGxpZWQgdG8gdGhpcyBpbW11dGFi
bGUgYnJhbmNoIGJhc2VkIG9uIHY2LjE3LXJjMToKaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIv
c2NtL2xpbnV4L2tlcm5lbC9naXQvbGludXN3L2xpbnV4LXBpbmN0cmwuZ2l0L2xvZy8/aD1pYi1n
cGlvX2dlbmVyaWNfY2hpcF9pbml0CgpUaGVuIEkgaGF2ZSBtZXJnZWQgdGhpcyB0byBteSBkZXZl
bCBicmFuY2guCgpZb3VycywKTGludXMgV2FsbGVpagpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3Rt
MzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
