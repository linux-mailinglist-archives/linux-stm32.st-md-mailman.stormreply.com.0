Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 27105AF82F1
	for <lists+linux-stm32@lfdr.de>; Thu,  3 Jul 2025 23:55:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DC48BC3F959;
	Thu,  3 Jul 2025 21:55:58 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C5CB6C3F958
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  3 Jul 2025 21:55:57 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-32cd0dfbdb8so3093281fa.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 03 Jul 2025 14:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751579757; x=1752184557;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YGEkDXVNOX9wPiYmSwP7ApJGABwjYWXqzCX16ikn5to=;
 b=MunBYdmjklBJt3LKuGe8IeTJz1PTC7P32qjUAgCamKtD56xKnb2jOtbTRajubR3Uct
 5NNsyqYeK3fW9mvVCMFskyUi7KGzTsrK3k1eobuJcPVEAIKvanehpV3yZ2d6jdI7UgCJ
 LBkdE+0vdHeG3Ixm+6YqQv0fjSoiCRkBzF2CVSIouEkQYsIsdYUleNKjRXQYpOenbjIa
 C6PrLUS6YhfaExQiPp9Rausot0FnyJd6d+yXy79Fv2WB9MwMK0Ljbc/tdkAvDHmx2Yx8
 /44Td83rO555j2D/UjdMY1isajC02fq4XjyyF6RuytxshKoA3MhvwZaaoF9h3caf47HP
 U6Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751579757; x=1752184557;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YGEkDXVNOX9wPiYmSwP7ApJGABwjYWXqzCX16ikn5to=;
 b=A4RA4VyW43Mf/2E6rQtwYFa+FW7aBH6yHu9T3r90aWgqqbEYbwQQwAD5KJ41HqcDFI
 SIWARndmzAHY5S7CN8IVTrOEeuCMCM93iQIDbPmRMEEk5cCVj/i9aZYOj6DBW/4D2KYt
 j2N3DD+X2f3HsvHs6MHUyKZOqCre9+xiRcVwnD5oa+YrCewO0wyz4nZsXnt7JuNtnrng
 AZ0nX9AkCID3vtyGUO6YE/obuOySomXGmrbcFLxpu7PdNRPFYtsuq4UoqRPNkd7IGD47
 gcDpSQP0O/kjnZaVqIxfp1d6Uc+p1fT4s++j+R1eUXXdZbtLWa0MEnkhvXDFHcMYN/tW
 iUdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzBRzYEHu8GWc9qb6oiEhD22wI34uirTmLDKIGCkPyEdRLfjLntz82TwNnlbK6qLJwuoke2vVzAZTm/w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Ywi/4G85/OsVOz10PZmw8kApLofJpbOPi+544yedHW9LqAHONUH
 X4ir4vo/wodFln5QaRfw7Vjzs8CuCppK8mRDS7ESyN2JkCPXeE9Du/ybBA9LThgPUHtWHv7fCz6
 m90pfMYDC9vPEmVvfV6gPhXQMcA5QarvRG0xf8SLQcA==
X-Gm-Gg: ASbGncseyMSTgh/rbxWBAmOndy7E8dlk9tRWb1FdHOdWt7wLlB5uO3RFRMTbXStqRE8
 j8EwKlZTUTt1SM8JaA5UW3OyrrKnk7JH2tocyDOBjicnP585nYIivnRo22Sk733KBNl+a1YIkXA
 nxAF3mr1LHb3aryhvS3qDaCmrn4fMp8+Fxu+R/BWbVnRE=
X-Google-Smtp-Source: AGHT+IHaNTjaTi4rRrNiknGoZhKdAy0nR6vSTWwutP5sj+WgtzM1iPq+I6faszK16by8wPiLXBJSSCeRTyl3tRP9WBs=
X-Received: by 2002:a2e:a9a0:0:b0:32a:8153:6934 with SMTP id
 38308e7fff4ca-32e5a4b393bmr565651fa.1.1751579756933; Thu, 03 Jul 2025
 14:55:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250625-gpiochip-set-rv-gpio-round2-v1-0-bc110a3b52ff@linaro.org>
 <20250625-gpiochip-set-rv-gpio-round2-v1-12-bc110a3b52ff@linaro.org>
In-Reply-To: <20250625-gpiochip-set-rv-gpio-round2-v1-12-bc110a3b52ff@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 3 Jul 2025 23:55:46 +0200
X-Gm-Features: Ac12FXyJ5knyp1mOJyZQmth8ooUCQJdl18NRhMK4RYZjhZxWH_hhFCTHLqF6V_M
Message-ID: <CACRpkdZ7B7FZtU6a+n8qcvNhhuqhzeZ=jfs+xQPqAWLa5n2LAw@mail.gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andy Shevchenko <andy@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Chunyan Zhang <zhang.lyra@gmail.com>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Thorsten Scherer <t.scherer@eckelmann.de>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, Orson Zhai <orsonzhai@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 12/12] gpio: tc3589x: use new GPIO line
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

T24gV2VkLCBKdW4gMjUsIDIwMjUgYXQgMTI6MzPigK9QTSBCYXJ0b3N6IEdvbGFzemV3c2tpIDxi
cmdsQGJnZGV2LnBsPiB3cm90ZToKCj4gRnJvbTogQmFydG9zeiBHb2xhc3pld3NraSA8YmFydG9z
ei5nb2xhc3pld3NraUBsaW5hcm8ub3JnPgo+Cj4gc3RydWN0IGdwaW9fY2hpcCBub3cgaGFzIGNh
bGxiYWNrcyBmb3Igc2V0dGluZyBsaW5lIHZhbHVlcyB0aGF0IHJldHVybgo+IGFuIGludGVnZXIs
IGFsbG93aW5nIHRvIGluZGljYXRlIGZhaWx1cmVzLiBDb252ZXJ0IHRoZSBkcml2ZXIgdG8gdXNp
bmcKPiB0aGVtLgo+Cj4gU2lnbmVkLW9mZi1ieTogQmFydG9zeiBHb2xhc3pld3NraSA8YmFydG9z
ei5nb2xhc3pld3NraUBsaW5hcm8ub3JnPgoKUmV2aWV3ZWQtYnk6IExpbnVzIFdhbGxlaWogPGxp
bnVzLndhbGxlaWpAbGluYXJvLm9yZz4KCllvdXJzLApMaW51cyBXYWxsZWlqCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcg
bGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
