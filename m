Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD8AB004CC
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Jul 2025 16:12:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1ADCDC349C2;
	Thu, 10 Jul 2025 14:12:35 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5676EC349C1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Jul 2025 14:12:34 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56ADjDNM019300;
 Thu, 10 Jul 2025 16:12:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 O5ZjyQ7fcMZjAROkYAzONVq5nvoucDwT2TJdOec8s3E=; b=rXXLgFMhk1ov1Kfb
 dTBEe6tPUeWMEyTgfS0G7zFjUM+QL0yg7etBY8ITbyxiDqeehrPFEFIabVnH/yx1
 qr8I2upEpkvHxqa6vgQenFp9tWWNaI0MwXGXi8QRPW3UoqzL6q52qYIHSlKpKc4F
 wUrfUNfw2SvnhcsY3LfChAtmNXnWJ5O+8jGGfjfmjwhdhedmiZdRmDzkpdS6m/UL
 zfdirhiA/S0NKY+G8uzZPOumn34Mnw6PwL76qDPyM8YSscSBTdQNCKLmqj4uWFLY
 031H+JPTMFXfD12CC0hDHTzVOeHA4hIa3G6QVyqnQfDg9w+TlB45QTaN7I1KpeKN
 JBH+cg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47qf0pxty6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Jul 2025 16:12:22 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id EA7F440044;
 Thu, 10 Jul 2025 16:11:23 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 002DFAF9A59;
 Thu, 10 Jul 2025 16:10:46 +0200 (CEST)
Received: from [10.48.86.182] (10.48.86.182) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 10 Jul
 2025 16:10:46 +0200
Message-ID: <6e44163a-eae3-49bb-8c05-32437d517451@foss.st.com>
Date: Thu, 10 Jul 2025 16:10:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marc Zyngier <maz@kernel.org>
References: <20250515151238.1.I85271ddb811a7cf73532fec90de7281cb24ce260@changeid>
 <86ikm2f0y2.wl-maz@kernel.org>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <86ikm2f0y2.wl-maz@kernel.org>
X-Originating-IP: [10.48.86.182]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-10_03,2025-07-09_01,2025-03-28_01
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/2] arm64: dts: st: fix timer used for
	ticks
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

