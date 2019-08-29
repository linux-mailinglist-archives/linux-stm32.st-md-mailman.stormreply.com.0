Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA52A140B
	for <lists+linux-stm32@lfdr.de>; Thu, 29 Aug 2019 10:49:26 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 70264C35E01;
	Thu, 29 Aug 2019 08:49:26 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 48F01C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Aug 2019 08:49:24 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7T8kxr5031268; Thu, 29 Aug 2019 10:48:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : references
 : from : message-id : date : mime-version : in-reply-to : content-type :
 content-transfer-encoding; s=STMicroelectronics;
 bh=NlGM32ocdpPWCJcOtDVLjpgH+SvU7mlXgBdhDT7M+X8=;
 b=u0db09ugjsVglBswXP+mVOWomLQtCDERzWqyS+4Tpnl9MaCsmoTNFiPCKzdfA50T6D7C
 C+GbQFCz9y6h5qxvB99GS73qVvw+KBZ69vEVNNDHZmhmS15jbzNJVBCyDo2rYNVPA0M7
 AyM0nNRswqEa8rgxhWc9dSev0UQYkJERN5IjBULZUiyCR/eN9O5v/jIbbg2kSa8HokzD
 rtGaXJ45MtbkV2OIbOKlJc3uFrOvxL1SpY0kxAVa5WkVxmObe6Qqx27tr3PO4f2e0oac
 pDQVtheQDemuJ/HUlrZ3smKV1zedt2eG+UZXZqQCz4eKkIaj21L5ZvS8MsZ+wsLUnvfD 2g== 
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com with ESMTP id 2unujk470g-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Thu, 29 Aug 2019 10:48:55 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 8F4B04D;
 Thu, 29 Aug 2019 08:48:47 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E22742AD3F3;
 Thu, 29 Aug 2019 10:48:46 +0200 (CEST)
Received: from lmecxl0912.lme.st.com (10.75.127.47) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 29 Aug
 2019 10:48:46 +0200
To: Gerald BAEZA <gerald.baeza@st.com>, "will@kernel.org" <will@kernel.org>,
 "mark.rutland@arm.com" <mark.rutland@arm.com>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>, "mcoquelin.stm32@gmail.com"
 <mcoquelin.stm32@gmail.com>, "corbet@lwn.net" <corbet@lwn.net>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "olof@lixom.net"
 <olof@lixom.net>, "arnd@arndb.de" <arnd@arndb.de>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org"
 <linux-doc@vger.kernel.org>
References: <1566918464-23927-1-git-send-email-gerald.baeza@st.com>
 <1566918464-23927-6-git-send-email-gerald.baeza@st.com>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <8e3170a3-c814-d06e-f1f9-6d4e6a4bed71@st.com>
Date: Thu, 29 Aug 2019 10:48:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1566918464-23927-6-git-send-email-gerald.baeza@st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG8NODE2.st.com (10.75.127.23) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-29_05:, , signatures=0
Subject: Re: [Linux-stm32] [PATCH v3 5/5] ARM: dts: stm32: add ddrperfm on
	stm32mp157c
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

SGkgR2VyYWxkCgpPbiA4LzI3LzE5IDU6MDggUE0sIEdlcmFsZCBCQUVaQSB3cm90ZToKPiBUaGUg
RERSUEVSRk0gaXMgdGhlIEREUiBQZXJmb3JtYW5jZSBNb25pdG9yIGVtYmVkZGVkCj4gaW4gU1RN
MzJNUDEgU09DLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEdlcmFsZCBCYWV6YSA8Z2VyYWxkLmJhZXph
QHN0LmNvbT4KPiAtLS0KPiAgwqBhcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTU3Yy5kdHNpIHwg
OCArKysrKysrKwo+ICDCoDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykKPiAKPiBkaWZm
IC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1N2MuZHRzaSAKPiBiL2FyY2gvYXJt
L2Jvb3QvZHRzL3N0bTMybXAxNTdjLmR0c2kKPiBpbmRleCAwYzRlNmViLi42ZWE2OTMzIDEwMDY0
NAo+IC0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNTdjLmR0c2kKPiArKysgYi9hcmNo
L2FybS9ib290L2R0cy9zdG0zMm1wMTU3Yy5kdHNpCj4gQEAgLTEzNzgsNiArMTM3OCwxNCBAQAo+
ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfTsKPiAg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfTsKPiAKPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBkZHJwZXJmbTogcGVyZkA1YTAwNzAwMCB7Cj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbXBhdGlibGUgPSAic3Qsc3RtMzItZGRy
LXBtdSI7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJl
ZyA9IDwweDVhMDA3MDAwIDB4NDAwPjsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgY2xvY2tzID0gPCZyY2MgRERSUEVSRk0+Owo+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXNldHMgPSA8JnJjYyBERFJQRVJGTV9S
PjsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RhdHVz
ID0gIm9rYXkiOwoKTm8gbmVlZCB0byBhZGQgInN0YXR1cyA9ICJva2F5IiIgaGVyZS4KCnJlZ2Fy
ZHMKQWxleAoKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9Owo+ICsKPiAgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdXNhcnQxOiBzZXJpYWxANWMwMDAwMDAgewo+ICDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29tcGF0aWJs
ZSA9ICJzdCxzdG0zMmg3LXVhcnQiOwo+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgcmVnID0gPDB4NWMwMDAwMDAgMHg0MDA+Owo+IC0tIAo+IDIuNy40
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0
bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
Cmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXN0bTMyCg==
