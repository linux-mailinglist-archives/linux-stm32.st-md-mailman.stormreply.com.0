Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A49D5702C9
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Jul 2022 14:40:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F340AC640F0;
	Mon, 11 Jul 2022 12:40:29 +0000 (UTC)
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com
 [148.163.135.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5ABEDC640EE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Jul 2022 12:40:28 +0000 (UTC)
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
 by mx0a-00128a01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26BCAAMU026688;
 Mon, 11 Jul 2022 08:39:40 -0400
Received: from nwd2mta4.analog.com ([137.71.173.58])
 by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3h76k6bj1g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Jul 2022 08:39:40 -0400
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
 by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 26BCddgE000431
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL); 
 Mon, 11 Jul 2022 08:39:39 -0400
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX9.ad.analog.com (10.64.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Mon, 11 Jul 2022 08:39:38 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Mon, 11 Jul 2022 08:39:38 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Mon, 11 Jul 2022 08:39:38 -0400
Received: from nsa.ad.analog.com ([10.44.3.53])
 by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 26BCbVEH011687;
 Mon, 11 Jul 2022 08:39:26 -0400
From: =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
To: <linux-arm-msm@vger.kernel.org>, <openbmc@lists.ozlabs.org>,
 <linux-renesas-soc@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-imx@nxp.com>,
 <linux-mips@vger.kernel.org>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 <linux-iio@vger.kernel.org>, <chrome-platform@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-stm32@st-md-mailman.stormreply.com>
Date: Mon, 11 Jul 2022 14:38:32 +0200
Message-ID: <20220711123835.811358-13-nuno.sa@analog.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220711123835.811358-1-nuno.sa@analog.com>
References: <20220711123835.811358-1-nuno.sa@analog.com>
MIME-Version: 1.0
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: OYUbTQFXNWsNX24vcEdZB3eG1zdv3REc
X-Proofpoint-GUID: OYUbTQFXNWsNX24vcEdZB3eG1zdv3REc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-11_18,2022-07-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0
 mlxlogscore=999 malwarescore=0 spamscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 mlxscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207110054
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
 Andy Gross <agross@kernel.org>, Zhang
 Rui <rui.zhang@intel.com>, Christophe Branchereau <cbranchereau@gmail.com>,
 Saravanan Sekar <sravanhome@gmail.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Cai Huoqing <cai.huoqing@linux.dev>,
 Matthias
 Brugger <matthias.bgg@gmail.com>, Gwendal Grignou <gwendal@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Benson Leung <bleung@chromium.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Thara Gopinath <thara.gopinath@linaro.org>, Arnd
 Bergmann <arnd@arndb.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Eugen
 Hristev <eugen.hristev@microchip.com>, Shawn Guo <shawnguo@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Jonathan Cameron <jic23@kernel.org>
Subject: [Linux-stm32] [PATCH v2 12/15] iio: adc: qcom-spmi-adc5: convert to
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
IGRyaXZlcnMvaWlvL2FkYy9xY29tLXNwbWktYWRjNS5jIHwgNjMgKysrKysrKysrKysrKysrLS0t
LS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAzMCBpbnNlcnRpb25zKCspLCAzMyBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2lpby9hZGMvcWNvbS1zcG1pLWFkYzUuYyBi
L2RyaXZlcnMvaWlvL2FkYy9xY29tLXNwbWktYWRjNS5jCmluZGV4IDg3NDM4ZDFlNWMwYi4uYTIz
ZjkyOTNkNmMxIDEwMDY0NAotLS0gYS9kcml2ZXJzL2lpby9hZGMvcWNvbS1zcG1pLWFkYzUuYwor
KysgYi9kcml2ZXJzL2lpby9hZGMvcWNvbS1zcG1pLWFkYzUuYwpAQCAtMTQsOSArMTQsOSBAQAog
I2luY2x1ZGUgPGxpbnV4L2xvZzIuaD4KICNpbmNsdWRlIDxsaW51eC9tYXRoNjQuaD4KICNpbmNs
dWRlIDxsaW51eC9tb2R1bGUuaD4KLSNpbmNsdWRlIDxsaW51eC9vZi5oPgotI2luY2x1ZGUgPGxp
bnV4L29mX2RldmljZS5oPgorI2luY2x1ZGUgPGxpbnV4L21vZF9kZXZpY2V0YWJsZS5oPgogI2lu
Y2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPgorI2luY2x1ZGUgPGxpbnV4L3Byb3BlcnR5
Lmg+CiAjaW5jbHVkZSA8bGludXgvcmVnbWFwLmg+CiAjaW5jbHVkZSA8bGludXgvc2xhYi5oPgog
CkBAIC00MDMsOCArNDAzLDggQEAgc3RhdGljIGlycXJldHVybl90IGFkYzVfaXNyKGludCBpcnEs
IHZvaWQgKmRldl9pZCkKIAlyZXR1cm4gSVJRX0hBTkRMRUQ7CiB9CiAKLXN0YXRpYyBpbnQgYWRj
NV9vZl94bGF0ZShzdHJ1Y3QgaWlvX2RldiAqaW5kaW9fZGV2LAotCQkJCWNvbnN0IHN0cnVjdCBv
Zl9waGFuZGxlX2FyZ3MgKmlpb3NwZWMpCitzdGF0aWMgaW50IGFkYzVfZndub2RlX3hsYXRlKHN0
cnVjdCBpaW9fZGV2ICppbmRpb19kZXYsCisJCQkgICAgIGNvbnN0IHN0cnVjdCBmd25vZGVfcmVm
ZXJlbmNlX2FyZ3MgKmlpb3NwZWMpCiB7CiAJc3RydWN0IGFkYzVfY2hpcCAqYWRjID0gaWlvX3By
aXYoaW5kaW9fZGV2KTsKIAlpbnQgaTsKQEAgLTQxNiw4ICs0MTYsOCBAQCBzdGF0aWMgaW50IGFk
YzVfb2ZfeGxhdGUoc3RydWN0IGlpb19kZXYgKmluZGlvX2RldiwKIAlyZXR1cm4gLUVJTlZBTDsK
IH0KIAotc3RhdGljIGludCBhZGM3X29mX3hsYXRlKHN0cnVjdCBpaW9fZGV2ICppbmRpb19kZXYs
Ci0JCQkJY29uc3Qgc3RydWN0IG9mX3BoYW5kbGVfYXJncyAqaWlvc3BlYykKK3N0YXRpYyBpbnQg
YWRjN19md25vZGVfeGxhdGUoc3RydWN0IGlpb19kZXYgKmluZGlvX2RldiwKKwkJCSAgICAgY29u
c3Qgc3RydWN0IGZ3bm9kZV9yZWZlcmVuY2VfYXJncyAqaWlvc3BlYykKIHsKIAlzdHJ1Y3QgYWRj
NV9jaGlwICphZGMgPSBpaW9fcHJpdihpbmRpb19kZXYpOwogCWludCBpLCB2X2NoYW5uZWw7CkBA
IC00ODEsMTIgKzQ4MSwxMiBAQCBzdGF0aWMgaW50IGFkYzdfcmVhZF9yYXcoc3RydWN0IGlpb19k
ZXYgKmluZGlvX2RldiwKIAogc3RhdGljIGNvbnN0IHN0cnVjdCBpaW9faW5mbyBhZGM1X2luZm8g
PSB7CiAJLnJlYWRfcmF3ID0gYWRjNV9yZWFkX3JhdywKLQkub2ZfeGxhdGUgPSBhZGM1X29mX3hs
YXRlLAorCS5md25vZGVfeGxhdGUgPSBhZGM1X2Z3bm9kZV94bGF0ZSwKIH07CiAKIHN0YXRpYyBj
b25zdCBzdHJ1Y3QgaWlvX2luZm8gYWRjN19pbmZvID0gewogCS5yZWFkX3JhdyA9IGFkYzdfcmVh
ZF9yYXcsCi0JLm9mX3hsYXRlID0gYWRjN19vZl94bGF0ZSwKKwkuZndub2RlX3hsYXRlID0gYWRj
N19md25vZGVfeGxhdGUsCiB9OwogCiBzdHJ1Y3QgYWRjNV9jaGFubmVscyB7CkBAIC02MTEsMTgg
KzYxMSwxOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGFkYzVfY2hhbm5lbHMgYWRjNV9jaGFuc19y
ZXYyW0FEQzVfTUFYX0NIQU5ORUxdID0gewogCQkJCQlTQ0FMRV9IV19DQUxJQl9USEVSTV8xMDBL
X1BVTExVUCkKIH07CiAKLXN0YXRpYyBpbnQgYWRjNV9nZXRfZHRfY2hhbm5lbF9kYXRhKHN0cnVj
dCBhZGM1X2NoaXAgKmFkYywKK3N0YXRpYyBpbnQgYWRjNV9nZXRfZndfY2hhbm5lbF9kYXRhKHN0
cnVjdCBhZGM1X2NoaXAgKmFkYywKIAkJCQkgICAgc3RydWN0IGFkYzVfY2hhbm5lbF9wcm9wICpw
cm9wLAotCQkJCSAgICBzdHJ1Y3QgZGV2aWNlX25vZGUgKm5vZGUsCisJCQkJICAgIHN0cnVjdCBm
d25vZGVfaGFuZGxlICpmd25vZGUsCiAJCQkJICAgIGNvbnN0IHN0cnVjdCBhZGM1X2RhdGEgKmRh
dGEpCiB7Ci0JY29uc3QgY2hhciAqbmFtZSA9IG5vZGUtPm5hbWUsICpjaGFubmVsX25hbWU7CisJ
Y29uc3QgY2hhciAqbmFtZSA9IGZ3bm9kZV9nZXRfbmFtZShmd25vZGUpLCAqY2hhbm5lbF9uYW1l
OwogCXUzMiBjaGFuLCB2YWx1ZSwgdmFyclsyXTsKIAl1MzIgc2lkID0gMDsKIAlpbnQgcmV0Owog
CXN0cnVjdCBkZXZpY2UgKmRldiA9IGFkYy0+ZGV2OwogCi0JcmV0ID0gb2ZfcHJvcGVydHlfcmVh
ZF91MzIobm9kZSwgInJlZyIsICZjaGFuKTsKKwlyZXQgPSBmd25vZGVfcHJvcGVydHlfcmVhZF91
MzIoZndub2RlLCAicmVnIiwgJmNoYW4pOwogCWlmIChyZXQpIHsKIAkJZGV2X2VycihkZXYsICJp
bnZhbGlkIGNoYW5uZWwgbnVtYmVyICVzXG4iLCBuYW1lKTsKIAkJcmV0dXJuIHJldDsKQEAgLTY0
NywxNSArNjQ3LDEzIEBAIHN0YXRpYyBpbnQgYWRjNV9nZXRfZHRfY2hhbm5lbF9kYXRhKHN0cnVj
dCBhZGM1X2NoaXAgKmFkYywKIAlwcm9wLT5jaGFubmVsID0gY2hhbjsKIAlwcm9wLT5zaWQgPSBz
aWQ7CiAKLQljaGFubmVsX25hbWUgPSBvZl9nZXRfcHJvcGVydHkobm9kZSwKLQkJCQkibGFiZWwi
LCBOVUxMKSA/IDogbm9kZS0+bmFtZTsKLQlpZiAoIWNoYW5uZWxfbmFtZSkgewotCQlkZXZfZXJy
KGRldiwgIkludmFsaWQgY2hhbm5lbCBuYW1lXG4iKTsKLQkJcmV0dXJuIC1FSU5WQUw7Ci0JfQor
CXJldCA9IGZ3bm9kZV9wcm9wZXJ0eV9yZWFkX3N0cmluZyhmd25vZGUsICJsYWJlbCIsICZjaGFu
bmVsX25hbWUpOworCWlmIChyZXQpCisJCWNoYW5uZWxfbmFtZSA9IG5hbWU7CisKIAlwcm9wLT5k
YXRhc2hlZXRfbmFtZSA9IGNoYW5uZWxfbmFtZTsKIAotCXJldCA9IG9mX3Byb3BlcnR5X3JlYWRf
dTMyKG5vZGUsICJxY29tLGRlY2ltYXRpb24iLCAmdmFsdWUpOworCXJldCA9IGZ3bm9kZV9wcm9w
ZXJ0eV9yZWFkX3UzMihmd25vZGUsICJxY29tLGRlY2ltYXRpb24iLCAmdmFsdWUpOwogCWlmICgh
cmV0KSB7CiAJCXJldCA9IHFjb21fYWRjNV9kZWNpbWF0aW9uX2Zyb21fZHQodmFsdWUsIGRhdGEt
PmRlY2ltYXRpb24pOwogCQlpZiAocmV0IDwgMCkgewpAQCAtNjY4LDcgKzY2Niw3IEBAIHN0YXRp
YyBpbnQgYWRjNV9nZXRfZHRfY2hhbm5lbF9kYXRhKHN0cnVjdCBhZGM1X2NoaXAgKmFkYywKIAkJ
cHJvcC0+ZGVjaW1hdGlvbiA9IEFEQzVfREVDSU1BVElPTl9ERUZBVUxUOwogCX0KIAotCXJldCA9
IG9mX3Byb3BlcnR5X3JlYWRfdTMyX2FycmF5KG5vZGUsICJxY29tLHByZS1zY2FsaW5nIiwgdmFy
ciwgMik7CisJcmV0ID0gZndub2RlX3Byb3BlcnR5X3JlYWRfdTMyX2FycmF5KGZ3bm9kZSwgInFj
b20scHJlLXNjYWxpbmciLCB2YXJyLCAyKTsKIAlpZiAoIXJldCkgewogCQlyZXQgPSBxY29tX2Fk
YzVfcHJlc2NhbGluZ19mcm9tX2R0KHZhcnJbMF0sIHZhcnJbMV0pOwogCQlpZiAocmV0IDwgMCkg
ewpAQCAtNjgyLDcgKzY4MCw3IEBAIHN0YXRpYyBpbnQgYWRjNV9nZXRfZHRfY2hhbm5lbF9kYXRh
KHN0cnVjdCBhZGM1X2NoaXAgKmFkYywKIAkJCWFkYy0+ZGF0YS0+YWRjX2NoYW5zW3Byb3AtPmNo
YW5uZWxdLnByZXNjYWxlX2luZGV4OwogCX0KIAotCXJldCA9IG9mX3Byb3BlcnR5X3JlYWRfdTMy
KG5vZGUsICJxY29tLGh3LXNldHRsZS10aW1lIiwgJnZhbHVlKTsKKwlyZXQgPSBmd25vZGVfcHJv
cGVydHlfcmVhZF91MzIoZndub2RlLCAicWNvbSxody1zZXR0bGUtdGltZSIsICZ2YWx1ZSk7CiAJ
aWYgKCFyZXQpIHsKIAkJdTggZGlnX3ZlcnNpb25bMl07CiAKQEAgLTcxMyw3ICs3MTEsNyBAQCBz
dGF0aWMgaW50IGFkYzVfZ2V0X2R0X2NoYW5uZWxfZGF0YShzdHJ1Y3QgYWRjNV9jaGlwICphZGMs
CiAJCXByb3AtPmh3X3NldHRsZV90aW1lID0gVkFEQ19ERUZfSFdfU0VUVExFX1RJTUU7CiAJfQog
Ci0JcmV0ID0gb2ZfcHJvcGVydHlfcmVhZF91MzIobm9kZSwgInFjb20sYXZnLXNhbXBsZXMiLCAm
dmFsdWUpOworCXJldCA9IGZ3bm9kZV9wcm9wZXJ0eV9yZWFkX3UzMihmd25vZGUsICJxY29tLGF2
Zy1zYW1wbGVzIiwgJnZhbHVlKTsKIAlpZiAoIXJldCkgewogCQlyZXQgPSBxY29tX2FkYzVfYXZn
X3NhbXBsZXNfZnJvbV9kdCh2YWx1ZSk7CiAJCWlmIChyZXQgPCAwKSB7CkBAIC03MjYsNyArNzI0
LDcgQEAgc3RhdGljIGludCBhZGM1X2dldF9kdF9jaGFubmVsX2RhdGEoc3RydWN0IGFkYzVfY2hp
cCAqYWRjLAogCQlwcm9wLT5hdmdfc2FtcGxlcyA9IFZBRENfREVGX0FWR19TQU1QTEVTOwogCX0K
IAotCWlmIChvZl9wcm9wZXJ0eV9yZWFkX2Jvb2wobm9kZSwgInFjb20scmF0aW9tZXRyaWMiKSkK
KwlpZiAoZndub2RlX3Byb3BlcnR5X3JlYWRfYm9vbChmd25vZGUsICJxY29tLHJhdGlvbWV0cmlj
IikpCiAJCXByb3AtPmNhbF9tZXRob2QgPSBBREM1X1JBVElPTUVUUklDX0NBTDsKIAllbHNlCiAJ
CXByb3AtPmNhbF9tZXRob2QgPSBBREM1X0FCU09MVVRFX0NBTDsKQEAgLTgwMSwxNiArNzk5LDE2
IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIGFkYzVfbWF0Y2hfdGFibGVbXSA9
IHsKIH07CiBNT0RVTEVfREVWSUNFX1RBQkxFKG9mLCBhZGM1X21hdGNoX3RhYmxlKTsKIAotc3Rh
dGljIGludCBhZGM1X2dldF9kdF9kYXRhKHN0cnVjdCBhZGM1X2NoaXAgKmFkYywgc3RydWN0IGRl
dmljZV9ub2RlICpub2RlKQorc3RhdGljIGludCBhZGM1X2dldF9md19kYXRhKHN0cnVjdCBhZGM1
X2NoaXAgKmFkYykKIHsKIAljb25zdCBzdHJ1Y3QgYWRjNV9jaGFubmVscyAqYWRjX2NoYW47CiAJ
c3RydWN0IGlpb19jaGFuX3NwZWMgKmlpb19jaGFuOwogCXN0cnVjdCBhZGM1X2NoYW5uZWxfcHJv
cCBwcm9wLCAqY2hhbl9wcm9wczsKLQlzdHJ1Y3QgZGV2aWNlX25vZGUgKmNoaWxkOworCXN0cnVj
dCBmd25vZGVfaGFuZGxlICpjaGlsZDsKIAl1bnNpZ25lZCBpbnQgaW5kZXggPSAwOwogCWludCBy
ZXQ7CiAKLQlhZGMtPm5jaGFubmVscyA9IG9mX2dldF9hdmFpbGFibGVfY2hpbGRfY291bnQobm9k
ZSk7CisJYWRjLT5uY2hhbm5lbHMgPSBkZXZpY2VfZ2V0X2NoaWxkX25vZGVfY291bnQoYWRjLT5k
ZXYpOwogCWlmICghYWRjLT5uY2hhbm5lbHMpCiAJCXJldHVybiAtRUlOVkFMOwogCkBAIC04MjYs
MTQgKzgyNCwxNCBAQCBzdGF0aWMgaW50IGFkYzVfZ2V0X2R0X2RhdGEoc3RydWN0IGFkYzVfY2hp
cCAqYWRjLCBzdHJ1Y3QgZGV2aWNlX25vZGUgKm5vZGUpCiAKIAljaGFuX3Byb3BzID0gYWRjLT5j
aGFuX3Byb3BzOwogCWlpb19jaGFuID0gYWRjLT5paW9fY2hhbnM7Ci0JYWRjLT5kYXRhID0gb2Zf
ZGV2aWNlX2dldF9tYXRjaF9kYXRhKGFkYy0+ZGV2KTsKKwlhZGMtPmRhdGEgPSBkZXZpY2VfZ2V0
X21hdGNoX2RhdGEoYWRjLT5kZXYpOwogCWlmICghYWRjLT5kYXRhKQogCQlhZGMtPmRhdGEgPSAm
YWRjNV9kYXRhX3BtaWM7CiAKLQlmb3JfZWFjaF9hdmFpbGFibGVfY2hpbGRfb2Zfbm9kZShub2Rl
LCBjaGlsZCkgewotCQlyZXQgPSBhZGM1X2dldF9kdF9jaGFubmVsX2RhdGEoYWRjLCAmcHJvcCwg
Y2hpbGQsIGFkYy0+ZGF0YSk7CisJZGV2aWNlX2Zvcl9lYWNoX2NoaWxkX25vZGUoYWRjLT5kZXYs
IGNoaWxkKSB7CisJCXJldCA9IGFkYzVfZ2V0X2Z3X2NoYW5uZWxfZGF0YShhZGMsICZwcm9wLCBj
aGlsZCwgYWRjLT5kYXRhKTsKIAkJaWYgKHJldCkgewotCQkJb2Zfbm9kZV9wdXQoY2hpbGQpOwor
CQkJZndub2RlX2hhbmRsZV9wdXQoY2hpbGQpOwogCQkJcmV0dXJuIHJldDsKIAkJfQogCkBAIC04
NTgsNyArODU2LDYgQEAgc3RhdGljIGludCBhZGM1X2dldF9kdF9kYXRhKHN0cnVjdCBhZGM1X2No
aXAgKmFkYywgc3RydWN0IGRldmljZV9ub2RlICpub2RlKQogCiBzdGF0aWMgaW50IGFkYzVfcHJv
YmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIHsKLQlzdHJ1Y3QgZGV2aWNlX25vZGUg
Km5vZGUgPSBwZGV2LT5kZXYub2Zfbm9kZTsKIAlzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmcGRldi0+
ZGV2OwogCXN0cnVjdCBpaW9fZGV2ICppbmRpb19kZXY7CiAJc3RydWN0IGFkYzVfY2hpcCAqYWRj
OwpAQCAtODcwLDcgKzg2Nyw3IEBAIHN0YXRpYyBpbnQgYWRjNV9wcm9iZShzdHJ1Y3QgcGxhdGZv
cm1fZGV2aWNlICpwZGV2KQogCWlmICghcmVnbWFwKQogCQlyZXR1cm4gLUVOT0RFVjsKIAotCXJl
dCA9IG9mX3Byb3BlcnR5X3JlYWRfdTMyKG5vZGUsICJyZWciLCAmcmVnKTsKKwlyZXQgPSBkZXZp
Y2VfcHJvcGVydHlfcmVhZF91MzIoZGV2LCAicmVnIiwgJnJlZyk7CiAJaWYgKHJldCA8IDApCiAJ
CXJldHVybiByZXQ7CiAKQEAgLTg4Niw3ICs4ODMsNyBAQCBzdGF0aWMgaW50IGFkYzVfcHJvYmUo
c3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlpbml0X2NvbXBsZXRpb24oJmFkYy0+Y29t
cGxldGUpOwogCW11dGV4X2luaXQoJmFkYy0+bG9jayk7CiAKLQlyZXQgPSBhZGM1X2dldF9kdF9k
YXRhKGFkYywgbm9kZSk7CisJcmV0ID0gYWRjNV9nZXRfZndfZGF0YShhZGMpOwogCWlmIChyZXQp
IHsKIAkJZGV2X2VycihkZXYsICJhZGMgZ2V0IGR0IGRhdGEgZmFpbGVkXG4iKTsKIAkJcmV0dXJu
IHJldDsKLS0gCjIuMzcuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21h
aWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
