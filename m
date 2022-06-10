Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B90B4546007
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Jun 2022 10:49:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 83FB7C6046D;
	Fri, 10 Jun 2022 08:49:02 +0000 (UTC)
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com
 [148.163.135.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2D672C60465
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jun 2022 08:49:01 +0000 (UTC)
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
 by mx0a-00128a01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25A7noCg005281;
 Fri, 10 Jun 2022 04:48:12 -0400
Received: from nwd2mta3.analog.com ([137.71.173.56])
 by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3ghq33kqa1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Jun 2022 04:48:11 -0400
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
 by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 25A8mAvx023276
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL); 
 Fri, 10 Jun 2022 04:48:10 -0400
Received: from ASHBCASHYB5.ad.analog.com (10.64.17.133) by
 ASHBMBX9.ad.analog.com (10.64.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Fri, 10 Jun 2022 04:48:09 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB5.ad.analog.com (10.64.17.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Fri, 10 Jun 2022 04:48:09 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Fri, 10 Jun 2022 04:48:09 -0400
Received: from nsa.ad.analog.com ([10.44.3.70])
 by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 25A8imij014275;
 Fri, 10 Jun 2022 04:47:57 -0400
From: =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
To: <linux-imx@nxp.com>, <linux-renesas-soc@vger.kernel.org>,
 <linux-mips@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <chrome-platform@lists.linux.dev>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 <linux-mediatek@lists.infradead.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-msm@vger.kernel.org>, <linux-iio@vger.kernel.org>,
 <openbmc@lists.ozlabs.org>
Date: Fri, 10 Jun 2022 10:45:34 +0200
Message-ID: <20220610084545.547700-24-nuno.sa@analog.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220610084545.547700-1-nuno.sa@analog.com>
References: <20220610084545.547700-1-nuno.sa@analog.com>
MIME-Version: 1.0
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: 2oH5KYMbOhj-Glg6FwhCeBTGAwA2tiGz
X-Proofpoint-GUID: 2oH5KYMbOhj-Glg6FwhCeBTGAwA2tiGz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-10_02,2022-06-09_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 mlxlogscore=999 phishscore=0 priorityscore=1501 adultscore=0 clxscore=1015
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
Subject: [Linux-stm32] [PATCH 23/34] iio: inkern: split
	of_iio_channel_get_by_name()
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

VGhpcyBjaGFuZ2Ugc3BsaXRzIG9mX2lpb19jaGFubmVsX2dldF9ieV9uYW1lKCkgc28gdGhhdCBp
dCBkZWNvdXBsZXMKbG9va2luZyBmb3IgY2hhbm5lbHMgaW4gdGhlIGN1cnJlbnQgbm9kZSBmcm9t
IGxvb2tpbmcgaW4gaXQncyBwYXJlbnRzCm5vZGVzLiBUaGlzIHdpbGwgYmUgaGVscGZ1bCB3aGVu
IG1vdmluZyB0byBmd25vZGUgcHJvcGVydGllcyB3aGVyZSB3ZQpuZWVkIHRvIHJlbGVhc2UgdGhl
IGhhbmRsZXMgd2hlbiBsb29raW5nIGZvciBjaGFubmVscyBpbiBwYXJlbnQncyBub2Rlcy4KCk5v
IGZ1bmN0aW9uYWwgY2hhbmdlIGludGVuZGVkLi4uCgpTaWduZWQtb2ZmLWJ5OiBOdW5vIFPDoSA8
bnVuby5zYUBhbmFsb2cuY29tPgotLS0KIGRyaXZlcnMvaWlvL2lua2Vybi5jIHwgNjkgKysrKysr
KysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0
NCBpbnNlcnRpb25zKCspLCAyNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2lp
by9pbmtlcm4uYyBiL2RyaXZlcnMvaWlvL2lua2Vybi5jCmluZGV4IDMxZDljMTIyMTk5YS4uZGRl
NDczMjRiODI2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2lpby9pbmtlcm4uYworKysgYi9kcml2ZXJz
L2lpby9pbmtlcm4uYwpAQCAtMjExLDQ0ICsyMTEsNjMgQEAgc3RhdGljIHN0cnVjdCBpaW9fY2hh
bm5lbCAqb2ZfaWlvX2NoYW5uZWxfZ2V0KHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnAsIGludCBpbmRl
eCkKIAlyZXR1cm4gRVJSX1BUUihlcnIpOwogfQogCitzdHJ1Y3QgaWlvX2NoYW5uZWwgKl9fb2Zf
aWlvX2NoYW5uZWxfZ2V0X2J5X25hbWUoc3RydWN0IGRldmljZV9ub2RlICpucCwKKwkJCQkJCSBj
b25zdCBjaGFyICpuYW1lLAorCQkJCQkJIGJvb2wgKnBhcmVudF9sb29rdXApCit7CisJc3RydWN0
IGlpb19jaGFubmVsICpjaGFuOworCWludCBpbmRleCA9IDA7CisKKwkvKgorCSAqIEZvciBuYW1l
ZCBpaW8gY2hhbm5lbHMsIGZpcnN0IGxvb2sgdXAgdGhlIG5hbWUgaW4gdGhlCisJICogImlvLWNo
YW5uZWwtbmFtZXMiIHByb3BlcnR5LiAgSWYgaXQgY2Fubm90IGJlIGZvdW5kLCB0aGUKKwkgKiBp
bmRleCB3aWxsIGJlIGFuIGVycm9yIGNvZGUsIGFuZCBvZl9paW9fY2hhbm5lbF9nZXQoKQorCSAq
IHdpbGwgZmFpbC4KKwkgKi8KKwlpZiAobmFtZSkKKwkJaW5kZXggPSBvZl9wcm9wZXJ0eV9tYXRj
aF9zdHJpbmcobnAsICJpby1jaGFubmVsLW5hbWVzIiwgbmFtZSk7CisKKwljaGFuID0gb2ZfaWlv
X2NoYW5uZWxfZ2V0KG5wLCBpbmRleCk7CisJaWYgKCFJU19FUlIoY2hhbikgfHwgUFRSX0VSUihj
aGFuKSA9PSAtRVBST0JFX0RFRkVSKSB7CisJCSpwYXJlbnRfbG9va3VwID0gZmFsc2U7CisJfSBl
bHNlIGlmIChuYW1lICYmIGluZGV4ID49IDApIHsKKwkJcHJfZXJyKCJFUlJPUjogY291bGQgbm90
IGdldCBJSU8gY2hhbm5lbCAlcE9GOiVzKCVpKVxuIiwKKwkJICAgICAgIG5wLCBuYW1lID8gbmFt
ZSA6ICIiLCBpbmRleCk7CisJCSpwYXJlbnRfbG9va3VwID0gZmFsc2U7CisJfQorCisJcmV0dXJu
IGNoYW47Cit9CisKIHN0cnVjdCBpaW9fY2hhbm5lbCAqb2ZfaWlvX2NoYW5uZWxfZ2V0X2J5X25h
bWUoc3RydWN0IGRldmljZV9ub2RlICpucCwKIAkJCQkJICAgICAgIGNvbnN0IGNoYXIgKm5hbWUp
CiB7CiAJc3RydWN0IGlpb19jaGFubmVsICpjaGFuOworCWJvb2wgcGFyZW50X2xvb2t1cCA9IHRy
dWU7CiAKIAkvKiBXYWxrIHVwIHRoZSB0cmVlIG9mIGRldmljZXMgbG9va2luZyBmb3IgYSBtYXRj
aGluZyBpaW8gY2hhbm5lbCAqLworCWNoYW4gPSBfX29mX2lpb19jaGFubmVsX2dldF9ieV9uYW1l
KG5wLCBuYW1lLCAmcGFyZW50X2xvb2t1cCk7CisJaWYgKCFwYXJlbnRfbG9va3VwKQorCQlyZXR1
cm4gY2hhbjsKKworCS8qCisJICogTm8gbWF0Y2hpbmcgSUlPIGNoYW5uZWwgZm91bmQgb24gdGhp
cyBub2RlLgorCSAqIElmIHRoZSBwYXJlbnQgbm9kZSBoYXMgYSAiaW8tY2hhbm5lbC1yYW5nZXMi
IHByb3BlcnR5LAorCSAqIHRoZW4gd2UgY2FuIHRyeSBvbmUgb2YgaXRzIGNoYW5uZWxzLgorCSAq
LworCW5wID0gbnAtPnBhcmVudDsKIAl3aGlsZSAobnApIHsKLQkJaW50IGluZGV4ID0gMDsKLQot
CQkvKgotCQkgKiBGb3IgbmFtZWQgaWlvIGNoYW5uZWxzLCBmaXJzdCBsb29rIHVwIHRoZSBuYW1l
IGluIHRoZQotCQkgKiAiaW8tY2hhbm5lbC1uYW1lcyIgcHJvcGVydHkuICBJZiBpdCBjYW5ub3Qg
YmUgZm91bmQsIHRoZQotCQkgKiBpbmRleCB3aWxsIGJlIGFuIGVycm9yIGNvZGUsIGFuZCBvZl9p
aW9fY2hhbm5lbF9nZXQoKQotCQkgKiB3aWxsIGZhaWwuCi0JCSAqLwotCQlpZiAobmFtZSkKLQkJ
CWluZGV4ID0gb2ZfcHJvcGVydHlfbWF0Y2hfc3RyaW5nKG5wLCAiaW8tY2hhbm5lbC1uYW1lcyIs
Ci0JCQkJCQkJIG5hbWUpOwotCQljaGFuID0gb2ZfaWlvX2NoYW5uZWxfZ2V0KG5wLCBpbmRleCk7
Ci0JCWlmICghSVNfRVJSKGNoYW4pIHx8IFBUUl9FUlIoY2hhbikgPT0gLUVQUk9CRV9ERUZFUikK
KwkJaWYgKCFvZl9nZXRfcHJvcGVydHkobnAsICJpby1jaGFubmVsLXJhbmdlcyIsIE5VTEwpKQog
CQkJcmV0dXJuIGNoYW47Ci0JCWlmIChuYW1lICYmIGluZGV4ID49IDApIHsKLQkJCXByX2Vycigi
RVJST1I6IGNvdWxkIG5vdCBnZXQgSUlPIGNoYW5uZWwgJXBPRjolcyglaSlcbiIsCi0JCQkJbnAs
IG5hbWUgPyBuYW1lIDogIiIsIGluZGV4KTsKKworCQljaGFuID0gX19vZl9paW9fY2hhbm5lbF9n
ZXRfYnlfbmFtZShucCwgbmFtZSwgJnBhcmVudF9sb29rdXApOworCQlpZiAoIXBhcmVudF9sb29r
dXApCiAJCQlyZXR1cm4gY2hhbjsKLQkJfQogCi0JCS8qCi0JCSAqIE5vIG1hdGNoaW5nIElJTyBj
aGFubmVsIGZvdW5kIG9uIHRoaXMgbm9kZS4KLQkJICogSWYgdGhlIHBhcmVudCBub2RlIGhhcyBh
ICJpby1jaGFubmVsLXJhbmdlcyIgcHJvcGVydHksCi0JCSAqIHRoZW4gd2UgY2FuIHRyeSBvbmUg
b2YgaXRzIGNoYW5uZWxzLgotCQkgKi8KIAkJbnAgPSBucC0+cGFyZW50OwotCQlpZiAobnAgJiYg
IW9mX2dldF9wcm9wZXJ0eShucCwgImlvLWNoYW5uZWwtcmFuZ2VzIiwgTlVMTCkpCi0JCQlyZXR1
cm4gY2hhbjsKIAl9CiAKLQlyZXR1cm4gRVJSX1BUUigtRU5PREVWKTsKKwlyZXR1cm4gY2hhbjsK
IH0KIEVYUE9SVF9TWU1CT0xfR1BMKG9mX2lpb19jaGFubmVsX2dldF9ieV9uYW1lKTsKIAotLSAK
Mi4zNi4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0
aW5mby9saW51eC1zdG0zMgo=
