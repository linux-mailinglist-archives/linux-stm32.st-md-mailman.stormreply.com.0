Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 821D5777275
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Aug 2023 10:13:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 474AFC6B471;
	Thu, 10 Aug 2023 08:13:12 +0000 (UTC)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com
 [209.85.219.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7878BC6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Aug 2023 08:13:11 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id
 3f1490d57ef6-d4364cf8be3so604178276.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Aug 2023 01:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691655190; x=1692259990;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eUKzUe/YyFhhVGKQt0xdm9btYh3sRyVbNPpkYzJKMoI=;
 b=bRY2YoCod9u62sIwPgfgb8aYWgek9jPHcXp/hxWWgqGtQZUuDjFZtEEVF5lxydclBF
 nJoKdEVwqq7ihD0E61B3Y9TFFo82SHbFLUT4OCD0iNB7PUqR3EX1LzumZmNdnfTz6hNe
 4E6TgvY+LhWUJ0tl8jT6T9Z7R89Pqfc6QI1kvmWnkv1pNmk4YdmkeocN4GDvYqghdGXP
 C+umo72eBzANdsdWP6pDHj7RFbRRiQ7gEzJjIe9Zc+8vxuy9l3lrA4Wc6CBbGZXuE7jI
 BB960HaGQynFykhVXAkdQ7UjNnjgRPgw/I9CojZ+uOPW8khcdbtMvb9OKicDwYxRX88w
 8i1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691655190; x=1692259990;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eUKzUe/YyFhhVGKQt0xdm9btYh3sRyVbNPpkYzJKMoI=;
 b=enUT4WpwzzgaFi9nHX8lOP10TKUj6UtuA92ru0rx528Xt+ixEELoaOgP4OIF8j6wzj
 LqwRGEh38W1D50wwmeZuLzwKffoboTkADvS9yX2HTZSGDMqFrbUCBOXZ+09VtHow3Fnm
 tUVlzHpuT/tHPOtspSAW9FW9LiWBjQp/8qMvCXo1zjuLSkrCzDVSgFL0R1i7z6xeKRFc
 5hxxU5KPJR/kz1ruxIqzozPXGSwTqggoJdg08d/96hb/rnshPhXs48KhPqNOYuqNa67b
 yLaf36aHeKfyIDQnf/x+Br1A/ht1WHuLUxfnSEd+2ZgZS4eOHa5N0t5+Fx1j8M0ZN63w
 o+gA==
X-Gm-Message-State: AOJu0Yw1TBuhmKUyvdtD5mLkoxGuxYxJPIlF5CZ16Jl7enFlDAooKy1A
 kn1lWRUlbSTJKbEtu3qjAdjYvtesbqGOx7cCfdgbWiePGF+UCxHa
X-Google-Smtp-Source: AGHT+IECw31XWKd+U7j9b/LiSbo9opwGRS/q3/tik63UV+snDZRshYv6V4za3/FUyIWHMnbBx5WXpxOt6SS1GhjOoL4=
X-Received: by 2002:a25:ac89:0:b0:c5d:f2af:5a24 with SMTP id
 x9-20020a25ac89000000b00c5df2af5a24mr2106757ybi.14.1691655190358; Thu, 10 Aug
 2023 01:13:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230620104349.834687-1-valentin.caron@foss.st.com>
In-Reply-To: <20230620104349.834687-1-valentin.caron@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 10 Aug 2023 10:12:59 +0200
Message-ID: <CACRpkdYfPin4hAdPxUT7v20qeq3TeqQ9k-jtZLZCvRy0eZ7h1A@mail.gmail.com>
To: Valentin Caron <valentin.caron@foss.st.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] pinctrl: stm32: set default gpio line
	names using pin names
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

T24gVHVlLCBKdW4gMjAsIDIwMjMgYXQgMTI6NDPigK9QTSBWYWxlbnRpbiBDYXJvbgo8dmFsZW50
aW4uY2Fyb25AZm9zcy5zdC5jb20+IHdyb3RlOgoKPiBBZGQgc3RtMzJfcGN0cmxfZ2V0X2Rlc2Nf
cGluX2Zyb21fZ3BpbyBmdW5jdGlvbiB0byBmaW5kIGEgc3RtMzIgcGluCj4gZGVzY3JpcHRvciB3
aGljaCBpcyBtYXRjaGluZyB3aXRoIGEgZ3Bpby4KPiBNb3N0IG9mIHRoZSB0aW1lIHBpbiBudW1i
ZXIgaXMgZXF1YWwgdG8gcGluIGluZGV4IGluIGFycmF5LiBTbyB0aGUgZmlyc3QKPiBwYXJ0IG9m
IHRoZSBmdW5jdGlvbiBpcyB1c2VmdWwgdG8gc3BlZWQgdXAuCj4KPiBBbmQgZHVyaW5nIGdwaW8g
YmFuayByZWdpc3Rlciwgd2Ugc2V0IGRlZmF1bHQgZ3BpbyBuYW1lcyB3aXRoIHBpbiBuYW1lcy4K
Pgo+IFNpZ25lZC1vZmYtYnk6IFZhbGVudGluIENhcm9uIDx2YWxlbnRpbi5jYXJvbkBmb3NzLnN0
LmNvbT4KClBhdGNoIGFwcGxpZWQhCgpZb3VycywKTGludXMgV2FsbGVpagpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxp
c3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
