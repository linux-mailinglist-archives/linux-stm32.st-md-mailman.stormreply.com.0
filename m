Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E093B3ABCB
	for <lists+linux-stm32@lfdr.de>; Thu, 28 Aug 2025 22:40:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 57E80C3F95F;
	Thu, 28 Aug 2025 20:40:00 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 62F4EC36B0F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 Aug 2025 20:39:59 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-3367144d196so12977171fa.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 Aug 2025 13:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756413598; x=1757018398;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uMbygbPZ6lp27UzGsQQZR6ABSzimBNrHU3kdVj894r0=;
 b=MzKVr/yHiWP0LLGQ0h9sObPQ1Sk8KBPqs+Sgb5XRIYFHgx6hCQOHxorxjIX73X8lpb
 WPVQPVJstkpxKLsAtIkJjcVWz7ZNxu8N7yhUP71pV7+s1a5+yYd5Q/TgL/ZKEogPvLtd
 UP+RcIrjK34IgpI33GWfxsPM4tWLFcUVAr2Z9L0RL4N4RoBI+Z/MNSTu+TOeuRJVwIzx
 3gKFAR3RpRPrZLJNXoLWwg4i6Mes7kpf0z5zVL8a4I0BCQ1a9j9y1cfH37wnzZ8ZJ69a
 jbw8hu7cemgVHFdLkvokDlrE6QcOjBHebN7cRaFqgSNDPGjOhcZQL0m5rDCFzUZGlHFy
 VULw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756413598; x=1757018398;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uMbygbPZ6lp27UzGsQQZR6ABSzimBNrHU3kdVj894r0=;
 b=FnYdgY1dlPKWFfK1rMQiNvPbyrD1Opr727saW7XposYknihAlP7Lq3SyiRd/XU5X8T
 KN4oSkAaXVbF9IhahcZpA49HTNMuEa3NMChxXFlOtYV7nATR2kMg40qhQ1DRQypcj5/Z
 i6IjOjtjvbbMnaTmhwvad1gpbHO9Z5GtP01R9lasMgt+9t9oJDscEz0FN0TQVshwowZu
 Cnva4AG+90g8t2+dyjh/5cIh/KLPU3kGHrIg7nAjq1ZBYkkml43razX5YuNdkLhpyhvt
 vO/GbI0lbdAhsXKJRUCwHEXlrTa4JpqLQ4U4/2WUurEz228e9znsjyCrZMkM8Nd5hJLb
 UjDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhg9bTWWN1hOhIzNSAlI+UwkPZHcORJqZqtyL5yw35aPTBYgSo2ZrJIweG4QgCLbYO/4kbvhOpdbZtwQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxPGtf2bhNGLsng2x5Ykgi22c5YermiZ0BI/2refqR10MjZS4yA
 gwSSFum5QAVJqkgIVgfOsNRDM7b+fXzUxWWtPinzxEStlxwOdm36N44hdbOBF8IRzj/hM9mwc6V
 eozewEfjDIU6ahSqaxHjHdn7oxbE0lPZt75TzXVUouw==
X-Gm-Gg: ASbGncs3HP1d3+CA7+cbrrMcF2LdI/7+XYXmdhKUc06iJTzuvYIqt/p6LOg+Z8XBB0s
 TRY1mBX7asy9E+EH03FKhgkhfB6lMV9z4Fu7BTGH19UrD0qyKe2hnJ5LqyjmZyqFkpvzX4ZmQST
 ocfWqLYlr+k/d9r33wL9/5YnwYKEp9dRE/CxLscDUGVygvj277n8e+4yXlpBp9Q63IBN0Llkcve
 of6QDpOgOTt3kn/Jg==
X-Google-Smtp-Source: AGHT+IFyEWOuQG1fDf1ksdaTJASZAGtsBlaDN9tGze2bxNvZnscAfatszOqEDWcWQi8cu6lP0CXjxEkjw09XegfiPKU=
X-Received: by 2002:a2e:bea0:0:b0:336:af88:ce61 with SMTP id
 38308e7fff4ca-336af88d0efmr5543851fa.40.1756413598261; Thu, 28 Aug 2025
 13:39:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250826-gpio-dbg-show-base-v1-0-7f27cd7f2256@linaro.org>
In-Reply-To: <20250826-gpio-dbg-show-base-v1-0-7f27cd7f2256@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 28 Aug 2025 22:39:44 +0200
X-Gm-Features: Ac12FXzQsryYs9cHpNdLp9yIX0je4QdVRt-NW8EFXmMKnqh-BUifcsfX0FEg61k
Message-ID: <CACRpkdYBZTLpEGS+7m_B8MrFtUvh+0yaS0bsen4jkUcf0C8gjw@mail.gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-pwm@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 0/6] gpio: remove references to
 gpio_chip::base from debugfs callbacks
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

T24gVHVlLCBBdWcgMjYsIDIwMjUgYXQgMTE6NTTigK9BTSBCYXJ0b3N6IEdvbGFzemV3c2tpIDxi
cmdsQGJnZGV2LnBsPiB3cm90ZToKCj4gV2UndmUgc3RvcHBlZCBkaXNwbGF5aW5nIHRoZSBnbG9i
YWwgR1BJTyBudW1iZXJzIGZyb20gY29yZSBHUElPTElCCj4gZGVidWdmcyBjYWxsYmFja3MuIFN0
YXJ0IGRyb3BwaW5nIGl0IGZyb20gZHJpdmVycyB0b28uCj4KPiBTaWduZWQtb2ZmLWJ5OiBCYXJ0
b3N6IEdvbGFzemV3c2tpIDxiYXJ0b3N6LmdvbGFzemV3c2tpQGxpbmFyby5vcmc+CgpUaGUgc2Vy
aWVzIGxvb2tzIGdvb2QhClJldmlld2VkLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlq
QGxpbmFyby5vcmc+CgpZb3VycywKTGludXMgV2FsbGVpagpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgt
c3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
