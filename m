Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 55988A12498
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Jan 2025 14:17:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 296E7C78F7B;
	Wed, 15 Jan 2025 13:17:11 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CF7BCC7801F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Jan 2025 11:52:04 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-30219437e63so8335021fa.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Jan 2025 03:52:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736941924; x=1737546724;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PqOgdxN7YgR6Di9i7BQMXG7Ou3Po/90jfs2TtmrHKmQ=;
 b=OXyzSwKbzmjRFfqaIVZ9MqE4MuUAyzTDMb/m2SwJFEdWA9V5zpoZmkYzkJMX7PmOCo
 Wp8X/Ki7SIKueqiQOziHCYlXdJ04tstviqpopuL20DbWaYjTzYWD75M8EVdpXjFxGTIA
 PPGNsLzLFHi9zcunbP3PJ+ApLe/Cv9Q6gSjPFjHlKzfRPgXaUcO7t1Kq8Dn9vqyL4UAX
 VDD290VQPtPFFYX7U+am6Hj2IUacpZV58tjciyZbHkS5439LCQf5lFY/YVRHXmKRJDsv
 XgBtwJrtg6HJLZhKauc+6FhHa37TXzqfE/95scBMOWUGeHcErgyCAP/dPwzvdAyH8MAZ
 7rWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736941924; x=1737546724;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PqOgdxN7YgR6Di9i7BQMXG7Ou3Po/90jfs2TtmrHKmQ=;
 b=HIoh2aFAPnO4JQyXnEMn0LAR0tKcLr+DRRChM68XPKL3rS4j0wbymqMSjnrfem9eqy
 aKAFMdUi8TKf6zSk3prZtIiGIJcp+aznC0iEw7s6ujB6w25a5dBClQq4zAB2UzxNkGOa
 DdD2na7yNcaFEVMHUsE+fCND8LXekejHE0B/sTfzcW8TCWCUBqoDPxd6OyIr+eyzQE7S
 l/4zQ9i23Y0BG+etY4WtWvGeqZZ/5p+eJEkHCsOe06r+DVouK2ERGqTzbKXNzLMFa/1q
 ogDgBg8+mMSJh8McOlgfIB0JqOqpFq+GRIIez10CiFS/kbSeAeNN9av6Er1llUt3u14j
 9JxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV07hQWqViXFCBeFmkCvvrUgOep+SCPpd7FnaguJQGVBH8YnUq2pODy1PpOF5g9/RhiJIl1IimTlYbvsQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwePNmrmmffpkubua4IaSiH0SyJo3bfHwh4l7SErpy01DR4LVgI
 pm2yIS07e8yk614s3xSoZEVuHgWS0kiU553QLN6d8p570B6pbJ0hIm/pGAzNpkLbUAL9fYwKS1y
 BfqYImkJQXtdFGooTxWgaJGUxUqLE7ULXODKngQ==
X-Gm-Gg: ASbGncvHPdr+3fc/rRN1+V9qGTd4s0ZoB3bFB4vI6qVvUP7WhvM44DKHQnPBgC9CJXl
 fPeLYaEtq7Z/l8Ty01gVbxs2sOOIqSuiTxM/rDw==
X-Google-Smtp-Source: AGHT+IGKcxZyPOd7E7UVx7R0mhE5720LI7mD2xNitAn5d4klzms7tIsW6xzgbwpkS78QWTFRsjjqnZvLe4xu3sB+q9I=
X-Received: by 2002:a05:651c:2226:b0:2fa:d086:bca0 with SMTP id
 38308e7fff4ca-306305b3d9dmr9266981fa.10.1736941924002; Wed, 15 Jan 2025
 03:52:04 -0800 (PST)
MIME-Version: 1.0
References: <20250114191438.857656-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250114191438.857656-1-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 15 Jan 2025 12:51:52 +0100
X-Gm-Features: AbW1kvZ75WbEH74lqZTgQ1yROwYhyIN7pTh9_hdZdknNaesgXbnLlLUetNHb884
Message-ID: <CACRpkdaer2vedtupM7QW6W2KZF6N+yKN2V93URd2PbT9xfZKeQ@mail.gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailman-Approved-At: Wed, 15 Jan 2025 13:17:09 +0000
Cc: Andy Shevchenko <andy@kernel.org>, linux-pwm@vger.kernel.org,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Doug Berger <opendmb@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 patches@opensource.cirrus.com, Bartosz Golaszewski <brgl@bgdev.pl>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Nandor Han <nandor.han@ge.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] gpio: Use str_enable_disable-like
	helpers
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

T24gVHVlLCBKYW4gMTQsIDIwMjUgYXQgODoxNOKAr1BNIEtyenlzenRvZiBLb3psb3dza2kKPGty
enlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4gd3JvdGU6Cgo+IFJlcGxhY2UgdGVybmFyeSAo
Y29uZGl0aW9uID8gImVuYWJsZSIgOiAiZGlzYWJsZSIpIHN5bnRheCB3aXRoIGhlbHBlcnMKPiBm
cm9tIHN0cmluZ19jaG9pY2VzLmggYmVjYXVzZToKPiAxLiBTaW1wbGUgZnVuY3Rpb24gY2FsbCB3
aXRoIG9uZSBhcmd1bWVudCBpcyBlYXNpZXIgdG8gcmVhZC4gIFRlcm5hcnkKPiAgICBvcGVyYXRv
ciBoYXMgdGhyZWUgYXJndW1lbnRzIGFuZCB3aXRoIHdyYXBwaW5nIG1pZ2h0IGxlYWQgdG8gcXVp
dGUKPiAgICBsb25nIGNvZGUuCj4gMi4gSXMgc2xpZ2h0bHkgc2hvcnRlciB0aHVzIGFsc28gZWFz
aWVyIHRvIHJlYWQuCj4gMy4gSXQgYnJpbmdzIHVuaWZvcm1pdHkgaW4gdGhlIHRleHQgLSBzYW1l
IHN0cmluZy4KPiA0LiBBbGxvd3MgZGVkdXBpbmcgYnkgdGhlIGxpbmtlciwgd2hpY2ggcmVzdWx0
cyBpbiBhIHNtYWxsZXIgYmluYXJ5Cj4gICAgZmlsZS4KPgo+IFJldmlld2VkLWJ5OiBGbG9yaWFu
IEZhaW5lbGxpIDxmbG9yaWFuLmZhaW5lbGxpQGJyb2FkY29tLmNvbT4KPiBTaWduZWQtb2ZmLWJ5
OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+CgpG
b3IgYSB3aGlsZSBJIHdhcyBjcml0aWNhbCBhYm91dCB0aGUgc3RyaW5nIGhlbHBlcnMgYnV0IHNp
bmNlIGJvdGggQW5keQphbmQgS3J6eXN6dG9mIGxpa2UgdGhlbSwgSSB3aWxsIGNvbnNpZGVyIG15
c2VsZiBjb252aW5jZWQgYW5kIHN0YXJ0IHRvCmxpa2UgdGhlbSBpbnN0ZWFkLgoKUmV2aWV3ZWQt
Ynk6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KCllvdXJzLApMaW51
cyBXYWxsZWlqCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXN0bTMyCg==
