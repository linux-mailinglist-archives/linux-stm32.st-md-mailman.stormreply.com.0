Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B85B73ADE50
	for <lists+linux-stm32@lfdr.de>; Sun, 20 Jun 2021 14:39:06 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6EF0FC5A4C0;
	Sun, 20 Jun 2021 12:39:06 +0000 (UTC)
Received: from out28-221.mail.aliyun.com (out28-221.mail.aliyun.com
 [115.124.28.221])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ACC32C57183
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 20 Jun 2021 12:39:02 +0000 (UTC)
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.409767|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.0190236-0.000312141-0.980664;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047190; MF=zhouyanjie@wanyeetech.com;
 NM=1; PH=DS; RN=18; RT=18; SR=0; TI=SMTPD_---.KVAnlIH_1624192730; 
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com
 fp:SMTPD_---.KVAnlIH_1624192730)
 by smtp.aliyun-inc.com(10.147.44.129);
 Sun, 20 Jun 2021 20:38:57 +0800
From: =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?=
 <zhouyanjie@wanyeetech.com>
To: davem@davemloft.net, kuba@kernel.org, robh+dt@kernel.org,
 peppe.cavallaro@st.com, alexandre.torgue@foss.st.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com
Date: Sun, 20 Jun 2021 20:38:49 +0800
Message-Id: <1624192730-43276-2-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1624192730-43276-1-git-send-email-zhouyanjie@wanyeetech.com>
References: <1624192730-43276-1-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, jun.jiang@ingenic.com, sernia.zhou@foxmail.com,
 rick.tyliu@ingenic.com, dongsheng.qiu@ingenic.com, sihui.liu@ingenic.com,
 aric.pzqi@ingenic.com, linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/2] dt-bindings: dwmac: Remove unexpected
	item.
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

UmVtb3ZlIHRoZSB1bmV4cGVjdGVkICJzbnBzLGR3bWFjIiBpdGVtIGluIHRoZSBleGFtcGxlLgoK
Rml4ZXM6IDNiODQwMTA2NmU1YSAoImR0LWJpbmRpbmdzOiBkd21hYzogQWRkIGJpbmRpbmdzIGZv
ciBuZXcgSW5nZW5pYyBTb0NzLiIpCgpTaWduZWQtb2ZmLWJ5OiDlkajnkLDmnbAgKFpob3UgWWFu
amllKSA8emhvdXlhbmppZUB3YW55ZWV0ZWNoLmNvbT4KLS0tCiBEb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvbmV0L2luZ2VuaWMsbWFjLnlhbWwgfCAyICstCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L2luZ2VuaWMsbWFjLnlhbWwgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L2luZ2VuaWMsbWFjLnlhbWwKaW5kZXggNWU5M2Q0
Zi4uZDA4YTg4MSAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L25ldC9pbmdlbmljLG1hYy55YW1sCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9uZXQvaW5nZW5pYyxtYWMueWFtbApAQCAtNjEsNyArNjEsNyBAQCBleGFtcGxlczoKICAg
ICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvY2xvY2sveDEwMDAtY2d1Lmg+CiAKICAgICBtYWM6IGV0
aGVybmV0QDEzNGIwMDAwIHsKLSAgICAgICAgY29tcGF0aWJsZSA9ICJpbmdlbmljLHgxMDAwLW1h
YyIsICJzbnBzLGR3bWFjIjsKKyAgICAgICAgY29tcGF0aWJsZSA9ICJpbmdlbmljLHgxMDAwLW1h
YyI7CiAgICAgICAgIHJlZyA9IDwweDEzNGIwMDAwIDB4MjAwMD47CiAKICAgICAgICAgaW50ZXJy
dXB0LXBhcmVudCA9IDwmaW50Yz47Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0
bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
