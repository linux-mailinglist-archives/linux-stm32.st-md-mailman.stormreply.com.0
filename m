Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0B096D749
	for <lists+linux-stm32@lfdr.de>; Thu,  5 Sep 2024 13:36:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E7936C78013;
	Thu,  5 Sep 2024 11:36:09 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 480AEC6C83A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Sep 2024 11:36:08 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-5344ab30508so1643010e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 05 Sep 2024 04:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725536167; x=1726140967;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NqeRDA78MQ3vDbts7pFKQh7mMRZQyPlxwYc8d3EH1Jw=;
 b=x20zLZUHYS2G6a7MVj/3pbX7fXBl1hL1jsFXIrxR0xEz43d3MmmTBocGKrWEmxim0n
 ZGG+XWwivG9DFIa7a+at3UAEWijBH0pCQY5cXnYjqtZlK6MdMCsdR1HMtciF5hHkCTG2
 Ph1o0kVRrUQFfk1HpBzkolePfInUATwRxP6mu06ELvYCeqghmBXCJwhMqYLttpJcfLCw
 fimJ9rRUjw5XoAM8IOl92/vrwxJcKPtCNa5ayo7zlcUqae8JZj1peBa2aUVPUANUUfBg
 WK/XFgA3x6Aq31pBVuvUYejcNQwM5N55NBas5aqi9dTV6TFvpL32fQG5x6pDFtAEIYek
 4pZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725536167; x=1726140967;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NqeRDA78MQ3vDbts7pFKQh7mMRZQyPlxwYc8d3EH1Jw=;
 b=UVy6DFmPE6JEpUZ1jEvgAorc96uMrzzJ+8Ll5rhUu9ZM8AmZF/vRFZVi7yoiL1Cx90
 dCrgfL18jEd4Gxim5yNbHYBC1+ltJCZDfSEwIOaCrLl1EvFeFhjiHm/yTLauC7c4mDwc
 Pl0eiS6gQHgpHXP3xDgsq2eVsDZtNKNUNfcit7XFBBenAxwjbRCgmYYkySLtgnyUtSE+
 Ejr5L5Wpr4GgAo4KlH1ztSbAB7chrrrJyJTvLNyKC0VzMUwQOowa47t5uJU8/fQzSHm6
 /o3CGe2nyKFjeY+Fj8CBZ9t/H08SsAzEykCIvF+WDPWvJcA4tyjMBbtIUse1UWs80HLw
 2nXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV04FXdobI8D1bnrcgfw2fMTk7J/OpwzJlUHgIxBhh8esTj+4k3IAtDYbalEpX3ri4VgKRESfjYXDbyQA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwANXHOC0OcLxOdBvYKyvm0Peho0fn3RcprD0CA+FcTfrNTMbnb
 m1Aeuzr3T1MQpo9uydWMxyC/MEUol08UyMEirR0KKVFLOxHvQkLRDU0BoRmqE1DqCQJTFDIr800
 iAAsnPKxJ028EjuNusUHuaLHG95ypStyRkoV9VQ==
X-Google-Smtp-Source: AGHT+IH6BAyVUQLsDBUDRzOGArnxNvle63qAlyD9+MRHG/ncJc96g6GOqqfS74OGvIepzVBwxVMAFqSF0JP9xCZokxI=
X-Received: by 2002:a05:6512:33d0:b0:52b:aae0:2d41 with SMTP id
 2adb3069b0e04-53567798531mr1471780e87.28.1725536167312; Thu, 05 Sep 2024
 04:36:07 -0700 (PDT)
MIME-Version: 1.0
References: <20240902133148.2569486-1-andriy.shevchenko@linux.intel.com>
 <20240902133148.2569486-6-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20240902133148.2569486-6-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 5 Sep 2024 13:35:55 +0200
Message-ID: <CACRpkdZWhWHjghg4NP2O0Jh6=gh30yt6EL9fz2nkCuHSQ+A8eg@mail.gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v1 5/5] gpio: stmpe: Sort headers
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
c2hldmNoZW5rb0BsaW51eC5pbnRlbC5jb20+IHdyb3RlOgoKPiBTb3J0IHRoZSBoZWFkZXJzIGlu
IGFscGhhYmV0aWMgb3JkZXIgaW4gb3JkZXIgdG8gZWFzZQo+IHRoZSBtYWludGVuYW5jZSBmb3Ig
dGhpcyBwYXJ0Lgo+Cj4gU2lnbmVkLW9mZi1ieTogQW5keSBTaGV2Y2hlbmtvIDxhbmRyaXkuc2hl
dmNoZW5rb0BsaW51eC5pbnRlbC5jb20+CgpSZXZpZXdlZC1ieTogTGludXMgV2FsbGVpaiA8bGlu
dXMud2FsbGVpakBsaW5hcm8ub3JnPgoKWW91cnMsCkxpbnVzIFdhbGxlaWoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBs
aXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
