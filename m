Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E83277B9B78
	for <lists+linux-stm32@lfdr.de>; Thu,  5 Oct 2023 09:45:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 97C38C6C832;
	Thu,  5 Oct 2023 07:45:10 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DC0F5C6C831
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Oct 2023 07:45:09 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 394NxwVc016445; Thu, 5 Oct 2023 09:44:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=uPeJe/ujiHjKK9NWuZX2rXwLdsc4nIHY6JTK7vpJxH4=; b=pX
 q0UHCc1ado2QV7WtnmdeB804HXe3FijBSoA9psMDkYnF0uIh0WKNYRPoWZIB+rsh
 gReFnz5YcLFnD6seqZ1iaNsRJsypo6VayiyWgAw49j0rMEOz/lF7ws/vAag7QQYd
 oT68cFTQ8EQPTpkb14dR3TU1g4bS9zRIwJYYUE1EFMJPI+pUDhIH88dUyHiSC2TZ
 EJUsOHYuDlLMspH1Fx3gkPDTAWzvCcXJNwlmGf6n21I7hwX4CR+mMO3/djlZZ9ad
 OC7oVV1Fujd0O48ZVoWOidNBEDF1cHl6v6l1y4F93HSueEETu7Uon+Oud4tChzC7
 mJiJhrVj2VzEZI1GnBPg==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3thj7e9ehw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Oct 2023 09:44:50 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4D859100053;
 Thu,  5 Oct 2023 09:44:49 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 406DD21ED32;
 Thu,  5 Oct 2023 09:44:49 +0200 (CEST)
Received: from [10.201.20.120] (10.201.20.120) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 5 Oct
 2023 09:44:48 +0200
Message-ID: <866fd143-a290-63ec-103c-b49368d9dc03@foss.st.com>
Date: Thu, 5 Oct 2023 09:44:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To: Adam Ford <aford173@gmail.com>
References: <20231004091552.3531659-1-hugues.fruchet@foss.st.com>
 <20231004091552.3531659-4-hugues.fruchet@foss.st.com>
 <CAHCN7xKrriTPaRMJ-r86cSgFDUUP1At08imLBr_zEP0g3fga_g@mail.gmail.com>
From: Hugues FRUCHET <hugues.fruchet@foss.st.com>
In-Reply-To: <CAHCN7xKrriTPaRMJ-r86cSgFDUUP1At08imLBr_zEP0g3fga_g@mail.gmail.com>
X-Originating-IP: [10.201.20.120]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-05_04,2023-10-02_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>, linux-kernel@vger.kernel.org,
 Hans Verkuil <hverkuil@xs4all.nl>, linux-rockchip@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 3/7] dt-bindings: media: Document
 STM32MP25 VENC video encoder
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

