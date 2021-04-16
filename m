Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F2F3619F8
	for <lists+linux-stm32@lfdr.de>; Fri, 16 Apr 2021 08:44:41 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DFA3AC57B78;
	Fri, 16 Apr 2021 06:44:40 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EC533C36B25
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 16 Apr 2021 06:44:38 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13G6Un5R011986; Fri, 16 Apr 2021 08:44:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=FvMeBX596NIdXPa0F+obOEjYGkVgzPgUCaQLWURxgsw=;
 b=ZozWyeQTjkFh/Iwv4ha7v7UjN6OCndCD+Dk/0xuFrJUuIH9RoFvOCIJf+XpzX5Wxaqr0
 1IVVLqYoRkxLyXzZNNTNcuwhuYEKCrHBNHQLvs69YbbCnF8F6lwqiD6G0DaTQ7LiSi71
 vDiD9JZeYTrlXDyRAP359Iv/3qSlTOvGTBGPCRIkfFDqwSN3zsXG1vp+ZOUFpqrP02u8
 aOi6q4jXA8Ecyeqq2Z6esKI9zhhgcf62vB9uzKzVt92YTWRRbEk7kbq0vg+NYG3xpwEs
 JNpI6RFeAi3JmU0WYxkdcFhqBg+5ERGL9UD2d8N79CESLDe2TrR4YpE9nSTLvS3TgcJ/ JQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 37xes0yv79-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Apr 2021 08:44:27 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9501810002A;
 Fri, 16 Apr 2021 08:44:26 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 86CFA21969E;
 Fri, 16 Apr 2021 08:44:26 +0200 (CEST)
Received: from lmecxl0572.lme.st.com (10.75.127.47) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 16 Apr
 2021 08:44:25 +0200
To: Marek Vasut <marex@denx.de>, <linux-arm-kernel@lists.infradead.org>
References: <20210408185731.135511-1-marex@denx.de>
 <20210408185731.135511-2-marex@denx.de>
 <2b10f5d9-54cb-ce83-b7aa-f4ec8e67c001@foss.st.com>
 <92dd5798-8f5a-66e4-06bc-e3beb16690f5@denx.de>
From: "gabriel.fernandez@foss.st.com" <gabriel.fernandez@foss.st.com>
Message-ID: <d168aed8-aebd-1bee-aa72-3a3601718cad@foss.st.com>
Date: Fri, 16 Apr 2021 08:44:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <92dd5798-8f5a-66e4-06bc-e3beb16690f5@denx.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG3NODE1.st.com (10.75.127.7) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-15_11:2021-04-15,
 2021-04-15 signatures=0
Cc: linux-stm32@st-md-mailman.stormreply.com, linux-clk@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Stephen Boyd <swboyd@chromium.org>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Christophe Roullier <christophe.roullier@foss.st.com>
Subject: Re: [Linux-stm32] [PATCH 1/7] clk: stm32mp1: Split ETHCK_K into
 separate MUX and GATE clock
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

