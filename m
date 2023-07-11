Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E62CD74F06D
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Jul 2023 15:40:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AE295C6B44C;
	Tue, 11 Jul 2023 13:40:24 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E146BC65E56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Jul 2023 13:40:23 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id A0CE1867FA;
 Tue, 11 Jul 2023 15:40:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1689082823;
 bh=tUDBxlDTmv0syY4vfDaQSccp8l4ILPwe/UXoRMvbWng=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=rQuIxI+INqlEN0RsfDrwZlvlu499xj3LAxFra/lxZ/mU46DbX0fqWn0ZLJB6/1sYU
 dQ7ovXM4uh+TPC60LL+2JwgZINp4SR0hLP0yQLbiLGIx0I3FKiX13P14WxpQmfLz2B
 /ddxBjLfOtN8jKG6E70eGfwE81zunny/MQtieRssU6sdIrBX0ZNsnLyG3F3KGOt9Tv
 LDIa9ZSRKMWoXCNs8fGfpVgvlwYhHTQ9MMaNitsZt4hIx9/dKDi6n5cYWgF8Gf1LBU
 DPbwGMSqPmJGvFxthjkL+hqw+YDDFeuUYTPAMaCPJrJDrNLaUwNrU5Rjd8Rg9F8lkd
 tsT94t7JA4DHw==
Message-ID: <c260edf6-d0a9-4108-5a41-ba501f7cf308@denx.de>
Date: Tue, 11 Jul 2023 15:40:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 linux-arm-kernel@lists.infradead.org
References: <20230518011246.438097-1-marex@denx.de>
 <20230518011246.438097-4-marex@denx.de>
 <42b1d80b-9cbc-16e2-73a4-ee8b67f5cb2b@denx.de>
 <9e15a84e-33f7-3654-6ad2-66328c120ee6@foss.st.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <9e15a84e-33f7-3654-6ad2-66328c120ee6@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Richard Cochran <richardcochran@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, kernel@dh-electronics.com
Subject: Re: [Linux-stm32] [PATCH 4/5] ARM: dts: stm32: Add missing detach
 mailbox for DHCOR SoM
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

