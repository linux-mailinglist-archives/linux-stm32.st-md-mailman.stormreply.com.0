Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1966C96D743
	for <lists+linux-stm32@lfdr.de>; Thu,  5 Sep 2024 13:35:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CF412C78013;
	Thu,  5 Sep 2024 11:35:31 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7DF77C6C83A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Sep 2024 11:35:24 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-5334b0e1a8eso767896e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 05 Sep 2024 04:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725536124; x=1726140924;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D8LOK6g38BHVUQYIn2cRYAM0mfKu91TTBAaFY8Nhf18=;
 b=ZsMtjmmeIdDKiq1uPKVZsFORW8hmWSp1bcIeoDZ6nb0RPy3fnB+6MBmHfp/WWbtSTf
 YoeefwAv2OV5gXKOsAmHPhc8YB9rqFT3FCJj0g/VxEIgjH3DfoEGRqSzunP5bUoZlS73
 kaI7SCb0v8Rl5eH0Hf/AjLDIlWuma0SxsPLTNH6wMQmRsbFPu37ihz7hIxe6gpzoldMG
 VobmPmKkhcVgvjr+kmMmPGLsfOXwGmkUGb+FPu3nGcu9QaTJ1l8Z7YBblEdN4kPZJEST
 tELaHPw9lUWBa8lA33Hm6eiG6TDFF50HX5LOc050SVVyOuteF7pymM5cPVvuT8QsKhaL
 BxkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725536124; x=1726140924;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D8LOK6g38BHVUQYIn2cRYAM0mfKu91TTBAaFY8Nhf18=;
 b=S2tAPd/n4+YX1kUaiLQNn/Ic3os4OOUfPH+xf/7huv1PR9VWXbb+9RQI5oJ7kIRgrG
 iVPesBVvb8VfujdSctnVnz8F4qyrkDX5ltnmMpK4lTnsep+W+ZFy69fa9UDThKq+4xUk
 SkNSeigRX37wMZpZtYSUkdgKK41yebgcRJC637j+/uGQaJAMuecM46s8/LFDdFOdtg2z
 C67lXFcQioQ14mZIG4xDNGC4aePJAZrSR5cLgiwYmJjHzXxCO1JQZUcOud+rXFhWr/c5
 dUrwau6MF3ngapT6BjZGert4og6cQBeJIjOzWaCusgdO5HT/ytDQdvYO5YIV27Bn0u8L
 P4og==
X-Forwarded-Encrypted: i=1;
 AJvYcCXE9OwWAr1cf+3jjdbGZS9QYWH/WA8jrwQDXE6BspfvSkePKNG2Nx2TlXzgifuCad3xmhP9rCzRRtWryA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwcwnGz4olepmWolMZUNoFAhTCmSFV7uUZ33pO5VKU6ySaCkpw2
 yKv1YTESFimk/oMO/XXngL2akHC4zR3KFIGQ8rA6X4Hn3iwHrTfoZztjSbg4fi7Wr2hjAaKz907
 L151MO+0QTHgdjyG05GdjHmENMtUAoqMI95G8bw==
X-Google-Smtp-Source: AGHT+IH50s5Z5WFlFfNldch2QeQuYIA/dIzAsCjazzpfQvumpfx/biIviPNI+zjkOOyT+8fP2SwCgivOGNYW44aUWD4=
X-Received: by 2002:a05:6512:3188:b0:52e:f58b:65ee with SMTP id
 2adb3069b0e04-53546bab08amr16289049e87.57.1725536123383; Thu, 05 Sep 2024
 04:35:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240902133148.2569486-1-andriy.shevchenko@linux.intel.com>
 <20240902133148.2569486-4-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20240902133148.2569486-4-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 5 Sep 2024 13:35:12 +0200
Message-ID: <CACRpkdYWPdha2Viz4v1whGcHi1J0wqThE2ng-=AuW9f9g4oQWw@mail.gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v1 3/5] gpio: stmpe: Utilise temporary
	variable for struct device
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
c2hldmNoZW5rb0BsaW51eC5pbnRlbC5jb20+IHdyb3RlOgoKPiBXZSBoYXZlIGEgdGVtcG9yYXJ5
IHZhcmlhYmxlIHRvIGtlZXAgYSBwb2ludGVyIHRvIHN0cnVjdCBkZXZpY2UuCj4gVXRpbGlzZSBp
dCB3aGVyZSBpdCBtYWtlcyBzZW5zZS4KPgo+IFNpZ25lZC1vZmYtYnk6IEFuZHkgU2hldmNoZW5r
byA8YW5kcml5LnNoZXZjaGVua29AbGludXguaW50ZWwuY29tPgoKUmV2aWV3ZWQtYnk6IExpbnVz
IFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KCllvdXJzLApMaW51cyBXYWxsZWlq
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0
bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
Cmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXN0bTMyCg==
