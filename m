Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F58966CAD
	for <lists+linux-stm32@lfdr.de>; Sat, 31 Aug 2024 00:48:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 58050C6C841;
	Fri, 30 Aug 2024 22:48:57 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 934D3C6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Aug 2024 22:48:50 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-2f3f0bdbcd9so26912511fa.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Aug 2024 15:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725058130; x=1725662930;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JYUyqjMtyPycxjQHE/amwVFlyjc6VQU5XnqwL5FD0Mw=;
 b=nyhzuWSxbbh5hlXurOyQnagjgDNQDtcDjvj1A4s6KuB4yhOXsPkOIk6siE97SK/3nv
 r03oejDDZz8uAtYTw0xibi23U1IyMh4v3pPwDMsrf0SS/pKKCtz6s2EdB4du0C2qGWbk
 aVl4zhtwBl6MFk2D2eCMX3ypBAwEr1mehdoR5V+WBI4N3B0voQ1z5DiU/YN/B5trmwaf
 Rt5Ew+MJUrF4vNL9fCre+AWvaBx/mEaeF7j1y9AsBYKojPFstauWBO8g3Or+J13gvbia
 3lhPjtYZeDmTScQJhZFpG/wJ4Wg1kr3+51PKPH+28QssDOW99QGRkk4RvfENpQ6UhjCG
 tktw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725058130; x=1725662930;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JYUyqjMtyPycxjQHE/amwVFlyjc6VQU5XnqwL5FD0Mw=;
 b=lI38in6UGxwp3AAW1wG/qsi4YSobzN/WWiPNVLsqKABL7iNMF5jZphNNFGcDP3yMar
 FcezmZe8HbY6x9ArltALag3WZnU9ajMXx3XYcYbxlX8+Fzhi4qoasZYON2vaNF3PRk2F
 Z6IR53vLCcJKGpYfLVjeLbw8c9+NYstYt08Wt1K6hnYOc+/Ab0TldZAIN7runS7dMoCZ
 tkSPqtLP4ox4Oey7szm/pp3tgNTwwqa5iqkFoBMHTFgG6uZJRktFbA0V3i8v2KLnRblp
 N20DhhQ98eC35mMyGZGKux1/kYKMbBpdr9tKv3hGn3Z3v/9UHfSs76MoyqOlebaoK2ME
 KHjA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHfCczNUli6wMnKUnHXqEpScz2WyMfbqy2zknoDK3t61CP09nm+dAYdn+m0jQbElMfzfZsKgRcWKPVEw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yxb6H8gwKAh21x8HPTG58vcvQqENE7XzL4NafrBYV9sHQx6ET6Z
 /Mg3kpAcUBq0oIxVN8+cXl0uG6BB+HPpXXow2V3qFYLxHMwJxhwOhGHWXvH5ifHqQan1dlcRn6S
 d1+v9ZhYJV2oXy/cj82217ZLJ2lQvrnqwIdHf1g==
X-Google-Smtp-Source: AGHT+IHb8yYNqKvXobOLtm71pbJH/2OmtII9Yv4T1KNsEkIknUIBZXanlwk7I6MTZZWDZYu7FBbkwa/j8sqao3IiWt4=
X-Received: by 2002:a05:6512:1294:b0:534:36bf:b622 with SMTP id
 2adb3069b0e04-53546bc7f40mr1908506e87.61.1725058129075; Fri, 30 Aug 2024
 15:48:49 -0700 (PDT)
MIME-Version: 1.0
References: <20240829131051.43200-1-shenlichuan@vivo.com>
In-Reply-To: <20240829131051.43200-1-shenlichuan@vivo.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 31 Aug 2024 00:48:38 +0200
Message-ID: <CACRpkdYhi1syb+-PO41q18=rU0aykgNKzg2j7zmGQyH6Vbjqgg@mail.gmail.com>
To: Shen Lichuan <shenlichuan@vivo.com>
Cc: opensource.kernel@vivo.com, brgl@bgdev.pl, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v1] gpio: stmpe: Simplify with
	dev_err_probe()
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

T24gVGh1LCBBdWcgMjksIDIwMjQgYXQgMzoxMeKAr1BNIFNoZW4gTGljaHVhbiA8c2hlbmxpY2h1
YW5Adml2by5jb20+IHdyb3RlOgoKPiBVc2UgZGV2X2Vycl9wcm9iZSgpIHRvIHNpbXBsaWZ5IHRo
ZSBlcnJvciBwYXRoIGFuZCB1bmlmeSBhIG1lc3NhZ2UKPiB0ZW1wbGF0ZS4KPgo+IFVzaW5nIHRo
aXMgaGVscGVyIGlzIHRvdGFsbHkgZmluZSBldmVuIGlmIGVyciBpcyBrbm93biB0byBuZXZlcgo+
IGJlIC1FUFJPQkVfREVGRVIuCj4KPiBUaGUgYmVuZWZpdCBjb21wYXJlZCB0byBhIG5vcm1hbCBk
ZXZfZXJyKCkgaXMgdGhlIHN0YW5kYXJkaXplZCBmb3JtYXQKPiBvZiB0aGUgZXJyb3IgY29kZSwg
aXQgYmVpbmcgZW1pdHRlZCBzeW1ib2xpY2FsbHkgYW5kIHRoZSBmYWN0IHRoYXQKPiB0aGUgZXJy
b3IgY29kZSBpcyByZXR1cm5lZCB3aGljaCBhbGxvd3MgbW9yZSBjb21wYWN0IGVycm9yIHBhdGhz
Lgo+Cj4gU2lnbmVkLW9mZi1ieTogU2hlbiBMaWNodWFuIDxzaGVubGljaHVhbkB2aXZvLmNvbT4K
ClJldmlld2VkLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+CgpZ
b3VycywKTGludXMgV2FsbGVpagpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20v
bWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
