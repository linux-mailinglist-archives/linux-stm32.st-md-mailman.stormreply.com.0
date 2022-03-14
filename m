Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5759F4D86AD
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Mar 2022 15:17:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1C5A7C60467;
	Mon, 14 Mar 2022 14:17:51 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1FEEEC5F1EB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Mar 2022 14:17:50 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1nTlVS-0004zJ-Bp; Mon, 14 Mar 2022 15:17:06 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nTlVI-000f2e-6F; Mon, 14 Mar 2022 15:16:54 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nTlVG-0097aY-0z; Mon, 14 Mar 2022 15:16:54 +0100
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
Date: Mon, 14 Mar 2022 15:16:28 +0100
Message-Id: <20220314141643.22184-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220314141643.22184-1-u.kleine-koenig@pengutronix.de>
References: <20220314141643.22184-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2782; i=uwe@kleine-koenig.org;
 h=from:subject; bh=R5i2zDoCQJSy1ZUerxZ75D9yH7vs0Yq+WK5mYZohDQQ=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBiL03r/FSSSMkN+/sPRSPRmnzWG7n80mxF6W/uPagY
 Wwq6G3KJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYi9N6wAKCRDB/BR4rcrsCV9PB/
 0Ta+XpJTQdCUjeWsaz8sXPQtyQK6APLzjZjbMmijfMg1ieaLo661ZXlQ8J00dDwFm86jaFSY4bMFT8
 kCb+ukClQrRlqBmc6meykJlwPPOzYg7tGDzPrxmdQ7VGGvBFA5K/WpPlbvDdKXelOYAu2aZwBCWbq0
 FzgMe0Sh1f0MgOHwnoUeIX/cHA/dbXzDLOwzwlbn5S0v9G9LM7gvadMBgB/z4hNNQfus9Vkl9FekTs
 bJwETa6zMgveA6AyNUTNmVeD+lAZj1BLCvTzQ2PgRzuzhYXSLbFBv7hMNf2L522++rcuXIAD0es4uA
 lpqZWzW5CukIzfkUhCS/a5WhswjluT
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
Subject: [Linux-stm32] [PATCH v8 01/16] clk: generalize devm_clk_get() a bit
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

