Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D2E54E659
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Jun 2022 17:46:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 026DFC56630;
	Thu, 16 Jun 2022 15:46:15 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B051CC03FC8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Jun 2022 15:46:13 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25GAlYXp015307;
 Thu, 16 Jun 2022 17:46:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : from : to : references : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=QSTjppIUfixnnw6W76SY/fokutF3kVd1hEmLqmScrOg=;
 b=wCRyteh84nkmBr1KMp/7LkdEEmqEDyCjofdSMuB3BAudyBHw5Uw1iyqqvMyE2DWnAxWn
 yJgzupVJuAPzA7FGh8CWBSNRkwthoNlmgrviy+WUK/1Z7kdCP/K0ZJiumaf9mlSQ8FfP
 xu95SEtne87Mff/GmB/hBb69kMZNVtfcFLdbVD+liwUfzzQS+cC6HxS1Dqwm3aUy4V+D
 9mXzQmtv1VeeDdYcQk+BrorFtrAsm8ApykRPv8jKZh22XyomabEhNBiFF4O73eYukbT1
 6mAwsvcfOxafzmwpX1/pG4eTTAJRrs3IFiwROjN27I6z1rjXFYXuyW4unFxp7+RC5RWb Ow== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3gmjd2aw28-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Jun 2022 17:46:10 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 39F86100034;
 Thu, 16 Jun 2022 17:46:10 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 32028222C84;
 Thu, 16 Jun 2022 17:46:10 +0200 (CEST)
Received: from [10.201.21.93] (10.201.21.93) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Thu, 16 Jun
 2022 17:46:08 +0200
Message-ID: <e70fb9b3-0d9d-4ac0-8580-62b1b8beaaa1@foss.st.com>
Date: Thu, 16 Jun 2022 17:46:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
To: Kegl Rohit <keglrohit@gmail.com>,
 <linux-stm32@st-md-mailman.stormreply.com>, Fabien Dessenne
 <fabien.dessenne@foss.st.com>
References: <CAMeyCbhVim1AxYGD76yezzkfx6+cXrdpGOOfgPYhB4p7yPtdWQ@mail.gmail.com>
 <ec0632d6-82dc-f458-f7ba-c7db5b7ee5d8@foss.st.com>
In-Reply-To: <ec0632d6-82dc-f458-f7ba-c7db5b7ee5d8@foss.st.com>
X-Originating-IP: [10.201.21.93]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-16_12,2022-06-16_01,2022-02-23_01
Subject: Re: [Linux-stm32] STM32MP151A sysfs
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

