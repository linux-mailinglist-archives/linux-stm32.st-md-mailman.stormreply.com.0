Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F330911649
	for <lists+linux-stm32@lfdr.de>; Fri, 21 Jun 2024 01:05:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1E75BC7128E;
	Thu, 20 Jun 2024 23:05:51 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B7013C7128D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 20 Jun 2024 23:05:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 74091CE2A42;
 Thu, 20 Jun 2024 23:05:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32575C2BD10;
 Thu, 20 Jun 2024 23:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718924740;
 bh=SaOaFRr/ohEIO5+x2sHjKUAw9989Q79otM9vhPABR3c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dGsfH1GpHmQGHTfZ1l4tF8Yc8IR5UiRboDTNredObqxtOQx82e5s0tzE5UQ3HRdti
 YEn9NRju/HM5BF130UGn7A/JtXSjes40KzIwRc9JuVBmqI+8j7E1dPyQ28nSZcPIyG
 TOptG9SYCZtxheOmn5MCrlB4o/pGRyWPoX1UppgceSz8O/DTcsfVNH4ydUcWt+i5IJ
 oqlDDSWtyhj2zce34mKlyDG9TYhoG/y5KLT8TEJYWtVuC7gL+IKxBIvHGJphOe3KMf
 rP0msnieHjZGex3A1fC77vPMeqWKD0e19wRR09Ly11BI6lTQHNI85BCFts6ZIC+fOW
 QUnaqIuN62HjA==
Date: Fri, 21 Jun 2024 01:05:37 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Message-ID: <qru4aqjphjnjpo6yjxl2oznhlz774iv77u4u7u4jldnmlanps5@vpzxntuz6arp>
References: <20240620-dt-bindings-i2c-clean-v1-0-3a1016a95f9d@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240620-dt-bindings-i2c-clean-v1-0-3a1016a95f9d@linaro.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Vignesh R <vigneshr@ti.com>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Chris Brandt <chris.brandt@renesas.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-i2c@vger.kernel.org,
 Guenter Roeck <groeck@chromium.org>, linux-stm32@st-md-mailman.stormreply.com,
 Rob Herring <robh@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>, Magnus Damm <magnus.damm@gmail.com>,
 Sergiu Moga <sergiu.moga@microchip.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Ricardo =?utf-8?Q?Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>,
 Kamal Dasu <kamal.dasu@broadcom.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, chrome-platform@lists.linux.dev,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-tegra@vger.kernel.org,
 linux-omap@vger.kernel.org, Benson Leung <bleung@chromium.org>,
 linux-arm-kernel@lists.infradead.org, Doug Anderson <dianders@chromium.org>,
 stable@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Enric Balletbo i Serra <eballetbo@kernel.org>
Subject: Re: [Linux-stm32] [PATCH 0/7] dt-bindings: i2c: few fixes and
	cleanups
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

Q3plxZvEhyBLcnp5c3p0b2YsCgpPbiBUaHUsIEp1biAyMCwgMjAyNCBhdCAwMTozNDo0OFBNIEdN
VCwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPiBGZXcgZml4ZXMgZm9yIEkyQyBjb250cm9s
bGVyIHNjaGVtYXMuIFRoZSB0aGlyZCBwYXRjaCAoYXRtZWwsYXQ5MXNhbSkKPiBkZXBlbmRzIG9u
IGZpcnN0LCBzbyBJIHN1Z2dlc3Qgbm90IHNwbGl0dGluZyB0aGlzIGludG8gZml4ZXMgYnJhbmNo
IGJ1dAo+IHRha2UgYXMgaXMgdmlhIG5leHQgYnJhbmNoLgo+IAo+IEJlc3QgcmVnYXJkcywKPiBL
cnp5c3p0b2YKPiAKPiAtLS0KPiBLcnp5c3p0b2YgS296bG93c2tpICg3KToKPiAgICAgICBkdC1i
aW5kaW5nczogaTJjOiBhdG1lbCxhdDkxc2FtOiBjb3JyZWN0IHBhdGggdG8gaTJjLWNvbnRyb2xs
ZXIgc2NoZW1hCj4gICAgICAgZHQtYmluZGluZ3M6IGkyYzogZ29vZ2xlLGNyb3MtZWMtaTJjLXR1
bm5lbDogY29ycmVjdCBwYXRoIHRvIGkyYy1jb250cm9sbGVyIHNjaGVtYQoKbWVyZ2VkIHRvIGky
Yy9pMmMtaG9zdC1maXhlcwoKPiAgICAgICBkdC1iaW5kaW5nczogaTJjOiBhdG1lbCxhdDkxc2Ft
OiBkcm9wIHVubmVlZGVkIGFkZHJlc3Mvc2l6ZS1jZWxscwo+ICAgICAgIGR0LWJpbmRpbmdzOiBp
MmM6IG52aWRpYSx0ZWdyYTIwOiBkcm9wIHVubmVlZGVkIGFkZHJlc3Mvc2l6ZS1jZWxscwo+ICAg
ICAgIGR0LWJpbmRpbmdzOiBpMmM6IHNhbXN1bmcsczNjMjQxMDogZHJvcCB1bm5lZWRlZCBhZGRy
ZXNzL3NpemUtY2VsbHMKPiAgICAgICBkdC1iaW5kaW5nczogaTJjOiB0aSxvbWFwNDogcmVmZXJl
bmNlIGkyYy1jb250cm9sbGVyLnlhbWwgc2NoZW1hCj4gICAgICAgZHQtYmluZGluZ3M6IGkyYzog
YWRqdXN0IGluZGVudGF0aW9uIGluIERUUyBleGFtcGxlIHRvIGNvZGluZyBzdHlsZQoKbWVyZ2Vk
IHRvIGkyYy9pMmMtaG9zdAoKVGhhbmtzLApBbmRpCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0z
MkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
