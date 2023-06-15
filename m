Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B483731C52
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Jun 2023 17:19:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 267D4C65E58;
	Thu, 15 Jun 2023 15:19:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DBDD2C5E2C2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Jun 2023 15:19:56 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35FCIhx0021879; Thu, 15 Jun 2023 17:19:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=JBhEQ1HO2ejCLfpB19AwgOlNqtqOQiA2AZp9z8Cz/1E=;
 b=Kz7aSIl0ySOWsOrs46XZZhgzfeJbL9QUl4Wam435CzpizWNt/RYmMamsl0S8WCu96vGj
 iwDNO7TF8gK+N71HgX6/9ylUTHJGKyhE43XGmaCFemfOXw7xIhOZ1aNan8l0EKDimGBQ
 sLplos3q/o8VvEqnC03HmfRvOQNzH1z7B42J1iYx43fpygidsIOHF2qko+iDUI3DbIM7
 FXmPZda05/qalAjzKXZ+IRbnhtim1uGMSTb3PiXUrm8I43cCOtI4ROYQyE8Ncmm9D7Ts
 RMTyPePi+ItanfQ/4oF2TBONq2gGzk8OSA5x1LUVBYwgFqFgDEPIcuo4iCcZZ6L/nFLJ 9w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3r7y8sjjhe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Jun 2023 17:19:27 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0522410002A;
 Thu, 15 Jun 2023 17:19:27 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F062223152C;
 Thu, 15 Jun 2023 17:19:26 +0200 (CEST)
Received: from [10.201.21.210] (10.201.21.210) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Thu, 15 Jun
 2023 17:19:23 +0200
Message-ID: <266de9f5-826a-c1bf-be8d-11f5e27c87dc@foss.st.com>
Date: Thu, 15 Jun 2023 17:19:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
From: Yann Gautier <yann.gautier@foss.st.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
References: <20230615092001.1213132-1-yann.gautier@foss.st.com>
 <20230615092001.1213132-2-yann.gautier@foss.st.com>
 <CAPDyKFqJsqmNzeRg8hj55yUEMSycOWsmKVKsMWk4Qu7Y8_dNzg@mail.gmail.com>
 <3b6781cb-8f59-e70a-bcf8-9fb48fa47cbf@foss.st.com>
In-Reply-To: <3b6781cb-8f59-e70a-bcf8-9fb48fa47cbf@foss.st.com>
X-Originating-IP: [10.201.21.210]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-15_11,2023-06-15_01,2023-05-22_02
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Xiang wangx <wangxiang@cdjrlc.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Linus Walleij <linus.walleij@linaro.org>, linux-mmc@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Yang Yingliang <yangyingliang@huawei.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: Re: [Linux-stm32] [PATCH 1/6] dt-bindings: mmc: mmci: Add st,
 stm32mp25-sdmmc2 compatible
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

