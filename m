Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7077BFE1B
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Oct 2023 15:42:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9816DC6B442;
	Tue, 10 Oct 2023 13:42:06 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com
 [209.85.128.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 516BFC6A61D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Oct 2023 13:42:05 +0000 (UTC)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-5a7aaa73d55so17448557b3.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Oct 2023 06:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696945324; x=1697550124;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NHv90yeM59s0sxqLXofNmRkQi512BP/YIHCc5n2XRV8=;
 b=b4tqokhdyGbdgcGN3m77Cf+JmEJYX13vw2YAQ7eEO9g2Pn0ixPiL15lPxM8trU5wzy
 hMof+1EiILkqTMH6a1X9piyYN3hA+/PS3/Qdj4xpyvJXlwgnrliF7eF1fNwDNa1vBYEB
 4chTLl1Z6zIRWwM6U/Uf3N9KqRrlS5ie0T0ohySFOHXl21s9ane3xELZ61oitRhcy+zL
 O4E/Xiq8Ex5sMUH7Ptl8vz0hrRcKte2yAq0xidsO6/HpKd2dBh1g7FUX1/w9StDdPATO
 K+BlU0MghFnja2nNce0r+tjxtVwxDL5ZlN3jdDmYRbQiZEJb6fepsc8Um8VswgGg7x/y
 3joA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696945324; x=1697550124;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NHv90yeM59s0sxqLXofNmRkQi512BP/YIHCc5n2XRV8=;
 b=e8HbhfCHl6KBZVIMJY6Ojcl9g7DXWH/J76wOvQLLSiUYNGuQbqpwcQtAKRtMSxZrv4
 t4Wub6upJd5GmRpmW9s9RaP8OA2KtHjoxgn0b+UfB3VZmlUH/On1ohC/DYYSFo+X1APH
 EqpF8BJBjIyOJLkgDfeE8LX4TXQUtgW4ZgdgkZ+DTzEydCRjA2CX+k9/PULFrpA14On1
 Ol99K0IDXFtoDOVLBTAdbN/vLIrqJ1CpzwuiGQWdo94I0140XNyjLH1HOElVdZ9uOE8D
 0UCAX1V4OcugH4rBfJ+ld1AMM+CAQmwwOuHt3/Vms2WGrTioUnoB5Di32O9W1R+XS8I6
 LH6Q==
X-Gm-Message-State: AOJu0YxdkOrVqf+8nzkijpByZVIJy59IneF0D/4EBxDR7VLtPVJ4E2S8
 KwC3XxhwGYFsNnRpn9VXspL+F1ZjHZ7LFI+dvzA7mPAVFgLIXce5JEM=
X-Google-Smtp-Source: AGHT+IF+FivLbJd4h5mpjqzG+FT5BbTXGsJ47whw63Zw+xMaA2NAf3r/Y348qQo5sHuP8ewYt1oWPN8xfz+tY7NKyrI=
X-Received: by 2002:a0d:d9d6:0:b0:589:fc81:952e with SMTP id
 b205-20020a0dd9d6000000b00589fc81952emr18207196ywe.7.1696945324216; Tue, 10
 Oct 2023 06:42:04 -0700 (PDT)
MIME-Version: 1.0
References: <20231009083856.222030-1-u.kleine-koenig@pengutronix.de>
 <20231009083856.222030-14-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20231009083856.222030-14-u.kleine-koenig@pengutronix.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 10 Oct 2023 15:41:52 +0200
Message-ID: <CACRpkdaSWbamnTRtwp-Cj_tSVQBh6nUVmJN478rczEiFpUNLgg@mail.gmail.com>
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 13/20] pinctrl: stmfx: Convert to platform
 remove callback returning void
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

T24gTW9uLCBPY3QgOSwgMjAyMyBhdCAxMToyMuKAr0FNIFV3ZSBLbGVpbmUtS8O2bmlnCjx1Lmts
ZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+IHdyb3RlOgoKPiBUaGUgLnJlbW92ZSgpIGNhbGxi
YWNrIGZvciBhIHBsYXRmb3JtIGRyaXZlciByZXR1cm5zIGFuIGludCB3aGljaCBtYWtlcwo+IG1h
bnkgZHJpdmVyIGF1dGhvcnMgd3JvbmdseSBhc3N1bWUgaXQncyBwb3NzaWJsZSB0byBkbyBlcnJv
ciBoYW5kbGluZyBieQo+IHJldHVybmluZyBhbiBlcnJvciBjb2RlLiBIb3dldmVyIHRoZSB2YWx1
ZSByZXR1cm5lZCBpcyBpZ25vcmVkIChhcGFydAo+IGZyb20gZW1pdHRpbmcgYSB3YXJuaW5nKSBh
bmQgdGhpcyB0eXBpY2FsbHkgcmVzdWx0cyBpbiByZXNvdXJjZSBsZWFrcy4KPgo+IFRvIGltcHJv
dmUgaGVyZSB0aGVyZSBpcyBhIHF1ZXN0IHRvIG1ha2UgdGhlIHJlbW92ZSBjYWxsYmFjayByZXR1
cm4KPiB2b2lkLiBJbiB0aGUgZmlyc3Qgc3RlcCBvZiB0aGlzIHF1ZXN0IGFsbCBkcml2ZXJzIGFy
ZSBjb252ZXJ0ZWQgdG8KPiAucmVtb3ZlX25ldygpLCB3aGljaCBhbHJlYWR5IHJldHVybnMgdm9p
ZC4gRXZlbnR1YWxseSBhZnRlciBhbGwgZHJpdmVycwo+IGFyZSBjb252ZXJ0ZWQsIC5yZW1vdmVf
bmV3KCkgd2lsbCBiZSByZW5hbWVkIHRvIC5yZW1vdmUoKS4KPgo+IFRyaXZpYWxseSBjb252ZXJ0
IHRoaXMgZHJpdmVyIGZyb20gYWx3YXlzIHJldHVybmluZyB6ZXJvIGluIHRoZSByZW1vdmUKPiBj
YWxsYmFjayB0byB0aGUgdm9pZCByZXR1cm5pbmcgdmFyaWFudC4KPgo+IFNpZ25lZC1vZmYtYnk6
IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+CgpQYXRj
aCBhcHBsaWVkLgoKWW91cnMsCkxpbnVzIFdhbGxlaWoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0
bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
