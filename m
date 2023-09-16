Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 660137A3246
	for <lists+linux-stm32@lfdr.de>; Sat, 16 Sep 2023 21:42:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 124F1C6B45F;
	Sat, 16 Sep 2023 19:42:26 +0000 (UTC)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C66FAC62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 16 Sep 2023 19:42:24 +0000 (UTC)
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1694893343;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/zPwTVnbIqykq0xrJwLN9r6avPOKHnWBnlaBD7Ntd/o=;
 b=CUQAEeiOCW0UB0mZHKKbATmxrT7v104AXTk8BgIS3LnhJdkwcK31VIKNUWTyr5NJ5FDSAZ
 1rUmkomzu0i8ra8Pr7MuVj6uXx2bx2AvsuHAsgoTtNXk1SlphGsF2Tko1c6bGtCosz+5D3
 3LvB5+XWrTyiZslCvN25C026vuzPMwe37ifQkKb5hvuaQ1IXWgjVHVi1QG1ERhp6yVLoCG
 KEjXv3lRy4sKTNf9zIytvVhfEZiamkJbj8QmGaOgd3j5PMU/plPNL9TqQlN3PM7t/8qtdr
 r8HTYvNQEPG5ZOF1NNpsGWfBpFE4WC9xOJQFYPlGWWvKaI1nzHahesMl0GR2sw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1694893343;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/zPwTVnbIqykq0xrJwLN9r6avPOKHnWBnlaBD7Ntd/o=;
 b=/s+j74ZDjoLeO5pQcnU/VyXRmqc0m+3/h/bRCXztbsATbbfdFH/5imwYhMMMSk+geHP+hf
 BWo+CyCuYQ4k1qBQ==
To: Ilpo =?utf-8?Q?J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
In-Reply-To: <1446dc6-5ab0-629-45c8-3b7d8c76367d@linux.intel.com>
References: <20230914183831.587273-1-john.ogness@linutronix.de>
 <1446dc6-5ab0-629-45c8-3b7d8c76367d@linux.intel.com>
Date: Sat, 16 Sep 2023 21:48:14 +0206
Message-ID: <878r95nbvt.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Alim Akhtar <alim.akhtar@samsung.com>, Peter Korsgaard <jacmet@sunsite.dk>,
 linux-stm32@st-md-mailman.stormreply.com, Karol Gugala <kgugala@antmicro.com>,
 Jerome Brunet <jbrunet@baylibre.com>, linux-samsung-soc@vger.kernel.org,
 Kevin Hilman <khilman@baylibre.com>,
 Hugo Villeneuve <hvilleneuve@dimonoff.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Hammer Hsieh <hammerh0314@gmail.com>, Jiamei Xie <jiamei.xie@arm.com>,
 NXP Linux Team <linux-imx@nxp.com>, Vineet Gupta <vgupta@kernel.org>,
 Thierry Reding <treding@nvidia.com>, Petr Mladek <pmladek@suse.com>,
 Arend van Spriel <arend.vanspriel@broadcom.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Nicholas Piggin <npiggin@gmail.com>,
 linux-unisoc@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>,
 Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Samuel Holland <samuel.holland@sifive.com>,
 Richard Genoud <richard.genoud@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Maciej W. Rozycki" <macro@orcam.me.uk>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-aspeed@lists.ozlabs.org, Laxman Dewangan <ldewangan@nvidia.com>,
 Dmitry Rokosov <ddrokosov@sberdevices.ru>,
 Xiongfeng Wang <wangxiongfeng2@huawei.com>,
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
 delisun <delisun@pateo.com.cn>, Fabio Estevam <festevam@gmail.com>,
 Ruan Jinjie <ruanjinjie@huawei.com>,
 Matthew Howell <matthew.howell@sealevel.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Gabriel Somlo <gsomlo@gmail.com>,
 Hongyu Xie <xiehongyu1@kylinos.cn>, Tobias Klauser <tklauser@distanz.ch>,
 Yangtao Li <frank.li@vivo.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, linux-actions@lists.infradead.org,
 Biju Das <biju.das.jz@bp.renesas.com>, linux-amlogic@lists.infradead.org,
 Michal Simek <michal.simek@amd.com>, Sherry Sun <sherry.sun@nxp.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Chunyan Zhang <zhang.lyra@gmail.com>, "David
 S. Miller" <davem@davemloft.net>,
 Kumaravel Thiagarajan <kumaravel.thiagarajan@microchip.com>,
 Lukas Wunner <lukas@wunner.de>, Sergey Organov <sorganov@gmail.com>,
 Mukesh Ojha <quic_mojha@quicinc.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Pali =?utf-8?Q?Roh=C3=A1r?= <pali@kernel.org>,
 Lino Sanfilippo <l.sanfilippo@kunbus.com>, Tom Rix <trix@redhat.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Al Cooper <alcooperx@gmail.com>,
 Yuan Can <yuancan@huawei.com>, Isaac True <isaac.true@canonical.com>,
 linux-tegra@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>,
 Rob Herring <robh@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>,
 Mateusz Holenko <mholenko@antmicro.com>, Kevin Cernekee <cernekee@gmail.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Shenwei Wang <shenwei.wang@nxp.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Joel Stanley <joel@jms.id.au>, Chen-Yu Tsai <wenst@chromium.org>,
 Ilpo =?utf-8?Q?J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 linux-snps-arc@lists.infradead.org, Jacky Huang <ychuang3@nuvoton.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Vladimir Zapolskiy <vz@mleia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Orson Zhai <orsonzhai@gmail.com>,
 Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
 Timur Tabi <timur@kernel.org>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Shawn Guo <shawnguo@kernel.org>,
 Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
 Baruch Siach <baruch@tkos.co.il>, Tony Lindgren <tony@atomide.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Liviu Dudau <liviu.dudau@arm.com>, sparclinux@vger.kernel.org,
 Shan-Chun Hung <schung@nuvoton.com>, linux-riscv@lists.infradead.org,
 Marek Vasut <marex@denx.de>, Lech Perczak <lech.perczak@camlingroup.com>,
 Russell King <linux@armlinux.org.uk>, Nick Hu <nick.hu@sifive.com>,
 Andy Gross <agross@kernel.org>, linux-serial <linux-serial@vger.kernel.org>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Manivannan Sadhasivam <mani@kernel.org>, Johan Hovold <johan@kernel.org>,
 linux-mediatek@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-arm-kernel@lists.infradead.org,
 Taichi Sugaya <sugaya.taichi@socionext.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Lucas Tanure <tanure@linux.com>,
 Andrew Davis <afd@ti.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Takao Orito <orito.takao@socionext.com>,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [Linux-stm32] [PATCH tty v1 00/74] serial: wrappers for uart
	port lock
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

