Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B17576176
	for <lists+linux-stm32@lfdr.de>; Fri, 15 Jul 2022 14:29:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 924FDC0D2BF;
	Fri, 15 Jul 2022 12:29:55 +0000 (UTC)
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com
 [148.163.135.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6594EC06F81
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Jul 2022 12:29:54 +0000 (UTC)
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
 by mx0a-00128a01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26FA9g56026919;
 Fri, 15 Jul 2022 08:28:49 -0400
Received: from nwd2mta3.analog.com ([137.71.173.56])
 by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3h9r37te2r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Jul 2022 08:28:49 -0400
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
 by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 26FCSmSJ061293
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL); 
 Fri, 15 Jul 2022 08:28:48 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Fri, 15 Jul
 2022 08:28:47 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Fri, 15 Jul 2022 08:28:47 -0400
Received: from nsa.ad.analog.com ([10.44.3.55])
 by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 26FCRxNv001007;
 Fri, 15 Jul 2022 08:28:37 -0400
From: =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
To: <openbmc@lists.ozlabs.org>, <linux-imx@nxp.com>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-iio@vger.kernel.org>, <linux-mips@vger.kernel.org>,
 <linux-renesas-soc@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <chrome-platform@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 <linux-arm-msm@vger.kernel.org>
Date: Fri, 15 Jul 2022 14:28:49 +0200
Message-ID: <20220715122903.332535-2-nuno.sa@analog.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220715122903.332535-1-nuno.sa@analog.com>
References: <20220715122903.332535-1-nuno.sa@analog.com>
MIME-Version: 1.0
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: OTQyimJKPNYz-qHOt6Uv29WNEi0X52Ee
X-Proofpoint-ORIG-GUID: OTQyimJKPNYz-qHOt6Uv29WNEi0X52Ee
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-15_04,2022-07-15_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 spamscore=0 mlxlogscore=945 mlxscore=0 adultscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207150054
Cc: Gwendal Grignou <gwendal@chromium.org>,
 Jishnu Prakash <quic_jprakash@quicinc.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Amit Kucheria <amitk@kernel.org>,
 Tali Perry <tali.perry1@gmail.com>, Paul Cercueil <paul@crapouillou.net>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Guenter Roeck <groeck@chromium.org>,
 Fabio Estevam <festevam@gmail.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Benjamin Fair <benjaminfair@google.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Haibo Chen <haibo.chen@nxp.com>,
 Christophe Branchereau <cbranchereau@gmail.com>, Nancy Yuen <yuenn@google.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Andy Gross <agross@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Saravanan Sekar <sravanhome@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Cai Huoqing <cai.huoqing@linux.dev>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Benson Leung <bleung@chromium.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Thara Gopinath <thara.gopinath@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Eugen Hristev <eugen.hristev@microchip.com>, Shawn Guo <shawnguo@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Jonathan Cameron <jic23@kernel.org>
Subject: [Linux-stm32] [PATCH v3 01/15] iio: inkern: only release the device
	node when done with it
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

