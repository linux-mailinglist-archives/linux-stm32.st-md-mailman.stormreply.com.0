Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A78360D2A
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Apr 2021 16:59:43 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B931FC57B79;
	Thu, 15 Apr 2021 14:59:42 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 27984C36B25
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Apr 2021 14:59:41 +0000 (UTC)
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id C55F181FE1;
 Thu, 15 Apr 2021 16:59:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1618498780;
 bh=Kw07LkJdKop/yJQQqAUybaOom8omiDfjimVgY6INlKM=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=qG3vJnacjJH2T6/LHSUKQqKJUBWrcEN7r6NhcGCSdBtN4nss3tWZ0nO/Ises27Xvc
 VJGziRkn7XGX6HeJNFZ3NKxgJfYbo1qxsVRITxF5utVsu0V855wi9W/o5nOiAsG4j4
 LzmcixCWz41r3/bCwgBpZpWa7aJMXgqoXHnAz/0L093+4TBflUjIMWQCZR0RFKlVXg
 k47GEkzZmKdFN1i6BrfQukuubfOoZ8NLj6HD4D23S0QhGYD27jXWwe+QQ52WES1B9h
 aS32TR1XAlYbdiafXGiMDKeW4MksrP+jd/DapR7g7HXa8+g0bzZaaTBKJcCvdhW4+c
 +FMQpDAlr3Yfg==
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>, arnd@arndb.de,
 robh+dt@kernel.org, jagan@amarulasolutions.com,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Marcin Sloniewski <marcin.sloniewski@gmail.com>,
 Ahmad Fatoum <a.fatoum@pengutronix.de>
References: <20210415101037.1465-1-alexandre.torgue@foss.st.com>
 <20210415101037.1465-12-alexandre.torgue@foss.st.com>
 <3b39908b-a263-a5d4-f6ac-ac30ffb06269@denx.de>
 <36e9f0df-dfdb-e2f5-3d6e-ac32a1b8156e@foss.st.com>
 <fa3885df-8977-9540-f2af-d4095f519483@denx.de>
 <3961c9ae-41cc-5a15-2704-ffc0832f0fe8@foss.st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <57a7f4bf-42e9-56fb-e898-2c5749f53c60@denx.de>
Date: Thu, 15 Apr 2021 16:59:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <3961c9ae-41cc-5a15-2704-ffc0832f0fe8@foss.st.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at phobos.denx.de
X-Virus-Status: Clean
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kuba@kernel.org,
 Lee Jones <lee.jones@linaro.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 11/13] ARM: dts: stm32: fix LTDC port node
 on STM32 MCU ad MPU
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

