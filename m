Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F5657619A
	for <lists+linux-stm32@lfdr.de>; Fri, 15 Jul 2022 14:30:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4957AC640F1;
	Fri, 15 Jul 2022 12:30:39 +0000 (UTC)
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com
 [148.163.135.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8A1E8C640EF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Jul 2022 12:30:38 +0000 (UTC)
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
 by mx0a-00128a01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26FAnJfv026918;
 Fri, 15 Jul 2022 08:29:52 -0400
Received: from nwd2mta3.analog.com ([137.71.173.56])
 by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3h9r37te7t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Jul 2022 08:29:51 -0400
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
 by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 26FCToJs061373
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL); 
 Fri, 15 Jul 2022 08:29:50 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Fri, 15 Jul
 2022 08:29:49 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Fri, 15 Jul 2022 08:29:49 -0400
Received: from nsa.ad.analog.com ([10.44.3.55])
 by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 26FCRxO6001007;
 Fri, 15 Jul 2022 08:29:40 -0400
From: =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
To: <openbmc@lists.ozlabs.org>, <linux-imx@nxp.com>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-iio@vger.kernel.org>, <linux-mips@vger.kernel.org>,
 <linux-renesas-soc@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <chrome-platform@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 <linux-arm-msm@vger.kernel.org>
Date: Fri, 15 Jul 2022 14:28:58 +0200
Message-ID: <20220715122903.332535-11-nuno.sa@analog.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220715122903.332535-1-nuno.sa@analog.com>
References: <20220715122903.332535-1-nuno.sa@analog.com>
MIME-Version: 1.0
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: bHQe4IGuGUggCaW8AX5gdha6-7dwv5qk
X-Proofpoint-ORIG-GUID: bHQe4IGuGUggCaW8AX5gdha6-7dwv5qk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-15_04,2022-07-15_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 spamscore=0 mlxlogscore=999 mlxscore=0 adultscore=0 suspectscore=0
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
Subject: [Linux-stm32] [PATCH v3 10/15] iio: adc: qcom-pm8xxx-xoadc: convert
	to device properties
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

