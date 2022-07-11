Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB565702B3
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Jul 2022 14:40:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CF904C640F0;
	Mon, 11 Jul 2022 12:40:19 +0000 (UTC)
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com
 [148.163.135.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1BF28C640EE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Jul 2022 12:40:18 +0000 (UTC)
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
 by mx0a-00128a01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26B9ZMlf011649;
 Mon, 11 Jul 2022 08:39:32 -0400
Received: from nwd2mta3.analog.com ([137.71.173.56])
 by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3h73h6caj8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Jul 2022 08:39:32 -0400
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
 by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 26BCdUBf045740
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL); 
 Mon, 11 Jul 2022 08:39:30 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Mon, 11 Jul
 2022 08:39:30 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Mon, 11 Jul 2022 08:39:29 -0400
Received: from nsa.ad.analog.com ([10.44.3.53])
 by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 26BCbVEG011687;
 Mon, 11 Jul 2022 08:39:19 -0400
From: =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
To: <linux-arm-msm@vger.kernel.org>, <openbmc@lists.ozlabs.org>,
 <linux-renesas-soc@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-imx@nxp.com>,
 <linux-mips@vger.kernel.org>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 <linux-iio@vger.kernel.org>, <chrome-platform@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-stm32@st-md-mailman.stormreply.com>