T24gNy8xMS8yMyAxNTozNywgQWxleGFuZHJlIFRPUkdVRSB3cm90ZToKPiBIaSBNYXJlawo+IAo+
IE9uIDcvMTEvMjMgMDQ6MDUsIE1hcmVrIFZhc3V0IHdyb3RlOgo+PiBPbiA1LzE4LzIzIDAzOjEy
LCBNYXJlayBWYXN1dCB3cm90ZToKPj4+IEFkZCBtaXNzaW5nICJkZXRhY2giIG1haWxib3ggdG8g
dGhpcyBib2FyZCB0byBwZXJtaXQgdGhlIENQVSB0byBpbmZvcm0KPj4+IHRoZSByZW1vdGUgcHJv
Y2Vzc29yIG9uIGEgZGV0YWNoLiBUaGlzIHNpZ25hbCBhbGxvd3MgdGhlIHJlbW90ZSAKPj4+IHBy
b2Nlc3Nvcgo+Pj4gZmlybXdhcmUgdG8gc3RvcCBJUEMgY29tbXVuaWNhdGlvbiBhbmQgdG8gcmVp
bml0aWFsaXplIHRoZSByZXNvdXJjZXMgZm9yCj4+PiBhIHJlLWF0dGFjaC4KPj4+Cj4+PiBXaXRo
b3V0IHRoaXMgbWFpbGJveCwgZGV0YWNoIGlzIG5vdCBwb3NzaWJsZSBhbmQga2VybmVsIGxvZyBj
b250YWlucyB0aGUKPj4+IGZvbGxvd2luZyB3YXJuaW5nIHRvLCBzbyBtYWtlIHN1cmUgYWxsIHRo
ZSBTVE0zMk1QMTV4eCBwbGF0Zm9ybSBEVHMgYXJlCj4+PiBpbiBzeW5jIHJlZ2FyZGluZyB0aGUg
bWFpbGJveGVzIHRvIGZpeCB0aGUgZGV0YWNoIGlzc3VlIGFuZCB0aGUgd2FybmluZzoKPj4+ICIK
Pj4+IHN0bTMyLXJwcm9jIDEwMDAwMDAwLm00OiBtYm94X3JlcXVlc3RfY2hhbm5lbF9ieW5hbWUo
KSBjb3VsZCBub3QgCj4+PiBsb2NhdGUgY2hhbm5lbCBuYW1lZCAiZGV0YWNoIgo+Pj4gIgo+Pj4K
Pj4+IEZpeGVzOiA2MjU3ZGZjMWM0MTIgKCJBUk06IGR0czogc3RtMzI6IEFkZCBjb3Byb2Nlc3Nv
ciBkZXRhY2ggbWJveCBvbiAKPj4+IHN0bTMybXAxNXgtZGt4IGJvYXJkcyIpCj4+PiBTaWduZWQt
b2ZmLWJ5OiBNYXJlayBWYXN1dCA8bWFyZXhAZGVueC5kZT4KPj4+IC0tLQo+Pj4gQ2M6IEFsZXhh
bmRyZSBUb3JndWUgPGFsZXhhbmRyZS50b3JndWVAZm9zcy5zdC5jb20+Cj4+PiBDYzogQ29ub3Ig
RG9vbGV5IDxjb25vcitkdEBrZXJuZWwub3JnPgo+Pj4gQ2M6IEtyenlzenRvZiBLb3psb3dza2kg
PGtyenlzenRvZi5rb3psb3dza2krZHRAbGluYXJvLm9yZz4KPj4+IENjOiBNYXhpbWUgQ29xdWVs
aW4gPG1jb3F1ZWxpbi5zdG0zMkBnbWFpbC5jb20+Cj4+PiBDYzogUmljaGFyZCBDb2NocmFuIDxy
aWNoYXJkY29jaHJhbkBnbWFpbC5jb20+Cj4+PiBDYzogUm9iIEhlcnJpbmcgPHJvYmgrZHRAa2Vy
bmVsLm9yZz4KPj4+IENjOiBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZwo+Pj4gQ2M6IGtlcm5l
bEBkaC1lbGVjdHJvbmljcy5jb20KPj4+IENjOiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJh
ZGVhZC5vcmcKPj4+IENjOiBsaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
Cj4+PiAtLS0KPj4+IMKgIGFyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNXh4LWRoY29yLXNvbS5k
dHNpIHwgNCArKy0tCj4+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9zdG0zMm1w
MTV4eC1kaGNvci1zb20uZHRzaSAKPj4+IGIvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1eHgt
ZGhjb3Itc29tLmR0c2kKPj4+IGluZGV4IDg2NDk2MDM4N2U2MzQuLmYwMzUxZjU5OWE1MDggMTAw
NjQ0Cj4+PiAtLS0gYS9hcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTV4eC1kaGNvci1zb20uZHRz
aQo+Pj4gKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1eHgtZGhjb3Itc29tLmR0c2kK
Pj4+IEBAIC0yMjcsOCArMjI3LDggQEAgJml3ZGcyIHsKPj4+IMKgICZtNF9ycHJvYyB7Cj4+PiDC
oMKgwqDCoMKgIG1lbW9yeS1yZWdpb24gPSA8JnJldHJhbT4sIDwmbWN1cmFtPiwgPCZtY3VyYW0y
PiwgPCZ2ZGV2MHZyaW5nMD4sCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA8JnZkZXYw
dnJpbmcxPiwgPCZ2ZGV2MGJ1ZmZlcj47Cj4+PiAtwqDCoMKgIG1ib3hlcyA9IDwmaXBjYyAwPiwg
PCZpcGNjIDE+LCA8JmlwY2MgMj47Cj4+PiAtwqDCoMKgIG1ib3gtbmFtZXMgPSAidnEwIiwgInZx
MSIsICJzaHV0ZG93biI7Cj4+PiArwqDCoMKgIG1ib3hlcyA9IDwmaXBjYyAwPiwgPCZpcGNjIDE+
LCA8JmlwY2MgMj4sIDwmaXBjYyAzPjsKPj4+ICvCoMKgwqAgbWJveC1uYW1lcyA9ICJ2cTAiLCAi
dnExIiwgInNodXRkb3duIiwgImRldGFjaCI7Cj4+PiDCoMKgwqDCoMKgIGludGVycnVwdC1wYXJl
bnQgPSA8JmV4dGk+Owo+Pj4gwqDCoMKgwqDCoCBpbnRlcnJ1cHRzID0gPDY4IDE+Owo+Pj4gwqDC
oMKgwqDCoCBzdGF0dXMgPSAib2theSI7Cj4+Cj4+IElzIGFueXRoaW5nIGJsb2NraW5nIDEvNS4u
NC81IChpLmUuIHRoZSBkdXBsaWNhdGlvbiBpbiBlYWNoIGJvYXJkIERUKSAKPj4gcGF0Y2hlcyBm
cm9tIGJlaW5nIGFwcGxpZWQgPwo+IAo+IE5vdGhpbmcuIEkgd2FzIGp1c3Qgd2FpdGluZyB0byBk
aXNjdXNzIHdpdGggeW91IGFib3V0IHBhdGNoIDUgYXQgUHJhZ3VlIAo+IHRoZW4gbWVyZ2Ugd2lu
ZG93cy4KPiAKPiBTbyBwYXRjaCAxIHRvIDQgYXBwbGllZCBvbiBzdG0zMi1uZXh0LgoKVGhhbmsg
eW91Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXN0bTMyCg==
