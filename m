Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ABCF82AD47
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Jan 2024 12:23:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9EFABC6DD66;
	Thu, 11 Jan 2024 11:23:23 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5C06AC03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Jan 2024 11:23:22 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40BA1fUg011257; Thu, 11 Jan 2024 12:22:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=m3GNVAvX3k8htTlkp4Usks8fTVv88WEHu4xrWJGJQwU=; b=Ad
 y4bBw4Wy7pvRySTAQn+a92J5NKcopXq7oMKUuI3RDuYuu2S1D+2PHarEO5pnuRO7
 ClWnlSti34jH4+rSXWpgUI8MbqTjO3xAKQrbFbyFTE5LAqJ8lkjdbQqipABTCJ+8
 ZG7Wqi2DpnFzLDRHQrCNG1iq2YdTT38yNI3/VkFFlW13DqK8KwxCnfNMgwu82EZT
 pH5SA6w+Gyf+w/R74zmuN8SLHIJIhIN3wbwHMe8cAA9n2RTe1083OSCE2s4JvbOa
 hyjUlLD3SWqGdq+bqrm46uKQV4tOjCSABUXdXyP6+rUDvW07iBxfiWh08DspZGXc
 4sx3iaPbHKR5b0rFyROw==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3vexrccsnq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Jan 2024 12:22:53 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4DC0D10002A;
 Thu, 11 Jan 2024 12:22:52 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3EA4E237D84;
 Thu, 11 Jan 2024 12:22:52 +0100 (CET)
Received: from [10.252.29.122] (10.252.29.122) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 11 Jan
 2024 12:22:49 +0100
Message-ID: <7889dff7-2c38-43c0-b6f7-281a20ae9733@foss.st.com>
Date: Thu, 11 Jan 2024 12:22:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 <linux-kernel@vger.kernel.org>
References: <20240110080729.3238251-1-dario.binacchi@amarulasolutions.com>
 <20240110080729.3238251-6-dario.binacchi@amarulasolutions.com>
Content-Language: en-US
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <20240110080729.3238251-6-dario.binacchi@amarulasolutions.com>
X-Originating-IP: [10.252.29.122]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-05_08,2024-01-05_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Andre Przywara <andre.przywara@arm.com>, Peter Rosin <peda@axentia.se>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sean Nyekjaer <sean@geanix.com>,
 =?UTF-8?Q?Leonard_G=C3=B6hrs?= <l.goehrs@pengutronix.de>,
 linux-amarula@amarulasolutions.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v6 5/5] ARM: dts: add
 stm32f769-disco-mb1225-revb03-mb1166-reva09
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