TWFrZSB0aGUgY29udmVyc2lvbiB0byBmaXJtd2FyZSBhZ25vc3RpYyBkZXZpY2UgcHJvcGVydGll
cy4gQXMgcGFydCBvZgp0aGUgY29udmVyc2lvbiB0aGUgSUlPIGlua2VybiBpbnRlcmZhY2UgJ29m
X3hsYXRlKCknIGlzIGFsc28gY29udmVydGVkIHRvCidmd25vZGVfeGxhdGUoKScuIFRoZSBnb2Fs
IGlzIHRvIGNvbXBsZXRlbHkgZHJvcCAnb2ZfeGxhdGUnIGFuZCBoZW5jZSBPRgpkZXBlbmRlbmNp
ZXMgZnJvbSBJSU8uCgpTaWduZWQtb2ZmLWJ5OiBOdW5vIFPDoSA8bnVuby5zYUBhbmFsb2cuY29t
PgpBY2tlZC1ieTogTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPgpSZXZp
ZXdlZC1ieTogQW5keSBTaGV2Y2hlbmtvIDxhbmR5LnNoZXZjaGVua29AZ21haWwuY29tPgotLS0K
IGRyaXZlcnMvaWlvL2FkYy9xY29tLXBtOHh4eC14b2FkYy5jIHwgNTggKysrKysrKysrKysrKyst
LS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyOCBpbnNlcnRpb25zKCspLCAzMCBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2lpby9hZGMvcWNvbS1wbTh4eHgteG9hZGMu
YyBiL2RyaXZlcnMvaWlvL2FkYy9xY29tLXBtOHh4eC14b2FkYy5jCmluZGV4IDVlOWU1NjgyMTA3
NS4uZWI0MjQ0OTZlZTFkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2lpby9hZGMvcWNvbS1wbTh4eHgt
eG9hZGMuYworKysgYi9kcml2ZXJzL2lpby9hZGMvcWNvbS1wbTh4eHgteG9hZGMuYwpAQCAtMTQs
OSArMTQsOSBAQAogI2luY2x1ZGUgPGxpbnV4L2lpby9paW8uaD4KICNpbmNsdWRlIDxsaW51eC9p
aW8vc3lzZnMuaD4KICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4KLSNpbmNsdWRlIDxsaW51eC9v
Zi5oPgotI2luY2x1ZGUgPGxpbnV4L29mX2RldmljZS5oPgorI2luY2x1ZGUgPGxpbnV4L21vZF9k
ZXZpY2V0YWJsZS5oPgogI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPgorI2luY2x1
ZGUgPGxpbnV4L3Byb3BlcnR5Lmg+CiAjaW5jbHVkZSA8bGludXgvcmVnbWFwLmg+CiAjaW5jbHVk
ZSA8bGludXgvaW5pdC5oPgogI2luY2x1ZGUgPGxpbnV4L2ludGVycnVwdC5oPgpAQCAtNjk0LDgg
KzY5NCw4IEBAIHN0YXRpYyBpbnQgcG04eHh4X3JlYWRfcmF3KHN0cnVjdCBpaW9fZGV2ICppbmRp
b19kZXYsCiAJfQogfQogCi1zdGF0aWMgaW50IHBtOHh4eF9vZl94bGF0ZShzdHJ1Y3QgaWlvX2Rl
diAqaW5kaW9fZGV2LAotCQkJICAgY29uc3Qgc3RydWN0IG9mX3BoYW5kbGVfYXJncyAqaWlvc3Bl
YykKK3N0YXRpYyBpbnQgcG04eHh4X2Z3bm9kZV94bGF0ZShzdHJ1Y3QgaWlvX2RldiAqaW5kaW9f
ZGV2LAorCQkJICAgICAgIGNvbnN0IHN0cnVjdCBmd25vZGVfcmVmZXJlbmNlX2FyZ3MgKmlpb3Nw
ZWMpCiB7CiAJc3RydWN0IHBtOHh4eF94b2FkYyAqYWRjID0gaWlvX3ByaXYoaW5kaW9fZGV2KTsK
IAl1OCBwcmVfc2NhbGVfbXV4OwpAQCAtNzA2LDEwICs3MDYsMTAgQEAgc3RhdGljIGludCBwbTh4
eHhfb2ZfeGxhdGUoc3RydWN0IGlpb19kZXYgKmluZGlvX2RldiwKIAkgKiBGaXJzdCBjZWxsIGlz
IHByZXNjYWxlciBvciBwcmVtdXgsIHNlY29uZCBjZWxsIGlzIGFuYWxvZwogCSAqIG11eC4KIAkg
Ki8KLQlpZiAoaWlvc3BlYy0+YXJnc19jb3VudCAhPSAyKSB7Ci0JCWRldl9lcnIoJmluZGlvX2Rl
di0+ZGV2LCAid3JvbmcgbnVtYmVyIG9mIGFyZ3VtZW50cyBmb3IgJXBPRm4gbmVlZCAyIGdvdCAl
ZFxuIiwKLQkJCWlpb3NwZWMtPm5wLAotCQkJaWlvc3BlYy0+YXJnc19jb3VudCk7CisJaWYgKGlp
b3NwZWMtPm5hcmdzICE9IDIpIHsKKwkJZGV2X2VycigmaW5kaW9fZGV2LT5kZXYsICJ3cm9uZyBu
dW1iZXIgb2YgYXJndW1lbnRzIGZvciAlcGZ3UCBuZWVkIDIgZ290ICVkXG4iLAorCQkJaWlvc3Bl
Yy0+Zndub2RlLAorCQkJaWlvc3BlYy0+bmFyZ3MpOwogCQlyZXR1cm4gLUVJTlZBTDsKIAl9CiAJ
cHJlX3NjYWxlX211eCA9ICh1OClpaW9zcGVjLT5hcmdzWzBdOwpAQCAtNzI3LDM0ICs3MjcsMzQg
QEAgc3RhdGljIGludCBwbTh4eHhfb2ZfeGxhdGUoc3RydWN0IGlpb19kZXYgKmluZGlvX2RldiwK
IH0KIAogc3RhdGljIGNvbnN0IHN0cnVjdCBpaW9faW5mbyBwbTh4eHhfeG9hZGNfaW5mbyA9IHsK
LQkub2ZfeGxhdGUgPSBwbTh4eHhfb2ZfeGxhdGUsCisJLmZ3bm9kZV94bGF0ZSA9IHBtOHh4eF9m
d25vZGVfeGxhdGUsCiAJLnJlYWRfcmF3ID0gcG04eHh4X3JlYWRfcmF3LAogfTsKIAogc3RhdGlj
IGludCBwbTh4eHhfeG9hZGNfcGFyc2VfY2hhbm5lbChzdHJ1Y3QgZGV2aWNlICpkZXYsCi0JCQkJ
ICAgICAgc3RydWN0IGRldmljZV9ub2RlICpucCwKKwkJCQkgICAgICBzdHJ1Y3QgZndub2RlX2hh
bmRsZSAqZndub2RlLAogCQkJCSAgICAgIGNvbnN0IHN0cnVjdCB4b2FkY19jaGFubmVsICpod19j
aGFubmVscywKIAkJCQkgICAgICBzdHJ1Y3QgaWlvX2NoYW5fc3BlYyAqaWlvX2NoYW4sCiAJCQkJ
ICAgICAgc3RydWN0IHBtOHh4eF9jaGFuX2luZm8gKmNoKQogewotCWNvbnN0IGNoYXIgKm5hbWUg
PSBucC0+bmFtZTsKKwljb25zdCBjaGFyICpuYW1lID0gZndub2RlX2dldF9uYW1lKGZ3bm9kZSk7
CiAJY29uc3Qgc3RydWN0IHhvYWRjX2NoYW5uZWwgKmh3Y2hhbjsKLQl1MzIgcHJlX3NjYWxlX211
eCwgYW11eF9jaGFubmVsOworCXUzMiBwcmVfc2NhbGVfbXV4LCBhbXV4X2NoYW5uZWwsIHJlZ1sy
XTsKIAl1MzIgcnN2LCBkZWM7CiAJaW50IHJldDsKIAlpbnQgY2hpZDsKIAotCXJldCA9IG9mX3By
b3BlcnR5X3JlYWRfdTMyX2luZGV4KG5wLCAicmVnIiwgMCwgJnByZV9zY2FsZV9tdXgpOworCXJl
dCA9IGZ3bm9kZV9wcm9wZXJ0eV9yZWFkX3UzMl9hcnJheShmd25vZGUsICJyZWciLCByZWcsCisJ
CQkJCSAgICAgQVJSQVlfU0laRShyZWcpKTsKIAlpZiAocmV0KSB7Ci0JCWRldl9lcnIoZGV2LCAi
aW52YWxpZCBwcmUgc2NhbGUvbXV4IG51bWJlciAlc1xuIiwgbmFtZSk7Ci0JCXJldHVybiByZXQ7
Ci0JfQotCXJldCA9IG9mX3Byb3BlcnR5X3JlYWRfdTMyX2luZGV4KG5wLCAicmVnIiwgMSwgJmFt
dXhfY2hhbm5lbCk7Ci0JaWYgKHJldCkgewotCQlkZXZfZXJyKGRldiwgImludmFsaWQgYW11eCBj
aGFubmVsIG51bWJlciAlc1xuIiwgbmFtZSk7CisJCWRldl9lcnIoZGV2LCAiaW52YWxpZCBwcmUg
c2NhbGUvbXV4IG9yIGFtdXggY2hhbm5lbCBudW1iZXIgJXNcbiIsCisJCQluYW1lKTsKIAkJcmV0
dXJuIHJldDsKIAl9CiAKKwlwcmVfc2NhbGVfbXV4ID0gcmVnWzBdOworCWFtdXhfY2hhbm5lbCA9
IHJlZ1sxXTsKKwogCS8qIEZpbmQgdGhlIHJpZ2h0IGNoYW5uZWwgc2V0dGluZyAqLwogCWNoaWQg
PSAwOwogCWh3Y2hhbiA9ICZod19jaGFubmVsc1swXTsKQEAgLTc3OCw3ICs3NzgsNyBAQCBzdGF0
aWMgaW50IHBtOHh4eF94b2FkY19wYXJzZV9jaGFubmVsKHN0cnVjdCBkZXZpY2UgKmRldiwKIAkv
KiBFdmVyeW9uZSBzZWVtcyB0byB1c2UgZGVmYXVsdCAoInR5cGUgMiIpIGRlY2ltYXRpb24gKi8K
IAljaC0+ZGVjaW1hdGlvbiA9IFZBRENfREVGX0RFQ0lNQVRJT047CiAKLQlpZiAoIW9mX3Byb3Bl
cnR5X3JlYWRfdTMyKG5wLCAicWNvbSxyYXRpb21ldHJpYyIsICZyc3YpKSB7CisJaWYgKCFmd25v
ZGVfcHJvcGVydHlfcmVhZF91MzIoZndub2RlLCAicWNvbSxyYXRpb21ldHJpYyIsICZyc3YpKSB7
CiAJCWNoLT5jYWxpYnJhdGlvbiA9IFZBRENfQ0FMSUJfUkFUSU9NRVRSSUM7CiAJCWlmIChyc3Yg
PiBYT0FEQ19SU1ZfTUFYKSB7CiAJCQlkZXZfZXJyKGRldiwgIiVzIHRvbyBsYXJnZSBSU1YgdmFs
dWUgJWRcbiIsIG5hbWUsIHJzdik7CkBAIC03OTEsNyArNzkxLDcgQEAgc3RhdGljIGludCBwbTh4
eHhfeG9hZGNfcGFyc2VfY2hhbm5lbChzdHJ1Y3QgZGV2aWNlICpkZXYsCiAJfQogCiAJLyogT3B0
aW9uYWwgZGVjaW1hdGlvbiwgaWYgb21pdHRlZCB3ZSB1c2UgdGhlIGRlZmF1bHQgKi8KLQlyZXQg
PSBvZl9wcm9wZXJ0eV9yZWFkX3UzMihucCwgInFjb20sZGVjaW1hdGlvbiIsICZkZWMpOworCXJl
dCA9IGZ3bm9kZV9wcm9wZXJ0eV9yZWFkX3UzMihmd25vZGUsICJxY29tLGRlY2ltYXRpb24iLCAm
ZGVjKTsKIAlpZiAoIXJldCkgewogCQlyZXQgPSBxY29tX3ZhZGNfZGVjaW1hdGlvbl9mcm9tX2R0
KGRlYyk7CiAJCWlmIChyZXQgPCAwKSB7CkBAIC04MjAsMTUgKzgyMCwxNCBAQCBzdGF0aWMgaW50
IHBtOHh4eF94b2FkY19wYXJzZV9jaGFubmVsKHN0cnVjdCBkZXZpY2UgKmRldiwKIAlyZXR1cm4g
MDsKIH0KIAotc3RhdGljIGludCBwbTh4eHhfeG9hZGNfcGFyc2VfY2hhbm5lbHMoc3RydWN0IHBt
OHh4eF94b2FkYyAqYWRjLAotCQkJCSAgICAgICBzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wKQorc3Rh
dGljIGludCBwbTh4eHhfeG9hZGNfcGFyc2VfY2hhbm5lbHMoc3RydWN0IHBtOHh4eF94b2FkYyAq
YWRjKQogewotCXN0cnVjdCBkZXZpY2Vfbm9kZSAqY2hpbGQ7CisJc3RydWN0IGZ3bm9kZV9oYW5k
bGUgKmNoaWxkOwogCXN0cnVjdCBwbTh4eHhfY2hhbl9pbmZvICpjaDsKIAlpbnQgcmV0OwogCWlu
dCBpOwogCi0JYWRjLT5uY2hhbnMgPSBvZl9nZXRfYXZhaWxhYmxlX2NoaWxkX2NvdW50KG5wKTsK
KwlhZGMtPm5jaGFucyA9IGRldmljZV9nZXRfY2hpbGRfbm9kZV9jb3VudChhZGMtPmRldik7CiAJ
aWYgKCFhZGMtPm5jaGFucykgewogCQlkZXZfZXJyKGFkYy0+ZGV2LCAibm8gY2hhbm5lbCBjaGls
ZHJlblxuIik7CiAJCXJldHVybiAtRU5PREVWOwpAQCAtODQ2LDE0ICs4NDUsMTQgQEAgc3RhdGlj
IGludCBwbTh4eHhfeG9hZGNfcGFyc2VfY2hhbm5lbHMoc3RydWN0IHBtOHh4eF94b2FkYyAqYWRj
LAogCQlyZXR1cm4gLUVOT01FTTsKIAogCWkgPSAwOwotCWZvcl9lYWNoX2F2YWlsYWJsZV9jaGls
ZF9vZl9ub2RlKG5wLCBjaGlsZCkgeworCWRldmljZV9mb3JfZWFjaF9jaGlsZF9ub2RlKGFkYy0+
ZGV2LCBjaGlsZCkgewogCQljaCA9ICZhZGMtPmNoYW5zW2ldOwogCQlyZXQgPSBwbTh4eHhfeG9h
ZGNfcGFyc2VfY2hhbm5lbChhZGMtPmRldiwgY2hpbGQsCiAJCQkJCQkgYWRjLT52YXJpYW50LT5j
aGFubmVscywKIAkJCQkJCSAmYWRjLT5paW9fY2hhbnNbaV0sCiAJCQkJCQkgY2gpOwogCQlpZiAo
cmV0KSB7Ci0JCQlvZl9ub2RlX3B1dChjaGlsZCk7CisJCQlmd25vZGVfaGFuZGxlX3B1dChjaGls
ZCk7CiAJCQlyZXR1cm4gcmV0OwogCQl9CiAJCWkrKzsKQEAgLTg4NCwxMiArODgzLDExIEBAIHN0
YXRpYyBpbnQgcG04eHh4X3hvYWRjX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYp
CiAJY29uc3Qgc3RydWN0IHhvYWRjX3ZhcmlhbnQgKnZhcmlhbnQ7CiAJc3RydWN0IHBtOHh4eF94
b2FkYyAqYWRjOwogCXN0cnVjdCBpaW9fZGV2ICppbmRpb19kZXY7Ci0Jc3RydWN0IGRldmljZV9u
b2RlICpucCA9IHBkZXYtPmRldi5vZl9ub2RlOwogCXN0cnVjdCByZWdtYXAgKm1hcDsKIAlzdHJ1
Y3QgZGV2aWNlICpkZXYgPSAmcGRldi0+ZGV2OwogCWludCByZXQ7CiAKLQl2YXJpYW50ID0gb2Zf
ZGV2aWNlX2dldF9tYXRjaF9kYXRhKGRldik7CisJdmFyaWFudCA9IGRldmljZV9nZXRfbWF0Y2hf
ZGF0YShkZXYpOwogCWlmICghdmFyaWFudCkKIAkJcmV0dXJuIC1FTk9ERVY7CiAKQEAgLTkwNCw3
ICs5MDIsNyBAQCBzdGF0aWMgaW50IHBtOHh4eF94b2FkY19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1f
ZGV2aWNlICpwZGV2KQogCWluaXRfY29tcGxldGlvbigmYWRjLT5jb21wbGV0ZSk7CiAJbXV0ZXhf
aW5pdCgmYWRjLT5sb2NrKTsKIAotCXJldCA9IHBtOHh4eF94b2FkY19wYXJzZV9jaGFubmVscyhh
ZGMsIG5wKTsKKwlyZXQgPSBwbTh4eHhfeG9hZGNfcGFyc2VfY2hhbm5lbHMoYWRjKTsKIAlpZiAo
cmV0KQogCQlyZXR1cm4gcmV0OwogCi0tIAoyLjM3LjEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1z
dG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
