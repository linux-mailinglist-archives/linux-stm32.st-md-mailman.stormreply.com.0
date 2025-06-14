Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC82ADA825
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Jun 2025 08:23:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9A48BC36B17;
	Mon, 16 Jun 2025 06:23:29 +0000 (UTC)
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C2A9BC36B3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 14 Jun 2025 11:17:12 +0000 (UTC)
Received: from submission (posteo.de [185.67.36.169]) 
 by mout02.posteo.de (Postfix) with ESMTPS id 23EE6240104
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 14 Jun 2025 13:17:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net;
 s=1984.ea087b; t=1749899832;
 bh=d4gNp/0M9SMRUX5Vo9jyFaZjMh959oqzUg9NU3r341s=;
 h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
 Content-Disposition:Content-Transfer-Encoding:From;
 b=Lca7QKh6j957WM9z2uGhxtJ0SvljdRqwb2jlCuWb67exWTonQombxmqnjTCtYsFh5
 6wowc8OD7y1uR6Sw0DHc7nc4rp52t+Rbn3jb8JHD0rUjXbYpYuHB6gfPsHghCVQg1k
 eoJ2CP6AwhUzFU59QB2uLKmOd0CwOSpJvr0YtHsIyquoZKeJuhyOZNpWCPA4H4ipdP
 KEYfc6osVgjdgmG7N53P3rDmLbHF3QmOvxWttVVH1aYepo6ts9ge+t/1ITkpW3xiIE
 OHDYljxwR+Lhl8ZCW+tPbDXSFrQr2DSLCWhJX3lyb+i+/pdDQS+Ax41Ro/PF3TLz9K
 y2dTiXxYmjplrVYGQDEaSFRCtGqFFCT9vExXL/7K/c1Y2Z6bK2+IJ6VSkVp5GvKZjh
 Bn/uUwVyKxJfvKsYREBojzFDxPlooV9wHrXo+vNfSvVFZ3+IvmSSjjFfG6mUDw76eY
 lsDFOq2AlyLTUZ+oeOO8HjF1lzN2TVUesC7UWC4oFZB9vL+7jLv
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 4bKDHh1hfPz6tsf;
 Sat, 14 Jun 2025 13:17:04 +0200 (CEST)
Date: Sat, 14 Jun 2025 11:17:03 +0000
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <aE1aL_ff1230w2DL@probook>
References: <20250611-pinctrl-const-desc-v2-0-b11c1d650384@linaro.org>
 <20250611-pinctrl-const-desc-v2-6-b11c1d650384@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250611-pinctrl-const-desc-v2-6-b11c1d650384@linaro.org>
X-Mailman-Approved-At: Mon, 16 Jun 2025 06:23:28 +0000
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Tomer Maimon <tmaimon77@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
 Linus Walleij <linus.walleij@linaro.org>, Tali Perry <tali.perry1@gmail.com>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-aspeed@lists.ozlabs.org, Emil Renner Berthing <kernel@esmil.dk>,
 linux-rtc@vger.kernel.org, Jesper Nilsson <jesper.nilsson@axis.com>,
 Benjamin Fair <benjaminfair@google.com>, openbmc@lists.ozlabs.org,
 linux-arm-kernel@axis.com, Hal Feng <hal.feng@starfivetech.com>,
 Nancy Yuen <yuenn@google.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Lorenzo Bianconi <lorenzo@kernel.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Manivannan Sadhasivam <mani@kernel.org>, Ray Jui <rjui@broadcom.com>,
 linux-sound@vger.kernel.org, Vladimir Zapolskiy <vz@mleia.com>,
 linux-gpio@vger.kernel.org, Richard Fitzgerald <rf@opensource.cirrus.com>,
 Damien Le Moal <dlemoal@kernel.org>, linux-mediatek@lists.infradead.org,
 Lars Persson <lars.persson@axis.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 David Rhodes <david.rhodes@cirrus.com>, Michal Simek <michal.simek@amd.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Scott Branden <sbranden@broadcom.com>, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>, Sean Wang <sean.wang@kernel.org>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Jianlong Huang <jianlong.huang@starfivetech.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, patches@opensource.cirrus.com,
 Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.ne@posteo.net>
Subject: Re: [Linux-stm32] [PATCH v2 06/17] pinctrl: nuvoton: Constify
	static 'pinctrl_desc'
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