SGkgQWRhbSwKClRoYW5rcyBmb3IgcmV2aWV3LAoKT24gMTAvNS8yMyAwMTo0MSwgQWRhbSBGb3Jk
IHdyb3RlOgo+IE9uIFdlZCwgT2N0IDQsIDIwMjMgYXQgNDoxNuKAr0FNIEh1Z3VlcyBGcnVjaGV0
Cj4gPGh1Z3Vlcy5mcnVjaGV0QGZvc3Muc3QuY29tPiB3cm90ZToKPj4KPj4gQWRkIFNUTTMyTVAy
NSBWRU5DIHZpZGVvIGVuY29kZXIgYmluZGluZ3MuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEh1Z3Vl
cyBGcnVjaGV0IDxodWd1ZXMuZnJ1Y2hldEBmb3NzLnN0LmNvbT4KPj4gLS0tCj4+ICAgLi4uL2Jp
bmRpbmdzL21lZGlhL3N0LHN0bTMybXAyNS12ZW5jLnlhbWwgICAgIHwgNTYgKysrKysrKysrKysr
KysrKysrKwo+PiAgIDEgZmlsZSBjaGFuZ2VkLCA1NiBpbnNlcnRpb25zKCspCj4+ICAgY3JlYXRl
IG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9zdCxz
dG0zMm1wMjUtdmVuYy55YW1sCj4+Cj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvbWVkaWEvc3Qsc3RtMzJtcDI1LXZlbmMueWFtbCBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9zdCxzdG0zMm1wMjUtdmVuYy55YW1sCj4+IG5l
dyBmaWxlIG1vZGUgMTAwNjQ0Cj4+IGluZGV4IDAwMDAwMDAwMDAwMC4uYzY5ZTBhMzRmNjc1Cj4+
IC0tLSAvZGV2L251bGwKPj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L21lZGlhL3N0LHN0bTMybXAyNS12ZW5jLnlhbWwKPj4gQEAgLTAsMCArMSw1NiBAQAo+PiArIyBT
UERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAgT1IgQlNELTItQ2xhdXNlKQo+PiArCj4+
ICslWUFNTCAxLjIKPj4gKy0tLQo+PiArJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1h
cy9tZWRpYS9zdCxzdG0zMm1wMjUtdmVuYy55YW1sIwo+IAo+IENhbiB0aGlzIGR0LWJpbmRpbmcg
YmUgbWFkZSBtb3JlIGdlbmVyaWMsIGxpa2Ugc29tZXRoaW5nIGxpa2UKPiBoYW50cm8taDEgb3Ig
VkM4MDAwTmFub0U/Cj4gCj4gSSB0aGluayB0aGVyZSB3aWxsIGJlIG1vcmUgYm9hcmRzIHRoYXQg
bWF5IGluY29ycG9yYXRlIHRoZSBIYW50cm8tSDEKPiBvciBhIFZDODAwMCBpbiB0aGUgZnV0dXJl
LCBiZWNhdXNlIEkgZG9uJ3QgdGhpbmsgdGhpcyBJUCBpcyB1bmlxdWUgdG8KPiB0aGUgU1RNMzJN
UDI1LgoKVGhpcyBpcyBhbHJlYWR5IHRoZSBjYXNlLCBjaGVjayB2YXJpYW50cyBpbiBoYW50cm9f
ZHJ2LmMuClNldmVyYWwgU29DcyBhcmUgc2hhcmluZyB0aGlzIElQIGJ1dCBlYWNoIElQIHNsaWdo
dGx5IGRpZmZlcnMgYmVjYXVzZSBvZgpzdXBwb3J0ZWQgcmVzb2x1dGlvbiwgY29kZWMsIHByZXBy
b2Nlc3NpbmcgZmVhdHVyZXMsIC4uLgpUaGVyZSBhcmUgYWxzbyBzb21lIGRpZmZlcmVuY2VzIG9u
IGhvdyBjbG9jaywgaW50ZXJydXB0LCByZXNldCBhcmUgCmhhcmR3YXJlIG1hcHBlZDogc2hhcmVk
IG9yIG5vdCBieSBkZWNvZGVyIGFuZCBlbmNvZGVyIGZvciBleC4KCj4gCj4gYWRhbQo+IAo+PiAr
JHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjCj4+
ICsKPj4gK3RpdGxlOiBTVE1pY3JvZWxlY3Ryb25pY3MgU1RNMzJNUDI1IFZFTkMgdmlkZW8gZW5j
b2Rlcgo+PiArCj4+ICttYWludGFpbmVyczoKPj4gKyAgLSBIdWd1ZXMgRnJ1Y2hldCA8aHVndWVz
LmZydWNoZXRAZm9zcy5zdC5jb20+Cj4+ICsKPj4gK2Rlc2NyaXB0aW9uOgo+PiArICBUaGUgU1RN
aWNyb2VsZWN0cm9uaWNzIFNUTTMyTVAyNSBTT0NzIGVtYmVkcyBhIFZFTkMgdmlkZW8gaGFyZHdh
cmUgZW5jb2Rlcgo+PiArICBwZXJpcGhlcmFsIGJhc2VkIG9uIFZlcmlzaWxpY29uIFZDODAwME5h
bm9FIElQIChmb3JtZXIgSGFudHJvIEgxKS4KPj4gKwo+PiArcHJvcGVydGllczoKPj4gKyAgY29t
cGF0aWJsZToKPj4gKyAgICBjb25zdDogc3Qsc3RtMzJtcDI1LXZlbmMKPj4gKwo+PiArICByZWc6
Cj4+ICsgICAgbWF4SXRlbXM6IDEKPj4gKwo+PiArICBpbnRlcnJ1cHRzOgo+PiArICAgIG1heEl0
ZW1zOiAxCj4+ICsKPj4gKyAgaW50ZXJydXB0LW5hbWVzOgo+PiArICAgIG1heEl0ZW1zOiAxCj4+
ICsKPj4gKyAgY2xvY2tzOgo+PiArICAgIG1heEl0ZW1zOiAxCj4+ICsKPj4gKyAgY2xvY2stbmFt
ZXM6Cj4+ICsgICAgbWF4SXRlbXM6IDEKPj4gKwo+PiArcmVxdWlyZWQ6Cj4+ICsgIC0gY29tcGF0
aWJsZQo+PiArICAtIHJlZwo+PiArICAtIGludGVycnVwdHMKPj4gKyAgLSBpbnRlcnJ1cHQtbmFt
ZXMKPj4gKyAgLSBjbG9ja3MKPj4gKyAgLSBjbG9jay1uYW1lcwo+PiArCj4+ICthZGRpdGlvbmFs
UHJvcGVydGllczogZmFsc2UKPj4gKwo+PiArZXhhbXBsZXM6Cj4+ICsgIC0gfAo+PiArICAgICNp
bmNsdWRlIDxkdC1iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9hcm0tZ2ljLmg+Cj4+ICsg
ICAgdmVuYzogdmVuY0A1ODBlMDAwMCB7Cj4+ICsgICAgICAgIGNvbXBhdGlibGUgPSAic3Qsc3Rt
MzJtcDI1LXZlbmMiOwo+PiArICAgICAgICByZWcgPSA8MHg1ODBlMDAwMCAweDgwMD47Cj4+ICsg
ICAgICAgIGludGVycnVwdHMgPSA8R0lDX1NQSSAxNjcgSVJRX1RZUEVfTEVWRUxfSElHSD47Cj4+
ICsgICAgICAgIGludGVycnVwdC1uYW1lcyA9ICJ2ZW5jIjsKPiAKPiAKPiBJcyB0aGUgaW50ZXJy
dXB0LW5hbWVzIG5lZWRlZCBpZiB0aGVyZSBpcyBvbmx5IG9uZT8KPiAKCk5vdCByZWFsbHksIGNv
dWxkIGJlIGRyb3BwZWQuCgo+PiArICAgICAgICBjbG9ja3MgPSA8JmNrX2ljbl9wX3ZlbmM+Owo+
PiArICAgICAgICBjbG9jay1uYW1lcyA9ICJ2ZW5jLWNsayI7Cj4gCj4gU2FtZSB0aGluZyBmb3Ig
dGhlIGNsb2NrLiAgaWYgdGhlcmUgaXMgb25seSBvbmUgY2xvY2ssIGRvZSB0aGV5IG5lZWQgbmFt
ZXM/Cj4gCk5vdCByZWFsbHksIGNvdWxkIGJlIGRyb3BwZWQuCgo+IGFkYW0KPj4gKyAgICB9Owo+
PiAtLQo+PiAyLjI1LjEKPj4KCkJSLApIdWd1ZXMuCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0z
MkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
