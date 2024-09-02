Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 26CBA96819A
	for <lists+linux-stm32@lfdr.de>; Mon,  2 Sep 2024 10:23:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C213EC78010;
	Mon,  2 Sep 2024 08:23:15 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B7B9EC6DD6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Sep 2024 08:23:08 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2f4f5dbd93bso37254331fa.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 02 Sep 2024 01:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725265388; x=1725870188;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XQq/D4lV27FYzTNjf3gFkYUSIKcxiur4dtzJLIKtst0=;
 b=BQhPxzDkLQCxmUAPI11XIzPuKDd8fAbvGB7f719hiqHbD1/nBFmkII6vKNkPiQUgev
 XjzMaM+56gT5NxtDl892de4oOgI3EG4uG6907KaEe9kUT4LsWhtpYio7wf/RwQt2Nrl1
 GfvR6PWt54qnWp2kJ+NKLOAQcyaTBklJf64BPUkVKrlcqFGi9Cb99UKBpAcqkcVORZMC
 QhQv4sdjHePMVzs/zj/tArxM8EZiYvXYQFBA8+DUf8c1OTQgwutPXFYzOz3MrwHKBBgl
 E8OJmA6Mf2WAI4t5cOtoXzX5i7wOHuyO2NrR3NZf3F8XOvf5gghqQUTajgvxNaUPojW0
 zldw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725265388; x=1725870188;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XQq/D4lV27FYzTNjf3gFkYUSIKcxiur4dtzJLIKtst0=;
 b=Q1k/Jj5b3xcycEeF1xgdMAQ1ZoacCHAO9KJcIwqyU0z48WwB0ZEqdzLF2MWbIvNZoT
 x0RRQcsn9vY+uxeAXRZeXi895FxUwavvymKxp7MabJ/uZjpNaaQKfpoAAh472Xo/L0vD
 9PyUlPbzrAv1SbQQhObvaqAIPahDSQfkJeSTsxHZKazojQC1MDPepz3qTupC44xTgEaX
 0pinpj+1u8yEn+D1Y1I1mJcsNLFqgHNByIK3e/Wkqnd91jFuILkiG4gL09ktT7lfZJIU
 WZvcP5uUGw4RxeW4t4lp0qgj25DGp6Q5wNq1BZi9yzCFoXs4sWYk4o+hxuP+2fQzUu0k
 BEKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqmUiFzwSwYtKUUhVpoHb4OAUD7wANn3g/Gf/eQCcnWcss+uadStknuPlRfKSHXHtRG0liKrAmxDTy1Q==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwROEhdbrEk1tqud/pu7o+e882VQKexU08EoEXSrgU3PljmClXH
 /RtVdXdNBHPjXmqTc60AYOsTEgZszhEm7aGA4t2vwHinOzG6Qrbq4jBFZG97kxzFrrhUILh8vFJ
 G/kir+/1KU49MALIJ0AwUFNm8j7lAonlLPh+ZvQ==
X-Google-Smtp-Source: AGHT+IGOsbWk+h5fSydwDiIytPpQSxAoU7GXpQxygF+8ahTjkzoifYF0BEllNauSFfQHoLbA8weKozExCyYDDMJzjoo=
X-Received: by 2002:a05:6512:b94:b0:535:3dfb:a4fc with SMTP id
 2adb3069b0e04-53546b0548dmr7633008e87.22.1725265387226; Mon, 02 Sep 2024
 01:23:07 -0700 (PDT)
MIME-Version: 1.0
References: <20240830031325.2406672-1-ruanjinjie@huawei.com>
 <20240830031325.2406672-3-ruanjinjie@huawei.com>
In-Reply-To: <20240830031325.2406672-3-ruanjinjie@huawei.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 2 Sep 2024 10:22:56 +0200
Message-ID: <CACRpkdat9Y0vJXUbBEeoNP7QG3UGRTU3rOYD3PAi4frk05bSKA@mail.gmail.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: andrew@lunn.ch, justin.chen@broadcom.com, edumazet@google.com,
 krzk@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 f.fainelli@gmail.com, samuel@sholland.org, linux@armlinux.org.uk,
 jernej.skrabec@gmail.com, wens@csie.org, joabreu@synopsys.com,
 bcm-kernel-feedback-list@broadcom.com, kuba@kernel.org, pabeni@redhat.com,
 linux-sunxi@lists.linux.dev, sebastian.hesselbarth@gmail.com,
 woojung.huh@microchip.com, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, UNGLinuxDriver@microchip.com,
 mcoquelin.stm32@gmail.com, alsi@bang-olufsen.dk, olteanv@gmail.com,
 davem@davemloft.net, jic23@kernel.org, hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next v4 2/8] net: dsa: realtek: Use
	for_each_child_of_node_scoped()
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

T24gRnJpLCBBdWcgMzAsIDIwMjQgYXQgNTowNuKAr0FNIEppbmppZSBSdWFuIDxydWFuamluamll
QGh1YXdlaS5jb20+IHdyb3RlOgoKPiBBdm9pZCBuZWVkIHRvIG1hbnVhbGx5IGhhbmRsZSBvZl9u
b2RlX3B1dCgpIGJ5IHVzaW5nCj4gZm9yX2VhY2hfY2hpbGRfb2Zfbm9kZV9zY29wZWQoKSwgd2hp
Y2ggY2FuIHNpbXBsZnkgY29kZS4KPgo+IFJldmlld2VkLWJ5OiBBbmRyZXcgTHVubiA8YW5kcmV3
QGx1bm4uY2g+Cj4gUmV2aWV3ZWQtYnk6IEpvbmF0aGFuIENhbWVyb24gPEpvbmF0aGFuLkNhbWVy
b25AaHVhd2VpLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBKaW5qaWUgUnVhbiA8cnVhbmppbmppZUBo
dWF3ZWkuY29tPgoKUmV2aWV3ZWQtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGlu
YXJvLm9yZz4KCllvdXJzLApMaW51cyBXYWxsZWlqCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0z
MkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
