Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0FD966210
	for <lists+linux-stm32@lfdr.de>; Fri, 30 Aug 2024 14:54:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6C0C0C6DD9A;
	Fri, 30 Aug 2024 12:54:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CFDB7C6C841
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Aug 2024 12:54:23 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47U9mcvg031627;
 Fri, 30 Aug 2024 14:54:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 4uZ4dJscv0h077nNmSbVtKRKNbSXKqTdy9AY3iKyYOk=; b=XvVM3Cf3beE9mLtv
 K+oTaMCd+TsqkvVctBnxeep5PWpu0qme14Qc/h03KFQoAfjrr34RJMETAMhq5+fX
 cKOUX1IoZ5J73sxy4POCe6tfpa/c1ERq+D5rMa4NNMNbRDdh0VBSuajrqMdpetj4
 jx1Rdi7M5YRVpd++AuwTUz5N/f0vuKTKbHftxSYbwPzYPWJqdcQbgXkFb5PdLgoo
 4cM7D3gCnfUDA7LnAHN5vlykofScmOHN5vIIktw2oo+DJL4QHzz9NJNnJyIfroBG
 SKq4NqzCOBYc66r+jU1TYkrd3y+yD3BI1IYXndkTwBMWRY1GcV+Fc8Py122bJPX2
 IWjc5A==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 419putmpp0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Aug 2024 14:54:12 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 94E2F40044;
 Fri, 30 Aug 2024 14:54:08 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 60D5B2656DE;
 Fri, 30 Aug 2024 14:53:16 +0200 (CEST)
Received: from [10.129.178.212] (10.129.178.212) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Fri, 30 Aug
 2024 14:53:15 +0200
Message-ID: <777a92d9-ed52-4fa1-b235-e3a4a6321634@foss.st.com>
Date: Fri, 30 Aug 2024 14:53:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Conor Dooley <conor@kernel.org>
References: <20240828143452.1407532-1-christian.bruel@foss.st.com>
 <20240828143452.1407532-2-christian.bruel@foss.st.com>
 <20240828-handsfree-overarch-cd1af26cb0c5@spud>
 <005a2f7d-ab46-46c8-a0cc-b343685caf7c@foss.st.com>
 <20240829-manifesto-tray-65443d6e7e6e@spud>
Content-Language: en-US
From: Christian Bruel <christian.bruel@foss.st.com>
In-Reply-To: <20240829-manifesto-tray-65443d6e7e6e@spud>
X-Originating-IP: [10.129.178.212]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-30_07,2024-08-30_01,2024-05-17_01
Cc: kishon@kernel.org, robh@kernel.org, conor+dt@kernel.org,
 p.zabel@pengutronix.de, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, vkoul@kernel.org, mcoquelin.stm32@gmail.com,
 linux-phy@lists.infradead.org, krzk+dt@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 1/5] dt-bindings: phy: Add STM32MP25
	COMBOPHY bindings
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

