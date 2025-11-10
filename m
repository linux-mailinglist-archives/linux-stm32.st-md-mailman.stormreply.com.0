Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 58257C49ACD
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Nov 2025 00:00:18 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 68B0DC60460;
	Mon, 10 Nov 2025 23:00:14 +0000 (UTC)
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com
 [74.125.224.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 87596C5A4C0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Nov 2025 23:00:13 +0000 (UTC)
Received: by mail-yx1-f41.google.com with SMTP id
 956f58d0204a3-640d790d444so1744438d50.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Nov 2025 15:00:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1762815612; x=1763420412;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5g2st9wc6PSphLv2rTXtzyso52RIhR8FQuQh5VZ2AAs=;
 b=wMahau/8b0FyAc00dxRNzBjQsfHKRBAYnVj6f8jHfacmhuwo+2d53Op32UkR7wnMmD
 W2L1tZ3j2n7cx1M6ygZmiu+mUWLbH+6bSEiybI6XFy485kUtHQjM1zXsv7zmpLTfo/DP
 o1uuQOPLQdPiBR9fLVFJxknSgCaDBHs9xkrwKs+3LHBbok07riYyCaslONyAyFlEGMRc
 LFTjNZhGbIXULshYRWipNxq8a77COk8jx6Ps6ixuPuHdPDPxCweVjLdbp9zM8Bios5dP
 Xv086+ONB5Bo81eEtffz1IE50N56H45SgeN9tiq9rUjjdWYm5xb7Id0RVhGgAVOPUpej
 ICFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762815612; x=1763420412;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=5g2st9wc6PSphLv2rTXtzyso52RIhR8FQuQh5VZ2AAs=;
 b=iF4JQk6iy6NonD8X2vqgiCB9A9LbRaamNS58rsB5a5nSuIFwfe7dsNdre+kKhUTO7W
 AUTKVG+v1KYXPRKPttllqvgFIZe1jHOhY1IJNJDfz9rPIFtQjcpNnw3gYrURseMA40Mu
 nWqtaW5+Q/XXHNMBG6Bu0ixQ9DCnvpGmScXaDrWVFvsfYKPPfuhWZV9cgEPZaTy5eodl
 6APBlUk+vwDqrWq6Fv8NFi0G5TBGlMLMxMBQrKkLA7DmNA8FKupiBO6TVWsZQHITnlWq
 +EX/DekhhATEfA6rN8c3AVTgPAlFxfEXIxNcJKcXtNZup+N9KkntxSdbSf+5NIeOyqBx
 9KWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUanWDBBTsxUU5QHOgMWFOHSHPXerx3HTHUXFP3oAx39xu51Qphy9vrh4RgqCWcPAZspzeMSBKTR7Ug/g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Ywt93AIsNJ4Bw8UeXKKaJ45MEv/TxudP87/oqC1tqmxp8TRke/L
 6INYDOvlrgQVyxyTWLMUdwV0mYYsiq1BUfhyYgTRSegfThdP5OcKYj7xHYXbhnumg+VhD2ovRjz
 Lq7bFzQgZTyTGX3gLWp0Gdfo/frTHJ4L8w1fT4mWGww==
X-Gm-Gg: ASbGnctNuKxw0hQkUYWRzwGzzPZWySPIwbgXfyBVVkEhEEM2SB1lRbzEoXFIsQLrJ2E
 RXytNjZwhaJbS46nHW7/eSKiwFBHmK+hJzLkB6nJCAtkG1b6DYD3yXT84AVjNdxS+eV/pevBKOP
 vvEKhDia+7Jtz1fzAWANCJs6nJaLJTg2sJH5PkC2F1YY+vInEGvGzop40RXJzcGzaYdnqkIoEbp
 xeBeWQimN/orCorGzNlp68JSAh+ks4NaqMsaqcMiSpPnzWYPWi9qhrJyjvW8Q+vtbkj2iRV7uaz
 moEsxQ==
X-Google-Smtp-Source: AGHT+IF8ly9VGsM78kkecljV7QbSku7Ug4S6qy5rbzWNA7QZtQnG4yF7xb8sJiiWVsPr6iJZaHBVJJja0GkrFNx95t8=
X-Received: by 2002:a05:690e:d41:b0:63f:a3bf:b7ff with SMTP id
 956f58d0204a3-640d4521905mr8009773d50.2.1762815612050; Mon, 10 Nov 2025
 15:00:12 -0800 (PST)
MIME-Version: 1.0
References: <20251105-gpio_semaphore-v1-1-f73de44310dd@foss.st.com>
In-Reply-To: <20251105-gpio_semaphore-v1-1-f73de44310dd@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 10 Nov 2025 23:59:21 +0100
X-Gm-Features: AWmQ_bnOOnJKFTCi7QK6iL3YzdjswL_EdXBkwAsVR9l7bqs8icN9mSLR-Gbon98
Message-ID: <CACRpkdZcqM5JzvoTUk+cAFrtvQjHdRiaV0MF8ZipPTWxfqBxZg@mail.gmail.com>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] pinctrl: stm32: handle semaphore
 acquisition when handling pinctrl/pinmux
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

T24gV2VkLCBOb3YgNSwgMjAyNSBhdCAxMTo1MOKAr0FNIEdhdGllbiBDaGV2YWxsaWVyCjxnYXRp
ZW4uY2hldmFsbGllckBmb3NzLnN0LmNvbT4gd3JvdGU6Cgo+IFdoZW4gYSBHUElPIFJJRiBjb25m
aWd1cmF0aW9uIGlzIGluIHNlbWFwaG9yZSBtb2RlLCBhbmQgdGhlIHNlbWFwaG9yZQo+IGhhc24n
dCBiZWVuIHRha2VuIGJlZm9yZSBjb25maWd1cmluZyB0aGUgR1BJTywgdGhlIHdyaXRlIG9wZXJh
dGlvbnMKPiBzaWxlbnRseSBmYWlsLgo+Cj4gVG8gYXZvaWQgYSBzaWxlbnQgZmFpbCB3aGVuIGFw
cGx5aW5nIGEgcGluY3RybCwgaWYgdGhlIHBpbnMgdGhhdCBhcmUKPiBiZWluZyBjb25maWd1cmVk
IGFyZSBpbiBzZW1hcGhvcmUgbW9kZSwgdGFrZSB0aGUgc2VtYXBob3JlLiBOb3RlIHRoYXQKPiB0
aGVyZSBpcyBubyBwcm9wZXIgcmVsZWFzZSBvZiB0aGUgUklGIHNlbWFwaG9yZSB5ZXQgZm9yIHBp
bmN0cmwuCj4KPiBTaWduZWQtb2ZmLWJ5OiBHYXRpZW4gQ2hldmFsbGllciA8Z2F0aWVuLmNoZXZh
bGxpZXJAZm9zcy5zdC5jb20+CgpQYXRjaCBhcHBsaWVkLgoKWW91cnMsCkxpbnVzIFdhbGxlaWoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3Rt
MzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20K
aHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtc3RtMzIK
