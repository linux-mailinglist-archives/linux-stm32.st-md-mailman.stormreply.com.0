Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4484A7FA14B
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Nov 2023 14:47:48 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CCF03C6B469;
	Mon, 27 Nov 2023 13:47:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 646D5C6A61A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Nov 2023 13:47:46 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3AR8w3bo017254; Mon, 27 Nov 2023 14:47:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:from:subject:to:cc:references
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=8hGazSvMP2gNXnWuE2YGDfecV4aQ8ZkhDAZNfo9ZL7U=; b=4k
 H3otVN1HaFRDT9yF7U0HmECWFJJDC71b2rS3CjU7ESa7kB8m0UP/19kw2rumrbaX
 KunMUZLjfFu8KWPPQLIVxqBPwHA7ocaRMO6UQdnJVc2G/AOvSum6YtuSnV2A7RKU
 79l85N0tMtbHPnmVlcIg0Cv5UmQmcitJbLQRew22OKyzIhKTmcQWpes1I1R5Grgd
 GeaV73IZ16M0lmaN/L9bQwlRUTsymZwUFzAePC0dhjDC5tHD+I8axUF6put6LuaU
 crQvdeKflQVLAlApNxg/cZLSWWeOU4ioF8XuI4bAOMpybdRTe104wPpuOgWQ5fOB
 kdSuIB9Dfsvc5ARo4AmA==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3uk8pjqnw2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Nov 2023 14:47:02 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EF21A10004B;
 Mon, 27 Nov 2023 14:47:00 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 357D9228A4A;
 Mon, 27 Nov 2023 14:47:00 +0100 (CET)
Received: from [10.201.20.32] (10.201.20.32) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 27 Nov
 2023 14:46:58 +0100
Message-ID: <2387a549-4ccf-450d-a461-26d3c9ff58f1@foss.st.com>
Date: Mon, 27 Nov 2023 14:46:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
To: Rob Herring <robh@kernel.org>
References: <20231010125719.784627-1-gatien.chevallier@foss.st.com>
 <20231010125719.784627-11-gatien.chevallier@foss.st.com>
 <20231010184212.GA1221641-robh@kernel.org>
 <8f1b6915-68be-a525-c5d5-37f0983c14de@foss.st.com>
 <20231012153012.GA698406-robh@kernel.org>
 <b16ed06f-66fd-457b-9610-a67ad07deb60@foss.st.com>
 <20231024163956.GA4049342-robh@kernel.org>
 <8fa014c3-c0e9-4183-b4fb-90962f71295a@foss.st.com>
Content-Language: en-US
In-Reply-To: <8fa014c3-c0e9-4183-b4fb-90962f71295a@foss.st.com>
X-Originating-IP: [10.201.20.32]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-27_11,2023-11-27_01,2023-05-22_02
Cc: ulf.hansson@linaro.org, linux-iio@vger.kernel.org, catalin.marinas@arm.com,
 edumazet@google.com, Oleksii_Moisieiev@epam.com,
 krzysztof.kozlowski+dt@linaro.org, will@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, peng.fan@oss.nxp.com,
 herbert@gondor.apana.org.au, Frank Rowand <frowand.list@gmail.com>,
 hugues.fruchet@foss.st.com, lee@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org,
 andi.shyti@kernel.org, alsa-devel@alsa-project.org,
 linux-p.hy@lists.infradead.org, richardcochran@gmail.com,
 linux-serial@vger.kernel.org, mchehab@kernel.org,
 linux-arm-kernel@lists.infradead.org, arnd@kernel.org,
 gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, vkoul@kernel.org, linux-crypto@vger.kernel.org,
 netdev@vger.kernel.org, dmaengine@vger.kernel.org, davem@davemloft.net,
 jic23@kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v6 10/11] ARM: dts: stm32: add ETZPC as a
 system bus for STM32MP15x boards
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

