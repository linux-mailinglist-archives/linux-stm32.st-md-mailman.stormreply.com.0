Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A09ACEFB7
	for <lists+linux-stm32@lfdr.de>; Thu,  5 Jun 2025 14:57:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2BB4FC32EB5;
	Thu,  5 Jun 2025 12:57:25 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 94C94C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Jun 2025 12:57:24 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-5534f3722caso1161933e87.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 05 Jun 2025 05:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749128244; x=1749733044;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dp0oUZbHoiqC69CUU3moHGnpZ4l39TaovVOwY49CM+Y=;
 b=senOpW00fkK2lF8eMhehOBwRyDLGZOFWjKwjp/AR3oOd6UO7S/wqrBHCP+dniZGWNd
 TX6UjePGr0H9tSyJOqSvXAt0ghXvsip0qk4tBGrVCIzBd4mvf9EaUXuAdh0mmIux2e9F
 1IiWQHzvKDRMoAFEfHIo90jfQlS/ovUJVV/YEYxxczcaCqIlyXqbkPCdkx8xNjBFd9Ho
 ZioOP1CF7aZmAKBiY+m+44/pGtBLGDOJOL3YTuli9v+k2cFSOqaw1eKNTPWrdva4+8Ks
 WSGPMR2tH1EoXa5/BmGS9Bus+J19cgI6WnwZ21ud3WExV1DDhohUUZsF9RvGsHK02E98
 wp3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749128244; x=1749733044;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dp0oUZbHoiqC69CUU3moHGnpZ4l39TaovVOwY49CM+Y=;
 b=HblY4o35XzbclNtQS+DjvZPCgYDG+sv/PEAJYc5x2GO7mTbOS0iws5RDXuAYW8VB0e
 B5nd6ynJSiWva/DIQSHjKNg1tTjlFwbZETCF72+Y1e0W9HEAJ5ApMWX/COX2cEQRHKpW
 HI37HbklWJUplaY1UmpJDY3Nx4rxXbaST683OzoGKiELHnqSxPhJn+z9jGh61MjVuRBl
 iJYn3I0J4XsYmcCeuHbyjLwOCJhu5WfaVn7jZLNYmMLmBJqxqC7YgqPGuUp1KRWVNUO5
 kNkqvMTcD9cP1DMv4QWReVl1/GKZEUV7aLYsIC8w94AIuOsqb2OZBHecAkX57DVOF3y5
 4oow==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnpRYVX3B5J5oQulX1Z58c6ZnL7As7rm7Tqaa4nop5xE3uXcVr/fbJlp6OsiUtirSHRXYjnASsYRuDFA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Ywg7dLQqbC/WeGq1SReJG5BqmQKkxdqlfFqJJBvmi+mi2IkAAOB
 KcZBtutN/qhbiG4oOX9MXQub/HcrNP7E2vC3QUDqUfN/6l/xXACbCPUJhpjSnB2wmBuklyfbtiB
 +idKYeBfG8opCvWMsNMTuriQSHvlqkw2/FHLnB7LADw==
X-Gm-Gg: ASbGncvN/G0PJ0ijo+ZSZcyAXZKadBkwUNkw+tCRdRhU587/IDBuZFDvFEajvtqua1K
 7xa34Kjz/iZckq8gt03+eFZQdtdxXcRqft2dElBsr8HyxaiYZwciZmxEvNop54mgofV3BFKB+qx
 awrcBFoB4vcymTVn8SixeCM73VyX5nDQCn
X-Google-Smtp-Source: AGHT+IH9Fc11r+z9z+t3mefrHIVAfP3iFGxFMGaJxOiqNg6l3VU72qxYnBUmiH/fduZ1DDpbUCP8vP1nlENlTDvVodQ=
X-Received: by 2002:a05:6512:131b:b0:553:2cef:2d2e with SMTP id
 2adb3069b0e04-55356bf062emr1989659e87.22.1749128243632; Thu, 05 Jun 2025
 05:57:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250523-hdp-upstream-v3-0-bd6ca199466a@foss.st.com>
 <20250523-hdp-upstream-v3-8-bd6ca199466a@foss.st.com>
In-Reply-To: <20250523-hdp-upstream-v3-8-bd6ca199466a@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 5 Jun 2025 14:57:11 +0200
X-Gm-Features: AX0GCFtoxtlGiRHxvWStpchY7_DopJKwnpQcArCi5YFUYLwYh-hGYulMuAzYZ6s
Message-ID: <CACRpkdaXY1=v_HY9-PDZ=HYwJrP7P8ncZoCDm1da=vxoEazD4Q@mail.gmail.com>
To: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 8/9] ARM: dts: stm32: add alternate
 pinmux for HDP pin and add HDP pinctrl node
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

T24gRnJpLCBNYXkgMjMsIDIwMjUgYXQgMjo0MOKAr1BNIENsw6ltZW50IExlIEdvZmZpYwo8Y2xl
bWVudC5sZWdvZmZpY0Bmb3NzLnN0LmNvbT4gd3JvdGU6Cgo+IEludHJvZHVjZSBoZHAgbm9kZSB0
byBvdXRwdXQgYSB1c2VyIGRlZmluZWQgdmFsdWUgb24gcG9ydCBoZHAyLgo+IEFkZCBwaW5jdHJs
IG5vZGVzIHRvIGJlIGFibGUgdG8gb3V0cHV0IHRoaXMgc2lnbmFsIG9uIG9uZSBTb0MgcGluLgo+
Cj4gU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTGUgR29mZmljIDxjbGVtZW50LmxlZ29mZmljQGZv
c3Muc3QuY29tPgoKVGhhdCdzIG5pY2UsIHRoaXMgaXMgZXhhY3RseSBob3cgcGluIGNvbnRyb2wg
aXMgc3VwcG9zZWQgdG8gYmUKdXNlZCEKUmV2aWV3ZWQtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVz
LndhbGxlaWpAbGluYXJvLm9yZz4KCllvdXJzLApMaW51cyBXYWxsZWlqCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlz
dApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