T24gNC8xNS8yMSA0OjM1IFBNLCBBbGV4YW5kcmUgVE9SR1VFIHdyb3RlOgo+IAo+IAo+IE9uIDQv
MTUvMjEgNDozMCBQTSwgTWFyZWsgVmFzdXQgd3JvdGU6Cj4+IE9uIDQvMTUvMjEgMzozNCBQTSwg
QWxleGFuZHJlIFRPUkdVRSB3cm90ZToKPj4+IEhpIE1hcmVrCj4+Cj4+IEhlbGxvIEFsZXhhbmRy
ZSwKPj4KPj4+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNTdjLWRr
Mi5kdHMgCj4+Pj4+IGIvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1N2MtZGsyLmR0cwo+Pj4+
PiBpbmRleCAyYmM5MmVmM2FlYjkuLjE5ZWY0NzVhNDhmYyAxMDA2NDQKPj4+Pj4gLS0tIGEvYXJj
aC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1N2MtZGsyLmR0cwo+Pj4+PiArKysgYi9hcmNoL2FybS9i
b290L2R0cy9zdG0zMm1wMTU3Yy1kazIuZHRzCj4+Pj4+IEBAIC04Miw5ICs4MiwxNSBAQAo+Pj4+
PiDCoCB9Owo+Pj4+PiDCoCAmbHRkYyB7Cj4+Pj4+IC3CoMKgwqAgc3RhdHVzID0gIm9rYXkiOwo+
Pj4+PiAtCj4+Pj4+IMKgwqDCoMKgwqAgcG9ydCB7Cj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCAjYWRk
cmVzcy1jZWxscyA9IDwxPjsKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgICNzaXplLWNlbGxzID0gPDA+
Owo+Pj4+PiArCj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBsdGRjX2VwMF9vdXQ6IGVuZHBvaW50QDAg
ewo+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZWcgPSA8MD47Cj4+Pj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHJlbW90ZS1lbmRwb2ludCA9IDwmc2lpOTAyMl9pbj47Cj4+Pj4+ICvC
oMKgwqDCoMKgwqDCoCB9Owo+Pj4+PiArCj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBsdGRjX2Vw
MV9vdXQ6IGVuZHBvaW50QDEgewo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZWcg
PSA8MT47Cj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJlbW90ZS1lbmRwb2ludCA9
IDwmZHNpX2luPjsKPj4+Pgo+Pj4+IFsuLi5dCj4+Pj4KPj4+Pj4gZGlmZiAtLWdpdCBhL2FyY2gv
YXJtL2Jvb3QvZHRzL3N0bTMybXAxNXh4LWRoY29yLWF2ZW5nZXI5Ni5kdHNpIAo+Pj4+PiBiL2Fy
Y2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNXh4LWRoY29yLWF2ZW5nZXI5Ni5kdHNpCj4+Pj4+IGlu
ZGV4IDY0ZGNhNWI3Zjc0OC4uZTdmMTA5NzVjYWNmIDEwMDY0NAo+Pj4+PiAtLS0gYS9hcmNoL2Fy
bS9ib290L2R0cy9zdG0zMm1wMTV4eC1kaGNvci1hdmVuZ2VyOTYuZHRzaQo+Pj4+PiArKysgYi9h
cmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTV4eC1kaGNvci1hdmVuZ2VyOTYuZHRzaQo+Pj4+PiBA
QCAtMjc3LDExICsyNzcsNyBAQAo+Pj4+PiDCoMKgwqDCoMKgIHN0YXR1cyA9ICJva2F5IjsKPj4+
Pj4gwqDCoMKgwqDCoCBwb3J0IHsKPj4+Pj4gLcKgwqDCoMKgwqDCoMKgICNhZGRyZXNzLWNlbGxz
ID0gPDE+Owo+Pj4+PiAtwqDCoMKgwqDCoMKgwqAgI3NpemUtY2VsbHMgPSA8MD47Cj4+Pj4+IC0K
Pj4+Pj4gLcKgwqDCoMKgwqDCoMKgIGx0ZGNfZXAwX291dDogZW5kcG9pbnRAMCB7Cj4+Pj4+IC3C
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJlZyA9IDwwPjsKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGx0
ZGNfZXAwX291dDogZW5kcG9pbnQgewo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBy
ZW1vdGUtZW5kcG9pbnQgPSA8JmFkdjc1MTNfaW4+Owo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAg
fTsKPj4+Pj4gwqDCoMKgwqDCoCB9Owo+Pj4+Cj4+Pj4gSSB0aGluayB0aGlzIGlzIHdyb25nLCB0
aGUgQVY5NiBjYW4gaGF2ZSB0d28gZGlzcGxheXMgY29ubmVjdGVkIHRvIAo+Pj4+IHR3byBwb3J0
cyBvZiB0aGUgTFREQywganVzdCBsaWtlIERLMiBmb3IgZXhhbXBsZS4KPj4+Cj4+PiBBcyBmb3Ig
ZGsyIGFkZHJlc3Mvc2l6ZSBjZWxscyBhcmUgYWRkZWQgb25seSBpZiB0aGVyZSBhcmUgMiAKPj4+
IGVuZHBvaW50cy4gSXQgaXMgZm9yIHRoaXMgcmVhc29uIEkgbW92ZWQgZW5kcG9pbnQwIGRlZmlu
aXRpb24gZnJvbSAKPj4+IHN0bTMybXAxNXh4LWRreCB0byBzdG0zMm1wMTUxYS1kazEuZHRzIChk
azEgaGFzIG9ubHkgb25lIGVuZHBvaW50KS4KPj4+Cj4+PiBIZXJlIGl0J3MgdGhlIHNhbWUsIGlm
IHlvdSBoYXZlIHNlY29uZCBlbmRwb2ludCB0aGVuIGFkcmVzcy9zaXplIHdpbGwgCj4+PiBoYXZl
IHRvIGJlIGFkZGVkLgo+Pgo+PiBUaGF0J3MgYSBiaXQgcHJvYmxlbWF0aWMuIENvbnNpZGVyIGVp
dGhlciB0aGUgdXNlIGNhc2Ugb2YgRFRPIHdoaWNoIAo+PiBhZGRzIHRoZSBvdGhlciBkaXNwbGF5
LCBvciBldmVuIGEgY3VzdG9tIGJvYXJkIERUUy4gV2l0aG91dCB5b3VyIAo+PiBwYXRjaCwgdGhp
cyB3b3JrczoKPj4KPj4gYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1eHgtZGhjb3ItYXZlbmdl
cjk2LmR0c2kKPj4gJmx0ZGMgewo+PiDCoMKgIC4uLgo+PiDCoMKgIHBvcnRzIHsKPj4gwqDCoMKg
wqAgbHRkY19lcDBfb3V0OiBlbmRwb2ludEAwIHsKPj4gwqDCoMKgwqDCoMKgIHJlbW90ZS1lbmRw
b2ludCA9IDwmYWR2NzUxM19pbj47Cj4+IMKgwqDCoMKgIH07Cj4+IMKgwqAgfTsKPj4gfTsKPj4K
Pj4gYm9hcmQtd2l0aC1kaXNwbGF5LmR0cyBvciBib2FyZC1vdmVybGF5LmR0cwo+PiAmbHRkYyB7
Cj4+IMKgwqAgcG9ydHMgewo+PiDCoMKgwqDCoCBlbmRwb2ludEAxIHsgLy8ganVzdCBhZGQgYW5v
dGhlciBlbmRwb2ludEAxLCBubyBwcm9ibGVtCj4+IMKgwqDCoMKgwqDCoCByZW1vdGUtZW5kcG9p
bnQgPSA8JmRpc3BsYXk+Owo+PiDCoMKgwqDCoCB9Owo+PiDCoMKgIH07Cj4+IH07Cj4+Cj4+IFdp
dGggeW91ciBwYXRjaCwgdGhlIERUUyB3b3VsZCBoYXZlIHRvIG1vZGlmeSB0aGUgImVuZHBvaW50
IiBub2RlIHRvIAo+PiBiZSAiZW5kcG9pbnRAMCIgcHJvYmFibHkgd2l0aCBhIHdob2xlIGxvdCBv
ZiAvZGV0ZWxlLW5vZGUvIGV0Yy4gbWFnaWMgCj4+IChEVE8gY2Fubm90IGRvIHRoYXQsIHNvIHRo
YXQncyBhIHByb2JsZW0sIGFuZCBJIGRvIHVzZSBEVE9zIG9uIEFWOTYgCj4+IGV4dGVuc2l2ZWx5
IGZvciB0aGUgdmFyaW91cyBleHBhbnNpb24gY2FyZHMpIGFuZCB0aGVuIGFkZCB0aGUgCj4+IGVu
ZHBvaW50QDEuIFRoYXQgYmVjb21lcyByZWFsIGNvbXBsaWNhdGVkIGluIGN1c3RvbSBib2FyZCBE
VCwgYW5kIAo+PiBpbXBvc3NpYmxlIHdpdGggRFRPLgo+IAo+IFllcyBJIGFncmVlIHRoYXQgaXQn
bGwgYmUgcHJvYmxlbWF0aWMuIFNvIG1heWJlIHNvIHNvbHV0aW9uIHdvdWxkIGJlIHRvIAo+IG5v
dCBkZXRlY3QgYSB3YXJuaW5nIGZvciB0aGUgaW5pdGlhbCBjYXNlIChvbmx5IG9uZSBlbmRwb2lu
dCB3aXRoIGEgcmVnKQoKVGhhdCBsb29rcyBPSy4gT3IgZXZlbiBiZXR0ZXIsIGlmIHRoZSBjaGVj
a2VyIHdhcm5lZCBvbmx5IG9uIElQcyB3aGljaCAKY2Fubm90IGhhdmUgbW9yZSB0aGFuIG9uZSBl
bmRwb2ludCwgYnV0IGhhdmUgZW5kcG9pbnRATiBpbiBEVCAod2hlcmUgTiAKaW4gMC4uK2luZikg
LiBPbiBJUHMgd2hpY2ggY2FuIGhhdmUgb25lIG9yIG1vcmUgZW5kcG9pbnRzLCB0aGUgd2Fybmlu
ZyAKc2hvdWxkIG5vdCBiZSBlbWl0dGVkLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