Ck9uIDgvMjkvMjQgMTg6NDQsIENvbm9yIERvb2xleSB3cm90ZToKPiBPbiBUaHUsIEF1ZyAyOSwg
MjAyNCBhdCAwMTowNjo1M1BNICswMjAwLCBDaHJpc3RpYW4gQnJ1ZWwgd3JvdGU6Cj4+IE9uIDgv
MjgvMjQgMTg6MTEsIENvbm9yIERvb2xleSB3cm90ZToKPj4+IE9uIFdlZCwgQXVnIDI4LCAyMDI0
IGF0IDA0OjM0OjQ4UE0gKzAyMDAsIENocmlzdGlhbiBCcnVlbCB3cm90ZToKPj4+PiBEb2N1bWVu
dCB0aGUgYmluZGluZ3MgZm9yIFNUTTMyIENPTUJPUEhZIGludGVyZmFjZSwgdXNlZCB0byBzdXBw
b3J0Cj4+Pj4gdGhlIFBDSWUgYW5kIFVTQjMgc3RtMzJtcDI1IGRyaXZlcnMuCj4+Pj4gRm9sbG93
aW5nIGVudHJpZXMgY2FuIGJlIHVzZWQgdG8gdHVuZSBjYXJhY3RlcmlzYXRpb24gcGFyYW1ldGVy
cwo+Pj4+ICAgIC0gc3Qsb3V0cHV0LW1pY3JvLW9obXMgYW5kIHN0LG91dHB1dC12c3dpbmctbWlj
cm92b2x0IGJpbmRpbmdzIGVudHJpZXMKPj4+PiB0byB0dW5lIHRoZSBpbXBlZGFuY2UgYW5kIHZv
bHRhZ2Ugc3dpbmcgdXNpbmcgZGlzY3JldGUgc2ltdWxhdGlvbiByZXN1bHRzCj4+Pj4gICAgLSBz
dCxyeC1lcXVhbGl6ZXIgcmVnaXN0ZXIgdG8gc2V0IHRoZSBpbnRlcm5hbCByeCBlcXVhbGl6ZXIg
ZmlsdGVyIHZhbHVlLgo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEJydWVsIDxj
aHJpc3RpYW4uYnJ1ZWxAZm9zcy5zdC5jb20+Cj4+Pj4gLS0tCj4+Pj4gICAgLi4uL2JpbmRpbmdz
L3BoeS9zdCxzdG0zMm1wMjUtY29tYm9waHkueWFtbCAgIHwgMTI4ICsrKysrKysrKysrKysrKysr
Kwo+Pj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCAxMjggaW5zZXJ0aW9ucygrKQo+Pj4+ICAgIGNyZWF0
ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGh5L3N0LHN0
bTMybXAyNS1jb21ib3BoeS55YW1sCj4+Pj4KPj4+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BoeS9zdCxzdG0zMm1wMjUtY29tYm9waHkueWFtbCBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waHkvc3Qsc3RtMzJtcDI1LWNvbWJvcGh5
LnlhbWwKPj4+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+Pj4+IGluZGV4IDAwMDAwMDAwMDAwMC4u
OGQ0YTQwYjk0NTA3Cj4+Pj4gLS0tIC9kZXYvbnVsbAo+Pj4+ICsrKyBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9waHkvc3Qsc3RtMzJtcDI1LWNvbWJvcGh5LnlhbWwKPj4+PiBA
QCAtMCwwICsxLDEyOCBAQAo+Pj4+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIu
MCBPUiBCU0QtMi1DbGF1c2UpCj4+Pj4gKyVZQU1MIDEuMgo+Pj4+ICstLS0KPj4+PiArJGlkOiBo
dHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9waHkvc3Qsc3RtMzJtcDI1LWNvbWJvcGh5Lnlh
bWwjCj4+Pj4gKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29y
ZS55YW1sIwo+Pj4+ICsKPj4+PiArdGl0bGU6IFNUTWljcm9lbGVjdHJvbmljcyBTVE0zMk1QMjUg
VVNCMy9QQ0llIENPTUJPUEhZCj4+Pj4gKwo+Pj4+ICttYWludGFpbmVyczoKPj4+PiArICAtIENo
cmlzdGlhbiBCcnVlbCA8Y2hyaXN0aWFuLmJydWVsQGZvc3Muc3QuY29tPgo+Pj4+ICsKPj4+PiAr
ZGVzY3JpcHRpb246Cj4+Pj4gKyAgU2luZ2xlIGxhbmUgUEhZIHNoYXJlZCAoZXhjbHVzaXZlKSBi
ZXR3ZWVuIHRoZSBVU0IzIGFuZCBQQ0llIGNvbnRyb2xsZXJzLgo+Pj4+ICsgIFN1cHBvcnRzIDVH
Yml0L3MgZm9yIFVTQjMgYW5kIFBDSWUgZ2VuMiBvciAyLjVHYml0L3MgZm9yIFBDSWUgZ2VuMS4K
Pj4+PiArCj4+Pj4gK3Byb3BlcnRpZXM6Cj4+Pj4gKyAgY29tcGF0aWJsZToKPj4+PiArICAgIGNv
bnN0OiBzdCxzdG0zMm1wMjUtY29tYm9waHkKPj4+PiArCj4+Pj4gKyAgcmVnOgo+Pj4+ICsgICAg
bWF4SXRlbXM6IDEKPj4+PiArCj4+Pj4gKyAgIiNwaHktY2VsbHMiOgo+Pj4+ICsgICAgY29uc3Q6
IDEKPj4+PiArCj4+Pj4gKyAgY2xvY2tzOgo+Pj4+ICsgICAgbWluSXRlbXM6IDIKPj4+PiArICAg
IGl0ZW1zOgo+Pj4+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBhcGIgQnVzIGNsb2NrIG1hbmRhdG9y
eSB0byBhY2Nlc3MgcmVnaXN0ZXJzLgo+Pj4+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBrZXIgSW50
ZXJuYWwgUkNDIHJlZmVyZW5jZSBjbG9jayBmb3IgVVNCMyBvciBQQ0llCj4+Pj4gKyAgICAgIC0g
ZGVzY3JpcHRpb246IHBhZCBPcHRpb25hbCBvbiBib2FyZCBjbG9jayBpbnB1dCBmb3IgUENJZSBv
bmx5LiBUeXBpY2FsbHkgYW4KPj4+PiArICAgICAgICAgICAgICAgICAgICAgZXh0ZXJuYWwgMTAw
TWh6IG9zY2lsbGF0b3Igd2lyZWQgb24gZGVkaWNhdGVkIENMS0lOIHBhZC4gVXNlZCBhcyByZWZl
cmVuY2UKPj4+PiArICAgICAgICAgICAgICAgICAgICAgY2xvY2sgaW5wdXQgaW5zdGVhZCBvZiB0
aGUga2VyCj4+Pj4gKwo+Pj4+ICsgIGNsb2NrLW5hbWVzOgo+Pj4+ICsgICAgbWluSXRlbXM6IDIK
Pj4+PiArICAgIGl0ZW1zOgo+Pj4+ICsgICAgICAtIGNvbnN0OiBhcGIKPj4+PiArICAgICAgLSBj
b25zdDoga2VyCj4+Pj4gKyAgICAgIC0gY29uc3Q6IHBhZAo+Pj4+ICsKPj4+PiArICByZXNldHM6
Cj4+Pj4gKyAgICBtYXhJdGVtczogMQo+Pj4+ICsKPj4+PiArICByZXNldC1uYW1lczoKPj4+PiAr
ICAgIGNvbnN0OiBwaHkKPj4+PiArCj4+Pj4gKyAgcG93ZXItZG9tYWluczoKPj4+PiArICAgIG1h
eEl0ZW1zOiAxCj4+Pj4gKwo+Pj4+ICsgIHdha2V1cC1zb3VyY2U6IHRydWUKPj4+PiArCj4+Pj4g
KyAgaW50ZXJydXB0czoKPj4+PiArICAgIG1heEl0ZW1zOiAxCj4+Pj4gKyAgICBkZXNjcmlwdGlv
bjogaW50ZXJydXB0IHVzZWQgZm9yIHdha2V1cAo+Pj4+ICsKPj4+PiArICBhY2Nlc3MtY29udHJv
bGxlcnM6Cj4+Pj4gKyAgICBtaW5JdGVtczogMQo+Pj4+ICsgICAgbWF4SXRlbXM6IDIKPj4+IENh
biB5b3UgcGxlYXNlIGRlc2NyaWJlIHRoZSBpdGVtcyBoZXJlPwo+PiBJIGNhbiBzcGVjaWFsaXpl
IHRoZSBkZXNjcmlwdGlvbjogIlBoYW5kbGUgdG8gdGhlIHJpZnNjIGZpcmV3YWxsIGRldmljZSB0
byBjaGVjayBhY2Nlc3MgcmlnaHQuIgo+IFJpZ2h0LCBidXQgdGhlcmUgYXJlIHBvdGVudGlhbGx5
IHR3byBhY2Nlc3MgY29udHJvbGxlcnMgaGVyZS4gWW91IG5lZWQKPiB0byBkZXNjcmliZSB3aGlj
aCBpcyB3aGljaCwgc28gdGhhdCBwZW9wbGUgY2FuIGhvb2sgdGhlbSB1cCBpbiB0aGUKPiBjb3Jy
ZWN0IG9yZGVyLiBJbiB3aGF0IGNhc2UgYXJlIHRoZXJlIHR3bz8gWW91ciBkdHMgcGF0Y2ggb25s
eSBoYXMgb25lLgoKKHNvcnJ5LCByZXNlbnQgaW4gcGxhaW4gdGVzdCkKCnllcywgd2UgZG9uJ3Qg
aGF2ZSBtb3JlIHRoYW4gMSBjb250cm9sbGVyIGluIHRoZSBjdXJyZW50IHNldHVwLAoKSSdsbCB1
c2UgbWF4SXRlbXM6IDEKCj4+IG90aGVyd2lzZSBkZXNjcmliZWQgaW4gYWNjZXNzLWNvbnRyb2xs
ZXJzL2FjY2Vzcy1jb250cm9sbGVycy55YW1sLCBzZWUgYWxzbyBiaW5kaW5ncy9idXMvc3Qsc3Rt
MzJtcDI1LXJpZnNjLnlhbWwKPj4KPj4+PiArICBzdCxzeXNjZmc6Cj4+Pj4gKyAgICAkcmVmOiAv
c2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy9waGFuZGxlCj4+Pj4gKyAgICBkZXNjcmlw
dGlvbjogUGhhbmRsZSB0byB0aGUgU1lTQ09OIGVudHJ5IHJlcXVpcmVkIGZvciBjb25maWd1cmlu
ZyBQQ0llCj4+Pj4gKyAgICAgIG9yIFVTQjMuCj4+PiBXaHkgaXMgYSBwaGFuZGxlIHJlcXVpcmVk
IGZvciB0aGlzIGxvb2t1cCwgcmF0aGVyIHRoYW4gZG9pbmcgaXQgYnkKPj4+IGNvbXBhdGlibGU/
Cj4+IHRoZSBwaGFuZGxlIGlzIHVzZWQgdG8gc2VsZWN0IHRoZSBzeXNjb25mIFNvQyBjb25maWd1
cmF0aW9uIHJlZ2lzdGVyCj4+IGRlcGVuZGluZyBvbiB0aGUgUENJZS9VU0IzIG1vZGUgKHNlbGVj
dGVkIGJ5wqB4bGF0ZSBmdW5jdGlvbiksIHNvIGl0J3Mgbm90Cj4+IGxpa2UgYSBsb29rdXAgaGVy
ZS4KPiBJZiAic3lzY29uX3JlZ21hcF9sb29rdXBfYnlfcGhhbmRsZSgpIiBpcyBub3QgYSBsb29r
dXAsIHRoZW4gSSBkbyBub3QKPiBrbm93IHdoYXQgaXMuIEFuIGV4YW1wbGUganVzdGlmaWNhdGlv
biBmb3IgaXQgd291bGQgYmUgdGhhdCB0aGVyZSBhcmUKPiBtdWx0aXBsZSBjb21ib3BoeXMgb24g
dGhlIHNhbWUgc29jLCBlYWNoIHVzaW5nIGEgZGlmZmVyZW50IHN5c2NvbmYKPiByZWdpb24uIFlv
dXIgZHRzIHN1Z2dlc3RzIHRoYXQgaXMgbm90IHRoZSBjYXNlIHRob3VnaCwgc2luY2UgeW91IGhh
dmUKPiBzdCxzeXNjZmcgPSA8JnN5c2NmZz47IGluIGl0LCByYXRoZXIgdGhhbiBzdCxzeXNjZmcg
PSA8JnN5c2NmZzA+Oy4KCkkgZGlkbid0IGdldCB5b3VyIHN1Z2dlc3Rpb24gZWFybGllciB0byB1
c2UgInN5c2Nvbl9yZWdtYXBfbG9va3VwX2J5X2NvbXBhdGlibGUoKSIuCgpXZSBoYXZlIHNldmVy
YWwgb3RoZXIgc3lzY29uIGluIHRoZSBvdGhlci4gVGhhdCdzIHdoeSB3ZSBjaG9vc2UgYSBkaXJl
Y3Qgc3lzY2ZnIHBoYW5kbGUKCj4KPj4gVGhpcyBzeXNjb25mIHJlZ2lzdGVyIGlzIGFsc28gdXNl
ZCBmb3Igb3RoZXIgc2V0dGluZ3MKPj4gc3VjaCBhcyB0aGUgUExMLCBSZWZlcmVuY2UgY2xvY2sg
c2VsZWN0aW9uLCAuLi4KPj4KPj4+PiArCj4+Pj4gKyAgc3Qsc3NjLW9uOgo+Pj4+ICsgICAgdHlw
ZTogYm9vbGVhbgo+Pj4gZmxhZywgbm90IGJvb2xlYW4sIGZvciBwcmVzZW5jZSBiYXNlZCBzdHVm
Zi4gQW5kIGluIHRoZSBkcml2ZXIsCj4+PiBzL29mX3Byb3BlcnR5X3JlYWRfYm9vbC9vZl9wcm9w
ZXJ0eV9wcmVzZW50Ly4KPj4gb2sKPj4KPj4+PiArICAgIGRlc2NyaXB0aW9uOgo+Pj4+ICsgICAg
ICBBIGJvb2xlYW4gcHJvcGVydHkgd2hvc2UgcHJlc2VuY2UgaW5kaWNhdGVzIHRoYXQgdGhlIFNT
QyBmb3IgY29tbW9uIGNsb2NrCj4+Pj4gKyAgICAgIG5lZWRzIHRvIGJlIHNldC4KPj4+IEFuZCB3
aGF0LCBtYXkgSSBhc2ssIGRvZXMgIlNTQyIgbWVhbj8gIkNvbW1vbiBjbG9jayIgaXMgYWxzbyBh
IGJpdCBvZiBhCj4+PiAibGludXhpc20iLCB3aGF0IGRvZXMgdGhpcyBhY3R1YWxseSBkbyBpbiB0
aGUgaGFyZHdhcmUgYmxvY2s/Cj4+IFNTQyBmb3IgU3ByZWFkIFNwZWN0cnVtIENsb2NraW5nLiBJ
dCBpcyBhbiBoYXJkd2FyZSBzZXR0aW5nIGZvciB0aGUgMTAwTWh6IFBDSWUgcmVmZXJlbmNlIGNv
bW1vbiBjbG9jaywKPiBBaCwgc28gbm90IHJlYWxseSBhICJjb21tb24gY2xvY2siIGxpbnV4aXNt
IGF0IGFsbC4KPgo+PiBJIHdpbGwgcmVwaHJhc2UgdGhlIGRlc2NyaXB0aW9uCj4gSG93IGlzIHNv
bWVvbmUgc3VwcG9zZWQgdG8gZGVjaWRlIGJldHdlZW4gb24gYW5kIG9mZj8gSXMgaXQgYWx3YXlz
IG9uCj4gZm9yIFBDSWUsIG9yIG9ubHkgb24gaW4gc29tZSBjb25maWd1cmF0aW9ucz8gT3IgbWF5
YmUgb25seSAob3IgYWx3YXlzPykgb24KPiBpZiB0aGUgcGFkIGNsb2NrIGlzIHByb3ZpZGVkPwoK
U1NDIGlzIG9mZiBieSBkZWZhdWx0IGFuZCBhdmFpbGFibGUgZm9yIHRoZSBQQ0llIHBhZCBjbG9j
ay4gaXQgbXVzdCBiZSBkZWZpbmVkIGZvciBVU0IzCgp0aGFua3MKCkNocmlzdGlhbgoKPgo+IENo
ZWVycywKPiBDb25vci4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxt
YW4vbGlzdGluZm8vbGludXgtc3RtMzIK