QWxsb3cgdG8gYWRkIGFuIGV4aXQgaG9vayB0byBkZXZtIG1hbmFnZWQgY2xvY2tzLiBBbHNvIHVz
ZQpjbGtfZ2V0X29wdGlvbmFsKCkgaW4gZGV2bV9jbGtfZ2V0X29wdGlvbmFsIGluc3RlYWQgb2Yg
b3BlbiBjb2RpbmcgaXQuClRoZSBnZW5lcmFsaXNhdGlvbiB3aWxsIGJlIHVzZWQgaW4gdGhlIG5l
eHQgY29tbWl0IHRvIGFkZCBzb21lIG1vcmUKZGV2bV9jbGsgaGVscGVycy4KClJldmlld2VkLWJ5
OiBKb25hdGhhbiBDYW1lcm9uIDxKb25hdGhhbi5DYW1lcm9uQGh1YXdlaS5jb20+ClJldmlld2Vk
LWJ5OiBBbGV4YW5kcnUgQXJkZWxlYW4gPGFhcmRlbGVhbkBkZXZpcW9uLmNvbT4KU2lnbmVkLW9m
Zi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4K
LS0tCiBkcml2ZXJzL2Nsay9jbGstZGV2cmVzLmMgfCA2NyArKysrKysrKysrKysrKysrKysrKysr
KysrKysrKystLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNTAgaW5zZXJ0aW9ucygrKSwgMTcg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbGsvY2xrLWRldnJlcy5jIGIvZHJp
dmVycy9jbGsvY2xrLWRldnJlcy5jCmluZGV4IGY5ZDViNzMzNDM0MS4uZmI3NzYxODg4YjMwIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2Nsay9jbGstZGV2cmVzLmMKKysrIGIvZHJpdmVycy9jbGsvY2xr
LWRldnJlcy5jCkBAIC00LDM5ICs0LDcyIEBACiAjaW5jbHVkZSA8bGludXgvZXhwb3J0Lmg+CiAj
aW5jbHVkZSA8bGludXgvZ2ZwLmg+CiAKK3N0cnVjdCBkZXZtX2Nsa19zdGF0ZSB7CisJc3RydWN0
IGNsayAqY2xrOworCXZvaWQgKCpleGl0KShzdHJ1Y3QgY2xrICpjbGspOworfTsKKwogc3RhdGlj
IHZvaWQgZGV2bV9jbGtfcmVsZWFzZShzdHJ1Y3QgZGV2aWNlICpkZXYsIHZvaWQgKnJlcykKIHsK
LQljbGtfcHV0KCooc3RydWN0IGNsayAqKilyZXMpOworCXN0cnVjdCBkZXZtX2Nsa19zdGF0ZSAq
c3RhdGUgPSAqKHN0cnVjdCBkZXZtX2Nsa19zdGF0ZSAqKilyZXM7CisKKwlpZiAoc3RhdGUtPmV4
aXQpCisJCXN0YXRlLT5leGl0KHN0YXRlLT5jbGspOworCisJY2xrX3B1dChzdGF0ZS0+Y2xrKTsK
IH0KIAotc3RydWN0IGNsayAqZGV2bV9jbGtfZ2V0KHN0cnVjdCBkZXZpY2UgKmRldiwgY29uc3Qg
Y2hhciAqaWQpCitzdGF0aWMgc3RydWN0IGNsayAqX19kZXZtX2Nsa19nZXQoc3RydWN0IGRldmlj
ZSAqZGV2LCBjb25zdCBjaGFyICppZCwKKwkJCQkgIHN0cnVjdCBjbGsgKigqZ2V0KShzdHJ1Y3Qg
ZGV2aWNlICpkZXYsIGNvbnN0IGNoYXIgKmlkKSwKKwkJCQkgIGludCAoKmluaXQpKHN0cnVjdCBj
bGsgKmNsayksCisJCQkJICB2b2lkICgqZXhpdCkoc3RydWN0IGNsayAqY2xrKSkKIHsKLQlzdHJ1
Y3QgY2xrICoqcHRyLCAqY2xrOworCXN0cnVjdCBkZXZtX2Nsa19zdGF0ZSAqc3RhdGU7CisJc3Ry
dWN0IGNsayAqY2xrOworCWludCByZXQ7CiAKLQlwdHIgPSBkZXZyZXNfYWxsb2MoZGV2bV9jbGtf
cmVsZWFzZSwgc2l6ZW9mKCpwdHIpLCBHRlBfS0VSTkVMKTsKLQlpZiAoIXB0cikKKwlzdGF0ZSA9
IGRldnJlc19hbGxvYyhkZXZtX2Nsa19yZWxlYXNlLCBzaXplb2YoKnN0YXRlKSwgR0ZQX0tFUk5F
TCk7CisJaWYgKCFzdGF0ZSkKIAkJcmV0dXJuIEVSUl9QVFIoLUVOT01FTSk7CiAKLQljbGsgPSBj
bGtfZ2V0KGRldiwgaWQpOwotCWlmICghSVNfRVJSKGNsaykpIHsKLQkJKnB0ciA9IGNsazsKLQkJ
ZGV2cmVzX2FkZChkZXYsIHB0cik7Ci0JfSBlbHNlIHsKLQkJZGV2cmVzX2ZyZWUocHRyKTsKKwlj
bGsgPSBnZXQoZGV2LCBpZCk7CisJaWYgKElTX0VSUihjbGspKSB7CisJCXJldCA9IFBUUl9FUlIo
Y2xrKTsKKwkJZ290byBlcnJfY2xrX2dldDsKIAl9CiAKKwlpZiAoaW5pdCkgeworCQlyZXQgPSBp
bml0KGNsayk7CisJCWlmIChyZXQpCisJCQlnb3RvIGVycl9jbGtfaW5pdDsKKwl9CisKKwlzdGF0
ZS0+Y2xrID0gY2xrOworCXN0YXRlLT5leGl0ID0gZXhpdDsKKworCWRldnJlc19hZGQoZGV2LCBz
dGF0ZSk7CisKIAlyZXR1cm4gY2xrOworCitlcnJfY2xrX2luaXQ6CisKKwljbGtfcHV0KGNsayk7
CitlcnJfY2xrX2dldDoKKworCWRldnJlc19mcmVlKHN0YXRlKTsKKwlyZXR1cm4gRVJSX1BUUihy
ZXQpOwogfQotRVhQT1JUX1NZTUJPTChkZXZtX2Nsa19nZXQpOwogCi1zdHJ1Y3QgY2xrICpkZXZt
X2Nsa19nZXRfb3B0aW9uYWwoc3RydWN0IGRldmljZSAqZGV2LCBjb25zdCBjaGFyICppZCkKK3N0
cnVjdCBjbGsgKmRldm1fY2xrX2dldChzdHJ1Y3QgZGV2aWNlICpkZXYsIGNvbnN0IGNoYXIgKmlk
KQogewotCXN0cnVjdCBjbGsgKmNsayA9IGRldm1fY2xrX2dldChkZXYsIGlkKTsKKwlyZXR1cm4g
X19kZXZtX2Nsa19nZXQoZGV2LCBpZCwgY2xrX2dldCwgTlVMTCwgTlVMTCk7CiAKLQlpZiAoY2xr
ID09IEVSUl9QVFIoLUVOT0VOVCkpCi0JCXJldHVybiBOVUxMOworfQorRVhQT1JUX1NZTUJPTChk
ZXZtX2Nsa19nZXQpOwogCi0JcmV0dXJuIGNsazsKK3N0cnVjdCBjbGsgKmRldm1fY2xrX2dldF9v
cHRpb25hbChzdHJ1Y3QgZGV2aWNlICpkZXYsIGNvbnN0IGNoYXIgKmlkKQoreworCXJldHVybiBf
X2Rldm1fY2xrX2dldChkZXYsIGlkLCBjbGtfZ2V0X29wdGlvbmFsLCBOVUxMLCBOVUxMKTsKIH0K
IEVYUE9SVF9TWU1CT0woZGV2bV9jbGtfZ2V0X29wdGlvbmFsKTsKIAotLSAKMi4zNS4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBt
YWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRw
czovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1z
dG0zMgo=
