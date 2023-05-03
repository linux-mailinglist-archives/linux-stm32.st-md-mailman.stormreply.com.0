Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 374066F53C4
	for <lists+linux-stm32@lfdr.de>; Wed,  3 May 2023 10:56:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DCF10C6A60D;
	Wed,  3 May 2023 08:56:44 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com
 [209.85.128.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 06569C64110
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 May 2023 08:56:42 +0000 (UTC)
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-559e317eef1so60514887b3.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 03 May 2023 01:56:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683104202; x=1685696202;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nLIjSxvkFoShCDz7/AeeChAXiJ9TCtnKs3s5wZ5JN+8=;
 b=DpQL3UQ9J5WAJ21S42UQ8brSOvVOTeCt9kTFlir9wXTpUjUB8/bPrfn1luYNif2N/C
 K5VIq6PLszUuvgYce7j2umw3oFiXE8DLPlIrw6hH8o6pDEHAFJyoMr5ksHGcKasz0DYb
 ddbIboB0VfW8eYx2WmIayef32QTY/pPAgleI71/Z/NE2ohegRx8TpmGwZbiFxG4gYcuC
 1hKYe+7WFVfvO1hEfo5hlJYw/YzAH16k/ecWnsJvpqF/oOXbT+NqVYo2M6mTPZXYopTt
 77Symr1X3ekSWTVxeFBr2ZTuvGynJzlke0Jsbi3ATgjLo9L8/hRgYsibJq+Ng3Xfmcaz
 hu5A==
X-Gm-Message-State: AC+VfDwx2CL09eT9/cleuD7YeovFl5oJ4Uk7U7nVt5pGogs+4h7ofcIb
 DCQhe60DVvg0cnofH3B02FlZswC2VV2ZDw==
X-Google-Smtp-Source: ACHHUZ75UwG47zqJH875T3aFja1BNUeK4WksNfdfE4GevObMwHYla0/t4ma+bBbQNtA01qBQSMLYfA==
X-Received: by 2002:a81:6cd7:0:b0:55a:a1e5:9e22 with SMTP id
 h206-20020a816cd7000000b0055aa1e59e22mr4379767ywc.27.1683104201651; 
 Wed, 03 May 2023 01:56:41 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com.
 [209.85.128.176]) by smtp.gmail.com with ESMTPSA id
 e17-20020a5b0cd1000000b00b9dfcc7a1fasm1768033ybr.7.2023.05.03.01.56.39
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 May 2023 01:56:39 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-559e317eef1so60514097b3.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 03 May 2023 01:56:39 -0700 (PDT)
X-Received: by 2002:a25:fc1b:0:b0:b9a:6f77:9018 with SMTP id
 v27-20020a25fc1b000000b00b9a6f779018mr19158460ybd.41.1683104199175; Wed, 03
 May 2023 01:56:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220328000915.15041-1-ansuelsmth@gmail.com>
 <85eb14ec-f465-7447-ad77-a3dabc666f47@kernel.org>
 <YkKRYnN84D9VZhGj@Ansuel-xps.localdomain>
 <CAL_Jsq+RQQ-ADMxLPUFwk6S6kGmb6oNDy4k52fnU0EtbUvqmSA@mail.gmail.com>
 <CAMuHMdWNTE48MFy6fqxAsfMWz9b6E7dVNXtXtESP95sxk2PGwA@mail.gmail.com>
 <CAL_JsqJthKTm8bhRF2B=ae1tvtPeYYXx_Tm76qQtSwLtH5C6VA@mail.gmail.com>
 <720a2829-b6b5-411c-ac69-9a53e881f48d@app.fastmail.com>
 <CAL_JsqKCtmkwzKa01gyG65fH8ye6R3KhR41PJbJhOJ4X9j=znA@mail.gmail.com>
In-Reply-To: <CAL_JsqKCtmkwzKa01gyG65fH8ye6R3KhR41PJbJhOJ4X9j=znA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 3 May 2023 10:56:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXjKwfBizmH8cZYEmVC2ZYLLqQG4kyrHm6Ct0j4EK4eQg@mail.gmail.com>
Message-ID: <CAMuHMdXjKwfBizmH8cZYEmVC2ZYLLqQG4kyrHm6Ct0j4EK4eQg@mail.gmail.com>
To: Rob Herring <robh+dt@kernel.org>
Cc: linux-aspeed@lists.ozlabs.org, linux-realtek-soc@lists.infradead.org,
 linux-arm-kernel@axis.com, linux-stm32@st-md-mailman.stormreply.com,
 chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 openbmc@lists.ozlabs.org, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 linux-arm-msm@vger.kernel.org, linux-actions@lists.infradead.org,
 linux-unisoc@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Linux-OMAP <linux-omap@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Christian Marangi <ansuelsmth@gmail.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>, kernel@dh-electronics.com,
 Olof Johansson <olof@lixom.net>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "linux-oxnas@groups.io" <linux-oxnas@groups.io>
Subject: Re: [Linux-stm32] [RFC PATCH 0/1] Categorize ARM dts directory
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

SGkgUm9iLAoKT24gVHVlLCBNYXkgMiwgMjAyMyBhdCA5OjQw4oCvUE0gUm9iIEhlcnJpbmcgPHJv
YmgrZHRAa2VybmVsLm9yZz4gd3JvdGU6Cj4gICAgICdyNycgOiAncmVuZXNhcycsCj4gICAgICdy
OCcgOiAncmVuZXNhcycsCj4gICAgICdyOScgOiAncmVuZXNhcycsCj4gICAgICdlbWV2MicgOiAn
cmVuZXNhcycsCj4gICAgICdzaDczYScgOiAncmVuZXNhcycsCj4gICAgICdnci0nIDogJ3JlbmVz
YXMnLAo+ICAgICAnaXdnJyA6ICdyZW5lc2FzJywKCkFja2VkLWJ5OiBHZWVydCBVeXR0ZXJob2V2
ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPgoKR3J7b2V0amUsZWV0aW5nfXMsCgogICAgICAg
ICAgICAgICAgICAgICAgICBHZWVydAoKLS0gCkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdz
IGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBl
cnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxm
IGEgaGFja2VyLiBCdXQKd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5
ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0LgogICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0z
MkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
