Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CAEC54603A
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Jun 2022 10:49:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0F1DDC6046D;
	Fri, 10 Jun 2022 08:49:42 +0000 (UTC)
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com
 [148.163.135.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9ECA4C60465
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jun 2022 08:49:40 +0000 (UTC)
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
 by mx0a-00128a01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25A5dbT8010601;
 Fri, 10 Jun 2022 04:48:55 -0400
Received: from nwd2mta4.analog.com ([137.71.173.58])
 by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3gm00mh27f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Jun 2022 04:48:55 -0400
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
 by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 25A8msCW027574
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL); 
 Fri, 10 Jun 2022 04:48:54 -0400
Received: from ASHBCASHYB5.ad.analog.com (10.64.17.133) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Fri, 10 Jun 2022 04:48:53 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by
 ASHBCASHYB5.ad.analog.com (10.64.17.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Fri, 10 Jun 2022 04:48:53 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Fri, 10 Jun 2022 04:48:53 -0400
Received: from nsa.ad.analog.com ([10.44.3.70])
 by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 25A8imiq014275;
 Fri, 10 Jun 2022 04:48:44 -0400
From: =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
To: <linux-imx@nxp.com>, <linux-renesas-soc@vger.kernel.org>,
 <linux-mips@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <chrome-platform@lists.linux.dev>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 <linux-mediatek@lists.infradead.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-msm@vger.kernel.org>, <linux-iio@vger.kernel.org>,
 <openbmc@lists.ozlabs.org>
Date: Fri, 10 Jun 2022 10:45:41 +0200
Message-ID: <20220610084545.547700-31-nuno.sa@analog.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220610084545.547700-1-nuno.sa@analog.com>
References: <20220610084545.547700-1-nuno.sa@analog.com>
MIME-Version: 1.0
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: 22N82qDX_fB9GEAylcW0NG6WBvVFVCLG
X-Proofpoint-GUID: 22N82qDX_fB9GEAylcW0NG6WBvVFVCLG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-10_02,2022-06-09_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=999 lowpriorityscore=0 suspectscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
Subject: [Linux-stm32] [PATCH 30/34] iio: adc: qcom-spmi-vadc: convert to
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
PgotLS0KIGRyaXZlcnMvaWlvL2FkYy9xY29tLXNwbWktdmFkYy5jIHwgNDQgKysrKysrKysrKysr
KysrKy0tLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspLCAy
MiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2lpby9hZGMvcWNvbS1zcG1pLXZh
ZGMuYyBiL2RyaXZlcnMvaWlvL2FkYy9xY29tLXNwbWktdmFkYy5jCmluZGV4IDM0MjAyYmE1MjQ2
OS4uYmNmZjBmNjJiNzBlIDEwMDY0NAotLS0gYS9kcml2ZXJzL2lpby9hZGMvcWNvbS1zcG1pLXZh
ZGMuYworKysgYi9kcml2ZXJzL2lpby9hZGMvcWNvbS1zcG1pLXZhZGMuYwpAQCAtMTMsOCArMTMs
OSBAQAogI2luY2x1ZGUgPGxpbnV4L2tlcm5lbC5oPgogI2luY2x1ZGUgPGxpbnV4L21hdGg2NC5o
PgogI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPgotI2luY2x1ZGUgPGxpbnV4L29mLmg+CisjaW5j
bHVkZSA8bGludXgvbW9kX2RldmljZXRhYmxlLmg+CiAjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1f
ZGV2aWNlLmg+CisjaW5jbHVkZSA8bGludXgvcHJvcGVydHkuaD4KICNpbmNsdWRlIDxsaW51eC9y
ZWdtYXAuaD4KICNpbmNsdWRlIDxsaW51eC9zbGFiLmg+CiAjaW5jbHVkZSA8bGludXgvbG9nMi5o
PgpAQCAtNDgxLDggKzQ4Miw4IEBAIHN0YXRpYyBpbnQgdmFkY19yZWFkX3JhdyhzdHJ1Y3QgaWlv
X2RldiAqaW5kaW9fZGV2LAogCXJldHVybiByZXQ7CiB9CiAKLXN0YXRpYyBpbnQgdmFkY19vZl94
bGF0ZShzdHJ1Y3QgaWlvX2RldiAqaW5kaW9fZGV2LAotCQkJIGNvbnN0IHN0cnVjdCBvZl9waGFu
ZGxlX2FyZ3MgKmlpb3NwZWMpCitzdGF0aWMgaW50IHZhZGNfZndub2RlX3hsYXRlKHN0cnVjdCBp
aW9fZGV2ICppbmRpb19kZXYsCisJCQkgICAgIGNvbnN0IHN0cnVjdCBmd25vZGVfcmVmZXJlbmNl
X2FyZ3MgKmlpb3NwZWMpCiB7CiAJc3RydWN0IHZhZGNfcHJpdiAqdmFkYyA9IGlpb19wcml2KGlu
ZGlvX2Rldik7CiAJdW5zaWduZWQgaW50IGk7CkBAIC00OTYsNyArNDk3LDcgQEAgc3RhdGljIGlu
dCB2YWRjX29mX3hsYXRlKHN0cnVjdCBpaW9fZGV2ICppbmRpb19kZXYsCiAKIHN0YXRpYyBjb25z
dCBzdHJ1Y3QgaWlvX2luZm8gdmFkY19pbmZvID0gewogCS5yZWFkX3JhdyA9IHZhZGNfcmVhZF9y
YXcsCi0JLm9mX3hsYXRlID0gdmFkY19vZl94bGF0ZSwKKwkuZndub2RlX3hsYXRlID0gdmFkY19m
d25vZGVfeGxhdGUsCiB9OwogCiBzdHJ1Y3QgdmFkY19jaGFubmVscyB7CkBAIC02NDcsMTUgKzY0
OCwxNSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHZhZGNfY2hhbm5lbHMgdmFkY19jaGFuc1tdID0g
ewogCVZBRENfQ0hBTl9OT19TQ0FMRShMUl9NVVgzX0JVRl9QVTFfUFUyX1hPX1RIRVJNLCAwKQog
fTsKIAotc3RhdGljIGludCB2YWRjX2dldF9kdF9jaGFubmVsX2RhdGEoc3RydWN0IGRldmljZSAq
ZGV2LAorc3RhdGljIGludCB2YWRjX2dldF9md19jaGFubmVsX2RhdGEoc3RydWN0IGRldmljZSAq
ZGV2LAogCQkJCSAgICBzdHJ1Y3QgdmFkY19jaGFubmVsX3Byb3AgKnByb3AsCi0JCQkJICAgIHN0
cnVjdCBkZXZpY2Vfbm9kZSAqbm9kZSkKKwkJCQkgICAgc3RydWN0IGZ3bm9kZV9oYW5kbGUgKmZ3
bm9kZSkKIHsKLQljb25zdCBjaGFyICpuYW1lID0gbm9kZS0+bmFtZTsKKwljb25zdCBjaGFyICpu
YW1lID0gZndub2RlX2dldF9uYW1lKGZ3bm9kZSk7CiAJdTMyIGNoYW4sIHZhbHVlLCB2YXJyWzJd
OwogCWludCByZXQ7CiAKLQlyZXQgPSBvZl9wcm9wZXJ0eV9yZWFkX3UzMihub2RlLCAicmVnIiwg
JmNoYW4pOworCXJldCA9IGZ3bm9kZV9wcm9wZXJ0eV9yZWFkX3UzMihmd25vZGUsICJyZWciLCAm
Y2hhbik7CiAJaWYgKHJldCkgewogCQlkZXZfZXJyKGRldiwgImludmFsaWQgY2hhbm5lbCBudW1i
ZXIgJXNcbiIsIG5hbWUpOwogCQlyZXR1cm4gcmV0OwpAQCAtNjY5LDcgKzY3MCw3IEBAIHN0YXRp
YyBpbnQgdmFkY19nZXRfZHRfY2hhbm5lbF9kYXRhKHN0cnVjdCBkZXZpY2UgKmRldiwKIAkvKiB0
aGUgY2hhbm5lbCBoYXMgRFQgZGVzY3JpcHRpb24gKi8KIAlwcm9wLT5jaGFubmVsID0gY2hhbjsK
IAotCXJldCA9IG9mX3Byb3BlcnR5X3JlYWRfdTMyKG5vZGUsICJxY29tLGRlY2ltYXRpb24iLCAm
dmFsdWUpOworCXJldCA9IGZ3bm9kZV9wcm9wZXJ0eV9yZWFkX3UzMihmd25vZGUsICJxY29tLGRl
Y2ltYXRpb24iLCAmdmFsdWUpOwogCWlmICghcmV0KSB7CiAJCXJldCA9IHFjb21fdmFkY19kZWNp
bWF0aW9uX2Zyb21fZHQodmFsdWUpOwogCQlpZiAocmV0IDwgMCkgewpAQCAtNjgyLDcgKzY4Myw3
IEBAIHN0YXRpYyBpbnQgdmFkY19nZXRfZHRfY2hhbm5lbF9kYXRhKHN0cnVjdCBkZXZpY2UgKmRl
diwKIAkJcHJvcC0+ZGVjaW1hdGlvbiA9IFZBRENfREVGX0RFQ0lNQVRJT047CiAJfQogCi0JcmV0
ID0gb2ZfcHJvcGVydHlfcmVhZF91MzJfYXJyYXkobm9kZSwgInFjb20scHJlLXNjYWxpbmciLCB2
YXJyLCAyKTsKKwlyZXQgPSBmd25vZGVfcHJvcGVydHlfcmVhZF91MzJfYXJyYXkoZndub2RlLCAi
cWNvbSxwcmUtc2NhbGluZyIsIHZhcnIsIDIpOwogCWlmICghcmV0KSB7CiAJCXJldCA9IHZhZGNf
cHJlc2NhbGluZ19mcm9tX2R0KHZhcnJbMF0sIHZhcnJbMV0pOwogCQlpZiAocmV0IDwgMCkgewpA
QCAtNjk1LDcgKzY5Niw3IEBAIHN0YXRpYyBpbnQgdmFkY19nZXRfZHRfY2hhbm5lbF9kYXRhKHN0
cnVjdCBkZXZpY2UgKmRldiwKIAkJcHJvcC0+cHJlc2NhbGUgPSB2YWRjX2NoYW5zW3Byb3AtPmNo
YW5uZWxdLnByZXNjYWxlX2luZGV4OwogCX0KIAotCXJldCA9IG9mX3Byb3BlcnR5X3JlYWRfdTMy
KG5vZGUsICJxY29tLGh3LXNldHRsZS10aW1lIiwgJnZhbHVlKTsKKwlyZXQgPSBmd25vZGVfcHJv
cGVydHlfcmVhZF91MzIoZndub2RlLCAicWNvbSxody1zZXR0bGUtdGltZSIsICZ2YWx1ZSk7CiAJ
aWYgKCFyZXQpIHsKIAkJcmV0ID0gdmFkY19od19zZXR0bGVfdGltZV9mcm9tX2R0KHZhbHVlKTsK
IAkJaWYgKHJldCA8IDApIHsKQEAgLTcwOCw3ICs3MDksNyBAQCBzdGF0aWMgaW50IHZhZGNfZ2V0
X2R0X2NoYW5uZWxfZGF0YShzdHJ1Y3QgZGV2aWNlICpkZXYsCiAJCXByb3AtPmh3X3NldHRsZV90
aW1lID0gVkFEQ19ERUZfSFdfU0VUVExFX1RJTUU7CiAJfQogCi0JcmV0ID0gb2ZfcHJvcGVydHlf
cmVhZF91MzIobm9kZSwgInFjb20sYXZnLXNhbXBsZXMiLCAmdmFsdWUpOworCXJldCA9IGZ3bm9k
ZV9wcm9wZXJ0eV9yZWFkX3UzMihmd25vZGUsICJxY29tLGF2Zy1zYW1wbGVzIiwgJnZhbHVlKTsK
IAlpZiAoIXJldCkgewogCQlyZXQgPSB2YWRjX2F2Z19zYW1wbGVzX2Zyb21fZHQodmFsdWUpOwog
CQlpZiAocmV0IDwgMCkgewpAQCAtNzIxLDcgKzcyMiw3IEBAIHN0YXRpYyBpbnQgdmFkY19nZXRf
ZHRfY2hhbm5lbF9kYXRhKHN0cnVjdCBkZXZpY2UgKmRldiwKIAkJcHJvcC0+YXZnX3NhbXBsZXMg
PSBWQURDX0RFRl9BVkdfU0FNUExFUzsKIAl9CiAKLQlpZiAob2ZfcHJvcGVydHlfcmVhZF9ib29s
KG5vZGUsICJxY29tLHJhdGlvbWV0cmljIikpCisJaWYgKGZ3bm9kZV9wcm9wZXJ0eV9yZWFkX2Jv
b2woZndub2RlLCAicWNvbSxyYXRpb21ldHJpYyIpKQogCQlwcm9wLT5jYWxpYnJhdGlvbiA9IFZB
RENfQ0FMSUJfUkFUSU9NRVRSSUM7CiAJZWxzZQogCQlwcm9wLT5jYWxpYnJhdGlvbiA9IFZBRENf
Q0FMSUJfQUJTT0xVVEU7CkBAIC03MzEsMTYgKzczMiwxNiBAQCBzdGF0aWMgaW50IHZhZGNfZ2V0
X2R0X2NoYW5uZWxfZGF0YShzdHJ1Y3QgZGV2aWNlICpkZXYsCiAJcmV0dXJuIDA7CiB9CiAKLXN0
YXRpYyBpbnQgdmFkY19nZXRfZHRfZGF0YShzdHJ1Y3QgdmFkY19wcml2ICp2YWRjLCBzdHJ1Y3Qg
ZGV2aWNlX25vZGUgKm5vZGUpCitzdGF0aWMgaW50IHZhZGNfZ2V0X2Z3X2RhdGEoc3RydWN0IHZh
ZGNfcHJpdiAqdmFkYykKIHsKIAljb25zdCBzdHJ1Y3QgdmFkY19jaGFubmVscyAqdmFkY19jaGFu
OwogCXN0cnVjdCBpaW9fY2hhbl9zcGVjICppaW9fY2hhbjsKIAlzdHJ1Y3QgdmFkY19jaGFubmVs
X3Byb3AgcHJvcDsKLQlzdHJ1Y3QgZGV2aWNlX25vZGUgKmNoaWxkOworCXN0cnVjdCBmd25vZGVf
aGFuZGxlICpjaGlsZDsKIAl1bnNpZ25lZCBpbnQgaW5kZXggPSAwOwogCWludCByZXQ7CiAKLQl2
YWRjLT5uY2hhbm5lbHMgPSBvZl9nZXRfYXZhaWxhYmxlX2NoaWxkX2NvdW50KG5vZGUpOworCXZh
ZGMtPm5jaGFubmVscyA9IGRldmljZV9nZXRfY2hpbGRfbm9kZV9jb3VudCh2YWRjLT5kZXYpOwog
CWlmICghdmFkYy0+bmNoYW5uZWxzKQogCQlyZXR1cm4gLUVJTlZBTDsKIApAQCAtNzU2LDEwICs3
NTcsMTAgQEAgc3RhdGljIGludCB2YWRjX2dldF9kdF9kYXRhKHN0cnVjdCB2YWRjX3ByaXYgKnZh
ZGMsIHN0cnVjdCBkZXZpY2Vfbm9kZSAqbm9kZSkKIAogCWlpb19jaGFuID0gdmFkYy0+aWlvX2No
YW5zOwogCi0JZm9yX2VhY2hfYXZhaWxhYmxlX2NoaWxkX29mX25vZGUobm9kZSwgY2hpbGQpIHsK
LQkJcmV0ID0gdmFkY19nZXRfZHRfY2hhbm5lbF9kYXRhKHZhZGMtPmRldiwgJnByb3AsIGNoaWxk
KTsKKwlkZXZpY2VfZm9yX2VhY2hfY2hpbGRfbm9kZSh2YWRjLT5kZXYsIGNoaWxkKSB7CisJCXJl
dCA9IHZhZGNfZ2V0X2Z3X2NoYW5uZWxfZGF0YSh2YWRjLT5kZXYsICZwcm9wLCBjaGlsZCk7CiAJ
CWlmIChyZXQpIHsKLQkJCW9mX25vZGVfcHV0KGNoaWxkKTsKKwkJCWZ3bm9kZV9oYW5kbGVfcHV0
KGNoaWxkKTsKIAkJCXJldHVybiByZXQ7CiAJCX0KIApAQCAtODQ4LDcgKzg0OSw2IEBAIHN0YXRp
YyBpbnQgdmFkY19jaGVja19yZXZpc2lvbihzdHJ1Y3QgdmFkY19wcml2ICp2YWRjKQogCiBzdGF0
aWMgaW50IHZhZGNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIHsKLQlzdHJ1
Y3QgZGV2aWNlX25vZGUgKm5vZGUgPSBwZGV2LT5kZXYub2Zfbm9kZTsKIAlzdHJ1Y3QgZGV2aWNl
ICpkZXYgPSAmcGRldi0+ZGV2OwogCXN0cnVjdCBpaW9fZGV2ICppbmRpb19kZXY7CiAJc3RydWN0
IHZhZGNfcHJpdiAqdmFkYzsKQEAgLTg2MCw3ICs4NjAsNyBAQCBzdGF0aWMgaW50IHZhZGNfcHJv
YmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlpZiAoIXJlZ21hcCkKIAkJcmV0dXJu
IC1FTk9ERVY7CiAKLQlyZXQgPSBvZl9wcm9wZXJ0eV9yZWFkX3UzMihub2RlLCAicmVnIiwgJnJl
Zyk7CisJcmV0ID0gZGV2aWNlX3Byb3BlcnR5X3JlYWRfdTMyKGRldiwgInJlZyIsICZyZWcpOwog
CWlmIChyZXQgPCAwKQogCQlyZXR1cm4gcmV0OwogCkBAIC04ODAsNyArODgwLDcgQEAgc3RhdGlj
IGludCB2YWRjX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJaWYgKHJldCkK
IAkJcmV0dXJuIHJldDsKIAotCXJldCA9IHZhZGNfZ2V0X2R0X2RhdGEodmFkYywgbm9kZSk7CisJ
cmV0ID0gdmFkY19nZXRfZndfZGF0YSh2YWRjKTsKIAlpZiAocmV0KQogCQlyZXR1cm4gcmV0Owog
Ci0tIAoyLjM2LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
