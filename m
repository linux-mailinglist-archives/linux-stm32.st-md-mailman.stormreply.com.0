Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DFEA545F9C
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Jun 2022 10:47:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F2A65C60490;
	Fri, 10 Jun 2022 08:47:00 +0000 (UTC)
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com
 [148.163.135.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C0601C5F1F9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Jun 2022 08:46:59 +0000 (UTC)
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
 by mx0a-00128a01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25A5dcRs010610;
 Fri, 10 Jun 2022 04:45:32 -0400
Received: from nwd2mta4.analog.com ([137.71.173.58])
 by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3gm00mh1h4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Jun 2022 04:45:31 -0400
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
 by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 25A8jTCo027432
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL); 
 Fri, 10 Jun 2022 04:45:29 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Fri, 10 Jun
 2022 04:45:28 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Fri, 10 Jun 2022 04:45:28 -0400
Received: from nsa.ad.analog.com ([10.44.3.70])
 by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 25A8imiM014275;
 Fri, 10 Jun 2022 04:44:51 -0400
From: =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
To: <linux-imx@nxp.com>, <linux-renesas-soc@vger.kernel.org>,
 <linux-mips@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <chrome-platform@lists.linux.dev>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 <linux-mediatek@lists.infradead.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-msm@vger.kernel.org>, <linux-iio@vger.kernel.org>,
 <openbmc@lists.ozlabs.org>
Date: Fri, 10 Jun 2022 10:45:11 +0200
Message-ID: <20220610084545.547700-1-nuno.sa@analog.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: ECPDV-TWick4LVOEVuc0kdMXUUX-GpEN
X-Proofpoint-GUID: ECPDV-TWick4LVOEVuc0kdMXUUX-GpEN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-10_02,2022-06-09_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=999 lowpriorityscore=0 suspectscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 clxscore=1011 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206100031
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
Subject: [Linux-stm32] [PATCH 00/34] make iio inkern interface firmware
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

