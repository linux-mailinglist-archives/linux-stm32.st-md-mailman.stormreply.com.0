Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C1C2E9160
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Jan 2021 09:02:44 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0C225C5719A;
	Mon,  4 Jan 2021 08:02:44 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0B172C5717F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 18 Dec 2020 19:00:43 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0BIIumlG011714; Fri, 18 Dec 2020 20:00:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=selector1;
 bh=gIZmSQvht2ZB5w+rQ8RvzG0lqz+JQaLSQmiALoML+oU=;
 b=M2gYJCj+7y3HyUa2Dz+UKHEiKejyT1mbh4tofUcEZzl+5LUbfEopI28JnMKzkhxhR98D
 VAbII1nN5r4xw0MarrhP6U6b0KrJDnWFcPclEuGCxDXDSqHtAbmAs8t4+hLjfja9/WAd
 RNW0cJGEh16P+Z/SKzDLw67wLoVqyTLKuJxHTJdkPuf3uQW1pdAWf+bn5DTKCOFyVkTw
 KZpAgaaOBPKh/71qEYvLTIK9+L78FTluQ20Z8VjLVU1BnAfF2EBO2apih0xe2rGoJo8V
 7/ZAqRNj/HoCYsPgP+iLv3AfPsYZGs6DJr0HfOFP727hOLMH85rW2CgbRvO87dvTxxUf Mw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 35cpt9ux3u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 18 Dec 2020 20:00:29 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AF8D710002A;
 Fri, 18 Dec 2020 20:00:28 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A21CE231C3D;
 Fri, 18 Dec 2020 20:00:28 +0100 (CET)
Received: from localhost (10.75.127.49) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 18 Dec 2020 20:00:28
 +0100
From: Erwan Le Ray <erwan.leray@foss.st.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jslaby@suse.com>, Rob Herring <robh+dt@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Fri, 18 Dec 2020 20:00:12 +0100
Message-ID: <20201218190020.1572-2-erwan.leray@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201218190020.1572-1-erwan.leray@foss.st.com>
References: <20201218190020.1572-1-erwan.leray@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-18_12:2020-12-18,
 2020-12-18 signatures=0
X-Mailman-Approved-At: Mon, 04 Jan 2021 08:02:42 +0000
Cc: devicetree@vger.kernel.org, Valentin Caron <valentin.caron@foss.st.com>,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/8] serial: stm32: fix -Wall W=1 compilation
	warnings
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

