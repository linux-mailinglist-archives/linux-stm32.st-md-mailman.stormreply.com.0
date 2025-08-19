Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A7478B2C49B
	for <lists+linux-stm32@lfdr.de>; Tue, 19 Aug 2025 15:06:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6AB29C3F945;
	Tue, 19 Aug 2025 13:06:30 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 07616C36B18
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Aug 2025 13:06:28 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-55ce5284d63so4724046e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Aug 2025 06:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755608788; x=1756213588;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eD1gZysHH3Kbz+8Qw6JjzfoRuZbWl8/jLJiaW7ypQ5s=;
 b=mFBvdPie9HIo9WNQE3erwCAOmabyqBQRCJL/Zm9fa4IfEnn/eU13ErlRD0cakuuIMe
 gueyxPLFqdWB2UjFAxQgBfM7enhWrx5cRoFlM1d58JSOwxgYrwiuUYZ/rTSRvk5uJ7kS
 mwKPaywCECm0k31/ouoS9c5Rpa8lyAucHkwIpZcKN19R1dLLhqgtAMDae1YAfx9CxZNl
 sEuyoQzf0vKidWuuyBfJ72VCV7nbV1GSuPtfTfE7uQ9MRIc7rst/pYtvXXYSvLoLiZY4
 ylKrhyNppBkHnMDBGEJ1MFMOZ+uElWp8cbvQQ/GU7ZfKxayXobM0WEWjrfCZn0gn9SaV
 VBuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755608788; x=1756213588;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eD1gZysHH3Kbz+8Qw6JjzfoRuZbWl8/jLJiaW7ypQ5s=;
 b=WqbtO2NuoOgPSECHFD6Vw42f+OSWo03nplf0Ug+ob7VKHFqcSkResB5GDCUbl4YYjy
 zalk29zMPGSfjXKVpCSvzx/1mI94BK2cvm7bqbOgYzjraHq3UqQ/41FWGti2MEYZmiWl
 UPEaqjtDILNZiZuRRTElQqu6wK9+m701CKa2V3pjB82BR2YVqUYqV4SwGwcAL3kn201i
 3NjFBlSr6NeJr0e3a9Rp8J0nTMaecv6+/qVCHUq33V3ZBA/y1HgiOP/BiFi57DPZrePw
 Vw7o8SEESEODGokCM3Rfih3jd3XR4/woLcpepkndJwv7tT1rpX2yTSYGnkTI1YiuoGk9
 Zi3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxa6jSe4QGBr160Ec3mtCNOo6iw9f7B0N6Xb6FQrlTbxtLp1/3eZIDR78vO9aiKvWyuRDOV7ZJxK/LRw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzsmYkgX1X2YC8nVf1Yn2jObxnz1oFytKYv/LdlCPhqlAxFh0ya
 SqWnZ5FfhA7B2asIC3piz3hSZ/tvlKNNNMsvoKW4T8lID5RgAMjqZ8x8E8ZC3umXRvL5J4DAP1v
 oTo2f+U8YCrUoza0fTlMawSql/hJ9kxukQdGW8MJUew==
X-Gm-Gg: ASbGnctJXAPrgxFtQaEDnlv8qHb2VQUXQZI8Y+wW4esKf4zM2MPOAy/JK/wmsqKTzZk
 5Z1w5TOkS0ouwVCrtTXCRW2TUqjCrvBnTFYy+3P7xaV8omtsWh0TJHtZhBk/iiuPzIaCaj/YKBU
 XYUyq4Q+OaY49qkGHxKuYKP521fRJUOXfeoCA4qHcybL3KBhWL3ekztcokqsya2+WSJGuQg9PIr
 23XHHIRlz8S
X-Google-Smtp-Source: AGHT+IHuZ1v8yqv5nFpHB3upOq5k48bLEGZvcHQzbQtjR6KTrGahQ6hImQ+OMjokOiyokuX8aJCwdENgo4zYpJr/r7I=
X-Received: by 2002:a05:651c:2208:b0:32b:9792:1029 with SMTP id
 38308e7fff4ca-335317cd294mr8926241fa.14.1755608787940; Tue, 19 Aug 2025
 06:06:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250818142402.132008-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250818142402.132008-2-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 19 Aug 2025 15:06:16 +0200
X-Gm-Features: Ac12FXywhv2FGXVaL5z9CRtgqv32XD-L-_xhhK3a7EL-XoMsHmHhIPyxRqHeipY
Message-ID: <CACRpkdbdTHg8Bn5L2Jc33=qTohD7aVAHuv1P0H2x7jxciojzLQ@mail.gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] pinctrl: stm32: Constify static
	'pinctrl_desc'
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

T24gTW9uLCBBdWcgMTgsIDIwMjUgYXQgNDoyNOKAr1BNIEtyenlzenRvZiBLb3psb3dza2kKPGty
enlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4gd3JvdGU6Cgo+IFRoZSBsb2NhbCBzdGF0aWMg
J3N0cnVjdCBwaW5jdHJsX2Rlc2MnIGlzIG5vdCBtb2RpZmllZCwgc28gY2FuIGJlIG1hZGUKPiBj
b25zdCBmb3IgY29kZSBzYWZldHkuCj4KPiBTaWduZWQtb2ZmLWJ5OiBLcnp5c3p0b2YgS296bG93
c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+CgpQYXRjaCBhcHBsaWVkIQoKWW91
cnMsCkxpbnVzIFdhbGxlaWoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21h
aWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
