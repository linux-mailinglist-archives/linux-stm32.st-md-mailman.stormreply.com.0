Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E11F6AB2A9
	for <lists+linux-stm32@lfdr.de>; Sun,  5 Mar 2023 22:51:46 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 49CDAC6904A;
	Sun,  5 Mar 2023 21:51:46 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com
 [209.85.128.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E5314C6410A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  5 Mar 2023 21:51:44 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-536af432ee5so151369287b3.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 05 Mar 2023 13:51:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P4nagVa5A/zThSizaZWcAj9+LI0HVFxK9izn7FANSgc=;
 b=IAn+kCbqQsCW+Kqg1JURWxcIvDd/JjLFYkB3TvbTA+IrrUjtIuNnoObUDW/G/lxUfc
 XqNOE9bwR29rV5d0tGhTiGygqI4cxkDCN9iOdJ2R3WBNPtkIry86TEK7HlYzn7Obq7M+
 vU+KbEzCWj400IbzEN5fZJUaCXY71Xp5OHXD1UZ6Xni01b3EaRQjOTDkd+8R29scMIvJ
 cl3TAsZ1DAxOcPlwD7YFOgwZIrPu+tO7eqo0xHH2jQYlV05MczXTdGJvaVBbrBw8LrW8
 dlrQdfd+WP5+aHVgQZVUJ9+khXmZ2Czaouv3Iz5G3bqaxmnk+DBGraicQ8eAZEo2XCnH
 xzhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P4nagVa5A/zThSizaZWcAj9+LI0HVFxK9izn7FANSgc=;
 b=okmdhFk1yzAK6i38lcnB6um7DMwK4bhAeqlX6sgpMjFzRNSS7a9inBZF/3x8aGrnkF
 90Bh5hG8yoQ0ron9QZNBjI1DlgqzxJKwzYP4X1+qdOHt2NR4XdRm+gbLQ67vIYHZzbQu
 lWvZzkGGHJ0sCe6ZbqNLOxFgQVgwqYoBNpeFo82Cx3zVYbvT78f8zUhEBA5x+fdu57kk
 I4/jNN+nBxSY1q9BeGG4V04ypQM9zbWWMMQMPXfaraT4xLGeGJdWbEGJ3p5BVLpT/6ae
 ET7qbUMjGcmVibEiACLDFKKtolYVHkw0TWxXFoETEQzCzewmzNgBU/XYLrw3l5pUllpx
 EKvQ==
X-Gm-Message-State: AO0yUKUmK0lLo2wgZnCcApX2//VPzCzkuayLTqLGbxCn1wqYV+2YZh2q
 kxnwzXGlkN+hrc/qpQvnyHjDilj0Kyxo8SEy4m4kvA==
X-Google-Smtp-Source: AK7set8WqgWYN9z/yS50vyhHB4nsTvSMESsxVTSN3nt8vqTEYgHy8/ZF/JobK9m0Y3iTYswh1vfHlW0HsmFqfaqLJdk=
X-Received: by 2002:a81:b624:0:b0:52e:f77c:315d with SMTP id
 u36-20020a81b624000000b0052ef77c315dmr5580789ywh.3.1678053103873; Sun, 05 Mar
 2023 13:51:43 -0800 (PST)
MIME-Version: 1.0
References: <ZAMQjOdi8GfqDUQI@gondor.apana.org.au>
 <E1pYOKF-000GYm-MW@formenos.hmeau.com>
In-Reply-To: <E1pYOKF-000GYm-MW@formenos.hmeau.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 5 Mar 2023 22:51:32 +0100
Message-ID: <CACRpkdYH91rgE7wF17pDi58z9Rq68JqNxbR2XMQ0=si_w7aCnA@mail.gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Li kunyu <kunyu@nfschina.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-crypto@vger.kernel.org,
 mcoquelin.stm32@gmail.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [v5 PATCH 2/7] crypto: stm32 - Move polling into
	do_one_request
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

T24gU2F0LCBNYXIgNCwgMjAyMyBhdCAxMDozN+KAr0FNIEhlcmJlcnQgWHUgPGhlcmJlcnRAZ29u
ZG9yLmFwYW5hLm9yZy5hdT4gd3JvdGU6Cgo+IFRoZXJlIGlzIG5vIG5lZWQgdG8gcG9sbCBzZXBh
cmF0ZSBmb3IgdXBkYXRlIGFuZCBmaW5hbC4gIFdlIGNvdWxkCj4gbWVyZ2UgdGhlbSBpbnRvIGRv
X29uZV9yZXF1ZXN0Lgo+Cj4gQWxzbyBmaXggdGhlIGVycm9yIGhhbmRsaW5nIHNvIHRoYXQgd2Ug
ZG9uJ3QgcG9sbCAoYW5kIG92ZXJ3cml0ZQo+IHRoZSBlcnJvcikgd2hlbiBhbiBlcnJvciBoYXMg
YWxyZWFkeSBvY2N1cnJlZC4KPgo+IFNpZ25lZC1vZmYtYnk6IEhlcmJlcnQgWHUgPGhlcmJlcnRA
Z29uZG9yLmFwYW5hLm9yZy5hdT4KCldvcmtzIGxpa2UgYSBjaGFybSBhbmQgcGFzc2VzIGFsbCB0
ZXN0cy4KUmV2aWV3ZWQtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9y
Zz4KVGVzdGVkLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+CgpZ
b3VycywKTGludXMgV2FsbGVpagpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20v
bWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
