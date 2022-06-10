Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA7A546009
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Jun 2022 10:49:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A3977C6046D;
	Fri, 10 Jun 2022 08:49:20 +0000 (UTC)
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com
 [148.163.135.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 732AEC60465
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jun 2022 08:49:19 +0000 (UTC)
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
 by mx0a-00128a01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25A7SjCg005350;
 Fri, 10 Jun 2022 04:48:35 -0400
Received: from nwd2mta4.analog.com ([137.71.173.58])
 by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3ghq33kqbx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Jun 2022 04:48:35 -0400
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
 by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 25A8mTCk027565
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL); 
 Fri, 10 Jun 2022 04:48:29 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Fri, 10 Jun
 2022 04:48:28 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Fri, 10 Jun 2022 04:48:27 -0400
Received: from nsa.ad.analog.com ([10.44.3.70])
 by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 25A8imim014275;
 Fri, 10 Jun 2022 04:48:18 -0400
From: =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
To: <linux-imx@nxp.com>, <linux-renesas-soc@vger.kernel.org>,
 <linux-mips@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <chrome-platform@lists.linux.dev>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 <linux-mediatek@lists.infradead.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-msm@vger.kernel.org>, <linux-iio@vger.kernel.org>,
 <openbmc@lists.ozlabs.org>
Date: Fri, 10 Jun 2022 10:45:37 +0200
Message-ID: <20220610084545.547700-27-nuno.sa@analog.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220610084545.547700-1-nuno.sa@analog.com>
References: <20220610084545.547700-1-nuno.sa@analog.com>
MIME-Version: 1.0
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: WnzJHPBqQBQi6JveWm3Q_eHoFSEHuh2-
X-Proofpoint-GUID: WnzJHPBqQBQi6JveWm3Q_eHoFSEHuh2-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-10_02,2022-06-09_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 mlxlogscore=848 phishscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 spamscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206100032
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Tomer Maimon <tmaimon77@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Amit Kucheria <amitk@kernel.org>,
 Tali Perry <tali.perry1@gmail.com>, Paul Cercueil <paul@crapouillou.net>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Guenter Roeck <groeck@chromium.org>,
 Fabio Estevam <festevam@gmail.com>, Lars-Peter Clausen <lars@metafoo.de>,
 Benjamin Fair <benjaminfair@google.com>,
 Jishnu Prakash <quic_jprakash@quicinc.com>, Haibo Chen <haibo.chen@nxp.com>,
 Nancy Yuen <yuenn@google.com>, Andy Shevchenko <andy.shevchenko@gmail.com>,
 Andy Gross <agross@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Christophe Branchereau <cbranchereau@gmail.com>,
 Saravanan Sekar <sravanhome@gmail.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Cai Huoqing <cai.huoqing@linux.dev>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Gwendal Grignou <gwendal@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Benson Leung <bleung@chromium.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Thara Gopinath <thara.gopinath@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Eugen Hristev <eugen.hristev@microchip.com>, Shawn Guo <shawnguo@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Jonathan Cameron <jic23@kernel.org>
Subject: [Linux-stm32] [PATCH 26/34] iio: adc: ingenic-adc: convert to IIO
	fwnode interface
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

TW92ZSBmcm9tICdvZl94bGF0ZSgpJyB0byAnZndub2RlX3hsYXRlKCknLiBUaGUgZW5kIGdvYWwg
aXMgdG8gY29tcGxldGVseQpkcm9wIE9GIGZyb20gdGhlIElJTyBpbmtlcm5lbCBpbnRlcmZhY2Uu
CgpTaWduZWQtb2ZmLWJ5OiBOdW5vIFPDoSA8bnVuby5zYUBhbmFsb2cuY29tPgotLS0KIGRyaXZl
cnMvaWlvL2FkYy9pbmdlbmljLWFkYy5jIHwgOSArKysrLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9paW8v
YWRjL2luZ2VuaWMtYWRjLmMgYi9kcml2ZXJzL2lpby9hZGMvaW5nZW5pYy1hZGMuYwppbmRleCBl
NzMxYmE0N2FkZDIuLmRjYzZiYzI5ZGNhMCAxMDA2NDQKLS0tIGEvZHJpdmVycy9paW8vYWRjL2lu
Z2VuaWMtYWRjLmMKKysrIGIvZHJpdmVycy9paW8vYWRjL2luZ2VuaWMtYWRjLmMKQEAgLTE5LDcg
KzE5LDYgQEAKICNpbmNsdWRlIDxsaW51eC9tdXRleC5oPgogI2luY2x1ZGUgPGxpbnV4L3BsYXRm
b3JtX2RldmljZS5oPgogI2luY2x1ZGUgPGxpbnV4L3Byb3BlcnR5Lmg+Ci0jaW5jbHVkZSA8bGlu
dXgvb2YuaD4KIAogI2RlZmluZSBKWl9BRENfUkVHX0VOQUJMRQkJMHgwMAogI2RlZmluZSBKWl9B
RENfUkVHX0NGRwkJCTB4MDQKQEAgLTcxOSwxMiArNzE4LDEyIEBAIHN0YXRpYyBpbnQgaW5nZW5p
Y19hZGNfcmVhZF9yYXcoc3RydWN0IGlpb19kZXYgKmlpb19kZXYsCiAJfQogfQogCi1zdGF0aWMg
aW50IGluZ2VuaWNfYWRjX29mX3hsYXRlKHN0cnVjdCBpaW9fZGV2ICppaW9fZGV2LAotCQkJCWNv
bnN0IHN0cnVjdCBvZl9waGFuZGxlX2FyZ3MgKmlpb3NwZWMpCitzdGF0aWMgaW50IGluZ2VuaWNf
YWRjX2Z3bm9kZV94bGF0ZShzdHJ1Y3QgaWlvX2RldiAqaWlvX2RldiwKKwkJCQkgICAgY29uc3Qg
c3RydWN0IGZ3bm9kZV9yZWZlcmVuY2VfYXJncyAqaWlvc3BlYykKIHsKIAlpbnQgaTsKIAotCWlm
ICghaWlvc3BlYy0+YXJnc19jb3VudCkKKwlpZiAoIWlpb3NwZWMtPm5hcmdzKQogCQlyZXR1cm4g
LUVJTlZBTDsKIAogCWZvciAoaSA9IDA7IGkgPCBpaW9fZGV2LT5udW1fY2hhbm5lbHM7ICsraSkK
QEAgLTc0Myw3ICs3NDIsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGlpb19pbmZvIGluZ2VuaWNf
YWRjX2luZm8gPSB7CiAJLndyaXRlX3JhdyA9IGluZ2VuaWNfYWRjX3dyaXRlX3JhdywKIAkucmVh
ZF9yYXcgPSBpbmdlbmljX2FkY19yZWFkX3JhdywKIAkucmVhZF9hdmFpbCA9IGluZ2VuaWNfYWRj
X3JlYWRfYXZhaWwsCi0JLm9mX3hsYXRlID0gaW5nZW5pY19hZGNfb2ZfeGxhdGUsCisJLmZ3bm9k
ZV94bGF0ZSA9IGluZ2VuaWNfYWRjX2Z3bm9kZV94bGF0ZSwKIH07CiAKIHN0YXRpYyBpbnQgaW5n
ZW5pY19hZGNfYnVmZmVyX2VuYWJsZShzdHJ1Y3QgaWlvX2RldiAqaWlvX2RldikKLS0gCjIuMzYu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
c3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8v
bGludXgtc3RtMzIK
