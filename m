Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A41191AC33
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Jun 2024 18:05:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BF193C7128F;
	Thu, 27 Jun 2024 16:05:13 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 84B93C5E2D2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Jun 2024 16:05:08 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id DAADB87FCD;
 Thu, 27 Jun 2024 18:05:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1719504308;
 bh=Vod1TFd4od8BsqH2BebeU7FQfNDJP3jGPHi8gOTt2e8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=bPrs8y83eGSS6pSiK1WOnZseVAQPk6dRLpOuinXO58qAm4YvXxLJpAedhz5D5jCDc
 h2sdJIHvB+S37Lkutl+lJdvWesVKoOpaTjoMjL99ymALNksmyx7eiIYks1KKFyn/ZM
 IwpcNiSjjfxoXC3WEtYolKXjk6/mxVrtzwOOsucxoCdWte8BPa0p1GT2OmFpwTiPDI
 ZzJDaLGOVFgzVNPC1tvi7HhD3qVk2wGo+3WkP8nXyEccBMw50PVjQ/asq3Gjc4JtbR
 FvNY+m342pPpt66wU/cpEH0APJR7yQu6oiD5Br1D5KoEJp0w83itC/NOAiaeK62Dmn
 zBSpSwyf0iUmQ==
Message-ID: <86ef3141-8c37-42b6-ae78-a47dfad90614@denx.de>
Date: Thu, 27 Jun 2024 17:48:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 linux-arm-kernel@lists.infradead.org
References: <20240626030736.512113-1-marex@denx.de>
 <5d9da37e-b120-42a3-8436-98a74c20596b@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <5d9da37e-b120-42a3-8436-98a74c20596b@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 kernel@dh-electronics.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: Fix STM32MP13xx pinmux
 node eth2-rgmii-sleep-0 copy-paste error
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

