Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F722546021
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Jun 2022 10:49:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E9633C60490;
	Fri, 10 Jun 2022 08:49:33 +0000 (UTC)
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com
 [148.163.135.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9F999C60465
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jun 2022 08:49:32 +0000 (UTC)
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
 by mx0a-00128a01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25A7WKNk005267;
 Fri, 10 Jun 2022 04:48:49 -0400
Received: from nwd2mta4.analog.com ([137.71.173.58])
 by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3ghq33kqd1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Jun 2022 04:48:49 -0400
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
 by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 25A8mmcR027571
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL); 
 Fri, 10 Jun 2022 04:48:48 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Fri, 10 Jun
 2022 04:48:47 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Fri, 10 Jun 2022 04:48:47 -0400
Received: from nsa.ad.analog.com ([10.44.3.70])
 by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 25A8imip014275;
 Fri, 10 Jun 2022 04:48:38 -0400
From: =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
To: <linux-imx@nxp.com>, <linux-renesas-soc@vger.kernel.org>,
 <linux-mips@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <chrome-platform@lists.linux.dev>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 <linux-mediatek@lists.infradead.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-msm@vger.kernel.org>, <linux-iio@vger.kernel.org>,
 <openbmc@lists.ozlabs.org>
Date: Fri, 10 Jun 2022 10:45:40 +0200
Message-ID: <20220610084545.547700-30-nuno.sa@analog.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220610084545.547700-1-nuno.sa@analog.com>
References: <20220610084545.547700-1-nuno.sa@analog.com>
MIME-Version: 1.0
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: 7uL_5UJKLscvZ6dGNIIIrg8LReX_O-ks
X-Proofpoint-GUID: 7uL_5UJKLscvZ6dGNIIIrg8LReX_O-ks
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-10_02,2022-06-09_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 mlxlogscore=999 phishscore=0 priorityscore=1501 adultscore=0 clxscore=1015
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
Subject: [Linux-stm32] [PATCH 29/34] iio: adc: qcom-pm8xxx-xoadc: convert to
	device properties
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
PgotLS0KIGRyaXZlcnMvaWlvL2FkYy9xY29tLXBtOHh4eC14b2FkYy5jIHwgNTggKysrKysrKysr
KysrKystLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyOCBpbnNlcnRpb25zKCspLCAz
MCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2lpby9hZGMvcWNvbS1wbTh4eHgt
eG9hZGMuYyBiL2RyaXZlcnMvaWlvL2FkYy9xY29tLXBtOHh4eC14b2FkYy5jCmluZGV4IDVlOWU1
NjgyMTA3NS4uZWI0MjQ0OTZlZTFkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2lpby9hZGMvcWNvbS1w
bTh4eHgteG9hZGMuYworKysgYi9kcml2ZXJzL2lpby9hZGMvcWNvbS1wbTh4eHgteG9hZGMuYwpA
QCAtMTQsOSArMTQsOSBAQAogI2luY2x1ZGUgPGxpbnV4L2lpby9paW8uaD4KICNpbmNsdWRlIDxs
aW51eC9paW8vc3lzZnMuaD4KICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4KLSNpbmNsdWRlIDxs
aW51eC9vZi5oPgotI2luY2x1ZGUgPGxpbnV4L29mX2RldmljZS5oPgorI2luY2x1ZGUgPGxpbnV4
L21vZF9kZXZpY2V0YWJsZS5oPgogI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPgor
I2luY2x1ZGUgPGxpbnV4L3Byb3BlcnR5Lmg+CiAjaW5jbHVkZSA8bGludXgvcmVnbWFwLmg+CiAj
aW5jbHVkZSA8bGludXgvaW5pdC5oPgogI2luY2x1ZGUgPGxpbnV4L2ludGVycnVwdC5oPgpAQCAt
Njk0LDggKzY5NCw4IEBAIHN0YXRpYyBpbnQgcG04eHh4X3JlYWRfcmF3KHN0cnVjdCBpaW9fZGV2
ICppbmRpb19kZXYsCiAJfQogfQogCi1zdGF0aWMgaW50IHBtOHh4eF9vZl94bGF0ZShzdHJ1Y3Qg
aWlvX2RldiAqaW5kaW9fZGV2LAotCQkJICAgY29uc3Qgc3RydWN0IG9mX3BoYW5kbGVfYXJncyAq
aWlvc3BlYykKK3N0YXRpYyBpbnQgcG04eHh4X2Z3bm9kZV94bGF0ZShzdHJ1Y3QgaWlvX2RldiAq
aW5kaW9fZGV2LAorCQkJICAgICAgIGNvbnN0IHN0cnVjdCBmd25vZGVfcmVmZXJlbmNlX2FyZ3Mg
Kmlpb3NwZWMpCiB7CiAJc3RydWN0IHBtOHh4eF94b2FkYyAqYWRjID0gaWlvX3ByaXYoaW5kaW9f
ZGV2KTsKIAl1OCBwcmVfc2NhbGVfbXV4OwpAQCAtNzA2LDEwICs3MDYsMTAgQEAgc3RhdGljIGlu
dCBwbTh4eHhfb2ZfeGxhdGUoc3RydWN0IGlpb19kZXYgKmluZGlvX2RldiwKIAkgKiBGaXJzdCBj
ZWxsIGlzIHByZXNjYWxlciBvciBwcmVtdXgsIHNlY29uZCBjZWxsIGlzIGFuYWxvZwogCSAqIG11
eC4KIAkgKi8KLQlpZiAoaWlvc3BlYy0+YXJnc19jb3VudCAhPSAyKSB7Ci0JCWRldl9lcnIoJmlu
ZGlvX2Rldi0+ZGV2LCAid3JvbmcgbnVtYmVyIG9mIGFyZ3VtZW50cyBmb3IgJXBPRm4gbmVlZCAy
IGdvdCAlZFxuIiwKLQkJCWlpb3NwZWMtPm5wLAotCQkJaWlvc3BlYy0+YXJnc19jb3VudCk7CisJ
aWYgKGlpb3NwZWMtPm5hcmdzICE9IDIpIHsKKwkJZGV2X2VycigmaW5kaW9fZGV2LT5kZXYsICJ3
cm9uZyBudW1iZXIgb2YgYXJndW1lbnRzIGZvciAlcGZ3UCBuZWVkIDIgZ290ICVkXG4iLAorCQkJ
aWlvc3BlYy0+Zndub2RlLAorCQkJaWlvc3BlYy0+bmFyZ3MpOwogCQlyZXR1cm4gLUVJTlZBTDsK
IAl9CiAJcHJlX3NjYWxlX211eCA9ICh1OClpaW9zcGVjLT5hcmdzWzBdOwpAQCAtNzI3LDM0ICs3
MjcsMzQgQEAgc3RhdGljIGludCBwbTh4eHhfb2ZfeGxhdGUoc3RydWN0IGlpb19kZXYgKmluZGlv
X2RldiwKIH0KIAogc3RhdGljIGNvbnN0IHN0cnVjdCBpaW9faW5mbyBwbTh4eHhfeG9hZGNfaW5m
byA9IHsKLQkub2ZfeGxhdGUgPSBwbTh4eHhfb2ZfeGxhdGUsCisJLmZ3bm9kZV94bGF0ZSA9IHBt
OHh4eF9md25vZGVfeGxhdGUsCiAJLnJlYWRfcmF3ID0gcG04eHh4X3JlYWRfcmF3LAogfTsKIAog
c3RhdGljIGludCBwbTh4eHhfeG9hZGNfcGFyc2VfY2hhbm5lbChzdHJ1Y3QgZGV2aWNlICpkZXYs
Ci0JCQkJICAgICAgc3RydWN0IGRldmljZV9ub2RlICpucCwKKwkJCQkgICAgICBzdHJ1Y3QgZndu
b2RlX2hhbmRsZSAqZndub2RlLAogCQkJCSAgICAgIGNvbnN0IHN0cnVjdCB4b2FkY19jaGFubmVs
ICpod19jaGFubmVscywKIAkJCQkgICAgICBzdHJ1Y3QgaWlvX2NoYW5fc3BlYyAqaWlvX2NoYW4s
CiAJCQkJICAgICAgc3RydWN0IHBtOHh4eF9jaGFuX2luZm8gKmNoKQogewotCWNvbnN0IGNoYXIg
Km5hbWUgPSBucC0+bmFtZTsKKwljb25zdCBjaGFyICpuYW1lID0gZndub2RlX2dldF9uYW1lKGZ3
bm9kZSk7CiAJY29uc3Qgc3RydWN0IHhvYWRjX2NoYW5uZWwgKmh3Y2hhbjsKLQl1MzIgcHJlX3Nj
YWxlX211eCwgYW11eF9jaGFubmVsOworCXUzMiBwcmVfc2NhbGVfbXV4LCBhbXV4X2NoYW5uZWws
IHJlZ1syXTsKIAl1MzIgcnN2LCBkZWM7CiAJaW50IHJldDsKIAlpbnQgY2hpZDsKIAotCXJldCA9
IG9mX3Byb3BlcnR5X3JlYWRfdTMyX2luZGV4KG5wLCAicmVnIiwgMCwgJnByZV9zY2FsZV9tdXgp
OworCXJldCA9IGZ3bm9kZV9wcm9wZXJ0eV9yZWFkX3UzMl9hcnJheShmd25vZGUsICJyZWciLCBy
ZWcsCisJCQkJCSAgICAgQVJSQVlfU0laRShyZWcpKTsKIAlpZiAocmV0KSB7Ci0JCWRldl9lcnIo
ZGV2LCAiaW52YWxpZCBwcmUgc2NhbGUvbXV4IG51bWJlciAlc1xuIiwgbmFtZSk7Ci0JCXJldHVy
biByZXQ7Ci0JfQotCXJldCA9IG9mX3Byb3BlcnR5X3JlYWRfdTMyX2luZGV4KG5wLCAicmVnIiwg
MSwgJmFtdXhfY2hhbm5lbCk7Ci0JaWYgKHJldCkgewotCQlkZXZfZXJyKGRldiwgImludmFsaWQg
YW11eCBjaGFubmVsIG51bWJlciAlc1xuIiwgbmFtZSk7CisJCWRldl9lcnIoZGV2LCAiaW52YWxp
ZCBwcmUgc2NhbGUvbXV4IG9yIGFtdXggY2hhbm5lbCBudW1iZXIgJXNcbiIsCisJCQluYW1lKTsK
IAkJcmV0dXJuIHJldDsKIAl9CiAKKwlwcmVfc2NhbGVfbXV4ID0gcmVnWzBdOworCWFtdXhfY2hh
bm5lbCA9IHJlZ1sxXTsKKwogCS8qIEZpbmQgdGhlIHJpZ2h0IGNoYW5uZWwgc2V0dGluZyAqLwog
CWNoaWQgPSAwOwogCWh3Y2hhbiA9ICZod19jaGFubmVsc1swXTsKQEAgLTc3OCw3ICs3NzgsNyBA
QCBzdGF0aWMgaW50IHBtOHh4eF94b2FkY19wYXJzZV9jaGFubmVsKHN0cnVjdCBkZXZpY2UgKmRl
diwKIAkvKiBFdmVyeW9uZSBzZWVtcyB0byB1c2UgZGVmYXVsdCAoInR5cGUgMiIpIGRlY2ltYXRp
b24gKi8KIAljaC0+ZGVjaW1hdGlvbiA9IFZBRENfREVGX0RFQ0lNQVRJT047CiAKLQlpZiAoIW9m
X3Byb3BlcnR5X3JlYWRfdTMyKG5wLCAicWNvbSxyYXRpb21ldHJpYyIsICZyc3YpKSB7CisJaWYg
KCFmd25vZGVfcHJvcGVydHlfcmVhZF91MzIoZndub2RlLCAicWNvbSxyYXRpb21ldHJpYyIsICZy
c3YpKSB7CiAJCWNoLT5jYWxpYnJhdGlvbiA9IFZBRENfQ0FMSUJfUkFUSU9NRVRSSUM7CiAJCWlm
IChyc3YgPiBYT0FEQ19SU1ZfTUFYKSB7CiAJCQlkZXZfZXJyKGRldiwgIiVzIHRvbyBsYXJnZSBS
U1YgdmFsdWUgJWRcbiIsIG5hbWUsIHJzdik7CkBAIC03OTEsNyArNzkxLDcgQEAgc3RhdGljIGlu
dCBwbTh4eHhfeG9hZGNfcGFyc2VfY2hhbm5lbChzdHJ1Y3QgZGV2aWNlICpkZXYsCiAJfQogCiAJ
LyogT3B0aW9uYWwgZGVjaW1hdGlvbiwgaWYgb21pdHRlZCB3ZSB1c2UgdGhlIGRlZmF1bHQgKi8K
LQlyZXQgPSBvZl9wcm9wZXJ0eV9yZWFkX3UzMihucCwgInFjb20sZGVjaW1hdGlvbiIsICZkZWMp
OworCXJldCA9IGZ3bm9kZV9wcm9wZXJ0eV9yZWFkX3UzMihmd25vZGUsICJxY29tLGRlY2ltYXRp
b24iLCAmZGVjKTsKIAlpZiAoIXJldCkgewogCQlyZXQgPSBxY29tX3ZhZGNfZGVjaW1hdGlvbl9m
cm9tX2R0KGRlYyk7CiAJCWlmIChyZXQgPCAwKSB7CkBAIC04MjAsMTUgKzgyMCwxNCBAQCBzdGF0
aWMgaW50IHBtOHh4eF94b2FkY19wYXJzZV9jaGFubmVsKHN0cnVjdCBkZXZpY2UgKmRldiwKIAly
ZXR1cm4gMDsKIH0KIAotc3RhdGljIGludCBwbTh4eHhfeG9hZGNfcGFyc2VfY2hhbm5lbHMoc3Ry
dWN0IHBtOHh4eF94b2FkYyAqYWRjLAotCQkJCSAgICAgICBzdHJ1Y3QgZGV2aWNlX25vZGUgKm5w
KQorc3RhdGljIGludCBwbTh4eHhfeG9hZGNfcGFyc2VfY2hhbm5lbHMoc3RydWN0IHBtOHh4eF94
b2FkYyAqYWRjKQogewotCXN0cnVjdCBkZXZpY2Vfbm9kZSAqY2hpbGQ7CisJc3RydWN0IGZ3bm9k
ZV9oYW5kbGUgKmNoaWxkOwogCXN0cnVjdCBwbTh4eHhfY2hhbl9pbmZvICpjaDsKIAlpbnQgcmV0
OwogCWludCBpOwogCi0JYWRjLT5uY2hhbnMgPSBvZl9nZXRfYXZhaWxhYmxlX2NoaWxkX2NvdW50
KG5wKTsKKwlhZGMtPm5jaGFucyA9IGRldmljZV9nZXRfY2hpbGRfbm9kZV9jb3VudChhZGMtPmRl
dik7CiAJaWYgKCFhZGMtPm5jaGFucykgewogCQlkZXZfZXJyKGFkYy0+ZGV2LCAibm8gY2hhbm5l
bCBjaGlsZHJlblxuIik7CiAJCXJldHVybiAtRU5PREVWOwpAQCAtODQ2LDE0ICs4NDUsMTQgQEAg
c3RhdGljIGludCBwbTh4eHhfeG9hZGNfcGFyc2VfY2hhbm5lbHMoc3RydWN0IHBtOHh4eF94b2Fk
YyAqYWRjLAogCQlyZXR1cm4gLUVOT01FTTsKIAogCWkgPSAwOwotCWZvcl9lYWNoX2F2YWlsYWJs
ZV9jaGlsZF9vZl9ub2RlKG5wLCBjaGlsZCkgeworCWRldmljZV9mb3JfZWFjaF9jaGlsZF9ub2Rl
KGFkYy0+ZGV2LCBjaGlsZCkgewogCQljaCA9ICZhZGMtPmNoYW5zW2ldOwogCQlyZXQgPSBwbTh4
eHhfeG9hZGNfcGFyc2VfY2hhbm5lbChhZGMtPmRldiwgY2hpbGQsCiAJCQkJCQkgYWRjLT52YXJp
YW50LT5jaGFubmVscywKIAkJCQkJCSAmYWRjLT5paW9fY2hhbnNbaV0sCiAJCQkJCQkgY2gpOwog
CQlpZiAocmV0KSB7Ci0JCQlvZl9ub2RlX3B1dChjaGlsZCk7CisJCQlmd25vZGVfaGFuZGxlX3B1
dChjaGlsZCk7CiAJCQlyZXR1cm4gcmV0OwogCQl9CiAJCWkrKzsKQEAgLTg4NCwxMiArODgzLDEx
IEBAIHN0YXRpYyBpbnQgcG04eHh4X3hvYWRjX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2Ug
KnBkZXYpCiAJY29uc3Qgc3RydWN0IHhvYWRjX3ZhcmlhbnQgKnZhcmlhbnQ7CiAJc3RydWN0IHBt
OHh4eF94b2FkYyAqYWRjOwogCXN0cnVjdCBpaW9fZGV2ICppbmRpb19kZXY7Ci0Jc3RydWN0IGRl
dmljZV9ub2RlICpucCA9IHBkZXYtPmRldi5vZl9ub2RlOwogCXN0cnVjdCByZWdtYXAgKm1hcDsK
IAlzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmcGRldi0+ZGV2OwogCWludCByZXQ7CiAKLQl2YXJpYW50
ID0gb2ZfZGV2aWNlX2dldF9tYXRjaF9kYXRhKGRldik7CisJdmFyaWFudCA9IGRldmljZV9nZXRf
bWF0Y2hfZGF0YShkZXYpOwogCWlmICghdmFyaWFudCkKIAkJcmV0dXJuIC1FTk9ERVY7CiAKQEAg
LTkwNCw3ICs5MDIsNyBAQCBzdGF0aWMgaW50IHBtOHh4eF94b2FkY19wcm9iZShzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlICpwZGV2KQogCWluaXRfY29tcGxldGlvbigmYWRjLT5jb21wbGV0ZSk7CiAJ
bXV0ZXhfaW5pdCgmYWRjLT5sb2NrKTsKIAotCXJldCA9IHBtOHh4eF94b2FkY19wYXJzZV9jaGFu
bmVscyhhZGMsIG5wKTsKKwlyZXQgPSBwbTh4eHhfeG9hZGNfcGFyc2VfY2hhbm5lbHMoYWRjKTsK
IAlpZiAocmV0KQogCQlyZXR1cm4gcmV0OwogCi0tIAoyLjM2LjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApM
aW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
