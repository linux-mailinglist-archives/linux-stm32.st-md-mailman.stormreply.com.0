Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F1E757617A
	for <lists+linux-stm32@lfdr.de>; Fri, 15 Jul 2022 14:29:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B4896C640F5;
	Fri, 15 Jul 2022 12:29:56 +0000 (UTC)
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com
 [148.163.135.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C689AC0D2BF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Jul 2022 12:29:54 +0000 (UTC)
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
 by mx0a-00128a01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26FB9r7m028074;
 Fri, 15 Jul 2022 08:29:05 -0400
Received: from nwd2mta3.analog.com ([137.71.173.56])
 by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3h9r37te47-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Jul 2022 08:29:04 -0400
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
 by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 26FCT3An061317
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL); 
 Fri, 15 Jul 2022 08:29:03 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Fri, 15 Jul
 2022 08:29:02 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Fri, 15 Jul 2022 08:29:02 -0400
Received: from nsa.ad.analog.com ([10.44.3.55])
 by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 26FCRxNx001007;
 Fri, 15 Jul 2022 08:28:51 -0400
From: =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
To: <openbmc@lists.ozlabs.org>, <linux-imx@nxp.com>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-iio@vger.kernel.org>, <linux-mips@vger.kernel.org>,
 <linux-renesas-soc@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <chrome-platform@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 <linux-arm-msm@vger.kernel.org>
