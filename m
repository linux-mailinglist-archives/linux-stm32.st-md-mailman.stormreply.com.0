Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E804110BB54
	for <lists+linux-stm32@lfdr.de>; Wed, 27 Nov 2019 22:12:53 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ACF8AC36B0B;
	Wed, 27 Nov 2019 21:12:53 +0000 (UTC)
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9E849C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Nov 2019 21:12:52 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id w24so20398792otk.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Nov 2019 13:12:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=cImB892YXUVPGGhFezh816WamO3nmCEALpwjUr8+dkg=;
 b=YzGw9Xod0IM3XsAAU8h0IeticDdIZWAvEKobIYWKVBgWtDOqz9cYKT3AHJNBTmiOxQ
 uKHr4rXYo4BlCFktzKcxxXLASukV9e60O/RP2rIzlP3OUNZk3d53DkVftQM3MCpu3NQM
 PE6u/TsaPJBF02PST0iQXVfxoPcVeNleRVSjHm+XpmWIcClPNhdPioVom+pxZtITjN7S
 GOL22FhBtJVyCZh1R8MxLNtBYgXlNlmfTJ4HWpDyElAj+VTUM7ekHi7Sca7huZtUYQWh
 7N03fiChyjMvlyqpS5Peb86doutKfqIQHPKXFVRmlqERqHPwFLwZj4PGrdgDVHDqSEI9
 CdWQ==
X-Gm-Message-State: APjAAAU9uaCpAcBAh3EgFLGcocOSAE3N1g2ckbnpu1YG/GI15kSSBssi
 //ujfeb8oIECLTwSb8Icc6ZaVE/F9X37aSr8uac=
X-Google-Smtp-Source: APXvYqxh3g09zK8yoW4/yyNAk1QlyeyoV8wcshHdQWMv3ezyM47GygheulvdavD9PmPbPqN6RamYKOqEfquQDCZNc+o=
X-Received: by 2002:a9d:17ca:: with SMTP id j68mr5270571otj.250.1574889171373; 
 Wed, 27 Nov 2019 13:12:51 -0800 (PST)
MIME-Version: 1.0
References: <cover.1574871463.git.nishadkamdar@gmail.com>
 <5a7ed2e4b58ba7ff2f0638a2435a3a1e1c62c9f6.1574871463.git.nishadkamdar@gmail.com>
 <CAMuHMdUqfRioTBV27AKx9zv9YuSqEod6x+A4aguf=h20TDXr6w@mail.gmail.com>
 <9bacc7d9-6bd9-0b7c-18cd-d614796397dd@suse.de>
 <ae40eb808f420f5de4a140b8757dfbc426a8cf90.camel@perches.com>
In-Reply-To: <ae40eb808f420f5de4a140b8757dfbc426a8cf90.camel@perches.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 Nov 2019 22:12:39 +0100
Message-ID: <CAMuHMdUSSHvQ74c156tuhWShp05TQuSmXa-kY3HNbYj0VL_d4g@mail.gmail.com>
To: Joe Perches <joe@perches.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Nishad Kamdar <nishadkamdar@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kevin Hilman <khilman@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>,
 Sean Wang <sean.wang@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 linux-gpio <linux-gpio@vger.kernel.org>, linux-mediatek@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-amlogic <linux-amlogic@lists.infradead.org>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 4/5] pinctrl: sh-pfc: Use the correct
 style for SPDX License Identifier
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

T24gV2VkLCBOb3YgMjcsIDIwMTkgYXQgOTo1OSBQTSBKb2UgUGVyY2hlcyA8am9lQHBlcmNoZXMu
Y29tPiB3cm90ZToKPiBPbiBXZWQsIDIwMTktMTEtMjcgYXQgMjE6NTUgKzAxMDAsIEFuZHJlYXMg
RsOkcmJlciB3cm90ZToKPiA+IEhvd2V2ZXIsIGlmIHdlJ3JlIHRvdWNoaW5nIHRoZXNlIGxpbmVz
IGFueXdheSwgc2hvdWxkbid0IHdlIGJlIHVwZGF0aW5nCj4gPiB0aGUgU1BEWCBJZGVudGlmaWVy
IHRvIEdQTC0yLjAtb25seSB3aGlsZSBhdCBpdD8KPgo+IFByb2JhYmx5IGJldHRlciB0byBkbyB0
aGF0IHdpdGggYSB0cmVld2lkZSBzY3JpcHQgb25lIGRheS4KClllYWguLi4gQnV0IGl0J3MgYWxy
ZWFkeSBtb3JlIHRoYW4gb25lIHllYXIgYWZ0ZXIKCj4gaHR0cHM6Ly9sa21sLm9yZy9sa21sLzIw
MTgvOC8xNi80ODcKCmFuZCBEb2N1bWVudGF0aW9uL3Byb2Nlc3MvbGljZW5zZS1ydWxlcy5yc3Qg
KHdoaWNoIGlzIHRoZSBhdXRob3JpdGl2ZQpydWxlPykgc3RpbGwgaGFzbid0IGJlZW4gdXBkYXRl
ZC4uLgoKR3J7b2V0amUsZWV0aW5nfXMsCgogICAgICAgICAgICAgICAgICAgICAgICBHZWVydAoK
LS0gCkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlh
MzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0
aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKd2hlbiBJJ20g
dGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhp
bmcgbGlrZSB0aGF0LgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRv
cnZhbGRzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXN0bTMyCg==
