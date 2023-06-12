Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FEAA72B8B1
	for <lists+linux-stm32@lfdr.de>; Mon, 12 Jun 2023 09:36:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 29A01C6A60F;
	Mon, 12 Jun 2023 07:36:13 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A340DC06F81
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Jun 2023 07:36:12 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35C1Ksgi010128; Mon, 12 Jun 2023 09:35:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=opv3kX/ph4BOOfru46Fxfd30UvHEy9/IFAiCrxHELPs=;
 b=xeCAtb+HSOplkuvGUk2p1b2verNsEL46d+xjVg+BPe4glBbyCPue57Skz4XQd9wr9NDM
 DT/ljCLasrv8aOw/Ufd+DcuJ/eI8r0/as61jAtyTdOcV8rBKfP+dVPS+lboGZkMfEHt9
 5NhesBE7HWJbacAM16Pb4Kby+zerJxbCST7N2wE3biIVaVE4Kei4X4P9R0Pw5r0RxjDX
 pzJmptNNH5G5j5Mn112VXde725iW0m1AvsGDkwuEbGEmRKYacJlzhp8hIhdcAQT6yiLy
 C15ZP2fzWbua5yNrWtUYO2br64U5I1NlM3RIqan8Ks/59vJpGcXSEwjk/dq8U0B+5tde kw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3r5smd1ps3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Jun 2023 09:35:48 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2957810002A;
 Mon, 12 Jun 2023 09:35:47 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1B557216835;
 Mon, 12 Jun 2023 09:35:47 +0200 (CEST)
Received: from [10.201.21.93] (10.201.21.93) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Mon, 12 Jun
 2023 09:35:46 +0200
Message-ID: <3580b822-1d6e-91af-3f5b-f076a8aaddf1@foss.st.com>
Date: Mon, 12 Jun 2023 09:35:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
References: <20230607063139.621351-1-dario.binacchi@amarulasolutions.com>
 <20230607063139.621351-3-dario.binacchi@amarulasolutions.com>
 <7139fb21-6a1d-a26f-fef3-d3154d234ca2@foss.st.com>
 <CABGWkvoRZqQsEmpNRhhrRUrf+WHebErPO9Jt2L9bsNL_EKeoHg@mail.gmail.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <CABGWkvoRZqQsEmpNRhhrRUrf+WHebErPO9Jt2L9bsNL_EKeoHg@mail.gmail.com>
X-Originating-IP: [10.201.21.93]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-12_04,2023-06-09_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 michael@amarulasolutions.com,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [RESEND PATCH v2 2/6] ARM: dts: stm32: add pin
 map for LTDC on stm32f7
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

