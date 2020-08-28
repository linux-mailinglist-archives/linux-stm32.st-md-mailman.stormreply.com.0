Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D62255AA0
	for <lists+linux-stm32@lfdr.de>; Fri, 28 Aug 2020 14:52:44 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3FD97C32E90;
	Fri, 28 Aug 2020 12:52:44 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0D9A0C36B26
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Aug 2020 12:52:42 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4BdKJ94JgKz1rvyB;
 Fri, 28 Aug 2020 14:52:41 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4BdKJ93T9Hz1qv2k;
 Fri, 28 Aug 2020 14:52:41 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id gaODh6hqLO84; Fri, 28 Aug 2020 14:52:40 +0200 (CEST)
X-Auth-Info: pjdaHZRsXGUZmUFJk5JZC2uGH+GsbeOmuxKiGMm5x2E=
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Fri, 28 Aug 2020 14:52:40 +0200 (CEST)
To: Alexandre Torgue <alexandre.torgue@st.com>,
 linux-arm-kernel@lists.infradead.org
References: <20200822203611.61997-1-marex@denx.de>
 <aaa9a92f-193c-9344-523b-fd5b7d7aaef2@st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <ab6d81d8-f276-ecd5-2f51-0bcecd47680f@denx.de>
Date: Fri, 28 Aug 2020 14:52:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <aaa9a92f-193c-9344-523b-fd5b7d7aaef2@st.com>
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

T24gOC8yOC8yMCAyOjQ3IFBNLCBBbGV4YW5kcmUgVG9yZ3VlIHdyb3RlOgo+IEhpIE1hcmVrCgpI
aSwKClsuLi5dCgo+PiArwqDCoMKgwqDCoMKgwqAgcGlucyB7Cj4+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHBpbm11eCA9IDxTVE0zMl9QSU5NVVgoJ0EnLCA0LMKgIEFGMTMpPiwvKiBEQ01JX0hT
WU5DICovCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA8U1RNMzJfUElOTVVY
KCdCJywgNyzCoCBBRjEzKT4sLyogRENNSV9WU1lOQyAqLwo+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgPFNUTTMyX1BJTk1VWCgnQScsIDYswqAgQUYxMyk+LC8qIERDTUlfUElY
Q0xLICovCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA8U1RNMzJfUElOTVVY
KCdBJywgOSzCoCBBRjEzKT4sLyogRENNSV9EMCAqLwo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgPFNUTTMyX1BJTk1VWCgnSCcsIDEwLCBBRjEzKT4sLyogRENNSV9EMSAqLwo+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPFNUTTMyX1BJTk1VWCgnRScsIDAs
IEFGMTMpPiwvKiBEQ01JX0QyICovCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCA8U1RNMzJfUElOTVVYKCdFJywgMSwgQUYxMyk+LC8qIERDTUlfRDMgKi8KPj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDxTVE0zMl9QSU5NVVgoJ0gnLCAxNCwgQUYxMyk+LC8q
IERDTUlfRDQgKi8KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDxTVE0zMl9Q
SU5NVVgoJ0knLCA0LMKgIEFGMTMpPiwvKiBEQ01JX0Q1ICovCj4+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCA8U1RNMzJfUElOTVVYKCdJJywgNizCoCBBRjEzKT4sLyogRENNSV9E
NiAqLwo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPFNUTTMyX1BJTk1VWCgn
RScsIDYswqAgQUYxMyk+LC8qIERDTUlfRDcgKi8KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIDxTVE0zMl9QSU5NVVgoJ0knLCAxLMKgIEFGMTMpPiwvKiBEQ01JX0Q4ICovCj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA8U1RNMzJfUElOTVVYKCdIJywgNyzC
oCBBRjEzKT47LyogRENNSV9EOSAqLwo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBiaWFzLXB1
bGwtdXA7Cj4+ICvCoMKgwqDCoMKgwqDCoCB9Owo+PiArwqDCoMKgIH07Cj4+ICsKPj4gK8KgwqDC
oCBkY21pX3NsZWVwX3BpbnNfYjogZGNtaS1zbGVlcC0xIHsKPj4gK8KgwqDCoMKgwqDCoMKgIHBp
bnMgewo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwaW5tdXggPSA8U1RNMzJfUElOTVVYKCdB
JywgNCzCoCBBTkFMT0cpPiwvKiBEQ01JX0hTWU5DICovCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCA8U1RNMzJfUElOTVVYKCdCJywgNyzCoCBBTkFMT0cpPiwvKiBEQ01JX1ZT
WU5DICovCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA8U1RNMzJfUElOTVVY
KCdBJywgNizCoCBBTkFMT0cpPiwvKiBEQ01JX1BJWENMSyAqLwo+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgPFNUTTMyX1BJTk1VWCgnQScsIDkswqAgQU5BTE9HKT4sLyogRENN
SV9EMCAqLwo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPFNUTTMyX1BJTk1V
WCgnSCcsIDEwLCBBTkFMT0cpPiwvKiBEQ01JX0QxICovCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCA8U1RNMzJfUElOTVVYKCdFJywgMCwgQU5BTE9HKT4sLyogRENNSV9EMiAq
Lwo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPFNUTTMyX1BJTk1VWCgnRScs
IDEsIEFOQUxPRyk+LC8qIERDTUlfRDMgKi8KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIDxTVE0zMl9QSU5NVVgoJ0gnLCAxNCwgQU5BTE9HKT4sLyogRENNSV9ENCAqLwo+PiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPFNUTTMyX1BJTk1VWCgnSScsIDQswqAg
QU5BTE9HKT4sLyogRENNSV9ENSAqLwo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgPFNUTTMyX1BJTk1VWCgnSScsIDYswqAgQU5BTE9HKT4sLyogRENNSV9ENiAqLwo+PiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPFNUTTMyX1BJTk1VWCgnRScsIDYswqAgQU5B
TE9HKT4sLyogRENNSV9ENyAqLwo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
PFNUTTMyX1BJTk1VWCgnSScsIDEswqAgQU5BTE9HKT4sLyogRENNSV9EOCAqLwo+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPFNUTTMyX1BJTk1VWCgnSCcsIDcswqAgQU5BTE9H
KT47LyogRENNSV9EOSAqLwo+PiArwqDCoMKgwqDCoMKgwqAgfTsKPj4gK8KgwqDCoCB9Owo+PiAr
Cj4gCj4gRGVmaW5lZCBidXQgbm90IHVzZWQuIERvIHlvdSBoYXZlIGFub3RoZXIgcGF0Y2ggaW4g
cGlwZSA/CgpZZWFoLCBmb3IgY2FtZXJhIG9uIHRoZSBBVjk2LCBidXQgdGhhdCBkZXBlbmRzIG9u
IERDTUkgbWVkaWEgcGF0Y2hlcyB0bwpiZSB1c2FibGUuIFNhbWUgZm9yIHRoZSBSQ0MgcGF0Y2hl
cy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
c3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8v
bGludXgtc3RtMzIK
