Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 735BA54606D
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Jun 2022 10:50:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3A18FC6046D;
	Fri, 10 Jun 2022 08:50:12 +0000 (UTC)
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com
 [148.163.135.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3CCA6C60465
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jun 2022 08:50:10 +0000 (UTC)
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
 by mx0a-00128a01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25A5dXrY010565;
 Fri, 10 Jun 2022 04:49:20 -0400
Received: from nwd2mta4.analog.com ([137.71.173.58])
 by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3gm00mh28t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Jun 2022 04:49:19 -0400
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
 by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 25A8nIrB027580
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL); 
 Fri, 10 Jun 2022 04:49:18 -0400
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Fri, 10 Jun 2022 04:49:17 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Fri, 10 Jun 2022 04:49:17 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Fri, 10 Jun 2022 04:49:17 -0400
Received: from nsa.ad.analog.com ([10.44.3.70])
 by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 25A8imit014275;
 Fri, 10 Jun 2022 04:49:03 -0400
From: =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
To: <linux-imx@nxp.com>, <linux-renesas-soc@vger.kernel.org>,
 <linux-mips@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <chrome-platform@lists.linux.dev>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 <linux-mediatek@lists.infradead.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-msm@vger.kernel.org>, <linux-iio@vger.kernel.org>,
 <openbmc@lists.ozlabs.org>
Date: Fri, 10 Jun 2022 10:45:44 +0200
Message-ID: <20220610084545.547700-34-nuno.sa@analog.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220610084545.547700-1-nuno.sa@analog.com>
References: <20220610084545.547700-1-nuno.sa@analog.com>
MIME-Version: 1.0
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: GePAQQx29L8bJJPCyooQxLNIvK2ZZ6i9
X-Proofpoint-GUID: GePAQQx29L8bJJPCyooQxLNIvK2ZZ6i9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-10_02,2022-06-09_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=780 lowpriorityscore=0 suspectscore=0
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
Subject: [Linux-stm32] [PATCH 33/34] iio: inkern: remove OF dependencies
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

