Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CE12BACBF44
	for <lists+linux-stm32@lfdr.de>; Tue,  3 Jun 2025 06:41:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6B906C3F957;
	Tue,  3 Jun 2025 04:41:51 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 45256C35E3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Jun 2025 04:41:50 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-54e7967cf67so6052288e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 02 Jun 2025 21:41:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748925706; x=1749530506;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BED0WVH0ui801+fOhuTnComAdNPJBDfJ7ZYmPTvoYyA=;
 b=ltZlB0LB72LBG4Z1U6ar9IddDNBgmrlql9TbiISikE3Uz+kOccnVwISn5gHouaCJHF
 E12YkoAPLy7IeP/MQ06CMIjaOd8B6hevcnZUjbuY14Y1hE1czMcPeyLOYg1r7uAI5eRl
 JlfzmBymjOS3nKoAqKyi31neZxhY2O2floR+rnXKsEwuTUxzwa+VfCLJTPHYC5sK3How
 YgMRQswt4NWYZAJn/oQ22Sx6TTh008BpyHUmLWiJ5EVDTN5aza83fqBrulNzWbkNzk8w
 c20+XhMRaStGKN6aho2mKzx0DbRUNppalYGfmrrttCjUtQu+n57bcsZnO03AC2Kmq3Qx
 25KQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxWjGt6O0AdOxi0+IC6iJY/6uZc6VHU8yST4yRKgPrVvIiwaquK59qmAnI2Z1IILJJsJ3ijfs9qlPJAw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxtXNoQtKnVjjqvDVQe7LP2jAJS2mOh3y0ZsFzeEB+2f9aJeoDP
 hzd+YA8PTmb35u+SePM3xuNXMG/KMkYjrwd2IU4N7N71EKgZZxVn0sjvuIcC6CNCspc=
X-Gm-Gg: ASbGncsbQ17GL27FuyLOsH9LlswrkxYjQ7faxH6tWGY/gNdnQpN/ixApM/xK0BmEdIO
 CQZ7VZFMlM1cl6z+R3pa5NW3Ce+6L/SzviTG8F/bzzluwsTI/ASYDWsGt8MlBaX2s2I0UdIrMTx
 3PWcCiKXm5qyAczS5/LwQI9GzJUbKHW0II99A35OjJQW+plSQ01yoLdOiL5v+kLitLQumYjPY2y
 KDFK9X1OfFb0AQHBhu9su5tGTJvEgaRC9PejNFJJS+LXq0RbCso2TFP1GW/ijY8HrV2oc7m73zG
 AQIY5xL38xYFAnVbCYinS2LRsAd31HKqvMZQhlni4S6Pkqy6k279rppnT0VeY0hPVfoeExGgqj1
 LiULA
X-Google-Smtp-Source: AGHT+IGat9exi3yttHP30mO50tRZYn6870gp5zwZ5XWCkUUgBP25PXwe3Kg7d1f9MNqU06/ptqwuKw==
X-Received: by 2002:a05:6512:ba1:b0:54d:69a3:6109 with SMTP id
 2adb3069b0e04-55342f54722mr2860653e87.8.1748925705801; 
 Mon, 02 Jun 2025 21:41:45 -0700 (PDT)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com.
 [209.85.167.53]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5533787d3desm1799253e87.35.2025.06.02.21.41.43
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Jun 2025 21:41:44 -0700 (PDT)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-54e7967cf67so6052214e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 02 Jun 2025 21:41:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXgcZh9DnYcdPR6unNsX5qY/Zeo9leegDRHCuJDXcNMieLDmsyvsieGp+kUoQku/jaFKOgE1WQBlUEyYQ==@st-md-mailman.stormreply.com
X-Received: by 2002:a2e:bea5:0:b0:32a:8c7a:8350 with SMTP id
 38308e7fff4ca-32a9ea675f3mr36137841fa.30.1748925703708; Mon, 02 Jun 2025
 21:41:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250602151853.1942521-1-daniel.lezcano@linaro.org>
 <20250602151853.1942521-4-daniel.lezcano@linaro.org>
In-Reply-To: <20250602151853.1942521-4-daniel.lezcano@linaro.org>
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 3 Jun 2025 12:41:31 +0800
X-Gmail-Original-Message-ID: <CAGb2v67qHKVGdNDmg_mbT-bkhAmn=NxQBsRZMtGgpdOGh6Z37w@mail.gmail.com>
X-Gm-Features: AX0GCFsButCX6XOPdUHg9gMIjlAItX_YWWR5mtXZWLyYajpbu0GEJNOaxHVxyxs
Message-ID: <CAGb2v67qHKVGdNDmg_mbT-bkhAmn=NxQBsRZMtGgpdOGh6Z37w@mail.gmail.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Nam Cao <namcao@linutronix.de>, Marco Elver <elver@google.com>,
 Will McVicker <willmcvicker@google.com>, Saravan Kanna <saravanak@google.com>,
 Samuel Holland <samuel@sholland.org>, Jim Cromie <jim.cromie@gmail.com>,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 Thierry Reding <thierry.reding@gmail.com>, John Stulz <jstultz@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-tegra@vger.kernel.org,
 tglx@linutronix.de, linux-sunxi@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v1 3/7] clocksource/drivers/sun5i: Add
	module owner
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
Reply-To: wens@csie.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gTW9uLCBKdW4gMiwgMjAyNSBhdCAxMToxOeKAr1BNIERhbmllbCBMZXpjYW5vCjxkYW5pZWwu
bGV6Y2Fub0BsaW5hcm8ub3JnPiB3cm90ZToKPgo+IFRoZSBjb252ZXJzaW9uIHRvIG1vZHVsZXMg
cmVxdWlyZXMgYSBjb3JyZWN0IGhhbmRsaW5nIG9mIHRoZSBtb2R1bGUKPiByZWZjb3VudCBpbiBv
cmRlciB0byBwcmV2ZW50IHRvIHVubG9hZCBpdCBpZiBpdCBpcyBpbiB1c2UuIFRoYXQgaXMKPiBl
c3BlY2lhbGx5IHRydWUgd2l0aCB0aGUgY2xvY2tldmVudHMgd2hlcmUgdGhlcmUgaXMgbm8gZnVu
Y3Rpb24gdG8KPiB1bnJlZ2lzdGVyIHRoZW0uCj4KPiBUaGUgY29yZSB0aW1lIGZyYW1ld29yayBj
b3JyZWN0bHkgaGFuZGxlcyB0aGUgbW9kdWxlIHJlZmNvdW50IHdpdGggdGhlCj4gZGlmZmVyZW50
IGNsb2Nrc291cmNlIGFuZCBjbG9ja2V2ZW50cyBpZiB0aGUgbW9kdWxlIG93bmVyIGlzIHNldC4K
Pgo+IEFkZCB0aGUgbW9kdWxlIG93bmVyIHRvIG1ha2Ugc3VyZSB0aGUgY29yZSBmcmFtZXdvcmsg
d2lsbCBwcmV2ZW50Cj4gc3R1cGlkIHRoaW5ncyBoYXBwZW5pbmcgd2hlbiB0aGUgZHJpdmVyIHdp
bGwgYmUgY29udmVydGVkIGludG8gYQo+IG1vZHVsZS4KPgo+IFNpZ25lZC1vZmYtYnk6IERhbmll
bCBMZXpjYW5vIDxkYW5pZWwubGV6Y2Fub0BsaW5hcm8ub3JnPgoKQWNrZWQtYnk6IENoZW4tWXUg
VHNhaSA8d2Vuc0Bjc2llLm9yZz4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
L21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
