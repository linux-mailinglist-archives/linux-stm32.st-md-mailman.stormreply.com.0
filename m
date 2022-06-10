Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ABBA3546005
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Jun 2022 10:48:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6EAC0C6046D;
	Fri, 10 Jun 2022 08:48:51 +0000 (UTC)
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com
 [148.163.135.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DC3A9C60465
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jun 2022 08:48:49 +0000 (UTC)
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
 by mx0a-00128a01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25A7noCd005281;
 Fri, 10 Jun 2022 04:48:05 -0400
Received: from nwd2mta4.analog.com ([137.71.173.58])
 by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3ghq33kq9b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Jun 2022 04:48:05 -0400
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
 by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 25A8m4b4027550
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL); 
 Fri, 10 Jun 2022 04:48:04 -0400
Received: from ASHBCASHYB5.ad.analog.com (10.64.17.133) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Fri, 10 Jun 2022 04:48:03 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB5.ad.analog.com (10.64.17.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Fri, 10 Jun 2022 04:48:03 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Fri, 10 Jun 2022 04:48:00 -0400
Received: from nsa.ad.analog.com ([10.44.3.70])
 by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 25A8imii014275;
 Fri, 10 Jun 2022 04:47:49 -0400
From: =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
To: <linux-imx@nxp.com>, <linux-renesas-soc@vger.kernel.org>,
 <linux-mips@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <chrome-platform@lists.linux.dev>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 <linux-mediatek@lists.infradead.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-msm@vger.kernel.org>, <linux-iio@vger.kernel.org>,
 <openbmc@lists.ozlabs.org>
Date: Fri, 10 Jun 2022 10:45:33 +0200
Message-ID: <20220610084545.547700-23-nuno.sa@analog.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220610084545.547700-1-nuno.sa@analog.com>
References: <20220610084545.547700-1-nuno.sa@analog.com>
MIME-Version: 1.0
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: Y_iBkwY0TFr0zytvI3INOXjiF43q9YVc
X-Proofpoint-GUID: Y_iBkwY0TFr0zytvI3INOXjiF43q9YVc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-10_02,2022-06-09_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 mlxlogscore=842 phishscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 spamscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206100031
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
Subject: [Linux-stm32] [PATCH 22/34] iio: inkern: only return error codes in
	iio_channel_get_*() APIs
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

QVBJcyBsaWtlIG9mX2lpb19jaGFubmVsX2dldF9ieV9uYW1lKCkgYW5kIG9mX2lpb19jaGFubmVs
X2dldF9hbGwoKSB3ZXJlCnJldHVybmluZyBhIG1peCBvZiBOVUxMIGFuZCBlcnJvciBwb2ludGVy
cyBiZWluZyBOVUxMIHRoZSB3YXkgdG8KIm5vdGlmeSIgdGhhdCB3ZSBzaG91bGQgZG8gYSAic3lz
dGVtIiBsb29rdXAgZm9yIGNoYW5uZWxzLiBUaGlzIG1ha2UKaXQgdmVyeSBjb25mdXNpbmcgYW5k
IHByb25lIHRvIGVycm9ycyBhcyBjb21taXQgZGJiY2NmN2MyMGJmCigiaWlvOiBpbmtlcm46IGZp
eCByZXR1cm4gdmFsdWUgaW4gZGV2bV9vZl9paW9fY2hhbm5lbF9nZXRfYnlfbmFtZSgpIikKcHJv
dmVzLiBPbiB0b3Agb2YgdGhpcywgcGF0dGVybnMgbGlrZSAnaWYgKGNoYW5uZWwgIT0gTlVMTCkg
cmV0dXJuIGNoYW5uZWwnCndlcmUgYmVpbmcgdXNlZCB3aGVyZSBjaGFubmVsIGNvdWxkIGFjdHVh
bGx5IGJlIGFuIGVycm9yIGNvZGUgd2hpY2gKbWFrZXMgdGhlIGNvZGUgaGFyZCB0byByZWFkLgoK
U2lnbmVkLW9mZi1ieTogTnVubyBTw6EgPG51bm8uc2FAYW5hbG9nLmNvbT4KLS0tCiBkcml2ZXJz
L2lpby9pbmtlcm4uYyB8IDI0ICsrKysrKysrKysrLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5n
ZWQsIDExIGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvaWlvL2lua2Vybi5jIGIvZHJpdmVycy9paW8vaW5rZXJuLmMKaW5kZXggODdmZDJhMGQ0NGYy
Li4zMWQ5YzEyMjE5OWEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvaWlvL2lua2Vybi5jCisrKyBiL2Ry
aXZlcnMvaWlvL2lua2Vybi5jCkBAIC0yMTQsNyArMjE0LDcgQEAgc3RhdGljIHN0cnVjdCBpaW9f
Y2hhbm5lbCAqb2ZfaWlvX2NoYW5uZWxfZ2V0KHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnAsIGludCBp
bmRleCkKIHN0cnVjdCBpaW9fY2hhbm5lbCAqb2ZfaWlvX2NoYW5uZWxfZ2V0X2J5X25hbWUoc3Ry
dWN0IGRldmljZV9ub2RlICpucCwKIAkJCQkJICAgICAgIGNvbnN0IGNoYXIgKm5hbWUpCiB7Ci0J
c3RydWN0IGlpb19jaGFubmVsICpjaGFuID0gTlVMTDsKKwlzdHJ1Y3QgaWlvX2NoYW5uZWwgKmNo
YW47CiAKIAkvKiBXYWxrIHVwIHRoZSB0cmVlIG9mIGRldmljZXMgbG9va2luZyBmb3IgYSBtYXRj
aGluZyBpaW8gY2hhbm5lbCAqLwogCXdoaWxlIChucCkgewpAQCAtMjMxLDExICsyMzEsMTEgQEAg
c3RydWN0IGlpb19jaGFubmVsICpvZl9paW9fY2hhbm5lbF9nZXRfYnlfbmFtZShzdHJ1Y3QgZGV2
aWNlX25vZGUgKm5wLAogCQkJCQkJCSBuYW1lKTsKIAkJY2hhbiA9IG9mX2lpb19jaGFubmVsX2dl
dChucCwgaW5kZXgpOwogCQlpZiAoIUlTX0VSUihjaGFuKSB8fCBQVFJfRVJSKGNoYW4pID09IC1F
UFJPQkVfREVGRVIpCi0JCQlicmVhazsKLQkJZWxzZSBpZiAobmFtZSAmJiBpbmRleCA+PSAwKSB7
CisJCQlyZXR1cm4gY2hhbjsKKwkJaWYgKG5hbWUgJiYgaW5kZXggPj0gMCkgewogCQkJcHJfZXJy
KCJFUlJPUjogY291bGQgbm90IGdldCBJSU8gY2hhbm5lbCAlcE9GOiVzKCVpKVxuIiwKIAkJCQlu
cCwgbmFtZSA/IG5hbWUgOiAiIiwgaW5kZXgpOwotCQkJcmV0dXJuIE5VTEw7CisJCQlyZXR1cm4g
Y2hhbjsKIAkJfQogCiAJCS8qCkBAIC0yNDUsMTAgKzI0NSwxMCBAQCBzdHJ1Y3QgaWlvX2NoYW5u
ZWwgKm9mX2lpb19jaGFubmVsX2dldF9ieV9uYW1lKHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnAsCiAJ
CSAqLwogCQlucCA9IG5wLT5wYXJlbnQ7CiAJCWlmIChucCAmJiAhb2ZfZ2V0X3Byb3BlcnR5KG5w
LCAiaW8tY2hhbm5lbC1yYW5nZXMiLCBOVUxMKSkKLQkJCXJldHVybiBOVUxMOworCQkJcmV0dXJu
IGNoYW47CiAJfQogCi0JcmV0dXJuIGNoYW47CisJcmV0dXJuIEVSUl9QVFIoLUVOT0RFVik7CiB9
CiBFWFBPUlRfU1lNQk9MX0dQTChvZl9paW9fY2hhbm5lbF9nZXRfYnlfbmFtZSk7CiAKQEAgLTI2
Nyw4ICsyNjcsOCBAQCBzdGF0aWMgc3RydWN0IGlpb19jaGFubmVsICpvZl9paW9fY2hhbm5lbF9n
ZXRfYWxsKHN0cnVjdCBkZXZpY2UgKmRldikKIAkJCWJyZWFrOwogCX0gd2hpbGUgKCsrbnVtbWFw
cyk7CiAKLQlpZiAobnVtbWFwcyA9PSAwKQkvKiBubyBlcnJvciwgcmV0dXJuIE5VTEwgdG8gc2Vh
cmNoIG1hcCB0YWJsZSAqLwotCQlyZXR1cm4gTlVMTDsKKwlpZiAobnVtbWFwcyA9PSAwKQkvKiBy
ZXR1cm4gLUVOT0RFViB0byBzZWFyY2ggbWFwIHRhYmxlICovCisJCXJldHVybiBFUlJfUFRSKC1F
Tk9ERVYpOwogCiAJLyogTlVMTCB0ZXJtaW5hdGVkIGFycmF5IHRvIHNhdmUgcGFzc2luZyBzaXpl
ICovCiAJY2hhbnMgPSBrY2FsbG9jKG51bW1hcHMgKyAxLCBzaXplb2YoKmNoYW5zKSwgR0ZQX0tF
Uk5FTCk7CkBAIC0yOTUsNyArMjk1LDcgQEAgc3RhdGljIHN0cnVjdCBpaW9fY2hhbm5lbCAqb2Zf
aWlvX2NoYW5uZWxfZ2V0X2FsbChzdHJ1Y3QgZGV2aWNlICpkZXYpCiAKIHN0YXRpYyBpbmxpbmUg
c3RydWN0IGlpb19jaGFubmVsICpvZl9paW9fY2hhbm5lbF9nZXRfYWxsKHN0cnVjdCBkZXZpY2Ug
KmRldikKIHsKLQlyZXR1cm4gTlVMTDsKKwlyZXR1cm4gRVJSX1BUUigtRU5PREVWKTsKIH0KIAog
I2VuZGlmIC8qIENPTkZJR19PRiAqLwpAQCAtMzYyLDcgKzM2Miw3IEBAIHN0cnVjdCBpaW9fY2hh
bm5lbCAqaWlvX2NoYW5uZWxfZ2V0KHN0cnVjdCBkZXZpY2UgKmRldiwKIAlpZiAoZGV2KSB7CiAJ
CWNoYW5uZWwgPSBvZl9paW9fY2hhbm5lbF9nZXRfYnlfbmFtZShkZXYtPm9mX25vZGUsCiAJCQkJ
CQkgICAgIGNoYW5uZWxfbmFtZSk7Ci0JCWlmIChjaGFubmVsICE9IE5VTEwpCisJCWlmICghSVNf
RVJSKGNoYW5uZWwpIHx8IFBUUl9FUlIoY2hhbm5lbCkgPT0gLUVQUk9CRV9ERUZFUikKIAkJCXJl
dHVybiBjaGFubmVsOwogCX0KIApAQCAtNDEyLDggKzQxMiw2IEBAIHN0cnVjdCBpaW9fY2hhbm5l
bCAqZGV2bV9vZl9paW9fY2hhbm5lbF9nZXRfYnlfbmFtZShzdHJ1Y3QgZGV2aWNlICpkZXYsCiAJ
Y2hhbm5lbCA9IG9mX2lpb19jaGFubmVsX2dldF9ieV9uYW1lKG5wLCBjaGFubmVsX25hbWUpOwog
CWlmIChJU19FUlIoY2hhbm5lbCkpCiAJCXJldHVybiBjaGFubmVsOwotCWlmICghY2hhbm5lbCkK
LQkJcmV0dXJuIEVSUl9QVFIoLUVOT0RFVik7CiAKIAlyZXQgPSBkZXZtX2FkZF9hY3Rpb25fb3Jf
cmVzZXQoZGV2LCBkZXZtX2lpb19jaGFubmVsX2ZyZWUsIGNoYW5uZWwpOwogCWlmIChyZXQpCkBA
IC00MzYsNyArNDM0LDcgQEAgc3RydWN0IGlpb19jaGFubmVsICppaW9fY2hhbm5lbF9nZXRfYWxs
KHN0cnVjdCBkZXZpY2UgKmRldikKIAkJcmV0dXJuIEVSUl9QVFIoLUVJTlZBTCk7CiAKIAljaGFu
cyA9IG9mX2lpb19jaGFubmVsX2dldF9hbGwoZGV2KTsKLQlpZiAoY2hhbnMpCisJaWYgKCFJU19F
UlIoY2hhbnMpIHx8IFBUUl9FUlIoY2hhbnMpID09IC1FUFJPQkVfREVGRVIpCiAJCXJldHVybiBj
aGFuczsKIAogCW5hbWUgPSBkZXZfbmFtZShkZXYpOwotLSAKMi4zNi4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxp
c3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
