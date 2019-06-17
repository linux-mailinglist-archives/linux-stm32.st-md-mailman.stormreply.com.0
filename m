Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5889E48226
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Jun 2019 14:28:18 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 08E19C62758
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Jun 2019 12:28:18 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6E8F8C62756
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jun 2019 12:28:16 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5HCLCqf009408; Mon, 17 Jun 2019 14:28:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=E9NXlEGXNnvQZ3RULpw4oSl2qhYRA7pqUq0NxFi2maM=;
 b=Xn3sBMkfKYiuf6tnzB0nw/OrQ40k70XSyR3NVXIQ0Tyf8cgYlIClW771t+KqxiHkmQ7J
 Sl3H+GM6khJ7nB8zFPqU5RKM2siZIzdyCvSVaD5aKjcSSHjRcnbjam5zH5mCB9XunpMO
 drxsAYB1f4oqSBPcsHMCIIWdBf1e47fdq6Q+Vvx6dIJOXt5GJI7mRoDWbx42/zhySbHj
 n02S3xT2j0qnnBLjypHU37Nx73VwNIkVgTozZ9Efpyinwz+CThn65YlcQzo38Bq1KwUr
 OVjJM2CQXCXAbHWjBFf+SbrmMOQqBAQGJHB1ILAFIZNc85414UIu0s/PM+LfPiiOVVGT pg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2t4qjhte0v-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 17 Jun 2019 14:28:07 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 935DB3A;
 Mon, 17 Jun 2019 12:28:06 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 69B6829A9;
 Mon, 17 Jun 2019 12:28:06 +0000 (GMT)
Received: from [10.48.0.204] (10.75.127.50) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 17 Jun
 2019 14:28:05 +0200
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 <mcoquelin.stm32@gmail.com>, <robh+dt@kernel.org>
References: <20190612075451.8643-1-manivannan.sadhasivam@linaro.org>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <e34e8160-d16e-bf18-e7c3-240098908df2@st.com>
Date: Mon, 17 Jun 2019 14:28:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190612075451.8643-1-manivannan.sadhasivam@linaro.org>
Content-Language: en-US
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG8NODE1.st.com (10.75.127.22) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-17_06:, , signatures=0
Cc: devicetree@vger.kernel.org, loic.pallardy@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v4 0/4] Add Avenger96 board support
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

SGkgTWFuaSwKCk9uIDYvMTIvMTkgOTo1NCBBTSwgTWFuaXZhbm5hbiBTYWRoYXNpdmFtIHdyb3Rl
Ogo+IEhlbGxvLAo+IAo+IFRoaXMgcGF0Y2hzZXQgYWRkcyBBdmVuZ2VyOTYgYm9hcmQgc3VwcG9y
dC4gVGhpcyBib2FyZCBpcyBvbmUgb2YgdGhlCj4gQ29uc3VtZXIgRWRpdGlvbiBib2FyZHMgb2Yg
dGhlIDk2Qm9hcmRzIGZhbWlseSBmcm9tIEFycm93IEVsZWN0cm9uaWNzCj4gZmVhdHVyaW5nIFNU
TTMyTVAxNTdBIE1QVSBhbmQgaGFzIHRoZSBmb2xsb3dpbmcgZmVhdHVyZXM6Cj4gCj4gU29DOiBT
VE0zMk1QMTU3QUFDCj4gUE1JQzogU1RQTUlDMUEKPiBSQU06IDEwMjQgTWJ5dGUgQCA1MzNNSHoK
PiBTdG9yYWdlOiBlTU1DIHY0LjUxOiA4IEdieXRlCj4gICAgICAgICAgIG1pY3JvU0QgU29ja2V0
OiBVSFMtMSB2My4wMQo+IEV0aGVybmV0IFBvcnQ6IDEwLzEwMC8xMDAwIE1iaXQvcywgSUVFRSA4
MDIuMyBDb21wbGlhbnQKPiBXaXJlbGVzczogV2lGaSA1IEdIeiAmIDIuNEdIeiBJRUVFIDgwMi4x
MWEvYi9nL24vYWMKPiAgICAgICAgICAgIEJsdWV0b290aMKudjQuMiAoQlIvRURSL0JMRSkKPiBV
U0I6IDJ4IFR5cGUgQSAoVVNCIDIuMCkgSG9zdCBhbmQgMXggTWljcm8gQiAoVVNCIDIuMCkgT1RH
Cj4gRGlzcGxheTogSERNSTogV1hHQSAoMTM2Nng3NjgpQCA2MCBmcHMsIEhETUkgMS40Cj4gTEVE
OiA0eCBVc2VyIExFRCwgMXggV2lGaSBMRUQsIDF4IEJUIExFRAo+IAo+IE1vcmUgaW5mb3JtYXRp
b24gYWJvdXQgdGhpcyBib2FyZCBjYW4gYmUgZm91bmQgaW4gOTZCb2FyZHMgd2Vic2l0ZToKPiBo
dHRwczovL3d3dy45NmJvYXJkcy5vcmcvcHJvZHVjdC9hdmVuZ2VyOTYvCj4gCj4gVGhhbmtzLAo+
IE1hbmkKPiAKClRoYW5rcyB0byBleHRlbmQgdGhlIHN0bTMyIGZhbWlseSEKSSBqdXN0IGZvcm1h
dCBjb21taXQgbWVzc2FnZSB0aXRsZSBmb3IgZGV2aWNlIHRyZWUgcGF0Y2hlcyAoIkFSTTogZHRz
OiAKc3RtMzIgLi4uIikuCgpSb2IsIEkgdG9vayBhbHNvIHRoZSBkdC1iaW5kaW5nIHBhdGNoZXMu
CgpTZXJpZXMgYXBwbGllZCBvbiBzdG0zMi1uZXh0LgoKUmVnYXJkcwpBbGV4CgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGlu
ZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9z
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
