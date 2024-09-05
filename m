Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 213D296D746
	for <lists+linux-stm32@lfdr.de>; Thu,  5 Sep 2024 13:35:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DB79CC78013;
	Thu,  5 Sep 2024 11:35:49 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 035BAC6C83A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Sep 2024 11:35:49 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-53653ff0251so506933e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 05 Sep 2024 04:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725536148; x=1726140948;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7yk3x+ZbeN2BNhaMaKl08JcgwzeeYygIIBA3a3DlQOU=;
 b=eRwYWu5IrtPdCh5EYM7f9HVveF9AgvNQzRdUy02pQLcZhCITukh5pL+3j2wCRcHkqp
 u7lN27DJomAOJtZ8GP3U/sUDSFU4Ci5aeIVaKG2DkM2wGRncOsY69+VcOX0llSVKbi0V
 wOFOuxfzbo1MyC/fzApdT+Bb+EBNONvxERdwXqBGVPhnwKiey+CPGKfEziuxgibMtGsB
 sgmV8z8qF30T55TiPoWKi02N7KKMUzGWsdczZHPOeSAPRsFkUgDvmcO3FiusMgK4NejJ
 aq3DZuuxxPrAEGsfj8sJvLmr4S8NJdjtB6fdtjEwyuyfTCiqgBDX35bDBu+trx7X5xa4
 eHhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725536148; x=1726140948;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7yk3x+ZbeN2BNhaMaKl08JcgwzeeYygIIBA3a3DlQOU=;
 b=hxJy3gkR4gi+9kVsUFVoYof44B1IedRL2rNtJ9r/IghrXPjVANq+/Zl4IRwfz229XM
 +1Jd6Z3haqL7PDADxOPyNc6qIf8LX+NYryrjTGe1pt0MCL3nlx/cYT0BBxw5GuFJoQaR
 eg4dN6zKDeICBWuYAzbH9KODPEtobi1Y0Is6VXpTq+J6UD/7q2w1UqfP1xG1HQomVq98
 iH/eKoaeP26ikgTgqRXtjORoQogDuivls0ha++5mhFmVin6hgvTRh3V1wO7FOKNZ1aMM
 HNHJtcTHaPB933bIA+iKSAPiIB9jUo9dszOqgn9PDAl0gFT1igHQ133CemsexmQ0TKxT
 ehcA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHDW9wIp7BGTw2nO6oU9H3+Fcq3yuo1/cOKM7LPrsrzJ/vl+rWL6/nt0lqbI4AbxN4CnYA96JXql/qTg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw3Y/3BD22bi//fthkUWOMW3tSERZo8zX9b1KOmyNlXduJ+GFaA
 1UzmCYZI0YCdYSE908T1zakRFjS3/v1Wxsb/UrT5sG07qVhoWRqK/WPofBHDgJe/3jWUVbSRT11
 NCGz2MqRq0JiCKsRrr3cp8UFhp1/tq5JDSsYwUw==
X-Google-Smtp-Source: AGHT+IEjAFWpawyNYHX6o04UXdt1Y15kepVJVBWzcsdgvk6TbjbGz0vYtLmv8rsg/6hXc0HmbI0fHBkTDS09WeNY7AM=
X-Received: by 2002:a05:6512:224a:b0:52b:de5b:1b30 with SMTP id
 2adb3069b0e04-53546ba09afmr15547801e87.44.1725536147976; Thu, 05 Sep 2024
 04:35:47 -0700 (PDT)
MIME-Version: 1.0
References: <20240902133148.2569486-1-andriy.shevchenko@linux.intel.com>
 <20240902133148.2569486-5-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20240902133148.2569486-5-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 5 Sep 2024 13:35:37 +0200
Message-ID: <CACRpkdbVfJf_bte_0BoGK3eu80LjO1kLGP3QzgLO0_B1guuD0A@mail.gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v1 4/5] gpio: stmpe: Make use of device
	properties
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
c2hldmNoZW5rb0BsaW51eC5pbnRlbC5jb20+IHdyb3RlOgoKPiBDb252ZXJ0IHRoZSBtb2R1bGUg
dG8gYmUgcHJvcGVydHkgcHJvdmlkZXIgYWdub3N0aWMgYW5kIGFsbG93Cj4gaXQgdG8gYmUgdXNl
ZCBvbiBub24tT0YgcGxhdGZvcm1zLgo+Cj4gU2lnbmVkLW9mZi1ieTogQW5keSBTaGV2Y2hlbmtv
IDxhbmRyaXkuc2hldmNoZW5rb0BsaW51eC5pbnRlbC5jb20+CgpSZXZpZXdlZC1ieTogTGludXMg
V2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPgoKWW91cnMsCkxpbnVzIFdhbGxlaWoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3Rt
MzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20K
aHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtc3RtMzIK
