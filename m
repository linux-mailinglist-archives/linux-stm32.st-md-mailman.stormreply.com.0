Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C67570287
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Jul 2022 14:39:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DCB15C03FE1;
	Mon, 11 Jul 2022 12:39:37 +0000 (UTC)
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com
 [148.163.135.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 75131C03FC7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Jul 2022 12:39:35 +0000 (UTC)
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
 by mx0a-00128a01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26BBf38I026647;
 Mon, 11 Jul 2022 08:38:16 -0400
Received: from nwd2mta4.analog.com ([137.71.173.58])
 by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3h76k6bhuv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Jul 2022 08:38:15 -0400
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
 by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 26BCcEaW000398
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL); 
 Mon, 11 Jul 2022 08:38:14 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Mon, 11 Jul
 2022 08:38:13 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Mon, 11 Jul 2022 08:38:13 -0400
Received: from nsa.ad.analog.com ([10.44.3.53])
 by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 26BCbVE5011687;
 Mon, 11 Jul 2022 08:37:33 -0400
From: =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
To: <linux-arm-msm@vger.kernel.org>, <openbmc@lists.ozlabs.org>,
 <linux-renesas-soc@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-imx@nxp.com>,
 <linux-mips@vger.kernel.org>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 <linux-iio@vger.kernel.org>, <chrome-platform@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-stm32@st-md-mailman.stormreply.com>
