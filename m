Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 26411246D82
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Aug 2020 19:01:15 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DC4BBC32E8F;
	Mon, 17 Aug 2020 17:01:14 +0000 (UTC)
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
 [209.85.166.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 480DEC36B26
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Aug 2020 17:01:12 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id h4so18330326ioe.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Aug 2020 10:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7QBcITzR7oBFEugc9nX1hxSt40e3uHeGjBJ8k9Ii1wk=;
 b=fHgr2XhLG9zj5YkcLQCd22NWhIzfoaeu5QeDS+zuPzhgz6A9WrGtRdh1mQGvYcgzgH
 6fj9TEyhln/WsR5x6BeC/423hYjuYZ9wlMXn5FPXN6T07cqvK8Y0oPlHotB2Gh5KOdJT
 LJif1UzKeOQupsxHtrzDH/KPmIbvLLTsQG6KiVJJ3NvgHwx1pmdFar1M/FHW0UasC8Ll
 R6VPhg+9IY93n8I8ad7FHyBc+B1u5jept/EHHoEy+14aujf43pE8VBOGQoTiOWPAvjEb
 WdQW5G6QLx6h4Ma3swlKqupxWiwrjKAcA1iKiIuVFJMfGb0ZdOml/F6Vl6D2fImHN7d0
 gJ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7QBcITzR7oBFEugc9nX1hxSt40e3uHeGjBJ8k9Ii1wk=;
 b=sRQO9F4OUkfe9Xp/GjqKBiUpUbOkZK8+WfWpZUTjEPCUnIovOJ5BeKqd6BsOGlExvJ
 wYD1NuocKrERMKtWs0MnXnC1zk33IOdzFCGbseWyKQx0b+nK1LZ2qQAKvU0m/3zVJmaB
 3enRiJLzyGNeCSa77ei3Vdvm0KEG2QPl1taujuiDVsyKjq53CMoLXaVoEY2BOCFJx/fD
 hMGYHheb5d7igQHFdKsF7Go70X0ekkHOWkZf3PbmsmfWiAoz5eLMUYAK0IHtvIY+SdEM
 8QUvfUBvilkkX9LG0kIvT/Ro20L8F09NwPQ8LPOvL1P9UEt3a2+ZYxr60kn7ZpEUmk+4
 yc6w==
X-Gm-Message-State: AOAM53237+BDRJybLN2mqB/XT7lacLvrXzX7ijdVS5R9NZnBNEndRBKa
 4gb5PS2wspUSmsxh4p7AzI6gRVn4tx+aUEp9bTc=
X-Google-Smtp-Source: ABdhPJyXrGoxJReNPAI+1RpBbwcrrU2PnQSgVLTs6ychSyck01qgTlPaYHYMzi+J5YyRvm1QP4hn4zCwUZeN4+VdjeU=
X-Received: by 2002:a02:95ae:: with SMTP id b43mr15158386jai.19.1597683670733; 
 Mon, 17 Aug 2020 10:01:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200804192654.12783-1-krzk@kernel.org>
 <20200804192654.12783-7-krzk@kernel.org>
 <20200817165748.GA29664@kozik-lap>
In-Reply-To: <20200817165748.GA29664@kozik-lap>
From: Tomasz Figa <tomasz.figa@gmail.com>
Date: Mon, 17 Aug 2020 19:00:54 +0200
Message-ID: <CA+Ln22Hw8_FT0s2N0rBo=2XVmuLagj=BFrTkTGd10J7d4B1Jow@mail.gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Will Deacon <will@kernel.org>,
 "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
 linux-watchdog@vger.kernel.org,
 "moderated list:SAMSUNG SOC CLOCK DRIVERS" <linux-samsung-soc@vger.kernel.org>,
 Sylwester Nawrocki <snawrocki@kernel.org>, Cedric Roux <sed@free.fr>,
 Russell King <linux@armlinux.org.uk>, linux-stm32@st-md-mailman.stormreply.com,
 Lihua Yao <ylhuajnu@outlook.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Kukjin Kim <kgene@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Guenter Roeck <linux@roeck-us.net>, Sergio Prado <sergio.prado@e-labworks.com>,
 Arnd Bergmann <arnd@arndb.de>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Simtec Linux Team <linux@simtec.co.uk>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Stephen Boyd <sboyd@kernel.org>, patches@opensource.cirrus.com,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v2 06/13] ARM: samsung: remove
 HAVE_S3C2410_WATCHDOG and use direct dependencies
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

MjAyMOW5tDjmnIgxN+aXpSjmnIgpIDE4OjU3IEtyenlzenRvZiBLb3psb3dza2kgPGtyemtAa2Vy
bmVsLm9yZz46Cj4KPiBPbiBUdWUsIEF1ZyAwNCwgMjAyMCBhdCAwOToyNjo0N1BNICswMjAwLCBL
cnp5c3p0b2YgS296bG93c2tpIHdyb3RlOgo+ID4gQSBzZXBhcmF0ZSBLY29uZmlnIG9wdGlvbiBI
QVZFX1MzQzI0MTBfV0FUQ0hET0cgZm9yIFNhbXN1bmcgU29DcyBpcyBub3QKPiA+IHJlYWxseSBu
ZWVkZWQgYW5kIHRoZSBzM2MyNHh4IHdhdGNoZG9nIGRyaXZlciBjYW4gZGVwZW5kIG9uIFNhbXN1
bmcgQVJNCj4gPiBhcmNoaXRlY3R1cmVzIGluc3RlYWQuCj4gPgo+ID4gVGhlICJIQVZFX3h4eF9X
QVRDSERPRyIgcGF0dGVybiBvZiBkZXBlbmRlbmN5IGlzIG5vdCBwb3B1bGFyIGFuZCBTYW1zdW5n
Cj4gPiBwbGF0Zm9ybXMgYXJlIGhlcmUgZXhjZXB0aW9ucy4gIEFsbCBvdGhlcnMganVzdCBkZXBl
bmQgb24KPiA+IENPTkZJR19BUkNIX3h4eC4KPiA+Cj4gPiBUaGlzIG1ha2VzIHRoZSBjb2RlIHNs
aWdodGx5IHNtYWxsZXIgd2l0aG91dCBhbnkgY2hhbmdlIGluCj4gPiBmdW5jdGlvbmFsaXR5Lgo+
ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9y
Zz4KPiA+Cj4gPiAtLS0KPiA+Cj4gPiBDaGFuZ2VzIHNpbmNlIHYxOgo+ID4gMS4gUmUtYWRkIHRo
ZSBkZXBlbmRlbmN5IG9uIGFyY2hpdGVjdHVyZXMgdG8ga2VlcCBzYW1lIGZ1bmN0aW9uYWxpdHku
Cj4KPiBIaSBHdWVudGVyLCBUb21hc3osCj4KPiBEb2VzIHN1Y2ggcmVtb3ZhbCBvZiBIQVZFX1Mz
QzI0MTBfV0FUQ0hET0cgbWFrZXMgc2Vuc2UgZm9yIHlvdT8KCkkgZG9uJ3QgaGF2ZSBhbnkgb2Jq
ZWN0aW9ucyBhbmQgdGhlIHBhdGNoIGl0c2VsZiBpcyB0cml2aWFsLgoKQmVzdCByZWdhcmRzLApU
b21hc3oKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtc3RtMzIK
