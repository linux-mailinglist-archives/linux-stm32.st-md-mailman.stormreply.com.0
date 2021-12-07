Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B1346B653
	for <lists+linux-stm32@lfdr.de>; Tue,  7 Dec 2021 09:46:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1D4A8C5F1E5;
	Tue,  7 Dec 2021 08:46:54 +0000 (UTC)
Received: from mx.tkos.co.il (bzq-84-110-109-230.red.bezeqint.net
 [84.110.109.230])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E3DEDC5EC72
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Dec 2021 08:06:27 +0000 (UTC)
Received: from tarshish (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx.tkos.co.il (Postfix) with ESMTPS id E1A8A440855;
 Tue,  7 Dec 2021 10:06:08 +0200 (IST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
 s=default; t=1638864370;
 bh=esweGkmM1TaFxAsLsotS7LKsL2FjaGbpG3oTnnMt2EY=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=GcPgxTp47EJex9304Cwrh1a93q3dHMKWiHIjz8ZTn4NegGPU69yqh7Su5vmg5fO+P
 Kh7nqdgkBIpI3Rf9UzzHq/x7N7cBaA/7R0ZE12PQaFHPd0XT3nfMmWwSoc6YNW6HJ/
 sY7u4RIykgN0trrfVUJdtS/HSKo97dqJciT8yZxSr0wjGT9g5g4otk+PHV0JYm9p9k
 P9YzQWW8WWhUeig+fPqnm1HPGtUlIZxk5urZr4h4aKbE+4xA9oZm9Je0d93bTim8GN
 1As0GD0fgMDT/yrRdfvnw9AkNJRlBW1Fj0uJad+Crzam3J4mee0elu9epTaexUTQ7t
 Pqt45gjbFAkpw==
References: <20211202210839.79140-1-andriy.shevchenko@linux.intel.com>
 <20211207080325.6hfokrrcs45iucx6@pengutronix.de>
User-agent: mu4e 1.6.10; emacs 27.1
From: Baruch Siach <baruch@tkos.co.il>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Date: Tue, 07 Dec 2021 10:05:08 +0200
In-reply-to: <20211207080325.6hfokrrcs45iucx6@pengutronix.de>
Message-ID: <87ilw0on3z.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 07 Dec 2021 08:46:53 +0000
Cc: Heiko Stuebner <heiko@sntech.de>, Tony Lindgren <tony@atomide.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Chunyan Zhang <chunyan.zhang@unisoc.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, linux-rockchip@lists.infradead.org,
 Marc Zyngier <maz@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 bcm-kernel-feedback-list@broadcom.com,
 Alexandru Ardelean <aardelean@deviqon.com>, Orson Zhai <orsonzhai@gmail.com>,
 Grygorii Strashko <grygorii.strashko@ti.com>,
 Thierry Reding <treding@nvidia.com>, Jianqun Xu <jay.xu@rock-chips.com>,
 linux-pwm@vger.kernel.org, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Vladimir Zapolskiy <vz@mleia.com>,
 linux-gpio@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 linux-mediatek@lists.infradead.org, Gregory Fong <gregory.0xf0@gmail.com>,
 Santosh Shilimkar <ssantosh@kernel.org>, linux-tegra@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Scott Branden <sbranden@broadcom.com>, linux-unisoc@lists.infradead.org,
 patches@opensource.cirrus.com, Kevin Hilman <khilman@kernel.org>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Keerthy <j-keerthy@ti.com>, Baolin Wang <baolin.wang7@gmail.com>,
 linux-power@fi.rohmeurope.com
Subject: Re: [Linux-stm32] [PATCH v1 1/3] gpio: Get rid of duplicate of_node
 assignment in the drivers
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

SGkgVXdlLAoKT24gVHVlLCBEZWMgMDcgMjAyMSwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cj4g
SGVsbG8gQW5keSwKPgo+IHlvdSBDYzogbGludXgtcHdtIGFuZCB0aGUgcHdtIG1haW50YWluZXJz
IGluIHRoaXMgc2VyaWVzLiBJIGRvbid0IHNwb3QKPiBhbnl0aGluZyBwd20gc3BlY2lmaWMgaGVy
ZSAoYXBhcnQgZnJvbSB0b3VjaGluZyBncGlvLW12ZWJ1IHdoaWNoIGFsc28KPiBjb250YWlucyBh
IFBXTSBkcml2ZXIpLiBEbyBJIG1pc3Mgc29tZXRoaW5nPwoKVGhhdCdzIHByb2JhYmx5IGJlY2F1
c2Ugb2YgZHJpdmVycy9ncGlvL2dwaW8tbXZlYnUuYyB0aGF0IGFwcGVhcnMgaW4gdGhlCk1BSU5U
QUlORVJTIFBXTSBlbnRyeS4KCmJhcnVjaAoKLS0gCiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgfi4gLn4gICBUayBPcGVuIFN5c3RlbXMKPX0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1vb08tLVUtLU9vby0t
LS0tLS0tLS0tLXs9CiAgIC0gYmFydWNoQHRrb3MuY28uaWwgLSB0ZWw6ICs5NzIuNTIuMzY4LjQ2
NTYsIGh0dHA6Ly93d3cudGtvcy5jby5pbCAtCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBz
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
