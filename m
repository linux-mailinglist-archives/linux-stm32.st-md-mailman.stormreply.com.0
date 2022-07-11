Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D42F357029E
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Jul 2022 14:40:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 981AAC03FE1;
	Mon, 11 Jul 2022 12:40:03 +0000 (UTC)
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com
 [148.163.135.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4981EC03FC4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Jul 2022 12:40:02 +0000 (UTC)
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
 by mx0a-00128a01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26BCAAMR026688;
 Mon, 11 Jul 2022 08:39:12 -0400
Received: from nwd2mta3.analog.com ([137.71.173.56])
 by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3h76k6bhyg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Jul 2022 08:39:11 -0400
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
 by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 26BCdAjI045720
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL); 
 Mon, 11 Jul 2022 08:39:10 -0400
Received: from ASHBCASHYB5.ad.analog.com (10.64.17.133) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Mon, 11 Jul 2022 08:39:09 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB5.ad.analog.com (10.64.17.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Mon, 11 Jul 2022 08:39:09 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Mon, 11 Jul 2022 08:39:09 -0400
Received: from nsa.ad.analog.com ([10.44.3.53])
 by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 26BCbVED011687;
 Mon, 11 Jul 2022 08:38:58 -0400
From: =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
To: <linux-arm-msm@vger.kernel.org>, <openbmc@lists.ozlabs.org>,
 <linux-renesas-soc@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-imx@nxp.com>,
 <linux-mips@vger.kernel.org>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 <linux-iio@vger.kernel.org>, <chrome-platform@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-stm32@st-md-mailman.stormreply.com>
Date: Mon, 11 Jul 2022 14:38:28 +0200
Message-ID: <20220711123835.811358-9-nuno.sa@analog.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220711123835.811358-1-nuno.sa@analog.com>
References: <20220711123835.811358-1-nuno.sa@analog.com>
MIME-Version: 1.0
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: 5PogXc9VcV_iwv3Eq-p-u9FMB3WLvtq3
X-Proofpoint-GUID: 5PogXc9VcV_iwv3Eq-p-u9FMB3WLvtq3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-11_18,2022-07-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0
 mlxlogscore=999 malwarescore=0 spamscore=0 impostorscore=0
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
 Andy Gross <agross@kernel.org>, Zhang
 Rui <rui.zhang@intel.com>, Christophe Branchereau <cbranchereau@gmail.com>,
 Saravanan Sekar <sravanhome@gmail.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Cai Huoqing <cai.huoqing@linux.dev>,
 Matthias
 Brugger <matthias.bgg@gmail.com>, Gwendal Grignou <gwendal@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Benson Leung <bleung@chromium.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Thara Gopinath <thara.gopinath@linaro.org>, Arnd
 Bergmann <arnd@arndb.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Eugen
 Hristev <eugen.hristev@microchip.com>, Shawn Guo <shawnguo@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Jonathan Cameron <jic23@kernel.org>
Subject: [Linux-stm32] [PATCH v2 08/15] iio: adc: ab8500-gpadc: convert to
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
PgpBY2tlZC1ieTogTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPgotLS0K
IGRyaXZlcnMvaWlvL2FkYy9hYjg1MDAtZ3BhZGMuYyB8IDI3ICsrKysrKysrKysrKy0tLS0tLS0t
LS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDE1IGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvaWlvL2FkYy9hYjg1MDAtZ3BhZGMuYyBiL2RyaXZlcnMv
aWlvL2FkYy9hYjg1MDAtZ3BhZGMuYwppbmRleCA5MzBjZTk2ZTZmZjUuLjRmYTIxMjZhMzU0YiAx
MDA2NDQKLS0tIGEvZHJpdmVycy9paW8vYWRjL2FiODUwMC1ncGFkYy5jCisrKyBiL2RyaXZlcnMv
aWlvL2FkYy9hYjg1MDAtZ3BhZGMuYwpAQCAtOTI1LDggKzkyNSw4IEBAIHN0YXRpYyBpbnQgYWI4
NTAwX2dwYWRjX3JlYWRfcmF3KHN0cnVjdCBpaW9fZGV2ICppbmRpb19kZXYsCiAJcmV0dXJuIC1F
SU5WQUw7CiB9CiAKLXN0YXRpYyBpbnQgYWI4NTAwX2dwYWRjX29mX3hsYXRlKHN0cnVjdCBpaW9f
ZGV2ICppbmRpb19kZXYsCi0JCQkJIGNvbnN0IHN0cnVjdCBvZl9waGFuZGxlX2FyZ3MgKmlpb3Nw
ZWMpCitzdGF0aWMgaW50IGFiODUwMF9ncGFkY19md25vZGVfeGxhdGUoc3RydWN0IGlpb19kZXYg
KmluZGlvX2RldiwKKwkJCQkgICAgIGNvbnN0IHN0cnVjdCBmd25vZGVfcmVmZXJlbmNlX2FyZ3Mg
Kmlpb3NwZWMpCiB7CiAJaW50IGk7CiAKQEAgLTkzOCw3ICs5MzgsNyBAQCBzdGF0aWMgaW50IGFi
ODUwMF9ncGFkY19vZl94bGF0ZShzdHJ1Y3QgaWlvX2RldiAqaW5kaW9fZGV2LAogfQogCiBzdGF0
aWMgY29uc3Qgc3RydWN0IGlpb19pbmZvIGFiODUwMF9ncGFkY19pbmZvID0gewotCS5vZl94bGF0
ZSA9IGFiODUwMF9ncGFkY19vZl94bGF0ZSwKKwkuZndub2RlX3hsYXRlID0gYWI4NTAwX2dwYWRj
X2Z3bm9kZV94bGF0ZSwKIAkucmVhZF9yYXcgPSBhYjg1MDBfZ3BhZGNfcmVhZF9yYXcsCiB9Owog
CkBAIC05NjgsNyArOTY4LDcgQEAgc3RhdGljIGludCBhYjg1MDBfZ3BhZGNfcnVudGltZV9yZXN1
bWUoc3RydWN0IGRldmljZSAqZGV2KQogLyoqCiAgKiBhYjg1MDBfZ3BhZGNfcGFyc2VfY2hhbm5l
bCgpIC0gcHJvY2VzcyBkZXZpY2V0cmVlIGNoYW5uZWwgY29uZmlndXJhdGlvbgogICogQGRldjog
cG9pbnRlciB0byBjb250YWluaW5nIGRldmljZQotICogQG5wOiBkZXZpY2UgdHJlZSBub2RlIGZv
ciB0aGUgY2hhbm5lbCB0byBjb25maWd1cmUKKyAqIEBmd25vZGU6IGZ3IG5vZGUgZm9yIHRoZSBj
aGFubmVsIHRvIGNvbmZpZ3VyZQogICogQGNoOiBjaGFubmVsIGluZm8gdG8gZmlsbCBpbgogICog
QGlpb19jaGFuOiBJSU8gY2hhbm5lbCBzcGVjaWZpY2F0aW9uIHRvIGZpbGwgaW4KICAqCkBAIC05
NzYsMTUgKzk3NiwxNSBAQCBzdGF0aWMgaW50IGFiODUwMF9ncGFkY19ydW50aW1lX3Jlc3VtZShz
dHJ1Y3QgZGV2aWNlICpkZXYpCiAgKiBhbmQgZGVmaW5lIHVzYWdlIGZvciB0aGluZ3MgbGlrZSBB
VVggR1BBREMgaW5wdXRzIG1vcmUgcHJlY2lzZWx5LgogICovCiBzdGF0aWMgaW50IGFiODUwMF9n
cGFkY19wYXJzZV9jaGFubmVsKHN0cnVjdCBkZXZpY2UgKmRldiwKLQkJCQkgICAgICBzdHJ1Y3Qg
ZGV2aWNlX25vZGUgKm5wLAorCQkJCSAgICAgIHN0cnVjdCBmd25vZGVfaGFuZGxlICpmd25vZGUs
CiAJCQkJICAgICAgc3RydWN0IGFiODUwMF9ncGFkY19jaGFuX2luZm8gKmNoLAogCQkJCSAgICAg
IHN0cnVjdCBpaW9fY2hhbl9zcGVjICppaW9fY2hhbikKIHsKLQljb25zdCBjaGFyICpuYW1lID0g
bnAtPm5hbWU7CisJY29uc3QgY2hhciAqbmFtZSA9IGZ3bm9kZV9nZXRfbmFtZShmd25vZGUpOwog
CXUzMiBjaGFuOwogCWludCByZXQ7CiAKLQlyZXQgPSBvZl9wcm9wZXJ0eV9yZWFkX3UzMihucCwg
InJlZyIsICZjaGFuKTsKKwlyZXQgPSBmd25vZGVfcHJvcGVydHlfcmVhZF91MzIoZndub2RlLCAi
cmVnIiwgJmNoYW4pOwogCWlmIChyZXQpIHsKIAkJZGV2X2VycihkZXYsICJpbnZhbGlkIGNoYW5u
ZWwgbnVtYmVyICVzXG4iLCBuYW1lKTsKIAkJcmV0dXJuIHJldDsKQEAgLTEwMjEsMjIgKzEwMjEs
MjAgQEAgc3RhdGljIGludCBhYjg1MDBfZ3BhZGNfcGFyc2VfY2hhbm5lbChzdHJ1Y3QgZGV2aWNl
ICpkZXYsCiAvKioKICAqIGFiODUwMF9ncGFkY19wYXJzZV9jaGFubmVscygpIC0gUGFyc2UgdGhl
IEdQQURDIGNoYW5uZWxzIGZyb20gRFQKICAqIEBncGFkYzogdGhlIEdQQURDIHRvIGNvbmZpZ3Vy
ZSB0aGUgY2hhbm5lbHMgZm9yCi0gKiBAbnA6IGRldmljZSB0cmVlIG5vZGUgY29udGFpbmluZyB0
aGUgY2hhbm5lbCBjb25maWd1cmF0aW9ucwogICogQGNoYW5zOiB0aGUgSUlPIGNoYW5uZWxzIHdl
IHBhcnNlZAogICogQG5jaGFuczogdGhlIG51bWJlciBvZiBJSU8gY2hhbm5lbHMgd2UgcGFyc2Vk
CiAgKi8KIHN0YXRpYyBpbnQgYWI4NTAwX2dwYWRjX3BhcnNlX2NoYW5uZWxzKHN0cnVjdCBhYjg1
MDBfZ3BhZGMgKmdwYWRjLAotCQkJCSAgICAgICBzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wLAogCQkJ
CSAgICAgICBzdHJ1Y3QgaWlvX2NoYW5fc3BlYyAqKmNoYW5zX3BhcnNlZCwKIAkJCQkgICAgICAg
dW5zaWduZWQgaW50ICpuY2hhbnNfcGFyc2VkKQogewotCXN0cnVjdCBkZXZpY2Vfbm9kZSAqY2hp
bGQ7CisJc3RydWN0IGZ3bm9kZV9oYW5kbGUgKmNoaWxkOwogCXN0cnVjdCBhYjg1MDBfZ3BhZGNf
Y2hhbl9pbmZvICpjaDsKIAlzdHJ1Y3QgaWlvX2NoYW5fc3BlYyAqaWlvX2NoYW5zOwogCXVuc2ln
bmVkIGludCBuY2hhbnM7CiAJaW50IGk7CiAKLQluY2hhbnMgPSBvZl9nZXRfYXZhaWxhYmxlX2No
aWxkX2NvdW50KG5wKTsKKwluY2hhbnMgPSBkZXZpY2VfZ2V0X2NoaWxkX25vZGVfY291bnQoZ3Bh
ZGMtPmRldik7CiAJaWYgKCFuY2hhbnMpIHsKIAkJZGV2X2VycihncGFkYy0+ZGV2LCAibm8gY2hh
bm5lbCBjaGlsZHJlblxuIik7CiAJCXJldHVybiAtRU5PREVWOwpAQCAtMTA1NCw3ICsxMDUyLDcg
QEAgc3RhdGljIGludCBhYjg1MDBfZ3BhZGNfcGFyc2VfY2hhbm5lbHMoc3RydWN0IGFiODUwMF9n
cGFkYyAqZ3BhZGMsCiAJCXJldHVybiAtRU5PTUVNOwogCiAJaSA9IDA7Ci0JZm9yX2VhY2hfYXZh
aWxhYmxlX2NoaWxkX29mX25vZGUobnAsIGNoaWxkKSB7CisJZGV2aWNlX2Zvcl9lYWNoX2NoaWxk
X25vZGUoZ3BhZGMtPmRldiwgY2hpbGQpIHsKIAkJc3RydWN0IGlpb19jaGFuX3NwZWMgKmlpb19j
aGFuOwogCQlpbnQgcmV0OwogCkBAIC0xMDY0LDcgKzEwNjIsNyBAQCBzdGF0aWMgaW50IGFiODUw
MF9ncGFkY19wYXJzZV9jaGFubmVscyhzdHJ1Y3QgYWI4NTAwX2dwYWRjICpncGFkYywKIAkJcmV0
ID0gYWI4NTAwX2dwYWRjX3BhcnNlX2NoYW5uZWwoZ3BhZGMtPmRldiwgY2hpbGQsIGNoLAogCQkJ
CQkJIGlpb19jaGFuKTsKIAkJaWYgKHJldCkgewotCQkJb2Zfbm9kZV9wdXQoY2hpbGQpOworCQkJ
Zndub2RlX2hhbmRsZV9wdXQoY2hpbGQpOwogCQkJcmV0dXJuIHJldDsKIAkJfQogCQlpKys7CkBA
IC0xMDgxLDcgKzEwNzksNiBAQCBzdGF0aWMgaW50IGFiODUwMF9ncGFkY19wcm9iZShzdHJ1Y3Qg
cGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCXN0cnVjdCBhYjg1MDBfZ3BhZGMgKmdwYWRjOwogCXN0
cnVjdCBpaW9fZGV2ICppbmRpb19kZXY7CiAJc3RydWN0IGRldmljZSAqZGV2ID0gJnBkZXYtPmRl
djsKLQlzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wID0gcGRldi0+ZGV2Lm9mX25vZGU7CiAJc3RydWN0
IGlpb19jaGFuX3NwZWMgKmlpb19jaGFuczsKIAl1bnNpZ25lZCBpbnQgbl9paW9fY2hhbnM7CiAJ
aW50IHJldDsKQEAgLTEwOTYsNyArMTA5Myw3IEBAIHN0YXRpYyBpbnQgYWI4NTAwX2dwYWRjX3By
b2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJZ3BhZGMtPmRldiA9IGRldjsKIAln
cGFkYy0+YWI4NTAwID0gZGV2X2dldF9kcnZkYXRhKGRldi0+cGFyZW50KTsKIAotCXJldCA9IGFi
ODUwMF9ncGFkY19wYXJzZV9jaGFubmVscyhncGFkYywgbnAsICZpaW9fY2hhbnMsICZuX2lpb19j
aGFucyk7CisJcmV0ID0gYWI4NTAwX2dwYWRjX3BhcnNlX2NoYW5uZWxzKGdwYWRjLCAmaWlvX2No
YW5zLCAmbl9paW9fY2hhbnMpOwogCWlmIChyZXQpCiAJCXJldHVybiByZXQ7CiAKLS0gCjIuMzcu
MAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
c3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8v
bGludXgtc3RtMzIK
