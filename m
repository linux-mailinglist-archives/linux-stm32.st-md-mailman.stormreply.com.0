Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D287647B0B5
	for <lists+linux-stm32@lfdr.de>; Mon, 20 Dec 2021 16:53:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 81772C5E2C4;
	Mon, 20 Dec 2021 15:53:41 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5CB06C597BA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Dec 2021 15:53:40 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1BKB4Q9e022873;
 Mon, 20 Dec 2021 16:53:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : subject
 : from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=selector1;
 bh=Jgsa623SaViueGDOZhOSg8j75LYCq3JkOD9aq+r/VfQ=;
 b=Ldd5V86MOT/fE2WF4Lg2DS8jBjbIvCL4my+RuOlmH9NHg5Jz0/O/lZqlhOtJ4SKESwV+
 2wo+st4yxIOSOzjHtynk+FNnuMp5Ua1/1mJox/Co0VfeEHcBbTK5pT+04gvAuHQKTGGj
 odrpRrq+Zo4LPAhJTO00OjEErxPppMMtd+Yr5Y6MomCgCPOQ2tNskW43nFX7khUYIZCt
 iFTIRLEEfH9lrB3KgyHY9LzdErs2ZCs7ubnTmg+sowEQ4Cj4A3/BE7rjVYz0JCSzcRdA
 YCJRnM/Z5HOkW3T6eHaIKRVqV+EpBLodW1+iitopQBxJBNJlqrOhG1p3MfrrTLklEEgg zw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3d2kjnkbee-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Dec 2021 16:53:20 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B828C10002A;
 Mon, 20 Dec 2021 16:53:18 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AEF9D207546;
 Mon, 20 Dec 2021 16:53:18 +0100 (CET)
Received: from [192.168.8.15] (10.75.127.46) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Mon, 20 Dec
 2021 16:53:17 +0100
Message-ID: <210c1e7c333b42702ac0c3ba0da639e82327d035.camel@foss.st.com>
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Andrzej Hajda
 <a.hajda@samsung.com>, Daniel Vetter <daniel@ffwll.ch>, David Airlie
 <airlied@linux.ie>, Jernej Skrabec <jernej.skrabec@gmail.com>, "Jonas
 Karlman" <jonas@kwiboo.se>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>,
 <dri-devel@lists.freedesktop.org>
Date: Mon, 20 Dec 2021 16:53:12 +0100
In-Reply-To: <164001209406.2512616.469307346369770543@Monstersaurus>
References: <20211218182804.208906-1-antonio.borneo@foss.st.com>
 <164001209406.2512616.469307346369770543@Monstersaurus>
User-Agent: Evolution 3.42.2 
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-20_07,2021-12-20_01,2021-12-02_01
Cc: linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] drm: adv7511: override i2c address of cec
 before accessing it
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

