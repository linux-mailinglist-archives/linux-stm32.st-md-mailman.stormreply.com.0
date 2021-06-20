Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9FD3ADE4E
	for <lists+linux-stm32@lfdr.de>; Sun, 20 Jun 2021 14:39:06 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7A53CC597BD;
	Sun, 20 Jun 2021 12:39:05 +0000 (UTC)
Received: from out28-52.mail.aliyun.com (out28-52.mail.aliyun.com
 [115.124.28.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 72DF7C5718F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 20 Jun 2021 12:39:02 +0000 (UTC)
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.09709191|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.0132484-0.00553607-0.981215;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047213; MF=zhouyanjie@wanyeetech.com;
 NM=1; PH=DS; RN=18; RT=18; SR=0; TI=SMTPD_---.KVAnlIH_1624192730; 
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com
 fp:SMTPD_---.KVAnlIH_1624192730)
 by smtp.aliyun-inc.com(10.147.44.129);
 Sun, 20 Jun 2021 20:38:58 +0800
From: =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?=
 <zhouyanjie@wanyeetech.com>
To: davem@davemloft.net, kuba@kernel.org, robh+dt@kernel.org,
 peppe.cavallaro@st.com, alexandre.torgue@foss.st.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com
Date: Sun, 20 Jun 2021 20:38:50 +0800
Message-Id: <1624192730-43276-3-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1624192730-43276-1-git-send-email-zhouyanjie@wanyeetech.com>
References: <1624192730-43276-1-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, jun.jiang@ingenic.com, sernia.zhou@foxmail.com,
 rick.tyliu@ingenic.com, dongsheng.qiu@ingenic.com, sihui.liu@ingenic.com,
 aric.pzqi@ingenic.com, linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 2/2] net: stmmac: Ingenic: Remove unused
	variables.
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

UmVtb3ZlIHVudXNlZCB2YXJpYWJsZXMgaW4gaW5nZW5pY19tYWNfc3VzcGVuZCgpIGFuZAppbmdl
bmljX21hY19yZXN1bWUoKS4KCkZpeGVzOiAyYmI0Yjk4YjYwZDcgKCJuZXQ6IHN0bW1hYzogQWRk
IEluZ2VuaWMgU29DcyBNQUMgc3VwcG9ydC4iKQoKU2lnbmVkLW9mZi1ieTog5ZGo55Cw5p2wICha
aG91IFlhbmppZSkgPHpob3V5YW5qaWVAd2FueWVldGVjaC5jb20+Ci0tLQogZHJpdmVycy9uZXQv
ZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtaW5nZW5pYy5jIHwgNCAtLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC9ldGhlcm5l
dC9zdG1pY3JvL3N0bW1hYy9kd21hYy1pbmdlbmljLmMgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9z
dG1pY3JvL3N0bW1hYy9kd21hYy1pbmdlbmljLmMKaW5kZXggNjY3ZWQ0Ni4uOWE2ZDgxOSAxMDA2
NDQKLS0tIGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtaW5nZW5p
Yy5jCisrKyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL2R3bWFjLWluZ2Vu
aWMuYwpAQCAtMzExLDkgKzMxMSw2IEBAIHN0YXRpYyBpbnQgaW5nZW5pY19tYWNfcHJvYmUoc3Ry
dWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKICNpZmRlZiBDT05GSUdfUE1fU0xFRVAKIHN0YXRp
YyBpbnQgaW5nZW5pY19tYWNfc3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpkZXYpCiB7Ci0Jc3RydWN0
IG5ldF9kZXZpY2UgKm5kZXYgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsKLQlzdHJ1Y3Qgc3RtbWFj
X3ByaXYgKnByaXYgPSBuZXRkZXZfcHJpdihuZGV2KTsKLQlzdHJ1Y3QgaW5nZW5pY19tYWMgKm1h
YyA9IHByaXYtPnBsYXQtPmJzcF9wcml2OwogCWludCByZXQ7CiAKIAlyZXQgPSBzdG1tYWNfc3Vz
cGVuZChkZXYpOwpAQCAtMzI1LDcgKzMyMiw2IEBAIHN0YXRpYyBpbnQgaW5nZW5pY19tYWNfcmVz
dW1lKHN0cnVjdCBkZXZpY2UgKmRldikKIHsKIAlzdHJ1Y3QgbmV0X2RldmljZSAqbmRldiA9IGRl
dl9nZXRfZHJ2ZGF0YShkZXYpOwogCXN0cnVjdCBzdG1tYWNfcHJpdiAqcHJpdiA9IG5ldGRldl9w
cml2KG5kZXYpOwotCXN0cnVjdCBpbmdlbmljX21hYyAqbWFjID0gcHJpdi0+cGxhdC0+YnNwX3By
aXY7CiAJaW50IHJldDsKIAogCXJldCA9IGluZ2VuaWNfbWFjX2luaXQocHJpdi0+cGxhdCk7Ci0t
IAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlz
dGluZm8vbGludXgtc3RtMzIK
