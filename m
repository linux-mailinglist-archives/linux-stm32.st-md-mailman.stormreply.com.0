Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F3D71A227
	for <lists+linux-stm32@lfdr.de>; Thu,  1 Jun 2023 17:15:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 533CEC6A61E;
	Thu,  1 Jun 2023 15:15:46 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C0190C6A61A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  1 Jun 2023 15:15:44 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 351D3a9E012865; Thu, 1 Jun 2023 17:15:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=0RcEoXxFMEuOoi4z69XcgdJOiHIgPTlS10vQX8Lm9pc=;
 b=fYxCX9AMXvJYDYCxGzJWFGaYDH6WmqzbvH13y3VnWU3JcnMDL2z/qk5rIJnt4GsVSdEF
 b9Svwsa+vHjiHEsBXe5vUdOR3ufSw8l9moG7JcSFh2e0LdLooo89E6fkKzYiz+GBIkNP
 3HwDSwV+L2c7PsDFFOHQ5zI/6YDeL9C524ujrPBxWsxZBVeSvnc51AHvUxOetQvOqajF
 gGnX8OXcejrfT5Y5mGqPRL0jL+niMCjRxUSEmcB8LjSwEgbvQm/jjAszeQsCPCFQ5Fsr
 ZXk/hTJpmSRyMZy53gRyKIGi5CejQ/WC8drv0hfjAeztAuxAFsLUCsrsdGD/M7uFg1oI CA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3qx367aak3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Jun 2023 17:15:14 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A8CAD10002A;
 Thu,  1 Jun 2023 17:15:12 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8EC7C252235;
 Thu,  1 Jun 2023 17:15:12 +0200 (CEST)
Received: from [10.48.1.0] (10.48.1.0) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Thu, 1 Jun
 2023 17:15:11 +0200
Message-ID: <fcf3157c-3417-2090-1be3-c00388c11d72@foss.st.com>
Date: Thu, 1 Jun 2023 17:15:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, <linux-arm-kernel@lists.infradead.org>
References: <20230517152513.27922-1-marex@denx.de>
 <20230517152513.27922-3-marex@denx.de>
 <02ca01d98fe6$ca371d80$5ea55880$@foss.st.com>
 <25e6053b-dfc7-efce-2043-7e4f96708418@denx.de>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <25e6053b-dfc7-efce-2043-7e4f96708418@denx.de>
X-Originating-IP: [10.48.1.0]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-01_08,2023-05-31_03,2023-05-22_02
Cc: devicetree@vger.kernel.org, 'Conor Dooley' <conor+dt@kernel.org>,
 'Krzysztof Kozlowski' <krzysztof.kozlowski+dt@linaro.org>,
 'Rob Herring' <robh+dt@kernel.org>,
 'Srinivas Kandagatla' <srinivas.kandagatla@linaro.org>,
 'Maxime Coquelin' <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, kernel@dh-electronics.com
Subject: Re: [Linux-stm32] [PATCH v2 3/3] ARM: dts: stm32: Add nvmem-syscon
 node to TAMP to expose boot count on DHSOM
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