Ck9uIDEvMTAvMjQgMDk6MDUsIERhcmlvIEJpbmFjY2hpIHdyb3RlOgo+IEFzIHJlcG9ydGVkIGlu
IHRoZSBzZWN0aW9uIDguMyAoaS4gZS4gQm9hcmQgcmV2aXNpb24gaGlzdG9yeSkgb2YgZG9jdW1l
bnQKPiBVTTIwMzMgKGkuIGUuIERpc2NvdmVyeSBraXQgd2l0aCBTVE0zMkY3NjlOSSBNQ1UpIHRo
ZXNlIGFyZSB0aGUgY2hhbmdlcwo+IHJlbGF0ZWQgdG8gdGhlIGJvYXJkIHJldmlzaW9ucyBhZGRy
ZXNzZWQgYnkgdGhlIHBhdGNoOgo+IC0gQm9hcmQgTUIxMjI1IHJldmlzaW9uIEItMDM6Cj4gICAt
IE1lbW9yeSBNSUNST04gTVQ0OExDNE0zMkIyQjUtNkEgcmVwbGFjZWQgYnkgSVNTSSBJUzQyUzMy
NDAwRi02QkwKPiAtIEJvYXJkIE1CMTE2NiByZXZpc2lvbiBBLTA5Ogo+ICAgLSBMQ0QgRlJJREEg
RlJEMzk3QjI1MDA5LUQtQ1RLIHJlcGxhY2VkIGJ5IEZSSURBIEZSRDQwMEIyNTAyNS1BLUNUSwo+
Cj4gVGhlIHBhdGNoIG9ubHkgYWRkcyB0aGUgRFRTIHN1cHBvcnQgZm9yIHRoZSBuZXcgZGlzcGxh
eSB3aGljaCBiZWxvbmdzIHRvCj4gdG8gdGhlIE5vdmF0ZWsgTlQzNTUxMC1iYXNlZCBwYW5lbCBm
YW1pbHkuCj4KPiBTaWduZWQtb2ZmLWJ5OiBEYXJpbyBCaW5hY2NoaSA8ZGFyaW8uYmluYWNjaGlA
YW1hcnVsYXNvbHV0aW9ucy5jb20+Cj4KPiAtLS0KPgo+IENoYW5nZXMgaW4gdjY6Cj4gLSBEcm9w
IHBhdGNoZXMKPiAgIC0gWzUvOF0gZHQtYmluZGluZ3M6IG50MzU1MTA6IGFkZCBjb21wYXRpYmxl
IGZvciBGUklEQSBGUkQ0MDBCMjUwMjUtQS1DVEsKPiAgIC0gWzcvOF0gZHJtL3BhbmVsOiBudDM1
NTEwOiBtb3ZlIGhhcmR3aXJlZCBwYXJhbWV0ZXJzIHRvIGNvbmZpZ3VyYXRpb24KPiAgIC0gWzgv
OF0gZHJtL3BhbmVsOiBudDM1NTEwOiBzdXBwb3J0IEZSSURBIEZSRDQwMEIyNTAyNS1BLUNUSwo+
ICAgYmVjYXVzZSBhcHBsaWVkIGJ5IHRoZSBtYWludGFpbmVyIExpbnVzIFdhbGxlaWoKPgo+IENo
YW5nZXMgaW4gdjU6Cj4gLSBSZXBsYWNlIEdQSU9EX0FTSVMgd2l0aCBHUElPRF9PVVRfSElHSCBp
biB0aGUgY2FsbCB0byBkZXZtX2dwaW9kX2dldF9vcHRpb25hbCgpLgo+Cj4gQ2hhbmdlcyBpbiB2
MjoKPiAtIENoYW5nZSB0aGUgc3RhdHVzIG9mIHBhbmVsX2JhY2tsaWdodCBub2RlIHRvICJkaXNh
YmxlZCIKPiAtIERlbGV0ZSBiYWNrbGlnaHQgcHJvcGVydHkgZnJvbSBwYW5lbDAgbm9kZS4KPiAt
IFJlLXdyaXRlIHRoZSBwYXRjaCBbOC84XSAiZHJtL3BhbmVsOiBudDM1NTEwOiBzdXBwb3J0IEZS
SURBIEZSRDQwMEIyNTAyNS1BLUNUSyIKPiAgIGluIHRoZSBzYW1lIHN0eWxlIGFzIHRoZSBvcmln
aW5hbCBkcml2ZXIuCj4KPiAgYXJjaC9hcm0vYm9vdC9kdHMvc3QvTWFrZWZpbGUgICAgICAgICAg
ICAgICAgICB8ICAxICsKPiAgLi4uMmY3NjktZGlzY28tbWIxMjI1LXJldmIwMy1tYjExNjYtcmV2
YTA5LmR0cyB8IDE4ICsrKysrKysrKysrKysrKysrKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDE5IGlu
c2VydGlvbnMoKykKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJtL2Jvb3QvZHRzL3N0L3N0
bTMyZjc2OS1kaXNjby1tYjEyMjUtcmV2YjAzLW1iMTE2Ni1yZXZhMDkuZHRzCj4KPiBkaWZmIC0t
Z2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvc3QvTWFrZWZpbGUgYi9hcmNoL2FybS9ib290L2R0cy9z
dC9NYWtlZmlsZQo+IGluZGV4IDc4OTJhZDY5YjQ0MS4uMzkwZGJkMzAwYTU3IDEwMDY0NAo+IC0t
LSBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N0L01ha2VmaWxlCj4gKysrIGIvYXJjaC9hcm0vYm9vdC9k
dHMvc3QvTWFrZWZpbGUKPiBAQCAtMjMsNiArMjMsNyBAQCBkdGItJChDT05GSUdfQVJDSF9TVE0z
MikgKz0gXAo+ICAJc3RtMzJmNDY5LWRpc2NvLmR0YiBcCj4gIAlzdG0zMmY3NDYtZGlzY28uZHRi
IFwKPiAgCXN0bTMyZjc2OS1kaXNjby5kdGIgXAoKSGkgRGFyaW8sCgoKRGlkIHlvdSBtZWFudCBk
dGIgaGVyZSA/IDspCgoKUmVnYXJkcywKClJhcGhhw6tsCgo+ICsJc3RtMzJmNzY5LWRpc2NvLW1i
MTIyNS1yZXZiMDMtbWIxMTY2LXJldmEwOS5kdHMgXAo+ICAJc3RtMzI0MjlpLWV2YWwuZHRiIFwK
PiAgCXN0bTMyNzQ2Zy1ldmFsLmR0YiBcCj4gIAlzdG0zMmg3NDNpLWV2YWwuZHRiIFwKPiBkaWZm
IC0tZ2l0IGEvYXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJmNzY5LWRpc2NvLW1iMTIyNS1yZXZi
MDMtbWIxMTY2LXJldmEwOS5kdHMgYi9hcmNoL2FybS9ib290L2R0cy9zdC9zdG0zMmY3NjktZGlz
Y28tbWIxMjI1LXJldmIwMy1tYjExNjYtcmV2YTA5LmR0cwo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0
Cj4gaW5kZXggMDAwMDAwMDAwMDAwLi4wMTRjYWMxOTIzNzUKPiAtLS0gL2Rldi9udWxsCj4gKysr
IGIvYXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJmNzY5LWRpc2NvLW1iMTIyNS1yZXZiMDMtbWIx
MTY2LXJldmEwOS5kdHMKPiBAQCAtMCwwICsxLDE4IEBACj4gKy8vIFNQRFgtTGljZW5zZS1JZGVu
dGlmaWVyOiBHUEwtMi4wCj4gKy8qCj4gKyAqIENvcHlyaWdodCAoYykgMjAyMyBEYXJpbyBCaW5h
Y2NoaSA8ZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20+Cj4gKyAqLwo+ICsKPiAr
I2luY2x1ZGUgInN0bTMyZjc2OS1kaXNjby5kdHMiCj4gKwo+ICsmcGFuZWxfYmFja2xpZ2h0IHsK
PiArCXN0YXR1cyA9ICJkaXNhYmxlZCI7Cj4gK307Cj4gKwo+ICsmcGFuZWwwIHsKPiArCWNvbXBh
dGlibGUgPSAiZnJpZGEsZnJkNDAwYjI1MDI1IiwgIm5vdmF0ZWssbnQzNTUxMCI7Cj4gKwl2ZGRp
LXN1cHBseSA9IDwmdmNjXzN2Mz47Cj4gKwl2ZGQtc3VwcGx5ID0gPCZ2Y2NfM3YzPjsKPiArCS9k
ZWxldGUtcHJvcGVydHkvYmFja2xpZ2h0Owo+ICsJL2RlbGV0ZS1wcm9wZXJ0eS9wb3dlci1zdXBw
bHk7Cj4gK307Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXN0bTMyCg==
