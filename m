Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 38510576179
	for <lists+linux-stm32@lfdr.de>; Fri, 15 Jul 2022 14:29:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A1E95C640F1;
	Fri, 15 Jul 2022 12:29:56 +0000 (UTC)
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com
 [148.163.135.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6A66FC08D1F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Jul 2022 12:29:54 +0000 (UTC)
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
 by mx0a-00128a01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26FA4PiP026958;
 Fri, 15 Jul 2022 08:28:57 -0400
Received: from nwd2mta3.analog.com ([137.71.173.56])
 by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3h9r37te3h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Jul 2022 08:28:57 -0400
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
 by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 26FCStPK061302
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL); 
 Fri, 15 Jul 2022 08:28:55 -0400
Received: from ASHBCASHYB5.ad.analog.com (10.64.17.133) by
 ASHBMBX9.ad.analog.com (10.64.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Fri, 15 Jul 2022 08:28:55 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB5.ad.analog.com (10.64.17.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Fri, 15 Jul 2022 08:28:54 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Fri, 15 Jul 2022 08:28:54 -0400
Received: from nsa.ad.analog.com ([10.44.3.55])
 by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 26FCRxNw001007;
 Fri, 15 Jul 2022 08:28:44 -0400
From: =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
To: <openbmc@lists.ozlabs.org>, <linux-imx@nxp.com>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-iio@vger.kernel.org>, <linux-mips@vger.kernel.org>,
 <linux-renesas-soc@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <chrome-platform@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 <linux-arm-msm@vger.kernel.org>
Date: Fri, 15 Jul 2022 14:28:50 +0200
Message-ID: <20220715122903.332535-3-nuno.sa@analog.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220715122903.332535-1-nuno.sa@analog.com>
References: <20220715122903.332535-1-nuno.sa@analog.com>
MIME-Version: 1.0
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: tNpkAPJ_T9XUWjCHsHWKQHQh-gHhk_zp
X-Proofpoint-ORIG-GUID: tNpkAPJ_T9XUWjCHsHWKQHQh-gHhk_zp
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
 Daniel Lezcano <daniel.lezcano@linaro.org>, Haibo
 Chen <haibo.chen@nxp.com>, Christophe Branchereau <cbranchereau@gmail.com>,
 Nancy Yuen <yuenn@google.com>, Andy
 Shevchenko <andy.shevchenko@gmail.com>, Andy Gross <agross@kernel.org>,
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
Subject: [Linux-stm32] [PATCH v3 02/15] iio: inkern: fix return value in
	devm_of_iio_channel_get_by_name()
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

b2ZfaWlvX2NoYW5uZWxfZ2V0X2J5X25hbWUoKSBjYW4gZWl0aGVyIHJldHVybiBOVUxMIG9yIGFu
IGVycm9yIHBvaW50ZXIKc28gdGhhdCBvbmx5IGRvaW5nIElTX0VSUigpIGlzIG5vdCBlbm91Z2gu
IEZpeCBpdCBieSBjaGVja2luZyB0aGUgTlVMTApwb2ludGVyIGNhc2UgYW5kIHJldHVybiAtRU5P
REVWIGluIHRoYXQgY2FzZS4gTm90ZSB0aGlzIGlzIGRvbmUgbGlrZSB0aGlzCnNvIHRoYXQgdXNl
cnMgb2YgdGhlIGZ1bmN0aW9uICh3aGljaCBvbmx5IGNoZWNrIGZvciBlcnJvciBwb2ludGVycykg
ZG8Kbm90IG5lZWQgdG8gYmUgY2hhbmdlZC4gVGhpcyBpcyBub3QgaWRlYWwgc2luY2Ugd2UgYXJl
IGxvc2luZyBlcnJvciBjb2RlcwphbmQgYXMgc3VjaCwgaW4gYSBmb2xsb3cgdXAgY2hhbmdlLCB0
aGluZ3Mgd2lsbCBiZSB1bmlmaWVkIHNvIHRoYXQKb2ZfaWlvX2NoYW5uZWxfZ2V0X2J5X25hbWUo
KSBvbmx5IHJldHVybnMgZXJyb3IgY29kZXMuCgpGaXhlczogNmUzOWIxNDVjZWY3ICgiaWlvOiBw
cm92aWRlIG9mX2lpb19jaGFubmVsX2dldF9ieV9uYW1lKCkgYW5kIGRldm1fIHZlcnNpb24gaXQi
KQpTaWduZWQtb2ZmLWJ5OiBOdW5vIFPDoSA8bnVuby5zYUBhbmFsb2cuY29tPgpSZXZpZXdlZC1i
eTogQW5keSBTaGV2Y2hlbmtvIDxhbmR5LnNoZXZjaGVua29AZ21haWwuY29tPgotLS0KIGRyaXZl
cnMvaWlvL2lua2Vybi5jIHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvaWlvL2lua2Vybi5jIGIvZHJpdmVycy9paW8vaW5rZXJuLmMK
aW5kZXggOWQ4NzA1Nzc5NGZjLi44N2ZkMmEwZDQ0ZjIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvaWlv
L2lua2Vybi5jCisrKyBiL2RyaXZlcnMvaWlvL2lua2Vybi5jCkBAIC00MTIsNiArNDEyLDggQEAg
c3RydWN0IGlpb19jaGFubmVsICpkZXZtX29mX2lpb19jaGFubmVsX2dldF9ieV9uYW1lKHN0cnVj
dCBkZXZpY2UgKmRldiwKIAljaGFubmVsID0gb2ZfaWlvX2NoYW5uZWxfZ2V0X2J5X25hbWUobnAs
IGNoYW5uZWxfbmFtZSk7CiAJaWYgKElTX0VSUihjaGFubmVsKSkKIAkJcmV0dXJuIGNoYW5uZWw7
CisJaWYgKCFjaGFubmVsKQorCQlyZXR1cm4gRVJSX1BUUigtRU5PREVWKTsKIAogCXJldCA9IGRl
dm1fYWRkX2FjdGlvbl9vcl9yZXNldChkZXYsIGRldm1faWlvX2NoYW5uZWxfZnJlZSwgY2hhbm5l
bCk7CiAJaWYgKHJldCkKLS0gCjIuMzcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
