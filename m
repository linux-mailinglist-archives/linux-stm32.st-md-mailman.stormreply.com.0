Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 715CE623191
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Nov 2022 18:35:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 222FAC6504E;
	Wed,  9 Nov 2022 17:35:22 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 19FB6C6411D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Nov 2022 17:35:21 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2A9EbRxo009344; Wed, 9 Nov 2022 18:35:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=manLfjXzj5s48sIJkGm/nLiI9zKQBYo8xV/KO74LDpQ=;
 b=OlYL2etVZBTAUmCTR6/9ASWaTC/hPGRZrW7qiiB4gT0LwN+NMMmxwj/Gf6rW4Z04Kp/i
 3+4WW63WwD2dKWmscGUQU39zicv1LSifa89SU9cZuPpw3Otx/38+m7NFEmMoTZ/Bs+e7
 DJxQ8FB6+JgnVcKeh5MEi0GIDF7DzosvZz92Pcf9i2fLpl5fl6SB3q1B8ChQNHiJNohM
 Gg8xUVNYtVTxlpKyYZ+S2zrH7KqJVXFcw/e+4yesdTtrAyJsRtLe9aT4OnWjHhrvRx62
 w0DxWY/RMwDU5IE/64xjSnQcY5Q3vRGLT78eeO2SMC1yi5BBeelJq8Vr6k1WT1ekoOsh FA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3kra52313v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Nov 2022 18:35:11 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 01ED210002A;
 Wed,  9 Nov 2022 18:35:08 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F0E30229A7D;
 Wed,  9 Nov 2022 18:35:07 +0100 (CET)
Received: from [10.252.15.206] (10.252.15.206) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.32; Wed, 9 Nov
 2022 18:35:06 +0100
Message-ID: <6df7b823-463b-d6fa-9662-54f39463a894@foss.st.com>
Date: Wed, 9 Nov 2022 18:35:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Alexandre TORGUE
 <alexandre.torgue@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>
References: <20221028145252.2115933-1-patrick.delaunay@foss.st.com>
 <20221028165150.3.Ibc43aa73f865090affeb1751af0cc260c7f1dd07@changeid>
 <99a8d093-13f3-9ff8-6d87-d4aecaec1566@linaro.org>
 <a4ae3648-2943-55e0-243f-71a3c5f71ad8@foss.st.com>
 <4789703d-0434-2e72-0001-5a7e1014f816@linaro.org>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <4789703d-0434-2e72-0001-5a7e1014f816@linaro.org>
X-Originating-IP: [10.252.15.206]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-09_06,2022-11-09_01,2022-06-22_01
Cc: Etienne CARRIERE <etienne.carriere@linaro.org>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 3/3] nvmem: stm32: add OP-TEE support for
	STM32MP13x
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