SGkgTWFyaywKCk9uIDUvMTUvMjUgMTU6MzksIE1hcmMgWnluZ2llciB3cm90ZToKPiBPbiBUaHUs
IDE1IE1heSAyMDI1IDE0OjEyOjM5ICswMTAwLAo+IFBhdHJpY2sgRGVsYXVuYXkgPHBhdHJpY2su
ZGVsYXVuYXlAZm9zcy5zdC5jb20+IHdyb3RlOgo+PiBSZW1vdmUgYWx3YXlzLW9uIG9uIGdlbmVy
aWMgQVJNIHRpbWVyIGFzIHRoZSBjbG9jayBzb3VyY2UgcHJvdmlkZWQgYnkKPj4gU1RHRU4gaXMg
ZGVhY3RpdmF0ZWQgaW4gbG93IHBvd2VyIG1vZGUsIFNUT1AxIGJ5IGV4YW1wbGUuCj4+Cj4+IEZp
eGVzOiA1ZDMwZDAzYWFmNzggKCJhcm02NDogZHRzOiBzdDogaW50cm9kdWNlIHN0bTMybXAyNSBT
b0NzIGZhbWlseSIpCj4+IFNpZ25lZC1vZmYtYnk6IFBhdHJpY2sgRGVsYXVuYXkgPHBhdHJpY2su
ZGVsYXVuYXlAZm9zcy5zdC5jb20+Cj4+IC0tLQo+Pgo+PiAgIGFyY2gvYXJtNjQvYm9vdC9kdHMv
c3Qvc3RtMzJtcDI1MS5kdHNpIHwgMiArLQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0
cy9zdC9zdG0zMm1wMjUxLmR0c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3N0L3N0bTMybXAyNTEu
ZHRzaQo+PiBpbmRleCA4ZDg3ODY1ODUwYTcuLjc0YzVmODViODAwZiAxMDA2NDQKPj4gLS0tIGEv
YXJjaC9hcm02NC9ib290L2R0cy9zdC9zdG0zMm1wMjUxLmR0c2kKPj4gKysrIGIvYXJjaC9hcm02
NC9ib290L2R0cy9zdC9zdG0zMm1wMjUxLmR0c2kKPj4gQEAgLTE1MCw3ICsxNTAsNyBAQCB0aW1l
ciB7Cj4+ICAgCQkJICAgICA8R0lDX1BQSSAxNCAoR0lDX0NQVV9NQVNLX1NJTVBMRSgxKSB8IElS
UV9UWVBFX0xFVkVMX0xPVyk+LAo+PiAgIAkJCSAgICAgPEdJQ19QUEkgMTEgKEdJQ19DUFVfTUFT
S19TSU1QTEUoMSkgfCBJUlFfVFlQRV9MRVZFTF9MT1cpPiwKPj4gICAJCQkgICAgIDxHSUNfUFBJ
IDEwIChHSUNfQ1BVX01BU0tfU0lNUExFKDEpIHwgSVJRX1RZUEVfTEVWRUxfTE9XKT47Cj4+IC0J
CWFsd2F5cy1vbjsKPj4gKwkJYXJtLG5vLXRpY2staW4tc3VzcGVuZDsKPiBUaGF0J3MgYW11c2lu
ZywgYmVjYXVzZSB0aGVzZSB0d28gcHJvcGVydGllcyBsaXRlcmFsbHkgZGVzY3JpYmUKPiBvcHBv
c2l0ZSBiZWhhdmlvdXJzIChmcm9tIGFuIG9wdGltaXNhdGlvbiB0byBhIEhXIGJ1ZykuCj4KPiBJ
J20gYWxzbyBwcmV0dHkgc3VyZSA5OSUgb2YgdGhlIERUcyBpbiB0aGUgdHJlZSB0aGF0IGhhdmUg
dGhlCj4gYWx3YXlzLW9uIHByb3BlcnR5IGFyZSB3cm9uZy4KCnllcyBpdCB3YXMgYSBidWcgaW4g
dGhlIGluaXRpYWwgZGV2aWNlIHRyZWUsIGRldGVjdGVkIHdoZW4gd2UgaW1wbGVtZW50Cgp0aGUg
bG93IHBvd2VyIHN1cHBvcnQgaW4gU1RNaWNyb2VsZWN0cm9uaWNzIGRvd250cmVhbS4KCgpTVEdF
TiwgdGhlIHJvb3Qgc291cmNlIG9mIEFSTSBnZW5lcmljIHRpbWVyIGluIFNUTTMyTVAyNSBpcyBz
dG9wcGVkIGluCgpsb3cgcG93ZXIgc3RhdGVzLgoKCj4KPj4gICAJfTsKPj4gICAKPj4gICAJc29j
QDAgewo+IEkgZG9uJ3Qgd2FudCB0byBzb3VuZCBydWRlIG9yIGFueXRoaW5nLCBidXQgdGhlIGd1
eSB5b3UgQ2MnZCBvbiBhbgo+IEBhcm0uY29tIHdpbGwgbm90IHJlcGx5IChhbmQgaGFzbid0IGJl
ZW4gcmVwbHlpbmcgZm9yIGFsbW9zdCA2IHllYXJzKS4KCnlvdXIgbm90IHJ1ZGUgYW5kIEl0IGlz
IG15IGVycm9yLCBzb3JyeQoKSSBzZWFyY2ggZW1haWwgZm9yICJNYXJjIFp5bmdpZXIgIiBpbiBM
aW51eCBzb3VyY2UgdHJlZS4uLi4KCmFuZCBJIHVzZSBhIGJhZCBhZGRyZXNzLgoKCkZvciBpbmZv
cm1hdGlvbiwgSSB1cHN0cmVhbSB0aGlzIHBhdGNoIGFmdGVyIHRoZSByZW1hcmsgb24gcGF0Y2gg
YnkgCkNocmlzdGlhbiBCcnVlbDoKCltQQVRDSCAzLzNdIGFybTY0OiBkdHM6IHN0OiBhZGQgc3Qs
c3RtMzJtcDItY29ydGV4LWE3LWdpYyBpbiBpbnRjIG5vZGUgaW4gc3RtMzJtcDI1MS5kdHNpCmh0
dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1hcm0ta2VybmVsL3BhdGNo
LzIwMjUwNDAzMTIyODA1LjE1NzQwODYtNC1jaHJpc3RpYW4uYnJ1ZWxAZm9zcy5zdC5jb20vCgog
PsKgwqAgV2hpbGUgcmV2aWV3aW5nIGEgRFQgcGF0Y2ggb2YgbWluZSByZWxhdGVkIHRvIHRoZSAK
aW50ZXJydXB0LWNvbnRyb2xsZXIsIEkgaGFkIHRoZSBmb2xsb3dpbmcKCiDCoD7CoCBjb21tZW50
IGZyb20gTWFyYyBaeW5naWVyIChHSUMgTWFpbnRhaW5lcikgIiBUaGVuIHdoaWxlIHlvdSdyZSBh
dCAKaXQsIHlvdSBtYXkgd2FudCB0bwoKIMKgPsKgIGNvbnNpZGVyIHJlbW92aW5nIHRoZSAiYWx3
YXlzLW9uIiBwcm9wZXJ0eSBpbiB0aGUgdGltZXIsIGJlY2F1c2UgCkknbSBwcmV0dHkgc3VyZSB0
aGUKCiDCoCA+IGNvbXBhcmF0b3IgZ29lcyBkb3duIGluIGxvdyBwb3dlciBtb2RlIG9uIEE1MyBh
bmQgQTM1LCBhbmQgbG9zZXMgCml0cyB2YWx1ZS4KCiA+wqDCoCBJbiBnZW5lcmFsLCBvbmx5IFZN
cyBjYW4gbWFrZSB1c2Ugb2YgdGhpcyBwcm9wZXJ0eS4gIgoKCgo+Cj4gVGhhbmtzLAo+Cj4gCU0u
Cj4KClRoYW5rcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4v
bGlzdGluZm8vbGludXgtc3RtMzIK