Date: Mon, 11 Jul 2022 14:38:20 +0200
Message-ID: <20220711123835.811358-1-nuno.sa@analog.com>
X-Mailer: git-send-email 2.37.0
MIME-Version: 1.0
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: WcE9hls-TN6poatnPpXjvAc08Rg5Ey-4
X-Proofpoint-GUID: WcE9hls-TN6poatnPpXjvAc08Rg5Ey-4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-11_18,2022-07-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 adultscore=0
 mlxlogscore=921 malwarescore=0 spamscore=0 impostorscore=0
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
Subject: [Linux-stm32] [PATCH v2 00/15] make iio inkern interface firmware
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
YUBhbmFsb2cuY29tLw0KDQp2MiBjaGFuZ2VzOg0KDQpbMS8xNV0NCiAgKiBGaXggdHlwbyBhbmQg
YWRkZWQgbW9yZSBkZXNjcmlwdGlvbiBpbiB0aGUgY29tbWl0IG1lc3NhZ2UuDQoNClszLzE1XQ0K
ICAqIFJlbW92ZSBzdXBlcmZsdW91cyBjb2RlOw0KICAqIENvbW1pdCBtZXNzYWdlIHNwZWxsIGZp
eGVzIGFuZCBhZGRlZCBtb3JlIGRldGFpbHM7DQogICogSW1wcm92ZWQgZXJyb3IgaGFuZGxpbmcg
KHRoaXMgaXMgdGhlIG1vc3Qgc2lnbmlmaWNhbnQgY2hhbmdlIGluIHRoaXMNCnZlcnNpb24uIE1v
cmUgZGV0YWlscyBvbiB0aGUgY29tbWl0IG1lc3NhZ2UpLg0KDQpbNC8xNV0NCiAgKiBEcm9wIHRo
ZSAndWdseScgcGFyZW50X2xvb2t1cCBmbGFnLiBXaXRoIHRoZSBuZXcgZXJyb3IgaGFuZGxpbmcs
DQogICAgd2UgY2FuIHVzZSAtRU5PREVWIHRvIGluZmVyIGlmIHdlIHNob3VsZCBwcm9jZWVkIG9y
IG5vdCB3aXRoIHRoZQ0KICAgIGxvb2t1cC4NCg0KWzUvMTVdOg0KICAqIE1vdmVkIHNvbWUgbG9j
YWwgZGVjbGFyYXRpb25zIHVwIHNvIGxvbmcgbGluZXMgZmlyc3Q7DQogICogVXNlICdidXNfZmlu
ZF9kZXZpY2VfYnlfZndub2RlKCknOw0KICAqIFByb3BlciBvcmRlcmluZyBpbiBpbmNsdWRlcy4N
CiAgKiBBZGFwdGVkIGVycm9yIGhhbmRsaW5nIGluICdfX2Z3bm9kZV9paW9fY2hhbm5lbF9nZXRf
YnlfbmFtZSgpJyB0YWtpbmcNCkFDUEkgaW50byBhY2NvdW50IGFuZCB3aGVuICduYW1lJyBpcyBn
aXZlbiBidXQgaW5kZXggPCAwLiBJdCBzZWVtcyB0aGF0DQpBQ1BJIGNvZGUgY2FuIGFjdHVhbGx5
IHJldHVybiAtRU5PRU5UIHdpdGggaW5kZXggPCAwIGZvciB3aGljaCBjYXNlIHdlDQpzaG91bGQg
Y29udGludWUgdGhlIHNlYXJjaC4gTm90IHN1cmUgaWYgYSBjaGVjayAgaW4gQUNQSSAoJ2lmIChp
bmRleCA8IDApDQpyZXR1cm4gLUVJTlZBTDspIGxpa2UgaXMgZG9uZSBpbiBPRiB3b3VsZCBtYWtl
IHNlbnNlLi4uDQoNClsxMi8xNV06DQogICogVXNlICdkZXZpY2VfcHJvcGVydHlfY291bnRfdTY0
KCknIHRvIGdldCB0aGUgbnVtYmVyIG9mIGRpZmYgY2hhbm5lbHMuDQpTbyBubyBuZWVkIGZvciAn
bWFnaWMnIGRpdmlzaW9ucyBieSAyIChubyBpZGVhIHdoeSBJIGhhdmVuJ3QgZG9uZSBsaWtlDQp0
aGlzIGluIHRoZSBmaXJzdCBwbGFjZSkuDQoNClsxNS8xNV0NCiAgKiBGaXggd3JvbmcgY29udmVy
c2lvbiBvZiAnaWYgKHB0ciAhPSBOVUxMKScgdG8gJ2lmICghcHRyKScuDQoNClNwZWNpYWwgbm90
ZSBmb3IgcGF0Y2ggMy8xNSB3aGVyZSAtRU5PREVWIGlzIHN0aWxsIHVzZWQgZGVzcGl0ZSBzb21l
IHRhbGtzDQphYm91dCB1c2luZyAtRU5PRU5UIGFuZCBoZW5jZSwgYmUgbW9yZSBpbiBsaW5lIHdp
dGggZmlybXdhcmUgY29kZS4gVGhlDQpyZWFzb24gSSBrZXB0IGl0IHdhcyB0byBiZSBjb25zaXN0
ZW50IHdpdGggdGhlIHJlc3Qgb2YgdGhlIGZpbGUuIEknZCBzYXkNCnRoYXQgaWYgd2Ugd2FudCB0
byBtb3ZlIHRvIC1FTk9FTlQgd2Ugc2hvdWxkIGRvIGl0IGluIGEgc2VwYXJhdGUgcGF0Y2gNCmFu
ZCBmb3IgdGhlIGNvbXBsZXRlIGZpbGUuDQoNCk51bm8gU8OhICgxNSk6DQogIGlpbzogaW5rZXJu
OiBvbmx5IHJlbGVhc2UgdGhlIGRldmljZSBub2RlIHdoZW4gZG9uZSB3aXRoIGl0DQogIGlpbzog
aW5rZXJuOiBmaXggcmV0dXJuIHZhbHVlIGluIGRldm1fb2ZfaWlvX2NoYW5uZWxfZ2V0X2J5X25h
bWUoKQ0KICBpaW86IGlua2Vybjogb25seSByZXR1cm4gZXJyb3IgY29kZXMgaW4gaWlvX2NoYW5u
ZWxfZ2V0XyooKSBBUElzDQogIGlpbzogaW5rZXJuOiBzcGxpdCBvZl9paW9fY2hhbm5lbF9nZXRf
YnlfbmFtZSgpDQogIGlpbzogaW5rZXJuOiBtb3ZlIHRvIGZ3bm9kZSBwcm9wZXJ0aWVzDQogIHRo
ZXJtYWw6IHFjb206IHFjb20tc3BtaS1hZGMtdG01OiBjb252ZXJ0IHRvIElJTyBmd25vZGUgQVBJ
DQogIGlpbzogYWRjOiBpbmdlbmljLWFkYzogY29udmVydCB0byBJSU8gZndub2RlIGludGVyZmFj
ZQ0KICBpaW86IGFkYzogYWI4NTAwLWdwYWRjOiBjb252ZXJ0IHRvIGRldmljZSBwcm9wZXJ0aWVz
DQogIGlpbzogYWRjOiBhdDkxLXNhbWE1ZDJfYWRjOiBjb252ZXJ0IHRvIGRldmljZSBwcm9wZXJ0
aWVzDQogIGlpbzogYWRjOiBxY29tLXBtOHh4eC14b2FkYzogY29udmVydCB0byBkZXZpY2UgcHJv
cGVydGllcw0KICBpaW86IGFkYzogcWNvbS1zcG1pLXZhZGM6IGNvbnZlcnQgdG8gZGV2aWNlIHBy
b3BlcnRpZXMNCiAgaWlvOiBhZGM6IHFjb20tc3BtaS1hZGM1OiBjb252ZXJ0IHRvIGRldmljZSBw
cm9wZXJ0aWVzDQogIGlpbzogYWRjOiBzdG0zMi1hZGM6IGNvbnZlcnQgdG8gZGV2aWNlIHByb3Bl
cnRpZXMNCiAgaWlvOiBpbmtlcm46IHJlbW92ZSBPRiBkZXBlbmRlbmNpZXMNCiAgaWlvOiBpbmtl
cm46IGZpeCBjb2Rpbmcgc3R5bGUgd2FybmluZ3MNCg0KIGRyaXZlcnMvaWlvL2FkYy9hYjg1MDAt
Z3BhZGMuYyAgICAgICAgICAgfCAgMjcgKy0tDQogZHJpdmVycy9paW8vYWRjL2F0OTEtc2FtYTVk
Ml9hZGMuYyAgICAgICB8ICAzMCArLS0NCiBkcml2ZXJzL2lpby9hZGMvaW5nZW5pYy1hZGMuYyAg
ICAgICAgICAgIHwgICA4ICstDQogZHJpdmVycy9paW8vYWRjL3Fjb20tcG04eHh4LXhvYWRjLmMg
ICAgICB8ICA1OCArKystLQ0KIGRyaXZlcnMvaWlvL2FkYy9xY29tLXNwbWktYWRjNS5jICAgICAg
ICAgfCAgNjMgKysrLS0tDQogZHJpdmVycy9paW8vYWRjL3Fjb20tc3BtaS12YWRjLmMgICAgICAg
ICB8ICA0NCArKy0tDQogZHJpdmVycy9paW8vYWRjL3N0bTMyLWFkYy5jICAgICAgICAgICAgICB8
IDEyMSArKysrKy0tLS0tDQogZHJpdmVycy9paW8vaW5rZXJuLmMgICAgICAgICAgICAgICAgICAg
ICB8IDI3MSArKysrKysrKysrKysrLS0tLS0tLS0tLQ0KIGRyaXZlcnMvdGhlcm1hbC9xY29tL3Fj
b20tc3BtaS1hZGMtdG01LmMgfCAgIDMgKy0NCiBpbmNsdWRlL2xpbnV4L2lpby9jb25zdW1lci5o
ICAgICAgICAgICAgIHwgIDI4ICstLQ0KIGluY2x1ZGUvbGludXgvaWlvL2lpby5oICAgICAgICAg
ICAgICAgICAgfCAgIDggKy0NCiAxMSBmaWxlcyBjaGFuZ2VkLCAzNDcgaW5zZXJ0aW9ucygrKSwg
MzE0IGRlbGV0aW9ucygtKQ0KDQotLSANCjIuMzcuMA0KDQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgt
c3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
