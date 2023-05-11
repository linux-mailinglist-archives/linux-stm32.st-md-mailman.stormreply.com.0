Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DFCB6FFB5C
	for <lists+linux-stm32@lfdr.de>; Thu, 11 May 2023 22:39:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 336CBC6A5F2;
	Thu, 11 May 2023 20:39:31 +0000 (UTC)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com
 [209.85.219.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EFF11C65E60
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 May 2023 20:39:29 +0000 (UTC)
Received: by mail-yb1-f169.google.com with SMTP id
 3f1490d57ef6-b9a6f17f2b6so43382758276.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 May 2023 13:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683837569; x=1686429569;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YPotC0zFlPNtcMObMVmELxdnXPz39b6sZUmm6zOgyxo=;
 b=gGTCWTJTF5hldA4oKl8BORGib6HJaSuYNLFY2ONmtdsNKbOSopuMG8M+l+yFh9N3a0
 A23VtpOVw2EFp5m0eYMST2x/vT+MOHclw0C0vDR/X4Okix9qcJN2+r2owTmUOASosySM
 OUx+p8iN63VzhCYmN0EWGKLZu0FAsbAikwSZb/asPXNFo0/kIBK53mrHeSfocTx1aMk7
 Y1w+AjeWA45YIaGe8182bexPCh6/8NRs/lUuY45dLn4xekj/codxsMNP0Smp/JHBVeLd
 J/PIxF/Wb3ZkvQ1T/msXef7B3EUz60TQqNhODltTj94D4We2+Mt+9xS6WU8+J/kVhTmm
 pCQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683837569; x=1686429569;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YPotC0zFlPNtcMObMVmELxdnXPz39b6sZUmm6zOgyxo=;
 b=HbMVBFX4XCDhFXTrUj3i9FQKDCg0NNEAf5GPe5kfm1UKr/07h7wwAJ8JwroSre9lIb
 +2e0kZI4d24+bWiBF8Ib58WA7vNyfCMg7s9m3epqgfjeAeUramTfelNEgzYPr2OW1kFi
 4LH8oWQF8x/Hsv381oHf8U8786zVswcptDigOh5T1Ad3QJ9cHfSN39EVdKeFdkq4VDyM
 CEwCTO+TKNWO36boapWXtFnJhQ0UYvenXFB8fJYXeiG9XA6Kj+5oavD37pCR3UX5biLv
 H+C1IxD1Tj79cKGerVE9WmnHsVZkt1fDJgLM8D9BK0Tahlx6aP75qNBne0BwOcwz8Fwe
 elQA==
X-Gm-Message-State: AC+VfDx6UZpVUR8MbDw8a/KpoGkSCJzihdfJkom2NniQwj5CjKc5e0DZ
 1lOFcdOM5xTWinzB/pynO1kIHqkZ8OEGSEvKr4dtQQ==
X-Google-Smtp-Source: ACHHUZ6J8AXhNIs4LdLg2W8Ya7OpMAQJWI9ySklLxzKVsUcvMYkrM4av+Ro/kBeI7UZP6hLfkSA5V0YMPYlkU8dk/1U=
X-Received: by 2002:a81:920b:0:b0:55d:820f:11e7 with SMTP id
 j11-20020a81920b000000b0055d820f11e7mr21059000ywg.2.1683837568848; Thu, 11
 May 2023 13:39:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230426-stmpe-dt-bindings-v4-0-36fdd53d9919@linaro.org>
 <20230426-stmpe-dt-bindings-v4-1-36fdd53d9919@linaro.org>
 <CAMRc=MdsBiV3AvzSPtCuR58w0N9z7o+hUrBDtXUC4a++pECb8w@mail.gmail.com>
In-Reply-To: <CAMRc=MdsBiV3AvzSPtCuR58w0N9z7o+hUrBDtXUC4a++pECb8w@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 11 May 2023 22:39:17 +0200
Message-ID: <CACRpkdaJrB1f13LB4aHSWys63448a4NQZORgwdk8z=C8qe-BDA@mail.gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-gpio@vger.kernel.org, Lee Jones <lee@kernel.org>,
 Stefan Agner <stefan@agner.ch>, linux-kernel@vger.kernel.org,
 Philippe Schenker <philippe.schenker@toradex.com>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-input@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 1/2] dt-bindings: gpio: Convert STMPE
	GPIO to YAML schema
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

T24gVGh1LCBNYXkgMTEsIDIwMjMgYXQgNDo1OOKAr1BNIEJhcnRvc3ogR29sYXN6ZXdza2kgPGJy
Z2xAYmdkZXYucGw+IHdyb3RlOgoKPiBBcHBsaWVkLCB0aGFua3MhCgpUaGF0IHdvcmtzIC4uLiBi
dXQgcGF0Y2ggMi8yIGRlcGVuZHMgb24gdGhpcyBvbmUuICh1c2VzICRyZWYpLgpZb3UnZCBoYXZl
IHRvIGdpdmUgTGVlIGFuIGltbXV0YWJsZSBicmFuY2ggdGhhdCBoZSBjYW4gcHVsbApiZWZvcmUg
YXBwbHlpbmcgcGF0Y2ggMi8yIHNvIGhlIGhhcyB0aGUgZGVwZW5kZW5jeSwgb3IgbGV0IGhpbQph
cHBseSBib3RoLgoKWW91cnMsCkxpbnVzIFdhbGxlaWoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0
bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
