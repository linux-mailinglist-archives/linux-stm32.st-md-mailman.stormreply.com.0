Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 79190506737
	for <lists+linux-stm32@lfdr.de>; Tue, 19 Apr 2022 10:54:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 11F47C628A4;
	Tue, 19 Apr 2022 08:54:13 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 57CD0C60496
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Apr 2022 08:54:11 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23J7mPMJ031599;
 Tue, 19 Apr 2022 10:53:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=selector1;
 bh=2TdqCQA3HZJgjbQgS4ng8USah1H+t/xStkf042B0x94=;
 b=kZcqNamzq6IR++gU1x2mp3vOcRGEv6Dz1jLwtnFhO6IauwBm3SwU/PZo2wIbvHSrbo8V
 DSmquKRilSLdtoieiXx0hrVSdh/GkhuyO//S/v1tsamcY2H4K0vBL4V/XE7vQDVDqIuy
 FUaHe3aIzuaBBEXoJmwg2VgHOoZtMoPBWB1yg4Ti8ZWeuD+YvpHJjfSK7TE90UxmfNkP
 FGHJwEMb6ALx3trwuGvI26fFMh04SAYa7QTdH6vxWadySrpmuRBrDOlgR65t3L5vSmo0
 CSfbLv3pXZiDocm91oxyp6hCTYrtwpm5+euj+tcohti6Lj++28RDxOxq/ZXqlY9eaVNh Sw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3fh09refje-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Apr 2022 10:53:50 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 43AD8100034;
 Tue, 19 Apr 2022 10:53:47 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3C1992053D5;
 Tue, 19 Apr 2022 10:53:47 +0200 (CEST)
Received: from localhost (10.75.127.48) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Tue, 19 Apr 2022 10:53:46
 +0200
From: Valentin Caron <valentin.caron@foss.st.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Tue, 19 Apr 2022 10:53:28 +0200
Message-ID: <20220419085330.1178925-2-valentin.caron@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220419085330.1178925-1-valentin.caron@foss.st.com>
References: <20220419085330.1178925-1-valentin.caron@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-19_03,2022-04-15_01,2022-02-23_01
Cc: linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jiri Slaby <jirislaby@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH V3 1/3] serial: stm32: remove infinite loop
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
LXVzYXJ0LmMKaW5kZXggZjg4Njk3NmRhZWY2Li45OTEwYTE4Nzc5YWYgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvdHR5L3NlcmlhbC9zdG0zMi11c2FydC5jCisrKyBiL2RyaXZlcnMvdHR5L3NlcmlhbC9z
dG0zMi11c2FydC5jCkBAIC0xNjQwLDEwICsxNjQwLDE2IEBAIHN0YXRpYyB2b2lkIHN0bTMyX3Vz
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
