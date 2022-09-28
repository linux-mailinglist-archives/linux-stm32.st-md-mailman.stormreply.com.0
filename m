Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BEE25ED71C
	for <lists+linux-stm32@lfdr.de>; Wed, 28 Sep 2022 10:08:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E10C4C63328;
	Wed, 28 Sep 2022 08:08:32 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3603FC63326
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Sep 2022 08:08:31 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28S7uYfm005840;
 Wed, 28 Sep 2022 10:08:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=810+0FE9DNFXHQHWMAgaBjT8j/31fvRA+j6/O3FTPQo=;
 b=JFEN1l62NQpWgKDSKorwFlI1srFrpngQ4n1oFmWdMsL0T5QJ6olJSGz6CHCPQMwjX6Eu
 p1M6F7DsxpRFYq7BXwX2dCkS/DcODwVmSrYHUk57mTwKzYEa8KZXTPgNGOgTi6Ovr67h
 FFAOyDUw2C6I0h52d4spMuWgjDcve4WpYNwtSP94CBxP+ST0R9VhPQAmr3D9/vz5xoSf
 Ni2k2XXjXqiIaeAwDOpYV5R+mvRKAe6LJwGRSEu+7m9VZIW/QIjYdUCR5uuHqIg55PO1
 Epbvy2S2bMNPLU2UJo8dhIPwFwMqZvSBwYl6ih8nIljoMdM4jphvr6YuLFBZ4QKtoUFf Bg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jsrsjqjrw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Sep 2022 10:08:09 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3E6EB10002A;
 Wed, 28 Sep 2022 10:08:07 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 31BB5214D19;
 Wed, 28 Sep 2022 10:08:07 +0200 (CEST)
Received: from [10.252.26.214] (10.75.127.46) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Wed, 28 Sep
 2022 10:08:06 +0200
Message-ID: <04cd498e-608d-e1dd-377a-18e27dee23be@foss.st.com>
Date: Wed, 28 Sep 2022 10:08:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, <linux-arm-kernel@lists.infradead.org>
References: <20220927005538.690997-1-marex@denx.de>
 <7420b97c-1421-03a5-dd47-044b5e1739f1@foss.st.com>
 <162ea4dd-ded9-2905-0e4b-71809c95fd78@denx.de>
From: Benjamin MUGNIER <benjamin.mugnier@foss.st.com>
In-Reply-To: <162ea4dd-ded9-2905-0e4b-71809c95fd78@denx.de>
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-28_03,2022-09-27_01,2022-06-22_01
Cc: devicetree@vger.kernel.org, Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: media: st,
 stmipid02: Convert the text bindings to YAML
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

