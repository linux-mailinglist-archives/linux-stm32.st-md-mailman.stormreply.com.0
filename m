Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E052E7E7D72
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Nov 2023 16:32:53 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 982F8C6B47D;
	Fri, 10 Nov 2023 15:32:53 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 956F8C6B44F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Nov 2023 15:32:52 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1r1TT8-00065R-WB; Fri, 10 Nov 2023 16:30:51 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1r1TSy-0083Ie-0c; Fri, 10 Nov 2023 16:30:40 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1r1TSx-00Gnuj-JI; Fri, 10 Nov 2023 16:30:39 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Tony Lindgren <tony@atomide.com>,
 Alexander Shiyan <shc_work@mail.ru>
Date: Fri, 10 Nov 2023 16:29:28 +0100
Message-ID: <20231110152927.70601-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0.586.gbc5204569f7d.dirty
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=8575;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=uSjGK//3oFZ52v8CbMudZ2zWDpIf+rV/Bz06fMr6GWo=;
 b=owGbwMvMwMXY3/A7olbonx/jabUkhlQ/nwgpw9SOtCV6v+pmM2qvy30b4Lq49LLWF9d7/DeVZ
 WUfT6vrZDRmYWDkYpAVU2Sxb1yTaVUlF9m59t9lmEGsTCBTGLg4BWAit63Y/3DeWbXNbsaN6owD
 v7zeKjbpJWlH1DLLuAtpXzizckMmx203llrb1/+nvTIsPrdq+5X595O9r7k579Bw9+82qJzub57
 xYRLnlnOf3z5I0jkjI3+hnSlh3u7CZtWj17OsTwtF9Zh1VPec575QJnDf2cNMZ92auiNbfa0U1I
 K4NMS4nGKWL9M2r8plO87j5ygYa/6+RbEk4fm2VxMXr107Q7gswU3y947dArnBDXHf36sIsmiEc
 f/g4GZMEG/dF80S1BrAt/VW0ITwlZUaT7adCHP/6ih/oXzv47Wsk5b57sm0tYvXmXys/bGln80K
 A/VHR2RlH3V3/5h2e8W6Lbt3hnOZavQfU+68c0/+U304AA==
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: Fabio Estevam <festevam@denx.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Pavel Krasavin <pkrasavin@imaqliq.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Peter Korsgaard <jacmet@sunsite.dk>, linux-stm32@st-md-mailman.stormreply.com,
 Karol Gugala <kgugala@antmicro.com>, Jerome Brunet <jbrunet@baylibre.com>,
 linux-samsung-soc@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Hammer Hsieh <hammerh0314@gmail.com>, Jiamei Xie <jiamei.xie@arm.com>,
 Ben Dooks <ben.dooks@codethink.co.uk>,
 Geert Uytterhoeven <geert@linux-m68k.org>, NXP Linux Team <linux-imx@nxp.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Petr Mladek <pmladek@suse.com>,
 Arend van Spriel <arend.vanspriel@broadcom.com>, linux-serial@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-unisoc@lists.infradead.org,
 Thomas Gleixner <tglx@linutronix.de>, Scott Branden <sbranden@broadcom.com>,
 Richard GENOUD <richard.genoud@gmail.com>,
 Samuel Holland <samuel.holland@sifive.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, kernel@pengutronix.de,
 "Maciej W. Rozycki" <macro@orcam.me.uk>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Thierry Reding <thierry.reding@gmail.com>,
 Dmitry Rokosov <ddrokosov@sberdevices.ru>, delisun <delisun@pateo.com.cn>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Ruan Jinjie <ruanjinjie@huawei.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Mateusz Holenko <mholenko@antmicro.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Gabriel Somlo <gsomlo@gmail.com>,
 Hongyu Xie <xiehongyu1@kylinos.cn>, Tobias Klauser <tklauser@distanz.ch>,
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>,
 John Ogness <john.ogness@linutronix.de>, Yangtao Li <frank.li@vivo.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, linux-actions@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, Biju Das <biju.das.jz@bp.renesas.com>,
 linux-amlogic@lists.infradead.org, Michal Simek <michal.simek@amd.com>,
 Sherry Sun <sherry.sun@nxp.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Richard <thomas.richard@bootlin.com>,
 "David S. Miller" <davem@davemloft.net>, Sergey Organov <sorganov@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-mediatek@lists.infradead.org, Lino Sanfilippo <l.sanfilippo@kunbus.com>,
 Tom Rix <trix@redhat.com>, Al Cooper <alcooperx@gmail.com>,
 Yuan Can <yuancan@huawei.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
 linux-aspeed@lists.ozlabs.org, Bernhard Seibold <mail@bernhard-seibold.de>,
 Shenwei Wang <shenwei.wang@nxp.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Joel Stanley <joel@jms.id.au>, Chen-Yu Tsai <wenst@chromium.org>,
 Jacob Keller <jacob.e.keller@intel.com>,
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Jacky Huang <ychuang3@nuvoton.com>, Arnd Bergmann <arnd@arndb.de>,
 Ray Jui <rjui@broadcom.com>, Vladimir Zapolskiy <vz@mleia.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, Orson Zhai <orsonzhai@gmail.com>,
 Thierry Reding <treding@nvidia.com>, Timur Tabi <timur@kernel.org>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Julien Malik <julien.malik@unseenlabs.fr>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Laxman Dewangan <ldewangan@nvidia.com>, Shawn Guo <shawnguo@kernel.org>,
 =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
 Baruch Siach <baruch@tkos.co.il>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, linux-mips@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>, sparclinux@vger.kernel.org,
 Shan-Chun Hung <schung@nuvoton.com>, linux-riscv@lists.infradead.org,
 Zhang Shurong <zhang_shurong@foxmail.com>, Marek Vasut <marex@denx.de>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Russell King <linux@armlinux.org.uk>, Nick Hu <nick.hu@sifive.com>,
 Andy Gross <agross@kernel.org>, Martin Fuzzey <martin.fuzzey@flowbird.group>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Takao Orito <orito.takao@socionext.com>, Johan Hovold <johan@kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-tegra@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-arm-kernel@lists.infradead.org,
 Taichi Sugaya <sugaya.taichi@socionext.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Lucas Tanure <tanure@linux.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 linuxppc-dev@lists.ozlabs.org
