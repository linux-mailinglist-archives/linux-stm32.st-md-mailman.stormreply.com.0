Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 22FBC7157C5
	for <lists+linux-stm32@lfdr.de>; Tue, 30 May 2023 10:00:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B7191C6A616;
	Tue, 30 May 2023 08:00:22 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9259FC6A608
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 May 2023 08:00:21 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34U3trF5017624; Tue, 30 May 2023 10:00:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=F6s3aD3XjXvai6aASf5oktFqcXSWfCYGDRUtEZKcHTU=;
 b=JiwR7fSL+Spg+EPI/ayGRMDGZe+2f1u/NpUH/q7aXfsopV7ie2mDahW8OLSZ3v5vYIUI
 k8fOovmZEL+hbAyBQpA1pH9rWegcACyQ45cX2idDAWHxICeyJXug0XrbY1ZZsMfuSNgE
 TK9eAm2/lN4fmY56I5uhvL2/I5LZGBZtDJxlcjbpNs/t6DyRAeiWUJtDGf58LhpR9BLw
 3cZ7X69JRBDhP4c0pvWG/CZ/Syhip1f0ajVN4kmKUvSSB69G6J1VjfmD83JMnZJW46Lk
 sLcLvNCfAFrbjx16omnWL82R96MA8bkBRym024YLXWd08l26HzBDnvHPOtDbo6kUBhZd UA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3quahy634c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 May 2023 10:00:02 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D281B10002A;
 Tue, 30 May 2023 10:00:00 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C872C2138F6;
 Tue, 30 May 2023 10:00:00 +0200 (CEST)
Received: from [10.201.21.93] (10.201.21.93) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Tue, 30 May
 2023 10:00:00 +0200
Message-ID: <8a4f3112-54ed-e0c1-52ee-395a41255163@foss.st.com>
Date: Tue, 30 May 2023 09:59:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Olivier MOYSAN <olivier.moysan@foss.st.com>, Marek Vasut <marex@denx.de>, 
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
References: <20230524133918.1439516-1-olivier.moysan@foss.st.com>
 <20230524133918.1439516-8-olivier.moysan@foss.st.com>
 <cc7a0a1a-31bb-92f4-6365-5e0c4a4bc85c@denx.de>
 <5bb496d0-6dc1-6ba3-6126-6429037ecf5a@foss.st.com>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <5bb496d0-6dc1-6ba3-6126-6429037ecf5a@foss.st.com>
X-Originating-IP: [10.201.21.93]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-30_05,2023-05-29_02,2023-05-22_02
Cc: devicetree@vger.kernel.org, kernel@dh-electronics.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 7/8] ARM: dts: stm32: adopt generic iio
 bindings for adc channels on dhcor-drc
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

