Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 89FFD9282B3
	for <lists+linux-stm32@lfdr.de>; Fri,  5 Jul 2024 09:30:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 386A6C78014;
	Fri,  5 Jul 2024 07:30:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 21A0AC71282
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Jul 2024 07:30:51 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 464NbveC003054;
 Fri, 5 Jul 2024 09:30:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 zeymwLrfmjaX2m48cbogphOrAiuN6OzRyep6F7RdK8M=; b=hhR+F1lGWZqmqBNj
 HLBb5XJgcEBmZeUvaRWvUibH2dmDRMgia0rIKXj3aaSCswkewkxRmE3VxGl3g3Pm
 oOXToa1nI4XUcsNt4pXhwcLSNPV7aWph+ioNcyCnF7KDJCT3low+oZnGB2Su3BWJ
 WVkYC05q0B4X4O6pYjK/62zVPWZWoQIzb01r4F06SM7brEypMTTBcJZrpbvTvb7A
 meZjDK71MBkuEMP7nVfI0OC7yOoHwtWklRjOAHRz75LBSY93IXxFFSPjYMiwDozz
 nBTG/RhgiWAssCR70YDtRTO8yGVltZqUbSrMcLcgsHgsZDslnkx7OjIqfAlhBeQP
 ISwrtg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 405u9su358-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Jul 2024 09:30:34 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 895A440048;
 Fri,  5 Jul 2024 09:30:30 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 475C8215BEC;
 Fri,  5 Jul 2024 09:30:06 +0200 (CEST)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 5 Jul
 2024 09:30:05 +0200
Message-ID: <9af42035-5cce-4c49-8814-87e517ec24c5@foss.st.com>
Date: Fri, 5 Jul 2024 09:30:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marex@denx.de>, "Rob Herring (Arm)" <robh@kernel.org>
References: <20240629171100.20285-1-marex@denx.de>
 <171985715690.313627.4404278514791505125.robh@kernel.org>
 <cc492f1a-c2f5-438e-a28a-7900cde6f073@denx.de>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <cc492f1a-c2f5-438e-a28a-7900cde6f073@denx.de>
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-05_04,2024-07-03_01,2024-05-17_01
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 kernel@dh-electronics.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: Add ethernet MAC nvmem
 cells to DH STM32MP13xx DHCOR DHSBC board
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

