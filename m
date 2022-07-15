Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E3257617D
	for <lists+linux-stm32@lfdr.de>; Fri, 15 Jul 2022 14:30:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E18A7C640F5;
	Fri, 15 Jul 2022 12:29:59 +0000 (UTC)
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com
 [148.163.135.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B82DAC640F6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Jul 2022 12:29:57 +0000 (UTC)
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
 by mx0a-00128a01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26F9j6TK011689;
 Fri, 15 Jul 2022 08:29:12 -0400
Received: from nwd2mta3.analog.com ([137.71.173.56])
 by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3h73h7c6nq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Jul 2022 08:29:12 -0400
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
 by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 26FCTAHQ061326
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL); 
 Fri, 15 Jul 2022 08:29:10 -0400
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX9.ad.analog.com (10.64.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Fri, 15 Jul 2022 08:29:09 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Fri, 15 Jul 2022 08:29:09 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Fri, 15 Jul 2022 08:29:09 -0400
Received: from nsa.ad.analog.com ([10.44.3.55])
 by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 26FCRxO0001007;
 Fri, 15 Jul 2022 08:28:57 -0400
From: =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
To: <openbmc@lists.ozlabs.org>, <linux-imx@nxp.com>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-iio@vger.kernel.org>, <linux-mips@vger.kernel.org>,
 <linux-renesas-soc@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <chrome-platform@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 <linux-arm-msm@vger.kernel.org>
Date: Fri, 15 Jul 2022 14:28:52 +0200
Message-ID: <20220715122903.332535-5-nuno.sa@analog.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220715122903.332535-1-nuno.sa@analog.com>
References: <20220715122903.332535-1-nuno.sa@analog.com>
MIME-Version: 1.0
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: 00Mvl5QWraXBaMYbB-SuhFGlZYR4oq8v
X-Proofpoint-ORIG-GUID: 00Mvl5QWraXBaMYbB-SuhFGlZYR4oq8v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-15_05,2022-07-15_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 mlxlogscore=999 lowpriorityscore=0 phishscore=0 mlxscore=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207150054
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
Subject: [Linux-stm32] [PATCH v3 04/15] iio: inkern: split
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
bnVuby5zYUBhbmFsb2cuY29tPgpSZXZpZXdlZC1ieTogQW5keSBTaGV2Y2hlbmtvIDxhbmR5LnNo
ZXZjaGVua29AZ21haWwuY29tPgotLS0KIGRyaXZlcnMvaWlvL2lua2Vybi5jIHwgMTA5ICsrKysr
KysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA2
NSBpbnNlcnRpb25zKCspLCA0NCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2lp
by9pbmtlcm4uYyBiL2RyaXZlcnMvaWlvL2lua2Vybi5jCmluZGV4IGM2ZjFjZmUwOWJkMy4uZjk3
Yjc5NjdkM2Q5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2lpby9pbmtlcm4uYworKysgYi9kcml2ZXJz
L2lpby9pbmtlcm4uYwpAQCAtMjExLDYxICsyMTEsODIgQEAgc3RhdGljIHN0cnVjdCBpaW9fY2hh
bm5lbCAqb2ZfaWlvX2NoYW5uZWxfZ2V0KHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnAsIGludCBpbmRl
eCkKIAlyZXR1cm4gRVJSX1BUUihlcnIpOwogfQogCitzdHJ1Y3QgaWlvX2NoYW5uZWwgKl9fb2Zf
aWlvX2NoYW5uZWxfZ2V0X2J5X25hbWUoc3RydWN0IGRldmljZV9ub2RlICpucCwKKwkJCQkJCSBj
b25zdCBjaGFyICpuYW1lKQoreworCXN0cnVjdCBpaW9fY2hhbm5lbCAqY2hhbjsKKwlpbnQgaW5k
ZXggPSAwOworCisJLyoKKwkgKiBGb3IgbmFtZWQgaWlvIGNoYW5uZWxzLCBmaXJzdCBsb29rIHVw
IHRoZSBuYW1lIGluIHRoZQorCSAqICJpby1jaGFubmVsLW5hbWVzIiBwcm9wZXJ0eS4gIElmIGl0
IGNhbm5vdCBiZSBmb3VuZCwgdGhlCisJICogaW5kZXggd2lsbCBiZSBhbiBlcnJvciBjb2RlLCBh
bmQgb2ZfaWlvX2NoYW5uZWxfZ2V0KCkKKwkgKiB3aWxsIGZhaWwuCisJICovCisJaWYgKG5hbWUp
CisJCWluZGV4ID0gb2ZfcHJvcGVydHlfbWF0Y2hfc3RyaW5nKG5wLCAiaW8tY2hhbm5lbC1uYW1l
cyIsIG5hbWUpOworCisJY2hhbiA9IG9mX2lpb19jaGFubmVsX2dldChucCwgaW5kZXgpOworCWlm
ICghSVNfRVJSKGNoYW4pIHx8IFBUUl9FUlIoY2hhbikgPT0gLUVQUk9CRV9ERUZFUikKKwkJcmV0
dXJuIGNoYW47CisJaWYgKG5hbWUpIHsKKwkJaWYgKGluZGV4ID49IDApIHsKKwkJCXByX2Vycigi
RVJST1I6IGNvdWxkIG5vdCBnZXQgSUlPIGNoYW5uZWwgJXBPRjolcyglaSlcbiIsCisJCQkgICAg
ICAgbnAsIG5hbWUsIGluZGV4KTsKKwkJCS8qCisJCQkgKiBJbiB0aGlzIGNhc2UsIHdlIGZvdW5k
ICduYW1lJyBpbiAnaW8tY2hhbm5lbC1uYW1lcycKKwkJCSAqIGJ1dCBzb21laG93IHdlIHN0aWxs
IGZhaWwgc28gdGhhdCB3ZSBzaG91bGQgbm90IHByb2NlZWQKKwkJCSAqIHdpdGggYW55IG90aGVy
IGxvb2t1cC4gSGVuY2UsIGV4cGxpY2l0bHkgcmV0dXJuIC1FSU5WQUwKKwkJCSAqIChtYXliZSBu
b3QgdGhlIGJldHRlciBlcnJvciBjb2RlKSBzbyB0aGF0IHRoZSBjYWxsZXIKKwkJCSAqIHdvbid0
IGRvIGEgc3lzdGVtIGxvb2t1cC4KKwkJCSAqLworCQkJcmV0dXJuIEVSUl9QVFIoLUVJTlZBTCk7
CisJCX0KKwkJLyogSWYgaW5kZXggPCAwLCB0aGVuIG9mX3BhcnNlX3BoYW5kbGVfd2l0aF9hcmdz
KCkgZmFpbHMKKwkJICogd2l0aCAtRUlOVkFMIHdoaWNoIGlzIGV4cGVjdGVkLiBXZSBzaG91bGQg
bm90IHByb2NlZWQKKwkJICogaWYgd2UgZ2V0IGFueSBvdGhlciBlcnJvci4KKwkJICovCisJCWlm
IChQVFJfRVJSKGNoYW4pICE9IC1FSU5WQUwpCisJCQlyZXR1cm4gY2hhbjsKKwl9IGVsc2UgaWYg
KFBUUl9FUlIoY2hhbikgIT0gLUVOT0VOVCkgeworCQkvKgorCQkgKiBpZiAhbmFtZSwgdGhlbiB3
ZSBzaG91bGQgb25seSBwcm9jZWVkIHRoZSBsb29rdXAgaWYKKwkJICogb2ZfcGFyc2VfcGhhbmRs
ZV93aXRoX2FyZ3MoKSByZXR1cm5zIC1FTk9FTlQuCisJCSAqLworCQlyZXR1cm4gY2hhbjsKKwl9
CisKKwkvKiBzbyB3ZSBjb250aW51ZSB0aGUgbG9va3VwICovCisJcmV0dXJuIEVSUl9QVFIoLUVO
T0RFVik7Cit9CisKIHN0cnVjdCBpaW9fY2hhbm5lbCAqb2ZfaWlvX2NoYW5uZWxfZ2V0X2J5X25h
bWUoc3RydWN0IGRldmljZV9ub2RlICpucCwKIAkJCQkJICAgICAgIGNvbnN0IGNoYXIgKm5hbWUp
CiB7CiAJc3RydWN0IGlpb19jaGFubmVsICpjaGFuOwogCiAJLyogV2FsayB1cCB0aGUgdHJlZSBv
ZiBkZXZpY2VzIGxvb2tpbmcgZm9yIGEgbWF0Y2hpbmcgaWlvIGNoYW5uZWwgKi8KKwljaGFuID0g
X19vZl9paW9fY2hhbm5lbF9nZXRfYnlfbmFtZShucCwgbmFtZSk7CisJaWYgKCFJU19FUlIoY2hh
bikgfHwgUFRSX0VSUihjaGFuKSAhPSAtRU5PREVWKQorCQlyZXR1cm4gY2hhbjsKKworCS8qCisJ
ICogTm8gbWF0Y2hpbmcgSUlPIGNoYW5uZWwgZm91bmQgb24gdGhpcyBub2RlLgorCSAqIElmIHRo
ZSBwYXJlbnQgbm9kZSBoYXMgYSAiaW8tY2hhbm5lbC1yYW5nZXMiIHByb3BlcnR5LAorCSAqIHRo
ZW4gd2UgY2FuIHRyeSBvbmUgb2YgaXRzIGNoYW5uZWxzLgorCSAqLworCW5wID0gbnAtPnBhcmVu
dDsKIAl3aGlsZSAobnApIHsKIAkJaW50IGluZGV4ID0gMDsKIAotCQkvKgotCQkgKiBGb3IgbmFt
ZWQgaWlvIGNoYW5uZWxzLCBmaXJzdCBsb29rIHVwIHRoZSBuYW1lIGluIHRoZQotCQkgKiAiaW8t
Y2hhbm5lbC1uYW1lcyIgcHJvcGVydHkuICBJZiBpdCBjYW5ub3QgYmUgZm91bmQsIHRoZQotCQkg
KiBpbmRleCB3aWxsIGJlIGFuIGVycm9yIGNvZGUsIGFuZCBvZl9paW9fY2hhbm5lbF9nZXQoKQot
CQkgKiB3aWxsIGZhaWwuCi0JCSAqLwotCQlpZiAobmFtZSkKLQkJCWluZGV4ID0gb2ZfcHJvcGVy
dHlfbWF0Y2hfc3RyaW5nKG5wLCAiaW8tY2hhbm5lbC1uYW1lcyIsCi0JCQkJCQkJIG5hbWUpOwot
CQljaGFuID0gb2ZfaWlvX2NoYW5uZWxfZ2V0KG5wLCBpbmRleCk7Ci0JCWlmICghSVNfRVJSKGNo
YW4pIHx8IFBUUl9FUlIoY2hhbikgPT0gLUVQUk9CRV9ERUZFUikKLQkJCXJldHVybiBjaGFuOwot
CQlpZiAobmFtZSkgewotCQkJaWYgKGluZGV4ID49IDApIHsKLQkJCQlwcl9lcnIoIkVSUk9SOiBj
b3VsZCBub3QgZ2V0IElJTyBjaGFubmVsICVwT0Y6JXMoJWkpXG4iLAotCQkJCSAgICAgICBucCwg
bmFtZSwgaW5kZXgpOwotCQkJCS8qCi0JCQkJICogSW4gdGhpcyBjYXNlLCB3ZSBmb3VuZCAnbmFt
ZScgaW4gJ2lvLWNoYW5uZWwtbmFtZXMnCi0JCQkJICogYnV0IHNvbWVob3cgd2Ugc3RpbGwgZmFp
bCBzbyB0aGF0IHdlIHNob3VsZCBub3QgcHJvY2VlZAotCQkJCSAqIHdpdGggYW55IG90aGVyIGxv
b2t1cC4gSGVuY2UsIGV4cGxpY2l0bHkgcmV0dXJuIC1FSU5WQUwKLQkJCQkgKiAobWF5YmUgbm90
IHRoZSBiZXR0ZXIgZXJyb3IgY29kZSkgc28gdGhhdCB0aGUgY2FsbGVyCi0JCQkJICogd29uJ3Qg
ZG8gYSBzeXN0ZW0gbG9va3VwLgotCQkJCSAqLwotCQkJCXJldHVybiBFUlJfUFRSKC1FSU5WQUwp
OwotCQkJfQotCQkJLyogSWYgaW5kZXggPCAwLCB0aGVuIG9mX3BhcnNlX3BoYW5kbGVfd2l0aF9h
cmdzKCkgZmFpbHMKLQkJCSAqIHdpdGggLUVJTlZBTCB3aGljaCBpcyBleHBlY3RlZC4gV2Ugc2hv
dWxkIG5vdCBwcm9jZWVkCi0JCQkgKiBpZiB3ZSBnZXQgYW55IG90aGVyIGVycm9yLgotCQkJICov
Ci0JCQlpZiAoUFRSX0VSUihjaGFuKSAhPSAtRUlOVkFMKQotCQkJCXJldHVybiBjaGFuOwotCQl9
IGVsc2UgaWYgKFBUUl9FUlIoY2hhbikgIT0gLUVOT0VOVCkgewotCQkJLyoKLQkJCSAqIGlmICFu
YW1lLCB0aGVuIHdlIHNob3VsZCBvbmx5IHByb2NlZWQgdGhlIGxvb2t1cCBpZgotCQkJICogb2Zf
cGFyc2VfcGhhbmRsZV93aXRoX2FyZ3MoKSByZXR1cm5zIC1FTk9FTlQuCi0JCQkgKi8KKwkJaWYg
KCFvZl9nZXRfcHJvcGVydHkobnAsICJpby1jaGFubmVsLXJhbmdlcyIsIE5VTEwpKQorCQkJcmV0
dXJuIEVSUl9QVFIoLUVOT0RFVik7CisKKwkJY2hhbiA9IF9fb2ZfaWlvX2NoYW5uZWxfZ2V0X2J5
X25hbWUobnAsIG5hbWUpOworCQlpZiAoIUlTX0VSUihjaGFuKSB8fCBQVFJfRVJSKGNoYW4pICE9
IC1FTk9ERVYpCiAJCQlyZXR1cm4gY2hhbjsKLQkJfQotCQkvKgotCQkgKiBObyBtYXRjaGluZyBJ
SU8gY2hhbm5lbCBmb3VuZCBvbiB0aGlzIG5vZGUuCi0JCSAqIElmIHRoZSBwYXJlbnQgbm9kZSBo
YXMgYSAiaW8tY2hhbm5lbC1yYW5nZXMiIHByb3BlcnR5LAotCQkgKiB0aGVuIHdlIGNhbiB0cnkg
b25lIG9mIGl0cyBjaGFubmVscy4KLQkJICovCisKIAkJbnAgPSBucC0+cGFyZW50OwotCQlpZiAo
bnAgJiYgIW9mX2dldF9wcm9wZXJ0eShucCwgImlvLWNoYW5uZWwtcmFuZ2VzIiwgTlVMTCkpCi0J
CQlyZXR1cm4gRVJSX1BUUigtRU5PREVWKTsKIAl9CiAKIAlyZXR1cm4gRVJSX1BUUigtRU5PREVW
KTsKLS0gCjIuMzcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxt
YW4vbGlzdGluZm8vbGludXgtc3RtMzIK
