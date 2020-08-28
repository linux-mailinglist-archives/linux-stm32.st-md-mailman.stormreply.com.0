Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B6C255EE0
	for <lists+linux-stm32@lfdr.de>; Fri, 28 Aug 2020 18:38:54 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 31F88C32E90;
	Fri, 28 Aug 2020 16:38:54 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D0BE6C36B26
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Aug 2020 16:38:52 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4BdQK80Lzmz1tBxY;
 Fri, 28 Aug 2020 18:38:52 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4BdQK76hbVz1qrFC;
 Fri, 28 Aug 2020 18:38:51 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id sRo9Hbbpf58U; Fri, 28 Aug 2020 18:38:50 +0200 (CEST)
X-Auth-Info: S/jB4D8ENMEpOWf39qV7ulJwTPdXYVw9B/HfPYxKW80=
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Fri, 28 Aug 2020 18:38:50 +0200 (CEST)
To: Alexandre Torgue <alexandre.torgue@st.com>,
 linux-arm-kernel@lists.infradead.org
References: <20200822203611.61997-1-marex@denx.de>
 <aaa9a92f-193c-9344-523b-fd5b7d7aaef2@st.com>
 <ab6d81d8-f276-ecd5-2f51-0bcecd47680f@denx.de>
 <d649ca40-4b07-20a2-49ee-00da585f32a8@st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <62edf905-4a1e-574b-3966-d9d1ee0bda5d@denx.de>