T24gNi8yNy8yNCAxMDoyMiBBTSwgQWxleGFuZHJlIFRPUkdVRSB3cm90ZToKPiBIaSBNYXJlawo+
IAo+IE9uIDYvMjYvMjQgMDU6MDcsIE1hcmVrIFZhc3V0IHdyb3RlOgo+PiBGaXggcGluIGNvcHkt
cGFzdGUgZXJyb3IgaW4gU1RNMzJNUDEzeHggZXRoMi1yZ21paS1zbGVlcC0wIHBpbm11eAo+PiBu
b2RlLiBDbGVhcmx5IHRoZSBwaW5zIGxpa2UgUEcxMSBhcmUgbm90IHN1cHBvc2VkIHRvIGJlIGR1
cGxpY2F0ZWQKPj4gaW4gdGhlIG5vZGUgcGlubXV4IHByb3BlcnR5LCBmaXggdGhlbSB1cCB0byBt
YXRjaCB0aGUgaGFyZHdhcmUgcGluCj4+IGFzc2lnbm1lbnQuCj4+Cj4+IEZpeGVzOiBkMTE5M2U2
NTY0N2UgKCJBUk06IGR0czogc3RtMzI6IEFkZCBwaW5tdXggbm9kZXMgZm9yIERIIAo+PiBlbGVj
dHJvbmljcyBTVE0zMk1QMTN4eCBESENPUiBTb00gYW5kIERIU0JDIGJvYXJkIikKPj4gU2lnbmVk
LW9mZi1ieTogTWFyZWsgVmFzdXQgPG1hcmV4QGRlbnguZGU+Cj4+IC0tLQo+PiBDYzogQWxleGFu
ZHJlIFRvcmd1ZSA8YWxleGFuZHJlLnRvcmd1ZUBmb3NzLnN0LmNvbT4KPj4gQ2M6IENocmlzdG9w
aGUgUm91bGxpZXIgPGNocmlzdG9waGUucm91bGxpZXJAZm9zcy5zdC5jb20+Cj4+IENjOiBDb25v
ciBEb29sZXkgPGNvbm9yK2R0QGtlcm5lbC5vcmc+Cj4+IENjOiBLcnp5c3p0b2YgS296bG93c2tp
IDxrcnprK2R0QGtlcm5lbC5vcmc+Cj4+IENjOiBNYXhpbWUgQ29xdWVsaW4gPG1jb3F1ZWxpbi5z
dG0zMkBnbWFpbC5jb20+Cj4+IENjOiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgo+PiBD
YzogZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmcKPj4gQ2M6IGtlcm5lbEBkaC1lbGVjdHJvbmlj
cy5jb20KPj4gQ2M6IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwo+PiBDYzog
bGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQo+PiAtLS0KPj4gwqAgYXJj
aC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJtcDEzLXBpbmN0cmwuZHRzaSB8IDE0ICsrKysrKystLS0t
LS0tCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0p
Cj4+Cj4+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9zdC9zdG0zMm1wMTMtcGluY3Ry
bC5kdHNpIAo+PiBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAxMy1waW5jdHJsLmR0c2kK
Pj4gaW5kZXggNDI5OTVhOGY1MDM0Yy4uOWM3Y2Y4ZjNjM2U4YiAxMDA2NDQKPj4gLS0tIGEvYXJj
aC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJtcDEzLXBpbmN0cmwuZHRzaQo+PiArKysgYi9hcmNoL2Fy
bS9ib290L2R0cy9zdC9zdG0zMm1wMTMtcGluY3RybC5kdHNpCj4+IEBAIC0xNTcsMTYgKzE1Nywx
NiBAQCBldGgyX3JnbWlpX3NsZWVwX3BpbnNfYTogZXRoMi1yZ21paS1zbGVlcC0wIHsKPj4gwqDC
oMKgwqDCoMKgwqDCoMKgIHBpbnMxIHsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcGlu
bXV4ID0gPFNUTTMyX1BJTk1VWCgnRicsIDcsIEFOQUxPRyk+LCAvKiAKPj4gRVRIX1JHTUlJX1RY
RDAgKi8KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDxTVE0zMl9QSU5N
VVgoJ0cnLCAxMSwgQU5BTE9HKT4sIC8qIEVUSF9SR01JSV9UWEQxICovCj4+IC3CoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA8U1RNMzJfUElOTVVYKCdHJywgMTEsIEFOQUxPRyk+LCAv
KiBFVEhfUkdNSUlfVFhEMiAqLwo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
PFNUTTMyX1BJTk1VWCgnRycsIDExLCBBTkFMT0cpPiwgLyogRVRIX1JHTUlJX1RYRDMgKi8KPj4g
LcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDxTVE0zMl9QSU5NVVgoJ0cnLCA4LCBB
TkFMT0cpPiwgLyogRVRIX1JHTUlJX1RYX0NUTCAqLwo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgPFNUTTMyX1BJTk1VWCgnRicsIDYsIEFOQUxPRyk+LCAvKiBFVEhfUkdNSUlf
R1RYX0NMSyAqLwo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPFNUTTMyX1BJ
Tk1VWCgnQicsIDIsIEFOQUxPRyk+LCAvKiBFVEhfTURJTyAqLwo+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgPFNUTTMyX1BJTk1VWCgnRycsIDEsIEFOQUxPRyk+LCAvKiBFVEhf
UkdNSUlfVFhEMiAqLwo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPFNUTTMy
X1BJTk1VWCgnRScsIDYsIEFOQUxPRyk+LCAvKiBFVEhfUkdNSUlfVFhEMyAqLwo+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPFNUTTMyX1BJTk1VWCgnRicsIDYsIEFOQUxPRyk+
LCAvKiBFVEhfUkdNSUlfVFhfQ1RMICovCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCA8U1RNMzJfUElOTVVYKCdHJywgMywgQU5BTE9HKT4sIC8qIEVUSF9SR01JSV9HVFhfQ0xL
ICovCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA8U1RNMzJfUElOTVVYKCdC
JywgNiwgQU5BTE9HKT4sIC8qIEVUSF9NRElPICovCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCA8U1RNMzJfUElOTVVYKCdHJywgNSwgQU5BTE9HKT4sIC8qIEVUSF9NREMg
Ki8KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDxTVE0zMl9QSU5NVVgo
J0YnLCA0LCBBTkFMT0cpPiwgLyogRVRIX1JHTUlJX1JYRDAgKi8KPj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIDxTVE0zMl9QSU5NVVgoJ0UnLCAyLCBBTkFMT0cpPiwgLyog
RVRIX1JHTUlJX1JYRDEgKi8KPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDxT
VE0zMl9QSU5NVVgoJ0UnLCAyLCBBTkFMT0cpPiwgLyogRVRIX1JHTUlJX1JYRDIgKi8KPj4gLcKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDxTVE0zMl9QSU5NVVgoJ0UnLCAyLCBBTkFM
T0cpPiwgLyogRVRIX1JHTUlJX1JYRDMgKi8KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIDxTVE0zMl9QSU5NVVgoJ0gnLCA2LCBBTkFMT0cpPiwgLyogRVRIX1JHTUlJX1JYRDIg
Ki8KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDxTVE0zMl9QSU5NVVgoJ0En
LCA4LCBBTkFMT0cpPiwgLyogRVRIX1JHTUlJX1JYRDMgKi8KPj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIDxTVE0zMl9QSU5NVVgoJ0EnLCAxMiwgQU5BTE9HKT4sIC8qIAo+
PiBFVEhfUkdNSUlfUlhfQ1RMICovCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCA8U1RNMzJfUElOTVVYKCdIJywgMTEsIEFOQUxPRyk+OyAvKiAKPj4gRVRIX1JHTUlJX1JY
X0NMSyAqLwo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgfTsKPiAKPiBBcHBsaWVkIG9uIHN0bTMyLW5l
eHQuIEkgdGhpbmsgSSdsbCBzcXVhc2ggdGhlIHR3byBmaXhlcyAodGhpcyBwYXRjaCBhbmQgCj4g
dGhlIG90aGVyIG9uZSBmb3IgdGhlIG1ha2VmaWxlKSBvbnRvIHRoZSBpbml0aWFsIHBhdGNoIHdo
ZW4gSSBjcmVhdGUgbXkgCj4gUFIgdm9yIHY2LjExLgoKRmluZSBieSBtZSwgdGhhbmtzICEKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIg
bWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0
cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgt
c3RtMzIK
