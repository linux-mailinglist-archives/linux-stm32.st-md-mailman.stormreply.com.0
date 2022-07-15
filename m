Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8AB57618F
	for <lists+linux-stm32@lfdr.de>; Fri, 15 Jul 2022 14:30:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 22BE8C640EF;
	Fri, 15 Jul 2022 12:30:19 +0000 (UTC)
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com
 [148.163.135.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 56D22C0D2BF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Jul 2022 12:30:17 +0000 (UTC)
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
 by mx0a-00128a01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26F9mecq026940;
 Fri, 15 Jul 2022 08:29:31 -0400
Received: from nwd2mta4.analog.com ([137.71.173.58])
 by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3h9r37te69-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Jul 2022 08:29:30 -0400
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
 by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 26FCTT32062172
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL); 
 Fri, 15 Jul 2022 08:29:29 -0400
Received: from ASHBCASHYB5.ad.analog.com (10.64.17.133) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Fri, 15 Jul 2022 08:29:28 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by
 ASHBCASHYB5.ad.analog.com (10.64.17.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Fri, 15 Jul 2022 08:29:28 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Fri, 15 Jul 2022 08:29:28 -0400
Received: from nsa.ad.analog.com ([10.44.3.55])
 by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 26FCRxO3001007;
 Fri, 15 Jul 2022 08:29:17 -0400
From: =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
To: <openbmc@lists.ozlabs.org>, <linux-imx@nxp.com>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-iio@vger.kernel.org>, <linux-mips@vger.kernel.org>,
 <linux-renesas-soc@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <chrome-platform@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 <linux-arm-msm@vger.kernel.org>
Date: Fri, 15 Jul 2022 14:28:55 +0200
Message-ID: <20220715122903.332535-8-nuno.sa@analog.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220715122903.332535-1-nuno.sa@analog.com>
References: <20220715122903.332535-1-nuno.sa@analog.com>
MIME-Version: 1.0
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: EoPjepIWgHMlVxV3zLkPYDGCOvsE-6QA
X-Proofpoint-ORIG-GUID: EoPjepIWgHMlVxV3zLkPYDGCOvsE-6QA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-15_04,2022-07-15_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 spamscore=0 mlxlogscore=918 mlxscore=0 adultscore=0 suspectscore=0
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
 Daniel Lezcano <daniel.lezcano@linaro.org>, Haibo
 Chen <haibo.chen@nxp.com>, Christophe Branchereau <cbranchereau@gmail.com>,
 Nancy Yuen <yuenn@google.com>, Andy
 Shevchenko <andy.shevchenko@gmail.com>, Andy Gross <agross@kernel.org>,
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
Subject: [Linux-stm32] [PATCH v3 07/15] iio: adc: ingenic-adc: convert to
	IIO fwnode interface
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
CgpTaWduZWQtb2ZmLWJ5OiBOdW5vIFPDoSA8bnVuby5zYUBhbmFsb2cuY29tPgpSZXZpZXdlZC1i
eTogQW5keSBTaGV2Y2hlbmtvIDxhbmR5LnNoZXZjaGVua29AZ21haWwuY29tPgotLS0KIGRyaXZl
cnMvaWlvL2FkYy9pbmdlbmljLWFkYy5jIHwgOCArKysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDQg
aW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2lpby9h
ZGMvaW5nZW5pYy1hZGMuYyBiL2RyaXZlcnMvaWlvL2FkYy9pbmdlbmljLWFkYy5jCmluZGV4IGJm
NWMwM2MzNGY4NC4uOWUwOGYzYWJlZWE2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2lpby9hZGMvaW5n
ZW5pYy1hZGMuYworKysgYi9kcml2ZXJzL2lpby9hZGMvaW5nZW5pYy1hZGMuYwpAQCAtNzE5LDEy
ICs3MTksMTIgQEAgc3RhdGljIGludCBpbmdlbmljX2FkY19yZWFkX3JhdyhzdHJ1Y3QgaWlvX2Rl
diAqaWlvX2RldiwKIAl9CiB9CiAKLXN0YXRpYyBpbnQgaW5nZW5pY19hZGNfb2ZfeGxhdGUoc3Ry
dWN0IGlpb19kZXYgKmlpb19kZXYsCi0JCQkJY29uc3Qgc3RydWN0IG9mX3BoYW5kbGVfYXJncyAq
aWlvc3BlYykKK3N0YXRpYyBpbnQgaW5nZW5pY19hZGNfZndub2RlX3hsYXRlKHN0cnVjdCBpaW9f
ZGV2ICppaW9fZGV2LAorCQkJCSAgICBjb25zdCBzdHJ1Y3QgZndub2RlX3JlZmVyZW5jZV9hcmdz
ICppaW9zcGVjKQogewogCWludCBpOwogCi0JaWYgKCFpaW9zcGVjLT5hcmdzX2NvdW50KQorCWlm
ICghaWlvc3BlYy0+bmFyZ3MpCiAJCXJldHVybiAtRUlOVkFMOwogCiAJZm9yIChpID0gMDsgaSA8
IGlpb19kZXYtPm51bV9jaGFubmVsczsgKytpKQpAQCAtNzQzLDcgKzc0Myw3IEBAIHN0YXRpYyBj
b25zdCBzdHJ1Y3QgaWlvX2luZm8gaW5nZW5pY19hZGNfaW5mbyA9IHsKIAkud3JpdGVfcmF3ID0g
aW5nZW5pY19hZGNfd3JpdGVfcmF3LAogCS5yZWFkX3JhdyA9IGluZ2VuaWNfYWRjX3JlYWRfcmF3
LAogCS5yZWFkX2F2YWlsID0gaW5nZW5pY19hZGNfcmVhZF9hdmFpbCwKLQkub2ZfeGxhdGUgPSBp
bmdlbmljX2FkY19vZl94bGF0ZSwKKwkuZndub2RlX3hsYXRlID0gaW5nZW5pY19hZGNfZndub2Rl
X3hsYXRlLAogfTsKIAogc3RhdGljIGludCBpbmdlbmljX2FkY19idWZmZXJfZW5hYmxlKHN0cnVj
dCBpaW9fZGV2ICppaW9fZGV2KQotLSAKMi4zNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3Rt
MzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