Date: Fri, 28 Aug 2020 18:38:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <d649ca40-4b07-20a2-49ee-00da585f32a8@st.com>
Content-Language: en-US
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gOC8yOC8yMCA1OjU2IFBNLCBBbGV4YW5kcmUgVG9yZ3VlIHdyb3RlOgo+IEhpLAoKSGksCgo+
IE9uIDgvMjgvMjAgMjo1MiBQTSwgTWFyZWsgVmFzdXQgd3JvdGU6Cj4+IE9uIDgvMjgvMjAgMjo0
NyBQTSwgQWxleGFuZHJlIFRvcmd1ZSB3cm90ZToKPj4+IEhpIE1hcmVrCj4+Cj4+IEhpLAo+Pgo+
PiBbLi4uXQo+Pgo+Pj4+ICvCoMKgwqDCoMKgwqDCoCBwaW5zIHsKPj4+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBwaW5tdXggPSA8U1RNMzJfUElOTVVYKCdBJywgNCzCoCBBRjEzKT4sLyogRENN
SV9IU1lOQyAqLwo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA8U1RNMzJf
UElOTVVYKCdCJywgNyzCoCBBRjEzKT4sLyogRENNSV9WU1lOQyAqLwo+Pj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA8U1RNMzJfUElOTVVYKCdBJywgNizCoCBBRjEzKT4sLyog
RENNSV9QSVhDTEsgKi8KPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPFNU
TTMyX1BJTk1VWCgnQScsIDkswqAgQUYxMyk+LC8qIERDTUlfRDAgKi8KPj4+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPFNUTTMyX1BJTk1VWCgnSCcsIDEwLCBBRjEzKT4sLyog
RENNSV9EMSAqLwo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA8U1RNMzJf
UElOTVVYKCdFJywgMCwgQUYxMyk+LC8qIERDTUlfRDIgKi8KPj4+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgPFNUTTMyX1BJTk1VWCgnRScsIDEsIEFGMTMpPiwvKiBEQ01JX0Qz
ICovCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDxTVE0zMl9QSU5NVVgo
J0gnLCAxNCwgQUYxMyk+LC8qIERDTUlfRDQgKi8KPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgPFNUTTMyX1BJTk1VWCgnSScsIDQswqAgQUYxMyk+LC8qIERDTUlfRDUgKi8K
Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPFNUTTMyX1BJTk1VWCgnSScs
IDYswqAgQUYxMyk+LC8qIERDTUlfRDYgKi8KPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgPFNUTTMyX1BJTk1VWCgnRScsIDYswqAgQUYxMyk+LC8qIERDTUlfRDcgKi8KPj4+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPFNUTTMyX1BJTk1VWCgnSScsIDEs
wqAgQUYxMyk+LC8qIERDTUlfRDggKi8KPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgPFNUTTMyX1BJTk1VWCgnSCcsIDcswqAgQUYxMyk+Oy8qIERDTUlfRDkgKi8KPj4+PiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBiaWFzLXB1bGwtdXA7Cj4+Pj4gK8KgwqDCoMKgwqDCoMKg
IH07Cj4+Pj4gK8KgwqDCoCB9Owo+Pj4+ICsKPj4+PiArwqDCoMKgIGRjbWlfc2xlZXBfcGluc19i
OiBkY21pLXNsZWVwLTEgewo+Pj4+ICvCoMKgwqDCoMKgwqDCoCBwaW5zIHsKPj4+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBwaW5tdXggPSA8U1RNMzJfUElOTVVYKCdBJywgNCzCoCBBTkFMT0cp
PiwvKiBEQ01JX0hTWU5DICovCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IDxTVE0zMl9QSU5NVVgoJ0InLCA3LMKgIEFOQUxPRyk+LC8qIERDTUlfVlNZTkMgKi8KPj4+PiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPFNUTTMyX1BJTk1VWCgnQScsIDYswqAg
QU5BTE9HKT4sLyogRENNSV9QSVhDTEsgKi8KPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgPFNUTTMyX1BJTk1VWCgnQScsIDkswqAgQU5BTE9HKT4sLyogRENNSV9EMCAqLwo+
Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA8U1RNMzJfUElOTVVYKCdIJywg
MTAsIEFOQUxPRyk+LC8qIERDTUlfRDEgKi8KPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgPFNUTTMyX1BJTk1VWCgnRScsIDAsIEFOQUxPRyk+LC8qIERDTUlfRDIgKi8KPj4+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPFNUTTMyX1BJTk1VWCgnRScsIDEs
IEFOQUxPRyk+LC8qIERDTUlfRDMgKi8KPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgPFNUTTMyX1BJTk1VWCgnSCcsIDE0LCBBTkFMT0cpPiwvKiBEQ01JX0Q0ICovCj4+Pj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDxTVE0zMl9QSU5NVVgoJ0knLCA0LMKg
IEFOQUxPRyk+LC8qIERDTUlfRDUgKi8KPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgPFNUTTMyX1BJTk1VWCgnSScsIDYswqAgQU5BTE9HKT4sLyogRENNSV9ENiAqLwo+Pj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA8U1RNMzJfUElOTVVYKCdFJywgNizC
oCBBTkFMT0cpPiwvKiBEQ01JX0Q3ICovCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIDxTVE0zMl9QSU5NVVgoJ0knLCAxLMKgIEFOQUxPRyk+LC8qIERDTUlfRDggKi8KPj4+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPFNUTTMyX1BJTk1VWCgnSCcsIDcs
wqAgQU5BTE9HKT47LyogRENNSV9EOSAqLwo+Pj4+ICvCoMKgwqDCoMKgwqDCoCB9Owo+Pj4+ICvC
oMKgwqAgfTsKPj4+PiArCj4+Pgo+Pj4gRGVmaW5lZCBidXQgbm90IHVzZWQuIERvIHlvdSBoYXZl
IGFub3RoZXIgcGF0Y2ggaW4gcGlwZSA/Cj4+Cj4+IFllYWgsIGZvciBjYW1lcmEgb24gdGhlIEFW
OTYsIGJ1dCB0aGF0IGRlcGVuZHMgb24gRENNSSBtZWRpYSBwYXRjaGVzIHRvCj4+IGJlIHVzYWJs
ZS4gU2FtZSBmb3IgdGhlIFJDQyBwYXRjaGVzLgo+IAo+IE9rIHNvIEkgcHJlZmVyIHRvIHdhaXQg
Zm9yIG90aGVyIERDTUkgcGF0Y2hlcyBiZWZvcmUgbWVyZ2luZyB0aG9zZSBvbmVzLgoKRmluZSBi
eSBtZS4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtc3RtMzIK
