Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4406ABA99
	for <lists+linux-stm32@lfdr.de>; Mon,  6 Mar 2023 11:02:01 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 29681C65048;
	Mon,  6 Mar 2023 10:02:01 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com
 [209.85.128.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1D95CC01E98
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Mar 2023 10:01:59 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-53852143afcso174085017b3.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 06 Mar 2023 02:01:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QD4rUPOwl3QwymfiFfudLxgF+k9sizGQtygZ6Xm8TaU=;
 b=En/KrIn6bNmZttBEZpgWZAjYMwbfb90TweOp8cecesdczbo2sLeXNl6Ju8cerTmrvu
 c1fVqDBfsFCMxq2fu9UrEY6qQMWMmzAB8jRd6ipdmCvWjnO5Gqt1ZValbHqzCgWoWLxr
 InCFNKXaVTgLVyN3iNaYH/IrMmVGvhXsRezr8EdfH+dEP/F0R95IrzSbdghn01qDuYi/
 4hzkC95K2bRJek78QyTcf4UnTTIiVwDdiiMxQ9mVHe1Zm0T0QEag0jr0cOYhzCuE3awk
 VCpeMfghlz5KXrFklJkdSHykKMLq5/94TBP2Vg+Kl2Sh2Uqs4/CtJ9/Y87njdc7oQKP4
 yemQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QD4rUPOwl3QwymfiFfudLxgF+k9sizGQtygZ6Xm8TaU=;
 b=xcT71TDJLE2bReK6yIvNZ4iGwlVwHUphp/+09TdYNqwYK+14lKQ+b+m4+j4n8XXlS9
 4V0Crd910azV8mDSg6n0fbeRKGzMoDO9TcbX6RzZqmPLlbq/g9FRyufvb1TveVhw81NP
 qtg4I/GB1723nTGnUMWRb+fWpxTXsHp4QqAqT3pJubqvpQZEqf0gGZFQuL62lRr7ayr7
 e55g7P4R5t57BDSnnOtdEydn4BnnFQajMpPfNOCMoKf/UnSlSbkgyjYDRAL5gg6y/nYH
 /fyiPkDQFVGwOSZGUBNukO0DGDpb5+dsU0WhKqQLwd1Q/Azoiu5YJM8YJ29c0QcB9x37
 fpRQ==
X-Gm-Message-State: AO0yUKVWOMf7/oncrXfYESzKtn1knlb3lHWwqdsh3mppkR7xIu2YNddb
 ++IZYXUisaJeE5DA2z6b4mHuKmohxDsivaqPYEJ2vg==
X-Google-Smtp-Source: AK7set8yVm+4S3McVEwMVY5gRhLLC3IT/8pJgkJO55yRqGWg8PlD44jommdj8TfHnLckgPf3bx0xyH81bt2B2fGRuz0=
X-Received: by 2002:a81:a12:0:b0:533:9d13:a067 with SMTP id
 18-20020a810a12000000b005339d13a067mr8759239ywk.3.1678096918021; Mon, 06 Mar
 2023 02:01:58 -0800 (PST)
MIME-Version: 1.0
References: <ZAVu/XHbL9IR5D3h@gondor.apana.org.au>
 <E1pZ2fq-000e1q-0T@formenos.hmeau.com>
In-Reply-To: <E1pZ2fq-000e1q-0T@formenos.hmeau.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 6 Mar 2023 11:01:46 +0100
Message-ID: <CACRpkdZrOW3c6QkUVdyZie52S1XmWbexG2K=Ttmoi1fuOD+Nng@mail.gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Li kunyu <kunyu@nfschina.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-crypto@vger.kernel.org,
 mcoquelin.stm32@gmail.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [v5 PATCH 6/7] crypto: stm32 - Remove unused
	HASH_FLAGS_ERRORS
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

T24gTW9uLCBNYXIgNiwgMjAyMyBhdCA1OjQy4oCvQU0gSGVyYmVydCBYdSA8aGVyYmVydEBnb25k
b3IuYXBhbmEub3JnLmF1PiB3cm90ZToKCj4gVGhlIGJpdCBIQVNIX0ZMQUdTX0VSUk9SUyB3YXMg
bmV2ZXIgdXNlZC4gIFJlbW92ZSBpdC4KPgo+IFNpZ25lZC1vZmYtYnk6IEhlcmJlcnQgWHUgPGhl
cmJlcnRAZ29uZG9yLmFwYW5hLm9yZy5hdT4KClJldmlld2VkLWJ5OiBMaW51cyBXYWxsZWlqIDxs
aW51cy53YWxsZWlqQGxpbmFyby5vcmc+ClRlc3RlZC1ieTogTGludXMgV2FsbGVpaiA8bGludXMu
d2FsbGVpakBsaW5hcm8ub3JnPgoKWW91cnMsCkxpbnVzIFdhbGxlaWoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0
CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