TWFyZWssIE9saXZpZXIKCk9uIDUvMjQvMjMgMTc6MzksIE9saXZpZXIgTU9ZU0FOIHdyb3RlOgo+
IEhpIE1hcmVrLAo+IAo+IE9uIDUvMjQvMjMgMTU6NTQsIE1hcmVrIFZhc3V0IHdyb3RlOgo+PiBP
biA1LzI0LzIzIDE1OjM5LCBPbGl2aWVyIE1veXNhbiB3cm90ZToKPj4+IFVzZSBTVE0zMiBBREMg
Z2VuZXJpYyBiaW5kaW5ncyBpbnN0ZWFkIG9mIGxlZ2FjeSBiaW5kaW5ncyBvbgo+Pj4gREhDT1Ig
RFJDIENvbXBhY3QgYm9hcmQuCj4+Pgo+Pj4gVGhlIFNUTTMyIEFEQyBzcGVjaWZpYyBiaW5kaW5n
IHRvIGRlY2xhcmUgY2hhbm5lbHMgaGFzIGJlZW4gZGVwcmVjYXRlZCwKPj4+IGhlbmNlIGFkb3B0
IHRoZSBnZW5lcmljIElJTyBjaGFubmVscyBiaW5kaW5ncywgaW5zdGVhZC4KPj4+IFRoZSBTVE0z
Mk1QMTUxIGRldmljZSB0cmVlIG5vdyBleHBvc2VzIGludGVybmFsIGNoYW5uZWxzIHVzaW5nIHRo
ZQo+Pj4gZ2VuZXJpYyBiaW5kaW5nLiBUaGlzIG1ha2VzIHRoZSBjaGFuZ2UgbWFuZGF0b3J5IGhl
cmUgdG8gYXZvaWQgYSBtaXhlZAo+Pj4gdXNlIG9mIGxlZ2FjeSBhbmQgZ2VuZXJpYyBiaW5kaW5n
LCB3aGljaCBpcyBub3Qgc3VwcG9ydGVkIGJ5IHRoZSBkcml2ZXIuCj4+Pgo+Pj4gU2lnbmVkLW9m
Zi1ieTogT2xpdmllciBNb3lzYW4gPG9saXZpZXIubW95c2FuQGZvc3Muc3QuY29tPgo+Pj4gLS0t
Cj4+PiDCoCAuLi4vZHRzL3N0bTMybXAxNXh4LWRoY29yLWRyYy1jb21wYWN0LmR0c2nCoMKgwqAg
fCAyOCArKysrKysrKysrKysrKysrLS0tCj4+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMjQgaW5zZXJ0
aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0vYm9v
dC9kdHMvc3RtMzJtcDE1eHgtZGhjb3ItZHJjLWNvbXBhY3QuZHRzaSAKPj4+IGIvYXJjaC9hcm0v
Ym9vdC9kdHMvc3RtMzJtcDE1eHgtZGhjb3ItZHJjLWNvbXBhY3QuZHRzaQo+Pj4gaW5kZXggMzlh
Zjc5ZGM2NTRjLi45MmQ5MDZiZmQ1ZDcgMTAwNjQ0Cj4+PiAtLS0gYS9hcmNoL2FybS9ib290L2R0
cy9zdG0zMm1wMTV4eC1kaGNvci1kcmMtY29tcGFjdC5kdHNpCj4+PiArKysgYi9hcmNoL2FybS9i
b290L2R0cy9zdG0zMm1wMTV4eC1kaGNvci1kcmMtY29tcGFjdC5kdHNpCj4+PiBAQCAtNTcsMTUg
KzU3LDM1IEBAICZhZGMge8KgwqDCoCAvKiBYMTEgQURDIGlucHV0cyAqLwo+Pj4gwqDCoMKgwqDC
oCBzdGF0dXMgPSAib2theSI7Cj4+PiDCoMKgwqDCoMKgIGFkYzE6IGFkY0AwIHsKPj4KPj4KPj4g
SSBzZW50IHNpbWlsYXIgcGF0Y2ggcmVjZW50bHkgdG9vOgo+Pgo+PiBbUEFUQ0hdIEFSTTogZHRz
OiBzdG0zMjogVXBkYXRlIHRvIGdlbmVyaWMgQURDIGNoYW5uZWwgYmluZGluZyBvbiAKPj4gREhT
T00gc3lzdGVtcwo+Pgo+PiBCdXQgSSBuZWVkZWQgdG8gYWRkICNhZGRyZXNzLWNlbGxzLyNzaXpl
LWNlbGxzIGhlcmUgYW5kIHRvIGFkY0AxMDAsIAo+PiBvdGhlcndpc2UgRFRCIGNoZWNrZXIgd2Fz
IGNvbXBsYWluaW5nIC4gRGlkIHlvdSBydW4gRFRCIGNoZWNrIGFuZCB3YXMgCj4+IGl0IE9LIG9u
IHlvdXIgc2lkZSA/Cj4gCj4gVGhlIGZpcnN0IHBhdGNoIGluIHRoaXMgc2VyaWUgYWRkcyB0aGUg
I2FkZHJlc3MtY2VsbHMvI3NpemUtY2VsbHMgdG8gdGhlIAo+ICDCoFNvQyBEVC4gU28sIHRoZXJl
IGlzIG5vIG5lZWQgdG8gYWRkIHRoZW0gbGF0ZXIgaW4gdGhlIGJvYXJkIERULgo+IAo+IEkgY2Fu
IHNlbmQgYSB2MiB3aXRoIHlvdXIgcGF0Y2ggKGFmdGVyIHJlbW92aW5nIHRoZSBjZWxscyBwcm9w
ZXJ0aWVzIAo+IGZyb20gdGhlIHBhdGNoKS4gSGF2aW5nIGFsbCB0aGUgcGF0Y2hlcyBpbiB0aGUg
c2FtZSBzZXJpZSwgd2lsbCBoZWxwIAo+IGF2b2lkaW5nIHNlcXVlbmNpbmcgcHJvYmxlbXMuCj4g
Cj4gRG8geW91IGFncmVlIHdpdGggdGhpcyA/CgpXaGF0IGlzIHRoZSBzdGF0dXMgb2YgdGhpcyBw
YXRjaCA/CgpNYXJlaywgSSB3b3VsZCBwcmVmZXIgdG8gdGFrZSBhbGwgQURDIHVwZGF0ZXMgaW4g
dGhpcyBzZXJpZXMgaWYgeW91IGFncmVlLgoKQWxleAoKPiAKPiBCUnMKPiBPbGl2aWVyCj4gCj4+
Cj4+PiAtwqDCoMKgwqDCoMKgwqAgc3QsYWRjLWNoYW5uZWxzID0gPDAgMSA2PjsKPj4+IC3CoMKg
wqDCoMKgwqDCoCBzdCxtaW4tc2FtcGxlLXRpbWUtbnNlY3MgPSA8NTAwMD47Cj4+PiDCoMKgwqDC
oMKgwqDCoMKgwqAgc3RhdHVzID0gIm9rYXkiOwo+Pj4gK8KgwqDCoMKgwqDCoMKgIGNoYW5uZWxA
MCB7Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZWcgPSA8MD47Cj4+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBzdCxtaW4tc2FtcGxlLXRpbWUtbnMgPSA8NTAwMD47Cj4+PiArwqDCoMKg
wqDCoMKgwqAgfTsKPj4+ICvCoMKgwqDCoMKgwqDCoCBjaGFubmVsQDEgewo+Pj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgcmVnID0gPDE+Owo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3Qs
bWluLXNhbXBsZS10aW1lLW5zID0gPDUwMDA+Owo+Pj4gK8KgwqDCoMKgwqDCoMKgIH07Cj4+PiAr
wqDCoMKgwqDCoMKgwqAgY2hhbm5lbEA2IHsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJl
ZyA9IDw2PjsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0LG1pbi1zYW1wbGUtdGltZS1u
cyA9IDw1MDAwPjsKPj4+ICvCoMKgwqDCoMKgwqDCoCB9Owo+Pj4gwqDCoMKgwqDCoCB9Owo+Pgo+
PiBbLi4uXQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlz
dGluZm8vbGludXgtc3RtMzIK
