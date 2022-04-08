Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 306204F95B1
	for <lists+linux-stm32@lfdr.de>; Fri,  8 Apr 2022 14:27:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E967EC628C2;
	Fri,  8 Apr 2022 12:27:26 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A6395C60479
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Apr 2022 12:27:23 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 2389j3P9000551;
 Fri, 8 Apr 2022 14:27:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=selector1;
 bh=OzzsSeRZXTJPRZje9ui1T8+kROrim9zZTezfZrmqwVA=;
 b=g9pEZNsoYYlGs5g2LsrK5fLiu589Fxw1KHMSO0CId/eEqsrdIBXj6aKTW+eD8ltMsGgE
 Lmo260J0JhOSP7+0q6M1B/R9dJ8DCktbMGqZ4jU2MR7bKblxcZXYXDj/HLenA4x6JuV1
 GxpxUrt+JnIKxaEH85wK6gRR3zIVInqb0/T9CmSzK552YxFgLzHvfOtY4DTLLw1xbbZ5
 UDIaiJV5O85hvXJlE1uKarAfUTL6j0LghhtsifE0PWAyBmwTkxVuycc8aH7RWkhJKjM4
 kfPbnN04JyVNJ+xhM1hlbpHavSUKqxYxE4CW7HuDrOs7s5HvpWs8CQinBrJROwov5khc 7Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3f9wr7r1p9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Apr 2022 14:27:05 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8EA7B100038;
 Fri,  8 Apr 2022 14:27:03 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8666321A21E;
 Fri,  8 Apr 2022 14:27:03 +0200 (CEST)
Received: from localhost (10.75.127.50) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Fri, 8 Apr 2022 14:27:03
 +0200
From: Valentin Caron <valentin.caron@foss.st.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jonathan Corbet
 <corbet@lwn.net>
Date: Fri, 8 Apr 2022 14:26:34 +0200
Message-ID: <20220408122636.505737-2-valentin.caron@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220408122636.505737-1-valentin.caron@foss.st.com>
References: <20220408122636.505737-1-valentin.caron@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-08_04,2022-04-08_01,2022-02-23_01
Cc: linux-serial@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jiri Slaby <jirislaby@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH V2 1/3] serial: stm32: remove infinite loop
	possibility in putchar function
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

UmV3b3JrIHN0bTMyX3VzYXJ0X2NvbnNvbGVfcHV0Y2hhcigpIGZ1bmN0aW9uIGluIG9yZGVyIHRv
IGFudGljaXBhdGUKdGhlIGNhc2Ugd2hlcmUgdGhlIGNoYXJhY3RlciBjYW4gbmV2ZXIgYmUgc2Vu
dC4KClNpZ25lZC1vZmYtYnk6IFZhbGVudGluIENhcm9uIDx2YWxlbnRpbi5jYXJvbkBmb3NzLnN0
LmNvbT4KLS0tCiBkcml2ZXJzL3R0eS9zZXJpYWwvc3RtMzItdXNhcnQuYyB8IDEyICsrKysrKysr
Ky0tLQogZHJpdmVycy90dHkvc2VyaWFsL3N0bTMyLXVzYXJ0LmggfCAgMiArKwogMiBmaWxlcyBj
aGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvdHR5L3NlcmlhbC9zdG0zMi11c2FydC5jIGIvZHJpdmVycy90dHkvc2VyaWFsL3N0bTMy
LXVzYXJ0LmMKaW5kZXggODdiNWNkNGM5NzQzLi44Mzg5NWRhODQ4OTEgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvdHR5L3NlcmlhbC9zdG0zMi11c2FydC5jCisrKyBiL2RyaXZlcnMvdHR5L3NlcmlhbC9z
dG0zMi11c2FydC5jCkBAIC0xNjQ1LDEwICsxNjQ1LDE2IEBAIHN0YXRpYyB2b2lkIHN0bTMyX3Vz
YXJ0X2NvbnNvbGVfcHV0Y2hhcihzdHJ1Y3QgdWFydF9wb3J0ICpwb3J0LCB1bnNpZ25lZCBjaGFy
IGNoCiB7CiAJc3RydWN0IHN0bTMyX3BvcnQgKnN0bTMyX3BvcnQgPSB0b19zdG0zMl9wb3J0KHBv
cnQpOwogCWNvbnN0IHN0cnVjdCBzdG0zMl91c2FydF9vZmZzZXRzICpvZnMgPSAmc3RtMzJfcG9y
dC0+aW5mby0+b2ZzOworCXUzMiBpc3I7CisJaW50IHJldDsKIAotCXdoaWxlICghKHJlYWRsX3Jl
bGF4ZWQocG9ydC0+bWVtYmFzZSArIG9mcy0+aXNyKSAmIFVTQVJUX1NSX1RYRSkpCi0JCWNwdV9y
ZWxheCgpOwotCisJcmV0ID0gcmVhZGxfcmVsYXhlZF9wb2xsX3RpbWVvdXRfYXRvbWljKHBvcnQt
Pm1lbWJhc2UgKyBvZnMtPmlzciwgaXNyLAorCQkJCQkJKGlzciAmIFVTQVJUX1NSX1RYRSksIDEw
MCwKKwkJCQkJCVNUTTMyX1VTQVJUX1RJTUVPVVRfVVNFQyk7CisJaWYgKHJldCAhPSAwKSB7CisJ
CWRldl9lcnIocG9ydC0+ZGV2LCAiRXJyb3Igd2hpbGUgc2VuZGluZyBkYXRhIGluIFVBUlQgVFgg
OiAlZFxuIiwgcmV0KTsKKwkJcmV0dXJuOworCX0KIAl3cml0ZWxfcmVsYXhlZChjaCwgcG9ydC0+
bWVtYmFzZSArIG9mcy0+dGRyKTsKIH0KIApkaWZmIC0tZ2l0IGEvZHJpdmVycy90dHkvc2VyaWFs
L3N0bTMyLXVzYXJ0LmggYi9kcml2ZXJzL3R0eS9zZXJpYWwvc3RtMzItdXNhcnQuaAppbmRleCBm
ZWFiOTUyYWVjMTYuLmQ3MzRjNGE1ZmQyNCAxMDA2NDQKLS0tIGEvZHJpdmVycy90dHkvc2VyaWFs
L3N0bTMyLXVzYXJ0LmgKKysrIGIvZHJpdmVycy90dHkvc2VyaWFsL3N0bTMyLXVzYXJ0LmgKQEAg
LTI1MSw2ICsyNTEsOCBAQCBzdHJ1Y3Qgc3RtMzJfdXNhcnRfaW5mbyBzdG0zMmg3X2luZm8gPSB7
CiAjZGVmaW5lIFJYX0JVRl9QIChSWF9CVUZfTCAvIDIpCSAvKiBkbWEgcnggYnVmZmVyIHBlcmlv
ZCAgICAgKi8KICNkZWZpbmUgVFhfQlVGX0wgUlhfQlVGX0wJIC8qIGRtYSB0eCBidWZmZXIgbGVu
Z3RoICAgICAqLwogCisjZGVmaW5lIFNUTTMyX1VTQVJUX1RJTUVPVVRfVVNFQyBVU0VDX1BFUl9T
RUMgLyogMXMgdGltZW91dCBpbiDCtXMgKi8KKwogc3RydWN0IHN0bTMyX3BvcnQgewogCXN0cnVj
dCB1YXJ0X3BvcnQgcG9ydDsKIAlzdHJ1Y3QgY2xrICpjbGs7Ci0tIAoyLjI1LjEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxp
bmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8v
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMy
Cg==
