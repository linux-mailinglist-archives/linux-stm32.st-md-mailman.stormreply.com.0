Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FFE219AB16
	for <lists+linux-stm32@lfdr.de>; Wed,  1 Apr 2020 13:49:42 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EF1CDC36B0B;
	Wed,  1 Apr 2020 11:49:41 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 10232C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Apr 2020 11:49:39 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 031Bkxpm024980; Wed, 1 Apr 2020 13:49:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=aZWau1vWy8nJyZdXOYXLadRU6Z617QmaukbbcrrY4bw=;
 b=HbcPBW7WuXoouDC/2wnpPm8Y81eTsm6s1iByWlGj6xnnmk5Lc3qP1Ks6YYm+HX3DWjKL
 8SUVyfR3dzukZ6/XGe8QEYTBB/ohg2OC076DzDiGpLU44rI8JkL7xMNRTXHUPawYa0Pg
 tXiN6/7mNXr0lZYG+taHXCju5AxCeyN8MMRuiWyVBfPtiOra38jdIjNhEf1CegYiVE62
 tqcbxhEknNg29+WSiZpgKPaZhw1K7fPhO1tmWObpEO3gHmqmh6uiq7MMg1iIIRrd3BNL
 3L6QZdd4BL9o6Y5HAJTFrRcSs6pHXkrEy2DHRMrBpdILEJUrvSOx8liNCkS/ubyiMr/0 cg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 302y53y2cj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Apr 2020 13:49:32 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9A3A2100034;
 Wed,  1 Apr 2020 13:49:31 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8CC152A621B;
 Wed,  1 Apr 2020 13:49:31 +0200 (CEST)
Received: from lmecxl0912.tpe.st.com (10.75.127.50) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 1 Apr
 2020 13:49:27 +0200
To: Marek Vasut <marex@denx.de>, <linux-arm-kernel@lists.infradead.org>
References: <20200331175811.205153-1-marex@denx.de>
 <20200331175811.205153-2-marex@denx.de>
 <06ad9a40-3118-7336-056d-b115aef66599@st.com>
 <86a4957a-dddd-08b9-e920-2943548610d1@denx.de>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <6634a7b7-e786-6840-649f-0c49b16fd450@st.com>
Date: Wed, 1 Apr 2020 13:49:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <86a4957a-dddd-08b9-e920-2943548610d1@denx.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-01_01:2020-03-31,
 2020-03-31 signatures=0
Cc: Patrick Delaunay <patrick.delaunay@st.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [Linux-stm32] [PATCH V3 01/22] ARM: dts: stm32: Add alternate
 pinmux for ethernet RGMII
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

