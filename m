Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F33B396D73F
	for <lists+linux-stm32@lfdr.de>; Thu,  5 Sep 2024 13:34:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B6E98C78013;
	Thu,  5 Sep 2024 11:34:31 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E949CC6C83A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Sep 2024 11:34:30 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-5356aa9a0afso1060880e87.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 05 Sep 2024 04:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725536070; x=1726140870;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5ACc2wYNgnLNcX0Rbs5d+42G8UuKrSfryrlzJzSAIts=;
 b=wlShYZJ8lFvIJLagS2Q5KyjK6zebrBGV2fJaeW9jZu0bbQ3MSQAvDbxb42scWroKec
 HKSB5W6+JUzxgEX0myGI9hP1mye13eNKTzKNZ0rWd5ulrSW1hVaAufecqusILLDF/DRF
 8xMw+20tszSx662mEfrBeqoSxvBXG0Ws0cE8g3MtmYkfmFLTvdS0XW/UEBdBE9IUfkll
 /CviLsOVfirK941CcxCDo38S86FQwkov4J1L0nXpdAHTjj27c2RoTKzN4qZgiamwvkXL
 4Wg0v5qK5hz0xRVd7d3EbbjQ/aLDFV96m9q0CQl0ND//EO5NGjXwBeuIKkAO9a678Fae
 x8iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725536070; x=1726140870;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5ACc2wYNgnLNcX0Rbs5d+42G8UuKrSfryrlzJzSAIts=;
 b=lCBURhBZz1/cAzI35nzqD0/DwNpXjCO4uPM79qIP3CIN5tL5DAMf1n8kLswz8QuxM9
 oCiwqQ3h14yzHwO3zB0/vDuunbOe2QY7K74w1Nou1tjuGxoRlW3rQ6OT3MTC3whdfTMj
 oWXVLlWge7mrO6E1wahldHqW3d+RIcHm3cEdgTJNa+UaErbrny3NKDwIruOIM8NDd2Gl
 RC6scDG+e5/wjvfRwmXO6sqKYQE9UxFCHUOyTZRo/FCty829D483eUTjnHzaGBeIpBUP
 cOH3wkhZv/WHKudCbhzh58xlurGCiW1reiakSc61d+53vg6V0lPXeCGud+XCLNPRLGao
 nNLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUC26yLKl/KUyjyqjWFzvbqa3IbLXKQYUTNpmxDwe1WoioQnDKoPoUGkiWEg37V/A9G14h/+e5O47HYJA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz4rvzN4Q+NJlNJYGO0O1wrC/7jXacNYT3j+Gq4VZpIuQI+XT/z
 7h2Bq9th/MGt898Hs0ur3WINP9uaxpR/g2Avs7hYh5/yDlV0Irdsb4caBTHBHpXqquv1mtRCMfG
 GQrHk6jETKThVlk4abbefu7ZK1L9hT8YqNyFvBwg5gsDUoBK8RaU=
X-Google-Smtp-Source: AGHT+IGVpC5Qy1+xzqQNJjgo6dnKraFl3WJ0cAbDQLCTBkwJs4Trk5ZBWVFDjUFnDKTqTHXhQMXMA4pUSY2qB55hdUg=
X-Received: by 2002:ac2:4c4a:0:b0:536:2356:5dce with SMTP id
 2adb3069b0e04-53623565f0fmr1850962e87.58.1725536069277; Thu, 05 Sep 2024
 04:34:29 -0700 (PDT)
MIME-Version: 1.0
References: <20240902133148.2569486-1-andriy.shevchenko@linux.intel.com>
 <20240902133148.2569486-3-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20240902133148.2569486-3-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 5 Sep 2024 13:34:18 +0200
Message-ID: <CACRpkdZ15jP429o2STJrjArsDRbr=sE27DnwFucpvz-ksEsReg@mail.gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v1 2/5] gpio: stmpe: Remove unused 'dev'
	member of struct stmpe_gpio
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
c2hldmNoZW5rb0BsaW51eC5pbnRlbC5jb20+IHdyb3RlOgoKPiBUaGVyZSBpcyBubyBldmlkZW5j
ZSB0aGF0IHRoZSAnZGV2JyBtZW1iZXIgb2Ygc3RydWN0IHN0bXBlX2dwaW8KPiBpcyB1c2VkLCBk
cm9wIGl0Lgo+Cj4gU2lnbmVkLW9mZi1ieTogQW5keSBTaGV2Y2hlbmtvIDxhbmRyaXkuc2hldmNo
ZW5rb0BsaW51eC5pbnRlbC5jb20+CgpSZXZpZXdlZC1ieTogTGludXMgV2FsbGVpaiA8bGludXMu
d2FsbGVpakBsaW5hcm8ub3JnPgoKWW91cnMsCkxpbnVzIFdhbGxlaWoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0
CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
