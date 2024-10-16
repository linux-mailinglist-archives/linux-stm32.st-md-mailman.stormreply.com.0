Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C549A123D
	for <lists+linux-stm32@lfdr.de>; Wed, 16 Oct 2024 21:04:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EBE32C78032;
	Wed, 16 Oct 2024 19:04:37 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 570E5C78031
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Oct 2024 19:04:30 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2f7657f9f62so2057471fa.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Oct 2024 12:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729105469; x=1729710269;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RtGYrIijwgBxdrnD7WLkzM6UJ+0XPIv1IwjkYUNx0TA=;
 b=Tpv735NaXzU0EAPlX3BqeQgyFMa8a++Y+MVyNJJdkvfKeRwIlY0yWCmen6cD1q9rKz
 TWNCppyoAIdOjZmbtmUVZgdgxIz4GKed3eDCHmtxgwDhiqFg5zG12SQeNAnqPD1WkWRp
 QLdNOcUdXuB32YW5ePbxpNmZswqT41VwqZBRqbtkcYr2tgVflcaxwqS/cvLE59I/wezL
 p3e+ynumf3EjjeUjyM2cAgd2ms1+5galuCIjftMgJof9GWN6IVUWKe4qX44CcTw7hjxI
 9dYbBZwuEGacrMzHp6hcJqNHOxUCGU0WIFI2n5JFiLmbTnEXqXaKUdDXlv820Up8Z1qz
 KJ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729105469; x=1729710269;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RtGYrIijwgBxdrnD7WLkzM6UJ+0XPIv1IwjkYUNx0TA=;
 b=wK5fMfyErwQE3GnaxeUUzjYxPTci7VGL220PNlxkPfN7hJM/MkBQme99XGlQKO+fNB
 K9Jcmzhb5QdmAV2URINM2VmyNF2d/XHTHzPlssx8UiV31p05gaGV+TbQgyni+yJJX2LW
 Cqyvq6ZVAcKLAmxNDYEtu+i5Uun8jBjr9VTppn9hxdaaUC9hQXslJK/L2jI+S5edapoR
 utfF+vL1S6GhZLvxJzvv1D4iZLKcLx/dJ4XbeW34Mu8Dy/PXMjW5oY8e2SW9gh53UHpE
 KennykjrJwDq2jKrC8OM5VPd7P15wHD7WgVaCIGny1hKWYBj7+jXG1Urx8wIbZFD3qOS
 m/9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJBNVLOP1MCfGSvehbMzsrWupIrGQh+4pbxCBU76lkoSlKgN4O4meA+CnszqOcqwTs1LRb93E7bh+PYg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzDKcLvPheLs0zlPFvQBX0V0ALtBCusQRv+2K+13q+uhSQ+j9XE
 1PtfLlXNXvkOSI9gMoNJqKY9tImeMIM+avAJjADI44i5gzzukvbsYnEuiMfuCXGBOb7izfxxNLx
 53W86LX7xVbsWlw86lAUqhfTosIuAoJ1GIj0Kxg==
X-Google-Smtp-Source: AGHT+IHIiGX53/jRYrTj8MoxWL7Vaa89300icCl3MuVxWGPS9PILDn3Ma2WDMTpSv2vm8WeFAxQjKhYjPTwtch2LcgY=
X-Received: by 2002:a05:651c:212a:b0:2fb:4b0d:9092 with SMTP id
 38308e7fff4ca-2fb61b3e46dmr32242961fa.1.1729105469454; Wed, 16 Oct 2024
 12:04:29 -0700 (PDT)
MIME-Version: 1.0
References: <20241015-arm-kasan-vmalloc-crash-v1-0-dbb23592ca83@linaro.org>
 <20241015-arm-kasan-vmalloc-crash-v1-1-dbb23592ca83@linaro.org>
 <CAMj1kXHuJ9JjbxcG0LkRpQiPzW-BDfX+LoW3+W_cfsD=1hdPDg@mail.gmail.com>
 <CACRpkdZp84MzXEC7i8K2FCnR3pEc05wPBVX=mMO5s6j1tJTm_A@mail.gmail.com>
 <CAMj1kXGHsexspqKfewL3i7M1aqZJwkb6D_kO_UCoAvoSF24Wrg@mail.gmail.com>
In-Reply-To: <CAMj1kXGHsexspqKfewL3i7M1aqZJwkb6D_kO_UCoAvoSF24Wrg@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 16 Oct 2024 21:04:18 +0200
Message-ID: <CACRpkdZ2nvH1UP_anBmU7q4GHNmUqxe-DTmbXNeQAOkgwUfkRA@mail.gmail.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Kees Cook <kees@kernel.org>,
 Russell King <linux@armlinux.org.uk>, stable@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [Linux-stm32] [PATCH 1/2] ARM: ioremap: Flush PGDs for VMALLOC
	shadow
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

T24gV2VkLCBPY3QgMTYsIDIwMjQgYXQgODo1MOKAr1BNIEFyZCBCaWVzaGV1dmVsIDxhcmRiQGtl
cm5lbC5vcmc+IHdyb3RlOgoKPiBZZXMsIHNvIHdlIHJlbHkgb24gdGhlIGZhY3QgdGhhdCBjaGFu
Z2VzIHRvIHRoZSB2bWFsbG9jIGFyZWEgYW5kCj4gY2hhbmdlcyB0byB0aGUgYXNzb2NpYXRlZCBz
aGFkb3cgbWFwcGluZ3MgYWx3YXlzIG9jY3VyIGluIGNvbWJpbmF0aW9uLAo+IHJpZ2h0PwoKWWVz
IG90aGVyd2lzZSBpdCBpcyBwcmV0dHkgbXVjaCB0aGUgZGVmaW5pdGlvbiBvZiBhIEtBU0FOIHZp
b2xhdGlvbi4KCk1vc3RseSBpdCAianVzdCB3b3JrcyIgYmVjYXVzZSBhbGwgbG93LWxldmVsIG9w
ZXJhdGlvbnMgZW1pdHRlZCBieSB0aGUKY29tcGlsZXIgYW5kIGFsbCBtZW1jcHkoKSAoZXRjKSBh
cmUgcGF0Y2hlZCB0byBkbyBhbnkgbWVtb3J5IGFjY2VzcwppbiB0YW5kZW0sIHRoaXMgdm1hbGxv
Y19zZXEtdGhpbmcgd2FzIGEgYmlnIGNvbmZ1c2lvbiBmb3IgbWUuCgpJJ2xsIHNlbmQgb3V0IHRo
ZSByZXZpc2VkIHBhdGNoZXMgc28gcGVvcGxlIGNhbiB0ZXN0IQoKWW91cnMsCkxpbnVzIFdhbGxl
aWoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
c3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8v
bGludXgtc3RtMzIK