VGhlIG1haW4gZ29hbCBvZiB0aGlzIHBhdGNoc2V0IGlzIHRvIGNvbnZlcnQgdGhlIGlpbyBpbmtl
cm4gaW50ZXJmYWNlIHRvDQpiZSBmaXJtd2FyZSBhZ25vc3RpYy4gU29tZSBwcmV2aW91cyBkaXNj
dXNzaW9uIHdhcyBkb25lIGluIGhlcmUgWzFdLg0KVGhvdWdoIHNvbWV0aGluZyBvZGQgaGFwcGVu
ZWQgd2hpbGUgc2VuZGluZyB0aGUgcGF0Y2hlcyBhbmQgdGhlIFJGQw0KYWN0dWFsbHkgbmV2ZXIg
bGFuZGVkIGluIHRoZSBJSU8gbGlzdCAoaG9wZWZ1bGx5IG5vdyB3b3Jrcyk6DQoNCkFzIHN1Z2dl
c3RlZCBieSBBbmR5LCB0aGUgc2VyaWVzIGNhbiBiZSBzZWVuIGluIHRocmVlIGJsb2NrczoNCg0K
MSkgIkZpeCIgYWxsIGRyaXZlcnMgdGhhdCB3ZXJlIHJlbHlpbmcgb24gaWlvLmggZm9yIHNwZWNp
ZmljIGhlYWRlcg0KZmlsZXMgKG1haW5seSBvZi5oIGFuZCBtb2RfZGV2aWNldGFibGUuaCkuIEFm
dGVyIHRoYXQgd2UgY2FuIGRyb3ANCm9mLmggZnJvbSBpaW8uaCBhbmQganVzdCBmb3J3YXJkIGRl
Y2xhcmUgd2hhdCB3ZSBuZWVkLg0KDQoyKSBNb3ZlICJtb3N0IiBvZiB0aGUgSUlPIGluIGtlcm5l
bCBpbnRlcmZhY2UgdG8gRlcgQVBJLiBBdCB0aGlzIHBvaW50LA0KdGhlcmUncyBzdGlsbCBzb21l
IE9GIGRlcGVuZGVudCBBUEkgaW4gcGxhY2Ugc28gdGhhdCB1c2VycyBhcmUgbm90IGJyb2tlbi4N
Cg0KMykgTW92ZSBhbGwgdXNlcnMgb2YgdGhlIElJTyBpbiBrZXJuZWwgaW50ZXJmYWNlIHRvIHRo
ZSBGVyBBUEkgYW5kIHdpdGgNCnRoYXQsIG1ha2UgSUlPIGZpcm13YXJlIGFnbm9zdGljLg0KDQpP
biAzKSwgdGhlIHFjb20tc3BtaS1hZGMtdG01LmMgZHJpdmVyIHdhcyBvbmx5IGNvbnZlcnRlZCB0
byB1c2UgdGhlIElJTw0KQVBJIHdoaWxlIG9uIHRoZSBJSU8gZHJpdmVycyBhIGZ1bGwgZHJpdmVy
IGNvbnZlcnNpb24gd2FzIGRvbmUuIFRoZQ0KdGhlcm1hbCBvbmUgd291bGQgYmUgcmVhbGx5IG5v
biB0cml2aWFsIGFzIHdlIHdvdWxkIGFsc28gbmVlZCB0byB0b3VjaCB0aGUNCnN1YnN5c3RlbS4g
T24gdGhlIElJTyBkcml2ZXJzLCB0aGUgY29udmVyc2lvbnMgd2VyZSBtb3N0bHkgcGVhY2VmdWxs
DQooYXBwYXJlbnRseSkuIFNwZWNpYWwgY2FyZSBmb3IgdGhlIHN0bTMyLWFkYy5jIGRyaXZlciB0
aG91Z2ggYXMgdGhhdCBvbmUNCndhcyBmYXIgZnJvbSBiZWluZyBzdHJhaWdodCA6KS4NCg0KTGFz
dGx5LCB0aGlzIGlzIG9ubHkgY29tcGlsZSB0ZXN0ZWQgd2l0aCBhbGx5ZXNjb25maWcgZm9yIGFy
bSBhbmQgYXJtNjQuDQpXaGlsZSBJIHN1cmVseSBjYW4gY29tZSB1cCB3aXRoIHNvbWUgZHVtbXkg
ZGV2aWNlcyB0byBtYWtlIHN1cmUgSSBjYW4gc3RpbGwNCnByb3Blcmx5IGdldCBJSU8gY2hhbm5l
bHMsIGhhdmluZyBwcm9wZXIgdGVzdGVkLWJ5IHRhZ3Mgb24gcGxhdGZvcm1zDQpyZWx5aW5nIG9u
IHRoaXMgaW50ZXJmYWNlIHdvdWxkIGJlIHZlcnkgYXBwcmVjaWF0ZWQgKGFuZCBJIHN1c3BlY3Qg
Sm9uYXRoYW4NCndpbGwgcmVxdWlyZSBpdCkuDQoNClsxXTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvbGludXgtaWlvLzIwMjIwNjA0MTQxOTI1LjEyOWYwZmZlQGppYzIzLWh1YXdlaS9ULyNtZmQ1
Y2NkNzkzODQxNTY5MTgyZTRmODMxZjJjNDYwODliNjY1YzM0Ng0KDQpOdW5vIFPDoSAoMzQpOg0K
ICBpaW86IGFkYzogYWQ3NjA2OiBleHBsaWNpdGx5IGFkZCBwcm9wZXIgaGVhZGVyIGZpbGVzDQog
IGlpbzogYWRjOiBhZDc2MDZfcGFyOiBleHBsaWNpdGx5IGFkZCBwcm9wZXIgaGVhZGVyIGZpbGVz
DQogIGlpbzogYWRjOiBiZXJsaW4yLWFkYzogZXhwbGljaXRseSBhZGQgcHJvcGVyIGhlYWRlciBm
aWxlcw0KICBpaW86IGFkYzogaW14N2RfYWRjOiBleHBsaWNpdGx5IGFkZCBwcm9wZXIgaGVhZGVy
IGZpbGVzDQogIGlpbzogYWRjOiBpbXg4cXhwLWFkYzogZXhwbGljaXRseSBhZGQgcHJvcGVyIGhl
YWRlciBmaWxlcw0KICBpaW86IGFkYzogaW5nZW5pYy1hZGM6IGV4cGxpY2l0bHkgYWRkIHByb3Bl
ciBoZWFkZXIgZmlsZXMNCiAgaWlvOiBhZGM6IG1wMjYyOV9hZGM6IGV4cGxpY2l0bHkgYWRkIHBy
b3BlciBoZWFkZXIgZmlsZXMNCiAgaWlvOiBhZGM6IG10NjM2MC1hZGM6IGV4cGxpY2l0bHkgYWRk
IHByb3BlciBoZWFkZXIgZmlsZXMNCiAgaWlvOiBhZGM6IG5wY21fYWRjOiBleHBsaWNpdGx5IGFk
ZCBwcm9wZXIgaGVhZGVyIGZpbGVzDQogIGlpbzogYWRjOiByemcybF9hZGM6IGV4cGxpY2l0bHkg
YWRkIHByb3BlciBoZWFkZXIgZmlsZXMNCiAgaWlvOiBjb21tb246IGNyb3NfZWNfbGlkX2FuZ2xl
OiBleHBsaWNpdGx5IGFkZCBwcm9wZXIgaGVhZGVyIGZpbGVzDQogIGlpbzogY29tbW9uOiBjcm9z
X2VjX3NlbnNvcnM6IGV4cGxpY2l0bHkgYWRkIHByb3BlciBoZWFkZXIgZmlsZXMNCiAgaWlvOiBk
YWM6IHN0bTMyLWRhYzogZXhwbGljaXRseSBhZGQgcHJvcGVyIGhlYWRlciBmaWxlcw0KICBpaW86
IGRhYzogdmY2MTBfZGFjOiBleHBsaWNpdGx5IGFkZCBwcm9wZXIgaGVhZGVyIGZpbGVzDQogIGlp
bzogaHVtaWRpdHk6IGh0czIyMV9idWZmZXI6IGV4cGxpY2l0bHkgYWRkIHByb3BlciBoZWFkZXIg
ZmlsZXMNCiAgaWlvOiBsaWdodDogY3Jvc19lY19saWdodF9wcm94OiBleHBsaWNpdGx5IGFkZCBw
cm9wZXIgaGVhZGVyIGZpbGVzDQogIGlpbzogcHJlc3N1cmU6IGNyb3NfZWNfYmFybzogZXhwbGlj
aXRseSBhZGQgcHJvcGVyIGhlYWRlciBmaWxlcw0KICBpaW86IHRyaWdnZXI6IHN0bTMyLWxwdGlt
ZXItdHJpZ2dlcjogZXhwbGljaXRseSBhZGQgcHJvcGVyIGhlYWRlcg0KICAgIGZpbGVzDQogIGlp
bzogY29yZTogZHJvcCBvZi5oIGZyb20gaWlvLmgNCiAgaWlvOiBpbmtlcm46IG9ubHkgcmVsYXNl
IHRoZSBkZXZpY2Ugbm9kZSB3aGVuIGRvbmUgd2l0aCBpdA0KICBpaW86IGlua2VybjogZml4IHJl
dHVybiB2YWx1ZSBpbiBkZXZtX29mX2lpb19jaGFubmVsX2dldF9ieV9uYW1lKCkNCiAgaWlvOiBp
bmtlcm46IG9ubHkgcmV0dXJuIGVycm9yIGNvZGVzIGluIGlpb19jaGFubmVsX2dldF8qKCkgQVBJ
cw0KICBpaW86IGlua2Vybjogc3BsaXQgb2ZfaWlvX2NoYW5uZWxfZ2V0X2J5X25hbWUoKQ0KICBp
aW86IGlua2VybjogbW92ZSB0byBmd25vZGUgcHJvcGVydGllcw0KICB0aGVybWFsOiBxY29tOiBx
Y29tLXNwbWktYWRjLXRtNTogY29udmVydCB0byBJSU8gZndub2RlIEFQSQ0KICBpaW86IGFkYzog
aW5nZW5pYy1hZGM6IGNvbnZlcnQgdG8gSUlPIGZ3bm9kZSBpbnRlcmZhY2UNCiAgaWlvOiBhZGM6
IGFiODUwMC1ncGFkYzogY29udmVydCB0byBkZXZpY2UgcHJvcGVydGllcw0KICBpaW86IGFkYzog
YXQ5MS1zYW1hNWQyX2FkYzogY29udmVydCB0byBkZXZpY2UgcHJvcGVydGllcw0KICBpaW86IGFk
YzogcWNvbS1wbTh4eHgteG9hZGM6IGNvbnZlcnQgdG8gZGV2aWNlIHByb3BlcnRpZXMNCiAgaWlv
OiBhZGM6IHFjb20tc3BtaS12YWRjOiBjb252ZXJ0IHRvIGRldmljZSBwcm9wZXJ0aWVzDQogIGlp
bzogYWRjOiBxY29tLXNwbWktYWRjNTogY29udmVydCB0byBkZXZpY2UgcHJvcGVydGllcw0KICBp
aW86IGFkYzogc3RtMzItYWRjOiBjb252ZXJ0IHRvIGRldmljZSBwcm9wZXJ0aWVzDQogIGlpbzog
aW5rZXJuOiByZW1vdmUgT0YgZGVwZW5kZW5jaWVzDQogIGlpbzogaW5rZXJuOiBmaXggY29kaW5n
IHN0eWxlIHdhcm5pbmdzDQoNCiBkcml2ZXJzL2lpby9hZGMvYWI4NTAwLWdwYWRjLmMgICAgICAg
ICAgICAgICAgfCAgMjcgKy0NCiBkcml2ZXJzL2lpby9hZGMvYWQ3NjA2LmMgICAgICAgICAgICAg
ICAgICAgICAgfCAgIDEgKw0KIGRyaXZlcnMvaWlvL2FkYy9hZDc2MDZfcGFyLmMgICAgICAgICAg
ICAgICAgICB8ICAgMSArDQogZHJpdmVycy9paW8vYWRjL2F0OTEtc2FtYTVkMl9hZGMuYyAgICAg
ICAgICAgIHwgIDMwICstLQ0KIGRyaXZlcnMvaWlvL2FkYy9iZXJsaW4yLWFkYy5jICAgICAgICAg
ICAgICAgICB8ICAgMiArDQogZHJpdmVycy9paW8vYWRjL2lteDdkX2FkYy5jICAgICAgICAgICAg
ICAgICAgIHwgICAxICsNCiBkcml2ZXJzL2lpby9hZGMvaW14OHF4cC1hZGMuYyAgICAgICAgICAg
ICAgICAgfCAgIDEgKw0KIGRyaXZlcnMvaWlvL2FkYy9pbmdlbmljLWFkYy5jICAgICAgICAgICAg
ICAgICB8ICAgOSArLQ0KIGRyaXZlcnMvaWlvL2FkYy9tcDI2MjlfYWRjLmMgICAgICAgICAgICAg
ICAgICB8ICAgMSArDQogZHJpdmVycy9paW8vYWRjL210NjM2MC1hZGMuYyAgICAgICAgICAgICAg
ICAgIHwgICAxICsNCiBkcml2ZXJzL2lpby9hZGMvbnBjbV9hZGMuYyAgICAgICAgICAgICAgICAg
ICAgfCAgIDEgKw0KIGRyaXZlcnMvaWlvL2FkYy9xY29tLXBtOHh4eC14b2FkYy5jICAgICAgICAg
ICB8ICA1OCArKy0tLQ0KIGRyaXZlcnMvaWlvL2FkYy9xY29tLXNwbWktYWRjNS5jICAgICAgICAg
ICAgICB8ICA2MyArKystLQ0KIGRyaXZlcnMvaWlvL2FkYy9xY29tLXNwbWktdmFkYy5jICAgICAg
ICAgICAgICB8ICA0NCArKy0tDQogZHJpdmVycy9paW8vYWRjL3J6ZzJsX2FkYy5jICAgICAgICAg
ICAgICAgICAgIHwgICAxICsNCiBkcml2ZXJzL2lpby9hZGMvc3RtMzItYWRjLmMgICAgICAgICAg
ICAgICAgICAgfCAxMjggKysrKystLS0tLQ0KIC4uLi9jcm9zX2VjX3NlbnNvcnMvY3Jvc19lY19s
aWRfYW5nbGUuYyAgICAgICB8ICAgMSArDQogLi4uL2NvbW1vbi9jcm9zX2VjX3NlbnNvcnMvY3Jv
c19lY19zZW5zb3JzLmMgIHwgICAxICsNCiBkcml2ZXJzL2lpby9kYWMvc3RtMzItZGFjLmMgICAg
ICAgICAgICAgICAgICAgfCAgIDIgKw0KIGRyaXZlcnMvaWlvL2RhYy92ZjYxMF9kYWMuYyAgICAg
ICAgICAgICAgICAgICB8ICAgMSArDQogZHJpdmVycy9paW8vaHVtaWRpdHkvaHRzMjIxX2J1ZmZl
ci5jICAgICAgICAgIHwgICAxICsNCiBkcml2ZXJzL2lpby9pbmtlcm4uYyAgICAgICAgICAgICAg
ICAgICAgICAgICAgfCAyNDEgKysrKysrKysrLS0tLS0tLS0tDQogZHJpdmVycy9paW8vbGlnaHQv
Y3Jvc19lY19saWdodF9wcm94LmMgICAgICAgIHwgICAxICsNCiBkcml2ZXJzL2lpby9wcmVzc3Vy
ZS9jcm9zX2VjX2Jhcm8uYyAgICAgICAgICAgfCAgIDEgKw0KIGRyaXZlcnMvaWlvL3RyaWdnZXIv
c3RtMzItbHB0aW1lci10cmlnZ2VyLmMgICB8ICAgMSArDQogZHJpdmVycy90aGVybWFsL3Fjb20v
cWNvbS1zcG1pLWFkYy10bTUuYyAgICAgIHwgICAzICstDQogaW5jbHVkZS9saW51eC9paW8vY29u
c3VtZXIuaCAgICAgICAgICAgICAgICAgIHwgIDI4ICstDQogaW5jbHVkZS9saW51eC9paW8vaWlv
LmggICAgICAgICAgICAgICAgICAgICAgIHwgICA5ICstDQogMjggZmlsZXMgY2hhbmdlZCwgMzQ3
IGluc2VydGlvbnMoKyksIDMxMiBkZWxldGlvbnMoLSkNCg0KLS0gDQoyLjM2LjENCg0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFp
bGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6
Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3Rt
MzIK