SGkgTWFyZWssIFJvYgoKT24gNy8yLzI0IDA0OjQzLCBNYXJlayBWYXN1dCB3cm90ZToKPiBPbiA3
LzEvMjQgODoxMCBQTSwgUm9iIEhlcnJpbmcgKEFybSkgd3JvdGU6Cj4+Cj4+IE9uIFNhdCwgMjkg
SnVuIDIwMjQgMTk6MTA6MzAgKzAyMDAsIE1hcmVrIFZhc3V0IHdyb3RlOgo+Pj4gRGVzY3JpYmUg
ZXRoZXJuZXQgTUFDIGFkZHJlc3MgbnZtZW0gY2VsbHMgaW4gREggU1RNMzJNUDEzeHggREhDT1Ig
REhTQkMKPj4+IGJvYXJkIERULiBUaGUgTUFDIGFkZHJlc3MgY2FuIGJlIGZ1c2VkIGluIEJTRUMg
T1RQIGZ1c2VzIGFuZCB1c2VkIHRvIHNldAo+Pj4gdXAgTUFDIGFkZHJlc3MgZm9yIGJvdGggZXRo
ZXJuZXQgTUFDcyBvbiB0aGlzIGJvYXJkLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IE1hcmVrIFZh
c3V0IDxtYXJleEBkZW54LmRlPgo+Pj4gLS0tCj4+PiBDYzogQWxleGFuZHJlIFRvcmd1ZSA8YWxl
eGFuZHJlLnRvcmd1ZUBmb3NzLnN0LmNvbT4KPj4+IENjOiBDaHJpc3RvcGhlIFJvdWxsaWVyIDxj
aHJpc3RvcGhlLnJvdWxsaWVyQGZvc3Muc3QuY29tPgo+Pj4gQ2M6IENvbm9yIERvb2xleSA8Y29u
b3IrZHRAa2VybmVsLm9yZz4KPj4+IENjOiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprK2R0QGtl
cm5lbC5vcmc+Cj4+PiBDYzogTWF4aW1lIENvcXVlbGluIDxtY29xdWVsaW4uc3RtMzJAZ21haWwu
Y29tPgo+Pj4gQ2M6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Cj4+PiBDYzogZGV2aWNl
dHJlZUB2Z2VyLmtlcm5lbC5vcmcKPj4+IENjOiBrZXJuZWxAZGgtZWxlY3Ryb25pY3MuY29tCj4+
PiBDYzogbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCj4+PiBDYzogbGludXgt
c3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQo+Pj4gLS0tCj4+PiDCoCBhcmNoL2Fy
bS9ib290L2R0cy9zdC9zdG0zMm1wMTM1Zi1kaGNvci1kaHNiYy5kdHMgfCA0ICsrKysKPj4+IMKg
IDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKPj4+Cj4+Cj4+Cj4+IE15IGJvdCBmb3Vu
ZCBuZXcgRFRCIHdhcm5pbmdzIG9uIHRoZSAuZHRzIGZpbGVzIGFkZGVkIG9yIGNoYW5nZWQgaW4g
dGhpcwo+PiBzZXJpZXMuCj4+Cj4+IFNvbWUgd2FybmluZ3MgbWF5IGJlIGZyb20gYW4gZXhpc3Rp
bmcgU29DIC5kdHNpLiBPciBwZXJoYXBzIHRoZSB3YXJuaW5ncwo+PiBhcmUgZml4ZWQgYnkgYW5v
dGhlciBzZXJpZXMuIFVsdGltYXRlbHksIGl0IGlzIHVwIHRvIHRoZSBwbGF0Zm9ybQo+PiBtYWlu
dGFpbmVyIHdoZXRoZXIgdGhlc2Ugd2FybmluZ3MgYXJlIGFjY2VwdGFibGUgb3Igbm90LiBObyBu
ZWVkIHRvIHJlcGx5Cj4+IHVubGVzcyB0aGUgcGxhdGZvcm0gbWFpbnRhaW5lciBoYXMgY29tbWVu
dHMuCj4+Cj4+IElmIHlvdSBhbHJlYWR5IHJhbiBEVCBjaGVja3MgYW5kIGRpZG4ndCBzZWUgdGhl
c2UgZXJyb3IocyksIHRoZW4KPj4gbWFrZSBzdXJlIGR0LXNjaGVtYSBpcyB1cCB0byBkYXRlOgo+
Pgo+PiDCoMKgIHBpcDMgaW5zdGFsbCBkdHNjaGVtYSAtLXVwZ3JhZGUKPj4KPj4KPj4gTmV3IHdh
cm5pbmdzIHJ1bm5pbmcgJ21ha2UgQ0hFQ0tfRFRCUz15IAo+PiBzdC9zdG0zMm1wMTM1Zi1kaGNv
ci1kaHNiYy5kdGInIGZvciAyMDI0MDYyOTE3MTEwMC4yMDI4NS0xLW1hcmV4QGRlbnguZGU6Cj4+
Cj4+IGFyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0bTMybXAxMzVmLWRoY29yLWRoc2JjLmR0YjogZXRo
ZXJuZXRANTgwMGEwMDA6IAo+PiBVbmV2YWx1YXRlZCBwcm9wZXJ0aWVzIGFyZSBub3QgYWxsb3dl
ZCAoJ2ludGVycnVwdC1uYW1lcycsIAo+PiAnaW50ZXJydXB0cy1leHRlbmRlZCcsICdtZGlvJywg
J252bWVtLWNlbGwtbmFtZXMnLCAnbnZtZW0tY2VsbHMnLCAKPj4gJ3BoeS1oYW5kbGUnLCAncGh5
LW1vZGUnLCAnc25wcyxheGktY29uZmlnJywgJ3NucHMsbWl4ZWQtYnVyc3QnLCAKPj4gJ3NucHMs
cGJsJywgJ3NucHMsdHNvJywgJ3N0bW1hYy1heGktY29uZmlnJyB3ZXJlIHVuZXhwZWN0ZWQpCj4+
IMKgwqDCoMKgZnJvbSBzY2hlbWEgJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9u
ZXQvc3RtMzItZHdtYWMueWFtbCMKPj4gYXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJtcDEzNWYt
ZGhjb3ItZGhzYmMuZHRiOiBldGhlcm5ldEA1ODAwZTAwMDogCj4+IFVuZXZhbHVhdGVkIHByb3Bl
cnRpZXMgYXJlIG5vdCBhbGxvd2VkICgnaW50ZXJydXB0LW5hbWVzJywgCj4+ICdpbnRlcnJ1cHRz
LWV4dGVuZGVkJywgJ21kaW8nLCAnbnZtZW0tY2VsbC1uYW1lcycsICdudm1lbS1jZWxscycsIAo+
PiAncGh5LWhhbmRsZScsICdwaHktbW9kZScsICdzbnBzLGF4aS1jb25maWcnLCAnc25wcyxtaXhl
ZC1idXJzdCcsIAo+PiAnc25wcyxwYmwnLCAnc25wcyx0c28nLCAnc3RtbWFjLWF4aS1jb25maWcn
IHdlcmUgdW5leHBlY3RlZCkKPj4gwqDCoMKgwqBmcm9tIHNjaGVtYSAkaWQ6IGh0dHA6Ly9kZXZp
Y2V0cmVlLm9yZy9zY2hlbWFzL25ldC9zdG0zMi1kd21hYy55YW1sIwo+IAo+IEkgY2FuJ3Qgc2Vl
bSB0byBiZSBhYmxlIHRvIHJlcHJvZHVjZSBpdCBsb2NhbGx5ICwgZXZlbiB3aXRoIAo+IGR0c2No
ZW1hL21hc3RlciB1cGRhdGVkIHJpZ2h0IG5vdyAuCj4gCj4gTG9va2luZyBhdCB0aGUgYmluZGlu
Z3MsIG5ldC9zdG0zMi1kd21hYy55YW1sIGRvZXMgaGF2ZSBhbGxvZi1yZWYgdG8gCj4gc25wcyxk
d21hYy55YW1sIHdoaWNoIGhhcyBhbGxvZi1yZWYgdG8gZXRoZXJuZXQtY29udHJvbGxlci55YW1s
ICwgd2hpY2ggCj4gZG9lcyBsaXN0IHRoZSBudm1lbS1jZWxscy9udm1lbS1jZWxsLW5hbWVzIHBy
b3BlcnRpZXMgLgo+IAo+IFdoYXQgYW0gSSBtaXNzaW5nIGhlcmUgPwoKSSdtIGFsc28gbm90IGFi
bGUgdG8gcmVwcm9kdWNlIHRoaXMgaXNzdWUgZXZlbiBhZnRlciB1cGRhdGVkIHRoZSBzY2hlbWFz
LgpSb2IsIGNhbiB5b3UgcGxlYXNlIGRvdWJsZSBjaGVjayBvbiB5b3VyIHNpZGUgPwpNYXJlaywg
SSB0aGluayBJJ2xsIHRha2UgdGhpcyBwYXRjaCBsYXRlciBmb3IgdjYuMTIgY3ljbGUuCgpyZWdh
cmRzCkFsZXgKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlz
dGluZm8vbGludXgtc3RtMzIK
