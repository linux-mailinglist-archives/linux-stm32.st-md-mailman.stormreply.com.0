Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED31546057
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Jun 2022 10:49:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2694AC6046D;
	Fri, 10 Jun 2022 08:49:51 +0000 (UTC)
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com
 [148.163.135.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1D76FC60465
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jun 2022 08:49:48 +0000 (UTC)
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
 by mx0a-00128a01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25A7SjCl005350;
 Fri, 10 Jun 2022 04:49:04 -0400
Received: from nwd2mta3.analog.com ([137.71.173.56])
 by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3ghq33kqe3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Jun 2022 04:49:04 -0400
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
 by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 25A8n3Kt023331
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL); 
 Fri, 10 Jun 2022 04:49:03 -0400
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX9.ad.analog.com (10.64.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Fri, 10 Jun 2022 04:49:02 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Fri, 10 Jun 2022 04:49:02 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Fri, 10 Jun 2022 04:49:02 -0400
Received: from nsa.ad.analog.com ([10.44.3.70])
 by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 25A8imir014275;
 Fri, 10 Jun 2022 04:48:50 -0400
From: =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
To: <linux-imx@nxp.com>, <linux-renesas-soc@vger.kernel.org>,
 <linux-mips@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <chrome-platform@lists.linux.dev>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 <linux-mediatek@lists.infradead.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-msm@vger.kernel.org>, <linux-iio@vger.kernel.org>,
 <openbmc@lists.ozlabs.org>
Date: Fri, 10 Jun 2022 10:45:42 +0200
Message-ID: <20220610084545.547700-32-nuno.sa@analog.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220610084545.547700-1-nuno.sa@analog.com>
References: <20220610084545.547700-1-nuno.sa@analog.com>
MIME-Version: 1.0
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: lRX3q1Sm_9npDIyKIT-3VhvZf79E_QQX
X-Proofpoint-GUID: lRX3q1Sm_9npDIyKIT-3VhvZf79E_QQX
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
 "Rafael J. Wysocki" <rafael@kernel.org>, Linus
 Walleij <linus.walleij@linaro.org>, Amit Kucheria <amitk@kernel.org>,
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
Subject: [Linux-stm32] [PATCH 31/34] iio: adc: qcom-spmi-adc5: convert to
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
PgotLS0KIGRyaXZlcnMvaWlvL2FkYy9xY29tLXNwbWktYWRjNS5jIHwgNjMgKysrKysrKysrKysr
KysrLS0tLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAzMCBpbnNlcnRpb25zKCspLCAz
MyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2lpby9hZGMvcWNvbS1zcG1pLWFk
YzUuYyBiL2RyaXZlcnMvaWlvL2FkYy9xY29tLXNwbWktYWRjNS5jCmluZGV4IDg3NDM4ZDFlNWMw
Yi4uYTIzZjkyOTNkNmMxIDEwMDY0NAotLS0gYS9kcml2ZXJzL2lpby9hZGMvcWNvbS1zcG1pLWFk
YzUuYworKysgYi9kcml2ZXJzL2lpby9hZGMvcWNvbS1zcG1pLWFkYzUuYwpAQCAtMTQsOSArMTQs
OSBAQAogI2luY2x1ZGUgPGxpbnV4L2xvZzIuaD4KICNpbmNsdWRlIDxsaW51eC9tYXRoNjQuaD4K
ICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4KLSNpbmNsdWRlIDxsaW51eC9vZi5oPgotI2luY2x1
ZGUgPGxpbnV4L29mX2RldmljZS5oPgorI2luY2x1ZGUgPGxpbnV4L21vZF9kZXZpY2V0YWJsZS5o
PgogI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPgorI2luY2x1ZGUgPGxpbnV4L3By
b3BlcnR5Lmg+CiAjaW5jbHVkZSA8bGludXgvcmVnbWFwLmg+CiAjaW5jbHVkZSA8bGludXgvc2xh
Yi5oPgogCkBAIC00MDMsOCArNDAzLDggQEAgc3RhdGljIGlycXJldHVybl90IGFkYzVfaXNyKGlu
dCBpcnEsIHZvaWQgKmRldl9pZCkKIAlyZXR1cm4gSVJRX0hBTkRMRUQ7CiB9CiAKLXN0YXRpYyBp
bnQgYWRjNV9vZl94bGF0ZShzdHJ1Y3QgaWlvX2RldiAqaW5kaW9fZGV2LAotCQkJCWNvbnN0IHN0
cnVjdCBvZl9waGFuZGxlX2FyZ3MgKmlpb3NwZWMpCitzdGF0aWMgaW50IGFkYzVfZndub2RlX3hs
YXRlKHN0cnVjdCBpaW9fZGV2ICppbmRpb19kZXYsCisJCQkgICAgIGNvbnN0IHN0cnVjdCBmd25v
ZGVfcmVmZXJlbmNlX2FyZ3MgKmlpb3NwZWMpCiB7CiAJc3RydWN0IGFkYzVfY2hpcCAqYWRjID0g
aWlvX3ByaXYoaW5kaW9fZGV2KTsKIAlpbnQgaTsKQEAgLTQxNiw4ICs0MTYsOCBAQCBzdGF0aWMg
aW50IGFkYzVfb2ZfeGxhdGUoc3RydWN0IGlpb19kZXYgKmluZGlvX2RldiwKIAlyZXR1cm4gLUVJ
TlZBTDsKIH0KIAotc3RhdGljIGludCBhZGM3X29mX3hsYXRlKHN0cnVjdCBpaW9fZGV2ICppbmRp
b19kZXYsCi0JCQkJY29uc3Qgc3RydWN0IG9mX3BoYW5kbGVfYXJncyAqaWlvc3BlYykKK3N0YXRp
YyBpbnQgYWRjN19md25vZGVfeGxhdGUoc3RydWN0IGlpb19kZXYgKmluZGlvX2RldiwKKwkJCSAg
ICAgY29uc3Qgc3RydWN0IGZ3bm9kZV9yZWZlcmVuY2VfYXJncyAqaWlvc3BlYykKIHsKIAlzdHJ1
Y3QgYWRjNV9jaGlwICphZGMgPSBpaW9fcHJpdihpbmRpb19kZXYpOwogCWludCBpLCB2X2NoYW5u
ZWw7CkBAIC00ODEsMTIgKzQ4MSwxMiBAQCBzdGF0aWMgaW50IGFkYzdfcmVhZF9yYXcoc3RydWN0
IGlpb19kZXYgKmluZGlvX2RldiwKIAogc3RhdGljIGNvbnN0IHN0cnVjdCBpaW9faW5mbyBhZGM1
X2luZm8gPSB7CiAJLnJlYWRfcmF3ID0gYWRjNV9yZWFkX3JhdywKLQkub2ZfeGxhdGUgPSBhZGM1
X29mX3hsYXRlLAorCS5md25vZGVfeGxhdGUgPSBhZGM1X2Z3bm9kZV94bGF0ZSwKIH07CiAKIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgaWlvX2luZm8gYWRjN19pbmZvID0gewogCS5yZWFkX3JhdyA9IGFk
YzdfcmVhZF9yYXcsCi0JLm9mX3hsYXRlID0gYWRjN19vZl94bGF0ZSwKKwkuZndub2RlX3hsYXRl
ID0gYWRjN19md25vZGVfeGxhdGUsCiB9OwogCiBzdHJ1Y3QgYWRjNV9jaGFubmVscyB7CkBAIC02
MTEsMTggKzYxMSwxOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGFkYzVfY2hhbm5lbHMgYWRjNV9j
aGFuc19yZXYyW0FEQzVfTUFYX0NIQU5ORUxdID0gewogCQkJCQlTQ0FMRV9IV19DQUxJQl9USEVS
TV8xMDBLX1BVTExVUCkKIH07CiAKLXN0YXRpYyBpbnQgYWRjNV9nZXRfZHRfY2hhbm5lbF9kYXRh
KHN0cnVjdCBhZGM1X2NoaXAgKmFkYywKK3N0YXRpYyBpbnQgYWRjNV9nZXRfZndfY2hhbm5lbF9k
YXRhKHN0cnVjdCBhZGM1X2NoaXAgKmFkYywKIAkJCQkgICAgc3RydWN0IGFkYzVfY2hhbm5lbF9w
cm9wICpwcm9wLAotCQkJCSAgICBzdHJ1Y3QgZGV2aWNlX25vZGUgKm5vZGUsCisJCQkJICAgIHN0
cnVjdCBmd25vZGVfaGFuZGxlICpmd25vZGUsCiAJCQkJICAgIGNvbnN0IHN0cnVjdCBhZGM1X2Rh
dGEgKmRhdGEpCiB7Ci0JY29uc3QgY2hhciAqbmFtZSA9IG5vZGUtPm5hbWUsICpjaGFubmVsX25h
bWU7CisJY29uc3QgY2hhciAqbmFtZSA9IGZ3bm9kZV9nZXRfbmFtZShmd25vZGUpLCAqY2hhbm5l
bF9uYW1lOwogCXUzMiBjaGFuLCB2YWx1ZSwgdmFyclsyXTsKIAl1MzIgc2lkID0gMDsKIAlpbnQg
cmV0OwogCXN0cnVjdCBkZXZpY2UgKmRldiA9IGFkYy0+ZGV2OwogCi0JcmV0ID0gb2ZfcHJvcGVy
dHlfcmVhZF91MzIobm9kZSwgInJlZyIsICZjaGFuKTsKKwlyZXQgPSBmd25vZGVfcHJvcGVydHlf
cmVhZF91MzIoZndub2RlLCAicmVnIiwgJmNoYW4pOwogCWlmIChyZXQpIHsKIAkJZGV2X2Vycihk
ZXYsICJpbnZhbGlkIGNoYW5uZWwgbnVtYmVyICVzXG4iLCBuYW1lKTsKIAkJcmV0dXJuIHJldDsK
QEAgLTY0NywxNSArNjQ3LDEzIEBAIHN0YXRpYyBpbnQgYWRjNV9nZXRfZHRfY2hhbm5lbF9kYXRh
KHN0cnVjdCBhZGM1X2NoaXAgKmFkYywKIAlwcm9wLT5jaGFubmVsID0gY2hhbjsKIAlwcm9wLT5z
aWQgPSBzaWQ7CiAKLQljaGFubmVsX25hbWUgPSBvZl9nZXRfcHJvcGVydHkobm9kZSwKLQkJCQki
bGFiZWwiLCBOVUxMKSA/IDogbm9kZS0+bmFtZTsKLQlpZiAoIWNoYW5uZWxfbmFtZSkgewotCQlk
ZXZfZXJyKGRldiwgIkludmFsaWQgY2hhbm5lbCBuYW1lXG4iKTsKLQkJcmV0dXJuIC1FSU5WQUw7
Ci0JfQorCXJldCA9IGZ3bm9kZV9wcm9wZXJ0eV9yZWFkX3N0cmluZyhmd25vZGUsICJsYWJlbCIs
ICZjaGFubmVsX25hbWUpOworCWlmIChyZXQpCisJCWNoYW5uZWxfbmFtZSA9IG5hbWU7CisKIAlw
cm9wLT5kYXRhc2hlZXRfbmFtZSA9IGNoYW5uZWxfbmFtZTsKIAotCXJldCA9IG9mX3Byb3BlcnR5
X3JlYWRfdTMyKG5vZGUsICJxY29tLGRlY2ltYXRpb24iLCAmdmFsdWUpOworCXJldCA9IGZ3bm9k
ZV9wcm9wZXJ0eV9yZWFkX3UzMihmd25vZGUsICJxY29tLGRlY2ltYXRpb24iLCAmdmFsdWUpOwog
CWlmICghcmV0KSB7CiAJCXJldCA9IHFjb21fYWRjNV9kZWNpbWF0aW9uX2Zyb21fZHQodmFsdWUs
IGRhdGEtPmRlY2ltYXRpb24pOwogCQlpZiAocmV0IDwgMCkgewpAQCAtNjY4LDcgKzY2Niw3IEBA
IHN0YXRpYyBpbnQgYWRjNV9nZXRfZHRfY2hhbm5lbF9kYXRhKHN0cnVjdCBhZGM1X2NoaXAgKmFk
YywKIAkJcHJvcC0+ZGVjaW1hdGlvbiA9IEFEQzVfREVDSU1BVElPTl9ERUZBVUxUOwogCX0KIAot
CXJldCA9IG9mX3Byb3BlcnR5X3JlYWRfdTMyX2FycmF5KG5vZGUsICJxY29tLHByZS1zY2FsaW5n
IiwgdmFyciwgMik7CisJcmV0ID0gZndub2RlX3Byb3BlcnR5X3JlYWRfdTMyX2FycmF5KGZ3bm9k
ZSwgInFjb20scHJlLXNjYWxpbmciLCB2YXJyLCAyKTsKIAlpZiAoIXJldCkgewogCQlyZXQgPSBx
Y29tX2FkYzVfcHJlc2NhbGluZ19mcm9tX2R0KHZhcnJbMF0sIHZhcnJbMV0pOwogCQlpZiAocmV0
IDwgMCkgewpAQCAtNjgyLDcgKzY4MCw3IEBAIHN0YXRpYyBpbnQgYWRjNV9nZXRfZHRfY2hhbm5l
bF9kYXRhKHN0cnVjdCBhZGM1X2NoaXAgKmFkYywKIAkJCWFkYy0+ZGF0YS0+YWRjX2NoYW5zW3By
b3AtPmNoYW5uZWxdLnByZXNjYWxlX2luZGV4OwogCX0KIAotCXJldCA9IG9mX3Byb3BlcnR5X3Jl
YWRfdTMyKG5vZGUsICJxY29tLGh3LXNldHRsZS10aW1lIiwgJnZhbHVlKTsKKwlyZXQgPSBmd25v
ZGVfcHJvcGVydHlfcmVhZF91MzIoZndub2RlLCAicWNvbSxody1zZXR0bGUtdGltZSIsICZ2YWx1
ZSk7CiAJaWYgKCFyZXQpIHsKIAkJdTggZGlnX3ZlcnNpb25bMl07CiAKQEAgLTcxMyw3ICs3MTEs
NyBAQCBzdGF0aWMgaW50IGFkYzVfZ2V0X2R0X2NoYW5uZWxfZGF0YShzdHJ1Y3QgYWRjNV9jaGlw
ICphZGMsCiAJCXByb3AtPmh3X3NldHRsZV90aW1lID0gVkFEQ19ERUZfSFdfU0VUVExFX1RJTUU7
CiAJfQogCi0JcmV0ID0gb2ZfcHJvcGVydHlfcmVhZF91MzIobm9kZSwgInFjb20sYXZnLXNhbXBs
ZXMiLCAmdmFsdWUpOworCXJldCA9IGZ3bm9kZV9wcm9wZXJ0eV9yZWFkX3UzMihmd25vZGUsICJx
Y29tLGF2Zy1zYW1wbGVzIiwgJnZhbHVlKTsKIAlpZiAoIXJldCkgewogCQlyZXQgPSBxY29tX2Fk
YzVfYXZnX3NhbXBsZXNfZnJvbV9kdCh2YWx1ZSk7CiAJCWlmIChyZXQgPCAwKSB7CkBAIC03MjYs
NyArNzI0LDcgQEAgc3RhdGljIGludCBhZGM1X2dldF9kdF9jaGFubmVsX2RhdGEoc3RydWN0IGFk
YzVfY2hpcCAqYWRjLAogCQlwcm9wLT5hdmdfc2FtcGxlcyA9IFZBRENfREVGX0FWR19TQU1QTEVT
OwogCX0KIAotCWlmIChvZl9wcm9wZXJ0eV9yZWFkX2Jvb2wobm9kZSwgInFjb20scmF0aW9tZXRy
aWMiKSkKKwlpZiAoZndub2RlX3Byb3BlcnR5X3JlYWRfYm9vbChmd25vZGUsICJxY29tLHJhdGlv
bWV0cmljIikpCiAJCXByb3AtPmNhbF9tZXRob2QgPSBBREM1X1JBVElPTUVUUklDX0NBTDsKIAll
bHNlCiAJCXByb3AtPmNhbF9tZXRob2QgPSBBREM1X0FCU09MVVRFX0NBTDsKQEAgLTgwMSwxNiAr
Nzk5LDE2IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIGFkYzVfbWF0Y2hfdGFi
bGVbXSA9IHsKIH07CiBNT0RVTEVfREVWSUNFX1RBQkxFKG9mLCBhZGM1X21hdGNoX3RhYmxlKTsK
IAotc3RhdGljIGludCBhZGM1X2dldF9kdF9kYXRhKHN0cnVjdCBhZGM1X2NoaXAgKmFkYywgc3Ry
dWN0IGRldmljZV9ub2RlICpub2RlKQorc3RhdGljIGludCBhZGM1X2dldF9md19kYXRhKHN0cnVj
dCBhZGM1X2NoaXAgKmFkYykKIHsKIAljb25zdCBzdHJ1Y3QgYWRjNV9jaGFubmVscyAqYWRjX2No
YW47CiAJc3RydWN0IGlpb19jaGFuX3NwZWMgKmlpb19jaGFuOwogCXN0cnVjdCBhZGM1X2NoYW5u
ZWxfcHJvcCBwcm9wLCAqY2hhbl9wcm9wczsKLQlzdHJ1Y3QgZGV2aWNlX25vZGUgKmNoaWxkOwor
CXN0cnVjdCBmd25vZGVfaGFuZGxlICpjaGlsZDsKIAl1bnNpZ25lZCBpbnQgaW5kZXggPSAwOwog
CWludCByZXQ7CiAKLQlhZGMtPm5jaGFubmVscyA9IG9mX2dldF9hdmFpbGFibGVfY2hpbGRfY291
bnQobm9kZSk7CisJYWRjLT5uY2hhbm5lbHMgPSBkZXZpY2VfZ2V0X2NoaWxkX25vZGVfY291bnQo
YWRjLT5kZXYpOwogCWlmICghYWRjLT5uY2hhbm5lbHMpCiAJCXJldHVybiAtRUlOVkFMOwogCkBA
IC04MjYsMTQgKzgyNCwxNCBAQCBzdGF0aWMgaW50IGFkYzVfZ2V0X2R0X2RhdGEoc3RydWN0IGFk
YzVfY2hpcCAqYWRjLCBzdHJ1Y3QgZGV2aWNlX25vZGUgKm5vZGUpCiAKIAljaGFuX3Byb3BzID0g
YWRjLT5jaGFuX3Byb3BzOwogCWlpb19jaGFuID0gYWRjLT5paW9fY2hhbnM7Ci0JYWRjLT5kYXRh
ID0gb2ZfZGV2aWNlX2dldF9tYXRjaF9kYXRhKGFkYy0+ZGV2KTsKKwlhZGMtPmRhdGEgPSBkZXZp
Y2VfZ2V0X21hdGNoX2RhdGEoYWRjLT5kZXYpOwogCWlmICghYWRjLT5kYXRhKQogCQlhZGMtPmRh
dGEgPSAmYWRjNV9kYXRhX3BtaWM7CiAKLQlmb3JfZWFjaF9hdmFpbGFibGVfY2hpbGRfb2Zfbm9k
ZShub2RlLCBjaGlsZCkgewotCQlyZXQgPSBhZGM1X2dldF9kdF9jaGFubmVsX2RhdGEoYWRjLCAm
cHJvcCwgY2hpbGQsIGFkYy0+ZGF0YSk7CisJZGV2aWNlX2Zvcl9lYWNoX2NoaWxkX25vZGUoYWRj
LT5kZXYsIGNoaWxkKSB7CisJCXJldCA9IGFkYzVfZ2V0X2Z3X2NoYW5uZWxfZGF0YShhZGMsICZw
cm9wLCBjaGlsZCwgYWRjLT5kYXRhKTsKIAkJaWYgKHJldCkgewotCQkJb2Zfbm9kZV9wdXQoY2hp
bGQpOworCQkJZndub2RlX2hhbmRsZV9wdXQoY2hpbGQpOwogCQkJcmV0dXJuIHJldDsKIAkJfQog
CkBAIC04NTgsNyArODU2LDYgQEAgc3RhdGljIGludCBhZGM1X2dldF9kdF9kYXRhKHN0cnVjdCBh
ZGM1X2NoaXAgKmFkYywgc3RydWN0IGRldmljZV9ub2RlICpub2RlKQogCiBzdGF0aWMgaW50IGFk
YzVfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIHsKLQlzdHJ1Y3QgZGV2aWNl
X25vZGUgKm5vZGUgPSBwZGV2LT5kZXYub2Zfbm9kZTsKIAlzdHJ1Y3QgZGV2aWNlICpkZXYgPSAm
cGRldi0+ZGV2OwogCXN0cnVjdCBpaW9fZGV2ICppbmRpb19kZXY7CiAJc3RydWN0IGFkYzVfY2hp
cCAqYWRjOwpAQCAtODcwLDcgKzg2Nyw3IEBAIHN0YXRpYyBpbnQgYWRjNV9wcm9iZShzdHJ1Y3Qg
cGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCWlmICghcmVnbWFwKQogCQlyZXR1cm4gLUVOT0RFVjsK
IAotCXJldCA9IG9mX3Byb3BlcnR5X3JlYWRfdTMyKG5vZGUsICJyZWciLCAmcmVnKTsKKwlyZXQg
PSBkZXZpY2VfcHJvcGVydHlfcmVhZF91MzIoZGV2LCAicmVnIiwgJnJlZyk7CiAJaWYgKHJldCA8
IDApCiAJCXJldHVybiByZXQ7CiAKQEAgLTg4Niw3ICs4ODMsNyBAQCBzdGF0aWMgaW50IGFkYzVf
cHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlpbml0X2NvbXBsZXRpb24oJmFk
Yy0+Y29tcGxldGUpOwogCW11dGV4X2luaXQoJmFkYy0+bG9jayk7CiAKLQlyZXQgPSBhZGM1X2dl
dF9kdF9kYXRhKGFkYywgbm9kZSk7CisJcmV0ID0gYWRjNV9nZXRfZndfZGF0YShhZGMpOwogCWlm
IChyZXQpIHsKIAkJZGV2X2VycihkZXYsICJhZGMgZ2V0IGR0IGRhdGEgZmFpbGVkXG4iKTsKIAkJ
cmV0dXJuIHJldDsKLS0gCjIuMzYuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