CgpPbiA0LzEvMjAgMTowNCBQTSwgTWFyZWsgVmFzdXQgd3JvdGU6Cj4gT24gNC8xLzIwIDExOjUy
IEFNLCBBbGV4YW5kcmUgVG9yZ3VlIHdyb3RlOgo+PiBIaSBNYXJlawo+IAo+IEhpLAo+IAo+IFsu
Li5dCj4gCj4+PiAtLS0gYS9hcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTUtcGluY3RybC5kdHNp
Cj4+PiArKysgYi9hcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTUtcGluY3RybC5kdHNpCj4+PiBA
QCAtMTk2LDYgKzE5Niw1NyBAQCBwaW5zMSB7Cj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgIH07Cj4+
PiAgwqDCoMKgwqDCoCB9Owo+Pj4gIMKgICvCoMKgwqAgZXRoZXJuZXQwX3JnbWlpX3BpbnNfYjog
cmdtaWktMSB7Cj4+PiArwqDCoMKgwqDCoMKgwqAgcGluczEgewo+Pj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgcGlubXV4ID0gPFNUTTMyX1BJTk1VWCgnRycsIDUsIEFGMTEpPiwgLyoKPj4+IEVU
SF9SR01JSV9DTEsxMjUgKi8KPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA8
U1RNMzJfUElOTVVYKCdHJywgNCwgQUYxMSk+LCAvKiBFVEhfUkdNSUlfR1RYX0NMSyAqLwo+Pj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDxTVE0zMl9QSU5NVVgoJ0InLCAxMiwg
QUYxMSk+LCAvKiBFVEhfUkdNSUlfVFhEMCAqLwo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIDxTVE0zMl9QSU5NVVgoJ0cnLCAxNCwgQUYxMSk+LCAvKiBFVEhfUkdNSUlfVFhE
MSAqLwo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDxTVE0zMl9QSU5NVVgo
J0MnLCAyLCBBRjExKT4sIC8qIEVUSF9SR01JSV9UWEQyICovCj4+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgPFNUTTMyX1BJTk1VWCgnRScsIDIsIEFGMTEpPiwgLyogRVRIX1JH
TUlJX1RYRDMgKi8KPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA8U1RNMzJf
UElOTVVYKCdHJywgMTEsIEFGMTEpPiwgLyogRVRIX1JHTUlJX1RYX0NUTCAqLwo+Pj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDxTVE0zMl9QSU5NVVgoJ0MnLCAxLCBBRjExKT47
IC8qIEVUSF9NREMgKi8KPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJpYXMtZGlzYWJsZTsK
Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRyaXZlLXB1c2gtcHVsbDsKPj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHNsZXctcmF0ZSA9IDwyPjsKPj4+ICvCoMKgwqDCoMKgwqDCoCB9Owo+
Pj4gK8KgwqDCoMKgwqDCoMKgIHBpbnMyIHsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHBp
bm11eCA9IDxTVE0zMl9QSU5NVVgoJ0EnLCAyLCBBRjExKT47IC8qIEVUSF9NRElPICovCj4+PiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBiaWFzLWRpc2FibGU7Cj4+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBkcml2ZS1wdXNoLXB1bGw7Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzbGV3
LXJhdGUgPSA8MD47Cj4+PiArwqDCoMKgwqDCoMKgwqAgfTsKPj4+ICvCoMKgwqDCoMKgwqDCoCBw
aW5zMyB7Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwaW5tdXggPSA8U1RNMzJfUElOTVVY
KCdDJywgNCwgQUYxMSk+LCAvKiBFVEhfUkdNSUlfUlhEMCAqLwo+Pj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIDxTVE0zMl9QSU5NVVgoJ0MnLCA1LCBBRjExKT4sIC8qIEVUSF9S
R01JSV9SWEQxICovCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPFNUTTMy
X1BJTk1VWCgnSCcsIDYsIEFGMTEpPiwgLyogRVRIX1JHTUlJX1JYRDIgKi8KPj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA8U1RNMzJfUElOTVVYKCdCJywgMSwgQUYxMSk+LCAv
KiBFVEhfUkdNSUlfUlhEMyAqLwo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IDxTVE0zMl9QSU5NVVgoJ0EnLCAxLCBBRjExKT4sIC8qIEVUSF9SR01JSV9SWF9DTEsgKi8KPj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA8U1RNMzJfUElOTVVYKCdBJywgNywg
QUYxMSk+OyAvKiBFVEhfUkdNSUlfUlhfQ1RMICovCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBiaWFzLWRpc2FibGU7Cj4+PiArwqDCoMKgwqDCoMKgwqAgfTsKPj4+ICvCoMKgwqAgfTsKPj4+
ICsKPj4+ICvCoMKgwqAgZXRoZXJuZXQwX3JnbWlpX3BpbnNfc2xlZXBfYjogcmdtaWktc2xlZXAt
MSB7Cj4+Cj4+IEkganVzdCBtZXJnZWQgYSBzZXJpZXMgZnJvbSBBaG1hZCB0aGF0IHVuaWZ5IHBp
bnMgZ3JvdXAgbmFtZS4gU28gaXQKPj4gc2hvdWxkIGJlIGV0aGVybmV0MF9yZ21paV9zbGVlcF9w
aW5zX2IuIEFzIGEgbG90IGNoYW5nZSBoYXZlIGJlZW4gZG9uZQo+PiBpbiBwaW5jdHJsIGR0c2kg
ZGlsZXMsIGNhbiB5b3UgcmViYXNlIG9uIHRvcCBvZiBzdG0zMi1uZXQgcGxlYXNlPwo+IAo+IEdy
ZWF0LiBEbyB5b3UgaGF2ZSBhIGxpbmsgdG8gdGhpcyB0cmVlIHdpdGggdGhpcyBicmFuY2ggPwo+
IAoKU29ycnkgSSBtZWFuIHN0bTMyLW5leHQgYnJhbmNoIGhlcmU6IApnaXQ6Ly9naXQua2VybmVs
Lm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvYXRvcmd1ZS9zdG0zMi5naXQKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGlu
ZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9z
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
