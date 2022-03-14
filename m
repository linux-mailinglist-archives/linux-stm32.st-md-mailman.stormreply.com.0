Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 671C84D86AF
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Mar 2022 15:17:55 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2CC83C60468;
	Mon, 14 Mar 2022 14:17:55 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D5231C60462
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Mar 2022 14:17:53 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1nTlVS-0004zK-Bl; Mon, 14 Mar 2022 15:17:06 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nTlVI-000f2h-Bp; Mon, 14 Mar 2022 15:16:55 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nTlVG-0097ab-9N; Mon, 14 Mar 2022 15:16:54 +0100
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
Date: Mon, 14 Mar 2022 15:16:29 +0100
Message-Id: <20220314141643.22184-3-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220314141643.22184-1-u.kleine-koenig@pengutronix.de>
References: <20220314141643.22184-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6580; i=uwe@kleine-koenig.org;
 h=from:subject; bh=jqwSnvDQbBb4RgD/N+2Gw8Lk4ZgGlEcniX5xP+ormpg=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBiL03vygZ14+FklBjEtfsr0n5Fj7pM3zCRBT9hjlOo
 D6x0wfOJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYi9N7wAKCRDB/BR4rcrsCW0OB/
 43XIdPZ3YEVyeJcVZVgIWqjU0WCMAkdNPd+cU39oxeA5WcvEM+r2wINAXO9SjYVP4eV60bVzYVmWWP
 /4qbeio/xVurdJ7Ut2JGUCHJFu6SPC4ClqX2SoQ/JgYpWKUthuRTck4jK/kt92O+Rx8MXx3VYb58Te
 WdLCTWqtr7pFF4DaX9T5+yuCky8m4NUbi3kaBeCxn5rVPZlXNv0IEn1k9Xkeb5VWYhGIzPb277tXWL
 2BwknXn7RuNCQErT4IAfGPlnO1EMkKZxvhHJ3f5GuCKo9hh7+mqbcb2+7anljvY6nbic3kSBAgO8Kc
 UpsFmFTmEF329SWkaIlHjE4yXN1sYB
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
 Alexandru Ardelean <aardelean@deviqon.com>,
 Keguang Zhang <keguang.zhang@gmail.com>, linux-pwm@vger.kernel.org,
 kernel@pengutronix.de, linux-arm-msm@vger.kernel.org,
 Anand Ashok Dumbre <anand.ashok.dumbre@xilinx.com>,
 Vladimir Zapolskiy <vz@mleia.com>, linux-gpio@vger.kernel.org,
 =?utf-8?q?Andr=C3=A9_Gustavo_Nakagomi_Lopez?= <andregnl@usp.br>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 linux-amlogic@lists.infradead.org,
 Amireddy Mallikarjuna reddy <mallikarjunax.reddy@linux.intel.com>,
 linux-mips@vger.kernel.org, linux-spi@vger.kernel.org,
 Cai Huoqing <caihuoqing@baidu.com>, linux-crypto@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, dmaengine@vger.kernel.org
Subject: [Linux-stm32] [PATCH v8 02/16] clk: Provide new devm_clk helpers
	for prepared and enabled clocks
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

