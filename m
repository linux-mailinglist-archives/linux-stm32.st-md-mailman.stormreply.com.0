Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 18CC929378B
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Oct 2020 11:05:58 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C12CAC424B9;
	Tue, 20 Oct 2020 09:05:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 61B0FC424B7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Oct 2020 09:05:56 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09K91xnn019320; Tue, 20 Oct 2020 11:05:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=STMicroelectronics;
 bh=NZzu2K/oEgGHbi70pVpopywkpHKaiBZ4Zxl3bo9Olfs=;
 b=XYZuNQbEtfUOVgDytzvOn26G0q3yIPSasW1oziDkVRwDjie6UBT2ayjd59NHeISTaS4Q
 s8PFeqGu4xOihkZ/lHm/uAwV1cY8VEk8di7a6W6y9fYruQ8WlfbiV0LT4MV2DvNnyYSU
 g8c8y0SadqnurXcckZvZj1WpA3cmK3c149c8yfeXr+nkg6rJvmZ7dEzs9bCuDNaCwNON
 4ifFh3fn2f7JUcGaEmlc6ieyP9vFhrI7tIWcwReC8kTYO1GCFVs7hZeXi87dB44DMaJu
 juLE6QyLQPkiaieKKSjl+hcZG3qvVmD3hGYpKvJn5ON/hFuLThnowLwv/FDI4HAHPWBr hQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 347pcwse1r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Oct 2020 11:05:32 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6843B10002A;
 Tue, 20 Oct 2020 11:05:24 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 36D882BCA3D;
 Tue, 20 Oct 2020 11:05:24 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 20 Oct 2020 11:05:23
 +0200
From: Olivier Moysan <olivier.moysan@st.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <alexandre.torgue@st.com>,
 <arnaud.patard@rtp-net.org>, <olivier.moysan@st.com>
Date: Tue, 20 Oct 2020 11:04:57 +0200
Message-ID: <20201020090457.340-1-olivier.moysan@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-20_04:2020-10-20,
 2020-10-20 signatures=0
Cc: alsa-devel@alsa-project.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH] ASoC: cs42l51: manage mclk shutdown delay
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