Subject: [Linux-stm32] [PATCH 00/52] serial: Convert to platform remove
	callback returning void
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

SGVsbG8sCgp0aGlzIHNlcmllcyBzdGFydHMgd2l0aCB0d28gZml4ZXMuIFRoZSBmaXJzdCBvbmUg
Zml4ZXMgYSByZXNvdXJjZSBsZWFrCmFuZCB1c2UgYWZ0ZXIgZnJlZS4gVGhlIHNlY29uZCBvbmx5
IGltcHJvdmVzIGVycm9yIHJlcG9ydGluZy4gSSBhZGRlZCBhCkZpeGVzOiBtYXJrZXIgdG8gdGhl
c2UuIEkgbGV0IHlvdSBkZWNpZGUgaWYgeW91IHdhbnQgdG8gZHJvcCB0aGVtIChvcgp0aGUgc2Vj
b25kIG9ubHkpIG9yIGFkZCBhIENjOiBzdGFibGUgKHRvIGJvdGggb3Igb25seSB0aGUgZmlyc3Qg
b25lKS4KCkFmdGVyIHRoYXQgYWxsIGRyaXZlcnMgYmVsb3cgZHJpdmVycy90dHkvc2VyaWFsIGFy
ZSBjb252ZXJ0ZWQgdG8gc3RydWN0CnBsYXRmb3JtX2RyaXZlcjo6cmVtb3ZlX25ldy4gU2VlIGNv
bW1pdCA1YzVhNzY4MGU2N2IgKCJwbGF0Zm9ybTogUHJvdmlkZQphIHJlbW92ZSBjYWxsYmFjayB0
aGF0IHJldHVybnMgbm8gdmFsdWUiKSBmb3IgYW4gZXh0ZW5kZWQgZXhwbGFuYXRpb24KYW5kIHRo
ZSBldmVudHVhbCBnb2FsLiBUaGUgVEw7RFI7IGlzIHRvIHByZXZlbnQgYnVncyBsaWtlIHRoZSB0
d28gZml4ZWQKaGVyZS4KCkFmdGVyIHRoZXNlIHR3byBmaXhlcyBhbGwgY29udmVyc2F0aW9ucyBh
cmUgdHJpdmlhbCwgYmVjYXVzZSBhbGwKLnJlbW92ZSgpIGNhbGxiYWNrcyByZXR1cm5lZCB6ZXJv
IHVuY29uZGl0aW9uYWxseS4KClRoZSBjb252ZXJzaW9uIHBhdGNoZXMgYXJlIG1lcmdlIHdpbmRv
dyBtYXRlcmlhbC4gVGhlIHR3byBmaXhlcyBtaWdodCBnbwppbiBhbHNvIGJlZm9yZSB2Ni43LCBi
dXQgZ2l2ZW4gdGhlIGZpeGVkIHByb2JsZW1zIGFyZSBhbHJlYWR5IG9sZAoodjYuMS1yYzYgKyB2
My4xMC1yYzEpIHRoZXJlIGlzIHByb2JhYmx5IG5vIHVyZ2UuCgpCZXN0IHJlZ2FyZHMKVXdlCgpV
d2UgS2xlaW5lLUvDtm5pZyAoNTIpOgogIHNlcmlhbDogODI1MDogb21hcDogRG9uJ3Qgc2tpcCBy
ZXNvdXJjZSBmcmVlaW5nIGlmCiAgICBwbV9ydW50aW1lX3Jlc3VtZV9hbmRfZ2V0KCkgZmFpbGVk
CiAgc2VyaWFsOiBzY2NueHA6IEltcHJvdmUgZXJyb3IgbWVzc2FnZSBpZiByZWd1bGF0b3JfZGlz
YWJsZSgpIGZhaWxzCiAgc2VyaWFsOiA4MjUwOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBj
YWxsYmFjayByZXR1cm5pbmcgdm9pZAogIHNlcmlhbDogYWx0ZXJhX2p0YWd1YXJ0OiBDb252ZXJ0
IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcKICAgIHZvaWQKICBzZXJpYWw6
IGFsdGVyYTogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nIHZv
aWQKICBzZXJpYWw6IGFtYmEtcGwwMTE6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxi
YWNrIHJldHVybmluZyB2b2lkCiAgc2VyaWFsOiBhcjkzM3g6IENvbnZlcnQgdG8gcGxhdGZvcm0g
cmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCiAgc2VyaWFsOiBhdG1lbDogQ29udmVydCB0
byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQKICBzZXJpYWw6IGJjbTYz
eHg6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCiAg
c2VyaWFsOiBjbHBzNzExeDogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0
dXJuaW5nIHZvaWQKICBzZXJpYWw6IGNwbTogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2Fs
bGJhY2sgcmV0dXJuaW5nIHZvaWQKICBzZXJpYWw6IGRpZ2ljb2xvcjogQ29udmVydCB0byBwbGF0
Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQKICBzZXJpYWw6IGVzcDMyX2FjbTog
Q29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQKICBzZXJp
YWw6IGVzcDMyOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcg
dm9pZAogIHNlcmlhbDogZnNsX2xpbmZsZXh1YXJ0OiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92
ZSBjYWxsYmFjayByZXR1cm5pbmcKICAgIHZvaWQKICBzZXJpYWw6IGZzbF9scHVhcnQ6IENvbnZl
cnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCiAgc2VyaWFsOiBp
bXg6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCiAg
c2VyaWFsOiBsYW50aXE6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVy
bmluZyB2b2lkCiAgc2VyaWFsOiBsaXRldWFydDogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUg
Y2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQKICBzZXJpYWw6IGxwYzMyeHhfaHM6IENvbnZlcnQgdG8g
cGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCiAgc2VyaWFsOiBtYTM1ZDE6
IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCiAgc2Vy
aWFsOiBtY2Y6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2
b2lkCiAgc2VyaWFsOiBtZXNvbjogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sg
cmV0dXJuaW5nIHZvaWQKICBzZXJpYWw6IG1pbGJlYXV0X3VzaW86IENvbnZlcnQgdG8gcGxhdGZv
cm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZwogICAgdm9pZAogIHNlcmlhbDogbXBjNTJ4eDog
Q29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQKICBzZXJp
YWw6IG1zbTogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nIHZv
aWQKICBzZXJpYWw6IG14cy1hdWFydDogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJh
Y2sgcmV0dXJuaW5nIHZvaWQKICBzZXJpYWw6IG9tYXA6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVt
b3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCiAgc2VyaWFsOiBvd2w6IENvbnZlcnQgdG8gcGxh
dGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCiAgc2VyaWFsOiBwaWMzMjogQ29u
dmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQKICBzZXJpYWw6
IHFjb21fZ2VuaTogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5n
IHZvaWQKICBzZXJpYWw6IHJkYTogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sg
cmV0dXJuaW5nIHZvaWQKICBzZXJpYWw6IHNhMTEwMDogQ29udmVydCB0byBwbGF0Zm9ybSByZW1v
dmUgY2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQKICBzZXJpYWw6IHNhbXN1bmc6IENvbnZlcnQgdG8g
cGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCiAgc2VyaWFsOiBzY2NueHA6
IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCiAgc2Vy
aWFsOiB0ZWdyYTogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5n
IHZvaWQKICBzZXJpYWw6IHR4eDk6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNr
IHJldHVybmluZyB2b2lkCiAgc2VyaWFsOiBzaC1zY2k6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVt
b3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCiAgc2VyaWFsOiBzaWZpdmU6IENvbnZlcnQgdG8g
cGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCiAgc2VyaWFsOiBzcHJkOiBD
b252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZAogIHNlcmlh
bDogc3QtYXNjOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcg
dm9pZAogIHNlcmlhbDogc3RtMzI6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNr
IHJldHVybmluZyB2b2lkCiAgc2VyaWFsOiBzdW5odjogQ29udmVydCB0byBwbGF0Zm9ybSByZW1v
dmUgY2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQKICBzZXJpYWw6IHN1bnBsdXM6IENvbnZlcnQgdG8g
cGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCiAgc2VyaWFsOiBzdW5zYWI6
IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCiAgc2Vy
aWFsOiBzdW5zdTogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5n
IHZvaWQKICBzZXJpYWw6IHN1bnppbG9nOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxs
YmFjayByZXR1cm5pbmcgdm9pZAogIHNlcmlhbDogdGVncmEtdGN1OiBDb252ZXJ0IHRvIHBsYXRm
b3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZAogIHNlcmlhbDogdGltYnVhcnQ6IENv
bnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCiAgc2VyaWFs
OiB1YXJ0bGl0ZTogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5n
IHZvaWQKICBzZXJpYWw6IHVjYzogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sg
cmV0dXJuaW5nIHZvaWQKICBzZXJpYWw6IHhpbGlueF91YXJ0cHM6IENvbnZlcnQgdG8gcGxhdGZv
cm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZwogICAgdm9pZAoKIGRyaXZlcnMvdHR5L3Nlcmlh
bC84MjUwLzgyNTBfYXNwZWVkX3Z1YXJ0LmMgfCAgNiArKy0tLS0KIGRyaXZlcnMvdHR5L3Nlcmlh
bC84MjUwLzgyNTBfYmNtMjgzNWF1eC5jICAgfCAgNiArKy0tLS0KIGRyaXZlcnMvdHR5L3Nlcmlh
bC84MjUwLzgyNTBfYmNtNzI3MS5jICAgICAgfCAgNSArKy0tLQogZHJpdmVycy90dHkvc2VyaWFs
LzgyNTAvODI1MF9jb3JlLmMgICAgICAgICB8ICA1ICsrLS0tCiBkcml2ZXJzL3R0eS9zZXJpYWwv
ODI1MC84MjUwX2R3LmMgICAgICAgICAgIHwgIDYgKystLS0tCiBkcml2ZXJzL3R0eS9zZXJpYWwv
ODI1MC84MjUwX2VtLmMgICAgICAgICAgIHwgIDUgKystLS0KIGRyaXZlcnMvdHR5L3NlcmlhbC84
MjUwLzgyNTBfZnNsLmMgICAgICAgICAgfCAgNSArKy0tLQogZHJpdmVycy90dHkvc2VyaWFsLzgy
NTAvODI1MF9pbmdlbmljLmMgICAgICB8ICA1ICsrLS0tCiBkcml2ZXJzL3R0eS9zZXJpYWwvODI1
MC84MjUwX2lvYzMuYyAgICAgICAgIHwgIDUgKystLS0KIGRyaXZlcnMvdHR5L3NlcmlhbC84MjUw
LzgyNTBfbHBjMTh4eC5jICAgICAgfCAgNiArKy0tLS0KIGRyaXZlcnMvdHR5L3NlcmlhbC84MjUw
LzgyNTBfbXRrLmMgICAgICAgICAgfCAgNiArKy0tLS0KIGRyaXZlcnMvdHR5L3NlcmlhbC84MjUw
LzgyNTBfb2YuYyAgICAgICAgICAgfCAgNSArKy0tLQogZHJpdmVycy90dHkvc2VyaWFsLzgyNTAv
ODI1MF9vbWFwLmMgICAgICAgICB8ICA3ICsrKy0tLS0KIGRyaXZlcnMvdHR5L3NlcmlhbC84MjUw
LzgyNTBfcHhhLmMgICAgICAgICAgfCAgNiArKy0tLS0KIGRyaXZlcnMvdHR5L3NlcmlhbC84MjUw
LzgyNTBfdGVncmEuYyAgICAgICAgfCAgNiArKy0tLS0KIGRyaXZlcnMvdHR5L3NlcmlhbC84MjUw
LzgyNTBfdW5pcGhpZXIuYyAgICAgfCAgNiArKy0tLS0KIGRyaXZlcnMvdHR5L3NlcmlhbC9hbHRl
cmFfanRhZ3VhcnQuYyAgICAgICAgfCAgNiArKy0tLS0KIGRyaXZlcnMvdHR5L3NlcmlhbC9hbHRl
cmFfdWFydC5jICAgICAgICAgICAgfCAgNiArKy0tLS0KIGRyaXZlcnMvdHR5L3NlcmlhbC9hbWJh
LXBsMDExLmMgICAgICAgICAgICAgfCAgNSArKy0tLQogZHJpdmVycy90dHkvc2VyaWFsL2FyOTMz
eF91YXJ0LmMgICAgICAgICAgICB8ICA2ICsrLS0tLQogZHJpdmVycy90dHkvc2VyaWFsL2F0bWVs
X3NlcmlhbC5jICAgICAgICAgICB8ICA2ICsrLS0tLQogZHJpdmVycy90dHkvc2VyaWFsL2JjbTYz
eHhfdWFydC5jICAgICAgICAgICB8ICA1ICsrLS0tCiBkcml2ZXJzL3R0eS9zZXJpYWwvY2xwczcx
MXguYyAgICAgICAgICAgICAgIHwgIDYgKystLS0tCiBkcml2ZXJzL3R0eS9zZXJpYWwvY3BtX3Vh
cnQuYyAgICAgICAgICAgICAgIHwgIDYgKystLS0tCiBkcml2ZXJzL3R0eS9zZXJpYWwvZGlnaWNv
bG9yLXVzYXJ0LmMgICAgICAgIHwgIDYgKystLS0tCiBkcml2ZXJzL3R0eS9zZXJpYWwvZXNwMzJf
YWNtLmMgICAgICAgICAgICAgIHwgIDUgKystLS0KIGRyaXZlcnMvdHR5L3NlcmlhbC9lc3AzMl91
YXJ0LmMgICAgICAgICAgICAgfCAgNiArKy0tLS0KIGRyaXZlcnMvdHR5L3NlcmlhbC9mc2xfbGlu
ZmxleHVhcnQuYyAgICAgICAgfCAgNiArKy0tLS0KIGRyaXZlcnMvdHR5L3NlcmlhbC9mc2xfbHB1
YXJ0LmMgICAgICAgICAgICAgfCAgNSArKy0tLQogZHJpdmVycy90dHkvc2VyaWFsL2lteC5jICAg
ICAgICAgICAgICAgICAgICB8ICA2ICsrLS0tLQogZHJpdmVycy90dHkvc2VyaWFsL2xhbnRpcS5j
ICAgICAgICAgICAgICAgICB8ICA2ICsrLS0tLQogZHJpdmVycy90dHkvc2VyaWFsL2xpdGV1YXJ0
LmMgICAgICAgICAgICAgICB8ICA2ICsrLS0tLQogZHJpdmVycy90dHkvc2VyaWFsL2xwYzMyeHhf
aHMuYyAgICAgICAgICAgICB8ICA2ICsrLS0tLQogZHJpdmVycy90dHkvc2VyaWFsL21hMzVkMV9z
ZXJpYWwuYyAgICAgICAgICB8ICA1ICsrLS0tCiBkcml2ZXJzL3R0eS9zZXJpYWwvbWNmLmMgICAg
ICAgICAgICAgICAgICAgIHwgIDYgKystLS0tCiBkcml2ZXJzL3R0eS9zZXJpYWwvbWVzb25fdWFy
dC5jICAgICAgICAgICAgIHwgIDggKysrLS0tLS0KIGRyaXZlcnMvdHR5L3NlcmlhbC9taWxiZWF1
dF91c2lvLmMgICAgICAgICAgfCAgNiArKy0tLS0KIGRyaXZlcnMvdHR5L3NlcmlhbC9tcGM1Mnh4
X3VhcnQuYyAgICAgICAgICAgfCAgNyArKy0tLS0tCiBkcml2ZXJzL3R0eS9zZXJpYWwvbXNtX3Nl
cmlhbC5jICAgICAgICAgICAgIHwgIDYgKystLS0tCiBkcml2ZXJzL3R0eS9zZXJpYWwvbXhzLWF1
YXJ0LmMgICAgICAgICAgICAgIHwgIDYgKystLS0tCiBkcml2ZXJzL3R0eS9zZXJpYWwvb21hcC1z
ZXJpYWwuYyAgICAgICAgICAgIHwgIDYgKystLS0tCiBkcml2ZXJzL3R0eS9zZXJpYWwvb3dsLXVh
cnQuYyAgICAgICAgICAgICAgIHwgIDYgKystLS0tCiBkcml2ZXJzL3R0eS9zZXJpYWwvcGljMzJf
dWFydC5jICAgICAgICAgICAgIHwgIDcgKystLS0tLQogZHJpdmVycy90dHkvc2VyaWFsL3Fjb21f
Z2VuaV9zZXJpYWwuYyAgICAgICB8ICA2ICsrLS0tLQogZHJpdmVycy90dHkvc2VyaWFsL3JkYS11
YXJ0LmMgICAgICAgICAgICAgICB8ICA2ICsrLS0tLQogZHJpdmVycy90dHkvc2VyaWFsL3NhMTEw
MC5jICAgICAgICAgICAgICAgICB8ICA2ICsrLS0tLQogZHJpdmVycy90dHkvc2VyaWFsL3NhbXN1
bmdfdHR5LmMgICAgICAgICAgICB8ICA2ICsrLS0tLQogZHJpdmVycy90dHkvc2VyaWFsL3NjY254
cC5jICAgICAgICAgICAgICAgICB8IDEzICsrKysrKystLS0tLS0KIGRyaXZlcnMvdHR5L3Nlcmlh
bC9zZXJpYWwtdGVncmEuYyAgICAgICAgICAgfCAgNSArKy0tLQogZHJpdmVycy90dHkvc2VyaWFs
L3NlcmlhbF90eHg5LmMgICAgICAgICAgICB8ICA1ICsrLS0tCiBkcml2ZXJzL3R0eS9zZXJpYWwv
c2gtc2NpLmMgICAgICAgICAgICAgICAgIHwgIDYgKystLS0tCiBkcml2ZXJzL3R0eS9zZXJpYWwv
c2lmaXZlLmMgICAgICAgICAgICAgICAgIHwgIDYgKystLS0tCiBkcml2ZXJzL3R0eS9zZXJpYWwv
c3ByZF9zZXJpYWwuYyAgICAgICAgICAgIHwgIDYgKystLS0tCiBkcml2ZXJzL3R0eS9zZXJpYWwv
c3QtYXNjLmMgICAgICAgICAgICAgICAgIHwgIDYgKystLS0tCiBkcml2ZXJzL3R0eS9zZXJpYWwv
c3RtMzItdXNhcnQuYyAgICAgICAgICAgIHwgIDYgKystLS0tCiBkcml2ZXJzL3R0eS9zZXJpYWwv
c3VuaHYuYyAgICAgICAgICAgICAgICAgIHwgIDYgKystLS0tCiBkcml2ZXJzL3R0eS9zZXJpYWwv
c3VucGx1cy11YXJ0LmMgICAgICAgICAgIHwgIDYgKystLS0tCiBkcml2ZXJzL3R0eS9zZXJpYWwv
c3Vuc2FiLmMgICAgICAgICAgICAgICAgIHwgIDYgKystLS0tCiBkcml2ZXJzL3R0eS9zZXJpYWwv
c3Vuc3UuYyAgICAgICAgICAgICAgICAgIHwgIDYgKystLS0tCiBkcml2ZXJzL3R0eS9zZXJpYWwv
c3Vuemlsb2cuYyAgICAgICAgICAgICAgIHwgIDYgKystLS0tCiBkcml2ZXJzL3R0eS9zZXJpYWwv
dGVncmEtdGN1LmMgICAgICAgICAgICAgIHwgIDYgKystLS0tCiBkcml2ZXJzL3R0eS9zZXJpYWwv
dGltYnVhcnQuYyAgICAgICAgICAgICAgIHwgIDYgKystLS0tCiBkcml2ZXJzL3R0eS9zZXJpYWwv
dWFydGxpdGUuYyAgICAgICAgICAgICAgIHwgIDUgKystLS0KIGRyaXZlcnMvdHR5L3NlcmlhbC91
Y2NfdWFydC5jICAgICAgICAgICAgICAgfCAgNiArKy0tLS0KIGRyaXZlcnMvdHR5L3NlcmlhbC94
aWxpbnhfdWFydHBzLmMgICAgICAgICAgfCAgNSArKy0tLQogNjUgZmlsZXMgY2hhbmdlZCwgMTM3
IGluc2VydGlvbnMoKyksIDI0OSBkZWxldGlvbnMoLSkKCgpiYXNlLWNvbW1pdDogODcyOGMxNDEy
OWRmN2E2ZTI5MTg4YTJlNzM3YjQ3NzRmYjIwMDk1MwotLSAKMi40Mi4wCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxp
c3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