SGkgTWFyZWsKCk9uIDQvMTQvMjEgNDowNCBQTSwgTWFyZWsgVmFzdXQgd3JvdGU6Cj4gT24gNC8x
NC8yMSAzOjAzIFBNLCBnYWJyaWVsLmZlcm5hbmRlekBmb3NzLnN0LmNvbSB3cm90ZToKPj4gSGkg
TWFyZWssCj4gCj4gSGVsbG8gR2FicmllbCwKPiAKPj4gVGhhbmtzIGZvciB0aGUgcGF0Y2hzZXQK
Pj4KPj4gT24gNC84LzIxIDg6NTcgUE0sIE1hcmVrIFZhc3V0IHdyb3RlOgo+Pj4gVGhlIEVUSENL
X0sgYXJlIG1vZGVsZWQgYXMgY29tcG9zaXRlIGNsb2NrIG9mIE1VWCBhbmQgR0FURSwgaG93ZXZl
ciBwZXIKPj4+IFNUTTMyTVAxIFJlZmVyZW5jZSBNYW51YWwgUk0wNDM2IFJldiAzLCBQYWdlIDU3
NCwgRmlndXJlIDgzLiBQZXJpcGhlcmFsCj4+PiBjbG9jayBkaXN0cmlidXRpb24gZm9yIEV0aGVy
bmV0LCBFVEhQVFBESVYgZGl2aWRlciBpcyBhdHRhY2hlZCBwYXN0IHRoZQo+Pj4gRVRIQ0tfSyBt
dXgsIGFuZCBFVEhfQ0xLL2V0aF9jbGtfZmIgY2xvY2sgYXJlIG91dHB1dCBwYXN0IEVUSENLRU4g
Z2F0ZS4KPj4+IFRoZXJlZm9yZSwgaW4gY2FzZSBFVEhfQ0xLL2V0aF9jbGtfZmIgYXJlIG5vdCBp
biB1c2UgQU5EIFBUUCBjbG9jayBhcmUKPj4+IGluIHVzZSwgRVRIQ0tFTiBnYXRlIGNhbiBiZSB0
dXJuZWQgb2ZmLiBDdXJyZW50IGRyaXZlciBkb2VzIG5vdCBwZXJtaXQKPj4+IHRoYXQsIGZpeCBp
dC4KPj4KPj4gSSBkb24idCB1bmRlcnN0YW5kLCBpdCdzIGFscmVhZHkgdGhlIGNhc2UuCj4+Cj4+
IEVUSENLX0sgaXQncyBhIGNvbXBvc2l0ZSB3aXRoIGEgTVVYIGFuZCBhIEdBVEUuCj4gCj4gQnV0
IEVUSENLX0sgaXMgX25vdF8gYSBjb21wb3NpdGUgY2xvY2ssIGxvb2sgYXQgdGhlIEZpZ3VyZSA4
MyBpbiB0aGUgCj4gZGF0YXNoZWV0IGFnYWluIGFuZCBzY2hlbWF0aWMgYmVsb3cuCj4gCj4+IEVU
SFBUUF9LIChFVEhQVFBESVYpIGl0J3MgYSBjb21wb3NpdGUgd2l0aCB0aGUgc2FtZSBNVVggYW5k
IGEgRElWIChubyAKPj4gZ2F0ZSkKPiAKPiBCdXQgRVRIUFRQX0sgc2hvdWxkbid0IGNvbnRyb2wg
YW55IG11eCwgaXQgaXMgb25seSBhIGRpdmlkZXIuCj4gCj4+IElmIHlvdSB1c2Ugb25seSBFVEhQ
VFBESVYswqAgRVRIQ0tFTiBnYXRlIGNhbiBiZSB0dXJuZWQgb2ZmLgo+IAo+IExvb2ssIHRoaXMg
aXMgd2hhdCB5b3UgaGF2ZSB0b2RheToKPiAKPiAgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLi0tLS0t
LS0tLS0tLSBFVEhDS19LIC0tLS0tLS0tLS0tLgo+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8X19f
X19fX8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgX19fX19fX8KgwqAgfAo+IHBsbDRfcF9j
ay0tfE1fRVRIQ0tcwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHxHX0VUSENLXMKgIHwKPiAgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgfCBNVVjCoMKgwqAgfC0tLS0tLSstLS0tLXwgR0FURcKgwqAgfC0t
LS0tLS0tLS0tLS1beF0gRVRIX0NMSwo+IHBsbDNfcV9jay0tfF9fX19fX18vwqDCoMKgwqDCoMKg
IHzCoMKgwqDCoCB8X19fX19fXy/CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGV0
aF9jbGtfZmIKPiAgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgfAo+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCAnLS0oRVRIQ0tTRUxSWzc6NF0gZGl2aWRlciktLVt4XSBjbGtfcHRwX3JlZgo+ICDCoMKg
wqDCoMKgwqDCoMKgwqDCoCB8wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8Cj4gIMKgwqDCoMKg
wqDCoMKgwqDCoMKgICctLS0tLS0tLS0tLS0gRVRIUFRQX0sgLS0tLS0tLS0tLS0tLS0tLS0tLS0n
Cj4gCj4gQW5kIHRoaXMgaXMgd2hhdCB5b3Ugc2hvdWxkIGhhdmUsIHRvIGF2b2lkIGhhdmluZyB0
d28gY29tcG9zaXRlIGNsb2NrIAo+IHdoaWNoIGNvbnRyb2wgdGhlIHNhbWUgbXV4IHVzaW5nIHRo
ZSBzYW1lIHJlZ2lzdGVyIGJpdCwgaS5lLiB3aGF0IHRoaXMgCj4gcGF0Y2ggaW1wbGVtZW50czoK
PiAKPiAgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLi0gY2tfa2VyX2V0aCAtLsKgIC4tLS0gRVRIQ0tf
SyAtLS4KPiAgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfF9fX19fX1/CoMKgwqDCoMKgwqAgfMKgIHzC
oMKgwqAgX19fX19fX8KgwqAgfAo+IHBsbDRfcF9jay0tfE1fRVRIQ0tcwqDCoMKgwqDCoCB8wqAg
fMKgwqAgfEdfRVRIQ0tcwqAgfAo+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IE1VWMKgwqDCoCB8
LS0tLS0tKy0tLS0tfCBHQVRFwqDCoCB8LS0tLS0tLS0tLS0tLVt4XSBFVEhfQ0xLCj4gcGxsM19x
X2NrLS18X19fX19fXy/CoMKgwqDCoMKgwqAgfMKgwqDCoMKgIHxfX19fX19fL8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZXRoX2Nsa19mYgo+ICDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwKPiAgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAnLS0oRVRIQ0tTRUxSWzc6NF0gZGl2
aWRlciktLVt4XSBjbGtfcHRwX3JlZgo+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCB8Cj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCAnLS0tLSBFVEhQVFBfSyAtLS0tLS0tLS0tLScKPiAKClRoZXNl
IDIgc29sdXRpb25zIGFyZSB2YWxpZC4gSSBtYWRlIHRoZSBjaG9pY2UgdG8gaW1wbGVtZW50IHRo
ZSBmaXJzdCAKb25lIHRvIGJlIGFibGUgdG8gY2hhbmdlIHBhcmVudCB3aXRoIHRoZSBrZXJuZWwg
Y2xvY2sgb2YgdGhlIElQIChubyBuZWVkIAp0byBhZGQgYW4gaW50ZXJtZWRpYXRlIGJpbmRpbmcp
LiBJdCdzIHRoZSBzYW1lIHByaW5jaXBsZSBmb3IgYWxsIGtlcm5lbCAKb2YgdGhpcyBzb2MuCkkg
Y2FuIGFzayB0byBBbGV4YW5kcmUgdG8gY29tZWJhY2sgb2YgdGhpcyBwcmluY2lwbGUsIGJ1dCBp
ICdtIG5vdCAKZmF2b3JhYmxlLgoKPj4+IFRoaXMgcGF0Y2ggY29udmVydHMgRVRIQ0tfSyBmcm9t
IGNvbXBvc2l0ZSBjbG9jayBpbnRvIGEgRVRIQ0tFTiBnYXRlLAo+Pj4gRVRIUFRQX0sgZnJvbSBj
b21wb3NpdGUgY2xvY2sgaW50byBFVEhQVFBESVYgZGl2aWRlciwgYW5kIGFkZHMgYW5vdGhlcgo+
Pj4gTk9fSUQgY2xvY2sgImNrX2tlcl9ldGgiIHdoaWNoIG1vZGVscyB0aGUgRVRIU1JDIG11eCBh
bmQgaXMgcGFyZW50IGNsb2NrCj4+PiB0byBib3RoIEVUSENLX0sgYW5kIEVUSFBUUF9LLiBUaGVy
ZWZvcmUsIGFsbCByZWZlcmVuY2VzIHRvIEVUSENLX0sgYW5kCj4+PiBFVEhQVFBfSyByZW1haW4g
ZnVuY3Rpb25hbCBhcyBiZWZvcmUuCj4+Pgo+Pj4gWzFdIFNUTTMyTVAxIFJlZmVyZW5jZSBNYW51
YWwgUk0wNDM2IFJldiAzLCBQYWdlIDU3NCwKPj4+IMKgwqDCoMKgIEZpZ3VyZSA4My4gUGVyaXBo
ZXJhbCBjbG9jayBkaXN0cmlidXRpb24gZm9yIEV0aGVybmV0Cj4+PiBodHRwczovL3d3dy5zdC5j
b20vcmVzb3VyY2UvZW4vcmVmZXJlbmNlX21hbnVhbC9kbTAwMzI3NjU5LXN0bTMybXAxNTctYWR2
YW5jZWQtYXJtYmFzZWQtMzJiaXQtbXB1cy1zdG1pY3JvZWxlY3Ryb25pY3MucGRmIAo+Pj4KPiAK
PiBbLi4uXQo+IAo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xrL2Nsay1zdG0zMm1wMS5jIGIv
ZHJpdmVycy9jbGsvY2xrLXN0bTMybXAxLmMKPj4+IGluZGV4IGE4NzU2NDlkZjhiOC4uYTdjN2Y1
NDRlZTVkIDEwMDY0NAo+Pj4gLS0tIGEvZHJpdmVycy9jbGsvY2xrLXN0bTMybXAxLmMKPj4+ICsr
KyBiL2RyaXZlcnMvY2xrL2Nsay1zdG0zMm1wMS5jCj4+PiBAQCAtMTk0OSw3ICsxOTQ5LDYgQEAg
c3RhdGljIGNvbnN0IHN0cnVjdCBjbG9ja19jb25maWcgCj4+PiBzdG0zMm1wMV9jbG9ja19jZmdb
XSA9IHsKPj4+IMKgwqDCoMKgwqAgS0NMSyhEU0lfSywgImRzaV9rIiwgZHNpX3NyYywgMCwgR19E
U0ksIE1fRFNJKSwKPj4+IMKgwqDCoMKgwqAgS0NMSyhBREZTRE1fSywgImFkZnNkbV9rIiwgc2Fp
X3NyYywgMCwgR19BREZTRE0sIE1fU0FJMSksCj4+PiDCoMKgwqDCoMKgIEtDTEsoVVNCT19LLCAi
dXNib19rIiwgdXNib19zcmMsIDAsIEdfVVNCTywgTV9VU0JPKSwKPj4+IC3CoMKgwqAgS0NMSyhF
VEhDS19LLCAiZXRoY2tfayIsIGV0aF9zcmMsIDAsIEdfRVRIQ0ssIE1fRVRIQ0spLAo+Pj4gwqDC
oMKgwqDCoCAvKiBQYXJ0aWN1bGFyeSBLZXJuZWwgQ2xvY2tzIChubyBtdXggb3Igbm8gZ2F0ZSkg
Ki8KPj4+IMKgwqDCoMKgwqAgTUdBVEVfTVAxKERGU0RNX0ssICJkZnNkbV9rIiwgImNrX21jdSIs
IDAsIEdfREZTRE0pLAo+Pj4gQEAgLTE5NTgsMTEgKzE5NTcsMTYgQEAgc3RhdGljIGNvbnN0IHN0
cnVjdCBjbG9ja19jb25maWcgCj4+PiBzdG0zMm1wMV9jbG9ja19jZmdbXSA9IHsKPj4+IMKgwqDC
oMKgwqAgTUdBVEVfTVAxKEdQVV9LLCAiZ3B1X2siLCAicGxsMl9xIiwgMCwgR19HUFUpLAo+Pj4g
wqDCoMKgwqDCoCBNR0FURV9NUDEoREFDMTJfSywgImRhYzEyX2siLCAiY2tfbHNpIiwgMCwgR19E
QUMxMiksCj4+PiAtwqDCoMKgIENPTVBPU0lURShFVEhQVFBfSywgImV0aHB0cF9rIiwgZXRoX3Ny
YywgQ0xLX09QU19QQVJFTlRfRU5BQkxFIHwKPj4+ICvCoMKgwqAgQ09NUE9TSVRFKE5PX0lELCAi
Y2tfa2VyX2V0aCIsIGV0aF9zcmMsIENMS19PUFNfUEFSRU5UX0VOQUJMRSB8Cj4+PiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIENMS19TRVRfUkFURV9OT19SRVBBUkVOVCwKPj4+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgX05PX0dBVEUsCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIF9NTVVYKE1f
RVRIQ0spLAo+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoCBfRElWKFJDQ19FVEhDS1NFTFIsIDQsIDQs
IDAsIE5VTEwpKSwKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqAgX05PX0RJViksCj4+PiArCj4+PiAr
wqDCoMKgIE1HQVRFX01QMShFVEhDS19LLCAiZXRoY2tfayIsICJja19rZXJfZXRoIiwgMCwgR19F
VEhDSyksCj4+IGFzc2lnbmVkIHBhcmVudCB3aXRoIEVUSENLX0sgd2lsbCBub3Qgd29yawo+Pj4g
Kwo+Pj4gK8KgwqDCoCBESVYoRVRIUFRQX0ssICJldGhwdHBfayIsICJja19rZXJfZXRoIiwgQ0xL
X09QU19QQVJFTlRfRU5BQkxFIHwKPj4KPj4gQ0xLX09QU19QQVJFTlRfRU5BQkxFIGZsYWdzIG5v
dCB1c2VmdWwgd2l0aCBhIGRpdmlkZXIuCj4gCj4gSG93IHNvID8KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0Ckxp
bnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
