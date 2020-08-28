Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D186255E47
	for <lists+linux-stm32@lfdr.de>; Fri, 28 Aug 2020 17:56:59 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CB764C32EA6;
	Fri, 28 Aug 2020 15:56:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BCE56C36B26
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Aug 2020 15:56:56 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07SFlDdc003858; Fri, 28 Aug 2020 17:56:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=S7U1Ln8d/iMkZdViWfAvkE4BpDPeQzRAE9issxFkD/U=;
 b=tgk5QGB/GViBUZV80MIAg/n4GtIWssMaU971SZMMmf7pH4xpmXMkOplgwC+yzIesg3DR
 /jRGcDRFoflfvWr4umopqniSdZ14z275mQENqswpBy3K+Om+85a/VjJyordHRQfvI2OG
 R1q/qEjKN0A+85K0Tv+KFuDoTYID0cTnOlHEsipDYLZ7Zg6gdfDKKggIoIjn68pwEcXH
 57uYvwjotFp3pXl7092HdDzM5QhV7kWfGR5ODZc8O0qVoLlnsKzcMUObDAosaKRARjO9
 f1EvqzNL5DOG0vUgyhHAkn6uXj1+RhGr+KLCbwN7O9nH90EQE/gq1rhZmCi42vL9eIgJ ew== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 333b2n4esq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Aug 2020 17:56:49 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 046F210002A;
 Fri, 28 Aug 2020 17:56:48 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E20DF2B300D;
 Fri, 28 Aug 2020 17:56:48 +0200 (CEST)
Received: from lmecxl0912.lme.st.com (10.75.127.44) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 28 Aug
 2020 17:56:48 +0200
To: Marek Vasut <marex@denx.de>, <linux-arm-kernel@lists.infradead.org>
References: <20200822203611.61997-1-marex@denx.de>
 <aaa9a92f-193c-9344-523b-fd5b7d7aaef2@st.com>
 <ab6d81d8-f276-ecd5-2f51-0bcecd47680f@denx.de>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <d649ca40-4b07-20a2-49ee-00da585f32a8@st.com>
Date: Fri, 28 Aug 2020 17:56:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <ab6d81d8-f276-ecd5-2f51-0bcecd47680f@denx.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-28_11:2020-08-28,
 2020-08-28 signatures=0
Cc: Patrick Delaunay <patrick.delaunay@st.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: Add alternate pinmux for
	DCMI pins
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