Date: Mon, 11 Jul 2022 14:38:31 +0200
Message-ID: <20220711123835.811358-12-nuno.sa@analog.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220711123835.811358-1-nuno.sa@analog.com>
References: <20220711123835.811358-1-nuno.sa@analog.com>
MIME-Version: 1.0
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: tEDQbgQl4nOaH86goPstCJ9lxTmDAmt1
X-Proofpoint-ORIG-GUID: tEDQbgQl4nOaH86goPstCJ9lxTmDAmt1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-11_18,2022-07-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 mlxlogscore=999 lowpriorityscore=0 phishscore=0 mlxscore=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207110054
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
Subject: [Linux-stm32] [PATCH v2 11/15] iio: adc: qcom-spmi-vadc: convert to
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
PgpBY2tlZC1ieTogTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPgotLS0K
IGRyaXZlcnMvaWlvL2FkYy9xY29tLXNwbWktdmFkYy5jIHwgNDQgKysrKysrKysrKysrKysrKy0t
LS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspLCAyMiBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2lpby9hZGMvcWNvbS1zcG1pLXZhZGMuYyBi
L2RyaXZlcnMvaWlvL2FkYy9xY29tLXNwbWktdmFkYy5jCmluZGV4IDM0MjAyYmE1MjQ2OS4uYmNm
ZjBmNjJiNzBlIDEwMDY0NAotLS0gYS9kcml2ZXJzL2lpby9hZGMvcWNvbS1zcG1pLXZhZGMuYwor
KysgYi9kcml2ZXJzL2lpby9hZGMvcWNvbS1zcG1pLXZhZGMuYwpAQCAtMTMsOCArMTMsOSBAQAog
I2luY2x1ZGUgPGxpbnV4L2tlcm5lbC5oPgogI2luY2x1ZGUgPGxpbnV4L21hdGg2NC5oPgogI2lu
Y2x1ZGUgPGxpbnV4L21vZHVsZS5oPgotI2luY2x1ZGUgPGxpbnV4L29mLmg+CisjaW5jbHVkZSA8
bGludXgvbW9kX2RldmljZXRhYmxlLmg+CiAjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1fZGV2aWNl
Lmg+CisjaW5jbHVkZSA8bGludXgvcHJvcGVydHkuaD4KICNpbmNsdWRlIDxsaW51eC9yZWdtYXAu
aD4KICNpbmNsdWRlIDxsaW51eC9zbGFiLmg+CiAjaW5jbHVkZSA8bGludXgvbG9nMi5oPgpAQCAt
NDgxLDggKzQ4Miw4IEBAIHN0YXRpYyBpbnQgdmFkY19yZWFkX3JhdyhzdHJ1Y3QgaWlvX2RldiAq
aW5kaW9fZGV2LAogCXJldHVybiByZXQ7CiB9CiAKLXN0YXRpYyBpbnQgdmFkY19vZl94bGF0ZShz
dHJ1Y3QgaWlvX2RldiAqaW5kaW9fZGV2LAotCQkJIGNvbnN0IHN0cnVjdCBvZl9waGFuZGxlX2Fy
Z3MgKmlpb3NwZWMpCitzdGF0aWMgaW50IHZhZGNfZndub2RlX3hsYXRlKHN0cnVjdCBpaW9fZGV2
ICppbmRpb19kZXYsCisJCQkgICAgIGNvbnN0IHN0cnVjdCBmd25vZGVfcmVmZXJlbmNlX2FyZ3Mg
Kmlpb3NwZWMpCiB7CiAJc3RydWN0IHZhZGNfcHJpdiAqdmFkYyA9IGlpb19wcml2KGluZGlvX2Rl
dik7CiAJdW5zaWduZWQgaW50IGk7CkBAIC00OTYsNyArNDk3LDcgQEAgc3RhdGljIGludCB2YWRj
X29mX3hsYXRlKHN0cnVjdCBpaW9fZGV2ICppbmRpb19kZXYsCiAKIHN0YXRpYyBjb25zdCBzdHJ1
Y3QgaWlvX2luZm8gdmFkY19pbmZvID0gewogCS5yZWFkX3JhdyA9IHZhZGNfcmVhZF9yYXcsCi0J
Lm9mX3hsYXRlID0gdmFkY19vZl94bGF0ZSwKKwkuZndub2RlX3hsYXRlID0gdmFkY19md25vZGVf
eGxhdGUsCiB9OwogCiBzdHJ1Y3QgdmFkY19jaGFubmVscyB7CkBAIC02NDcsMTUgKzY0OCwxNSBA
QCBzdGF0aWMgY29uc3Qgc3RydWN0IHZhZGNfY2hhbm5lbHMgdmFkY19jaGFuc1tdID0gewogCVZB
RENfQ0hBTl9OT19TQ0FMRShMUl9NVVgzX0JVRl9QVTFfUFUyX1hPX1RIRVJNLCAwKQogfTsKIAot
c3RhdGljIGludCB2YWRjX2dldF9kdF9jaGFubmVsX2RhdGEoc3RydWN0IGRldmljZSAqZGV2LAor
c3RhdGljIGludCB2YWRjX2dldF9md19jaGFubmVsX2RhdGEoc3RydWN0IGRldmljZSAqZGV2LAog
CQkJCSAgICBzdHJ1Y3QgdmFkY19jaGFubmVsX3Byb3AgKnByb3AsCi0JCQkJICAgIHN0cnVjdCBk
ZXZpY2Vfbm9kZSAqbm9kZSkKKwkJCQkgICAgc3RydWN0IGZ3bm9kZV9oYW5kbGUgKmZ3bm9kZSkK
IHsKLQljb25zdCBjaGFyICpuYW1lID0gbm9kZS0+bmFtZTsKKwljb25zdCBjaGFyICpuYW1lID0g
Zndub2RlX2dldF9uYW1lKGZ3bm9kZSk7CiAJdTMyIGNoYW4sIHZhbHVlLCB2YXJyWzJdOwogCWlu
dCByZXQ7CiAKLQlyZXQgPSBvZl9wcm9wZXJ0eV9yZWFkX3UzMihub2RlLCAicmVnIiwgJmNoYW4p
OworCXJldCA9IGZ3bm9kZV9wcm9wZXJ0eV9yZWFkX3UzMihmd25vZGUsICJyZWciLCAmY2hhbik7
CiAJaWYgKHJldCkgewogCQlkZXZfZXJyKGRldiwgImludmFsaWQgY2hhbm5lbCBudW1iZXIgJXNc
biIsIG5hbWUpOwogCQlyZXR1cm4gcmV0OwpAQCAtNjY5LDcgKzY3MCw3IEBAIHN0YXRpYyBpbnQg
dmFkY19nZXRfZHRfY2hhbm5lbF9kYXRhKHN0cnVjdCBkZXZpY2UgKmRldiwKIAkvKiB0aGUgY2hh
bm5lbCBoYXMgRFQgZGVzY3JpcHRpb24gKi8KIAlwcm9wLT5jaGFubmVsID0gY2hhbjsKIAotCXJl
dCA9IG9mX3Byb3BlcnR5X3JlYWRfdTMyKG5vZGUsICJxY29tLGRlY2ltYXRpb24iLCAmdmFsdWUp
OworCXJldCA9IGZ3bm9kZV9wcm9wZXJ0eV9yZWFkX3UzMihmd25vZGUsICJxY29tLGRlY2ltYXRp
b24iLCAmdmFsdWUpOwogCWlmICghcmV0KSB7CiAJCXJldCA9IHFjb21fdmFkY19kZWNpbWF0aW9u
X2Zyb21fZHQodmFsdWUpOwogCQlpZiAocmV0IDwgMCkgewpAQCAtNjgyLDcgKzY4Myw3IEBAIHN0
YXRpYyBpbnQgdmFkY19nZXRfZHRfY2hhbm5lbF9kYXRhKHN0cnVjdCBkZXZpY2UgKmRldiwKIAkJ
cHJvcC0+ZGVjaW1hdGlvbiA9IFZBRENfREVGX0RFQ0lNQVRJT047CiAJfQogCi0JcmV0ID0gb2Zf
cHJvcGVydHlfcmVhZF91MzJfYXJyYXkobm9kZSwgInFjb20scHJlLXNjYWxpbmciLCB2YXJyLCAy
KTsKKwlyZXQgPSBmd25vZGVfcHJvcGVydHlfcmVhZF91MzJfYXJyYXkoZndub2RlLCAicWNvbSxw
cmUtc2NhbGluZyIsIHZhcnIsIDIpOwogCWlmICghcmV0KSB7CiAJCXJldCA9IHZhZGNfcHJlc2Nh
bGluZ19mcm9tX2R0KHZhcnJbMF0sIHZhcnJbMV0pOwogCQlpZiAocmV0IDwgMCkgewpAQCAtNjk1
LDcgKzY5Niw3IEBAIHN0YXRpYyBpbnQgdmFkY19nZXRfZHRfY2hhbm5lbF9kYXRhKHN0cnVjdCBk
ZXZpY2UgKmRldiwKIAkJcHJvcC0+cHJlc2NhbGUgPSB2YWRjX2NoYW5zW3Byb3AtPmNoYW5uZWxd
LnByZXNjYWxlX2luZGV4OwogCX0KIAotCXJldCA9IG9mX3Byb3BlcnR5X3JlYWRfdTMyKG5vZGUs
ICJxY29tLGh3LXNldHRsZS10aW1lIiwgJnZhbHVlKTsKKwlyZXQgPSBmd25vZGVfcHJvcGVydHlf
cmVhZF91MzIoZndub2RlLCAicWNvbSxody1zZXR0bGUtdGltZSIsICZ2YWx1ZSk7CiAJaWYgKCFy
ZXQpIHsKIAkJcmV0ID0gdmFkY19od19zZXR0bGVfdGltZV9mcm9tX2R0KHZhbHVlKTsKIAkJaWYg
KHJldCA8IDApIHsKQEAgLTcwOCw3ICs3MDksNyBAQCBzdGF0aWMgaW50IHZhZGNfZ2V0X2R0X2No
YW5uZWxfZGF0YShzdHJ1Y3QgZGV2aWNlICpkZXYsCiAJCXByb3AtPmh3X3NldHRsZV90aW1lID0g
VkFEQ19ERUZfSFdfU0VUVExFX1RJTUU7CiAJfQogCi0JcmV0ID0gb2ZfcHJvcGVydHlfcmVhZF91
MzIobm9kZSwgInFjb20sYXZnLXNhbXBsZXMiLCAmdmFsdWUpOworCXJldCA9IGZ3bm9kZV9wcm9w
ZXJ0eV9yZWFkX3UzMihmd25vZGUsICJxY29tLGF2Zy1zYW1wbGVzIiwgJnZhbHVlKTsKIAlpZiAo
IXJldCkgewogCQlyZXQgPSB2YWRjX2F2Z19zYW1wbGVzX2Zyb21fZHQodmFsdWUpOwogCQlpZiAo
cmV0IDwgMCkgewpAQCAtNzIxLDcgKzcyMiw3IEBAIHN0YXRpYyBpbnQgdmFkY19nZXRfZHRfY2hh
bm5lbF9kYXRhKHN0cnVjdCBkZXZpY2UgKmRldiwKIAkJcHJvcC0+YXZnX3NhbXBsZXMgPSBWQURD
X0RFRl9BVkdfU0FNUExFUzsKIAl9CiAKLQlpZiAob2ZfcHJvcGVydHlfcmVhZF9ib29sKG5vZGUs
ICJxY29tLHJhdGlvbWV0cmljIikpCisJaWYgKGZ3bm9kZV9wcm9wZXJ0eV9yZWFkX2Jvb2woZndu
b2RlLCAicWNvbSxyYXRpb21ldHJpYyIpKQogCQlwcm9wLT5jYWxpYnJhdGlvbiA9IFZBRENfQ0FM
SUJfUkFUSU9NRVRSSUM7CiAJZWxzZQogCQlwcm9wLT5jYWxpYnJhdGlvbiA9IFZBRENfQ0FMSUJf
QUJTT0xVVEU7CkBAIC03MzEsMTYgKzczMiwxNiBAQCBzdGF0aWMgaW50IHZhZGNfZ2V0X2R0X2No
YW5uZWxfZGF0YShzdHJ1Y3QgZGV2aWNlICpkZXYsCiAJcmV0dXJuIDA7CiB9CiAKLXN0YXRpYyBp
bnQgdmFkY19nZXRfZHRfZGF0YShzdHJ1Y3QgdmFkY19wcml2ICp2YWRjLCBzdHJ1Y3QgZGV2aWNl
X25vZGUgKm5vZGUpCitzdGF0aWMgaW50IHZhZGNfZ2V0X2Z3X2RhdGEoc3RydWN0IHZhZGNfcHJp
diAqdmFkYykKIHsKIAljb25zdCBzdHJ1Y3QgdmFkY19jaGFubmVscyAqdmFkY19jaGFuOwogCXN0
cnVjdCBpaW9fY2hhbl9zcGVjICppaW9fY2hhbjsKIAlzdHJ1Y3QgdmFkY19jaGFubmVsX3Byb3Ag
cHJvcDsKLQlzdHJ1Y3QgZGV2aWNlX25vZGUgKmNoaWxkOworCXN0cnVjdCBmd25vZGVfaGFuZGxl
ICpjaGlsZDsKIAl1bnNpZ25lZCBpbnQgaW5kZXggPSAwOwogCWludCByZXQ7CiAKLQl2YWRjLT5u
Y2hhbm5lbHMgPSBvZl9nZXRfYXZhaWxhYmxlX2NoaWxkX2NvdW50KG5vZGUpOworCXZhZGMtPm5j
aGFubmVscyA9IGRldmljZV9nZXRfY2hpbGRfbm9kZV9jb3VudCh2YWRjLT5kZXYpOwogCWlmICgh
dmFkYy0+bmNoYW5uZWxzKQogCQlyZXR1cm4gLUVJTlZBTDsKIApAQCAtNzU2LDEwICs3NTcsMTAg
QEAgc3RhdGljIGludCB2YWRjX2dldF9kdF9kYXRhKHN0cnVjdCB2YWRjX3ByaXYgKnZhZGMsIHN0
cnVjdCBkZXZpY2Vfbm9kZSAqbm9kZSkKIAogCWlpb19jaGFuID0gdmFkYy0+aWlvX2NoYW5zOwog
Ci0JZm9yX2VhY2hfYXZhaWxhYmxlX2NoaWxkX29mX25vZGUobm9kZSwgY2hpbGQpIHsKLQkJcmV0
ID0gdmFkY19nZXRfZHRfY2hhbm5lbF9kYXRhKHZhZGMtPmRldiwgJnByb3AsIGNoaWxkKTsKKwlk
ZXZpY2VfZm9yX2VhY2hfY2hpbGRfbm9kZSh2YWRjLT5kZXYsIGNoaWxkKSB7CisJCXJldCA9IHZh
ZGNfZ2V0X2Z3X2NoYW5uZWxfZGF0YSh2YWRjLT5kZXYsICZwcm9wLCBjaGlsZCk7CiAJCWlmIChy
ZXQpIHsKLQkJCW9mX25vZGVfcHV0KGNoaWxkKTsKKwkJCWZ3bm9kZV9oYW5kbGVfcHV0KGNoaWxk
KTsKIAkJCXJldHVybiByZXQ7CiAJCX0KIApAQCAtODQ4LDcgKzg0OSw2IEBAIHN0YXRpYyBpbnQg
dmFkY19jaGVja19yZXZpc2lvbihzdHJ1Y3QgdmFkY19wcml2ICp2YWRjKQogCiBzdGF0aWMgaW50
IHZhZGNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIHsKLQlzdHJ1Y3QgZGV2
aWNlX25vZGUgKm5vZGUgPSBwZGV2LT5kZXYub2Zfbm9kZTsKIAlzdHJ1Y3QgZGV2aWNlICpkZXYg
PSAmcGRldi0+ZGV2OwogCXN0cnVjdCBpaW9fZGV2ICppbmRpb19kZXY7CiAJc3RydWN0IHZhZGNf
cHJpdiAqdmFkYzsKQEAgLTg2MCw3ICs4NjAsNyBAQCBzdGF0aWMgaW50IHZhZGNfcHJvYmUoc3Ry
dWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlpZiAoIXJlZ21hcCkKIAkJcmV0dXJuIC1FTk9E
RVY7CiAKLQlyZXQgPSBvZl9wcm9wZXJ0eV9yZWFkX3UzMihub2RlLCAicmVnIiwgJnJlZyk7CisJ
cmV0ID0gZGV2aWNlX3Byb3BlcnR5X3JlYWRfdTMyKGRldiwgInJlZyIsICZyZWcpOwogCWlmIChy
ZXQgPCAwKQogCQlyZXR1cm4gcmV0OwogCkBAIC04ODAsNyArODgwLDcgQEAgc3RhdGljIGludCB2
YWRjX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJaWYgKHJldCkKIAkJcmV0
dXJuIHJldDsKIAotCXJldCA9IHZhZGNfZ2V0X2R0X2RhdGEodmFkYywgbm9kZSk7CisJcmV0ID0g
dmFkY19nZXRfZndfZGF0YSh2YWRjKTsKIAlpZiAocmV0KQogCQlyZXR1cm4gcmV0OwogCi0tIAoy
LjM3LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXN0bTMyCg==