SGkgTWFyZWssCgpPbiA5LzI3LzIyIDIwOjQ1LCBNYXJlayBWYXN1dCB3cm90ZToKPiBPbiA5LzI3
LzIyIDEzOjA2LCBCZW5qYW1pbiBNVUdOSUVSIHdyb3RlOgo+PiBIaSBNYXJlaywKPiAKPiBIaSwK
PiAKPj4gVGhhbmsgeW91IGZvciB5b3VyIHBhdGNoLgo+IAo+IFRoYW5rIHlvdSBmb3IgdGhlIHJl
dmlldy4KPiAKPiBbLi4uXQo+IAo+Pj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL21lZGlhL2kyYy9zdCxzdC1taXBpZDAyLnlhbWwKPj4+IEBAIC0wLDAgKzEsMTc1IEBA
Cj4+PiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBPUiBCU0QtMi1D
bGF1c2UpCj4+PiArJVlBTUwgMS4yCj4+PiArLS0tCj4+PiArJGlkOiBodHRwOi8vZGV2aWNldHJl
ZS5vcmcvc2NoZW1hcy9tZWRpYS9pMmMvc3Qsc3QtbWlwaWQwMi55YW1sIwo+Pj4gKyRzY2hlbWE6
IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIwo+Pj4gKwo+Pj4g
K3RpdGxlOiBTVE1pY3JvZWxlY3Ryb25pY3MgTUlQSUQwMiBDU0ktMiB0byBQQVJBTExFTCBicmlk
Z2UKPj4+ICsKPj4+ICttYWludGFpbmVyczoKPj4+ICvCoCAtIE1pY2thZWwgR3VlbmUgPG1pY2th
ZWwuZ3VlbmVAZm9zcy5zdC5jb20+Cj4+Cj4+IEFzIE1pY2thZWwgaXMgbm90IHRoZSBtYWludGFp
bmVyIG9mIHRoZSBkcml2ZXIgYW55bW9yZSwgdGhlcmUgc2hvdWxkIGJlIGJvdGggY3VycmVudCBt
YWludGFpbmVycyBpbnN0ZWFkLCBhcyBsaXN0ZWQgaW4gdGhlIE1BSU5UQUlORVIgZmlsZToKPj4g
wqAgLSBCZW5qYW1pbiBNdWduaWVyIDxiZW5qYW1pbi5tdWduaWVyQGZvc3Muc3QuY29tPgo+PiDC
oCAtIFN5bHZhaW4gUGV0aW5vdCA8c3lsdmFpbi5wZXRpbm90QGZvc3Muc3QuY29tPgo+PiBDYW4g
eW91IGNoYW5nZSBpdCB3aGlsZSBhdCBpdCA/IFRoYW5rIHlvdS4KPiAKPiBEb25lIGFuZCBkb25l
LCBJIGFsc28gZHJvcHBlZCBteXNlbGYgZnJvbSB0aGUgbGlzdCwgd2hpY2ggSSBob3BlIGlzIE9L
Lgo+IAoKTm8gcHJvYmxlbSBmb3IgZHJvcHBpbmcgeW91cnNlbGYsIG91dCBvZiBjdXJpb3NpdHkg
d2h5IHNvID8KCj4+IEJ5IHRoZSB3YXkgeW91IHdpbGwgYWxzbyBuZWVkIHRvIHVwZGF0ZSB0aGUg
TUFJTlRBSU5FUlMgZmlsZSB0byBjaGFuZ2UgdGhlIHN0LHN0LW1pcGlkMDIudHh0IGZpbGUgdG8g
c3Qsc3QtbWlwaWQwMi55YW1sIGhlcmU6Cj4+IMKgwqAgRjrCoMKgwqDCoMKgIERvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9pMmMvc3Qsc3QtbWlwaWQwMi50eHQKPiAKPiBb
Li4uXQo+IAo+Pj4gK8KgwqDCoMKgwqAgcG9ydEAyOgo+Pj4gK8KgwqDCoMKgwqDCoMKgICRyZWY6
IC9zY2hlbWFzL2dyYXBoLnlhbWwjLyRkZWZzL3BvcnQtYmFzZQo+Pj4gK8KgwqDCoMKgwqDCoMKg
IHVuZXZhbHVhdGVkUHJvcGVydGllczogZmFsc2UKPj4+ICvCoMKgwqDCoMKgwqDCoCBkZXNjcmlw
dGlvbjogT3V0cHV0IHBvcnQKPj4+ICvCoMKgwqDCoMKgwqDCoCBwcm9wZXJ0aWVzOgo+Pj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoCBlbmRwb2ludDoKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICRy
ZWY6IC9zY2hlbWFzL21lZGlhL3ZpZGVvLWludGVyZmFjZXMueWFtbCMKPj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHVuZXZhbHVhdGVkUHJvcGVydGllczogZmFsc2UKPj4+ICsKPj4+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHByb3BlcnRpZXM6Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgYnVzLXdpZHRoOgo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBlbnVt
OiBbOCwgMTAsIDEyLCAxNF0KPj4KPj4gU2hvdWxkbid0IHRoaXMgYmUgWzYsIDgsIDEwLCAxMl0g
YXMgaW4gdGhlIG9yaWdpbmFsIGZpbGUgPwo+IAo+IFRoZXkgYXJlIGJvdGggd3JvbmcsIHBlcjoK
PiAKPiBodHRwczovL3d3dy5zdC5jb20vcmVzb3VyY2UvZW4vZGF0YXNoZWV0L3N0bWlwaWQwMi5w
ZGYKPiBwYWdlIDUKPiBUYWJsZSAxLiBJbWFnZSBmb3JtYXQgdnMuIG51bWJlciBvZiBiaXRzIG9u
IG91dHB1dCBpbnRlcmZhY2UKPiByb3cgMgo+IFJBVzcgUkFXNyA3IGJpdHMKPiAKPiBTbyB0aGlz
IHNob3VsZCBiZQo+IFs2LCA3LCA4LCAxMCwgMTJdCj4gCgpHb29kIGNhdGNoLiBUaGFuayB5b3Uu
Cgo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkZWZhdWx0OiA4Cj4+Cj4+IEFz
IGZhciBhcyBJIHVuZGVyc3RhbmQgdGhlcmUgaXMgbm8gJ2RlZmF1bHQnIGFzIHRoaXMgcHJvcGVy
dHkgaXMgcmVxdWlyZWQgYW55d2F5Lgo+IAo+IERyb3BwZWQuCj4gCj4+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgaHN5bmMtYWN0aXZlOiB0cnVlCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgdnN5bmMtYWN0aXZlOiB0cnVlCj4+PiArCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCByZXF1aXJlZDoKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIGJ1cy13aWR0
aAo+Pj4gKwo+Pj4gK8KgwqDCoCByZXF1aXJlZDoKPj4+ICvCoMKgwqDCoMKgIC0gcG9ydEAwCj4+
Cj4+IEFjdHVhbGx5IGl0IGNvdWxkIGVpdGhlciBiZSBwb3J0MCBvciBwb3J0MSwgYnV0IG5vdCBi
b3RoIGF0IHRoZSBzYW1lIHRpbWUsIHNlZSB0aGUgJ2Rlc2NyaXB0aW9uJyBwYXJ0Lgo+PiBJJ20g
bm90IHN1cmUgaG93IHRvIGRlc2NyaWJlIGl0IGluIGRldmljZSB0cmVlIGJpbmRpbmcgdGhvdWdo
Lgo+IAo+IEkgdGhpbmsgdGhlIHJlcXVpcmVtZW50IGhlcmUgaXMgdG8gaGF2ZSBhdCBsZWFzdCBv
bmUgb2YgcG9ydEAwIG9yIHBvcnRAMSBkZXNjcmliZWQgaW4gRFQuIEJvdGggcG9ydEAwIGFuZCBw
b3J0QDEgY2FuIGFsc28gYmUgZGVzY3JpYmVkLCBpLmUuIHlvdSBjYW4gaGF2ZSBGUk9OVCBhbmQg
QkFDSyBzZW5zb3IgbGlrZSBvbiBhIGNvbnRlbXBvcmFyeSBzbWFydHBob25lLCB5b3UganVzdCBj
YW5ub3Qgc3RhcnQgc3RyZWFtaW5nIGZyb20gYm90aCBzZW5zb3JzIGF0IHRoZSBzYW1lIHRpbWUs
IHdoaWNoIGlzIGEgc29mdHdhcmUgcG9saWN5IGFuZCBzaG91bGQgYmUgaGFuZGxlZCBieSB0aGUg
ZHJpdmVyLgoKRGVmaW5pdGVseSwgdGhlIGRldmljZSB0cmVlIHNob3VsZCBkZXNjcmliZSBjb25u
ZWN0ZWQgcG9ydHMuIFRoaXMgaXMgdGhlIHNvZnR3YXJlJ3MgcmVzcG9uc2liaWxpdHkgdG8gbm90
IHN0cmVhbSBmcm9tIGJvdGguClJvYidzIHN1Z2dlc3Rpb24gaXMgcGVyZmVjdC4KCgpSZWdhcmRz
LAoKQmVuamFtaW4KCj4gCj4gU2VlOgo+IGh0dHBzOi8vd3d3LnN0LmNvbS9yZXNvdXJjZS9lbi9k
YXRhc2hlZXQvc3RtaXBpZDAyLnBkZgo+IHBhZ2UgMwo+IDIgQXBwbGljYXRpb24gZGlhZ3JhbXMK
PiBGaWd1cmUgMi4gTUlQSSBDU0ktMiBhcHBsaWNhdGlvbiBkaWFncmFtCj4gCj4gUGVyIHN1Z2dl
c3Rpb24gZnJvbSBSb2IsIEkgdGhpbmsgdGhpcyBzaG91bGQgYmUKPiAKPiBhbGxPZjoKPiDCoCAt
IHJlcXVpcmU6Cj4gwqDCoMKgwqDCoCAtIHBvcnRAMAo+IMKgIC0gcmVxdWlyZToKPiDCoMKgwqDC
oMKgIC0gcG9ydEAxCj4gcmVxdWlyZToKPiDCoCAtIHBvcnRAMgo+IAo+Pj4gK8KgwqDCoMKgwqAg
LSBwb3J0QDIKPj4+ICsKPj4+ICthZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UKPj4+ICsKPj4+
ICtyZXF1aXJlZDoKPj4+ICvCoCAtIGNvbXBhdGlibGUKPj4+ICvCoCAtIHJlZwo+Pgo+PiBJIG5v
dGljZWQgdGhpcyB3YXMgbWlzc2luZyBpbiB0aGUgb3JpZ2luYWwgdHh0IGZpbGUuIFRoYW5rcyBm
b3IgdGFraW5nIGNhcmUgb2YgaXQuCj4gCj4gU3VyZS4gSSdtIGdsYWQgdG8gc2VlIGR0YnNfY2hl
Y2sgcGFzc2luZyBvbiB0aGUgc3RtMzJtcDE1eHggYm9hcmRzLCBsYXJnZWx5IHRoYW5rcyB0byBT
VCBkb2luZyBnb29kIGpvYiBrZWVwaW5nIHRoZSB1cHN0cmVhbSBzdXBwb3J0IGluIGdvb2Qgc2hh
cGUuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXN0bTMyCg==
