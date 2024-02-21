Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB5E85EB91
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Feb 2024 23:07:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0322FC6B45E;
	Wed, 21 Feb 2024 22:07:25 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com
 [209.85.128.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 561CBC65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Feb 2024 22:07:23 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-60495209415so70376057b3.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Feb 2024 14:07:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708553242; x=1709158042;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1cIdAj9Rc9YrdEZf80SuI9gbBcjMeYE4blz3NlBPNkk=;
 b=zz900cFZxUmYYNZ9yWDjqoNaris4281yOPzJTNnNgvLNY5UOfv7IHA8pNOjmWoxqQz
 DVEZfXuYuJkKfRAViwL7FGDt84u8jY4CO49YtsApLU1MHzeHqYOJ0XBYWAmw3JhiSfF4
 jn4CFFIc5J6XMLRyL6pTpKH8/J2O8ERfW9vPhyORjjFqJj6c6Ta7ig/cd0o/C9W+BARC
 EeLI0BDFv1AQeDeivW+Sl4yrEOB+GY3zRXQvIWm76CNsPVfJOiLmf0ccNNaZicTOO34I
 2n41QLKKdgvnbnD3HpiMvC8fKC7G5RTTPYzvUGrHtLLZhNufAETBANlbtD3Zme2DcfnX
 PZKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708553242; x=1709158042;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1cIdAj9Rc9YrdEZf80SuI9gbBcjMeYE4blz3NlBPNkk=;
 b=BLeyZZurwWE1+9lzbyFDI0N3FgSzS0dIoO2X6AHlPMe7VzJqjP/Jpt7t9EkGKMyDq+
 N4ZAGQvW2/zX4xefA+Z45N/eNf2lEzFX00/zcuuxtJt5IwibrQUacCMkyzY10eRuXmBh
 vkdJqNlTQLdvcCEKX5K9df76ZvrV4VAWXqHicdl/DXyN0zUm4X/ik3ykOEiEkDv9WJrD
 1jM0cZ+2sulv1EmBP/2Ny5D+i0K/lHo8QJGT7NmY00RHiThUmMvvCOBSQV19aRUOErKf
 qAU3N08TgKULwq0Pq1/H3jOx9OKPGJF/P20s/lD329zHln67SeX5nFD2ZQD/NIc5aYVy
 ddeg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9vX1TfLUGt8R1K5Fg1N0t8GQ5uCmKmj7vlM4D2D9TGcEiEQTc9EhahVOLOYP0cGRzcEysK8ycTHl+08CYxDF2i3zcg/JqPP6dnH1OPI1Wj5Ak0y87evFU
X-Gm-Message-State: AOJu0Yy6r3iTQJIkRYWw2Fq8qJsW1TscYCvrzovsnHJCv26u/ZWyvaNw
 Yfs0bUczlEoH3yLipFJVomKSpIAWXJLB7ehtJJkinAHcUbMO6HFohDJrVIGTJloU+6Lb71lrret
 z5NWyquTB7rICk6xaSzs9pJSGgCXQX9RMFnNL5Q==
X-Google-Smtp-Source: AGHT+IHcXCkZHHGUkDm2xvIgiK6VurrE3eAJdP/r6uC/vcQd0YLTd8DmYtHQlaiiKrj98oMZezfQEBryKYUS8JEchGY=
X-Received: by 2002:a05:690c:86:b0:607:d9f7:e884 with SMTP id
 be6-20020a05690c008600b00607d9f7e884mr20419761ywb.4.1708553242109; Wed, 21
 Feb 2024 14:07:22 -0800 (PST)
MIME-Version: 1.0
References: <20240217093937.58234-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240217093937.58234-1-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 21 Feb 2024 23:07:11 +0100
Message-ID: <CACRpkdajVH4Y2K5W+o5XAoiEr57ObVbaR+9QdFV=Cp765B+dfQ@mail.gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 Kishon Vijay Abraham I <kishon@kernel.org>, linux-samsung-soc@vger.kernel.org,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [Linux-stm32] [PATCH] phy: constify of_phandle_args in xlate
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

T24gU2F0LCBGZWIgMTcsIDIwMjQgYXQgMTA6MznigK9BTSBLcnp5c3p0b2YgS296bG93c2tpCjxr
cnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+IHdyb3RlOgoKPiBUaGUgeGxhdGUgY2FsbGJh
Y2tzIGFyZSBzdXBwb3NlZCB0byB0cmFuc2xhdGUgb2ZfcGhhbmRsZV9hcmdzIHRvIHByb3Blcgo+
IHByb3ZpZGVyIHdpdGhvdXQgbW9kaWZ5aW5nIHRoZSBvZl9waGFuZGxlX2FyZ3MuICBNYWtlIHRo
ZSBhcmd1bWVudAo+IHBvaW50ZXIgdG8gY29uc3QgZm9yIGNvZGUgc2FmZXR5IGFuZCByZWFkYWJp
bGl0eS4KPgo+IFNpZ25lZC1vZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5r
b3psb3dza2lAbGluYXJvLm9yZz4KKC4uLikKPiAgZHJpdmVycy9waW5jdHJsL3RlZ3JhL3BpbmN0
cmwtdGVncmEteHVzYi5jICAgICAgICAgfCAgMiArLQoKQWNrZWQtYnk6IExpbnVzIFdhbGxlaWog
PGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KCllvdXJzLApMaW51cyBXYWxsZWlqCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxp
bmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8v
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMy
Cg==