J29mX25vZGVfcHV0KCknIGNhbiBwb3RlbnRpYWxseSByZWxlYXNlIHRoZSBtZW1vcnkgcG9pbnRl
ZCB0byBieQonaWlvc3BlYy5ucCcgd2hpY2ggd291bGQgbGVhdmUgdXMgd2l0aCBhbiBpbnZhbGlk
IHBvaW50ZXIgKGFuZCB3ZSB3b3VsZApzdGlsbCBwYXNzIGl0IGluICdvZl94bGF0ZSgpJykuIE5v
dGUgdGhhdCBpdCBpcyBub3QgZ3VhcmFudGVlZCBmb3IgdGhlCm9mX25vZGUgbGlmZXNwYW4gdG8g
YmUgYXR0YWNoZWQgdG8gdGhlIGRldmljZSAodG8gd2hpY2ggaXMgYXR0YWNoZWQpCmxpZmVzcGFu
IHNvIHRoYXQgdGhlcmUgaXMgKGV2ZW4gdGhvdWdoIHZlcnkgdW5saWtlbHkpIHRoZSBwb3NzaWJp
bGl0eQpmb3IgdGhlIG5vZGUgdG8gYmUgZnJlZWQgd2hpbGUgdGhlIGRldmljZSBpcyBzdGlsbCBh
cm91bmQuIFRodXMsIGFzIHRoZXJlCmFyZSBpbmRlZWQgc29tZSBvZl94bGF0ZSB1c2VycyB3aGlj
aCBkbyBhY2Nlc3MgdGhlIG5vZGUsIGEgcmFjZSBpcyBpbmRlZWQKcG9zc2libGUuCgpBcyBzdWNo
LCB3ZSBjYW4gb25seSByZWxlYXNlIHRoZSBub2RlIGFmdGVyIHdlIGFyZSBkb25lIHdpdGggaXQu
CgpGaXhlczogMTdkODJiNDdhMjE1ZCAoImlpbzogQWRkIE9GIHN1cHBvcnQiKQpTaWduZWQtb2Zm
LWJ5OiBOdW5vIFPDoSA8bnVuby5zYUBhbmFsb2cuY29tPgotLS0KIGRyaXZlcnMvaWlvL2lua2Vy
bi5jIHwgNiArKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9paW8vaW5rZXJuLmMgYi9kcml2ZXJzL2lpby9p
bmtlcm4uYwppbmRleCBkZjc0NzY1ZDMzZGMuLjlkODcwNTc3OTRmYyAxMDA2NDQKLS0tIGEvZHJp
dmVycy9paW8vaW5rZXJuLmMKKysrIGIvZHJpdmVycy9paW8vaW5rZXJuLmMKQEAgLTE2NSw5ICsx
NjUsMTAgQEAgc3RhdGljIGludCBfX29mX2lpb19jaGFubmVsX2dldChzdHJ1Y3QgaWlvX2NoYW5u
ZWwgKmNoYW5uZWwsCiAKIAlpZGV2ID0gYnVzX2ZpbmRfZGV2aWNlKCZpaW9fYnVzX3R5cGUsIE5V
TEwsIGlpb3NwZWMubnAsCiAJCQkgICAgICAgaWlvX2Rldl9ub2RlX21hdGNoKTsKLQlvZl9ub2Rl
X3B1dChpaW9zcGVjLm5wKTsKLQlpZiAoaWRldiA9PSBOVUxMKQorCWlmIChpZGV2ID09IE5VTEwp
IHsKKwkJb2Zfbm9kZV9wdXQoaWlvc3BlYy5ucCk7CiAJCXJldHVybiAtRVBST0JFX0RFRkVSOwor
CX0KIAogCWluZGlvX2RldiA9IGRldl90b19paW9fZGV2KGlkZXYpOwogCWNoYW5uZWwtPmluZGlv
X2RldiA9IGluZGlvX2RldjsKQEAgLTE3NSw2ICsxNzYsNyBAQCBzdGF0aWMgaW50IF9fb2ZfaWlv
X2NoYW5uZWxfZ2V0KHN0cnVjdCBpaW9fY2hhbm5lbCAqY2hhbm5lbCwKIAkJaW5kZXggPSBpbmRp
b19kZXYtPmluZm8tPm9mX3hsYXRlKGluZGlvX2RldiwgJmlpb3NwZWMpOwogCWVsc2UKIAkJaW5k
ZXggPSBfX29mX2lpb19zaW1wbGVfeGxhdGUoaW5kaW9fZGV2LCAmaWlvc3BlYyk7CisJb2Zfbm9k
ZV9wdXQoaWlvc3BlYy5ucCk7CiAJaWYgKGluZGV4IDwgMCkKIAkJZ290byBlcnJfcHV0OwogCWNo
YW5uZWwtPmNoYW5uZWwgPSAmaW5kaW9fZGV2LT5jaGFubmVsc1tpbmRleF07Ci0tIAoyLjM3LjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0
bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
Cmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXN0bTMyCg==
