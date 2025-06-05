Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 820C6ACEFBD
	for <lists+linux-stm32@lfdr.de>; Thu,  5 Jun 2025 14:58:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4B003C32EB5;
	Thu,  5 Jun 2025 12:58:46 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 69D51C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Jun 2025 12:58:45 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-55324587a53so2050714e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 05 Jun 2025 05:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749128324; x=1749733124;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5F4J5fsk2zo51ye5xZxurgvmXqAk6TLsSVJ4G+IBpes=;
 b=pUhcmS44k8QNkCD9JpHrIeuuw4SliWcYHROQLlH/wfd3sfJ/zIufmEzGyTS3JGgtJZ
 eu0Oa1j9tr4zwsgC94SxPUtHVv+IcA0O8Nvhq/B8d9iwi3LrpZsXHvlG7lXzmUtnOUY8
 s3i9cwYWhG6atbL5SRKv/m6BIL3cvgNqH512Uh4ydJgwoesWcbs+JXoU4VyFT2Sg8dr5
 gCzP3qwsnjZh0Yg7ejCBTddxWhS19M6ecrLsJ2YaVO2TTz/FtzY5qrQOs0FPtQMs9mxa
 Z0Rgvle2z7Won6oP3A0FcLqRhfXrsEkKZt2h6XSMZ8VMLXbQoIusKgs4KPaEi8g1Mz0H
 ukwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749128324; x=1749733124;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5F4J5fsk2zo51ye5xZxurgvmXqAk6TLsSVJ4G+IBpes=;
 b=B3iNueJgcfMGJZHIdfbFoTjwTwWcTGvlD/TNwokIB5wOv3hoc0PTbYY+uUFh4J5XBM
 4Wf0shHpKS8mzX1EMT2l9wQaCrz0v40OGx17BMlhmJgVVnYitWxkiV3KUc976ilyliKc
 q5NYn0Q2hfdurgzT0yUrUD8ddMBnECv9a74XRj+uGK9xgYwPHBZogokGg2DB3jmSHM8W
 llROIb6f2qRg2WU9WR1iM0qjZLzs94uQ6w2FpRZ/SukKE5Xm3GfvvzRarAOHapWHWOv8
 6Z8zbqB7w9j8v/XWwQ4AkSquQ8r3sBdnizLMIvUschnNw/hM8BfSMQBQtPZO6VEPC0Zw
 svcw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwjCt9Qp6GQ3pGRz1CQrL8NMtaC9gsiEYzlCAK3ONnQtzXHJgm2wIrCpCiCJL3MzOW4I+FterSG86ifQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxjjhLiJgr5SobouvuBWuICNIpe96Xullca7Xj5kOMeHSeshGiO
 WmiHx604bGJmxy3m63L3TX/TAUFH7qjx23Zpw0wMbEqaofNgciLBtehHpPssDKKvOvAgjQ/KNPN
 0lFj0zDJGG8tydmZM7c6yqBrPU/kghfLFPu30adHD0A==
X-Gm-Gg: ASbGncvw7C21blMPHJQplYWhzKTccpMfRp+d8PGPcmY0OBLi4g4U51kmvxgUY9unUjq
 5WQ+rwYmTct1Q4/1hbKBSt6e2hkBzWTi1N7fTBy+rvf1EGN9ZhxtaXuYnwsvlhCGbqpYrloQsjb
 kbKW/7dXh33Gy0U+/3s3qmjnm+RxuVJ9xQ
X-Google-Smtp-Source: AGHT+IGlsLgaz+OzrX7gChqfwNLu6aN4e02li+U7R1p+y1C1vMiENS7zjDEUb53JJ0ECcJmO7Mh9wmCUqhcTsFjS6Gc=
X-Received: by 2002:a05:6512:234e:b0:553:2308:1ac5 with SMTP id
 2adb3069b0e04-5535d8f54e2mr916430e87.4.1749128324545; Thu, 05 Jun 2025
 05:58:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250523-hdp-upstream-v3-0-bd6ca199466a@foss.st.com>
 <20250523-hdp-upstream-v3-1-bd6ca199466a@foss.st.com>
In-Reply-To: <20250523-hdp-upstream-v3-1-bd6ca199466a@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 5 Jun 2025 14:58:33 +0200
X-Gm-Features: AX0GCFvp2kYXQryODv4yaq3ufj5OHSvi6P7gagdyzXCjgZwqYR5kV58IYRzsLbE
Message-ID: <CACRpkdYz5BaoTfG+y84Y=HQUxdSberU3qnaWDmv2=Fk8zcbm1Q@mail.gmail.com>
To: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 1/9] gpio: mmio: add BGPIOF_NO_INPUT
	flag for GPO gpiochip
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

T24gRnJpLCBNYXkgMjMsIDIwMjUgYXQgMjo0MOKAr1BNIENsw6ltZW50IExlIEdvZmZpYwo8Y2xl
bWVudC5sZWdvZmZpY0Bmb3NzLnN0LmNvbT4gd3JvdGU6Cgo+IFdoZW4gdXNpbmcgYmdwaW9faW5p
dCB3aXRoIGEgZ3Bpb2NoaXAgYWN0aW5nIGFzIGEgR1BPIChvdXRwdXQgb25seSksIHRoZQo+IGdw
aW9jaGlwIG9wcyBgZGlyZWN0aW9uX2lucHV0YCB3YXMgc2V0IHRvIGBiZ3Bpb19zaW1wbGVfZGly
X2luYCBieQo+IGRlZmF1bHQgYnV0IHdlIGhhdmUgbm8gaW5wdXQgYWJpbGl0eS4KPgo+IEFkZGlu
ZyB0aGlzIGZsYWcgYWxsb3dzIHRvIHNldCBhIHZhbGlkIG9wcyBmb3IgdGhlIGBkaXJlY3Rpb25f
b3V0cHV0YAo+IG9wcyB3aXRob3V0IHNldHRpbmcgYSB2YWxpZCBvcHMgZm9yIGBkaXJlY3Rpb25f
aW5wdXRgIGJ5IGRlZmF1bHQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMZSBHb2ZmaWMg
PGNsZW1lbnQubGVnb2ZmaWNAZm9zcy5zdC5jb20+CgpUaGF0J3MgYSBnb29kIHNvbHV0aW9uLgpS
ZXZpZXdlZC1ieTogTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPgoKWW91
cnMsCkxpbnVzIFdhbGxlaWoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21h
aWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