SGksCgpBIGdlbnRsZSByZW1pbmRlciBvbiB0aGUgcXVlc3Rpb25zIGJlbG93LgoKSSdtIGFsc28g
dGhpbmtpbmcgYWJvdXQgbW92aW5nIHRoZSBTVE0zMiBmaXJld2FsbCBmcmFtZXdvcmsgdG8gYQpz
cGVjaWZpYyBhY2Nlc3MtY29udHJvbGxlcnMgZm9sZGVyIGlmIHRoYXQncyBvay4KCkJlc3QgcmVn
YXJkcywKR2F0aWVuCgpPbiAxMC8yNy8yMyAxNzozNywgR2F0aWVuIENIRVZBTExJRVIgd3JvdGU6
Cj4gCj4gCj4gT24gMTAvMjQvMjMgMTg6MzksIFJvYiBIZXJyaW5nIHdyb3RlOgo+PiBPbiBNb24s
IE9jdCAxNiwgMjAyMyBhdCAwMjowMjozOVBNICswMjAwLCBHYXRpZW4gQ0hFVkFMTElFUiB3cm90
ZToKPj4+IEhpIFJvYiwKPj4+Cj4+PiBPbiAxMC8xMi8yMyAxNzozMCwgUm9iIEhlcnJpbmcgd3Jv
dGU6Cj4+Pj4gT24gV2VkLCBPY3QgMTEsIDIwMjMgYXQgMTA6NDk6NThBTSArMDIwMCwgR2F0aWVu
IENIRVZBTExJRVIgd3JvdGU6Cj4+Pj4+IEhpIFJvYiwKPj4+Pj4KPj4+Pj4gT24gMTAvMTAvMjMg
MjA6NDIsIFJvYiBIZXJyaW5nIHdyb3RlOgo+Pj4+Pj4gT24gVHVlLCBPY3QgMTAsIDIwMjMgYXQg
MDI6NTc6MThQTSArMDIwMCwgR2F0aWVuIENoZXZhbGxpZXIgd3JvdGU6Cj4+Pj4+Pj4gRVRaUEMg
aXMgYSBmaXJld2FsbCBjb250cm9sbGVyLiBQdXQgYWxsIHBlcmlwaGVyYWxzIGZpbHRlcmVkIGJ5
IHRoZQo+Pj4+Pj4+IEVUWlBDIGFzIEVUWlBDIHN1Ym5vZGVzIGFuZCByZWZlcmVuY2UgRVRaUEMg
YXMgYW4KPj4+Pj4+PiBhY2Nlc3MtY29udHJvbC1wcm92aWRlci4KPj4+Pj4+Pgo+Pj4+Pj4+IEZv
ciBtb3JlIGluZm9ybWF0aW9uIG9uIHdoaWNoIHBlcmlwaGVyYWwgaXMgc2VjdXJhYmxlIG9yIHN1
cHBvcnRzIAo+Pj4+Pj4+IE1DVQo+Pj4+Pj4+IGlzb2xhdGlvbiwgcGxlYXNlIHJlYWQgdGhlIFNU
TTMyTVAxNSByZWZlcmVuY2UgbWFudWFsLgo+Pj4+Pj4+Cj4+Pj4+Pj4gU2lnbmVkLW9mZi1ieTog
R2F0aWVuIENoZXZhbGxpZXIgPGdhdGllbi5jaGV2YWxsaWVyQGZvc3Muc3QuY29tPgo+Pj4+Pj4+
IC0tLQo+Pj4+Pj4+Cj4+Pj4+Pj4gQ2hhbmdlcyBpbiBWNjoKPj4+Pj4+PiDCoMKgwqDCoMKgwqDC
oMKgwqDCoCAtIFJlbmFtZWQgYWNjZXNzLWNvbnRyb2xsZXIgdG8gYWNjZXNzLWNvbnRyb2xsZXJz
Cj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBSZW1vdmFsIG9mIGFjY2Vzcy1jb250cm9s
LXByb3ZpZGVyIHByb3BlcnR5Cj4+Pj4+Pj4KPj4+Pj4+PiBDaGFuZ2VzIGluIFY1Ogo+Pj4+Pj4+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gUmVuYW1lZCBmZWF0dXJlLWRvbWFpbiogdG8gYWNjZXNz
LWNvbnRyb2wqCj4+Pj4+Pj4KPj4+Pj4+PiDCoMKgwqAgYXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3Rt
MzJtcDE1MS5kdHNpwqAgfCAyNzU2IAo+Pj4+Pj4+ICsrKysrKysrKysrKystLS0tLS0tLS0tLS0K
Pj4+Pj4+PiDCoMKgwqAgYXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJtcDE1My5kdHNpwqAgfMKg
wqAgNTIgKy0KPj4+Pj4+PiDCoMKgwqAgYXJjaC9hcm0vYm9vdC9kdHMvc3Qvc3RtMzJtcDE1eGMu
ZHRzaSB8wqDCoCAxOSArLQo+Pj4+Pj4+IMKgwqDCoCAzIGZpbGVzIGNoYW5nZWQsIDE0NTAgaW5z
ZXJ0aW9ucygrKSwgMTM3NyBkZWxldGlvbnMoLSkKPj4+Pj4+Cj4+Pj4+PiBUaGlzIGlzIG5vdCBy
ZXZpZXdhYmxlLiBDaGFuZ2UgdGhlIGluZGVudGF0aW9uIGFuZCBhbnkgbm9uLWZ1bmN0aW9uYWwK
Pj4+Pj4+IGNoYW5nZSBpbiBvbmUgcGF0Y2ggYW5kIHRoZW4gYWN0dWFsIGNoYW5nZXMgaW4gYW5v
dGhlci4KPj4+Pj4KPj4+Pj4gT2ssIEknbGwgbWFrZSBpdCBlYXNpZXIgdG8gcmVhZC4KPj4+Pj4K
Pj4+Pj4+Cj4+Pj4+PiBUaGlzIGlzIGFsc28gYW4gQUJJIGJyZWFrLiBUaG91Z2ggSSdtIG5vdCBz
dXJlIGl0J3MgYXZvaWRhYmxlLiBBbGwgCj4+Pj4+PiB0aGUKPj4+Pj4+IGRldmljZXMgYmVsb3cg
dGhlIEVUWlBDIG5vZGUgd29uJ3QgcHJvYmUgb24gZXhpc3Rpbmcga2VybmVsLiBBCj4+Pj4+PiBz
aW1wbGUtYnVzIGZhbGxiYWNrIGZvciBFVFpQQyBub2RlIHNob3VsZCBzb2x2ZSB0aGF0Lgo+Pj4+
Pj4KPj4+Pj4KPj4+Pj4gSSBoYWQgb25lIGlzc3VlIHdoZW4gdHJ5aW5nIHdpdGggYSBzaW1wbGUt
YnVzIGZhbGxiYWNrIHRoYXQgd2FzIHRoZQo+Pj4+PiBkcml2ZXJzIHdlcmUgcHJvYmluZyBldmVu
IHRob3VnaCB0aGUgYWNjZXNzIHJpZ2h0cyBhcmVuJ3QgY29ycmVjdC4KPj4+Pj4gSGVuY2UgdGhl
IHJlbW92YWwgb2YgdGhlIHNpbXBsZS1idXMgY29tcGF0aWJsZSBpbiB0aGUgU1RNMzJNUDI1IHBh
dGNoLgo+Pj4+Cj4+Pj4gQnV0IGl0IHdvcmtlZCBiZWZvcmUsIHJpZ2h0PyBTbyB0aGUgZGlmZmVy
ZW5jZSBpcyB5b3UgaGF2ZSBlaXRoZXIgYWRkZWQKPj4+PiBuZXcgZGV2aWNlcyB3aGljaCBuZWVk
IHNldHVwIG9yIHlvdXIgZmlybXdhcmUgY2hhbmdlZCBob3cgZGV2aWNlcyBhcmUKPj4+PiBzZXR1
cCAob3Igbm90IHNldHVwKS4gQ2VydGFpbmx5IGNhbid0IGZpeCB0aGUgbGF0dGVyIGNhc2UuIFlv
dSBqdXN0IAo+Pj4+IG5lZWQKPj4+PiB0byBiZSBleHBsaWNpdCBhYm91dCB3aGF0IHlvdSBhcmUg
ZG9pbmcgdG8gdXNlcnMuCj4+Pj4KPj4+Cj4+PiBJIHNob3VsZCd2ZSBzcGVjaWZpZWQgaXQgd2Fz
IGR1cmluZyBhIHRlc3Qgd2hlcmUgSSBkZWxpYmVyYXRlbHkgc2V0Cj4+PiBpbmNvcnJlY3Qgcmln
aHRzIG9uIGEgcGVyaXBoZXJhbCBhbmQgZW5hYmxlZCBpdHMgbm9kZSB0byBzZWUgaWYgdGhlCj4+
PiBmaXJld2FsbCB3b3VsZCBhbGxvdyB0aGUgY3JlYXRpb24gb2YgdGhlIGRldmljZS4KPj4+Cj4+
Pj4KPj4+Pj4gRXZlbiB0aG91Z2ggYSBub2RlIGlzIHRhZ2dlZCB3aXRoIHRoZSBPRl9QT1BVTEFU
RUQgZmxhZyB3aGVuIGNoZWNraW5nCj4+Pj4+IHRoZSBhY2Nlc3MgcmlnaHRzIHdpdGggdGhlIGZp
cmV3YWxsIGNvbnRyb2xsZXIsIGl0IHNlZW1zIHRoYXQgd2hlbgo+Pj4+PiBzaW1wbGUtYnVzIGlz
IHByb2JpbmcsIHRoZXJlJ3Mgbm8gY2hlY2sgb2YgdGhpcyBmbGFnLgo+Pj4+Cj4+Pj4gSXQgc2hv
dWxkbid0LiBUaG9zZSBmbGFncyBhcmUgZm9yIGNyZWF0aW5nIHRoZSBkZXZpY2VzIChvciBub3Qp
IGFuZAo+Pj4+IHJlbW92aW5nIG9ubHkgZGV2aWNlcyBvZl9wbGF0Zm9ybV9wb3B1bGF0ZSgpIGNy
ZWF0ZWQuCj4+Pj4KPj4+Cj4+PiBBYm91dCB0aGUgInNpbXBsZS1idXMiIGJlaW5nIGEgZmFsbGJh
Y2ssIEkgdGhpbmsgSSB1bmRlcnN0b29kIHdoeSBJIHNhdwo+Pj4gdGhhdCB0aGUgZGV2aWNlcyB3
ZXJlIGNyZWF0ZWQuCj4+Pgo+Pj4gQWxsIGRldmljZXMgdW5kZXIgYSBub2RlIHdob3NlIGNvbXBh
dGlibGUgaXMgInNpbXBsZS1idXMiIGFyZSBjcmVhdGVkCj4+PiBpbiBvZl9wbGF0Zm9ybV9kZXZp
Y2VfY3JlYXRlX3BkYXRhKCksIGNhbGxlZCBieQo+Pj4gb2ZfcGxhdGZvcm1fZGVmYXVsdF9wb3B1
bGF0ZV9pbml0KCkgYXQgYXJjaF9pbml0Y2FsbCBsZXZlbC4gVGhpcwo+Pj4gYmVmb3JlIHRoZSBm
aXJld2FsbC1jb250cm9sbGVyIGhhcyBhIGNoYW5jZSB0byBwb3B1bGF0ZSBpdCdzIGJ1cy4KPj4+
Cj4+PiBUaGVyZWZvcmUsIHdoZW4gSSBmbGFnIG5vZGVzIHdoZW4gcG9wdWxhdGluZyB0aGUgZmly
ZXdhbGwtYnVzLCB0aGUKPj4+IGRldmljZXMgYXJlIGFscmVhZHkgY3JlYXRlZC4gVGhlICJzaW1w
bGUtYnVzIiBtZWNoYW5pc20gaXMgbm90IGEKPj4+IGZhbGxiYWNrIGhlcmUgYXMgaXQgcHJlY2Vk
ZXMgdGhlIGRyaXZlciBwcm9iZS4KPj4+Cj4+PiBJcyB0aGVyZSBhIHNhZmUgd2F5IHRvIHNhZmVs
eSByZW1vdmUvZGlzYWJsZSBhIGRldmljZSBjcmVhdGVkIHRoaXMgd2F5Pwo+Pgo+PiBUaGVyZSdz
IDIgd2F5cyB0byBoYW5kbGUgdGhpcy4gRWl0aGVyIGNvbnRyb2xsaW5nIGNyZWF0aW5nIHRoZSBk
ZXZpY2Ugb3IKPj4gY29udHJvbGxpbmcgcHJvYmluZyB0aGUgZGV2aWNlLiBUaGUgbGF0dGVyIHNo
b3VsZCBqdXN0IHdvcmsgd2l0aAo+PiBmd19kZXZsaW5rIGRlcGVuZGVuY3kuIFRoZSBmb3JtZXIg
cHJvYmFibHkgbmVlZHMgc29tZSBhZGp1c3RtZW50IHRvCj4+IHNpbXBsZS1wbS1idXMgZHJpdmVy
IGlmIHlvdSBoYXZlICdzaW1wbGUtYnVzJyBjb21wYXRpYmxlLiBZb3Ugd2FudCBpdCB0bwo+PiBw
cm9iZSBvbiBvbGQga2VybmVscyBhbmQgbm90IHByb2JlIG9uIG5ldyBrZXJuZWxzIHdpdGggeW91
ciBmaXJld2FsbAo+PiBkcml2ZXIuIExvb2sgYXQgdGhlIGNvbW1pdCBoaXN0b3J5IGZvciBzaW1w
bGUtcG0tYnVzLiBUaGVyZSB3YXMgc29tZQo+PiBkaXNjdXNzaW9uIG9uIGl0IGFzIHdlbGwuCj4+
Cj4gCj4gSGkgUm9iLAo+IAo+IEZpcnN0LCB0aGFuayB5b3UgZm9yIHlvdXIgc3VnZ2VzdGlvbnMu
Cj4gCj4gUmVnYXJkaW5nIGNvbnRyb2xsaW5nIHByb2JpbmcgdGhlIGRldmljZTogdGhlIHBoaWxv
c29waHkgb2YgdGhlIGZpcmV3YWxsCj4gY29udHJvbGxlciB3YXMgdG8gY2hlY2sgYSBkZXZpY2Ug
c2VjdXJlIGNvbmZpZ3VyYXRpb24gdG8gZGV0ZXJtaW5lIGlmCj4gaXRzIGFzc29jaWF0ZWQgZHJp
dmVyIHNob3VsZCBiZSBwcm9iZWQgKCtoYW5kbGUgc29tZSBmaXJld2FsbAo+IHJlc291cmNlcyku
IEknZCByYXRoZXIgYXZvaWQgaXQgc28gdGhhdCB0aGUgZGV2aWNlIGlzbid0IGNyZWF0ZWQgYXQg
YWxsLgo+IAo+IEkgdG9vayBhIGxvb2sgb24gdGhlIHNpbXBsZS1idXMgZHJpdmVyIHNpZGUuIEkg
ZG9uJ3Qgc2VlIGFuIG9idmlvdXMgd2F5Cj4gb24gaG93IHRvIGRvIGl0IGFzIHRoZSBmaXJld2Fs
bCBjb250cm9sbGVyIGRyaXZlciBpcyBhIG1vZHVsZSB3aGlsZSB0aGUKPiBkZXZpY2VzIGJlaW5n
IHBvcHVsYXRlZCBpcyBkb25lIGF0IGFyY2ggaW5pdGNhbGwgbGV2ZWwuCj4gCj4gSSBlbmRlZCB1
cCB3aXRoIHR3byBwcm9wb3NpdGlvbnM6Cj4gCj4gMSlJIHRvb2sgYSBzaG90IGF0IGltcGxlbWVu
dGluZyBhIG5ldyBmbGFnICJPRl9BQ0NFU1NfR1JBTlRFRCIgdGhhdAo+IHNob3VsZCBiZSBzZXQg
aW4gdGhlIGZpcnN0IGNhbGwgb2YgdGhlIG9mX3BsYXRmb3JtX2J1c19jcmVhdGUoKQo+IGZ1bmN0
aW9uIGZvciBldmVyeSBjaGlsZCBub2RlIG9mIGEgImRlZmF1bHQgYnVzIiAoc2ltcGxlLWJ1cywK
PiBzaW1wbGUtcG0tYnVzLCAuLi4pIGhhdmluZyB0aGUgYWNjZXNzLWNvbnRyb2xsZXJzIHByb3Bl
cnR5Lgo+IFRoaXMgZmxhZyBzaG91bGQgYmUgdW5zZXQgYnkgdGhlIGFjY2VzcyBjb250cm9sbGVy
IGlmIHRoZSBhY2Nlc3MgaXMKPiBub3QgZ3JhbnRlZC4gVGhpcyBjb3ZlcnMgdGhlIHBhcnRpY3Vs
YXIgY2FzZSB3aGVyZSB0aGUgYWNjZXNzIGNvbnRyb2xsZXIKPiBoYXMgYSBzaW1wbGUtYnVzIGZh
bGxiYWNrIHdoaWxzdCBub3QgY3JlYXRpbmcgdGhlIGRldmljZXMgb24gdGhlIGZpcnN0Cj4gdHJ5
IGZvciB0aGUgYnVzJyBjaGlsZHMuCj4gCj4gVGhpcyB3YXksIHRoZSBmaXJzdCByb3VuZCBvZiBv
Zl9wbGF0Zm9ybV9wb3B1bGF0ZSgpIGRvbmUgYXQgYXJjaCBpbml0Cj4gY2FsbCBsZXZlbCB3b24n
dCBjcmVhdGUgdGhlIGRldmljZXMgb2YgYW4gYWNjZXNzIGNvbnRyb2xsZXIgY2hpbGQKPiBub2Rl
cy4gVGhlbiwgdGhlIGZpcmV3YWxsIGNvbnRyb2xsZXIgaGFzIGEgY2hhbmNlIHRvIGNsZWFyIHRo
ZSBmbGFnCj4gYmVmb3JlIHRoZSBzZWNvbmQgY2FsbCB0byB0aGlzIGZ1bmN0aW9uIGJ5IHRoZSBz
aW1wbGUtcG0tYnVzIGRyaXZlci4KPiAKPiBJZiB0aGUgY29udHJvbGxlciBtb2R1bGUgaXNuJ3Qg
cHJlc2VudCwgdGhlbiBpdCdzIGEgc2ltcGxlLWJ1cwo+IGJlaGF2aW9yIHRvIGV4dGVudCBvZiB0
aGUgY2hpbGQgZGV2aWNlcyBub3QgYmVpbmcgYWxsIGNyZWF0ZWQgaW4gdGhlCj4gZmlyc3QgcGxh
Y2UuIFRoaXMgc2hvdWxkbid0IGJlIGFuIGlzc3VlIGFzIGluIG9ubHkgY29uY2VybnMgY2hpbGRz
Cj4gb2Ygc3VjaCBidXMgdGhhdCBhcmVuJ3QgcHJvYmVkIGJlZm9yZSB0aGUgYnVzIGRyaXZlci4K
PiAKPiBJIGhhdmUgYSBwYXRjaCB0aGF0IEkgY2FuIHNlbmQgYXMgUkZDIG9uIHRvcCBvZiBteSBz
ZXJpZXMgaWYgbXkKPiBleHBsYW5hdGlvbiBpc24ndCBjbGVhciBlbm91Z2guCj4gCj4gMilNYWtl
IHRoZSBTVE0zMl9GSVJFV0FMTCBjb25maWd1cmF0aW9uIHN3aXRjaCBzZWxlY3QgdGhlIE9GX0RZ
TkFNSUMKPiBvbmUuIFRoaXMgd2F5IEkgY2FuIHVzZSBvZl9kZXRhY2hfbm9kZSgpIGZ1bmN0aW9u
IHRvIHJlbW92ZSB0aGUgbm9kZQo+IGZyb20gdGhlIGRldmljZSB0cmVlLiBUaGUgY29ucyBvZiB0
aGlzIGlzIHRoZSBkZXZpY2UgdHJlZSBpcyBub3cKPiB1c2VkIGF0IHJ1bnRpbWUuCj4gCj4gQXJl
IHlvdSBjb25zaWRlcmluZyBvbmUgb2YgdGhlc2UgdHdvIHByb3Bvc2l0aW9uIGFzIGEgdmlhYmxl
IHNvbHV0aW9uPwo+IAo+IEJlc3QgcmVnYXJkcywKPiBHYXRpZW4KPiAKPj4+IERldmljZXMgdGhh
dCBhcmUgdW5kZXIgdGhlIGZpcmV3YWxsIGNvbnRyb2xsZXIgKHNpbXBsZS1idXMpIG5vZGUKPj4+
IHNob3VsZCBub3QgYmUgcHJvYmVkIGJlZm9yZSBpdCBhcyB0aGV5J3JlIGNoaWxkIG9mIGl0Lgo+
Pgo+PiBmd19kZXZsaW5rIHNob3VsZCB0YWtlIGNhcmUgb2YgcGFyZW50L2NoaWxkIGRlcGVuZGVu
Y2llcyB3aXRob3V0IGFueQo+PiBleHBsaWNpdCBoYW5kbGluZyBvZiB0aGUgYWNjZXNzIGN0cmwg
YmluZGluZy4KPj4KPj4gUm9iCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