T24gNi8xNS8yMyAxNzoxNiwgWWFubiBHYXV0aWVyIHdyb3RlOgo+IE9uIDYvMTUvMjMgMTU6MjAs
IFVsZiBIYW5zc29uIHdyb3RlOgo+PiBPbiBUaHUsIDE1IEp1biAyMDIzIGF0IDExOjIwLCBZYW5u
IEdhdXRpZXIgPHlhbm4uZ2F1dGllckBmb3NzLnN0LmNvbT4gCj4+IHdyb3RlOgo+Pj4KPj4+IEZv
ciBTVE0zMk1QMjUsIHdlJ2xsIG5lZWQgdG8gZGlzdGluZ3Vpc2ggaG93IGlzIG1hbmFnZWQgdGhl
IGRlbGF5IGJsb2NrLgo+Pj4gVGhpcyBpcyBkb25lIHRocm91Z2ggYSBuZXcgY29tcHRpYmxlIGRl
ZGljYXRlZCBmb3IgdGhpcyBTb0MsIGFzIHRoZQo+Pj4gZGVsYXkgYmxvY2sgcmVnaXN0ZXJzIGFy
ZSBsb2NhdGVkIGluIFNZU0NGRyBwZXJpcGhlcmFsLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IFlh
bm4gR2F1dGllciA8eWFubi5nYXV0aWVyQGZvc3Muc3QuY29tPgo+Pj4gLS0tCj4+PiDCoCBEb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbW1jL2FybSxwbDE4eC55YW1sIHwgNiArKysr
KysKPj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykKPj4+Cj4+PiBkaWZmIC0t
Z2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21tYy9hcm0scGwxOHgueWFt
bCAKPj4+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21tYy9hcm0scGwxOHgu
eWFtbAo+Pj4gaW5kZXggMWM5NmRhMDRmMGU1My4uZTQ3YjM0MThiNmM3NyAxMDA2NDQKPj4+IC0t
LSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tbWMvYXJtLHBsMTh4LnlhbWwK
Pj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tbWMvYXJtLHBsMTh4
LnlhbWwKPj4+IEBAIC01OSw2ICs1OSwxMiBAQCBwcm9wZXJ0aWVzOgo+Pj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAtIGNvbnN0OiBzdCxzdG0zMi1zZG1tYzIKPj4+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgLSBjb25zdDogYXJtLHBsMTh4Cj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gY29u
c3Q6IGFybSxwcmltZWNlbGwKPj4+ICvCoMKgwqDCoMKgIC0gZGVzY3JpcHRpb246IEVudHJ5IGZv
ciBTVE1pY3JvZWxlY3Ryb25pY3MgdmFyaWFudCBvZiBQTDE4eCBmb3IKPj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqAgU1RNMzJNUDI1LiBUaGlzIGRlZGljYXRlZCBjb21wYXRpYmxlIGlzIHVzZWQgYnkg
Ym9vdGxvYWRlcnMuCj4+Cj4+IFdoYXQgZG9lcyB0aGlzIGxhc3Qgc2VudGVuY2UgbWVhbj8gQ2Fu
IHdlIGRyb3AgaXQ/Cj4gCj4gSGkgVWxmLAo+IAo+IEkganVzdCBjb3BpZWQgKGFuZCBhZGRlZCAi
Zm9yIFNUTTMyTVAyNSIpIHdoYXQgd2FzIGRvbmUgZm9yIFNUTTMyTVAxeDoKPiAgwqDCoMKgwqDC
oCAtIGRlc2NyaXB0aW9uOiBFbnRyeSBmb3IgU1RNaWNyb2VsZWN0cm9uaWNzIHZhcmlhbnQgb2Yg
UEwxOHguCj4gIMKgwqDCoMKgwqDCoMKgwqDCoCBUaGlzIGRlZGljYXRlZCBjb21wYXRpYmxlIGlz
IHVzZWQgYnkgYm9vdGxvYWRlcnMuCj4gIMKgwqDCoMKgwqDCoMKgIGl0ZW1zOgo+ICDCoMKgwqDC
oMKgwqDCoMKgwqAgLSBjb25zdDogc3Qsc3RtMzItc2RtbWMyCj4gIMKgwqDCoMKgwqDCoMKgwqDC
oCAtIGNvbnN0OiBhcm0scGwxOHgKPiAgwqDCoMKgwqDCoMKgwqDCoMKgIC0gY29uc3Q6IGFybSxw
cmltZWNlbGwKPiAgwqDCoMKgwqDCoCAtIGRlc2NyaXB0aW9uOiBFbnRyeSBmb3IgU1RNaWNyb2Vs
ZWN0cm9uaWNzIHZhcmlhbnQgb2YgUEwxOHggZm9yCj4gIMKgwqDCoMKgwqDCoMKgwqDCoCBTVE0z
Mk1QMjUuIFRoaXMgZGVkaWNhdGVkIGNvbXBhdGlibGUgaXMgdXNlZCBieSBib290bG9hZGVycy4K
PiAgwqDCoMKgwqDCoMKgwqAgaXRlbXM6Cj4gIMKgwqDCoMKgwqDCoMKgwqDCoCAtIGNvbnN0OiBz
dCxzdG0zMm1wMjUtc2RtbWMyCj4gIMKgwqDCoMKgwqDCoMKgwqDCoCAtIGNvbnN0OiBhcm0scGwx
OHgKPiAgwqDCoMKgwqDCoMKgwqDCoMKgIC0gY29uc3Q6IGFybSxwcmltZWNlbGwKPiAKPiAKPiBT
aG91bGQgSSByZW1vdmUgKG9yIGFkYXB0KSBib3RoIGRlc2NyaXB0aW9ucz8KPiAKPiAKPiBCZXN0
IHJlZ2FyZHMsCj4gWWFubgo+IAoKQXQgdGhlIHRpbWUgdGhlIHBhdGNoIHdhcyBkb25lIGl0IHdh
cyByZWFsbHkganVzdCB1c2VkIGJ5IGJvb3Rsb2FkZXJzLgpCdXQgYXMgaXQgaXMgbm93IHVzZWQg
aW4gdGhlIGRyaXZlciBmb3IgZGVsYXkgYmxvY2ssIEkgc2hvdWxkIHJlbW92ZSB0aGUgCnNlY29u
ZCBzZW50ZW5jZS4KCgpZYW5uCgo+Pgo+Pj4gK8KgwqDCoMKgwqDCoMKgIGl0ZW1zOgo+Pj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoCAtIGNvbnN0OiBzdCxzdG0zMm1wMjUtc2RtbWMyCj4+PiArwqDCoMKg
wqDCoMKgwqDCoMKgIC0gY29uc3Q6IGFybSxwbDE4eAo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoCAt
IGNvbnN0OiBhcm0scHJpbWVjZWxsCj4+Pgo+Pj4gwqDCoMKgIGNsb2NrczoKPj4+IMKgwqDCoMKg
wqAgZGVzY3JpcHRpb246IE9uZSBvciB0d28gY2xvY2tzLCB0aGUgImFwYl9wY2xrIiBhbmQgdGhl
ICJNQ0xLIgo+Pj4gLS0gCj4+PiAyLjI1LjEKPj4+Cj4+Cj4+IEtpbmQgcmVnYXJkcwo+PiBVZmZl
Cj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5m
by9saW51eC1zdG0zMgo=