V2hlbiBhIGRyaXZlciBrZWVwcyBhIGNsb2NrIHByZXBhcmVkIChvciBlbmFibGVkKSBkdXJpbmcg
dGhlIHdob2xlCmxpZmV0aW1lIG9mIHRoZSBkcml2ZXIsIHRoZXNlIGhlbHBlcnMgYWxsb3cgdG8g
c2ltcGxpZnkgdGhlIGRyaXZlcnMuCgpSZXZpZXdlZC1ieTogSm9uYXRoYW4gQ2FtZXJvbiA8Sm9u
YXRoYW4uQ2FtZXJvbkBodWF3ZWkuY29tPgpSZXZpZXdlZC1ieTogQWxleGFuZHJ1IEFyZGVsZWFu
IDxhYXJkZWxlYW5AZGV2aXFvbi5jb20+ClNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmln
IDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+Ci0tLQogZHJpdmVycy9jbGsvY2xrLWRl
dnJlcy5jIHwgMzEgKysrKysrKysrKysrKysKIGluY2x1ZGUvbGludXgvY2xrLmggICAgICB8IDkw
ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0KIDIgZmlsZXMgY2hhbmdl
ZCwgMTIwIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2Nsay9jbGstZGV2cmVzLmMgYi9kcml2ZXJzL2Nsay9jbGstZGV2cmVzLmMKaW5kZXggZmI3NzYx
ODg4YjMwLi40NzA3ZmU3MThmMGIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvY2xrL2Nsay1kZXZyZXMu
YworKysgYi9kcml2ZXJzL2Nsay9jbGstZGV2cmVzLmMKQEAgLTY3LDEyICs2Nyw0MyBAQCBzdHJ1
Y3QgY2xrICpkZXZtX2Nsa19nZXQoc3RydWN0IGRldmljZSAqZGV2LCBjb25zdCBjaGFyICppZCkK
IH0KIEVYUE9SVF9TWU1CT0woZGV2bV9jbGtfZ2V0KTsKIAorc3RydWN0IGNsayAqZGV2bV9jbGtf
Z2V0X3ByZXBhcmVkKHN0cnVjdCBkZXZpY2UgKmRldiwgY29uc3QgY2hhciAqaWQpCit7CisJcmV0
dXJuIF9fZGV2bV9jbGtfZ2V0KGRldiwgaWQsIGNsa19nZXQsIGNsa19wcmVwYXJlLCBjbGtfdW5w
cmVwYXJlKTsKKworfQorRVhQT1JUX1NZTUJPTChkZXZtX2Nsa19nZXRfcHJlcGFyZWQpOworCitz
dHJ1Y3QgY2xrICpkZXZtX2Nsa19nZXRfZW5hYmxlZChzdHJ1Y3QgZGV2aWNlICpkZXYsIGNvbnN0
IGNoYXIgKmlkKQoreworCXJldHVybiBfX2Rldm1fY2xrX2dldChkZXYsIGlkLCBjbGtfZ2V0LAor
CQkJICAgICAgY2xrX3ByZXBhcmVfZW5hYmxlLCBjbGtfZGlzYWJsZV91bnByZXBhcmUpOworCit9
CitFWFBPUlRfU1lNQk9MKGRldm1fY2xrX2dldF9lbmFibGVkKTsKKwogc3RydWN0IGNsayAqZGV2
bV9jbGtfZ2V0X29wdGlvbmFsKHN0cnVjdCBkZXZpY2UgKmRldiwgY29uc3QgY2hhciAqaWQpCiB7
CiAJcmV0dXJuIF9fZGV2bV9jbGtfZ2V0KGRldiwgaWQsIGNsa19nZXRfb3B0aW9uYWwsIE5VTEws
IE5VTEwpOwogfQogRVhQT1JUX1NZTUJPTChkZXZtX2Nsa19nZXRfb3B0aW9uYWwpOwogCitzdHJ1
Y3QgY2xrICpkZXZtX2Nsa19nZXRfb3B0aW9uYWxfcHJlcGFyZWQoc3RydWN0IGRldmljZSAqZGV2
LCBjb25zdCBjaGFyICppZCkKK3sKKwlyZXR1cm4gX19kZXZtX2Nsa19nZXQoZGV2LCBpZCwgY2xr
X2dldF9vcHRpb25hbCwKKwkJCSAgICAgIGNsa19wcmVwYXJlLCBjbGtfdW5wcmVwYXJlKTsKKwor
fQorRVhQT1JUX1NZTUJPTChkZXZtX2Nsa19nZXRfb3B0aW9uYWxfcHJlcGFyZWQpOworCitzdHJ1
Y3QgY2xrICpkZXZtX2Nsa19nZXRfb3B0aW9uYWxfZW5hYmxlZChzdHJ1Y3QgZGV2aWNlICpkZXYs
IGNvbnN0IGNoYXIgKmlkKQoreworCXJldHVybiBfX2Rldm1fY2xrX2dldChkZXYsIGlkLCBjbGtf
Z2V0X29wdGlvbmFsLAorCQkJICAgICAgY2xrX3ByZXBhcmVfZW5hYmxlLCBjbGtfZGlzYWJsZV91
bnByZXBhcmUpOworCit9CitFWFBPUlRfU1lNQk9MKGRldm1fY2xrX2dldF9vcHRpb25hbF9lbmFi
bGVkKTsKKwogc3RydWN0IGNsa19idWxrX2RldnJlcyB7CiAJc3RydWN0IGNsa19idWxrX2RhdGEg
KmNsa3M7CiAJaW50IG51bV9jbGtzOwpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9jbGsuaCBi
L2luY2x1ZGUvbGludXgvY2xrLmgKaW5kZXggMjY2ZThkZTNjYjUxLi5iMDExZGJiYTcxMDkgMTAw
NjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgvY2xrLmgKKysrIGIvaW5jbHVkZS9saW51eC9jbGsuaApA
QCAtNDQ5LDcgKzQ0OSw3IEBAIGludCBfX211c3RfY2hlY2sgZGV2bV9jbGtfYnVsa19nZXRfYWxs
KHN0cnVjdCBkZXZpY2UgKmRldiwKICAqIHRoZSBjbG9jayBwcm9kdWNlci4gIChJT1csIEBpZCBt
YXkgYmUgaWRlbnRpY2FsIHN0cmluZ3MsIGJ1dAogICogY2xrX2dldCBtYXkgcmV0dXJuIGRpZmZl
cmVudCBjbG9jayBwcm9kdWNlcnMgZGVwZW5kaW5nIG9uIEBkZXYuKQogICoKLSAqIERyaXZlcnMg
bXVzdCBhc3N1bWUgdGhhdCB0aGUgY2xvY2sgc291cmNlIGlzIG5vdCBlbmFibGVkLgorICogRHJp
dmVycyBtdXN0IGFzc3VtZSB0aGF0IHRoZSBjbG9jayBzb3VyY2UgaXMgbmVpdGhlciBwcmVwYXJl
ZCBub3IgZW5hYmxlZC4KICAqCiAgKiBkZXZtX2Nsa19nZXQgc2hvdWxkIG5vdCBiZSBjYWxsZWQg
ZnJvbSB3aXRoaW4gaW50ZXJydXB0IGNvbnRleHQuCiAgKgpAQCAtNDU4LDYgKzQ1OCw0NyBAQCBp
bnQgX19tdXN0X2NoZWNrIGRldm1fY2xrX2J1bGtfZ2V0X2FsbChzdHJ1Y3QgZGV2aWNlICpkZXYs
CiAgKi8KIHN0cnVjdCBjbGsgKmRldm1fY2xrX2dldChzdHJ1Y3QgZGV2aWNlICpkZXYsIGNvbnN0
IGNoYXIgKmlkKTsKIAorLyoqCisgKiBkZXZtX2Nsa19nZXRfcHJlcGFyZWQgLSBkZXZtX2Nsa19n
ZXQoKSArIGNsa19wcmVwYXJlKCkKKyAqIEBkZXY6IGRldmljZSBmb3IgY2xvY2sgImNvbnN1bWVy
IgorICogQGlkOiBjbG9jayBjb25zdW1lciBJRAorICoKKyAqIFJldHVybnMgYSBzdHJ1Y3QgY2xr
IGNvcnJlc3BvbmRpbmcgdG8gdGhlIGNsb2NrIHByb2R1Y2VyLCBvcgorICogdmFsaWQgSVNfRVJS
KCkgY29uZGl0aW9uIGNvbnRhaW5pbmcgZXJybm8uICBUaGUgaW1wbGVtZW50YXRpb24KKyAqIHVz
ZXMgQGRldiBhbmQgQGlkIHRvIGRldGVybWluZSB0aGUgY2xvY2sgY29uc3VtZXIsIGFuZCB0aGVy
ZWJ5CisgKiB0aGUgY2xvY2sgcHJvZHVjZXIuICAoSU9XLCBAaWQgbWF5IGJlIGlkZW50aWNhbCBz
dHJpbmdzLCBidXQKKyAqIGNsa19nZXQgbWF5IHJldHVybiBkaWZmZXJlbnQgY2xvY2sgcHJvZHVj
ZXJzIGRlcGVuZGluZyBvbiBAZGV2LikKKyAqCisgKiBUaGUgcmV0dXJuZWQgY2xrIChpZiB2YWxp
ZCkgaXMgcHJlcGFyZWQuIERyaXZlcnMgbXVzdCBob3dldmVyIGFzc3VtZSB0aGF0IHRoZQorICog
Y2xvY2sgaXMgbm90IGVuYWJsZWQuCisgKgorICogZGV2bV9jbGtfZ2V0X3ByZXBhcmVkIHNob3Vs
ZCBub3QgYmUgY2FsbGVkIGZyb20gd2l0aGluIGludGVycnVwdCBjb250ZXh0LgorICoKKyAqIFRo
ZSBjbG9jayB3aWxsIGF1dG9tYXRpY2FsbHkgYmUgdW5wcmVwYXJlZCBhbmQgZnJlZWQgd2hlbiB0
aGUKKyAqIGRldmljZSBpcyB1bmJvdW5kIGZyb20gdGhlIGJ1cy4KKyAqLworc3RydWN0IGNsayAq
ZGV2bV9jbGtfZ2V0X3ByZXBhcmVkKHN0cnVjdCBkZXZpY2UgKmRldiwgY29uc3QgY2hhciAqaWQp
OworCisvKioKKyAqIGRldm1fY2xrX2dldF9lbmFibGVkIC0gZGV2bV9jbGtfZ2V0KCkgKyBjbGtf
cHJlcGFyZV9lbmFibGUoKQorICogQGRldjogZGV2aWNlIGZvciBjbG9jayAiY29uc3VtZXIiCisg
KiBAaWQ6IGNsb2NrIGNvbnN1bWVyIElECisgKgorICogUmV0dXJucyBhIHN0cnVjdCBjbGsgY29y
cmVzcG9uZGluZyB0byB0aGUgY2xvY2sgcHJvZHVjZXIsIG9yIHZhbGlkIElTX0VSUigpCisgKiBj
b25kaXRpb24gY29udGFpbmluZyBlcnJuby4gIFRoZSBpbXBsZW1lbnRhdGlvbiB1c2VzIEBkZXYg
YW5kIEBpZCB0bworICogZGV0ZXJtaW5lIHRoZSBjbG9jayBjb25zdW1lciwgYW5kIHRoZXJlYnkg
dGhlIGNsb2NrIHByb2R1Y2VyLiAgKElPVywgQGlkIG1heQorICogYmUgaWRlbnRpY2FsIHN0cmlu
Z3MsIGJ1dCBjbGtfZ2V0IG1heSByZXR1cm4gZGlmZmVyZW50IGNsb2NrIHByb2R1Y2VycworICog
ZGVwZW5kaW5nIG9uIEBkZXYuKQorICoKKyAqIFRoZSByZXR1cm5lZCBjbGsgKGlmIHZhbGlkKSBp
cyBwcmVwYXJlZCBhbmQgZW5hYmxlZC4KKyAqCisgKiBkZXZtX2Nsa19nZXRfcHJlcGFyZWQgc2hv
dWxkIG5vdCBiZSBjYWxsZWQgZnJvbSB3aXRoaW4gaW50ZXJydXB0IGNvbnRleHQuCisgKgorICog
VGhlIGNsb2NrIHdpbGwgYXV0b21hdGljYWxseSBiZSBkaXNhYmxlZCwgdW5wcmVwYXJlZCBhbmQg
ZnJlZWQgd2hlbiB0aGUKKyAqIGRldmljZSBpcyB1bmJvdW5kIGZyb20gdGhlIGJ1cy4KKyAqLwor
c3RydWN0IGNsayAqZGV2bV9jbGtfZ2V0X2VuYWJsZWQoc3RydWN0IGRldmljZSAqZGV2LCBjb25z
dCBjaGFyICppZCk7CisKIC8qKgogICogZGV2bV9jbGtfZ2V0X29wdGlvbmFsIC0gbG9va3VwIGFu
ZCBvYnRhaW4gYSBtYW5hZ2VkIHJlZmVyZW5jZSB0byBhbiBvcHRpb25hbAogICoJCQkgICBjbG9j
ayBwcm9kdWNlci4KQEAgLTQ2OSw2ICs1MTAsMjkgQEAgc3RydWN0IGNsayAqZGV2bV9jbGtfZ2V0
KHN0cnVjdCBkZXZpY2UgKmRldiwgY29uc3QgY2hhciAqaWQpOwogICovCiBzdHJ1Y3QgY2xrICpk
ZXZtX2Nsa19nZXRfb3B0aW9uYWwoc3RydWN0IGRldmljZSAqZGV2LCBjb25zdCBjaGFyICppZCk7
CiAKKy8qKgorICogZGV2bV9jbGtfZ2V0X29wdGlvbmFsX3ByZXBhcmVkIC0gZGV2bV9jbGtfZ2V0
X29wdGlvbmFsKCkgKyBjbGtfcHJlcGFyZSgpCisgKiBAZGV2OiBkZXZpY2UgZm9yIGNsb2NrICJj
b25zdW1lciIKKyAqIEBpZDogY2xvY2sgY29uc3VtZXIgSUQKKyAqCisgKiBCZWhhdmVzIHRoZSBz
YW1lIGFzIGRldm1fY2xrX2dldF9wcmVwYXJlZCgpIGV4Y2VwdCB3aGVyZSB0aGVyZSBpcyBubyBj
bG9jaworICogcHJvZHVjZXIuICBJbiB0aGlzIGNhc2UsIGluc3RlYWQgb2YgcmV0dXJuaW5nIC1F
Tk9FTlQsIHRoZSBmdW5jdGlvbiByZXR1cm5zCisgKiBOVUxMLgorICovCitzdHJ1Y3QgY2xrICpk
ZXZtX2Nsa19nZXRfb3B0aW9uYWxfcHJlcGFyZWQoc3RydWN0IGRldmljZSAqZGV2LCBjb25zdCBj
aGFyICppZCk7CisKKy8qKgorICogZGV2bV9jbGtfZ2V0X29wdGlvbmFsX2VuYWJsZWQgLSBkZXZt
X2Nsa19nZXRfb3B0aW9uYWwoKSArCisgKiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGNsa19wcmVwYXJlX2VuYWJsZSgpCisgKiBAZGV2OiBkZXZpY2UgZm9yIGNsb2NrICJjb25zdW1l
ciIKKyAqIEBpZDogY2xvY2sgY29uc3VtZXIgSUQKKyAqCisgKiBCZWhhdmVzIHRoZSBzYW1lIGFz
IGRldm1fY2xrX2dldF9lbmFibGVkKCkgZXhjZXB0IHdoZXJlIHRoZXJlIGlzIG5vIGNsb2NrCisg
KiBwcm9kdWNlci4gIEluIHRoaXMgY2FzZSwgaW5zdGVhZCBvZiByZXR1cm5pbmcgLUVOT0VOVCwg
dGhlIGZ1bmN0aW9uIHJldHVybnMKKyAqIE5VTEwuCisgKi8KK3N0cnVjdCBjbGsgKmRldm1fY2xr
X2dldF9vcHRpb25hbF9lbmFibGVkKHN0cnVjdCBkZXZpY2UgKmRldiwgY29uc3QgY2hhciAqaWQp
OworCiAvKioKICAqIGRldm1fZ2V0X2Nsa19mcm9tX2NoaWxkIC0gbG9va3VwIGFuZCBvYnRhaW4g
YSBtYW5hZ2VkIHJlZmVyZW5jZSB0byBhCiAgKgkJCSAgICAgY2xvY2sgcHJvZHVjZXIgZnJvbSBj
aGlsZCBub2RlLgpAQCAtODEzLDEyICs4NzcsMzYgQEAgc3RhdGljIGlubGluZSBzdHJ1Y3QgY2xr
ICpkZXZtX2Nsa19nZXQoc3RydWN0IGRldmljZSAqZGV2LCBjb25zdCBjaGFyICppZCkKIAlyZXR1
cm4gTlVMTDsKIH0KIAorc3RhdGljIGlubGluZSBzdHJ1Y3QgY2xrICpkZXZtX2Nsa19nZXRfcHJl
cGFyZWQoc3RydWN0IGRldmljZSAqZGV2LAorCQkJCQkJY29uc3QgY2hhciAqaWQpCit7CisJcmV0
dXJuIE5VTEw7Cit9CisKK3N0YXRpYyBpbmxpbmUgc3RydWN0IGNsayAqZGV2bV9jbGtfZ2V0X2Vu
YWJsZWQoc3RydWN0IGRldmljZSAqZGV2LAorCQkJCQkgICAgICAgY29uc3QgY2hhciAqaWQpCit7
CisJcmV0dXJuIE5VTEw7Cit9CisKIHN0YXRpYyBpbmxpbmUgc3RydWN0IGNsayAqZGV2bV9jbGtf
Z2V0X29wdGlvbmFsKHN0cnVjdCBkZXZpY2UgKmRldiwKIAkJCQkJCWNvbnN0IGNoYXIgKmlkKQog
ewogCXJldHVybiBOVUxMOwogfQogCitzdGF0aWMgaW5saW5lIHN0cnVjdCBjbGsgKmRldm1fY2xr
X2dldF9vcHRpb25hbF9wcmVwYXJlZChzdHJ1Y3QgZGV2aWNlICpkZXYsCisJCQkJCQkJIGNvbnN0
IGNoYXIgKmlkKQoreworCXJldHVybiBOVUxMOworfQorCitzdGF0aWMgaW5saW5lIHN0cnVjdCBj
bGsgKmRldm1fY2xrX2dldF9vcHRpb25hbF9lbmFibGVkKHN0cnVjdCBkZXZpY2UgKmRldiwKKwkJ
CQkJCQljb25zdCBjaGFyICppZCkKK3sKKwlyZXR1cm4gTlVMTDsKK30KKwogc3RhdGljIGlubGlu
ZSBpbnQgX19tdXN0X2NoZWNrIGRldm1fY2xrX2J1bGtfZ2V0KHN0cnVjdCBkZXZpY2UgKmRldiwg
aW50IG51bV9jbGtzLAogCQkJCQkJIHN0cnVjdCBjbGtfYnVsa19kYXRhICpjbGtzKQogewotLSAK
Mi4zNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0
aW5mby9saW51eC1zdG0zMgo=
