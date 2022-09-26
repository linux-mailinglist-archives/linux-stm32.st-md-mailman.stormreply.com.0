Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B636A5EBB42
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Sep 2022 09:14:28 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 19E3EC640E7;
	Tue, 27 Sep 2022 07:14:28 +0000 (UTC)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 30C9FC01E99
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Sep 2022 03:02:05 +0000 (UTC)
Received: from dggpeml500026.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MbS8q6skqzHtnq;
 Mon, 26 Sep 2022 10:57:15 +0800 (CST)
Received: from dggpeml500008.china.huawei.com (7.185.36.147) by
 dggpeml500026.china.huawei.com (7.185.36.106) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 26 Sep 2022 11:02:01 +0800
Received: from huawei.com (10.67.175.34) by dggpeml500008.china.huawei.com
 (7.185.36.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 26 Sep
 2022 11:02:01 +0800
From: Ren Zhijie <renzhijie2@huawei.com>
To: <gregkh@linuxfoundation.org>, <jirislaby@kernel.org>,
 <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>,
 <ben-linux@fluff.org>
Date: Mon, 26 Sep 2022 02:58:26 +0000
Message-ID: <20220926025826.44145-1-renzhijie2@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.175.34]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpeml500008.china.huawei.com (7.185.36.147)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 27 Sep 2022 07:14:26 +0000
Cc: linux-arm-kernel@lists.infradead.org, Ren
 Zhijie <renzhijie2@huawei.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH -next] serial: stm32: Fix unused-variable
	warning
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

SWYgQ09ORklHX1NFUklBTF9FQVJMWUNPTiBhbmQgQ09ORklHX09GIGFyZSBib3RoIG5vdCBzZXQs
CmdjYyB3YXJucyBhYm91dCB1bnVzZWQgdmFyaWFibGU6Cgpkcml2ZXJzL3R0eS9zZXJpYWwvc3Rt
MzItdXNhcnQuYzo4MzozMjogZXJyb3I6IOKAmHN0bTMyaDdfaW5mb+KAmSBkZWZpbmVkIGJ1dCBu
b3QgdXNlZCBbLVdlcnJvcj11bnVzZWQtdmFyaWFibGVdCiBzdGF0aWMgc3RydWN0IHN0bTMyX3Vz
YXJ0X2luZm8gc3RtMzJoN19pbmZvID0gewogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IF5+fn5+fn5+fn5+fgpkcml2ZXJzL3R0eS9zZXJpYWwvc3RtMzItdXNhcnQuYzo2MTozMjogZXJy
b3I6IOKAmHN0bTMyZjdfaW5mb+KAmSBkZWZpbmVkIGJ1dCBub3QgdXNlZCBbLVdlcnJvcj11bnVz
ZWQtdmFyaWFibGVdCiBzdGF0aWMgc3RydWN0IHN0bTMyX3VzYXJ0X2luZm8gc3RtMzJmN19pbmZv
ID0gewogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fgpkcml2ZXJz
L3R0eS9zZXJpYWwvc3RtMzItdXNhcnQuYzo0MDozMjogZXJyb3I6IOKAmHN0bTMyZjRfaW5mb+KA
mSBkZWZpbmVkIGJ1dCBub3QgdXNlZCBbLVdlcnJvcj11bnVzZWQtdmFyaWFibGVdCiBzdGF0aWMg
c3RydWN0IHN0bTMyX3VzYXJ0X2luZm8gc3RtMzJmNF9pbmZvID0gewogICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fgpjYzE6IGFsbCB3YXJuaW5ncyBiZWluZyB0cmVh
dGVkIGFzIGVycm9ycwoKTWFyayB0aGVzZSB2YXJpYWJsZXMgYXMgX19tYXliZV91bnVzZWQgIHRv
IGZpeCB0aGlzLgoKRml4ZXM6IGM3MDM5Y2U5MDRjMCAoInNlcmlhbDogc3RtMzI6IG1ha2UgaW5m
byBzdHJ1Y3RzIHN0YXRpYyB0byBhdm9pZCBzcGFyc2Ugd2FybmluZ3MiKQpTaWduZWQtb2ZmLWJ5
OiBSZW4gWmhpamllIDxyZW56aGlqaWUyQGh1YXdlaS5jb20+Ci0tLQogZHJpdmVycy90dHkvc2Vy
aWFsL3N0bTMyLXVzYXJ0LmMgfCA2ICsrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9u
cygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3R0eS9zZXJpYWwvc3Rt
MzItdXNhcnQuYyBiL2RyaXZlcnMvdHR5L3NlcmlhbC9zdG0zMi11c2FydC5jCmluZGV4IDBiMTg2
MTViMmNhNC4uMjIwMTNiMTJmNDcxIDEwMDY0NAotLS0gYS9kcml2ZXJzL3R0eS9zZXJpYWwvc3Rt
MzItdXNhcnQuYworKysgYi9kcml2ZXJzL3R0eS9zZXJpYWwvc3RtMzItdXNhcnQuYwpAQCAtMzcs
NyArMzcsNyBAQAogCiAKIC8qIFJlZ2lzdGVyIG9mZnNldHMgKi8KLXN0YXRpYyBzdHJ1Y3Qgc3Rt
MzJfdXNhcnRfaW5mbyBzdG0zMmY0X2luZm8gPSB7CitzdGF0aWMgc3RydWN0IHN0bTMyX3VzYXJ0
X2luZm8gX19tYXliZV91bnVzZWQgc3RtMzJmNF9pbmZvID0gewogCS5vZnMgPSB7CiAJCS5pc3IJ
PSAweDAwLAogCQkucmRyCT0gMHgwNCwKQEAgLTU4LDcgKzU4LDcgQEAgc3RhdGljIHN0cnVjdCBz
dG0zMl91c2FydF9pbmZvIHN0bTMyZjRfaW5mbyA9IHsKIAl9CiB9OwogCi1zdGF0aWMgc3RydWN0
IHN0bTMyX3VzYXJ0X2luZm8gc3RtMzJmN19pbmZvID0geworc3RhdGljIHN0cnVjdCBzdG0zMl91
c2FydF9pbmZvIF9fbWF5YmVfdW51c2VkIHN0bTMyZjdfaW5mbyA9IHsKIAkub2ZzID0gewogCQku
Y3IxCT0gMHgwMCwKIAkJLmNyMgk9IDB4MDQsCkBAIC04MCw3ICs4MCw3IEBAIHN0YXRpYyBzdHJ1
Y3Qgc3RtMzJfdXNhcnRfaW5mbyBzdG0zMmY3X2luZm8gPSB7CiAJfQogfTsKIAotc3RhdGljIHN0
cnVjdCBzdG0zMl91c2FydF9pbmZvIHN0bTMyaDdfaW5mbyA9IHsKK3N0YXRpYyBzdHJ1Y3Qgc3Rt
MzJfdXNhcnRfaW5mbyBfX21heWJlX3VudXNlZCBzdG0zMmg3X2luZm8gPSB7CiAJLm9mcyA9IHsK
IAkJLmNyMQk9IDB4MDAsCiAJCS5jcjIJPSAweDA0LAotLSAKMi4xNy4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxp
c3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
