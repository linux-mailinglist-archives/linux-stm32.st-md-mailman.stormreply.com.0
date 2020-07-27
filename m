Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CA93222E935
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Jul 2020 11:39:40 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8C07DC36B27;
	Mon, 27 Jul 2020 09:39:40 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A95E4C36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Jul 2020 09:39:37 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06R9bZt4028611; Mon, 27 Jul 2020 11:39:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=KNpb5IhGAR9mrGu7U7F+4OMqL2SAQVWh1aDlJk1R/ks=;
 b=XCS39xlpu3dw83UhAQbLqmErci+xzOc3Jf2CMDSwhCvF0qDPr7yzkzoli7SWvLl6RkUL
 6M3autdinKYz7fiizzoQnahnSz44iRuNojqosCxsEo00Q4p1Bj2pH3Mw4C0OsJps4WKH
 cRIvJlgSUJineksA1rYGiPhUeW8SXqhaD2morP0s6tIjhWD7qhInTADRk8W2W4Bc3d38
 QNWiOOP9RN/0KsBNIsU7Q/I97+XkNPYhQ2hLXL0E+ZlZag8d90DoWANZMhLv/pqXUyaP
 UeAahUJ7K3AnocJL6kQLGJOkibFmerv7huBMDLB7jbBas4sekBvppHvwklRZjmURsl0z GQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32gagv0gbg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Jul 2020 11:39:25 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id ACEF110002A;
 Mon, 27 Jul 2020 11:39:24 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9A5E22AE6DA;
 Mon, 27 Jul 2020 11:39:24 +0200 (CEST)
Received: from lmecxl0995.lme.st.com (10.75.127.50) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 27 Jul
 2020 11:39:24 +0200
To: Minas Harutyunyan <hminas@synopsys.com>, Felipe Balbi <balbi@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
 <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre TORGUE <alexandre.torgue@st.com>
References: <20200724123748.25369-1-amelie.delaunay@st.com>
From: Amelie DELAUNAY <amelie.delaunay@st.com>
Message-ID: <8d59dcfa-dbb6-de26-9154-fc2bd349075f@st.com>
Date: Mon, 27 Jul 2020 11:39:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200724123748.25369-1-amelie.delaunay@st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG4NODE1.st.com (10.75.127.10) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-27_06:2020-07-27,
 2020-07-27 signatures=0
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Fabrice GASNIER <fabrice.gasnier@st.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 0/4] Fix DWC2 USB role switch support
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

Ck9uIDcvMjQvMjAgMjozNyBQTSwgQW1lbGllIERFTEFVTkFZIHdyb3RlOgo+IFRoaXMgcGF0Y2hz
ZXQgYWRkcyBtaXNzaW5nIGRvY3VtZW50YXRpb24gZm9yIHVzYi1yb2xlLXN3aXRjaCBzdXBwb3J0
IGluIERXQzIKPiBiaW5kaW5ncy4gSXQgYWxzbyBmaXhlcyBidWlsZCBpc3N1ZSB3aGVuIGNvbmZp
ZyBpcyBEV0MyX0hPU1Qgb25seSwKPiBzbGVlcGluZyB3aGlsZSBhdG9taWMgaXNzdWUgYW5kIG1p
c3NpbmcgdXNiLXJvbGUtc3dpdGNoIHVucmVnaXN0cmF0aW9uIAo+IGluIHByb2JlCj4gZXJyb3Ig
cGF0aC4KPiAKPiBBbWVsaWUgRGVsYXVuYXkgKDQpOgo+ICDCoCBkdC1iaW5kaW5nczogdXNiOiBk
d2MyOiBhZGQgb3B0aW9uYWwgdXNiLXJvbGUtc3dpdGNoIHByb3BlcnR5Cj4gIMKgIHVzYjogZHdj
MjogZml4IGJ1aWxkIGlzc3VlIHdoZW4gY29uZmlnIGlzIFVTQl9EV0MyX0hPU1Qgb25seQo+ICDC
oCB1c2I6IGR3YzI6IGRyZDogZml4IHNsZWVwaW5nIHdoaWxlIHNwaW5sb2NrIGF0b21pYyBjb250
ZXh0Cj4gIMKgIHVzYjogZHdjMjogZml4IGVycm9yIHBhdGggd2l0aCBtaXNzaW5nIGR3YzJfZHJk
X2V4aXQKPiAKPiAgwqAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy91c2IvZHdjMi55YW1swqDCoMKg
wqDCoMKgwqDCoCB8wqAgNCArKysKPiAgwqBkcml2ZXJzL3VzYi9kd2MyL2NvcmUuaMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAxICsKPiAgwqBkcml2ZXJz
L3VzYi9kd2MyL2RyZC5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB8IDMwICsrKysrKystLS0tLS0tLS0tLS0KPiAgwqBkcml2ZXJzL3VzYi9kd2MyL3BsYXRm
b3JtLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDIgKysKPiAgwqA0
IGZpbGVzIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKyksIDIwIGRlbGV0aW9ucygtKQo+IAo+IC0t
IAo+IDIuMTcuMQo+IAoKUGF0Y2hzZXQgZHJvcHBlZC4KClJlZ2FyZHMsCkFtZWxpZQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWls
aW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczov
L3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0z
Mgo=