T24gMjAyMy0wOS0xNSwgSWxwbyBKw6RydmluZW4gPGlscG8uamFydmluZW5AbGludXguaW50ZWwu
Y29tPiB3cm90ZToKPiBXb3VsZCB0aGlzIGFsc28gYmUgdXNlZnVsIHRvIGVuYWJsZSBwcmludGlu
ZyB0byBjb25zb2xlIHdoaWxlIHVuZGVyCj4gcG9ydCdzIGxvY2sgKGJ5IHBvc3Rwb25pbmcgdGhl
IG91dHB1dCB1bnRpbCB0aGUgbG9jayBpcyByZWxlYXNlZCk/Cj4KPiBFLmcuLCA4MjUwX2R3LmMg
aGFzIGhhZCB0aGlzIGNvbW1lbnRlZCBvdXQgc2luY2UgdGhlIGRhd24gb24gdGltZToKPiAgICAg
ICAgIC8qCj4gICAgICAgICAgKiBGSVhNRTogdGhpcyBkZWFkbG9ja3MgaWYgcG9ydC0+bG9jayBp
cyBhbHJlYWR5IGhlbGQKPiAgICAgICAgICAqIGRldl9lcnIocC0+ZGV2LCAiQ291bGRuJ3Qgc2V0
IExDUiB0byAlZFxuIiwgdmFsdWUpOwo+ICAgICAgICAgICovCgpZZXMsIHRoaXMgd2lsbCBmaXgg
c3VjaCBpc3N1ZXMuIEhvd2V2ZXIsIG9ubHkgZm9yIGNvbnNvbGVzIHRoYXQgYXJlCmNvbnZlcnRl
ZCB0byB0aGUgbmV3IE5CQ09OIGNvbnNvbGUgdHlwZS4KCkdvb2QgbmV3cywgdGhlIDgyNTAgZHJp
dmVyIHdpbGwgYmUgdGhlIGZsYWdzaGlwIGRyaXZlciB0aGF0IGlzIGNvbnZlcnRlZAphcyBwYXJ0
IG9mIHRoZSByZXdvcmsuIFNvIHRoaXMgcGFydGljdWxhciBpc3N1ZSB3aWxsIGJlIHNvbHZlZCB0
aGVuLiBJCndpbGwgdHJ5IHRvIHJlbWVtYmVyIHRoaXMgc28gdGhhdCBJIGNhbiByZW1vdmUgdGhl
IEZJWE1FIGluIHRoZSBzZXJpZXMuCgpUaGFua3MgZm9yIG1lbnRpb25pbmcgaXQuCgpKb2huCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMy
IG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0
dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXN0bTMyCg==