QSBkZWxheSBtdXN0IGJlIGludHJvZHVjZWQgYmVmb3JlIHRoZSBzaHV0ZG93biBkb3duIG9mIHRo
ZSBtY2xrLAphcyBzdGF0ZWQgaW4gQ1M0Mkw1MSBkYXRhc2hlZXQuIE90aGVyd2lzZSB0aGUgY29k
ZWMgbWF5CnByb2R1Y2Ugc29tZSBub2lzZSBhZnRlciB0aGUgZW5kIG9mIERBUE0gcG93ZXIgZG93
biBzZXF1ZW5jZS4KVGhlIGRlbGF5IGJldHdlZW4gREFDIGFuZCBDTE9DS19TVVBQTFkgd2lkZ2V0
cyBpcyB0b28gc2hvcnQuCkFkZCBhIGRlbGF5IGluIG1jbGsgc2h1dGRvd24gcmVxdWVzdCB0byBt
YW5hZ2UgdGhlIHNodXRkb3duIGRlbGF5CmV4cGxpY2l0bHkuIEZyb20gZXhwZXJpbWVudHMsIGF0
IGxlYXN0IDEwbXMgZGVsYXkgaXMgbmVjZXNzYXJ5LgpTZXQgZGVsYXkgdG8gMjBtcyBhcyByZWNv
bW1lbmRlZCBpbiBEb2N1bWVudGF0aW9uL3RpbWVycy90aW1lcnMtaG93dG8ucnN0CndoZW4gdXNp
bmcgbXNsZWVwKCkuCgpTaWduZWQtb2ZmLWJ5OiBPbGl2aWVyIE1veXNhbiA8b2xpdmllci5tb3lz
YW5Ac3QuY29tPgotLS0KUmVjb21tZW5kZWQgUG93ZXItRG93biBTZXF1ZW5jZToKKHNlZSBodHRw
czovL3N0YXRpY3MuY2lycnVzLmNvbS9wdWJzL3Byb0RhdGFzaGVldC9DUzQyTDUxX0YyLnBkZikK
MS4gICAgTXV0ZSB0aGUgREFDcyBhbmQgQURDcy4KMi4gICAgRGlzYWJsZSBzb2Z0IHJhbXAgYW5k
IHplcm8tY3Jvc3Mgdm9sdW1lIHRyYW5zaXRpb25zCjMuICAgIFNldCB0aGUgUEROIGJpdCB0byAx
Lgo0LiAgICBXYWl0IGF0IGxlYXN0IDEwMCDOvHMuClRoZSBjb2RlYyB3aWxsIGJlIGZ1bGx5IHBv
d2VyZWQgZG93biBhZnRlciB0aGlzIDEwMCDOvHMgZGVsYXkuClByaW9yIHRvIHRoZSByZW1vdmFs
IG9mIHRoZSBtYXN0ZXIgY2xvY2soTUNMSyksCnRoaXMgZGVsYXkgb2YgYXQgbGVhc3QgMTAwIM68
cyBtdXN0IGJlIGltcGxlbWVudGVkIGFmdGVyIHN0ZXAgMwp0byBhdm9pZCBwcmVtYXR1cmUgZGlz
cnVwdGlvbiBvZiB0aGUgY29kZWPigJlzIHBvd2VyIGRvd24gc2VxdWVuY2UuCi0tLQogc291bmQv
c29jL2NvZGVjcy9jczQybDUxLmMgfCAxOSArKysrKysrKysrKysrKysrKystCiAxIGZpbGUgY2hh
bmdlZCwgMTggaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3NvdW5k
L3NvYy9jb2RlY3MvY3M0Mmw1MS5jIGIvc291bmQvc29jL2NvZGVjcy9jczQybDUxLmMKaW5kZXgg
MDk3YzRlOGQ5OTUwLi5kMTUxYTFhYTMxM2UgMTAwNjQ0Ci0tLSBhL3NvdW5kL3NvYy9jb2RlY3Mv
Y3M0Mmw1MS5jCisrKyBiL3NvdW5kL3NvYy9jb2RlY3MvY3M0Mmw1MS5jCkBAIC0yNTQsOCArMjU0
LDI1IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc25kX3NvY19kYXBtX3dpZGdldCBjczQybDUxX2Rh
cG1fd2lkZ2V0c1tdID0gewogCQkmY3M0Mmw1MV9hZGNyX211eF9jb250cm9scyksCiB9OwogCitz
dGF0aWMgaW50IG1jbGtfZXZlbnQoc3RydWN0IHNuZF9zb2NfZGFwbV93aWRnZXQgKncsCisJCSAg
ICAgIHN0cnVjdCBzbmRfa2NvbnRyb2wgKmtjb250cm9sLCBpbnQgZXZlbnQpCit7CisJc3RydWN0
IHNuZF9zb2NfY29tcG9uZW50ICpjb21wID0gc25kX3NvY19kYXBtX3RvX2NvbXBvbmVudCh3LT5k
YXBtKTsKKwlzdHJ1Y3QgY3M0Mmw1MV9wcml2YXRlICpjczQybDUxID0gc25kX3NvY19jb21wb25l
bnRfZ2V0X2RydmRhdGEoY29tcCk7CisKKwlpZiAoU05EX1NPQ19EQVBNX0VWRU5UX09OKGV2ZW50
KSkKKwkJcmV0dXJuIGNsa19wcmVwYXJlX2VuYWJsZShjczQybDUxLT5tY2xrX2hhbmRsZSk7CisK
KwkvKiBEZWxheSBtY2xrIHNodXRkb3duIHRvIGZ1bGZpbGwgcG93ZXItZG93biBzZXF1ZW5jZSBy
ZXF1aXJlbWVudHMgKi8KKwltc2xlZXAoMjApOworCWNsa19kaXNhYmxlX3VucHJlcGFyZShjczQy
bDUxLT5tY2xrX2hhbmRsZSk7CisKKwlyZXR1cm4gMDsKK30KKwogc3RhdGljIGNvbnN0IHN0cnVj
dCBzbmRfc29jX2RhcG1fd2lkZ2V0IGNzNDJsNTFfZGFwbV9tY2xrX3dpZGdldHNbXSA9IHsKLQlT
TkRfU09DX0RBUE1fQ0xPQ0tfU1VQUExZKCJNQ0xLIikKKwlTTkRfU09DX0RBUE1fU1VQUExZKCJN
Q0xLIiwgU05EX1NPQ19OT1BNLCAwLCAwLCBtY2xrX2V2ZW50LAorCQkJICAgIFNORF9TT0NfREFQ
TV9QUkVfUE1VIHwgU05EX1NPQ19EQVBNX1BPU1RfUE1EKSwKIH07CiAKIHN0YXRpYyBjb25zdCBz
dHJ1Y3Qgc25kX3NvY19kYXBtX3JvdXRlIGNzNDJsNTFfcm91dGVzW10gPSB7Ci0tIAoyLjE3LjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0
bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
Cmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXN0bTMyCg==
