Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A2857617B
	for <lists+linux-stm32@lfdr.de>; Fri, 15 Jul 2022 14:29:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C8312C640F4;
	Fri, 15 Jul 2022 12:29:58 +0000 (UTC)
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com
 [148.163.135.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0F828C640EF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Jul 2022 12:29:55 +0000 (UTC)
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
 by mx0a-00128a01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26FA9g54026919;
 Fri, 15 Jul 2022 08:28:46 -0400
Received: from nwd2mta3.analog.com ([137.71.173.56])
 by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3h9r37te2c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Jul 2022 08:28:45 -0400
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
 by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 26FCSgmc061285
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL); 
 Fri, 15 Jul 2022 08:28:42 -0400
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX9.ad.analog.com (10.64.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Fri, 15 Jul 2022 08:28:41 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Fri, 15 Jul 2022 08:28:41 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Fri, 15 Jul 2022 08:28:41 -0400
Received: from nsa.ad.analog.com ([10.44.3.55])
 by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 26FCRxNu001007;
 Fri, 15 Jul 2022 08:28:01 -0400
From: =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
To: <openbmc@lists.ozlabs.org>, <linux-imx@nxp.com>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-iio@vger.kernel.org>, <linux-mips@vger.kernel.org>,
 <linux-renesas-soc@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <chrome-platform@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 <linux-arm-msm@vger.kernel.org>
Date: Fri, 15 Jul 2022 14:28:48 +0200
Message-ID: <20220715122903.332535-1-nuno.sa@analog.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: 9pc-gto4TH3tPU-dOW4sBqrmMHKhYXJA
X-Proofpoint-ORIG-GUID: 9pc-gto4TH3tPU-dOW4sBqrmMHKhYXJA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-15_04,2022-07-15_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 spamscore=0 mlxlogscore=967 mlxscore=0 adultscore=0 suspectscore=0
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
Subject: [Linux-stm32] [PATCH v3 00/15] make iio inkern interface firmware
	agnostic
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

Rmlyc3QgdmVyc2lvbiBvZiB0aGUgc2VyaWVzIGNhbiBiZSBmb3VuZCBoZXJlOg0KDQpodHRwczov
L2xvcmUua2VybmVsLm9yZy9saW51eC1paW8vMjAyMjA2MTAwODQ1NDUuNTQ3NzAwLTEtbnVuby5z
YUBhbmFsb2cuY29tLw0KDQpTZWNvbmQgdmVyc2lvbjoNCg0KaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvbGludXgtaWlvLzIwMjIwNzExMTIzODM1LjgxMTM1OC0xLW51bm8uc2FAYW5hbG9nLmNvbS8N
Cg0KdjMgY2hhbmdlczoNCg0KWzEvMTVdOg0KICAqIEltcHJvdmVkIChzcGVsbCBmaXhlcykgY29t
bWl0IG1lc3NhZ2UuDQoNClsxMy8xNV06DQogICogR2V0IGJhY2sgdG8gdTMyIEFQSSBmb3IgJ3N0
LGFkYy1kaWZmLWNoYW5uZWxzJyBidXQgbWFraW5nIGl0IG1vcmUgY2xlYXINCndoYXQncyBnb2lu
ZyBvbjsNCiAgKiBGaXggaW5maW5pdGUgbG9vcDsNCiAgKiBTdG9yZSBudW1iZXIgb2Ygc3QsbWlu
LXNhbXBsZS10aW1lLW5zZWNzIHByb3BlcnRpZXMgdG8gYXZvaWQNCmR1cGxpY2F0aW9uIGluIHNh
bml0eSBjaGVja3MuDQoNClsxNS8xNV0NCiAgKiBJbXByb3ZlZCAnaWYnIGNvbmRpdGlvbiBmb3Ig
cmVhZGFiaWxpdHkuDQoNCihob3BlZnVseWwgZGlkIG5vdCBmb3Jnb3QgYW55IHRhZykNCg0KTnVu
byBTw6EgKDE1KToNCiAgaWlvOiBpbmtlcm46IG9ubHkgcmVsZWFzZSB0aGUgZGV2aWNlIG5vZGUg
d2hlbiBkb25lIHdpdGggaXQNCiAgaWlvOiBpbmtlcm46IGZpeCByZXR1cm4gdmFsdWUgaW4gZGV2
bV9vZl9paW9fY2hhbm5lbF9nZXRfYnlfbmFtZSgpDQogIGlpbzogaW5rZXJuOiBvbmx5IHJldHVy
biBlcnJvciBjb2RlcyBpbiBpaW9fY2hhbm5lbF9nZXRfKigpIEFQSXMNCiAgaWlvOiBpbmtlcm46
IHNwbGl0IG9mX2lpb19jaGFubmVsX2dldF9ieV9uYW1lKCkNCiAgaWlvOiBpbmtlcm46IG1vdmUg
dG8gZndub2RlIHByb3BlcnRpZXMNCiAgdGhlcm1hbDogcWNvbTogcWNvbS1zcG1pLWFkYy10bTU6
IGNvbnZlcnQgdG8gSUlPIGZ3bm9kZSBBUEkNCiAgaWlvOiBhZGM6IGluZ2VuaWMtYWRjOiBjb252
ZXJ0IHRvIElJTyBmd25vZGUgaW50ZXJmYWNlDQogIGlpbzogYWRjOiBhYjg1MDAtZ3BhZGM6IGNv
bnZlcnQgdG8gZGV2aWNlIHByb3BlcnRpZXMNCiAgaWlvOiBhZGM6IGF0OTEtc2FtYTVkMl9hZGM6
IGNvbnZlcnQgdG8gZGV2aWNlIHByb3BlcnRpZXMNCiAgaWlvOiBhZGM6IHFjb20tcG04eHh4LXhv
YWRjOiBjb252ZXJ0IHRvIGRldmljZSBwcm9wZXJ0aWVzDQogIGlpbzogYWRjOiBxY29tLXNwbWkt
dmFkYzogY29udmVydCB0byBkZXZpY2UgcHJvcGVydGllcw0KICBpaW86IGFkYzogcWNvbS1zcG1p
LWFkYzU6IGNvbnZlcnQgdG8gZGV2aWNlIHByb3BlcnRpZXMNCiAgaWlvOiBhZGM6IHN0bTMyLWFk
YzogY29udmVydCB0byBkZXZpY2UgcHJvcGVydGllcw0KICBpaW86IGlua2VybjogcmVtb3ZlIE9G
IGRlcGVuZGVuY2llcw0KICBpaW86IGlua2VybjogZml4IGNvZGluZyBzdHlsZSB3YXJuaW5ncw0K
DQogZHJpdmVycy9paW8vYWRjL2FiODUwMC1ncGFkYy5jICAgICAgICAgICB8ICAyNyArLS0NCiBk
cml2ZXJzL2lpby9hZGMvYXQ5MS1zYW1hNWQyX2FkYy5jICAgICAgIHwgIDMwICstLQ0KIGRyaXZl
cnMvaWlvL2FkYy9pbmdlbmljLWFkYy5jICAgICAgICAgICAgfCAgIDggKy0NCiBkcml2ZXJzL2lp
by9hZGMvcWNvbS1wbTh4eHgteG9hZGMuYyAgICAgIHwgIDU4ICsrKy0tDQogZHJpdmVycy9paW8v
YWRjL3Fjb20tc3BtaS1hZGM1LmMgICAgICAgICB8ICA2MyArKystLS0NCiBkcml2ZXJzL2lpby9h
ZGMvcWNvbS1zcG1pLXZhZGMuYyAgICAgICAgIHwgIDQ0ICsrLS0NCiBkcml2ZXJzL2lpby9hZGMv
c3RtMzItYWRjLmMgICAgICAgICAgICAgIHwgMTI1ICsrKysrKy0tLS0tDQogZHJpdmVycy9paW8v
aW5rZXJuLmMgICAgICAgICAgICAgICAgICAgICB8IDI3MSArKysrKysrKysrKysrLS0tLS0tLS0t
LQ0KIGRyaXZlcnMvdGhlcm1hbC9xY29tL3Fjb20tc3BtaS1hZGMtdG01LmMgfCAgIDMgKy0NCiBp
bmNsdWRlL2xpbnV4L2lpby9jb25zdW1lci5oICAgICAgICAgICAgIHwgIDI4ICstLQ0KIGluY2x1
ZGUvbGludXgvaWlvL2lpby5oICAgICAgICAgICAgICAgICAgfCAgIDggKy0NCiAxMSBmaWxlcyBj
aGFuZ2VkLCAzNTAgaW5zZXJ0aW9ucygrKSwgMzE1IGRlbGV0aW9ucygtKQ0KDQotLSANCjIuMzcu
MQ0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5m
by9saW51eC1zdG0zMgo=
