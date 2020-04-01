Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D049519A9ED
	for <lists+linux-stm32@lfdr.de>; Wed,  1 Apr 2020 13:04:26 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8BCAEC36B0B;
	Wed,  1 Apr 2020 11:04:26 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6D225C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Apr 2020 11:04:25 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 48sjy05ZH8z1rtM7;
 Wed,  1 Apr 2020 13:04:24 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 48sjy04sNZz1r0cS;
 Wed,  1 Apr 2020 13:04:24 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id dryn0hDFTdTa; Wed,  1 Apr 2020 13:04:22 +0200 (CEST)
X-Auth-Info: P13QGhQEKyjD9t8OKEs8nxx7eM+buhDn3ECmbptOyz0=
Received: from [IPv6:::1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Wed,  1 Apr 2020 13:04:22 +0200 (CEST)
To: Alexandre Torgue <alexandre.torgue@st.com>,
 linux-arm-kernel@lists.infradead.org
References: <20200331175811.205153-1-marex@denx.de>
 <20200331175811.205153-2-marex@denx.de>
 <06ad9a40-3118-7336-056d-b115aef66599@st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <86a4957a-dddd-08b9-e920-2943548610d1@denx.de>
Date: Wed, 1 Apr 2020 13:04:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <06ad9a40-3118-7336-056d-b115aef66599@st.com>
Content-Language: en-US
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gNC8xLzIwIDExOjUyIEFNLCBBbGV4YW5kcmUgVG9yZ3VlIHdyb3RlOgo+IEhpIE1hcmVrCgpI
aSwKClsuLi5dCgo+PiAtLS0gYS9hcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTUtcGluY3RybC5k
dHNpCj4+ICsrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNS1waW5jdHJsLmR0c2kKPj4g
QEAgLTE5Niw2ICsxOTYsNTcgQEAgcGluczEgewo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgfTsKPj4g
wqDCoMKgwqDCoCB9Owo+PiDCoCArwqDCoMKgIGV0aGVybmV0MF9yZ21paV9waW5zX2I6IHJnbWlp
LTEgewo+PiArwqDCoMKgwqDCoMKgwqAgcGluczEgewo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBwaW5tdXggPSA8U1RNMzJfUElOTVVYKCdHJywgNSwgQUYxMSk+LCAvKgo+PiBFVEhfUkdNSUlf
Q0xLMTI1ICovCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA8U1RNMzJfUElO
TVVYKCdHJywgNCwgQUYxMSk+LCAvKiBFVEhfUkdNSUlfR1RYX0NMSyAqLwo+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPFNUTTMyX1BJTk1VWCgnQicsIDEyLCBBRjExKT4sIC8q
IEVUSF9SR01JSV9UWEQwICovCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA8
U1RNMzJfUElOTVVYKCdHJywgMTQsIEFGMTEpPiwgLyogRVRIX1JHTUlJX1RYRDEgKi8KPj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDxTVE0zMl9QSU5NVVgoJ0MnLCAyLCBBRjEx
KT4sIC8qIEVUSF9SR01JSV9UWEQyICovCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCA8U1RNMzJfUElOTVVYKCdFJywgMiwgQUYxMSk+LCAvKiBFVEhfUkdNSUlfVFhEMyAqLwo+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPFNUTTMyX1BJTk1VWCgnRycsIDEx
LCBBRjExKT4sIC8qIEVUSF9SR01JSV9UWF9DVEwgKi8KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIDxTVE0zMl9QSU5NVVgoJ0MnLCAxLCBBRjExKT47IC8qIEVUSF9NREMgKi8K
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYmlhcy1kaXNhYmxlOwo+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBkcml2ZS1wdXNoLXB1bGw7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNs
ZXctcmF0ZSA9IDwyPjsKPj4gK8KgwqDCoMKgwqDCoMKgIH07Cj4+ICvCoMKgwqDCoMKgwqDCoCBw
aW5zMiB7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHBpbm11eCA9IDxTVE0zMl9QSU5NVVgo
J0EnLCAyLCBBRjExKT47IC8qIEVUSF9NRElPICovCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGJpYXMtZGlzYWJsZTsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZHJpdmUtcHVzaC1wdWxs
Owo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzbGV3LXJhdGUgPSA8MD47Cj4+ICvCoMKgwqDC
oMKgwqDCoCB9Owo+PiArwqDCoMKgwqDCoMKgwqAgcGluczMgewo+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBwaW5tdXggPSA8U1RNMzJfUElOTVVYKCdDJywgNCwgQUYxMSk+LCAvKiBFVEhfUkdN
SUlfUlhEMCAqLwo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPFNUTTMyX1BJ
Tk1VWCgnQycsIDUsIEFGMTEpPiwgLyogRVRIX1JHTUlJX1JYRDEgKi8KPj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIDxTVE0zMl9QSU5NVVgoJ0gnLCA2LCBBRjExKT4sIC8qIEVU
SF9SR01JSV9SWEQyICovCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA8U1RN
MzJfUElOTVVYKCdCJywgMSwgQUYxMSk+LCAvKiBFVEhfUkdNSUlfUlhEMyAqLwo+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPFNUTTMyX1BJTk1VWCgnQScsIDEsIEFGMTEpPiwg
LyogRVRIX1JHTUlJX1JYX0NMSyAqLwo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgPFNUTTMyX1BJTk1VWCgnQScsIDcsIEFGMTEpPjsgLyogRVRIX1JHTUlJX1JYX0NUTCAqLwo+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBiaWFzLWRpc2FibGU7Cj4+ICvCoMKgwqDCoMKgwqDC
oCB9Owo+PiArwqDCoMKgIH07Cj4+ICsKPj4gK8KgwqDCoCBldGhlcm5ldDBfcmdtaWlfcGluc19z
bGVlcF9iOiByZ21paS1zbGVlcC0xIHsKPiAKPiBJIGp1c3QgbWVyZ2VkIGEgc2VyaWVzIGZyb20g
QWhtYWQgdGhhdCB1bmlmeSBwaW5zIGdyb3VwIG5hbWUuIFNvIGl0Cj4gc2hvdWxkIGJlIGV0aGVy
bmV0MF9yZ21paV9zbGVlcF9waW5zX2IuIEFzIGEgbG90IGNoYW5nZSBoYXZlIGJlZW4gZG9uZQo+
IGluIHBpbmN0cmwgZHRzaSBkaWxlcywgY2FuIHlvdSByZWJhc2Ugb24gdG9wIG9mIHN0bTMyLW5l
dCBwbGVhc2U/CgpHcmVhdC4gRG8geW91IGhhdmUgYSBsaW5rIHRvIHRoaXMgdHJlZSB3aXRoIHRo
aXMgYnJhbmNoID8KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4v
bGlzdGluZm8vbGludXgtc3RtMzIK