Date: Fri, 15 Jul 2022 14:28:51 +0200
Message-ID: <20220715122903.332535-4-nuno.sa@analog.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220715122903.332535-1-nuno.sa@analog.com>
References: <20220715122903.332535-1-nuno.sa@analog.com>
MIME-Version: 1.0
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: _fHFyVnBt1JyKX4jrH56OTR187qkYJmU
X-Proofpoint-ORIG-GUID: _fHFyVnBt1JyKX4jrH56OTR187qkYJmU
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
 Daniel Lezcano <daniel.lezcano@linaro.org>, Haibo Chen <haibo.chen@nxp.com>,
 Christophe Branchereau <cbranchereau@gmail.com>, Nancy Yuen <yuenn@google.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Andy Gross <agross@kernel.org>,
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
Subject: [Linux-stm32] [PATCH v3 03/15] iio: inkern: only return error codes
	in iio_channel_get_*() APIs
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
X2dldF9hbGwoKSB3ZXJlCnJldHVybmluZyBhIG1peCBvZiBOVUxMIGFuZCBwb2ludGVycyB3aXRo
IE5VTEwgYmVpbmcgdGhlIHdheSB0bwoibm90aWZ5IiB0aGF0IHdlIHNob3VsZCBkbyBhICJzeXN0
ZW0iIGxvb2t1cCBmb3IgY2hhbm5lbHMuIFRoaXMgbWFrZQppdCB2ZXJ5IGNvbmZ1c2luZyBhbmQg
cHJvbmUgdG8gZXJyb3JzIGFzIGNvbW1pdCA5ZjYzY2MwOTIxZWMKKCJpaW86IGlua2VybjogZml4
IHJldHVybiB2YWx1ZSBpbiBkZXZtX29mX2lpb19jaGFubmVsX2dldF9ieV9uYW1lKCkiKQpwcm92
ZXMuIE9uIHRvcCBvZiB0aGlzLCBwYXR0ZXJucyBsaWtlICdpZiAoY2hhbm5lbCAhPSBOVUxMKSBy
ZXR1cm4KY2hhbm5lbCcgd2VyZSBiZWluZyB1c2VkIHdoZXJlIGNoYW5uZWwgY291bGQgYWN0dWFs
bHkgYmUgYW4gZXJyb3IgY29kZQp3aGljaCBtYWtlcyB0aGUgY29kZSBoYXJkIHRvIHJlYWQuCgpU
aGlzIGNoYW5nZSBhbHNvIG1ha2VzIHNvbWUgZnVuY3Rpb25hbCBjaGFuZ2VzIG9uIGhvdyBlcnJv
cnMgd2VyZSBiZWluZwpoYW5kbGVkLiBJbiB0aGUgb3JpZ2luYWwgYmVoYXZpb3IsIGV2ZW4gaWYg
d2UgZ2V0IGFuIGVycm9yIGxpa2UgJy1FTk9NRU0nLAp3ZSBzdGlsbCBjb250aW51ZSB3aXRoIHRo
ZSBzZWFyY2guIFdlIHNob3VsZCBvbmx5IGNvbnRpbnVlIHRvIGxvb2t1cCBmb3IKdGhlIGNoYW5u
ZWwgd2hlbiBpdCBtYWtlcyBzZW5zZSB0byBkbyBzby4gSGVuY2UsIHRoZSBtYWluIGVycm9yIGhh
bmRsaW5nCmluICdvZl9paW9fY2hhbm5lbF9nZXRfYnlfbmFtZSgpJyBpcyBjaGFuZ2VkIHRvIHRo
ZSBmb2xsb3dpbmcgbG9naWM6CgogKiBJZiBhIGNoYW5uZWwgJ25hbWUnIGlzIHByb3ZpZGVkIGFu
ZCB3ZSBkbyBmaW5kIGl0IHZpYQonaW8tY2hhbm5lbC1uYW1lcycsIHdlIHNob3VsZCBiZSBhYmxl
IHRvIGdldCBpdC4gSWYgd2UgZ2V0IGFueSBlcnJvciwKd2Ugc2hvdWxkIG5vdCBwcm9jZWVkIHdp
dGggdGhlIGxvb2t1cC4gTW9yZW92ZXIsIHdlIHNob3VsZCByZXR1cm4gYW4gZXJyb3IKc28gdGhh
dCBjYWxsZXJzIHdvbid0IHByb2NlZWQgd2l0aCBhIHN5c3RlbSBsb29rdXAuCiAqIElmIGEgY2hh
bm5lbCAnbmFtZScgaXMgcHJvdmlkZWQgYW5kIHdlIGNhbm5vdCBmaW5kIGl0ICgnaW5kZXggPCAw
JyksCidvZl9wYXJzZV9waGFuZGxlX3dpdGhfYXJncygpJyBpcyBleHBlY3RlZCB0byBmYWlsIHdp
dGggJy1FSU5WQUwnLiBIZW5jZSwKd2Ugc2hvdWxkIG9ubHkgY29udGludWUgaWYgd2UgZ2V0IHRo
YXQgZXJyb3IuCiAqIElmIGEgY2hhbm5lbCAnbmFtZScgaXMgbm90IHByb3ZpZGVkIHdlIHNob3Vs
ZCBvbmx5IGNhcnJ5IG9uIHdpdGggdGhlCnNlYXJjaCBpZiAnb2ZfcGFyc2VfcGhhbmRsZV93aXRo
X2FyZ3MoKScgcmV0dXJucyAnLUVOT0VOVCcuCgpBbHNvIG5vdGUgdGhhdCBhIHN5c3RlbSBjaGFu
bmVsIGxvb2t1cCBpcyBvbmx5IGRvbmUgaWYgdGhlIHJldHVybmVkCmVycm9yIGNvZGUgKGZyb20g
J29mX2lpb19jaGFubmVsX2dldF9ieV9uYW1lKCknIG9yCidvZl9paW9fY2hhbm5lbF9nZXRfYWxs
KCknIGlzIC1FTk9ERVYuCgpTaWduZWQtb2ZmLWJ5OiBOdW5vIFPDoSA8bnVuby5zYUBhbmFsb2cu
Y29tPgpSZXZpZXdlZC1ieTogQW5keSBTaGV2Y2hlbmtvIDxhbmR5LnNoZXZjaGVua29AZ21haWwu
Y29tPgotLS0KIGRyaXZlcnMvaWlvL2lua2Vybi5jIHwgNTQgKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKy0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAzOCBpbnNlcnRpb25zKCsp
LCAxNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2lpby9pbmtlcm4uYyBiL2Ry
aXZlcnMvaWlvL2lua2Vybi5jCmluZGV4IDg3ZmQyYTBkNDRmMi4uYzZmMWNmZTA5YmQzIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2lpby9pbmtlcm4uYworKysgYi9kcml2ZXJzL2lpby9pbmtlcm4uYwpA
QCAtMjE0LDcgKzIxNCw3IEBAIHN0YXRpYyBzdHJ1Y3QgaWlvX2NoYW5uZWwgKm9mX2lpb19jaGFu
bmVsX2dldChzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wLCBpbnQgaW5kZXgpCiBzdHJ1Y3QgaWlvX2No
YW5uZWwgKm9mX2lpb19jaGFubmVsX2dldF9ieV9uYW1lKHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnAs
CiAJCQkJCSAgICAgICBjb25zdCBjaGFyICpuYW1lKQogewotCXN0cnVjdCBpaW9fY2hhbm5lbCAq
Y2hhbiA9IE5VTEw7CisJc3RydWN0IGlpb19jaGFubmVsICpjaGFuOwogCiAJLyogV2FsayB1cCB0
aGUgdHJlZSBvZiBkZXZpY2VzIGxvb2tpbmcgZm9yIGEgbWF0Y2hpbmcgaWlvIGNoYW5uZWwgKi8K
IAl3aGlsZSAobnApIHsKQEAgLTIzMSwxMyArMjMxLDMzIEBAIHN0cnVjdCBpaW9fY2hhbm5lbCAq
b2ZfaWlvX2NoYW5uZWxfZ2V0X2J5X25hbWUoc3RydWN0IGRldmljZV9ub2RlICpucCwKIAkJCQkJ
CQkgbmFtZSk7CiAJCWNoYW4gPSBvZl9paW9fY2hhbm5lbF9nZXQobnAsIGluZGV4KTsKIAkJaWYg
KCFJU19FUlIoY2hhbikgfHwgUFRSX0VSUihjaGFuKSA9PSAtRVBST0JFX0RFRkVSKQotCQkJYnJl
YWs7Ci0JCWVsc2UgaWYgKG5hbWUgJiYgaW5kZXggPj0gMCkgewotCQkJcHJfZXJyKCJFUlJPUjog
Y291bGQgbm90IGdldCBJSU8gY2hhbm5lbCAlcE9GOiVzKCVpKVxuIiwKLQkJCQlucCwgbmFtZSA/
IG5hbWUgOiAiIiwgaW5kZXgpOwotCQkJcmV0dXJuIE5VTEw7CisJCQlyZXR1cm4gY2hhbjsKKwkJ
aWYgKG5hbWUpIHsKKwkJCWlmIChpbmRleCA+PSAwKSB7CisJCQkJcHJfZXJyKCJFUlJPUjogY291
bGQgbm90IGdldCBJSU8gY2hhbm5lbCAlcE9GOiVzKCVpKVxuIiwKKwkJCQkgICAgICAgbnAsIG5h
bWUsIGluZGV4KTsKKwkJCQkvKgorCQkJCSAqIEluIHRoaXMgY2FzZSwgd2UgZm91bmQgJ25hbWUn
IGluICdpby1jaGFubmVsLW5hbWVzJworCQkJCSAqIGJ1dCBzb21laG93IHdlIHN0aWxsIGZhaWwg
c28gdGhhdCB3ZSBzaG91bGQgbm90IHByb2NlZWQKKwkJCQkgKiB3aXRoIGFueSBvdGhlciBsb29r
dXAuIEhlbmNlLCBleHBsaWNpdGx5IHJldHVybiAtRUlOVkFMCisJCQkJICogKG1heWJlIG5vdCB0
aGUgYmV0dGVyIGVycm9yIGNvZGUpIHNvIHRoYXQgdGhlIGNhbGxlcgorCQkJCSAqIHdvbid0IGRv
IGEgc3lzdGVtIGxvb2t1cC4KKwkJCQkgKi8KKwkJCQlyZXR1cm4gRVJSX1BUUigtRUlOVkFMKTsK
KwkJCX0KKwkJCS8qIElmIGluZGV4IDwgMCwgdGhlbiBvZl9wYXJzZV9waGFuZGxlX3dpdGhfYXJn
cygpIGZhaWxzCisJCQkgKiB3aXRoIC1FSU5WQUwgd2hpY2ggaXMgZXhwZWN0ZWQuIFdlIHNob3Vs
ZCBub3QgcHJvY2VlZAorCQkJICogaWYgd2UgZ2V0IGFueSBvdGhlciBlcnJvci4KKwkJCSAqLwor
CQkJaWYgKFBUUl9FUlIoY2hhbikgIT0gLUVJTlZBTCkKKwkJCQlyZXR1cm4gY2hhbjsKKwkJfSBl
bHNlIGlmIChQVFJfRVJSKGNoYW4pICE9IC1FTk9FTlQpIHsKKwkJCS8qCisJCQkgKiBpZiAhbmFt
ZSwgdGhlbiB3ZSBzaG91bGQgb25seSBwcm9jZWVkIHRoZSBsb29rdXAgaWYKKwkJCSAqIG9mX3Bh
cnNlX3BoYW5kbGVfd2l0aF9hcmdzKCkgcmV0dXJucyAtRU5PRU5ULgorCQkJICovCisJCQlyZXR1
cm4gY2hhbjsKIAkJfQotCiAJCS8qCiAJCSAqIE5vIG1hdGNoaW5nIElJTyBjaGFubmVsIGZvdW5k
IG9uIHRoaXMgbm9kZS4KIAkJICogSWYgdGhlIHBhcmVudCBub2RlIGhhcyBhICJpby1jaGFubmVs
LXJhbmdlcyIgcHJvcGVydHksCkBAIC0yNDUsMTAgKzI2NSwxMCBAQCBzdHJ1Y3QgaWlvX2NoYW5u
ZWwgKm9mX2lpb19jaGFubmVsX2dldF9ieV9uYW1lKHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnAsCiAJ
CSAqLwogCQlucCA9IG5wLT5wYXJlbnQ7CiAJCWlmIChucCAmJiAhb2ZfZ2V0X3Byb3BlcnR5KG5w
LCAiaW8tY2hhbm5lbC1yYW5nZXMiLCBOVUxMKSkKLQkJCXJldHVybiBOVUxMOworCQkJcmV0dXJu
IEVSUl9QVFIoLUVOT0RFVik7CiAJfQogCi0JcmV0dXJuIGNoYW47CisJcmV0dXJuIEVSUl9QVFIo
LUVOT0RFVik7CiB9CiBFWFBPUlRfU1lNQk9MX0dQTChvZl9paW9fY2hhbm5lbF9nZXRfYnlfbmFt
ZSk7CiAKQEAgLTI2Nyw4ICsyODcsOCBAQCBzdGF0aWMgc3RydWN0IGlpb19jaGFubmVsICpvZl9p
aW9fY2hhbm5lbF9nZXRfYWxsKHN0cnVjdCBkZXZpY2UgKmRldikKIAkJCWJyZWFrOwogCX0gd2hp
bGUgKCsrbnVtbWFwcyk7CiAKLQlpZiAobnVtbWFwcyA9PSAwKQkvKiBubyBlcnJvciwgcmV0dXJu
IE5VTEwgdG8gc2VhcmNoIG1hcCB0YWJsZSAqLwotCQlyZXR1cm4gTlVMTDsKKwlpZiAobnVtbWFw
cyA9PSAwKQorCQlyZXR1cm4gRVJSX1BUUigtRU5PREVWKTsKIAogCS8qIE5VTEwgdGVybWluYXRl
ZCBhcnJheSB0byBzYXZlIHBhc3Npbmcgc2l6ZSAqLwogCWNoYW5zID0ga2NhbGxvYyhudW1tYXBz
ICsgMSwgc2l6ZW9mKCpjaGFucyksIEdGUF9LRVJORUwpOwpAQCAtMjk1LDcgKzMxNSw3IEBAIHN0
YXRpYyBzdHJ1Y3QgaWlvX2NoYW5uZWwgKm9mX2lpb19jaGFubmVsX2dldF9hbGwoc3RydWN0IGRl
dmljZSAqZGV2KQogCiBzdGF0aWMgaW5saW5lIHN0cnVjdCBpaW9fY2hhbm5lbCAqb2ZfaWlvX2No
YW5uZWxfZ2V0X2FsbChzdHJ1Y3QgZGV2aWNlICpkZXYpCiB7Ci0JcmV0dXJuIE5VTEw7CisJcmV0
dXJuIEVSUl9QVFIoLUVOT0RFVik7CiB9CiAKICNlbmRpZiAvKiBDT05GSUdfT0YgKi8KQEAgLTM2
Miw3ICszODIsNyBAQCBzdHJ1Y3QgaWlvX2NoYW5uZWwgKmlpb19jaGFubmVsX2dldChzdHJ1Y3Qg
ZGV2aWNlICpkZXYsCiAJaWYgKGRldikgewogCQljaGFubmVsID0gb2ZfaWlvX2NoYW5uZWxfZ2V0
X2J5X25hbWUoZGV2LT5vZl9ub2RlLAogCQkJCQkJICAgICBjaGFubmVsX25hbWUpOwotCQlpZiAo
Y2hhbm5lbCAhPSBOVUxMKQorCQlpZiAoIUlTX0VSUihjaGFubmVsKSB8fCBQVFJfRVJSKGNoYW5u
ZWwpICE9IC1FTk9ERVYpCiAJCQlyZXR1cm4gY2hhbm5lbDsKIAl9CiAKQEAgLTQxMiw4ICs0MzIs
NiBAQCBzdHJ1Y3QgaWlvX2NoYW5uZWwgKmRldm1fb2ZfaWlvX2NoYW5uZWxfZ2V0X2J5X25hbWUo
c3RydWN0IGRldmljZSAqZGV2LAogCWNoYW5uZWwgPSBvZl9paW9fY2hhbm5lbF9nZXRfYnlfbmFt
ZShucCwgY2hhbm5lbF9uYW1lKTsKIAlpZiAoSVNfRVJSKGNoYW5uZWwpKQogCQlyZXR1cm4gY2hh
bm5lbDsKLQlpZiAoIWNoYW5uZWwpCi0JCXJldHVybiBFUlJfUFRSKC1FTk9ERVYpOwogCiAJcmV0
ID0gZGV2bV9hZGRfYWN0aW9uX29yX3Jlc2V0KGRldiwgZGV2bV9paW9fY2hhbm5lbF9mcmVlLCBj
aGFubmVsKTsKIAlpZiAocmV0KQpAQCAtNDM2LDcgKzQ1NCwxMSBAQCBzdHJ1Y3QgaWlvX2NoYW5u
ZWwgKmlpb19jaGFubmVsX2dldF9hbGwoc3RydWN0IGRldmljZSAqZGV2KQogCQlyZXR1cm4gRVJS
X1BUUigtRUlOVkFMKTsKIAogCWNoYW5zID0gb2ZfaWlvX2NoYW5uZWxfZ2V0X2FsbChkZXYpOwot
CWlmIChjaGFucykKKwkvKgorCSAqIFdlIG9ubHkgd2FudCB0byBjYXJyeSBvbiBpZiB0aGUgZXJy
b3IgaXMgLUVOT0RFVi4gIEFueXRoaW5nIGVsc2UKKwkgKiBzaG91bGQgYmUgcmVwb3J0ZWQgdXAg
dGhlIHN0YWNrLgorCSAqLworCWlmICghSVNfRVJSKGNoYW5zKSB8fCBQVFJfRVJSKGNoYW5zKSAh
PSAtRU5PREVWKQogCQlyZXR1cm4gY2hhbnM7CiAKIAluYW1lID0gZGV2X25hbWUoZGV2KTsKLS0g
CjIuMzcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlz
dGluZm8vbGludXgtc3RtMzIK