U2luY2UgYWxsIHVzZXJzIG9mIHRoZSBPRiBkZXBlbmRlbmRlbnQgQVBJIGFyZSBub3cgY29udmVy
dGVkIHRvIHVzZSB0aGUKZmlybXdhcmUgYWdub3N0aWMgYWx0ZXJuYXRpdmUsIHdlIGNhbiBkcm9w
IE9GIGRlcGVuZGVuY2llcyBmcm9tIHRoZSBJSU8KaW4ga2VybmVsIGludGVyZmFjZS4KClNpZ25l
ZC1vZmYtYnk6IE51bm8gU8OhIDxudW5vLnNhQGFuYWxvZy5jb20+Ci0tLQogZHJpdmVycy9paW8v
aW5rZXJuLmMgICAgICAgICB8IDI1ICstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIGluY2x1ZGUv
bGludXgvaWlvL2NvbnN1bWVyLmggfCAxMCAtLS0tLS0tLS0tCiBpbmNsdWRlL2xpbnV4L2lpby9p
aW8uaCAgICAgIHwgIDMgLS0tCiAzIGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAzNyBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2lpby9pbmtlcm4uYyBiL2RyaXZlcnMv
aWlvL2lua2Vybi5jCmluZGV4IDFkNTE5YjBjYWNlYS4uN2ViNTM2NTYwZGVkIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2lpby9pbmtlcm4uYworKysgYi9kcml2ZXJzL2lpby9pbmtlcm4uYwpAQCAtOCw3
ICs4LDYgQEAKICNpbmNsdWRlIDxsaW51eC9wcm9wZXJ0eS5oPgogI2luY2x1ZGUgPGxpbnV4L3Ns
YWIuaD4KICNpbmNsdWRlIDxsaW51eC9tdXRleC5oPgotI2luY2x1ZGUgPGxpbnV4L29mLmg+CiAK
ICNpbmNsdWRlIDxsaW51eC9paW8vaWlvLmg+CiAjaW5jbHVkZSA8bGludXgvaWlvL2lpby1vcGFx
dWUuaD4KQEAgLTE0OCwyNiArMTQ3LDYgQEAgc3RhdGljIGludCBfX2Z3bm9kZV9paW9fc2ltcGxl
X3hsYXRlKHN0cnVjdCBpaW9fZGV2ICppbmRpb19kZXYsCiAJcmV0dXJuIGlpb3NwZWMtPmFyZ3Nb
MF07CiB9CiAKLS8qCi0gKiBTaW1wbGUgaGVscGVyIHRvIGNvcHkgZndub2RlX3JlZmVyZW5jZV9h
cmdzIGludG8gb2ZfcGhhbmRsZV9hcmdzIHNvIHdlCi0gKiBjYW4gcGFzcyBpdCB0byBvZl94bGF0
ZSgpLiBVbHRpbWF0ZSBnb2FsIGlzIHRvIGRyb3AgdGhpcyB0b2dldGhlciB3aXRoCi0gKiBvZl94
bGF0ZSgpLgotICovCi1zdGF0aWMgaW50IF9fZndub2RlX3RvX29mX3hsYXRlKHN0cnVjdCBpaW9f
ZGV2ICppbmRpb19kZXYsCi0JCQkJY29uc3Qgc3RydWN0IGZ3bm9kZV9yZWZlcmVuY2VfYXJncyAq
aWlvc3BlYykKLXsKLQlzdHJ1Y3Qgb2ZfcGhhbmRsZV9hcmdzIG9mX2FyZ3M7Ci0JdW5zaWduZWQg
aW50IGk7Ci0KLQlvZl9hcmdzLmFyZ3NfY291bnQgPSBpaW9zcGVjLT5uYXJnczsKLQlvZl9hcmdz
Lm5wID0gdG9fb2Zfbm9kZShpaW9zcGVjLT5md25vZGUpOwotCi0JZm9yIChpID0gMDsgaSA8IE1B
WF9QSEFORExFX0FSR1M7IGkrKykKLQkJb2ZfYXJncy5hcmdzW2ldID0gaSA8IGlpb3NwZWMtPm5h
cmdzID8gaWlvc3BlYy0+YXJnc1tpXSA6IDA7Ci0KLQlyZXR1cm4gaW5kaW9fZGV2LT5pbmZvLT5v
Zl94bGF0ZShpbmRpb19kZXYsICZvZl9hcmdzKTsKLX0KLQogc3RhdGljIGludCBfX2Z3bm9kZV9p
aW9fY2hhbm5lbF9nZXQoc3RydWN0IGlpb19jaGFubmVsICpjaGFubmVsLAogCQkJCSAgICBzdHJ1
Y3QgZndub2RlX2hhbmRsZSAqZndub2RlLCBpbnQgaW5kZXgpCiB7CkBAIC0xOTEsOSArMTcwLDcg
QEAgc3RhdGljIGludCBfX2Z3bm9kZV9paW9fY2hhbm5lbF9nZXQoc3RydWN0IGlpb19jaGFubmVs
ICpjaGFubmVsLAogCiAJaW5kaW9fZGV2ID0gZGV2X3RvX2lpb19kZXYoaWRldik7CiAJY2hhbm5l
bC0+aW5kaW9fZGV2ID0gaW5kaW9fZGV2OwotCWlmIChpbmRpb19kZXYtPmluZm8tPm9mX3hsYXRl
KQotCQlpbmRleCA9IF9fZndub2RlX3RvX29mX3hsYXRlKGluZGlvX2RldiwgJmlpb3NwZWMpOwot
CWVsc2UgaWYgKGluZGlvX2Rldi0+aW5mby0+Zndub2RlX3hsYXRlKQorCWlmIChpbmRpb19kZXYt
PmluZm8tPmZ3bm9kZV94bGF0ZSkKIAkJaW5kZXggPSBpbmRpb19kZXYtPmluZm8tPmZ3bm9kZV94
bGF0ZShpbmRpb19kZXYsICZpaW9zcGVjKTsKIAllbHNlCiAJCWluZGV4ID0gX19md25vZGVfaWlv
X3NpbXBsZV94bGF0ZShpbmRpb19kZXYsICZpaW9zcGVjKTsKZGlmZiAtLWdpdCBhL2luY2x1ZGUv
bGludXgvaWlvL2NvbnN1bWVyLmggYi9pbmNsdWRlL2xpbnV4L2lpby9jb25zdW1lci5oCmluZGV4
IGE5NmE3MTRiNWZkYy4uNjgwMjU5NmIwMTdjIDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L2lp
by9jb25zdW1lci5oCisrKyBiL2luY2x1ZGUvbGludXgvaWlvL2NvbnN1bWVyLmgKQEAgLTksMTIg
KzksMTAgQEAKIAogI2luY2x1ZGUgPGxpbnV4L3R5cGVzLmg+CiAjaW5jbHVkZSA8bGludXgvaWlv
L3R5cGVzLmg+Ci0jaW5jbHVkZSA8bGludXgvb2YuaD4KIAogc3RydWN0IGlpb19kZXY7CiBzdHJ1
Y3QgaWlvX2NoYW5fc3BlYzsKIHN0cnVjdCBkZXZpY2U7Ci1zdHJ1Y3QgZGV2aWNlX25vZGU7CiBz
dHJ1Y3QgZndub2RlX2hhbmRsZTsKIAogLyoqCkBAIC0xMjksMTQgKzEyNyw2IEBAIHN0cnVjdCBp
aW9fY2hhbm5lbCAqZGV2bV9md25vZGVfaWlvX2NoYW5uZWxfZ2V0X2J5X25hbWUoc3RydWN0IGRl
dmljZSAqZGV2LAogCQkJCQkJCXN0cnVjdCBmd25vZGVfaGFuZGxlICpmd25vZGUsCiAJCQkJCQkJ
Y29uc3QgY2hhciAqY29uc3VtZXJfY2hhbm5lbCk7CiAKLXN0YXRpYyBpbmxpbmUgc3RydWN0IGlp
b19jaGFubmVsCi0qZGV2bV9vZl9paW9fY2hhbm5lbF9nZXRfYnlfbmFtZShzdHJ1Y3QgZGV2aWNl
ICpkZXYsIHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnAsCi0JCQkJIGNvbnN0IGNoYXIgKmNvbnN1bWVy
X2NoYW5uZWwpCi17Ci0JcmV0dXJuIGRldm1fZndub2RlX2lpb19jaGFubmVsX2dldF9ieV9uYW1l
KGRldiwgb2ZfZndub2RlX2hhbmRsZShucCksCi0JCQkJCQkgICBjb25zdW1lcl9jaGFubmVsKTsK
LX0KLQogc3RydWN0IGlpb19jYl9idWZmZXI7CiAvKioKICAqIGlpb19jaGFubmVsX2dldF9hbGxf
Y2IoKSAtIHJlZ2lzdGVyIGNhbGxiYWNrIGZvciB0cmlnZ2VyZWQgY2FwdHVyZQpkaWZmIC0tZ2l0
IGEvaW5jbHVkZS9saW51eC9paW8vaWlvLmggYi9pbmNsdWRlL2xpbnV4L2lpby9paW8uaAppbmRl
eCA0OTRhYmI2MzQwNmUuLjcwOTNiZTE1MzFjMSAxMDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9p
aW8vaWlvLmgKKysrIGIvaW5jbHVkZS9saW51eC9paW8vaWlvLmgKQEAgLTE3LDcgKzE3LDYgQEAK
ICAqIEN1cnJlbnRseSBhc3N1bWVzIG5hbm8gc2Vjb25kcy4KICAqLwogCi1zdHJ1Y3Qgb2ZfcGhh
bmRsZV9hcmdzOwogc3RydWN0IGZ3bm9kZV9yZWZlcmVuY2VfYXJnczsKIAogZW51bSBpaW9fc2hh
cmVkX2J5IHsKQEAgLTUxMSw4ICs1MTAsNiBAQCBzdHJ1Y3QgaWlvX2luZm8gewogCWludCAoKmRl
YnVnZnNfcmVnX2FjY2Vzcykoc3RydWN0IGlpb19kZXYgKmluZGlvX2RldiwKIAkJCQkgIHVuc2ln
bmVkIHJlZywgdW5zaWduZWQgd3JpdGV2YWwsCiAJCQkJICB1bnNpZ25lZCAqcmVhZHZhbCk7Ci0J
aW50ICgqb2ZfeGxhdGUpKHN0cnVjdCBpaW9fZGV2ICppbmRpb19kZXYsCi0JCQljb25zdCBzdHJ1
Y3Qgb2ZfcGhhbmRsZV9hcmdzICppaW9zcGVjKTsKIAlpbnQgKCpmd25vZGVfeGxhdGUpKHN0cnVj
dCBpaW9fZGV2ICppbmRpb19kZXYsCiAJCQkgICAgY29uc3Qgc3RydWN0IGZ3bm9kZV9yZWZlcmVu
Y2VfYXJncyAqaWlvc3BlYyk7CiAJaW50ICgqaHdmaWZvX3NldF93YXRlcm1hcmspKHN0cnVjdCBp
aW9fZGV2ICppbmRpb19kZXYsIHVuc2lnbmVkIHZhbCk7Ci0tIAoyLjM2LjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcg
bGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