aGkgRGFyaW8KCk9uIDYvOS8yMyAwODoyMSwgRGFyaW8gQmluYWNjaGkgd3JvdGU6Cj4gSGkgQWxl
eGFuZHJlLAo+IAo+IE9uIFRodSwgSnVuIDgsIDIwMjMgYXQgMjo0MuKAr1BNIEFsZXhhbmRyZSBU
T1JHVUUKPiA8YWxleGFuZHJlLnRvcmd1ZUBmb3NzLnN0LmNvbT4gd3JvdGU6Cj4+Cj4+IEhpIERh
cmlvCj4+Cj4+IE9uIDYvNy8yMyAwODozMSwgRGFyaW8gQmluYWNjaGkgd3JvdGU6Cj4+PiBBZGQg
cGluIGNvbmZpZ3VyYXRpb25zIGZvciB1c2luZyBMVERDIChMQ0QtdGZ0IERpc3BsYXkgQ29udHJv
bGxlcikgb24KPj4+IHN0bTMyZjc0Ni1kaXNjbyBib2FyZC4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5
OiBEYXJpbyBCaW5hY2NoaSA8ZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20+Cj4+
PiAtLS0KPj4+Cj4+PiAobm8gY2hhbmdlcyBzaW5jZSB2MSkKPj4+Cj4+PiAgICBhcmNoL2FybS9i
b290L2R0cy9zdG0zMmY3LXBpbmN0cmwuZHRzaSB8IDM1ICsrKysrKysrKysrKysrKysrKysrKysr
KysrCj4+PiAgICAxIGZpbGUgY2hhbmdlZCwgMzUgaW5zZXJ0aW9ucygrKQo+Pj4KPj4+IGRpZmYg
LS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9zdG0zMmY3LXBpbmN0cmwuZHRzaSBiL2FyY2gvYXJt
L2Jvb3QvZHRzL3N0bTMyZjctcGluY3RybC5kdHNpCj4+PiBpbmRleCA5ZjY1NDAzMjk1Y2EuLmYz
ZjkwYjliY2Q2MSAxMDA2NDQKPj4+IC0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMyZjctcGlu
Y3RybC5kdHNpCj4+PiArKysgYi9hcmNoL2FybS9ib290L2R0cy9zdG0zMmY3LXBpbmN0cmwuZHRz
aQo+Pj4gQEAgLTM2NSw2ICszNjUsNDEgQEAgcGluczIgewo+Pj4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgYmlhcy1wdWxsLXVwOwo+Pj4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIH07Cj4+PiAgICAgICAgICAgICAgICAgICAgICAgIH07Cj4+PiArCj4+PiAr
Cj4+PiArICAgICAgICAgICAgICAgICAgICAgbHRkY19waW5zX2E6IGx0ZGMtcGlucy1hLTAgewo+
Pgo+PiAgICBsdGRjLXBpbnMtYS0wIC0tPiAgbHRkYy1waW5zLTAgaXMgYSBiaXQgY2xlYW5lci4g
SSBrbm93IHRoYXQgSSBoYXZlIHRvCj4+IGZpeCBzZGlvIHBpbnMgbm9kZXMgaW4gdGhpcyBmaWxl
IHRvIGtlZXAgdGhlIHNhbWUgc3Bpcml0IGZvciBhbGwgZ3JvdXAKPj4gbmFtZXMuCj4gCj4gSSBo
YXZlIGxvb2tlZCBhdCB0aGUgZmlsZSBhcmNoL2FybS9ib290L2R0cy9zdG0zMmY3LXBpbmN0cmwu
ZHRzaSwgYW5kCj4gYmFzZWQgb24gdGhlIGZvbGxvd2luZyBub2RlczoKPiB1c2FydDFfcGluc19h
OiB1c2FydDEtMAo+IGkyYzFfcGluc19iOiBpMmMxLTAKPiBjYW4xX3BpbnNfYTogY2FuMS0wCj4g
Cj4gSSBoYXZlIGRlY2lkZWQgdG8gcmVuYW1lIGx0ZGMtcGlucy1hLTAgdG8gbHRkYy0wLgo+IAo+
IEkgaG9wZSB5b3UgYWdyZWUuCgpZZXMhIHBlcmZlY3QuCgpBbGV4Cgo+IAo+IFRoYW5rcyBhbmQg
cmVnYXJkcywKPiAKPiBEYXJpbwo+IAo+Pgo+PiBJZiB0aGVyZSBpcyBubyBWMyBJIHdpbCBkbyBp
dCBkaXJlY3RseSB3aGVuIEknbGwgYXBwbHkgRFQgcGF0Y2hlcyBpZiB5b3UKPj4gYWdyZWUuCj4+
Cj4+IEFsZXgKPj4KPj4KPj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBpbnMgewo+
Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwaW5tdXggPSA8U1RNMzJf
UElOTVVYKCdFJywgNCwgQUYxNCk+LCAvKiBMQ0RfQjAgKi8KPj4+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPFNUTTMyX1BJTk1VWCgnRycsMTIsIEFGOSk+
LCAgLyogTENEX0I0ICovCj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIDxTVE0zMl9QSU5NVVgoJ0knLCA5LCBBRjE0KT4sIC8qIExDRF9WU1lOQyAqLwo+
Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8U1RNMzJf
UElOTVVYKCdJJywxMCwgQUYxNCk+LCAvKiBMQ0RfSFNZTkMgKi8KPj4+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPFNUTTMyX1BJTk1VWCgnSScsMTQsIEFG
MTQpPiwgLyogTENEX0NMSyAqLwo+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICA8U1RNMzJfUElOTVVYKCdJJywxNSwgQUYxNCk+LCAvKiBMQ0RfUjAgKi8K
Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPFNUTTMy
X1BJTk1VWCgnSicsIDAsIEFGMTQpPiwgLyogTENEX1IxICovCj4+PiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxTVE0zMl9QSU5NVVgoJ0onLCAxLCBBRjE0
KT4sIC8qIExDRF9SMiAqLwo+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICA8U1RNMzJfUElOTVVYKCdKJywgMiwgQUYxNCk+LCAvKiBMQ0RfUjMgKi8KPj4+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPFNUTTMyX1BJ
Tk1VWCgnSicsIDMsIEFGMTQpPiwgLyogTENEX1I0ICovCj4+PiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIDxTVE0zMl9QSU5NVVgoJ0onLCA0LCBBRjE0KT4s
IC8qIExDRF9SNSAqLwo+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICA8U1RNMzJfUElOTVVYKCdKJywgNSwgQUYxNCk+LCAvKiBMQ0RfUjYgKi8KPj4+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPFNUTTMyX1BJTk1V
WCgnSicsIDYsIEFGMTQpPiwgLyogTENEX1I3ICovCj4+PiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIDxTVE0zMl9QSU5NVVgoJ0onLCA3LCBBRjE0KT4sIC8q
IExDRF9HMCAqLwo+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICA8U1RNMzJfUElOTVVYKCdKJywgOCwgQUYxNCk+LCAvKiBMQ0RfRzEgKi8KPj4+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPFNUTTMyX1BJTk1VWCgn
SicsIDksIEFGMTQpPiwgLyogTENEX0cyICovCj4+PiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIDxTVE0zMl9QSU5NVVgoJ0onLDEwLCBBRjE0KT4sIC8qIExD
RF9HMyAqLwo+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICA8U1RNMzJfUElOTVVYKCdKJywxMSwgQUYxNCk+LCAvKiBMQ0RfRzQgKi8KPj4+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPFNUTTMyX1BJTk1VWCgnSics
MTMsIEFGMTQpPiwgLyogTENEX0IxICovCj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIDxTVE0zMl9QSU5NVVgoJ0onLDE0LCBBRjE0KT4sIC8qIExDRF9C
MiAqLwo+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8
U1RNMzJfUElOTVVYKCdKJywxNSwgQUYxNCk+LCAvKiBMQ0RfQjMgKi8KPj4+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPFNUTTMyX1BJTk1VWCgnSycsIDAs
IEFGMTQpPiwgLyogTENEX0c1ICovCj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIDxTVE0zMl9QSU5NVVgoJ0snLCAxLCBBRjE0KT4sIC8qIExDRF9HNiAq
Lwo+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8U1RN
MzJfUElOTVVYKCdLJywgMiwgQUYxNCk+LCAvKiBMQ0RfRzcgKi8KPj4+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPFNUTTMyX1BJTk1VWCgnSycsIDQsIEFG
MTQpPiwgLyogTENEX0I1ICovCj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIDxTVE0zMl9QSU5NVVgoJ0snLCA1LCBBRjE0KT4sIC8qIExDRF9CNiAqLwo+
Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8U1RNMzJf
UElOTVVYKCdLJywgNiwgQUYxNCk+LCAvKiBMQ0RfQjcgKi8KPj4+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPFNUTTMyX1BJTk1VWCgnSycsIDcsIEFGMTQp
PjsgLyogTENEX0RFICovCj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHNsZXctcmF0ZSA9IDwyPjsKPj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIH07Cj4+
PiArICAgICAgICAgICAgICAgICAgICAgfTsKPj4+ICAgICAgICAgICAgICAgIH07Cj4+PiAgICAg
ICAgfTsKPj4+ICAgIH07Cj4+Cj4gCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
