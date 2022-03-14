Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 777194D86B1
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Mar 2022 15:18:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 40A70C60468;
	Mon, 14 Mar 2022 14:18:03 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 90603C60462
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Mar 2022 14:18:02 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1nTlVQ-0004zI-Ju; Mon, 14 Mar 2022 15:17:04 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nTlVH-000f2a-PX; Mon, 14 Mar 2022 15:16:54 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nTlVF-0097aV-Ov; Mon, 14 Mar 2022 15:16:53 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>,
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Lars Povlsen <lars.povlsen@microchip.com>,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 UNGLinuxDriver@microchip.com, linux-hwmon@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, Matt Mackall <mpm@selenic.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Oleksij Rempel <linux@rempel-privat.de>, Shawn Guo <shawnguo@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>
Date: Mon, 14 Mar 2022 15:16:27 +0100
Message-Id: <20220314141643.22184-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5140; i=uwe@kleine-koenig.org;
 h=from:subject; bh=UyYZYiS1jsIjibZ2MrufsJ1VrXFVRIfOx2nxS5wK9sc=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBiL03mRL8wE3boX5TsxdQb7A/4ALVpT93/3rzycIlB
 hFpTWs+JATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYi9N5gAKCRDB/BR4rcrsCc4ZB/
 9EDZG3qguuMeWbZAfXaH9prZGcSynBDBtwqLtmnGRt28ZTaarFw88YmZERvpaHjVQ0WPcNKCMjBphZ
 C/YPMpezXK2TikRkYqr2gsFaWKLwJ5+rqhGqxNSg4wZqzBgxjEgMa4BRbXRgQZvFOb/8ucyk4f/y3U
 oXCTg8ZOWQwebvd7JJsMztn6aZl6uW9im2ZqZji8vnmZt0yG28aNRWS33RDwWlQzrat//LG5Pb7S41
 7uVOkFnphQjm5eRjOvblGRbYIxlM0SEETKun6FycjvR4gk1OvqrePSrWZY01rN3iXQF/v/C3RrHXL6
 fzr+e9MLjqZjR6qpuN+DvujbCtKzRp
X-Developer-Key: i=uwe@kleine-koenig.org; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: Tomislav Denis <tomislav.denis@avl.com>, Heiko Stuebner <heiko@sntech.de>,
 linux-iio@vger.kernel.org, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-i2c@vger.kernel.org,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 linux-clk@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-rtc@vger.kernel.org, Michal Simek <michal.simek@xilinx.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andy Gross <agross@kernel.org>,
 Keguang Zhang <keguang.zhang@gmail.com>, linux-pwm@vger.kernel.org,
 kernel@pengutronix.de, linux-arm-msm@vger.kernel.org,
 Anand Ashok Dumbre <anand.ashok.dumbre@xilinx.com>,
 Vladimir Zapolskiy <vz@mleia.com>, linux-gpio@vger.kernel.org,
 =?utf-8?q?Andr=C3=A9_Gustavo_Nakagomi_Lopez?= <andregnl@usp.br>,
 linux-amlogic@lists.infradead.org,
 Amireddy Mallikarjuna reddy <mallikarjunax.reddy@linux.intel.com>,
 linux-mips@vger.kernel.org, linux-spi@vger.kernel.org,
 Cai Huoqing <caihuoqing@baidu.com>, linux-crypto@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, dmaengine@vger.kernel.org
Subject: [Linux-stm32] [PATCH v8 00/16] clk: provide new devm helpers for
	prepared and enabled clocks
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

