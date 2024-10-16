Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA929A11CB
	for <lists+linux-stm32@lfdr.de>; Wed, 16 Oct 2024 20:38:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 492FDC78032;
	Wed, 16 Oct 2024 18:38:52 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0E5E5C78031
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Oct 2024 18:38:45 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2fb5fa911aaso2291081fa.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Oct 2024 11:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729103924; x=1729708724;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I6rKDIzOUTRgJd5hJo09U0dfDGO4bSLC/6WzdPUaGc0=;
 b=k9KJ+AW1ufEO9fAoqWsrPouJ8HINndo+oE0X8x9GtHLTSHAMD10J0YCioESGr2ZRCb
 A1LZiKcc+B+A4N6+wUEzNT6ACjRf2R63DLqaMM/BPYqWlNJT4KPTq4uWupF9B8uzxKBX
 zzkpTn53NEwGioXfELH6VBRsa0W9V4L/991grKpibkiChzeC+7Vq+Ibtk1ZALApev8ol
 tvB6/Dbpy6+8tF+QRX6Brhq4tyPNYwjR89qATnQ8+Q2N6GGuqVM5XYs1tYXytbqCq9Uc
 QEmLjmavfnMhKw3TiIbFOOwOosGiACkpTQAqnaq37amic4s0HrPZDwPjcwEQkVM3pd5a
 zOIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729103924; x=1729708724;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I6rKDIzOUTRgJd5hJo09U0dfDGO4bSLC/6WzdPUaGc0=;
 b=aDjBr+9Yivywd+dutqjPoIJDZxmWlIdEEyiWkwEZm2R12AhDixOUaLkDlcA6yB3XdR
 qkLe0pGbBL+Q6DP9s6KMe3j8AeDVoNui9lizwjliyKbmJGCkxeMta70nvYvesHHoOtLi
 Vu7fJoxX8O5ogef06UhuaAe14pSF6UlhhLAihZiUmAa7dNgsqnQ8tzTPrYKWo32bbrRr
 8ErDV+4XuO6WPH943XOxKfd89qpWiOy3k1Semx4tU3A/H5fJHfCdGh+qN8Z9B8qoMQep
 lhKrfnZanjNN/gLO/OxYyub4y1BqA9KoBV79cA1MRoUnOr/sxsxjXe/fsGmAJvfxpRsf
 IxbA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2t/yrrtsJ13AGcNnTZu7JvwOMAuzOYJTb7T9rrwi+d1pQxxxVLGB+Fo32ZbMiN99TeaOly7XotRW1hw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzUyjtUgaGxgtVgOOcCGuJ1zDlYNlfoGxFsBnbLprUAYihKnOk3
 nQAfkMjYX/LpyaOGaOz6ErIU30B4vR3mbKavy0SURwhVO7sj/v5tsyDrNjDi5d7AOsgWO+40ssN
 PUlqd8fZB9+GxleAV+dVUuqXIFoLapUY2JZhJDA==
X-Google-Smtp-Source: AGHT+IF13Ea7y6L9Can5T137qlH4Oc5vSjbBPA5f2FxIJOA7leG6kVirqELpYBS6TOYKSL0EXSp2T3MOJSZA4oMAFBo=
X-Received: by 2002:a2e:4c19:0:b0:2f7:6653:8053 with SMTP id
 38308e7fff4ca-2fb3f1adfa0mr77485051fa.18.1729103923979; Wed, 16 Oct 2024
 11:38:43 -0700 (PDT)
MIME-Version: 1.0
References: <20241015-arm-kasan-vmalloc-crash-v1-0-dbb23592ca83@linaro.org>
 <20241015-arm-kasan-vmalloc-crash-v1-1-dbb23592ca83@linaro.org>
 <CAMj1kXHuJ9JjbxcG0LkRpQiPzW-BDfX+LoW3+W_cfsD=1hdPDg@mail.gmail.com>
In-Reply-To: <CAMj1kXHuJ9JjbxcG0LkRpQiPzW-BDfX+LoW3+W_cfsD=1hdPDg@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 16 Oct 2024 20:38:32 +0200
Message-ID: <CACRpkdZp84MzXEC7i8K2FCnR3pEc05wPBVX=mMO5s6j1tJTm_A@mail.gmail.com>
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

T24gV2VkLCBPY3QgMTYsIDIwMjQgYXQgMTozM+KAr1BNIEFyZCBCaWVzaGV1dmVsIDxhcmRiQGtl
cm5lbC5vcmc+IHdyb3RlOgoKPiA+IEBAIC0xMjUsNiArMTI2LDEyIEBAIHZvaWQgX19jaGVja192
bWFsbG9jX3NlcShzdHJ1Y3QgbW1fc3RydWN0ICptbSkKKC4uLikKPiBUaGVuLCB0aGVyZSBpcyBh
bm90aGVyIHBhcnQgdG8gdGhpczogaW4gYXJjaC9hcm0va2VybmVsL3RyYXBzLmMsIHdlCj4gaGF2
ZSB0aGUgZm9sbG93aW5nIGNvZGUKPgo+IHZvaWQgYXJjaF9zeW5jX2tlcm5lbF9tYXBwaW5ncyh1
bnNpZ25lZCBsb25nIHN0YXJ0LCB1bnNpZ25lZCBsb25nIGVuZCkKPiB7Cj4gICAgIGlmIChzdGFy
dCA8IFZNQUxMT0NfRU5EICYmIGVuZCA+IFZNQUxMT0NfU1RBUlQpCj4gICAgICAgICBhdG9taWNf
aW5jX3JldHVybl9yZWxlYXNlKCZpbml0X21tLmNvbnRleHQudm1hbGxvY19zZXEpOwo+IH0KPgo+
IHdoZXJlIHdlIG9ubHkgYnVtcCB2bWFsbG9jX3NlcSBpZiB0aGUgdXBkYXRlZCByZWdpb24gb3Zl
cmxhcHMgd2l0aCB0aGUKPiB2bWFsbG9jIHJlZ2lvbiwgc28gdGhpcyB3aWxsIG5lZWQgYSBzaW1p
bGFyIHRyZWF0bWVudCBhZmFpY3QuCgpOb3QgcmVhbGx5LCByaWdodD8gV2UgYnVtcCBpbml0X21t
LmNvbnRleHQudm1hbGxvY19zZXEgaWYgdGhlIGFkZHJlc3MKb3ZlcmxhcHMgdGhlIGVudGlyZSB2
bWFsbG9jIGFyZWEuCgpUaGVuIHRoZSBwcmV2aW91c2x5IHBhdGNoZWQgX19jaGVja192bWFsbG9j
X3NlcSgpIHdpbGwgY2hlY2sgdGhhdAphdG9taWMgY291bnRlciBhbmQgY29weSB0aGUgUEdEIGVu
dHJpZXMsIGFuZCB3aXRoIHRoZSBjb2RlIGluIHRoaXMKcGF0Y2ggaXQgd2lsbCBhbHNvIGNvcHkg
KHN5bmMpIHRoZSBjb3JyZXNwb25kaW5nIHNoYWRvdyBtZW1vcnkKYXQgdGhhdCBwb2ludC4KCllv
dXJzLApMaW51cyBXYWxsZWlqCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