SGksCgpPbiA4LzI4LzIwIDI6NTIgUE0sIE1hcmVrIFZhc3V0IHdyb3RlOgo+IE9uIDgvMjgvMjAg
Mjo0NyBQTSwgQWxleGFuZHJlIFRvcmd1ZSB3cm90ZToKPj4gSGkgTWFyZWsKPiAKPiBIaSwKPiAK
PiBbLi4uXQo+IAo+Pj4gK8KgwqDCoMKgwqDCoMKgIHBpbnMgewo+Pj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgcGlubXV4ID0gPFNUTTMyX1BJTk1VWCgnQScsIDQswqAgQUYxMyk+LC8qIERDTUlf
SFNZTkMgKi8KPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA8U1RNMzJfUElO
TVVYKCdCJywgNyzCoCBBRjEzKT4sLyogRENNSV9WU1lOQyAqLwo+Pj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIDxTVE0zMl9QSU5NVVgoJ0EnLCA2LMKgIEFGMTMpPiwvKiBEQ01J
X1BJWENMSyAqLwo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDxTVE0zMl9Q
SU5NVVgoJ0EnLCA5LMKgIEFGMTMpPiwvKiBEQ01JX0QwICovCj4+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgPFNUTTMyX1BJTk1VWCgnSCcsIDEwLCBBRjEzKT4sLyogRENNSV9E
MSAqLwo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDxTVE0zMl9QSU5NVVgo
J0UnLCAwLCBBRjEzKT4sLyogRENNSV9EMiAqLwo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIDxTVE0zMl9QSU5NVVgoJ0UnLCAxLCBBRjEzKT4sLyogRENNSV9EMyAqLwo+Pj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDxTVE0zMl9QSU5NVVgoJ0gnLCAxNCwg
QUYxMyk+LC8qIERDTUlfRDQgKi8KPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCA8U1RNMzJfUElOTVVYKCdJJywgNCzCoCBBRjEzKT4sLyogRENNSV9ENSAqLwo+Pj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDxTVE0zMl9QSU5NVVgoJ0knLCA2LMKgIEFGMTMp
PiwvKiBEQ01JX0Q2ICovCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPFNU
TTMyX1BJTk1VWCgnRScsIDYswqAgQUYxMyk+LC8qIERDTUlfRDcgKi8KPj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA8U1RNMzJfUElOTVVYKCdJJywgMSzCoCBBRjEzKT4sLyog
RENNSV9EOCAqLwo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDxTVE0zMl9Q
SU5NVVgoJ0gnLCA3LMKgIEFGMTMpPjsvKiBEQ01JX0Q5ICovCj4+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBiaWFzLXB1bGwtdXA7Cj4+PiArwqDCoMKgwqDCoMKgwqAgfTsKPj4+ICvCoMKgwqAg
fTsKPj4+ICsKPj4+ICvCoMKgwqAgZGNtaV9zbGVlcF9waW5zX2I6IGRjbWktc2xlZXAtMSB7Cj4+
PiArwqDCoMKgwqDCoMKgwqAgcGlucyB7Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwaW5t
dXggPSA8U1RNMzJfUElOTVVYKCdBJywgNCzCoCBBTkFMT0cpPiwvKiBEQ01JX0hTWU5DICovCj4+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPFNUTTMyX1BJTk1VWCgnQicsIDcs
wqAgQU5BTE9HKT4sLyogRENNSV9WU1lOQyAqLwo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIDxTVE0zMl9QSU5NVVgoJ0EnLCA2LMKgIEFOQUxPRyk+LC8qIERDTUlfUElYQ0xL
ICovCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPFNUTTMyX1BJTk1VWCgn
QScsIDkswqAgQU5BTE9HKT4sLyogRENNSV9EMCAqLwo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIDxTVE0zMl9QSU5NVVgoJ0gnLCAxMCwgQU5BTE9HKT4sLyogRENNSV9EMSAq
Lwo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDxTVE0zMl9QSU5NVVgoJ0Un
LCAwLCBBTkFMT0cpPiwvKiBEQ01JX0QyICovCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgPFNUTTMyX1BJTk1VWCgnRScsIDEsIEFOQUxPRyk+LC8qIERDTUlfRDMgKi8KPj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA8U1RNMzJfUElOTVVYKCdIJywgMTQs
IEFOQUxPRyk+LC8qIERDTUlfRDQgKi8KPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCA8U1RNMzJfUElOTVVYKCdJJywgNCzCoCBBTkFMT0cpPiwvKiBEQ01JX0Q1ICovCj4+PiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPFNUTTMyX1BJTk1VWCgnSScsIDYswqAg
QU5BTE9HKT4sLyogRENNSV9ENiAqLwo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIDxTVE0zMl9QSU5NVVgoJ0UnLCA2LMKgIEFOQUxPRyk+LC8qIERDTUlfRDcgKi8KPj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA8U1RNMzJfUElOTVVYKCdJJywgMSzCoCBB
TkFMT0cpPiwvKiBEQ01JX0Q4ICovCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgPFNUTTMyX1BJTk1VWCgnSCcsIDcswqAgQU5BTE9HKT47LyogRENNSV9EOSAqLwo+Pj4gK8Kg
wqDCoMKgwqDCoMKgIH07Cj4+PiArwqDCoMKgIH07Cj4+PiArCj4+Cj4+IERlZmluZWQgYnV0IG5v
dCB1c2VkLiBEbyB5b3UgaGF2ZSBhbm90aGVyIHBhdGNoIGluIHBpcGUgPwo+IAo+IFllYWgsIGZv
ciBjYW1lcmEgb24gdGhlIEFWOTYsIGJ1dCB0aGF0IGRlcGVuZHMgb24gRENNSSBtZWRpYSBwYXRj
aGVzIHRvCj4gYmUgdXNhYmxlLiBTYW1lIGZvciB0aGUgUkNDIHBhdGNoZXMuCgpPayBzbyBJIHBy
ZWZlciB0byB3YWl0IGZvciBvdGhlciBEQ01JIHBhdGNoZXMgYmVmb3JlIG1lcmdpbmcgdGhvc2Ug
b25lcy4KClJlZ2FyZHMKQWxleAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
L21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