T24gV2VkLCBKdW4gMTEsIDIwMjUgYXQgMDg6MTM6MzhBTSArMDIwMCwgS3J6eXN6dG9mIEtvemxv
d3NraSB3cm90ZToKPiBUaGUgbG9jYWwgc3RhdGljICdzdHJ1Y3QgcGluY3RybF9kZXNjJyBpcyBu
b3QgbW9kaWZpZWQsIHNvIGNhbiBiZSBtYWRlCj4gY29uc3QgZm9yIGNvZGUgc2FmZXR5Lgo+IAo+
IFNpZ25lZC1vZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lA
bGluYXJvLm9yZz4KClJldmlld2VkLWJ5OiBKLiBOZXVzY2jDpGZlciA8ai5uZUBwb3N0ZW8ubmV0
PgoKVGhhbmtzIQoKCj4gLS0tCj4gIGRyaXZlcnMvcGluY3RybC9udXZvdG9uL3BpbmN0cmwtbnBj
bTd4eC5jIHwgMiArLQo+ICBkcml2ZXJzL3BpbmN0cmwvbnV2b3Rvbi9waW5jdHJsLW5wY204eHgu
YyB8IDIgKy0KPiAgZHJpdmVycy9waW5jdHJsL251dm90b24vcGluY3RybC13cGNtNDUwLmMgfCAy
ICstCj4gIDMgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+
IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BpbmN0cmwvbnV2b3Rvbi9waW5jdHJsLW5wY203eHgu
YyBiL2RyaXZlcnMvcGluY3RybC9udXZvdG9uL3BpbmN0cmwtbnBjbTd4eC5jCj4gaW5kZXggZGZk
MzJmZWIzNDI4NmI3YTRkODA3ZTkwMzNhMTFmNTA3ZTI3N2RjZS4uYjg4NzJkOGY1OTMwYWQ5MzFk
YWQyMDhhZmVjNGUwOGEyM2MzZDY1MyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3BpbmN0cmwvbnV2
b3Rvbi9waW5jdHJsLW5wY203eHguYwo+ICsrKyBiL2RyaXZlcnMvcGluY3RybC9udXZvdG9uL3Bp
bmN0cmwtbnBjbTd4eC5jCj4gQEAgLTE4MTcsNyArMTgxNyw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1
Y3QgcGluY29uZl9vcHMgbnBjbTd4eF9waW5jb25mX29wcyA9IHsKPiAgfTsKPiAgCj4gIC8qIHBp
bmN0cmxfZGVzYyAqLwo+IC1zdGF0aWMgc3RydWN0IHBpbmN0cmxfZGVzYyBucGNtN3h4X3BpbmN0
cmxfZGVzYyA9IHsKPiArc3RhdGljIGNvbnN0IHN0cnVjdCBwaW5jdHJsX2Rlc2MgbnBjbTd4eF9w
aW5jdHJsX2Rlc2MgPSB7Cj4gIAkubmFtZSA9ICJucGNtN3h4LXBpbmN0cmwiLAo+ICAJLnBpbnMg
PSBucGNtN3h4X3BpbnMsCj4gIAkubnBpbnMgPSBBUlJBWV9TSVpFKG5wY203eHhfcGlucyksCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGluY3RybC9udXZvdG9uL3BpbmN0cmwtbnBjbTh4eC5jIGIv
ZHJpdmVycy9waW5jdHJsL251dm90b24vcGluY3RybC1ucGNtOHh4LmMKPiBpbmRleCBiZTNkYjhh
YjQwNmM0MTZmMDcwOWQwNmViODY0ZTMzZTMyMDg1NDFhLi4zYzNiOWQ4ZDM2ODFjNjRjMjE5Mjc2
MTVlMWJiNDlmMTU3ZjE1NmI1IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvcGluY3RybC9udXZvdG9u
L3BpbmN0cmwtbnBjbTh4eC5jCj4gKysrIGIvZHJpdmVycy9waW5jdHJsL251dm90b24vcGluY3Ry
bC1ucGNtOHh4LmMKPiBAQCAtMjI5OSw3ICsyMjk5LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBw
aW5jb25mX29wcyBucGNtOHh4X3BpbmNvbmZfb3BzID0gewo+ICB9Owo+ICAKPiAgLyogcGluY3Ry
bF9kZXNjICovCj4gLXN0YXRpYyBzdHJ1Y3QgcGluY3RybF9kZXNjIG5wY204eHhfcGluY3RybF9k
ZXNjID0gewo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IHBpbmN0cmxfZGVzYyBucGNtOHh4X3BpbmN0
cmxfZGVzYyA9IHsKPiAgCS5uYW1lID0gIm5wY204eHgtcGluY3RybCIsCj4gIAkucGlucyA9IG5w
Y204eHhfcGlucywKPiAgCS5ucGlucyA9IEFSUkFZX1NJWkUobnBjbTh4eF9waW5zKSwKPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9waW5jdHJsL251dm90b24vcGluY3RybC13cGNtNDUwLmMgYi9kcml2
ZXJzL3BpbmN0cmwvbnV2b3Rvbi9waW5jdHJsLXdwY200NTAuYwo+IGluZGV4IDQyNjRjYTc0OTE3
NWEyY2UwZjM2MDNjMWQ3YWEyNzFkOThlNmNkODkuLjhkODMxNGJhMGU0Y2I1NWRiMmIxZDNhZGYy
ZGUwN2U2ZmI5M2MyNzkgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9waW5jdHJsL251dm90b24vcGlu
Y3RybC13cGNtNDUwLmMKPiArKysgYi9kcml2ZXJzL3BpbmN0cmwvbnV2b3Rvbi9waW5jdHJsLXdw
Y200NTAuYwo+IEBAIC05ODksNyArOTg5LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBwaW5jb25m
X29wcyB3cGNtNDUwX3BpbmNvbmZfb3BzID0gewo+ICAJLnBpbl9jb25maWdfc2V0ID0gd3BjbTQ1
MF9jb25maWdfc2V0LAo+ICB9Owo+ICAKPiAtc3RhdGljIHN0cnVjdCBwaW5jdHJsX2Rlc2Mgd3Bj
bTQ1MF9waW5jdHJsX2Rlc2MgPSB7Cj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgcGluY3RybF9kZXNj
IHdwY200NTBfcGluY3RybF9kZXNjID0gewo+ICAJLm5hbWUgPSAid3BjbTQ1MC1waW5jdHJsIiwK
PiAgCS5waW5zID0gd3BjbTQ1MF9waW5zLAo+ICAJLm5waW5zID0gQVJSQVlfU0laRSh3cGNtNDUw
X3BpbnMpLAo+IAo+IC0tIAo+IDIuNDUuMgo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJA
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
