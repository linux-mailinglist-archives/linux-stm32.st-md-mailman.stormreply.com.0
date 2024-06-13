Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED8C906880
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Jun 2024 11:24:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C56A8C78011;
	Thu, 13 Jun 2024 09:24:29 +0000 (UTC)
Received: from out30-113.freemail.mail.aliyun.com
 (out30-113.freemail.mail.aliyun.com [115.124.30.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C838EC71290
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Jun 2024 09:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux.alibaba.com; s=default;
 t=1718270660; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
 bh=KbWX8Db8CbQXtBeXWc2CukpLYCDdNStf9N0SgO0PdS0=;
 b=KFeBY6C66rgRfcshfoD1qIC0xD18OCFhWQMpAMiLpD1rtbeBeOnn8L+4w6pXxEWYJM0AM2ut9kz55DJ9IqjXCa4mODPmGblXCIx1IJZcxME3/tlr9FcuwTBjZs3ceA0gVsAgKCC+4nmyxr3L4Obvyw2nuKRyzay6ZCnIDTwzd5I=
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R541e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=maildocker-contentspam033032014031;
 MF=baolin.wang@linux.alibaba.com; NM=1; PH=DS; RN=37; SR=0;
 TI=SMTPD_---0W8NgDjm_1718270656; 
Received: from 30.97.56.57(mailfrom:baolin.wang@linux.alibaba.com
 fp:SMTPD_---0W8NgDjm_1718270656) by smtp.aliyun-inc.com;
 Thu, 13 Jun 2024 17:24:18 +0800
Message-ID: <3b7950db-bde8-407e-b568-51cacee93ad8@linux.alibaba.com>
Date: Thu, 13 Jun 2024 17:24:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Trevor Gamblin <tgamblin@baylibre.com>,
 Lucas Stankus <lucas.p.stankus@gmail.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>,
 Dmitry Rokosov <ddrokosov@sberdevices.ru>,
 Cosmin Tanislav <cosmin.tanislav@analog.com>, Chen-Yu Tsai <wens@csie.org>,
 Hans de Goede <hdegoede@redhat.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Saravanan Sekar <sravanhome@gmail.com>, Orson Zhai <orsonzhai@gmail.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Linus Walleij <linus.walleij@linaro.org>,
 Jean-Baptiste Maneyrol <jmaneyrol@invensense.com>, Crt Mori <cmo@melexis.com>
References: <20240611165214.4091591-1-tgamblin@baylibre.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20240611165214.4091591-1-tgamblin@baylibre.com>
Cc: imx@lists.linux.dev, linux-iio@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 linux-amlogic@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [RESEND][PATCH] iio: simplify with
 regmap_set_bits(), regmap_clear_bits()
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

CgpPbiAyMDI0LzYvMTIgMDA6NTIsIFRyZXZvciBHYW1ibGluIHdyb3RlOgo+IFNpbXBsaWZ5IHRo
ZSB3YXkgcmVnbWFwIGlzIGFjY2Vzc2VkIGluIGlpbyBkcml2ZXJzLgo+IAo+IEluc3RlYWQgb2Yg
dXNpbmcgcmVnbWFwX3VwZGF0ZV9iaXRzKCkgYW5kIHBhc3NpbmcgdGhlIG1hc2sgdHdpY2UsIHVz
ZQo+IHJlZ21hcF9zZXRfYml0cygpLgo+IAo+IEluc3RlYWQgb2YgdXNpbmcgcmVnbWFwX3VwZGF0
ZV9iaXRzKCkgYW5kIHBhc3NpbmcgdmFsID0gMCwgdXNlCj4gcmVnbWFwX2NsZWFyX2JpdHMoKS4K
PiAKPiBTdWdnZXN0ZWQtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAYmF5
bGlicmUuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFRyZXZvciBHYW1ibGluIDx0Z2FtYmxpbkBiYXls
aWJyZS5jb20+Cj4gLS0tCgpbLi4uXQoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9paW8vYWRjL3Nj
Mjd4eF9hZGMuYyBiL2RyaXZlcnMvaWlvL2FkYy9zYzI3eHhfYWRjLmMKPiBpbmRleCBiNGEyZTA1
N2Q4MGYuLjI1MzVjMmMzZTYwYiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2lpby9hZGMvc2MyN3h4
X2FkYy5jCj4gKysrIGIvZHJpdmVycy9paW8vYWRjL3NjMjd4eF9hZGMuYwo+IEBAIC01MDgsMTMg
KzUwOCwxMyBAQCBzdGF0aWMgaW50IHNjMjd4eF9hZGNfcmVhZChzdHJ1Y3Qgc2MyN3h4X2FkY19k
YXRhICpkYXRhLCBpbnQgY2hhbm5lbCwKPiAgIAkJfQo+ICAgCX0KPiAgIAo+IC0JcmV0ID0gcmVn
bWFwX3VwZGF0ZV9iaXRzKGRhdGEtPnJlZ21hcCwgZGF0YS0+YmFzZSArIFNDMjdYWF9BRENfQ1RM
LAo+IC0JCQkJIFNDMjdYWF9BRENfRU4sIFNDMjdYWF9BRENfRU4pOwo+ICsJcmV0ID0gcmVnbWFw
X3NldF9iaXRzKGRhdGEtPnJlZ21hcCwgZGF0YS0+YmFzZSArIFNDMjdYWF9BRENfQ1RMLAo+ICsJ
CQkgICAgICBTQzI3WFhfQURDX0VOKTsKPiAgIAlpZiAocmV0KQo+ICAgCQlnb3RvIHJlZ3VsYXRv
cl9yZXN0b3JlOwo+ICAgCj4gLQlyZXQgPSByZWdtYXBfdXBkYXRlX2JpdHMoZGF0YS0+cmVnbWFw
LCBkYXRhLT5iYXNlICsgU0MyN1hYX0FEQ19JTlRfQ0xSLAo+IC0JCQkJIFNDMjdYWF9BRENfSVJR
X0NMUiwgU0MyN1hYX0FEQ19JUlFfQ0xSKTsKPiArCXJldCA9IHJlZ21hcF9zZXRfYml0cyhkYXRh
LT5yZWdtYXAsIGRhdGEtPmJhc2UgKyBTQzI3WFhfQURDX0lOVF9DTFIsCj4gKwkJCSAgICAgIFND
MjdYWF9BRENfSVJRX0NMUik7Cj4gICAJaWYgKHJldCkKPiAgIAkJZ290byBkaXNhYmxlX2FkYzsK
PiAgIAo+IEBAIC01MzcsOCArNTM3LDggQEAgc3RhdGljIGludCBzYzI3eHhfYWRjX3JlYWQoc3Ry
dWN0IHNjMjd4eF9hZGNfZGF0YSAqZGF0YSwgaW50IGNoYW5uZWwsCj4gICAJaWYgKHJldCkKPiAg
IAkJZ290byBkaXNhYmxlX2FkYzsKPiAgIAo+IC0JcmV0ID0gcmVnbWFwX3VwZGF0ZV9iaXRzKGRh
dGEtPnJlZ21hcCwgZGF0YS0+YmFzZSArIFNDMjdYWF9BRENfQ1RMLAo+IC0JCQkJIFNDMjdYWF9B
RENfQ0hOX1JVTiwgU0MyN1hYX0FEQ19DSE5fUlVOKTsKPiArCXJldCA9IHJlZ21hcF9zZXRfYml0
cyhkYXRhLT5yZWdtYXAsIGRhdGEtPmJhc2UgKyBTQzI3WFhfQURDX0NUTCwKPiArCQkJICAgICAg
U0MyN1hYX0FEQ19DSE5fUlVOKTsKPiAgIAlpZiAocmV0KQo+ICAgCQlnb3RvIGRpc2FibGVfYWRj
Owo+ICAgCj4gQEAgLTU1OSw4ICs1NTksOCBAQCBzdGF0aWMgaW50IHNjMjd4eF9hZGNfcmVhZChz
dHJ1Y3Qgc2MyN3h4X2FkY19kYXRhICpkYXRhLCBpbnQgY2hhbm5lbCwKPiAgIAl2YWx1ZSAmPSBT
QzI3WFhfQURDX0RBVEFfTUFTSzsKPiAgIAo+ICAgZGlzYWJsZV9hZGM6Cj4gLQlyZWdtYXBfdXBk
YXRlX2JpdHMoZGF0YS0+cmVnbWFwLCBkYXRhLT5iYXNlICsgU0MyN1hYX0FEQ19DVEwsCj4gLQkJ
CSAgIFNDMjdYWF9BRENfRU4sIDApOwo+ICsJcmVnbWFwX2NsZWFyX2JpdHMoZGF0YS0+cmVnbWFw
LCBkYXRhLT5iYXNlICsgU0MyN1hYX0FEQ19DVEwsCj4gKwkJCSAgU0MyN1hYX0FEQ19FTik7Cj4g
ICByZWd1bGF0b3JfcmVzdG9yZToKPiAgIAlpZiAoKGRhdGEtPnZhcl9kYXRhLT5zZXRfdm9scmVm
KSAmJiAoY2hhbm5lbCA9PSAzMCB8fCBjaGFubmVsID09IDMxKSkgewo+ICAgCQlyZXRfdm9scmVm
ID0gcmVndWxhdG9yX3NldF92b2x0YWdlKGRhdGEtPnZvbHJlZiwKPiBAQCAtNzY1LDE1ICs3NjUs
MTQgQEAgc3RhdGljIGludCBzYzI3eHhfYWRjX2VuYWJsZShzdHJ1Y3Qgc2MyN3h4X2FkY19kYXRh
ICpkYXRhKQo+ICAgewo+ICAgCWludCByZXQ7Cj4gICAKPiAtCXJldCA9IHJlZ21hcF91cGRhdGVf
Yml0cyhkYXRhLT5yZWdtYXAsIGRhdGEtPnZhcl9kYXRhLT5tb2R1bGVfZW4sCj4gLQkJCQkgU0My
N1hYX01PRFVMRV9BRENfRU4sIFNDMjdYWF9NT0RVTEVfQURDX0VOKTsKPiArCXJldCA9IHJlZ21h
cF9zZXRfYml0cyhkYXRhLT5yZWdtYXAsIGRhdGEtPnZhcl9kYXRhLT5tb2R1bGVfZW4sCj4gKwkJ
CSAgICAgIFNDMjdYWF9NT0RVTEVfQURDX0VOKTsKPiAgIAlpZiAocmV0KQo+ICAgCQlyZXR1cm4g
cmV0Owo+ICAgCj4gICAJLyogRW5hYmxlIEFEQyB3b3JrIGNsb2NrIGFuZCBjb250cm9sbGVyIGNs
b2NrICovCj4gLQlyZXQgPSByZWdtYXBfdXBkYXRlX2JpdHMoZGF0YS0+cmVnbWFwLCBkYXRhLT52
YXJfZGF0YS0+Y2xrX2VuLAo+IC0JCQkJIFNDMjdYWF9DTEtfQURDX0VOIHwgU0MyN1hYX0NMS19B
RENfQ0xLX0VOLAo+IC0JCQkJIFNDMjdYWF9DTEtfQURDX0VOIHwgU0MyN1hYX0NMS19BRENfQ0xL
X0VOKTsKPiArCXJldCA9IHJlZ21hcF9zZXRfYml0cyhkYXRhLT5yZWdtYXAsIGRhdGEtPnZhcl9k
YXRhLT5jbGtfZW4sCj4gKwkJCSAgICAgIFNDMjdYWF9DTEtfQURDX0VOIHwgU0MyN1hYX0NMS19B
RENfQ0xLX0VOKTsKPiAgIAlpZiAocmV0KQo+ICAgCQlnb3RvIGRpc2FibGVfYWRjOwo+ICAgCj4g
QEAgLTc4OSwxMSArNzg4LDExIEBAIHN0YXRpYyBpbnQgc2MyN3h4X2FkY19lbmFibGUoc3RydWN0
IHNjMjd4eF9hZGNfZGF0YSAqZGF0YSkKPiAgIAlyZXR1cm4gMDsKPiAgIAo+ICAgZGlzYWJsZV9j
bGs6Cj4gLQlyZWdtYXBfdXBkYXRlX2JpdHMoZGF0YS0+cmVnbWFwLCBkYXRhLT52YXJfZGF0YS0+
Y2xrX2VuLAo+IC0JCQkgICBTQzI3WFhfQ0xLX0FEQ19FTiB8IFNDMjdYWF9DTEtfQURDX0NMS19F
TiwgMCk7Cj4gKwlyZWdtYXBfY2xlYXJfYml0cyhkYXRhLT5yZWdtYXAsIGRhdGEtPnZhcl9kYXRh
LT5jbGtfZW4sCj4gKwkJCSAgU0MyN1hYX0NMS19BRENfRU4gfCBTQzI3WFhfQ0xLX0FEQ19DTEtf
RU4pOwo+ICAgZGlzYWJsZV9hZGM6Cj4gLQlyZWdtYXBfdXBkYXRlX2JpdHMoZGF0YS0+cmVnbWFw
LCBkYXRhLT52YXJfZGF0YS0+bW9kdWxlX2VuLAo+IC0JCQkgICBTQzI3WFhfTU9EVUxFX0FEQ19F
TiwgMCk7Cj4gKwlyZWdtYXBfY2xlYXJfYml0cyhkYXRhLT5yZWdtYXAsIGRhdGEtPnZhcl9kYXRh
LT5tb2R1bGVfZW4sCj4gKwkJCSAgU0MyN1hYX01PRFVMRV9BRENfRU4pOwo+ICAgCj4gICAJcmV0
dXJuIHJldDsKPiAgIH0KPiBAQCAtODAzLDExICs4MDIsMTEgQEAgc3RhdGljIHZvaWQgc2MyN3h4
X2FkY19kaXNhYmxlKHZvaWQgKl9kYXRhKQo+ICAgCXN0cnVjdCBzYzI3eHhfYWRjX2RhdGEgKmRh
dGEgPSBfZGF0YTsKPiAgIAo+ICAgCS8qIERpc2FibGUgQURDIHdvcmsgY2xvY2sgYW5kIGNvbnRy
b2xsZXIgY2xvY2sgKi8KPiAtCXJlZ21hcF91cGRhdGVfYml0cyhkYXRhLT5yZWdtYXAsIGRhdGEt
PnZhcl9kYXRhLT5jbGtfZW4sCj4gLQkJCSAgIFNDMjdYWF9DTEtfQURDX0VOIHwgU0MyN1hYX0NM
S19BRENfQ0xLX0VOLCAwKTsKPiArCXJlZ21hcF9jbGVhcl9iaXRzKGRhdGEtPnJlZ21hcCwgZGF0
YS0+dmFyX2RhdGEtPmNsa19lbiwKPiArCQkJICBTQzI3WFhfQ0xLX0FEQ19FTiB8IFNDMjdYWF9D
TEtfQURDX0NMS19FTik7Cj4gICAKPiAtCXJlZ21hcF91cGRhdGVfYml0cyhkYXRhLT5yZWdtYXAs
IGRhdGEtPnZhcl9kYXRhLT5tb2R1bGVfZW4sCj4gLQkJCSAgIFNDMjdYWF9NT0RVTEVfQURDX0VO
LCAwKTsKPiArCXJlZ21hcF9jbGVhcl9iaXRzKGRhdGEtPnJlZ21hcCwgZGF0YS0+dmFyX2RhdGEt
Pm1vZHVsZV9lbiwKPiArCQkJICBTQzI3WFhfTU9EVUxFX0FEQ19FTik7Cj4gICB9Cj4gICAKPiAg
IHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc2MyN3h4X2FkY192YXJpYW50X2RhdGEgc2MyNzMxX2RhdGEg
PSB7CgpGb3IgU1BSRCBzYzI3eHggcGFydHMsIGxvb2tzIGdvb2QgdG8gbWUuIFRoYW5rcy4KUmV2
aWV3ZWQtYnk6IEJhb2xpbiBXYW5nIDxiYW9saW4ud2FuZ0BsaW51eC5hbGliYWJhLmNvbT4KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIg
bWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0
cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgt
c3RtMzIK