SGksCgpPbiA2LzEvMjMgMDE6MDksIE1hcmVrIFZhc3V0IHdyb3RlOgo+IE9uIDUvMjYvMjMgMTc6
MjgsIHBhdHJpY2suZGVsYXVuYXlAZm9zcy5zdC5jb20gd3JvdGU6Cj4+IEhpIE1hcmVrLAo+Cj4g
SGksCj4KPj4+IEZyb206IE1hcmVrIFZhc3V0IDxtYXJleEBkZW54LmRlPgo+Pj4gU2VudDogV2Vk
bmVzZGF5LCBNYXkgMTcsIDIwMjMgNToyNSBQTQo+Pj4gU3ViamVjdDogW1BBVENIIHYyIDMvM10g
QVJNOiBkdHM6IHN0bTMyOiBBZGQgbnZtZW0tc3lzY29uIG5vZGUgdG8gCj4+PiBUQU1QIHRvCj4+
PiBleHBvc2UgYm9vdCBjb3VudCBvbiBESFNPTQo+Pj4KPj4+IEFkZCBudm1lbS1zeXNjb24gc3Vi
bm9kZSB0byBleHBvc2UgVEFNUF9CS1B4UiByZWdpc3RlciAxOSB0byB1c2VyIAo+Pj4gc3BhY2Uu
Cj4+PiBUaGlzIHJlZ2lzdGVyIGNvbnRhaW5zIFUtQm9vdCBib290IGNvdW50ZXIsIGJ5IGV4cG9z
aW5nIGl0IHRvIHVzZXIgCj4+PiBzcGFjZSB0aGUgdXNlcgo+Pj4gc3BhY2UgY2FuIHJlc2V0IHRo
ZSBib290IGNvdW50ZXIuCj4+Pgo+Pj4gUmVhZCBhY2Nlc3MgZXhhbXBsZToKPj4+ICIKPj4+ICQg
aGV4ZHVtcCAtdkMgL3N5cy9idXMvbnZtZW0vZGV2aWNlcy81YzAwYTAwMC50YW1wXDpudm1lbTAv
bnZtZW0KPj4+IDAwMDAwMDAwwqAgMGMgMDAgYzQgYjAKPj4+ICIKPj4+Cj4+PiBTaWduZWQtb2Zm
LWJ5OiBNYXJlayBWYXN1dCA8bWFyZXhAZGVueC5kZT4KPj4+IC0tLQo+Pj4gQ2M6IEFsZXhhbmRy
ZSBUb3JndWUgPGFsZXhhbmRyZS50b3JndWVAZm9zcy5zdC5jb20+Cj4+PiBDYzogQ29ub3IgRG9v
bGV5IDxjb25vcitkdEBrZXJuZWwub3JnPgo+Pj4gQ2M6IEtyenlzenRvZiBLb3psb3dza2kgPGty
enlzenRvZi5rb3psb3dza2krZHRAbGluYXJvLm9yZz4KPj4+IENjOiBNYXJlayBWYXN1dCA8bWFy
ZXhAZGVueC5kZT4KPj4+IENjOiBNYXhpbWUgQ29xdWVsaW4gPG1jb3F1ZWxpbi5zdG0zMkBnbWFp
bC5jb20+Cj4+PiBDYzogUm9iIEhlcnJpbmcgPHJvYmgrZHRAa2VybmVsLm9yZz4KPj4+IENjOiBT
cmluaXZhcyBLYW5kYWdhdGxhIDxzcmluaXZhcy5rYW5kYWdhdGxhQGxpbmFyby5vcmc+Cj4+PiBD
YzogZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmcKPj4+IENjOiBrZXJuZWxAZGgtZWxlY3Ryb25p
Y3MuY29tCj4+PiBDYzogbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCj4+PiBD
YzogbGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQo+Pj4gLS0tCj4+PiBW
MjogTm8gY2hhbmdlCj4+PiAtLS0KPj4+IMKgIGFyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNXh4
LWRoY29tLXNvbS5kdHNpIHwgMTEgKysrKysrKysrKysKPj4+IGFyY2gvYXJtL2Jvb3QvZHRzL3N0
bTMybXAxNXh4LWRoY29yLXNvbS5kdHNpIHwgMTEgKysrKysrKysrKysKPj4+IMKgIDIgZmlsZXMg
Y2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9i
b290L2R0cy9zdG0zMm1wMTV4eC1kaGNvbS1zb20uZHRzaQo+Pj4gYi9hcmNoL2FybS9ib290L2R0
cy9zdG0zMm1wMTV4eC1kaGNvbS1zb20uZHRzaQo+Pj4gaW5kZXggNzQ3MzU1NTJmNDgwMy4uYjI1
NTdiYjcxOGY1MiAxMDA2NDQKPj4+IC0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNXh4
LWRoY29tLXNvbS5kdHNpCj4+PiArKysgYi9hcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTV4eC1k
aGNvbS1zb20uZHRzaQo+Pj4gQEAgLTUzNyw2ICs1MzcsMTcgQEAgJnNkbW1jMyB7Cj4+PiDCoMKg
wqDCoMKgIHN0YXR1cyA9ICJva2F5IjsKPj4+IMKgIH07Cj4+Pgo+Pj4gKyZ0YW1wIHsKPj4+ICvC
oMKgwqAgI2FkZHJlc3MtY2VsbHMgPSA8MT47Cj4+PiArwqDCoMKgICNzaXplLWNlbGxzID0gPDE+
Owo+Pj4gKwo+Pj4gK8KgwqDCoCAvKiBCb290IGNvdW50ZXIgKi8KPj4+ICvCoMKgwqAgbnZtZW0g
ewo+Pj4gK8KgwqDCoMKgwqDCoMKgIGNvbXBhdGlibGUgPSAibnZtZW0tc3lzY29uIjsKPj4+ICvC
oMKgwqDCoMKgwqDCoCByZWcgPSA8MHgxNGMgMHg0PjsKPj4+ICvCoMKgwqAgfTsKPj4+ICt9Owo+
Pj4gKwo+Pj4gwqAgJnVhcnQ0IHsKPj4+IMKgwqDCoMKgwqAgcGluY3RybC1uYW1lcyA9ICJkZWZh
dWx0IjsKPj4+IMKgwqDCoMKgwqAgcGluY3RybC0wID0gPCZ1YXJ0NF9waW5zX2E+Owo+Pj4gZGlm
ZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNXh4LWRoY29yLXNvbS5kdHNpCj4+
PiBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNXh4LWRoY29yLXNvbS5kdHNpCj4+PiBpbmRl
eCBiYmExOWYyMWU1Mjc3Li44NjQ5NjAzODdlNjM0IDEwMDY0NAo+Pj4gLS0tIGEvYXJjaC9hcm0v
Ym9vdC9kdHMvc3RtMzJtcDE1eHgtZGhjb3Itc29tLmR0c2kKPj4+ICsrKyBiL2FyY2gvYXJtL2Jv
b3QvZHRzL3N0bTMybXAxNXh4LWRoY29yLXNvbS5kdHNpCj4+PiBAQCAtMjY5LDMgKzI2OSwxNCBA
QCAmcm5nMSB7Cj4+PiDCoCAmcnRjIHsKPj4+IMKgwqDCoMKgwqAgc3RhdHVzID0gIm9rYXkiOwo+
Pj4gwqAgfTsKPj4+ICsKPj4+ICsmdGFtcCB7Cj4+PiArwqDCoMKgICNhZGRyZXNzLWNlbGxzID0g
PDE+Owo+Pj4gK8KgwqDCoCAjc2l6ZS1jZWxscyA9IDwxPjsKPj4+ICsKPj4+ICvCoMKgwqAgLyog
Qm9vdCBjb3VudGVyICovCj4+PiArwqDCoMKgIG52bWVtIHsKPj4KPj4gQWNjb3JkaW5nIGJpbmRp
bmcgeW91IG5lZWQgdG8gYWRkICJAPHJlZz4iID0+IG52bWVtQDE0Ywo+Pgo+PiBBbmQgeW91IGV4
cG9ydCBvbmx5IFRBTVBfQktQMTlSIGRpcmVjdGx5IGluIGEgbnZtZW0gcmVnaW9uID8KPgo+IDQg
Ynl0ZXMgaXMgbW9yZSB0aGFuIHBsZW50eSBmb3IgYm9vdCBjb3VudGVyICwgeWVzLgo+Cj4+PiAr
wqDCoMKgwqDCoMKgwqAgY29tcGF0aWJsZSA9ICJudm1lbS1zeXNjb24iOwo+Pj4gK8KgwqDCoMKg
wqDCoMKgIHJlZyA9IDwweDE0YyAweDQ+Owo+Pj4gK8KgwqDCoCB9Owo+Pj4gK307Cj4+Cj4+Cj4+
IHRoZSBib290IGNvdW50ZXIgY291bGQgYmUgYSBudmVtIGNlbGwgc28geW91IGNvdWxkIGV4cG9z
ZcKgIG90aGVyIAo+PiBiYWNrdXAgcmVnaXN0ZXJzCj4+Cj4+IEZvciBleGFtcGxlIDoKPj4KPj4g
JnRhbXAgewo+PiDCoMKgwqDCoCNhZGRyZXNzLWNlbGxzID0gPDE+Owo+PiDCoMKgwqDCoCNzaXpl
LWNlbGxzID0gPDE+Owo+Pgo+PiDCoMKgwqDCoG52bWVtQDE0Y8KgIHsKPj4gwqDCoMKgwqDCoMKg
wqAgY29tcGF0aWJsZSA9ICJudm1lbS1zeXNjb24iOwo+PiDCoMKgwqDCoMKgwqDCoCByZWcgPSA8
MHgxNGMgMHg0PjsKPj4KPj4gwqDCoMKgwqDCoMKgwqAgLyogRGF0YSBjZWxscyAqLwo+PiDCoMKg
wqDCoMKgwqDCoCBib290X2NvdW50ZXI6IGJvb3QtY291bnRlckAxNGMgewo+PiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHJlZyA9IDwweDE0YyAweDQ+Owo+PiDCoMKgwqDCoMKgwqDCoCB9Owo+PiDC
oMKgwqDCoH07Cj4+IH07Cj4+Cj4+IEV2ZW4gaWYgeW91IGV4cG9ydCBtb3JlIGJhY2t1cCByZWdp
c3RlciB0aGUgY2VsbCB3aWxsIGJlIGNvcnJlY3RseSAKPj4gZGVzY3JpYmVkIGluIERUCj4+IGFu
ZCBjb3VsZCBiZSBhY2Nlc3NpYmxlIGRpcmVjdGx5wqAgd2l0aCBzeXNmcyB3aXRob3V0IG1hbmFn
ZWQgb2Zmc2V0IAo+PiBpbiB1c2VybGFuZAo+Pgo+PiB3aXRoIGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2xrbWwvMjAyMzA1MjQwNzI0LnozTWNEdVlNLWxrcEBpbnRlbC5jb20vVC8KPj4gT3IgcHJl
dmlvdXMgc2VyaWUgCj4+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAyMTEyMjAwNjQ3
MzAuMjg4MDYtMS16YWplYzVAZ21haWwuY29tLwo+Pgo+Pgo+PiBmb3IgZXhhbXBsZSB0byBleHBv
cnQgYWxsIHRoZSBmcmVlIHJlZ2lzdGVyOgo+Pgo+PiBSZWZlcmVuY2U6IGh0dHBzOi8vd2lraS5z
dC5jb20vc3RtMzJtcHUvd2lraS9TVE0zMk1QMTVfYmFja3VwX3JlZ2lzdGVycwo+Pgo+PiB0aGUg
Y2VsbCAiIGJvb3QtY291bnRlciIgd2lsbCBiZSBhbHdheXMgYXZhaWxhYmxlIGZvciB1c2Vycy4K
Pj4KPj4gJnRhbXAgewo+PiDCoMKgwqDCoCNhZGRyZXNzLWNlbGxzID0gPDE+Owo+PiDCoMKgwqDC
oCNzaXplLWNlbGxzID0gPDE+Owo+Pgo+PiDCoMKgwqDCoC8qIGJhY2t1cCByZWdpc3RlcjogMTAg
dG8gMjEgKi8KPj4gwqDCoMKgwqBudm1lbUAweDEyOMKgIHsKPj4gwqDCoMKgwqDCoMKgwqAgY29t
cGF0aWJsZSA9ICJudm1lbS1zeXNjb24iOwo+PiDCoMKgwqDCoMKgwqDCoCByZWcgPSA8MHgxMjgg
MHg0ND47Cj4+Cj4+IMKgwqDCoMKgwqDCoMKgIC8qIERhdGEgY2VsbHMgKi8KPj4gwqDCoMKgwqDC
oMKgwqAgYm9vdF9jb3VudGVyOiBib290LWNvdW50ZXJAMTRjIHsKPj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCByZWcgPSA8MHgxNGMgMHg0PjsKPj4gwqDCoMKgwqDCoMKgwqAgfTsKPj4gwqDCoMKg
wqDCoMKgwqAgYm9vdF9tb2RlOiBib290LW1vZGVAMTUwIHsKPj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCByZWcgPSA8MHgxNTAgMHg0PjsKPj4gwqDCoMKgwqDCoMKgwqAgfTsKPj4gLi4uLgo+PiDC
oMKgwqDCoH07Cj4+IH07Cj4KPiBTdXJlLCB0aGFua3MuIEknbSBub3Qgc3VyZSBJIHVuZGVyc3Rv
b2QgdGhlIG1lc3NhZ2UgYWJvdmUuCgoKc29ycnkgaWYgaXQgd2Fzbid0IGNsZWFyCgoKVEFNUCBy
ZWdpc3RlciBhIG52bWVtIGRyaXZlciA9IE5WUkFNIHByb3ZpZGVyCgo9PiBpdCBzaG91bGQgZXhw
b3J0IEFMTCB0aGUgZnJlZSBiYWNrdXAgcmVnaXN0ZXJzCgogwqDCoMKgwqDCoCBhcyB0aGV5IGNh
biB1c2VkIGJ5IGFwcGxpY2F0aW9uIC8ga2VybmVsIGZvciBtYW55IHB1cnBvc2UuLi4uCgogwqDC
oMKgwqDCoCBhbmQgbm90IG9ubHkgZm9yIGJvb3QgY291bnRlcmZvciB5b3UgdXNlLWNhc2UKCgpT
byBsaW1pdCB0aGUgZXhwb3J0ZWQgYmFja3VwIHJlZ2lzdGVyIHRvIHRoaXMgNCBieXRlcyBpcyBz
dHJhbmdlIGZvciBtZS4KCgphbmQgQ09VTlRFUiBpcyBhIG52ZW0gY2VsbCA9wqAgYSBwYXJ0IG9m
IGJhY2t1cCByZWdpc3RlciA9IFRBTVBfQktQMTlSCgo9PiBJIGFncmVlIDQgYnl0ZSBmb3IgdGhp
cyBjb3VudCBpcyBmaW5lIGZvciB0aGlzIGNlbGwKCgpOQjogdG9kYXkgd2UgaGF2ZSBubyBtZWFu
cyB0byByZWFkIG9ubHkgb25lIG52bWVtIGNlbGwgd2l0aCBzeXNmcyBBUEkKCiDCoMKgwqDCoMKg
wqAgYnV0IEkgc2VlIHRoaXMgZmVhdHVyZSBpcyBwcm9wb3NlZCB0byBoYXZlIHNvbWV0aGluZyBh
cwoKL3N5cy9idXMvbnZtZW0vZGV2aWNlcy9udm1lbUAweDEyOC8gPT4gYWxsIHRoZSBiYWNrdXAg
cmVnaXN0ZXJzCgovc3lzL2J1cy9udm1lbS9kZXZpY2VzL252bWVtQDB4MTI4L2NlbGxzL2Jvb3Qt
bW9kZSA9PiBvbmx5IHRoZSBudm1lbSAKY2VsbCB1c2VkIGFzIGNvdW50ZXIgSSB0aGluayBpdCBp
cyBtb3JlIHNhZmUgZm9yIGxvbmcgdGVybSBzdXBwb3J0IHRvIAptYW5hZ2UgeW91ciBjb3VudGVy
IGFzIGEgbnZtZW0gY2VsbC4gcmVnYXJkcyBQYXRyaWNrCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgt
c3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