Rml4IGNvbXBpbGF0aW9ucyB3YXJuaW5nIGRldGVjdGVkIGJ5IC1XYWxsIFc9MSBjb21waWxhdGlv
biBvcHRpb246Ci0gd2FybmluZzogdmFyaWFibGUg4oCYY29va2ll4oCZIHNldCBidXQgbm90IHVz
ZWQKCkZpeGVzOiAzNDg5MTg3MjA0ZWIgKCJzZXJpYWw6IHN0bTMyOiBhZGRpbmcgZG1hIHN1cHBv
cnQiKQpTaWduZWQtb2ZmLWJ5OiBFcndhbiBMZSBSYXkgPGVyd2FuLmxlcmF5QGZvc3Muc3QuY29t
PgoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvdHR5L3NlcmlhbC9zdG0zMi11c2FydC5jIGIvZHJpdmVy
cy90dHkvc2VyaWFsL3N0bTMyLXVzYXJ0LmMKaW5kZXggZWU2Yzc3NjJkMzU1Li42MjQ4MzA0YTAw
MWYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdHR5L3NlcmlhbC9zdG0zMi11c2FydC5jCisrKyBiL2Ry
aXZlcnMvdHR5L3NlcmlhbC9zdG0zMi11c2FydC5jCkBAIC0zNTAsNyArMzUwLDYgQEAgc3RhdGlj
IHZvaWQgc3RtMzJfdHJhbnNtaXRfY2hhcnNfZG1hKHN0cnVjdCB1YXJ0X3BvcnQgKnBvcnQpCiAJ
c3RydWN0IHN0bTMyX3VzYXJ0X29mZnNldHMgKm9mcyA9ICZzdG0zMnBvcnQtPmluZm8tPm9mczsK
IAlzdHJ1Y3QgY2lyY19idWYgKnhtaXQgPSAmcG9ydC0+c3RhdGUtPnhtaXQ7CiAJc3RydWN0IGRt
YV9hc3luY190eF9kZXNjcmlwdG9yICpkZXNjID0gTlVMTDsKLQlkbWFfY29va2llX3QgY29va2ll
OwogCXVuc2lnbmVkIGludCBjb3VudCwgaTsKIAogCWlmIChzdG0zMnBvcnQtPnR4X2RtYV9idXN5
KQpAQCAtMzg0LDE3ICszODMsMTggQEAgc3RhdGljIHZvaWQgc3RtMzJfdHJhbnNtaXRfY2hhcnNf
ZG1hKHN0cnVjdCB1YXJ0X3BvcnQgKnBvcnQpCiAJCQkJCSAgIERNQV9NRU1fVE9fREVWLAogCQkJ
CQkgICBETUFfUFJFUF9JTlRFUlJVUFQpOwogCi0JaWYgKCFkZXNjKSB7Ci0JCWZvciAoaSA9IGNv
dW50OyBpID4gMDsgaS0tKQotCQkJc3RtMzJfdHJhbnNtaXRfY2hhcnNfcGlvKHBvcnQpOwotCQly
ZXR1cm47Ci0JfQorCWlmICghZGVzYykKKwkJZ290byBmYWxsYmFja19lcnI7CiAKIAlkZXNjLT5j
YWxsYmFjayA9IHN0bTMyX3R4X2RtYV9jb21wbGV0ZTsKIAlkZXNjLT5jYWxsYmFja19wYXJhbSA9
IHBvcnQ7CiAKIAkvKiBQdXNoIGN1cnJlbnQgRE1BIFRYIHRyYW5zYWN0aW9uIGluIHRoZSBwZW5k
aW5nIHF1ZXVlICovCi0JY29va2llID0gZG1hZW5naW5lX3N1Ym1pdChkZXNjKTsKKwlpZiAoZG1h
X3N1Ym1pdF9lcnJvcihkbWFlbmdpbmVfc3VibWl0KGRlc2MpKSkgeworCQkvKiBkbWEgbm8geWV0
IHN0YXJ0ZWQsIHNhZmUgdG8gZnJlZSByZXNvdXJjZXMgKi8KKwkJZG1hZW5naW5lX3Rlcm1pbmF0
ZV9hc3luYyhzdG0zMnBvcnQtPnR4X2NoKTsKKwkJZ290byBmYWxsYmFja19lcnI7CisJfQogCiAJ
LyogSXNzdWUgcGVuZGluZyBETUEgVFggcmVxdWVzdHMgKi8KIAlkbWFfYXN5bmNfaXNzdWVfcGVu
ZGluZyhzdG0zMnBvcnQtPnR4X2NoKTsKQEAgLTQwMyw2ICs0MDMsMTEgQEAgc3RhdGljIHZvaWQg
c3RtMzJfdHJhbnNtaXRfY2hhcnNfZG1hKHN0cnVjdCB1YXJ0X3BvcnQgKnBvcnQpCiAKIAl4bWl0
LT50YWlsID0gKHhtaXQtPnRhaWwgKyBjb3VudCkgJiAoVUFSVF9YTUlUX1NJWkUgLSAxKTsKIAlw
b3J0LT5pY291bnQudHggKz0gY291bnQ7CisJcmV0dXJuOworCitmYWxsYmFja19lcnI6CisJZm9y
IChpID0gY291bnQ7IGkgPiAwOyBpLS0pCisJCXN0bTMyX3RyYW5zbWl0X2NoYXJzX3Bpbyhwb3J0
KTsKIH0KIAogc3RhdGljIHZvaWQgc3RtMzJfdHJhbnNtaXRfY2hhcnMoc3RydWN0IHVhcnRfcG9y
dCAqcG9ydCkKQEAgLTEwODcsNyArMTA5Miw2IEBAIHN0YXRpYyBpbnQgc3RtMzJfb2ZfZG1hX3J4
X3Byb2JlKHN0cnVjdCBzdG0zMl9wb3J0ICpzdG0zMnBvcnQsCiAJc3RydWN0IGRldmljZSAqZGV2
ID0gJnBkZXYtPmRldjsKIAlzdHJ1Y3QgZG1hX3NsYXZlX2NvbmZpZyBjb25maWc7CiAJc3RydWN0
IGRtYV9hc3luY190eF9kZXNjcmlwdG9yICpkZXNjID0gTlVMTDsKLQlkbWFfY29va2llX3QgY29v
a2llOwogCWludCByZXQ7CiAKIAkvKiBSZXF1ZXN0IERNQSBSWCBjaGFubmVsICovCkBAIC0xMTMy
LDcgKzExMzYsMTEgQEAgc3RhdGljIGludCBzdG0zMl9vZl9kbWFfcnhfcHJvYmUoc3RydWN0IHN0
bTMyX3BvcnQgKnN0bTMycG9ydCwKIAlkZXNjLT5jYWxsYmFja19wYXJhbSA9IE5VTEw7CiAKIAkv
KiBQdXNoIGN1cnJlbnQgRE1BIHRyYW5zYWN0aW9uIGluIHRoZSBwZW5kaW5nIHF1ZXVlICovCi0J
Y29va2llID0gZG1hZW5naW5lX3N1Ym1pdChkZXNjKTsKKwlyZXQgPSBkbWFfc3VibWl0X2Vycm9y
KGRtYWVuZ2luZV9zdWJtaXQoZGVzYykpOworCWlmIChyZXQpIHsKKwkJZG1hZW5naW5lX3Rlcm1p
bmF0ZV9zeW5jKHN0bTMycG9ydC0+cnhfY2gpOworCQlnb3RvIGNvbmZpZ19lcnI7CisJfQogCiAJ
LyogSXNzdWUgcGVuZGluZyBETUEgcmVxdWVzdHMgKi8KIAlkbWFfYXN5bmNfaXNzdWVfcGVuZGlu
ZyhzdG0zMnBvcnQtPnJ4X2NoKTsKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0
bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
