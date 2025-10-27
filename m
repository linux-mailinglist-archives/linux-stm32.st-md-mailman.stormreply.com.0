Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 61394C11A5A
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Oct 2025 23:16:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2132BC628AA;
	Mon, 27 Oct 2025 22:16:31 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B06D0C628A5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Oct 2025 22:16:29 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-378e603f7e4so43292221fa.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Oct 2025 15:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761603389; x=1762208189;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Zc9UIv9/MZ8vS/A9E/+9Rzg7ZN5v4cfKPUZNZPqRWGI=;
 b=eQxLIvpWPz0OOe3xejY7VtsD8p9CKUIivwg9n2A8ww7sqodlehjVvt9OucDrERDlKo
 ktBIL1ya88HZS2ApupQA0RsqfkTH6kGfCtqiALTIc23QcOpUaW5nR2S0oACltmUtwnaT
 tcM83apITYdSK7l+PeJX9W6ZT9RsOKlheeIj+lVjZuIrcPQifa5GMlRQQPlQysq2mMNY
 ryg895M7/8aSyS4WES/8pu6OeD9JIvKYOYnQCziSxeWwgMOw5CZ1uxgrQJHLL6spGDsi
 qJYcC1C/AfISiW8lmAQGKCcYDVcu9xHsre3Q5NGxFP18SGDKJ+FMemOlK5rJX8W5v1V9
 cDjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761603389; x=1762208189;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Zc9UIv9/MZ8vS/A9E/+9Rzg7ZN5v4cfKPUZNZPqRWGI=;
 b=VKfKHs7AQA686opRx+iSTYjlcMWlDc1SPrfngwZB4E0+qWEcoYZcTHRRZtv8TCyz9k
 woJQyhF1fQxpEDmJQEo8MtTWBruaQq+PcQ/UfjMBFJhT9nEGDNj4ErEOrypVsz+373mJ
 vew4q64eyO1lacPHPEMCdvh0dNazht8q//2Cy4kS1o+/s786y/3qrZL9NJlMAo6uBGUa
 eLvY4oY0+73ic7Vqb61l9DBmy6x+uxYjRTHLhoTzq3oqStr1vzlN3MU1kVnaxxM13dNj
 0l51gnF/8EUKGQVGpxlinBmQ6h89GC+Khb7McVXydiXrDxi039FA7LPIhaDIOYGrChMu
 8/GA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMcOM6il5eSNNmgU9gHCW6mmQGsymqEKn7BhDW+rLE/SJ2thPcf+6iV+WbYeyuV/83Xawhw6zFJd3HHA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw6W2h3daSBoVOXQwyj0h0xNxbRlhi8vatphqyZUcvY/+PzZ4Ns
 j3IfQYehr5vnU02nFqjFlRHSXOEn3Vh+L9xnPONRdzliinCJacY7Wjf3aFdYUt0k/edTDZmj8fI
 yRtETxzktBKqpnpGFFOxqnQ0SYyMHs4XGNVp8zLTn+A==
X-Gm-Gg: ASbGncuvadGixNp2SUfINM9IlxiY8T3ORsuX2M6XaOZX3pQr6e3+q0bnclpAbX9GMFN
 IUekiriMgcoaJUcvuv+UOlF1wVZUppWUM062D3J7EFdiBeVjIq9EO8LrCHoIrQTTWOuDnhHElLm
 s2gMcKrHJMt0PZMP4zWv6cQuSW2kWk28B+QuT9UMWAYIffi2jAWEF/Vckx3Zr2lr9fW4lGRbF5v
 GOeus7TpTc1vNKxDEdIzOfjsP/e4dBZOWHgdlhYS9p0u5kKH13bP9D4jQGT
X-Google-Smtp-Source: AGHT+IFA8HV2G/sHhNwZvEShaiZsTM+MMwIFC3kj57n0Kcgm/A/zFAgZaU2xFGY5jATvp1YPW4KS9FCoawvfscRyh9U=
X-Received: by 2002:a05:651c:25d7:20b0:378:d690:5d96 with SMTP id
 38308e7fff4ca-379076a9b61mr3296741fa.8.1761603388859; Mon, 27 Oct 2025
 15:16:28 -0700 (PDT)
MIME-Version: 1.0
References: <20251023132700.1199871-1-antonio.borneo@foss.st.com>
 <20251023132700.1199871-12-antonio.borneo@foss.st.com>
In-Reply-To: <20251023132700.1199871-12-antonio.borneo@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 27 Oct 2025 23:16:17 +0100
X-Gm-Features: AWmQ_bmBzMCqn0FgOeFfQ7QhGc6mfzGjYtXO83EFE5z1zNwN1wCq6PGHLCzury8
Message-ID: <CACRpkdY-e=KT+nOaVNaEB3nFkXTrZeJ7e47LLzD46xsfzm63sA@mail.gmail.com>
To: Antonio Borneo <antonio.borneo@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Christophe Roullier <christophe.roullier@foss.st.com>
Subject: Re: [Linux-stm32] [PATCH v4 11/12] dt-bindings: pinctrl: stm32:
 Support I/O synchronization parameters
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

T24gVGh1LCBPY3QgMjMsIDIwMjUgYXQgMzoyN+KAr1BNIEFudG9uaW8gQm9ybmVvCjxhbnRvbmlv
LmJvcm5lb0Bmb3NzLnN0LmNvbT4gd3JvdGU6Cgo+IERvY3VtZW50IHRoZSBzdXBwb3J0IG9mIHRo
ZSBJL08gc3luY2hyb25pemF0aW9uIHBhcmFtZXRlcnM6Cj4gLSBza2V3LWRlbGF5LWlucHV0LXBz
Owo+IC0gc2tldy1kZWxheS1vdXRwdXQtcHM7Cj4gLSBzdCxpby1zeW5jLgo+Cj4gRm9yYmlkICdz
a2V3LWRlbGF5LWlucHV0LXBzJyBhbmQgJ3NrZXctZGVsYXktb3V0cHV0LXBzJyB0byBiZSBib3Ro
Cj4gcHJlc2VudCBvbiB0aGUgc2FtZSBwaW4uCj4gQWxsb3cgdGhlIG5ldyBwcm9wZXJ0aWVzIG9u
bHkgd2l0aCBjb21wYXRpYmxlcyB0aGF0IHN1cHBvcnQgdGhlbS4KPiBBZGQgYW4gZXhhbXBsZSB0
aGF0IHVzZXMgdGhlIG5ldyBwcm9wZXJ0aWVzLgo+Cj4gQ28tZGV2ZWxvcGVkLWJ5OiBGYWJpZW4g
RGVzc2VubmUgPGZhYmllbi5kZXNzZW5uZUBmb3NzLnN0LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBG
YWJpZW4gRGVzc2VubmUgPGZhYmllbi5kZXNzZW5uZUBmb3NzLnN0LmNvbT4KPiBTaWduZWQtb2Zm
LWJ5OiBBbnRvbmlvIEJvcm5lbyA8YW50b25pby5ib3JuZW9AZm9zcy5zdC5jb20+CgpQYXRjaCBh
cHBsaWVkIQoKWW91cnMsCkxpbnVzIFdhbGxlaWoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMy
QHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