SGksCgpPbiAxMS84LzIyIDExOjAzLCBTcmluaXZhcyBLYW5kYWdhdGxhIHdyb3RlOgo+Cj4KPiBP
biAwMi8xMS8yMDIyIDEwOjU5LCBQYXRyaWNrIERFTEFVTkFZIHdyb3RlOgo+PiBIaSwKPj4KPj4g
T24gMTEvMS8yMiAwODoyNiwgU3Jpbml2YXMgS2FuZGFnYXRsYSB3cm90ZToKPj4+Cj4+Pgo+Pj4g
T24gMjgvMTAvMjAyMiAxNTo1MiwgUGF0cmljayBEZWxhdW5heSB3cm90ZToKPj4+PiBGb3IgYm9v
dCB3aXRoIE9QLVRFRSBvbiBTVE0zMk1QMTMsIHRoZSBjb21tdW5pY2F0aW9uIHdpdGggdGhlIHNl
Y3VyZQo+Pj4+IHdvcmxkIG5vIG1vcmUgdXNlIFNUTWljcm9lbGVjdHJvbmljcyBTTUMgYnV0IGNv
bW11bmljYXRpb24gd2l0aCB0aGUKPj4+PiBCU0VDIFRBLCBmb3IgZGF0YSBhY2Nlc3MgKHJlYWQv
d3JpdGUpIG9yIGxvY2sgb3BlcmF0aW9uOgo+Pj4+IC0gYWxsIHRoZSByZXF1ZXN0IGFyZSBzZW50
IHRvIE9QLVRFRSB0cnVzdGVkIGFwcGxpY2F0aW9uLAo+Pj4+IC0gZm9yIHVwcGVyIE9UUCB3aXRo
IEVDQyBwcm90ZWN0aW9uIGFuZCB3aXRoIHdvcmQgcHJvZ3JhbW1pbmcgb25seQo+Pj4+IMKgwqAg
ZWFjaCBPVFAgYXJlIHBlcm1hbmVudGx5IGxvY2tlZCB3aGVuIHByb2dyYW1tZWQgdG8gYXZvaWQg
RUNDIGVycm9yCj4+Pj4gwqDCoCBvbiB0aGUgc2Vjb25kIHdyaXRlIG9wZXJhdGlvbgo+Pj4+Cj4+
Pj4gU2lnbmVkLW9mZi1ieTogUGF0cmljayBEZWxhdW5heSA8cGF0cmljay5kZWxhdW5heUBmb3Nz
LnN0LmNvbT4KPj4+PiAtLS0KPj4+Cj4+PiBGb3Igc29tZSByZWFzb24gSSBwdXNoZWQgdGhpcyBw
YXRjaCB3aXRob3V0IGEgZnVsbCByZXZpZXcsIFRoaXMgaXMgCj4+PiBub3cgcmV2ZXJ0ZWQgZnJv
bSBudm1lbS1uZXh0Lgo+Pgo+Pgo+PiBPawo+Pgo+Pgo+Pj4KPj4+IFdoeSBub3QgYWRkIFRFRSBj
bGllbnQgYmFzZWQgbmV3IGRyaXZlciBpbnN0ZWFkIG9mIGlmZGVmaW5nIGFyb3VuZCAKPj4+IHRo
aXMgZHJpdmVyPyBBbHNvIEkgc2VlIHRoZXJlIGlzIG5vdCBtdWNoIGNvbW1vbiBhY3Jvc3MgYm90
aCBkcml2ZXJzIAo+Pj4gYW55d2F5Lgo+Pgo+Pgo+PiBJIGhlc2l0YXRlIGJldHdlZW4gdGhlIDIg
c29sdXRpb25zLiBJIGNob29zZSB0aGlzIHVwZGF0ZSB0byBoYW5kbGUgCj4+IHRoZSBTVE0zMk1Q
MTUgc3VwcG9ydCB3aXRoIE9QLVRFRS4KPgo+IEhvdyBhcmUgeW91IHRvIGhhbmRpbmcgdGhpcz8K
Pgo+Pgo+PiBGb3IgYmFja3dhcmQgY29tcGF0aWJpbGl0eSByZWFzb24gdGhlIHNhbWUgZHJpdmVy
IFNUTTMyIFJPTUVNIAo+PiBhc3NvY2lhdGVkIHRvIGNvbXBhdGlibGUgInN0LHN0bTMybXAxNS1i
c2VjIiBzaG91bGQgYmUga2VwdC4KPj4KPj4gLSB0aGUgbG93ZXIgT1RQIGNhbiBkaXJlY3RseSBh
Y2Nlc3NpYmxlIGJ5IExpbnV4ICh0aGUgSVAgaXMgbm90IAo+PiBzZWN1cmVkKSA9PiBib290IHdp
dGggU1BMCj4KPiBDYW4gd2UgZGV0ZXJtaW5lIHRoaXMgYXQgcnVudGltZT8KCgpOb3QgZGlyZWN0
bHkgd2l0aCBJUCByZWdpc3RlciwgYnV0IHdlIGRldGVjdCB0aGUgT1AtVEVFIHN1cHBvcnQgYXQg
cnVudGltZS4KCgo+Cj4+Cj4+IC0gdGhlIHVwcGVyIE9UUCBhbmQgdGhlIHdyaXRlIG9wZXJhdGlv
biBhcmUgcmVxdWVzdGVkIGJ5IAo+PiBTVE1pY3JvZWxlY3Ryb25pY3MgU01Dcwo+Pgo+PiDCoMKg
wqAgPT4gYm9vdCB3aXRoIFRGLUEgU1BNSU4gYW5kIG9sZCBPUC1URUUgKGJlZm9yZSBtaWdyYXRp
b24gdG8gU1RNMzIgCj4+IEJTRUMgUFRBKQo+Pgo+Pgo+PiBCdXQgaW4gdGhlIGZ1dHVyZSBPUC1U
RUUgdGhlIGFjY2VzcyB0byBPVFAgc2hvdWxkIGJlIGFsc28gZG9uZSB3aXRoIAo+PiBTVE0zMiBC
U0VDIFBUQS4uLgo+Cj4gR2l2ZW4gdGhhdCB3ZSBoYXZlIG9ubHkgb25lIGNvbXBhdGlibGUgZm9y
IHRoZXNlIHR3byB0eXBlIG9mIAo+IGNvbWJpbmF0aW9ucyBob3cgYXJlIHlvdSBwbGFubmluZyB0
byBkZWFsIHdpdGggYm90aCB0aGUgY2FzZXMgYW5kIAo+IHN0aWxsIGJlIGJhY2t3YXJkIGNvbXBh
dGlibGU/CgoKeWVzLCBhcyBpdCBpcyB0aGUgU09DIGR0c2ksIEkgZG9uJ3Qgd2FudCBjaGFuZ2Ug
dGhlIElQIGNvbXBhdGlibGUKCmJ1dCBJIHdpbGwgaGFuZGxlIGluIHRoaXMgZHJpdmVyIHByb2Jl
IHRvIGJlIGJhY2t3YXJkIGNvbXBhdGlibGU6IApkZXRlY3Rpb24gb2YgT1AtVEVFIHByZXNlbmNl
IGFuZCBTTUMvUFRBIHN1cHBvcnQuCgoKb25seSB0aGUgU1RNMzJNUDEzIFNvQyBvbmx5IHVzZSB0
aGUgUFRBLCBhcyB3ZSBoYXZlIG5vIGJhY2t3YXJkIApjb21wYXRpYmlsaXR5IGlzc3VlLgoKCkkg
d2lsbCBpbmNsdWRlIHRoaXMgU1RNMzJNUDE1IHBhdGNoIGluIHRoZSBzZXJpZSBmb3IgVjIsIGl0
IHNob3VsZCBiZSAKbW9kZSBjbGVhciBmb3IgdGhlIHJldmlldy4KCgo+Cj4gLS1zcmluaQo+Pgo+
Pgo+PiBJIGNhbiBtYW5hZ2UgdGhpcyBjb21wYXRpYmlsaXR5IGJ5IGRldGVjdGlvbiBpbiBTVE0z
MiByb21lbSBkcml2ZXIgaWYgCj4+IHRoZSBib290aCBhY2Nlc3MgYXJlIG1hbmFnZWQgaW4gdGhl
IHNhbWUgZHJpdmVyLgo+Cj4KPgo+Pgo+PiBUaGlzIHBhdGNoIGNhbiBiZSBhZGRlZCBpbiB0aGUg
c2VyaWUgdG8gdW5kZXJzdG9vZCB0aGUgZGV0ZWN0aW9uIAo+PiBtZWNoYW5pc20uCj4+CgpSZWdh
cmRzCgpQYXRyaWNrCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1h
bi9saXN0aW5mby9saW51eC1zdG0zMgo=
