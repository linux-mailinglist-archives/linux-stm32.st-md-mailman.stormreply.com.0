Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DBB39A22CB
	for <lists+linux-stm32@lfdr.de>; Thu, 17 Oct 2024 14:55:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2991AC78032;
	Thu, 17 Oct 2024 12:55:55 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0354AC6C83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Oct 2024 12:55:47 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-2fb3da341c9so9504591fa.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Oct 2024 05:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729169747; x=1729774547;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MCFsQLccHzWDScb5aVoa2fyWE78FPrp3oEuT9gFmNzk=;
 b=Uch4BsqctAKDrqkKre/bcdkaC41FaPO2mNiwYaOxPkIDY6MJJv00HaK5d3lmt5S+Qr
 lu7Q/4Bj7gyDJOh45s6eo5Ovo4cnZDoT3Mm1PXxVg6mq/BJmTYHc9rRpzm0VJb/pKoUX
 XnVCt3QYVjLkA179W/rq2Psp9gfdvYEWI5Dj3jazMh9a1/mhldd7TC0xM0CfuUzPKCzF
 t5xmjQ/zVvcReEx2z1M+EJktxgvRdKCH34xMe7BXfCOzqbYEtb5eABcD0MiPALe+bhm8
 GWhqreLoZV+ZZShgVQqL5jnlrbEUqtgGia5Ji/Wl20S78IJJFmHzgkwq2rWuBSXgopqD
 YR7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729169747; x=1729774547;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MCFsQLccHzWDScb5aVoa2fyWE78FPrp3oEuT9gFmNzk=;
 b=RYDh17avgp41XrM6dDZOk2WJo7tPiZEY8yKruchciJScKSjLUeCtR47v1Pd+3orBjO
 Z04z/yGHXWo+CchhkvVuSbC7RHo3tYRVBusHdgeB1+/2bnyI/jL1og20dTJr5pEJdU2L
 GyV0LnKgeoap7TS5Yg6hIo53dwN5PsaTL+/g8FA9HYmLoJXXxV+fgSpjCAKpBfE790tO
 IGfN+PX8FnR1/Mh6CMCk1Is9ymxnKqS38YUOk8arUZGBIWtu9vyL1bTbKPnFd8bzPwI3
 FodybgovG2V0bM9m/INJSPx7q+Cy7MFH1Eccr6JhufWwG6d8piWEdHpDaKOTj+W/gZlF
 oH9w==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9/Wn2DqJFlVDjKS8pwnB298+Yk7qsjMyB6CeJC2EmePy8++wpLa5ZegnfSVR50e17q0pPvov64TH/jg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzzN9EeB5EOPYHOlVetnsNVkel42HDdrAKDx7AGlJ4dLSNInE7y
 spSGY5MKGSby3qIgh5G2ok3AQKjC25TkZGX/0p77R2lxeDx6jY7wxCtLyBn8GotaZEmYZ/9RpjG
 1negcR5jgN2f9vJhHHwggAVdaWz/VCqCrplXzOQ==
X-Google-Smtp-Source: AGHT+IFFnc0tQjTTTOLtjbrBvukWeEJCbwl2OnBf8sTx6M68DY0cJ5kzCJje64gUnuuqZzTni7J195+mWq0F64ydybo=
X-Received: by 2002:a2e:b8ce:0:b0:2fa:d84a:bd8f with SMTP id
 38308e7fff4ca-2fb3f2d1667mr94996631fa.30.1729169747121; Thu, 17 Oct 2024
 05:55:47 -0700 (PDT)
MIME-Version: 1.0
References: <20241016-arm-kasan-vmalloc-crash-v2-0-0a52fd086eef@linaro.org>
 <20241016-arm-kasan-vmalloc-crash-v2-2-0a52fd086eef@linaro.org>
 <16e45f70-d1d6-4cca-95b0-24d3959e50be@foss.st.com>
In-Reply-To: <16e45f70-d1d6-4cca-95b0-24d3959e50be@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 17 Oct 2024 14:55:35 +0200
Message-ID: <CACRpkdaAnutxm-vrrWiqXPoJfsU_RNUOi+a0XP6FNysuYWiX+w@mail.gmail.com>
To: Clement LE GOFFIC <clement.legoffic@foss.st.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Kees Cook <kees@kernel.org>,
 Russell King <linux@armlinux.org.uk>, stable@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Mark Brown <broonie@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [Linux-stm32] [PATCH v2 2/2] ARM: entry: Do a dummy read from
	VMAP shadow
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

T24gVGh1LCBPY3QgMTcsIDIwMjQgYXQgMTI6MjDigK9QTSBDbGVtZW50IExFIEdPRkZJQwo8Y2xl
bWVudC5sZWdvZmZpY0Bmb3NzLnN0LmNvbT4gd3JvdGU6Cgo+ID4gKyAgICAgYWRkICAgICByMiwg
aXAsIGxzciAjS0FTQU5fU0hBRE9XX1NDQUxFX1NISUZUCiguLi4pCj4gV2hpbGUgQVJNIFRSTSBz
YXlzIHRoYXQgaWYgUmQgaXMgdGhlIHNhbWUgb2YgUm4gdGhlbiBpdCBjYW4gYmUgb21pdHRlZCwK
PiBzdWNoIHN5bnRheCBjYXVzZXMgZXJyb3Igb24gbXkgYnVpbGQuCj4gTG9va2luZyBhcm91bmQg
Zm9yIHN1Y2ggc3ludGF4IGluIHRoZSBrZXJuZWwsIHRoaXMgbGluZSBzaG91bGQgYmUgOgo+IGFk
ZCAgICAgcjIsIHIyLCBpcCwgbHNyICNLQVNBTl9TSEFET1dfU0NBTEVfU0hJRlQKClllYWggY2xl
YXJseSBteSBjb21waWxlcnMgYWxsb3dlZCBpdCA6LwoKSSBjaGFuZ2VkIGl0IHRvIHRoZSBhcmNo
YWljIHZlcnNpb24sIHdpbGwgcmVwb3N0IGFzIHYzLgoKUGxlYXNlIHRlc3QgYXQgeW91ciBjb252
ZW5pZW5jZSEKCllvdXJzLApMaW51cyBXYWxsZWlqCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0z
MkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
