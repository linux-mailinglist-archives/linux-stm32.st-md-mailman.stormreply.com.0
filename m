Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E6D6FAFD1
	for <lists+linux-stm32@lfdr.de>; Mon,  8 May 2023 14:22:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D3C1AC6904E;
	Mon,  8 May 2023 12:22:57 +0000 (UTC)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com
 [209.85.219.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 88ED4C65E60
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 May 2023 12:22:56 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id
 3f1490d57ef6-b9a6eec8611so24651184276.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 08 May 2023 05:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683548575; x=1686140575;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vo9ugVDZ3LWs9Bp7l5nNn9C7ow6+Gul+tAX6b+8R+3k=;
 b=Y5FGjUgiDJpsJNGmAYrAAipTXP2nQzzu6RRb7B6ceiuMiSSruzoPtDkIPzI3G+ORm4
 QrVziRakigRKtGQKP5cVIlt4X6RRFrJtCcvpiaGuoCqW6fid0ZHK3BQt9SSQ+UNC4VFM
 WMxWAr8yMoh0Lnz+QVJWtSwalalL68YkCkzsB2Xu247bTrnsSLbervot614Egr6YehVZ
 tML/cECJ1eWzfqiphTEXElnLnLGRqOKCtc9WEeRYa+YRtRgoDdhVlkGFjBIcxw7XJ/m9
 P/qNVnk0l0icoe2S4Y/9cv8lnL48dVTcRI9gczIN4RKWvVRtTSaeO7JLIvaPb8HTjmAi
 2dBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683548575; x=1686140575;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vo9ugVDZ3LWs9Bp7l5nNn9C7ow6+Gul+tAX6b+8R+3k=;
 b=hX1BaGJC8KP3qFaoHwJaOru9fQNbQKx3nzNWSIQCpWPdhZMR7fQ+twbqPSWLLwTtej
 cfWsngF7gu5760RsCXsuweUvqh7DopoHfloHWdTyhW8s7+VkNGRFdDTlr9MxMOlTQ40S
 hUurfjz0AVhDA/l6f+PDAn2Ki2owT/Qc4hQISzXScPwJCkeIIrZaaVk5gzt00rPv/anW
 KsIW+H0CsqGdU8BW7hDTM0d0YDAWpUK0fC1cqki94rarUJelIYAbaDJH6hHBVYT04E1s
 dNGLvghncluYVPTq7urQBUYuUEfHVExp4VXwt1hYyJEGpw8Lvkgt2ZDo7oO8af7aX4dV
 g3rA==
X-Gm-Message-State: AC+VfDyszLb5drkhoQpyoOiEBgxQhV203XF6KufL4iMWVe1nNqKt/0lk
 avFU7eGWRLZMTNJ0uyJpXYDALVNTH8zFbU1ghRG9MA==
X-Google-Smtp-Source: ACHHUZ5St0RPuW2qGXSwhP1XWjDzIlC4kb3e/Mcd1xXIdae5y2Sn7WY7nRQZWD4VdnoGxGA1DYPy+fCe4Nat9Xa5n1s=
X-Received: by 2002:a25:51c7:0:b0:b9a:867b:462a with SMTP id
 f190-20020a2551c7000000b00b9a867b462amr12546796ybb.7.1683548575384; Mon, 08
 May 2023 05:22:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230426-stmpe-dt-bindings-v3-0-eac1d736e488@linaro.org>
 <a34b7181-e635-7fcc-2684-e1ee2efe7096@linaro.org>
In-Reply-To: <a34b7181-e635-7fcc-2684-e1ee2efe7096@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 8 May 2023 14:22:44 +0200
Message-ID: <CACRpkdZnkYizz0-g2sB3r8YQaDGgFNw=W3_bH-1wHAwT85fttw@mail.gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Lee Jones <lee@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Stefan Agner <stefan@agner.ch>,
 linux-kernel@vger.kernel.org,
 Philippe Schenker <philippe.schenker@toradex.com>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-input@vger.kernel.org, Rob Herring <robh@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 0/2] STMPE device tree bindings
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

T24gTW9uLCBNYXkgOCwgMjAyMyBhdCAxMTozOeKAr0FNIEtyenlzenRvZiBLb3psb3dza2kKPGty
enlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4gd3JvdGU6Cj4gT24gMDcvMDUvMjAyMyAyMzox
OSwgTGludXMgV2FsbGVpaiB3cm90ZToKCj4gPiBUaGlzIGFkZHMgdGhlIG1pc3NpbmcgR1BJTyBi
aW5kaW5ncyBmb3IgdGhlIFNUTVBFIHBvcnQgZXhwYW5kZXIKPiA+IGFuZCBjb252ZXJ0cyB0aGUg
ZXhpc3RpbmcgTUZEIGJpbmRpbmcgdG8gWUFNTC4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBMaW51
cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+Cj4gPiAtLS0KPiA+IENoYW5nZXMg
aW4gdjM6Cj4gPiAtIFVwZGF0ZSB0byByZXZpZXcgZmVlZGJhY2sKPiA+IC0gQ29sbGVjdGVkIHNv
bWUgYWNrL3JldmlldyB0YWdzCj4gPiAtIEkgZ3Vlc3MgQmFydG9zeiBzaG91bGQgYXBwbHkgMS8y
IGFuZCBMZWUgc2hvdWxkIGFwcGx5IDIvMi4KPiA+IC0gTGluayB0byB2MjogaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvci8yMDIzMDQyNi1zdG1wZS1kdC1iaW5kaW5ncy12Mi0wLTJmODVhMWZmZmNk
YUBsaW5hcm8ub3JnCj4KPiAyLzIgZGVwZW5kcyBvbiAxLzIsIHNvIGl0IG11c3QgZ28gdmlhIG9u
ZSB0cmVlLgoKQWggeW91J3JlIHJpZ2h0LiBJIGhvcGUgTGVlIGNhbiB0YWtlIGl0IGFsbCB0aGVu
LiBPciB0aGUgRFQgdHJlZS4KCllvdXJzLApMaW51cyBXYWxsZWlqCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApM
aW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
