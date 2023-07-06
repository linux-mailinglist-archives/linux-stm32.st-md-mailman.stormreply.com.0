Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5B074A605
	for <lists+linux-stm32@lfdr.de>; Thu,  6 Jul 2023 23:42:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ED5EEC6B45B;
	Thu,  6 Jul 2023 21:42:41 +0000 (UTC)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com
 [209.85.219.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 095FDC04B10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Jul 2023 21:42:39 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id
 3f1490d57ef6-c4dd264359cso1264012276.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 06 Jul 2023 14:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688679759; x=1691271759;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+0rENF/WeQpydVVWV122fwfebKo12jRQ+NnRzPzQpr8=;
 b=W/SqLqzt3wFk2cSOkuV+T+EczeUwl3oqInbbKRlT4oXgXFrFobMBlM88wjGhpBU253
 svEE5aOAjYqWkryCcUlYCJuW/m+di6FIaiJdkPSLXboETkhHC3BqRDKKtq5bJ+z2BQAX
 tDRwXpY2Zu8qlvHrtOjOLSelcVKmsuZzTuHdm7lS3OG7eM9MV8j4FMWUa9k76kaFjp4l
 wTkR+KszaKH45YQVXRN0pki6hALtHmL2LxxUYcW8xQ8wZxekpk7FpjKP1bU83cyW7mgg
 7E+XipZ1JacoQzxN0opR0dm1UCUR98tPuw1W2nAmN68HRALf7+hWg4az4Y7dGQ8+p5ya
 pbjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688679759; x=1691271759;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+0rENF/WeQpydVVWV122fwfebKo12jRQ+NnRzPzQpr8=;
 b=Xn0WJaMBCwMkO7EjKVPh9TroINu2/pzo8SxJqMpBgvYo+zZXEQ03hEKJ3sI6tBSKhB
 2e65l8fzUoeUZ04JtWNI8JZd79hHC1ShvWaQY6RA1i5CXVMjwXb+BWqJIJtbH4oARuVo
 9Oi9gmLm2dZNTU455F677h176PzJ+ELlD8s0JliwE2y9w9mRUa09h1lXTP/yytAoFiOj
 dJYv+8gZ+1UhgC1mYNBhCI+TSh91zoCL5Jz6ac/d7cW521fC3fnWLNITfd7/bwAzCk6w
 ojDt/K5USSSeukIHzXgbhF68eeD2G1xPxK7pV3hzo1hC6MKG56oaL7iA4z3Yg7EExNAi
 cksA==
X-Gm-Message-State: ABy/qLYJO+WGmPExhUi9xj3I7soTEvpm17781mTjHyYIj5LFeMOWtCUs
 bT7Rv6maAwd/HGFTXxwZvW1omIFkiKu56/igPjihnA==
X-Google-Smtp-Source: APBJJlEAXANJaCshopEoGTyGyT4USXSJCsyd2uuiYqc82UYDe7R2DDGSeNcDz1Nv2iylOJfJTRv7yTcuFYW4NiENZ/k=
X-Received: by 2002:a25:6085:0:b0:c18:1300:6339 with SMTP id
 u127-20020a256085000000b00c1813006339mr2997998ybb.52.1688679758872; Thu, 06
 Jul 2023 14:42:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230706073719.1156288-1-thomas.bourgoin@foss.st.com>
 <20230706073719.1156288-7-thomas.bourgoin@foss.st.com>
In-Reply-To: <20230706073719.1156288-7-thomas.bourgoin@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 6 Jul 2023 23:42:27 +0200
Message-ID: <CACRpkdaF59sJQMc9ZuEM=YFJPaw-oAmvt=s4GYjchEGWQ=yWCw@mail.gmail.com>
To: Thomas BOURGOIN <thomas.bourgoin@foss.st.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Rob Herring <robh+dt@kernel.org>, linux-crypto@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 6/7] crypto: stm32 - fix MDMAT condition
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

T24gVGh1LCBKdWwgNiwgMjAyMyBhdCA5OjM54oCvQU0gVGhvbWFzIEJPVVJHT0lOCjx0aG9tYXMu
Ym91cmdvaW5AZm9zcy5zdC5jb20+IHdyb3RlOgoKPiBGcm9tOiBUaG9tYXMgQm91cmdvaW4gPHRo
b21hcy5ib3VyZ29pbkBmb3NzLnN0LmNvbT4KPgo+IElmIElQIGhhcyBNRE1BVCBzdXBwb3J0LCBz
ZXQgb3IgcmVzZXQgdGhlIGJpdCBNRE1BVCBpbiBDb250cm9sIFJlZ2lzdGVyLgo+Cj4gRml4ZXM6
IGI1NjQwM2EyNWFmNyAoImNyeXB0bzogc3RtMzIvaGFzaCAtIFN1cHBvcnQgVXg1MDAgaGFzaCIp
Cj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIEJvdXJnb2luIDx0aG9tYXMuYm91cmdvaW5AZm9zcy5z
dC5jb20+CgpPb3BzIHByb2JhYmx5IG15IGZhdWx0LgpSZXZpZXdlZC1ieTogTGludXMgV2FsbGVp
aiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPgoKVGhpcyBzaG91bGQgcHJvYmFibHkgYmUgYXBw
bGllZCBmb3IgZml4ZXMvc3RhYmxlLgoKWW91cnMsCkxpbnVzIFdhbGxlaWoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBs
aXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