T24gNi8xNi8yMiAxNzoxOSwgQWxleGFuZHJlIFRPUkdVRSB3cm90ZToKPiBIaSBLZWdsCj4gCj4g
T24gNi8xNS8yMiAwNzo0MSwgS2VnbCBSb2hpdCB3cm90ZToKPj4gSGVsbG8hCj4+Cj4+IEkgY291
bGQgbm90aWNlIGZvbGxvd2luZyBpc3N1ZSB3aXRoIGtlcm5lbCB2ZXJzaW9uIDUuMTAuNjE6Cj4+
IEV4cG9ydGluZyBHUElPIFBCMTIgYW5kIFBEMTIgdmlhIHN5c2ZzIHRyaWdnZXJzIGEga2VybmVs
IEVSUk9SLgo+PiBBZnRlciB0aGUgZXJyb3IgaGFwcGVuZCB0aGUgZ3BpbyBzdGlsbCBnb3QgZXhw
b3J0ZWQgYW5kIHNlZW0gdG8gZnVuY3Rpb24uCj4+Cj4+IEJvdGggUGlucyBhcmUgdW5jbGFpbWVk
Ogo+PiBncmVwIC1lIFBCMTIgLWUgUEQxMgo+PiAvc3lzL2tlcm5lbC9kZWJ1Zy9waW5jdHJsL3Nv
Y1w6cGluLWNvbnRyb2xsZXJANTAwMDIwMDAvcGlubXV4LXBpbnMKPj4gcGluIDI4IChQQjEyKTog
VU5DTEFJTUVECj4+IHBpbiA2MCAoUEQxMik6IFVOQ0xBSU1FRAo+Pgo+PiByb290QGRldjovc3lz
L2NsYXNzL2dwaW8jIGVjaG8gNjAgPiBleHBvcnQKPj4gcm9vdEBkZXY6L3N5cy9jbGFzcy9ncGlv
IyBlY2hvIDI4ID4gZXhwb3J0Cj4+IFvCoMKgIDMwLjQ2NzM3MF0gc3RtMzJtcDE1Ny1waW5jdHJs
IHNvYzpwaW4tY29udHJvbGxlckA1MDAwMjAwMDogaXJxCj4+IGxpbmUgMTIgYWxyZWFkeSByZXF1
ZXN0ZWQuCj4+Cj4+IFRoZSBvcmRlciBkb2VzIG5vdCBtYXR0ZXI6Cj4+IHJvb3RAZGV2Oi9zeXMv
Y2xhc3MvZ3BpbyMgZWNobyA2MCA+IGV4cG9ydAo+PiByb290QGRldjovc3lzL2NsYXNzL2dwaW8j
IGVjaG8gMjggPiBleHBvcnQKPj4gW8KgwqAgMjAuNzY4NDkzXSBzdG0zMm1wMTU3LXBpbmN0cmwg
c29jOnBpbi1jb250cm9sbGVyQDUwMDAyMDAwOiBpcnEKPj4gbGluZSAxMiBhbHJlYWR5IHJlcXVl
c3RlZC4KPj4KPj4gVGhpcyBpcyB0aGUgZGV2X2VyciBjb2RlIHBhcnQ6Cj4+IGh0dHBzOi8vZ2l0
aHViLmNvbS9TVE1pY3JvZWxlY3Ryb25pY3MvbGludXgvY29tbWl0LzhlYjJkZmVlOWZiMTI3N2Y2
MzVjZTM2OWVmODY2OWRmMGVjNDIxYmMjZGlmZi01NDlkODM1MDNhMjU4OTQwZmZhNjYxN2RiYmY0
ODU5ZDQ2M2ZjYWM5NGYzNzZiNDViMTc0NGQyNDNmZmU5YjE2UjM4MSAKPj4KPj4KPj4gU2VlbXMg
dGhhdCBncGlvIHN5c2ZzIHJlcXVlc3RzIGFuIElSUSBldmVyeSB0aW1lIGFuZCB0aGVyZSBpcyBz
b21lCj4+IHNoYXJlZCBJUlEgbGltaXRhdGlvbiB3aGljaCBpcyBub3QgaW1wbGVtZW50ZWQgLyBo
YW5kbGVkIHlldC4KPj4KPj4gQ2FuIHNvbWVvbmUgcmVwcm9kdWNlIHRoaXM/IE1heWJlIGl0IGlz
IG9ubHkgYSB1c2FnZSAvIGtlcm5lbCAvCj4+IGRldmljZXRyZWUgc2V0dXAgZXJyb3IgYnkgbWUu
Li4KPj4gT3IgaXMgdGhpcyBhIFNUTTMyTVAxIGxpbWl0YXRpb24/IGdwaW8gc3lzZnMgYnVnIHdp
dGggU1RNMzJNUDE/IC4uLgo+Pgo+IAo+IEkganVzdCBkbyB0aGUgdGVzdCBvbiBteSBESzIgYm9h
cmQuIEknbSBub3QgYWJsZSB0byByZXByb2R1Y2UgKGV2ZW4gaWYgSSAKPiBhZGQgYSBnaW8ta2V5
cyB1c2luZyB0aGUgRVhUSSBsaW5lIDEyKS4KPiAKPiBXaGljaCBTVE0zMk1QMTUxIGRvIHlvdSB1
c2UgPwoKTm90ZSBhbHNvIHRoYXQgdGhpcyBpbnRlcmZhY2Ugc2VlbXMgdG8gYmUgZGVwcmVjYXRl
ZCBzaW5jZSB2NC44LiBTb21lIAp0aXBzIHRvIG1vdmUgb24gdGhlIG5ldyBpbnRlcmZhY2UgaW4g
dGhlIGZvbGxvd2luZyBsaW5rOgoKaHR0cHM6Ly93d3cudGhlZ29vZHBlbmd1aW4uY28udWsvYmxv
Zy9zdG9wLXVzaW5nLXN5cy1jbGFzcy1ncGlvLWl0cy1kZXByZWNhdGVkLwoKCj4gCj4gcmVnYXJk
cwo+IEFsZXgKPiAKPiAKPiAKPj4KPj4gVGhhbmtzIGluIGFkdmFuY2UuCj4+IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+IExpbnV4LXN0bTMyIG1haWxp
bmcgbGlzdAo+PiBMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCj4+IGh0
dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXN0bTMyCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KPiBMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKPiBMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tCj4gaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21h
aWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBz
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
