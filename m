Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DA757028C
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Jul 2022 14:39:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5F4D5C640F0;
	Mon, 11 Jul 2022 12:39:43 +0000 (UTC)
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com
 [148.163.135.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 62C8CC640EE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Jul 2022 12:39:41 +0000 (UTC)
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
 by mx0a-00128a01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26BCAAMN026688;
 Mon, 11 Jul 2022 08:38:57 -0400
Received: from nwd2mta3.analog.com ([137.71.173.56])
 by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3h76k6bhxs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Jul 2022 08:38:56 -0400
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
 by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 26BCctQt045705
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL); 
 Mon, 11 Jul 2022 08:38:55 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Mon, 11 Jul
 2022 08:38:54 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Mon, 11 Jul 2022 08:38:54 -0400
Received: from nsa.ad.analog.com ([10.44.3.53])
 by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 26BCbVEB011687;
 Mon, 11 Jul 2022 08:38:45 -0400
From: =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
To: <linux-arm-msm@vger.kernel.org>, <openbmc@lists.ozlabs.org>,
 <linux-renesas-soc@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-imx@nxp.com>,
 <linux-mips@vger.kernel.org>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 <linux-iio@vger.kernel.org>, <chrome-platform@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-stm32@st-md-mailman.stormreply.com>
Date: Mon, 11 Jul 2022 14:38:26 +0200
Message-ID: <20220711123835.811358-7-nuno.sa@analog.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220711123835.811358-1-nuno.sa@analog.com>
References: <20220711123835.811358-1-nuno.sa@analog.com>
MIME-Version: 1.0
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: FFRWcRmTcMI7ad7VGDZdc4Mxr_C8uF4I
X-Proofpoint-GUID: FFRWcRmTcMI7ad7VGDZdc4Mxr_C8uF4I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-11_18,2022-07-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0
 mlxlogscore=918 malwarescore=0 spamscore=0 impostorscore=0
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
Subject: [Linux-stm32] [PATCH v2 06/15] thermal: qcom: qcom-spmi-adc-tm5:
	convert to IIO fwnode API
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

TWFrZSB1c2FnZSBvZiB0aGUgbmV3IGZpcm13YXJlIGFnbm9zdGljIEFQSQonZGV2bV9vZl9paW9f
Y2hhbm5lbF9nZXRfYnlfbmFtZSgpJyB0byBnZXQgdGhlIElJTyBjaGFubmVsLgoKU2lnbmVkLW9m
Zi1ieTogTnVubyBTw6EgPG51bm8uc2FAYW5hbG9nLmNvbT4KLS0tCiBkcml2ZXJzL3RoZXJtYWwv
cWNvbS9xY29tLXNwbWktYWRjLXRtNS5jIHwgMyArKy0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3RoZXJtYWwvcWNv
bS9xY29tLXNwbWktYWRjLXRtNS5jIGIvZHJpdmVycy90aGVybWFsL3Fjb20vcWNvbS1zcG1pLWFk
Yy10bTUuYwppbmRleCBkOWM5Yzk3NWY5MzEuLjBiODU0M2M2MjdmMCAxMDA2NDQKLS0tIGEvZHJp
dmVycy90aGVybWFsL3Fjb20vcWNvbS1zcG1pLWFkYy10bTUuYworKysgYi9kcml2ZXJzL3RoZXJt
YWwvcWNvbS9xY29tLXNwbWktYWRjLXRtNS5jCkBAIC04MjUsNyArODI1LDggQEAgc3RhdGljIGlu
dCBhZGNfdG01X2dldF9kdF9jaGFubmVsX2RhdGEoc3RydWN0IGFkY190bTVfY2hpcCAqYWRjX3Rt
LAogCX0KIAljaGFubmVsLT5hZGNfY2hhbm5lbCA9IGFyZ3MuYXJnc1swXTsKIAotCWNoYW5uZWwt
PmlpbyA9IGRldm1fb2ZfaWlvX2NoYW5uZWxfZ2V0X2J5X25hbWUoYWRjX3RtLT5kZXYsIG5vZGUs
IE5VTEwpOworCWNoYW5uZWwtPmlpbyA9IGRldm1fZndub2RlX2lpb19jaGFubmVsX2dldF9ieV9u
YW1lKGFkY190bS0+ZGV2LAorCQkJCQkJCSAgIG9mX2Z3bm9kZV9oYW5kbGUobm9kZSksIE5VTEwp
OwogCWlmIChJU19FUlIoY2hhbm5lbC0+aWlvKSkgewogCQlyZXQgPSBQVFJfRVJSKGNoYW5uZWwt
Pmlpbyk7CiAJCWlmIChyZXQgIT0gLUVQUk9CRV9ERUZFUikKLS0gCjIuMzcuMAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGlu
ZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9z
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
