Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 208FC54601C
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Jun 2022 10:49:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D983BC6047C;
	Fri, 10 Jun 2022 08:49:32 +0000 (UTC)
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com
 [148.163.135.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 90072C60465
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jun 2022 08:49:31 +0000 (UTC)
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
 by mx0a-00128a01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25A7WKNi005267;
 Fri, 10 Jun 2022 04:48:43 -0400
Received: from nwd2mta3.analog.com ([137.71.173.56])
 by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3ghq33kqcr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Jun 2022 04:48:43 -0400
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
 by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 25A8mgdK023311
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL); 
 Fri, 10 Jun 2022 04:48:42 -0400
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX9.ad.analog.com (10.64.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Fri, 10 Jun 2022 04:48:41 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Fri, 10 Jun 2022 04:48:41 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Fri, 10 Jun 2022 04:48:41 -0400
Received: from nsa.ad.analog.com ([10.44.3.70])
 by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 25A8imio014275;
 Fri, 10 Jun 2022 04:48:31 -0400
From: =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
To: <linux-imx@nxp.com>, <linux-renesas-soc@vger.kernel.org>,
 <linux-mips@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <chrome-platform@lists.linux.dev>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 <linux-mediatek@lists.infradead.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-msm@vger.kernel.org>, <linux-iio@vger.kernel.org>,
 <openbmc@lists.ozlabs.org>
Date: Fri, 10 Jun 2022 10:45:39 +0200
Message-ID: <20220610084545.547700-29-nuno.sa@analog.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220610084545.547700-1-nuno.sa@analog.com>
References: <20220610084545.547700-1-nuno.sa@analog.com>
MIME-Version: 1.0
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: 9rClPBikqow13Q6rIolowiZYQvRQbT2V
X-Proofpoint-GUID: 9rClPBikqow13Q6rIolowiZYQvRQbT2V
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
Subject: [Linux-stm32] [PATCH 28/34] iio: adc: at91-sama5d2_adc: convert to
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
PgotLS0KIGRyaXZlcnMvaWlvL2FkYy9hdDkxLXNhbWE1ZDJfYWRjLmMgfCAzMCArKysrKysrKysr
KysrKystLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCAx
NSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2lpby9hZGMvYXQ5MS1zYW1hNWQy
X2FkYy5jIGIvZHJpdmVycy9paW8vYWRjL2F0OTEtc2FtYTVkMl9hZGMuYwppbmRleCBiNzY0ODIz
Y2U1N2UuLmY1YTFkZjE5ZTViNiAxMDA2NDQKLS0tIGEvZHJpdmVycy9paW8vYWRjL2F0OTEtc2Ft
YTVkMl9hZGMuYworKysgYi9kcml2ZXJzL2lpby9hZGMvYXQ5MS1zYW1hNWQyX2FkYy5jCkBAIC0x
Niw4ICsxNiw5IEBACiAjaW5jbHVkZSA8bGludXgvaW50ZXJydXB0Lmg+CiAjaW5jbHVkZSA8bGlu
dXgvaW8uaD4KICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4KLSNpbmNsdWRlIDxsaW51eC9vZl9k
ZXZpY2UuaD4KKyNpbmNsdWRlIDxsaW51eC9tb2RfZGV2aWNldGFibGUuaD4KICNpbmNsdWRlIDxs
aW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4KKyNpbmNsdWRlIDxsaW51eC9wcm9wZXJ0eS5oPgogI2lu
Y2x1ZGUgPGxpbnV4L3NjaGVkLmg+CiAjaW5jbHVkZSA8bGludXgvd2FpdC5oPgogI2luY2x1ZGUg
PGxpbnV4L2lpby9paW8uaD4KQEAgLTY1MCw4ICs2NTEsOCBAQCBhdDkxX2FkY19jaGFuX2dldChz
dHJ1Y3QgaWlvX2RldiAqaW5kaW9fZGV2LCBpbnQgY2hhbikKIAlyZXR1cm4gaW5kaW9fZGV2LT5j
aGFubmVscyArIGluZGV4OwogfQogCi1zdGF0aWMgaW5saW5lIGludCBhdDkxX2FkY19vZl94bGF0
ZShzdHJ1Y3QgaWlvX2RldiAqaW5kaW9fZGV2LAotCQkJCSAgICBjb25zdCBzdHJ1Y3Qgb2ZfcGhh
bmRsZV9hcmdzICppaW9zcGVjKQorc3RhdGljIGlubGluZSBpbnQgYXQ5MV9hZGNfZndub2RlX3hs
YXRlKHN0cnVjdCBpaW9fZGV2ICppbmRpb19kZXYsCisJCQkJCWNvbnN0IHN0cnVjdCBmd25vZGVf
cmVmZXJlbmNlX2FyZ3MgKmlpb3NwZWMpCiB7CiAJcmV0dXJuIGF0OTFfYWRjX2NoYW5feGxhdGUo
aW5kaW9fZGV2LCBpaW9zcGVjLT5hcmdzWzBdKTsKIH0KQEAgLTE4NzYsNyArMTg3Nyw3IEBAIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgaWlvX2luZm8gYXQ5MV9hZGNfaW5mbyA9IHsKIAkucmVhZF9yYXcg
PSAmYXQ5MV9hZGNfcmVhZF9yYXcsCiAJLndyaXRlX3JhdyA9ICZhdDkxX2FkY193cml0ZV9yYXcs
CiAJLnVwZGF0ZV9zY2FuX21vZGUgPSAmYXQ5MV9hZGNfdXBkYXRlX3NjYW5fbW9kZSwKLQkub2Zf
eGxhdGUgPSAmYXQ5MV9hZGNfb2ZfeGxhdGUsCisJLmZ3bm9kZV94bGF0ZSA9ICZhdDkxX2FkY19m
d25vZGVfeGxhdGUsCiAJLmh3Zmlmb19zZXRfd2F0ZXJtYXJrID0gJmF0OTFfYWRjX3NldF93YXRl
cm1hcmssCiB9OwogCkBAIC0xOTIwLDYgKzE5MjEsNyBAQCBzdGF0aWMgaW50IGF0OTFfYWRjX2J1
ZmZlcl9hbmRfdHJpZ2dlcl9pbml0KHN0cnVjdCBkZXZpY2UgKmRldiwKIAogc3RhdGljIGludCBh
dDkxX2FkY19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogeworCXN0cnVjdCBk
ZXZpY2UgKmRldiA9ICZwZGV2LT5kZXY7CiAJc3RydWN0IGlpb19kZXYgKmluZGlvX2RldjsKIAlz
dHJ1Y3QgYXQ5MV9hZGNfc3RhdGUgKnN0OwogCXN0cnVjdCByZXNvdXJjZQkqcmVzOwpAQCAtMTkz
Myw3ICsxOTM1LDcgQEAgc3RhdGljIGludCBhdDkxX2FkY19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1f
ZGV2aWNlICpwZGV2KQogCXN0ID0gaWlvX3ByaXYoaW5kaW9fZGV2KTsKIAlzdC0+aW5kaW9fZGV2
ID0gaW5kaW9fZGV2OwogCi0Jc3QtPnNvY19pbmZvLnBsYXRmb3JtID0gb2ZfZGV2aWNlX2dldF9t
YXRjaF9kYXRhKCZwZGV2LT5kZXYpOworCXN0LT5zb2NfaW5mby5wbGF0Zm9ybSA9IGRldmljZV9n
ZXRfbWF0Y2hfZGF0YShkZXYpOwogCiAJaW5kaW9fZGV2LT5uYW1lID0gZGV2X25hbWUoJnBkZXYt
PmRldik7CiAJaW5kaW9fZGV2LT5tb2RlcyA9IElORElPX0RJUkVDVF9NT0RFIHwgSU5ESU9fQlVG
RkVSX1NPRlRXQVJFOwpAQCAtMTk1MCwzNCArMTk1MiwzMiBAQCBzdGF0aWMgaW50IGF0OTFfYWRj
X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAKIAlzdC0+b3ZlcnNhbXBsaW5n
X3JhdGlvID0gQVQ5MV9PU1JfMVNBTVBMRVM7CiAKLQlyZXQgPSBvZl9wcm9wZXJ0eV9yZWFkX3Uz
MihwZGV2LT5kZXYub2Zfbm9kZSwKLQkJCQkgICAiYXRtZWwsbWluLXNhbXBsZS1yYXRlLWh6IiwK
LQkJCQkgICAmc3QtPnNvY19pbmZvLm1pbl9zYW1wbGVfcmF0ZSk7CisJcmV0ID0gZGV2aWNlX3By
b3BlcnR5X3JlYWRfdTMyKGRldiwgImF0bWVsLG1pbi1zYW1wbGUtcmF0ZS1oeiIsCisJCQkJICAg
ICAgICZzdC0+c29jX2luZm8ubWluX3NhbXBsZV9yYXRlKTsKIAlpZiAocmV0KSB7CiAJCWRldl9l
cnIoJnBkZXYtPmRldiwKIAkJCSJpbnZhbGlkIG9yIG1pc3NpbmcgdmFsdWUgZm9yIGF0bWVsLG1p
bi1zYW1wbGUtcmF0ZS1oelxuIik7CiAJCXJldHVybiByZXQ7CiAJfQogCi0JcmV0ID0gb2ZfcHJv
cGVydHlfcmVhZF91MzIocGRldi0+ZGV2Lm9mX25vZGUsCi0JCQkJICAgImF0bWVsLG1heC1zYW1w
bGUtcmF0ZS1oeiIsCi0JCQkJICAgJnN0LT5zb2NfaW5mby5tYXhfc2FtcGxlX3JhdGUpOworCXJl
dCA9IGRldmljZV9wcm9wZXJ0eV9yZWFkX3UzMihkZXYsICJhdG1lbCxtYXgtc2FtcGxlLXJhdGUt
aHoiLAorCQkJCSAgICAgICAmc3QtPnNvY19pbmZvLm1heF9zYW1wbGVfcmF0ZSk7CiAJaWYgKHJl
dCkgewogCQlkZXZfZXJyKCZwZGV2LT5kZXYsCiAJCQkiaW52YWxpZCBvciBtaXNzaW5nIHZhbHVl
IGZvciBhdG1lbCxtYXgtc2FtcGxlLXJhdGUtaHpcbiIpOwogCQlyZXR1cm4gcmV0OwogCX0KIAot
CXJldCA9IG9mX3Byb3BlcnR5X3JlYWRfdTMyKHBkZXYtPmRldi5vZl9ub2RlLCAiYXRtZWwsc3Rh
cnR1cC10aW1lLW1zIiwKLQkJCQkgICAmc3QtPnNvY19pbmZvLnN0YXJ0dXBfdGltZSk7CisJcmV0
ID0gZGV2aWNlX3Byb3BlcnR5X3JlYWRfdTMyKGRldiwgImF0bWVsLHN0YXJ0dXAtdGltZS1tcyIs
CisJCQkJICAgICAgICZzdC0+c29jX2luZm8uc3RhcnR1cF90aW1lKTsKIAlpZiAocmV0KSB7CiAJ
CWRldl9lcnIoJnBkZXYtPmRldiwKIAkJCSJpbnZhbGlkIG9yIG1pc3NpbmcgdmFsdWUgZm9yIGF0
bWVsLHN0YXJ0dXAtdGltZS1tc1xuIik7CiAJCXJldHVybiByZXQ7CiAJfQogCi0JcmV0ID0gb2Zf
cHJvcGVydHlfcmVhZF91MzIocGRldi0+ZGV2Lm9mX25vZGUsCi0JCQkJICAgImF0bWVsLHRyaWdn
ZXItZWRnZS10eXBlIiwgJmVkZ2VfdHlwZSk7CisJcmV0ID0gZGV2aWNlX3Byb3BlcnR5X3JlYWRf
dTMyKGRldiwgImF0bWVsLHRyaWdnZXItZWRnZS10eXBlIiwKKwkJCQkgICAgICAgJmVkZ2VfdHlw
ZSk7CiAJaWYgKHJldCkgewogCQlkZXZfZGJnKCZwZGV2LT5kZXYsCiAJCQkiYXRtZWwsdHJpZ2dl
ci1lZGdlLXR5cGUgbm90IHNwZWNpZmllZCwgb25seSBzb2Z0d2FyZSB0cmlnZ2VyIGF2YWlsYWJs
ZVxuIik7Ci0tIAoyLjM2LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
