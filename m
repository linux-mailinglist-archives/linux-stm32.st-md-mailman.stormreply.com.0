Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8906A10C4B0
	for <lists+linux-stm32@lfdr.de>; Thu, 28 Nov 2019 09:05:57 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4A831C36B0E;
	Thu, 28 Nov 2019 08:05:57 +0000 (UTC)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 66C9CC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Nov 2019 21:02:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7B612AC1A;
 Wed, 27 Nov 2019 21:02:09 +0000 (UTC)
To: Nishad Kamdar <nishadkamdar@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
References: <cover.1574871463.git.nishadkamdar@gmail.com>
 <5b588fc885efca6efdc73869aa4b1eeeb3d6f6c5.1574871463.git.nishadkamdar@gmail.com>
From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Organization: SUSE Software Solutions Germany GmbH
Message-ID: <c76290a7-b9bb-7f70-e750-04fe6fdbb7e1@suse.de>
Date: Wed, 27 Nov 2019 22:02:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <5b588fc885efca6efdc73869aa4b1eeeb3d6f6c5.1574871463.git.nishadkamdar@gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 28 Nov 2019 08:05:55 +0000
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, linux-gpio@vger.kernel.org,
 Kevin Hilman <khilman@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>,
 Sean Wang <sean.wang@kernel.org>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Joe Perches <joe@perches.com>,
 linux-mediatek@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-amlogic@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/5] pinctrl: actions: Use the correct
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

QW0gMjcuMTEuMTkgdW0gMTc6NDAgc2NocmllYiBOaXNoYWQgS2FtZGFyOgo+IFRoaXMgcGF0Y2gg
Y29ycmVjdHMgdGhlIFNQRFggTGljZW5zZSBJZGVudGlmaWVyIHN0eWxlIGluCj4gaGVhZGVyIGZp
bGUgcmVsYXRlZCBBY3Rpb25zIFNlbWkgT1dMIHBpbmN0cmwgZHJpdmVyLgoKT3dsCgo+IEZvciBD
IGhlYWRlciBmaWxlcyBEb2N1bWVudGF0aW9uL3Byb2Nlc3MvbGljZW5zZS1ydWxlcy5yc3QKPiBt
YW5kYXRlcyBDLWxpa2UgY29tbWVudHMgKG9wcG9zZWQgdG8gQyBzb3VyY2UgZmlsZXMgd2hlcmUK
PiBDKysgc3R5bGUgc2hvdWxkIGJlIHVzZWQpLgo+IAo+IENoYW5nZXMgbWFkZSBieSB1c2luZyBh
IHNjcmlwdCBwcm92aWRlZCBieSBKb2UgUGVyY2hlcyBoZXJlOgo+IGh0dHBzOi8vbGttbC5vcmcv
bGttbC8yMDE5LzIvNy80Ni4KPiAKPiBTdWdnZXN0ZWQtYnk6IEpvZSBQZXJjaGVzIDxqb2VAcGVy
Y2hlcy5jb20+Cj4gU2lnbmVkLW9mZi1ieTogTmlzaGFkIEthbWRhciA8bmlzaGFka2FtZGFyQGdt
YWlsLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9waW5jdHJsL2FjdGlvbnMvcGluY3RybC1vd2wuaCB8
IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4g
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGluY3RybC9hY3Rpb25zL3BpbmN0cmwtb3dsLmggYi9k
cml2ZXJzL3BpbmN0cmwvYWN0aW9ucy9waW5jdHJsLW93bC5oCj4gaW5kZXggZGFlMmU4MzYzZmQ1
Li5mZWVlN2FkN2UyN2UgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9waW5jdHJsL2FjdGlvbnMvcGlu
Y3RybC1vd2wuaAo+ICsrKyBiL2RyaXZlcnMvcGluY3RybC9hY3Rpb25zL3BpbmN0cmwtb3dsLmgK
PiBAQCAtMSw0ICsxLDQgQEAKPiAtLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAr
Cj4gKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wKyAqLwoKVGhpcyBpcyBub3Qg
YSB1YXBpIG9yIGFzbSBoZWFkZXIsIHdoaWNoIHRoYXQgLyogKi8gcnVsZSB3YXMgbGF0ZXIgYWRk
ZWQKZm9yLCBJIHRob3VnaHQ/Cgo+ICAvKgo+ICAgKiBPV0wgU29DJ3MgUGluY3RybCBkZWZpbml0
aW9ucwo+ICAgKgoKTm90IG9iamVjdGluZywganVzdCBtYWtpbmcgc3VyZSB3ZSdyZSBub3QgYmxp
bmRseSByZWZhY3RvcmluZyBjb2RlLgoKSWYgZG9pbmcgdGhpcywgSSBzdWdnZXN0IHVwZGF0aW5n
IHRvIEdQTC0yLjAtb3ItbGF0ZXIuCgpSZWdhcmRzLApBbmRyZWFzCgotLSAKU1VTRSBTb2Z0d2Fy
ZSBTb2x1dGlvbnMgR2VybWFueSBHbWJICk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywg
R2VybWFueQpHRjogRmVsaXggSW1lbmTDtnJmZmVyCkhSQiAzNjgwOSAoQUcgTsO8cm5iZXJnKQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0z
MiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpo
dHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51
eC1zdG0zMgo=
