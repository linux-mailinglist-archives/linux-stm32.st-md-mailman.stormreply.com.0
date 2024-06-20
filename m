Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AD783910433
	for <lists+linux-stm32@lfdr.de>; Thu, 20 Jun 2024 14:32:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 60B71C6DD6E;
	Thu, 20 Jun 2024 12:32:02 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7802BC6DD6D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jun 2024 12:31:55 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-52cc129c78fso770256e87.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jun 2024 05:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1718886715; x=1719491515;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jCb6yC3LV7RS1SBbrETONCjgbXRTz+kthAeBoPZk3uE=;
 b=bzaX0vzLI+kI7BnnfUUWqb8J0GD+C7kG26v7Ydg7E/p+6PErRoqFHEF/LoyvoFVoWa
 1set2IptwybFOfGVdUi0L6Si213mYDPHeh0AvlIgd35MXyqM53GZR/HR3ok2v4vFCxHO
 jL3VNrvp2szIfxjF1l4wCN8rl8h0XIFdqfLTL+VYsGydfKPaeimFt3F9msxfnJHcYH4b
 pZt+jZ1MVMRhnkfgu3WvhO3wTgTBe9Mi1f/mW2fT+F54E5cmFbB56kv/ON5cInlQagUR
 JzDpFRBdrTwF8Jmq0Rw/M762jPxX7+JKbc4kQti0WTLc1uZ50KBVClrPaXaEys1AdkYC
 wW9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718886715; x=1719491515;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jCb6yC3LV7RS1SBbrETONCjgbXRTz+kthAeBoPZk3uE=;
 b=Z6Xni4fUZjJnbU1TAml96sihnPfTinmDCmnF9O2ToU8D1YifCIj3YsJ84VaTLZcpo/
 a8E92JzIVNOinSQ2NLspOPotd/Lkc0KN9KnXjgkj23FOiLLOD8okTZiE7fgLBwdE0aId
 dtkzBmiYMgv57XzbCE06a7PGdm0ToaIaLUkZhJXzUyQLWCr2kMylP7e/Kn3fnCgWgD2k
 TVKT0yCbjc59DN0WBeCPA5XLnf+6qmO0zbuBZzq77BTd+utIDZMGCeexIWPr5MPOUkmD
 lUC1YOXCvPst29Wl5FfPQ4gHJIqXG02pggstauAbcAOw/eFs55v5kAZEfvwDO5VDaWxc
 AJyQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrqTKXrH7tIM1Qx0cxN/8rYoJR40NsbrBJBDD9hwIjYJ9gQ8x7KDirAtobDwQ0B40fp/1eI6ieuMl0neNQufJKRc8HnIPH5o7shXJWDbifYbDgO1tW7SrU
X-Gm-Message-State: AOJu0YxFQWho+S4tOkmTqRzZv6RPpzAuPgpI1xyC2+03+aWDPryKD8sE
 +ZEiq3reAZtsNLW+BJBnIFbE81GmHYJsVeO0Ub9ntcnSer7wiigdoZLxoiOCcLXDaVqAyxsCqII
 zSITe1ihtH8N9EfSchXRGpJbNDLUwiZpU5PxjAw==
X-Google-Smtp-Source: AGHT+IFEBqVhz8d0V1M1pa0KZH9RCnVL/MBWmCY5jwSJkoCnbHQgQ/4ArnXiI+p5/MiLtoJrmvDlZdKPBbVkobzIYGE=
X-Received: by 2002:a05:6512:1242:b0:52c:8837:718a with SMTP id
 2adb3069b0e04-52ccaa918b4mr4529720e87.43.1718886714538; Thu, 20 Jun 2024
 05:31:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240619184550.34524-1-brgl@bgdev.pl>
 <20240619184550.34524-9-brgl@bgdev.pl>
 <ZnQLED/C3Opeim5q@shell.armlinux.org.uk>
 <ZnQPnrfoia/njFFZ@shell.armlinux.org.uk>
In-Reply-To: <ZnQPnrfoia/njFFZ@shell.armlinux.org.uk>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 20 Jun 2024 14:31:42 +0200
Message-ID: <CAMRc=MeNGQBMZFg3FTtcFzVKU4xMpnm0BxsAgs+++sFDpU9t_g@mail.gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Vinod Koul <vkoul@kernel.org>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-arm-msm@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 8/8] net: stmmac: qcom-ethqos:
 add a DMA-reset quirk for sa8775p-ride-r3
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

T24gVGh1LCBKdW4gMjAsIDIwMjQgYXQgMToxNuKAr1BNIFJ1c3NlbGwgS2luZyAoT3JhY2xlKQo8
bGludXhAYXJtbGludXgub3JnLnVrPiB3cm90ZToKPgo+IE9uIFRodSwgSnVuIDIwLCAyMDI0IGF0
IDExOjU3OjIwQU0gKzAxMDAsIFJ1c3NlbGwgS2luZyAoT3JhY2xlKSB3cm90ZToKPiA+IEkgZG9u
J3QgaGF2ZSB0aW1lIHRvIGdvIHRocm91Z2ggc3RtbWFjIGFuZCBtYWtlIGFueSBzdWdnZXN0aW9u
cyAoc29ycnkpCj4gPiBzbyBJIGNhbiBvbmx5IHRvIHNheSBOQUsgdG8gdGhpcyBjaGFuZ2UuCj4K
PiBBbHNvLi4uIHdoZXJlIGlzIHRoZSBjb3ZlciBtZXNzYWdlPyBJIGRvbid0IGhhdmUgaXQsIHNv
IEkgZG9uJ3QgaGF2ZSB0aGUKPiBjb250ZXh0IGJlaGluZCB5b3VyIHBhdGNoIHNlcmllcyAtIGFu
ZCBJIGhhdmVuJ3QgcmVjZWl2ZWQgYWxsIHRoZQo+IHBhdGNoZXMgZWl0aGVyLgo+CgpJdCdzIGlu
IGxvcmUgYWxyaWdodDoKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbmV0ZGV2LzIwMjQwNjE5MTg0
NTUwLjM0NTI0LTEtYnJnbEBiZ2Rldi5wbC8KCllvdSB3ZXJlIGluIFRPIGZvciBhbGwgdGhlIHBh
dGNoZXMgKGFzIGV2aWRlbnQgZnJvbSBsb3JlKSBzbyBtYXliZSBzcGFtIGZvbGRlcj8KCkJhcnQK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3Rt
MzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20K
aHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtc3RtMzIK
