Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C96910C4AF
	for <lists+linux-stm32@lfdr.de>; Thu, 28 Nov 2019 09:05:57 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3FE9BC36B0B;
	Thu, 28 Nov 2019 08:05:57 +0000 (UTC)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7274CC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Nov 2019 20:55:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8DE6AAC12;
 Wed, 27 Nov 2019 20:55:40 +0000 (UTC)
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Nishad Kamdar <nishadkamdar@gmail.com>
References: <cover.1574871463.git.nishadkamdar@gmail.com>
 <5a7ed2e4b58ba7ff2f0638a2435a3a1e1c62c9f6.1574871463.git.nishadkamdar@gmail.com>
 <CAMuHMdUqfRioTBV27AKx9zv9YuSqEod6x+A4aguf=h20TDXr6w@mail.gmail.com>
From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Organization: SUSE Software Solutions Germany GmbH
Message-ID: <9bacc7d9-6bd9-0b7c-18cd-d614796397dd@suse.de>
Date: Wed, 27 Nov 2019 21:55:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUqfRioTBV27AKx9zv9YuSqEod6x+A4aguf=h20TDXr6w@mail.gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 28 Nov 2019 08:05:55 +0000
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kevin Hilman <khilman@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>,
 Sean Wang <sean.wang@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Joe Perches <joe@perches.com>, linux-gpio <linux-gpio@vger.kernel.org>,
 linux-mediatek@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-amlogic <linux-amlogic@lists.infradead.org>,
 linux-stm32@st-md-mailman.stormreply.com,
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

SGkgR2VlcnQsCgpBbSAyNy4xMS4xOSB1bSAyMTozNyBzY2hyaWViIEdlZXJ0IFV5dHRlcmhvZXZl
bjoKPiBPbiBXZWQsIE5vdiAyNywgMjAxOSBhdCA1OjQ2IFBNIE5pc2hhZCBLYW1kYXIgPG5pc2hh
ZGthbWRhckBnbWFpbC5jb20+IHdyb3RlOgo+PiBUaGlzIHBhdGNoIGNvcnJlY3RzIHRoZSBTUERY
IExpY2Vuc2UgSWRlbnRpZmllciBzdHlsZSBpbgo+PiBoZWFkZXIgZmlsZXMgcmVsYXRlZCB0byBS
ZW5lc2VzIFNvYyBwaW5jdHJsIGRyaXZlci4KPj4gSXQgYXNzaWducyBleHBsaWNpdCBibG9jayBj
b21tZW50IGZvciB0aGUgU1BEWCBMaWNlbnNlIElkZW50aWZpZXIuCj4gCj4gSXMgaXQgaW5jb3Jy
ZWN0IHRvIG5vdCBoYXZlIGFuIGV4cGxpY2l0IGJsb2NrIGNvbW1lbnQ/CgpZZXMsIEdyZWcgc2Fp
ZCBzbyB0byBtZS4gSGUgc3VnZ2VzdGVkIEkgcHJvdmlkZSBhIHBhdGNoIGFnYWluc3QgdGhlCmRv
Y3VtZW50YXRpb24gaWYgdGhlIGRvY3MgYXJlIG5vdCBjbGVhciBlbm91Z2gsIGJ1dCBJIGRpZG4n
dCBnZXQgYXJvdW5kCnRvIGl0IChhbmQgaXQncyBub3QgbXkgcnVsZSBpbiB0aGUgZmlyc3QgcGxh
Y2UsIHNvIEknZCBhcHByZWNpYXRlIHRoZQpwZXJzb24gbWFraW5nIHRoYXQgcnVsZSB0byB0YWtl
IGNhcmUgb2YgZG9jdW1lbnRpbmcgaXQpLgoKSG93ZXZlciwgaWYgd2UncmUgdG91Y2hpbmcgdGhl
c2UgbGluZXMgYW55d2F5LCBzaG91bGRuJ3Qgd2UgYmUgdXBkYXRpbmcKdGhlIFNQRFggSWRlbnRp
ZmllciB0byBHUEwtMi4wLW9ubHkgd2hpbGUgYXQgaXQ/CgpDaGVlcnMsCkFuZHJlYXMKCi0tIApT
VVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgKTWF4ZmVsZHN0ci4gNSwgOTA0MDkg
TsO8cm5iZXJnLCBHZXJtYW55CkdGOiBGZWxpeCBJbWVuZMO2cmZmZXIKSFJCIDM2ODA5IChBRyBO
w7xybmJlcmcpCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXN0bTMyCg==