T24gTW9uLCAyMDIxLTEyLTIwIGF0IDE0OjU0ICswMDAwLCBLaWVyYW4gQmluZ2hhbSB3cm90ZToK
PiBIaSBBbnRvbmlvLAo+IAo+IFF1b3RpbmcgQW50b25pbyBCb3JuZW8gKDIwMjEtMTItMTggMTg6
Mjg6MDQpCj4gPiBDb21taXQgNjgwNTMyYzUwYmNhICgiZHJtOiBhZHY3NTExOiBBZGQgc3VwcG9y
dCBmb3IKPiA+IGkyY19uZXdfc2Vjb25kYXJ5X2RldmljZSIpIGFsbG93cyBhIGRldmljZSB0cmVl
IG5vZGUgdG8gb3ZlcnJpZGUKPiA+IHRoZSBkZWZhdWx0IGFkZHJlc3NlcyBvZiB0aGUgc2Vjb25k
YXJ5IGkyYyBkZXZpY2VzLiBUaGlzIGlzIHVzZWZ1bAo+ID4gZm9yIHNvbHZpbmcgYWRkcmVzcyBj
b25mbGljdHMgb24gdGhlIGkyYyBidXMuCj4gPiAKPiA+IEluIGFkdjc1MTFfaW5pdF9jZWNfcmVn
bWFwKCkgdGhlIG5ldyBpMmMgYWRkcmVzcyBvZiBjZWMgZGV2aWNlIGlzCj4gPiByZWFkIGZyb20g
ZGV2aWNlIHRyZWUgYW5kIGltbWVkaWF0ZWx5IGFjY2Vzc2VkLCB3ZWxsIGJlZm9yZSBpdCBpcwo+
ID4gd3JpdHRlbiBpbiB0aGUgcHJvcGVyIHJlZ2lzdGVyIHRvIG92ZXJyaWRlIHRoZSBkZWZhdWx0
IGFkZHJlc3MuCj4gPiBUaGlzIGNhbiBjYXVzZSBhbiBpMmMgZXJyb3IgZHVyaW5nIHByb2JlIGFu
ZCBhIGNvbnNlcXVlbnQgcHJvYmUKPiA+IGZhaWx1cmUuCj4gCj4gT3VjaCwgaXQgZG9lcyBzZWVt
IHRoYXQgd2F5LiBJIGd1ZXNzIG5vIG9uZSBoYXMgdXNlZCB0aGUgQ0VDIGZvcgo+IHF1aXRlCj4g
c29tZSB0aW1lLCBhcyBpdCBtdXN0IGhhdmUgYmVlbiBsaWtlIHRoaXMgZm9yIGEgd2hpbGU/CgpV
c2luZyB0aGUgZGVmYXVsdCBpMmMgYWRkcmVzcyBmb3IgY2VjIHdvcmtzIHdpdGhvdXQgcHJvYmxl
bTsgYXBwYXJlbnRseQpldmVyeW9uZSBpcyBoYXBweSB3aXRoIHN1Y2ggZGVmYXVsdC4gVGhlIGlz
c3VlIGFwcGVhcnMgb25seSB3aGVuIHlvdQpoYXZlIHRvIG92ZXJyaWRlIHRoZSBkZWZhdWx0IGNl
YyBhZGRyZXNzLgpUaGUgY29tbWl0IDY4MDUzMmM1MGJjYSBsYW5kZWQgaW4gdjQuMTguCgo+ID4g
T25jZSB0aGUgbmV3IGkyYyBhZGRyZXNzIGlzIHJlYWQgZnJvbSB0aGUgZGV2aWNlIHRyZWUsIG92
ZXJyaWRlCj4gPiB0aGUgZGVmYXVsdCBhZGRyZXNzIGJlZm9yZSBhbnkgYXR0ZW1wdCB0byBhY2Nl
c3MgdGhlIGNlYy4KPiAKPiBSZXZpZXdlZC1ieTogS2llcmFuIEJpbmdoYW0gPGtpZXJhbi5iaW5n
aGFtK3JlbmVzYXNAaWRlYXNvbmJvYXJkLmNvbT4KClRoYW5rcyEKQW50b25pbwoKPiA+IFRlc3Rl
ZCB3aXRoIGFkdjc1MzMgYW5kIHN0bTMybXAxNTdmLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBB
bnRvbmlvIEJvcm5lbyA8YW50b25pby5ib3JuZW9AZm9zcy5zdC5jb20+Cj4gPiBGaXhlczogNjgw
NTMyYzUwYmNhICgiZHJtOiBhZHY3NTExOiBBZGQgc3VwcG9ydCBmb3IKPiA+IGkyY19uZXdfc2Vj
b25kYXJ5X2RldmljZSIpCj4gPiAtLS0KPiA+IFRvOiBBbmRyemVqIEhhamRhIDxhLmhhamRhQHNh
bXN1bmcuY29tPgo+ID4gVG86IE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJheWxpYnJlLmNv
bT4KPiA+IFRvOiBSb2JlcnQgRm9zcyA8cm9iZXJ0LmZvc3NAbGluYXJvLm9yZz4KPiA+IFRvOiBM
YXVyZW50IFBpbmNoYXJ0IDxMYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+Cj4gPiBU
bzogSm9uYXMgS2FybG1hbiA8am9uYXNAa3dpYm9vLnNlPgo+ID4gVG86IEplcm5laiBTa3JhYmVj
IDxqZXJuZWouc2tyYWJlY0BnbWFpbC5jb20+Cj4gPiBUbzogRGF2aWQgQWlybGllIDxhaXJsaWVk
QGxpbnV4LmllPgo+ID4gVG86IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiA+IFRv
OiBLaWVyYW4gQmluZ2hhbSA8a2llcmFuLmJpbmdoYW0rcmVuZXNhc0BpZGVhc29uYm9hcmQuY29t
Pgo+ID4gVG86IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiA+IENjOiBsaW51eC1r
ZXJuZWxAdmdlci5rZXJuZWwub3JnCj4gPiBDYzogbGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbQo+ID4gLS0tCj4gPiDCoGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYWR2NzUx
MS9hZHY3NTExX2Rydi5jIHwgNyArKysrLS0tCj4gPiDCoDEgZmlsZSBjaGFuZ2VkLCA0IGluc2Vy
dGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYnJpZGdlL2Fkdjc1MTEvYWR2NzUxMV9kcnYuYwo+ID4gYi9kcml2ZXJzL2dwdS9kcm0v
YnJpZGdlL2Fkdjc1MTEvYWR2NzUxMV9kcnYuYwo+ID4gaW5kZXggNzY1NTVhZTY0ZTljLi42Mjll
MDUyODZmZDkgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2Fkdjc1MTEv
YWR2NzUxMV9kcnYuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hZHY3NTExL2Fk
djc1MTFfZHJ2LmMKPiA+IEBAIC0xMDQ4LDYgKzEwNDgsMTAgQEAgc3RhdGljIGludCBhZHY3NTEx
X2luaXRfY2VjX3JlZ21hcChzdHJ1Y3QKPiA+IGFkdjc1MTEgKmFkdikKPiA+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAKPiA+IEFEVjc1MTFfQ0VDX0kyQ19BRERSX0RFRkFV
TFQpOwo+ID4gwqDCoMKgwqDCoMKgwqAgaWYgKElTX0VSUihhZHYtPmkyY19jZWMpKQo+ID4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBQVFJfRVJSKGFkdi0+aTJjX2NlYyk7
Cj4gPiArCj4gPiArwqDCoMKgwqDCoMKgIHJlZ21hcF93cml0ZShhZHYtPnJlZ21hcCwgQURWNzUx
MV9SRUdfQ0VDX0kyQ19BRERSLAo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGFkdi0+aTJjX2NlYy0+YWRkciA8PCAxKTsKPiA+ICsKPiA+IMKgwqDCoMKgwqDCoMKg
IGkyY19zZXRfY2xpZW50ZGF0YShhZHYtPmkyY19jZWMsIGFkdik7Cj4gPiDCoAo+ID4gwqDCoMKg
wqDCoMKgwqAgYWR2LT5yZWdtYXBfY2VjID0gZGV2bV9yZWdtYXBfaW5pdF9pMmMoYWR2LT5pMmNf
Y2VjLAo+ID4gQEAgLTEyNTIsOSArMTI1Niw2IEBAIHN0YXRpYyBpbnQgYWR2NzUxMV9wcm9iZShz
dHJ1Y3QgaTJjX2NsaWVudAo+ID4gKmkyYywgY29uc3Qgc3RydWN0IGkyY19kZXZpY2VfaWQgKmlk
KQo+ID4gwqDCoMKgwqDCoMKgwqAgaWYgKHJldCkKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBnb3RvIGVycl9pMmNfdW5yZWdpc3Rlcl9wYWNrZXQ7Cj4gPiDCoAo+ID4gLcKgwqDC
oMKgwqDCoCByZWdtYXBfd3JpdGUoYWR2NzUxMS0+cmVnbWFwLCBBRFY3NTExX1JFR19DRUNfSTJD
X0FERFIsCj4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYWR2NzUx
MS0+aTJjX2NlYy0+YWRkciA8PCAxKTsKPiA+IC0KPiA+IMKgwqDCoMKgwqDCoMKgIElOSVRfV09S
SygmYWR2NzUxMS0+aHBkX3dvcmssIGFkdjc1MTFfaHBkX3dvcmspOwo+ID4gwqAKPiA+IMKgwqDC
oMKgwqDCoMKgIGlmIChpMmMtPmlycSkgewo+ID4gCj4gPiBiYXNlLWNvbW1pdDogZmM3NDg4MWMy
OGQzMTRiMTBlZmFjMDE2ZWY0OWRmNGZmNDBiOGI5Nwo+ID4gLS0gCj4gPiAyLjM0LjEKPiA+IAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3Rt
MzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20K
aHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtc3RtMzIK