SGVsbG8sCgp0aGlzIGlzIGFub3RoZXIgdHJ5IHRvIGNvbnZpbmNlIHRoZSByZWxldmFudCBwZW9w
bGUgdGhhdApkZXZtX2Nsa19nZXRfZW5hYmxlZCgpIGlzIGEgbmljZSBpZGVhLiBDb21wYXJlZCB0
byB2NyAoYmFjayBpbiBNYXkgMjAyMSkgdGhpcwpzZXJpZXMgaXMgcmViYXNlZCB0byB2NS4xNy1y
YzggYW5kIGNvbnZlcnRzIHF1aXRlIHNvbWUgZHJpdmVycyB0aGF0IG9wZW4gY29kZQpkZXZtX2Ns
a19nZXRfZW5hYmxlZCgpIHVwIHRvIG5vdyAocGF0Y2hlcyAjMyAtICMxMSkuCgpBIGNvbmNlcm4g
YWJvdXQgZGV2bV9jbGtfZ2V0X2VuYWJsZWQoKSBpbiB2NyB3YXMgdGhhdCBpdCBoZWxwcyBwZW9w
bGUgdG8gYmUKbGF6eSBhbmQgSSBhZ3JlZSB0aGF0IGluIHNvbWUgc2l0dWF0aW9ucyB3aGVuIGRl
dm1fY2xrX2dldF9lbmFibGVkKCkgaXMgdXNlZCBpdAp3b3VsZCBiZSBtb3JlIGVmZmljaWVudCBh
bmQgc2Vuc2libGUgdG8gY2FyZSB0byBvbmx5IGVuYWJsZSB0aGUgY2xrIHdoZW4gcmVhbGx5Cm5l
ZWRlZC4KCk9uIHRoZSBvdGhlciBoYW5kLCB0aGUgZnVuY3Rpb24gaXMgcmlnaHQgZm9yIHNvbWUg
dXNlcnMsIGUuZy4gdGhlIHdhdGNoZG9nCmRyaXZlcnMuIEZvciB0aGUgb3RoZXJzIGl0J3Mgbm90
IHNvIHNpbXBsZSB0byBqdWRnZS4gR2l2ZW4gdGhhdCB0aGVyZSBhcmUgYQpsb3Qgb2YgZHJpdmVy
cyB0aGF0IGFyZSBsYXp5IGV2ZW4gaWYgZG9pbmcgc28gaXMgc29tZSBlZmZvcnQgKGkuZS4gY2Fs
bGluZwpjbGtfcHJlcGFyZV9lbmFibGUoKSBhbmQgZGV2bV9hZGRfYWN0aW9uKCkpIGNvbnZpbmNl
cyBtZSwgdGhhdCBpbnRyb2R1Y2luZyB0aGUKZnVuY3Rpb24gZmFtaWx5IGlzIHNlbnNpYmxlLiAo
QW5kIGlmIHlvdSB3YW50IHRvIHdvcmsgb24gdGhlc2UgZHJpdmVycywKZ3JlcHBpbmcgZm9yIGRl
dm1fY2xrX2dldF9lbmFibGVkIGdpdmVzIHlvdSBhIGZldyBjYW5kaWRhdGVzIG9uY2UgdGhlCnNl
cmllcyBpcyBpbiA6LSkKCk90aGVyd2lzZSBsb29raW5nIGF0IHRoZSBkaWZmc3RhdCBvZiB0aGlz
IHNlcmllczoKCiA0OCBmaWxlcyBjaGFuZ2VkLCAyNTcgaW5zZXJ0aW9ucygrKSwgODUxIGRlbGV0
aW9ucygtKQoKaXMgcXVpdGUgY29udmluY2luZy4gSnVzdCB0aGUgZmlyc3QgdHdvIHBhdGNoZXMg
KHdoaWNoIGludHJvZHVjZSB0aGUgbmV3CmZ1bmN0aW9ucykgYWNjb3VudCBmb3IKCiAyIGZpbGVz
IGNoYW5nZWQsIDE2OSBpbnNlcnRpb25zKCspLCAxNyBkZWxldGlvbnMoLSkKCi4gQSByb3VnaCB0
aGlyZCBvZiB0aGUgYWRkZWQgbGluZXMgaXMgZG9jdW1lbnRhdGlvbi4gVGhlIHJlc3QgaXMgZHJp
dmVyCnVwZGF0ZXMgd2hpY2ggdGhlbiBoYXM6CgogNDYgZmlsZXMgY2hhbmdlZCwgODggaW5zZXJ0
aW9ucygrKSwgODM0IGRlbGV0aW9ucygtKQoKd2hpY2ggbWFrZXMgYSByZWFsbHkgbmljZSBjbGVh
bnVwLgoKVGhlIHNlcmllcyBpcyBidWlsZC10ZXN0ZWQgb24gYXJtNjQsIG02OGssIHBvd2VycGMs
IHJpc2N2LCBzMzkwLCBzcGFyYzY0CmFuZCB4ODZfNjQgdXNpbmcgYW4gYWxsbW9kY29uZmlnLgoK
QmVzdCByZWdhcmRzClV3ZQoKVXdlIEtsZWluZS1Lw7ZuaWcgKDE2KToKICBjbGs6IGdlbmVyYWxp
emUgZGV2bV9jbGtfZ2V0KCkgYSBiaXQKICBjbGs6IFByb3ZpZGUgbmV3IGRldm1fY2xrIGhlbHBl
cnMgZm9yIHByZXBhcmVkIGFuZCBlbmFibGVkIGNsb2NrcwogIGh3bW9uOiBNYWtlIHVzZSBvZiBk
ZXZtX2Nsa19nZXRfZW5hYmxlZCgpCiAgaWlvOiBNYWtlIHVzZSBvZiBkZXZtX2Nsa19nZXRfZW5h
YmxlZCgpCiAgaHdybmc6IG1lc29uIC0gRG9uJ3Qgb3Blbi1jb2RlIGRldm1fY2xrX2dldF9vcHRp
b25hbF9lbmFibGVkKCkKICBidXM6IGJ0MTogRG9uJ3Qgb3BlbiBjb2RlIGRldm1fY2xrX2dldF9l
bmFibGVkKCkKICBncGlvOiB2ZjYxMDogU2ltcGxpZnkgZXJyb3IgaGFuZGxpbmcgaW4gcHJvYmUK
ICBkcm0vbWVzb246IGR3LWhkbWk6IERvbid0IG9wZW4gY29kZSBkZXZtX2Nsa19nZXRfZW5hYmxl
ZCgpCiAgcnRjOiBpbmdlbmljOiBTaW1wbGlmeSB1c2luZyBkZXZtX2Nsa19nZXRfZW5hYmxlZCgp
CiAgY2xrOiBtZXNvbjogYXhnLWF1ZGlvOiBEb24ndCBkdXBsaWNhdGUgZGV2bV9jbGtfZ2V0X2Vu
YWJsZWQoKQogIHdhdGNoZG9nOiBNYWtlIHVzZSBvZiBkZXZtX2Nsa19nZXRfZW5hYmxlZCgpCiAg
cHdtOiBhdG1lbDogU2ltcGxpZnkgdXNpbmcgZGV2bV9jbGtfZ2V0X3ByZXBhcmVkKCkKICBydGM6
IGF0OTFzYW05OiBTaW1wbGlmeSB1c2luZyBkZXZtX2Nsa19nZXRfZW5hYmxlZCgpCiAgaTJjOiBp
bXg6IFNpbXBsaWZ5IHVzaW5nIGRldm1fY2xrX2dldF9lbmFibGVkKCkKICBzcGk6IGRhdmluY2k6
IFNpbXBsaWZ5IHVzaW5nIGRldm1fY2xrX2dldF9lbmFibGVkKCkKICBkbWFlbmdpbmU6IGxnbTog
Rml4IGVycm9yIGhhbmRsaW5nCgogZHJpdmVycy9idXMvYnQxLWFwYi5jICAgICAgICAgICAgICAg
ICB8IDIzICstLS0tLS0KIGRyaXZlcnMvYnVzL2J0MS1heGkuYyAgICAgICAgICAgICAgICAgfCAy
MyArLS0tLS0tCiBkcml2ZXJzL2NoYXIvaHdfcmFuZG9tL21lc29uLXJuZy5jICAgIHwgMjAgKy0t
LS0tCiBkcml2ZXJzL2Nsay9jbGstZGV2cmVzLmMgICAgICAgICAgICAgIHwgOTYgKysrKysrKysr
KysrKysrKysrKysrKy0tLS0tCiBkcml2ZXJzL2Nsay9tZXNvbi9heGctYXVkaW8uYyAgICAgICAg
IHwgMzYgKystLS0tLS0tLQogZHJpdmVycy9kbWEvbGdtL2xnbS1kbWEuYyAgICAgICAgICAgICB8
ICA4ICstLQogZHJpdmVycy9ncGlvL2dwaW8tdmY2MTAuYyAgICAgICAgICAgICB8IDQ1ICsrKy0t
LS0tLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9kd19oZG1pLmMgfCA0OCArKysr
Ky0tLS0tLS0tLQogZHJpdmVycy9od21vbi9heGktZmFuLWNvbnRyb2wuYyAgICAgICB8IDE1ICst
LS0tCiBkcml2ZXJzL2h3bW9uL2x0YzI5NDctY29yZS5jICAgICAgICAgIHwgMTcgKy0tLS0KIGRy
aXZlcnMvaHdtb24vbXI3NTIwMy5jICAgICAgICAgICAgICAgfCAyNiArLS0tLS0tLQogZHJpdmVy
cy9od21vbi9zcGFyeDUtdGVtcC5jICAgICAgICAgICB8IDE5ICstLS0tLQogZHJpdmVycy9pMmMv
YnVzc2VzL2kyYy1pbXguYyAgICAgICAgICB8IDEyICstLS0KIGRyaXZlcnMvaWlvL2FkYy9hZDcx
MjQuYyAgICAgICAgICAgICAgfCAxNSArLS0tLQogZHJpdmVycy9paW8vYWRjL2FkNzc2OC0xLmMg
ICAgICAgICAgICB8IDE3ICstLS0tCiBkcml2ZXJzL2lpby9hZGMvYWQ5NDY3LmMgICAgICAgICAg
ICAgIHwgMTcgKy0tLS0KIGRyaXZlcnMvaWlvL2FkYy9pbmdlbmljLWFkYy5jICAgICAgICAgfCAx
NSArLS0tLQogZHJpdmVycy9paW8vYWRjL2xwYzE4eHhfYWRjLmMgICAgICAgICB8IDE4ICstLS0t
CiBkcml2ZXJzL2lpby9hZGMvcm9ja2NoaXBfc2FyYWRjLmMgICAgIHwgNDQgKy0tLS0tLS0tLS0t
CiBkcml2ZXJzL2lpby9hZGMvdGktYWRzMTMxZTA4LmMgICAgICAgIHwgMTkgKy0tLS0tCiBkcml2
ZXJzL2lpby9hZGMveGlsaW54LWFtcy5jICAgICAgICAgIHwgMTUgKy0tLS0KIGRyaXZlcnMvaWlv
L2FkYy94aWxpbngteGFkYy1jb3JlLmMgICAgfCAxOCArLS0tLQogZHJpdmVycy9paW8vZnJlcXVl
bmN5L2FkZjQzNzEuYyAgICAgICB8IDE3ICstLS0tCiBkcml2ZXJzL2lpby9mcmVxdWVuY3kvYWRt
djEwMTMuYyAgICAgIHwgMTUgKy0tLS0KIGRyaXZlcnMvaWlvL2ZyZXF1ZW5jeS9hZHJmNjc4MC5j
ICAgICAgfCAxNiArLS0tLQogZHJpdmVycy9paW8vaW11L2FkaXMxNjQ3NS5jICAgICAgICAgICB8
IDE1ICstLS0tCiBkcml2ZXJzL3B3bS9wd20tYXRtZWwuYyAgICAgICAgICAgICAgIHwgMTYgKy0t
LS0KIGRyaXZlcnMvcnRjL3J0Yy1hdDkxc2FtOS5jICAgICAgICAgICAgfCAyMiArKy0tLS0KIGRy
aXZlcnMvcnRjL3J0Yy1qejQ3NDAuYyAgICAgICAgICAgICAgfCAyMSArLS0tLS0KIGRyaXZlcnMv
c3BpL3NwaS1kYXZpbmNpLmMgICAgICAgICAgICAgfCAxMSArLS0KIGRyaXZlcnMvd2F0Y2hkb2cv
Y2FkZW5jZV93ZHQuYyAgICAgICAgfCAxNyArLS0tLQogZHJpdmVycy93YXRjaGRvZy9kYXZpbmNp
X3dkdC5jICAgICAgICB8IDE4ICstLS0tCiBkcml2ZXJzL3dhdGNoZG9nL2ltZ3BkY193ZHQuYyAg
ICAgICAgIHwgMzEgKy0tLS0tLS0tCiBkcml2ZXJzL3dhdGNoZG9nL2lteDJfd2R0LmMgICAgICAg
ICAgIHwgMTUgKy0tLS0KIGRyaXZlcnMvd2F0Y2hkb2cvaW14N3VscF93ZHQuYyAgICAgICAgfCAx
NSArLS0tLQogZHJpdmVycy93YXRjaGRvZy9sb29uZ3NvbjFfd2R0LmMgICAgICB8IDE3ICstLS0t
CiBkcml2ZXJzL3dhdGNoZG9nL2xwYzE4eHhfd2R0LmMgICAgICAgIHwgMzAgKy0tLS0tLS0tCiBk
cml2ZXJzL3dhdGNoZG9nL21lc29uX2d4YmJfd2R0LmMgICAgIHwgMTYgKy0tLS0KIGRyaXZlcnMv
d2F0Y2hkb2cvb2ZfeGlsaW54X3dkdC5jICAgICAgfCAxNiArLS0tLQogZHJpdmVycy93YXRjaGRv
Zy9waWMzMi1kbXQuYyAgICAgICAgICB8IDE1ICstLS0tCiBkcml2ZXJzL3dhdGNoZG9nL3BpYzMy
LXdkdC5jICAgICAgICAgIHwgMTcgKy0tLS0KIGRyaXZlcnMvd2F0Y2hkb2cvcG54NDAwOF93ZHQu
YyAgICAgICAgfCAxNSArLS0tLQogZHJpdmVycy93YXRjaGRvZy9xY29tLXdkdC5jICAgICAgICAg
ICB8IDE2ICstLS0tCiBkcml2ZXJzL3dhdGNoZG9nL3J0ZDExOXhfd2R0LmMgICAgICAgIHwgMTYg
Ky0tLS0KIGRyaXZlcnMvd2F0Y2hkb2cvc3RfbHBjX3dkdC5jICAgICAgICAgfCAxNiArLS0tLQog
ZHJpdmVycy93YXRjaGRvZy9zdG0zMl9pd2RnLmMgICAgICAgICB8IDMxICstLS0tLS0tLQogZHJp
dmVycy93YXRjaGRvZy92aXNjb250aV93ZHQuYyAgICAgICB8IDE4ICstLS0tCiBpbmNsdWRlL2xp
bnV4L2Nsay5oICAgICAgICAgICAgICAgICAgIHwgOTAgKysrKysrKysrKysrKysrKysrKysrKysr
LQogNDggZmlsZXMgY2hhbmdlZCwgMjU3IGluc2VydGlvbnMoKyksIDg1MSBkZWxldGlvbnMoLSkK
CgpiYXNlLWNvbW1pdDogMDk2ODhjMDE2NmU3NmNlMmZiODVlODZiOWQ5OWJlOGIwMDg0Y2RmOQot
LSAKMi4zNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9s
aXN0aW5mby9saW51eC1zdG0zMgo=
