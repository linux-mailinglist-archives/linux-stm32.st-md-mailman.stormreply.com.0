Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 588C9293F25
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Oct 2020 17:02:17 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 05332C424B8;
	Tue, 20 Oct 2020 15:02:17 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 966C7C3FAE0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Oct 2020 15:02:14 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09KEvgm6012136; Tue, 20 Oct 2020 17:01:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=STMicroelectronics;
 bh=XgCfUqxaOYwvz9RDx21gH1OGoREoJaNipM7JO27tcpQ=;
 b=pcALPfUlGTVlYjzgy9lQZOr9M/jywqlaRBDLx7FCwCeHIRBaIgXSyKKlk+EEwGcb0jca
 BxSCCUZQTF7U/ZpEN38ebvJPyOa1hdY37nyUHTziP2vgc50Z/XGd08CW7nHJUThXljuX
 ilcRlNsaQKIfHIiA3zVD9xhKpPmKRKkm+9d3+2PK+RYIF8M+fuSBCgP2JVBUBCd0ti0f
 0FaZmGfEURtGM6jFgvSa2V/PrDAlVdO52WRtVnmcJjXSksWL4TlT+i0TOO3sAPQfrRlu
 rpxMtUe2vvNDRem4vYgoIwpPNWh4YQ6KJUgatqCG3PpqJYrFKX8ZnBNQbRZ501/M7ONd Lg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 347qgg4432-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Oct 2020 17:01:21 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5BA2910002A;
 Tue, 20 Oct 2020 17:01:20 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 30F6B2E6D30;
 Tue, 20 Oct 2020 17:01:20 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 20 Oct 2020 17:01:19
 +0200
From: Olivier Moysan <olivier.moysan@st.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <alexandre.torgue@st.com>,
 <arnaud.patard@rtp-net.org>, <olivier.moysan@st.com>
Date: Tue, 20 Oct 2020 17:01:09 +0200
Message-ID: <20201020150109.482-1-olivier.moysan@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.737
 definitions=2020-10-20_08:2020-10-20,
 2020-10-20 signatures=0
Cc: alsa-devel@alsa-project.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH v2] ASoC: cs42l51: manage mclk shutdown delay
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
cnVwdGlvbiBvZiB0aGUgY29kZWPigJlzIHBvd2VyIGRvd24gc2VxdWVuY2UuCgpDaGFuZ2VzIGlu
IHYyOgotIE1hbmFnZSBleHBsaWNpdGx5IERBUE0gZXZlbnRzIHRocm91Z2ggYSBzd2l0Y2ggY2Fz
ZSBpbiBtY2xrX2V2ZW50KCkKLS0tCiBzb3VuZC9zb2MvY29kZWNzL2NzNDJsNTEuYyB8IDIyICsr
KysrKysrKysrKysrKysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvc291bmQvc29jL2NvZGVjcy9jczQybDUxLmMgYi9z
b3VuZC9zb2MvY29kZWNzL2NzNDJsNTEuYwppbmRleCAwOTdjNGU4ZDk5NTAuLmM2MWIxN2RjMmFm
OCAxMDA2NDQKLS0tIGEvc291bmQvc29jL2NvZGVjcy9jczQybDUxLmMKKysrIGIvc291bmQvc29j
L2NvZGVjcy9jczQybDUxLmMKQEAgLTI1NCw4ICsyNTQsMjggQEAgc3RhdGljIGNvbnN0IHN0cnVj
dCBzbmRfc29jX2RhcG1fd2lkZ2V0IGNzNDJsNTFfZGFwbV93aWRnZXRzW10gPSB7CiAJCSZjczQy
bDUxX2FkY3JfbXV4X2NvbnRyb2xzKSwKIH07CiAKK3N0YXRpYyBpbnQgbWNsa19ldmVudChzdHJ1
Y3Qgc25kX3NvY19kYXBtX3dpZGdldCAqdywKKwkJICAgICAgc3RydWN0IHNuZF9rY29udHJvbCAq
a2NvbnRyb2wsIGludCBldmVudCkKK3sKKwlzdHJ1Y3Qgc25kX3NvY19jb21wb25lbnQgKmNvbXAg
PSBzbmRfc29jX2RhcG1fdG9fY29tcG9uZW50KHctPmRhcG0pOworCXN0cnVjdCBjczQybDUxX3By
aXZhdGUgKmNzNDJsNTEgPSBzbmRfc29jX2NvbXBvbmVudF9nZXRfZHJ2ZGF0YShjb21wKTsKKwor
CXN3aXRjaCAoZXZlbnQpIHsKKwljYXNlIFNORF9TT0NfREFQTV9QUkVfUE1VOgorCQlyZXR1cm4g
Y2xrX3ByZXBhcmVfZW5hYmxlKGNzNDJsNTEtPm1jbGtfaGFuZGxlKTsKKwljYXNlIFNORF9TT0Nf
REFQTV9QT1NUX1BNRDoKKwkJLyogRGVsYXkgbWNsayBzaHV0ZG93biB0byBmdWxmaWxsIHBvd2Vy
LWRvd24gc2VxdWVuY2UgcmVxdWlyZW1lbnRzICovCisJCW1zbGVlcCgyMCk7CisJCWNsa19kaXNh
YmxlX3VucHJlcGFyZShjczQybDUxLT5tY2xrX2hhbmRsZSk7CisJCWJyZWFrOworCX0KKworCXJl
dHVybiAwOworfQorCiBzdGF0aWMgY29uc3Qgc3RydWN0IHNuZF9zb2NfZGFwbV93aWRnZXQgY3M0
Mmw1MV9kYXBtX21jbGtfd2lkZ2V0c1tdID0gewotCVNORF9TT0NfREFQTV9DTE9DS19TVVBQTFko
Ik1DTEsiKQorCVNORF9TT0NfREFQTV9TVVBQTFkoIk1DTEsiLCBTTkRfU09DX05PUE0sIDAsIDAs
IG1jbGtfZXZlbnQsCisJCQkgICAgU05EX1NPQ19EQVBNX1BSRV9QTVUgfCBTTkRfU09DX0RBUE1f
UE9TVF9QTUQpLAogfTsKIAogc3RhdGljIGNvbnN0IHN0cnVjdCBzbmRfc29jX2RhcG1fcm91dGUg
Y3M0Mmw1MV9yb3V0ZXNbXSA9IHsKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0
bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
