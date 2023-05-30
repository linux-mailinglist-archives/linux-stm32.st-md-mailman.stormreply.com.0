Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F1D716354
	for <lists+linux-stm32@lfdr.de>; Tue, 30 May 2023 16:13:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1CB88C6A614;
	Tue, 30 May 2023 14:13:47 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0C2FFC65E5A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 May 2023 14:13:45 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 171DF8215F;
 Tue, 30 May 2023 16:13:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1685456025;
 bh=MwdNgsOpq9+luw2sK8Nh7b3bZbhR0jd153TLO6VHEDU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=exhf/ZyE5aMegR3pXj5TfRxgcbBike+rLedJK4FOCw2KB0xf7EWir0uR+gydiqL1h
 j9GfI6q0hbarZJKjtcrfviBLrg1D4jqz8xR6HxEjTp/NOyNf1IE86pRTlfoq4RN+xe
 b1e1rw/WOL3TU5RaxZvpo7NFn2ZkFwiVrJCNnw0Kg/r7p4MmNT5fvFr7cxKlkQjNOs
 Uf8cxL//gnM24ptdf4W/Yq73/voZ9KPhVN2Z9ZTZh1UKXQ/Mdfac7us3RRjy6EVrZu
 YOAiRsHmuPaXUUXPiavWV94vCfHeiqERzy2+PooP3H8NOs1Jgh5krppZGnklkpeflk
 V87lP+euzacig==
Message-ID: <eb76a6e9-150a-5daf-75fd-7574c36714f8@denx.de>
Date: Tue, 30 May 2023 16:13:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Amelie Delaunay <amelie.delaunay@foss.st.com>, linux-rtc@vger.kernel.org
References: <20230518003311.415018-1-marex@denx.de>
 <4a24cd14-9cca-7499-a0d3-37f7e4c3b087@foss.st.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <4a24cd14-9cca-7499-a0d3-37f7e4c3b087@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] rtc: stm32: Handle single EXTI IRQ as
	wake up source
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

T24gNS8zMC8yMyAxNjowMiwgQW1lbGllIERlbGF1bmF5IHdyb3RlOgo+IEhpIE1hcmVrLAoKSGVs
bG8gQW1lbGllLAoKPiBPbiA1LzE4LzIzIDAyOjMzLCBNYXJlayBWYXN1dCB3cm90ZToKPj4gVGhl
IGFyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNTEuZHRzaSBzcGVjaWZpZXMgb25lIGludGVycnVw
dCBmb3IgdGhlCj4+IFJUQyBub2RlLCB3aGlsZSB0aGUgZXhwZWN0YXRpb24gb2YgdGhlIFJUQyBk
cml2ZXIgaXMgdHdvIGludGVycnVwdHMgb24KPj4gU1RNMzJNUDE1eHggU29DLCBvbmUgY29ubmVj
dGVkIHRvIEdJQyBpbnRlcnJ1cHQgY29udHJvbGxlciBhbmQgYW5vdGhlcgo+PiBvbmUgdG8gRVhU
SS4gUGVyIFNUTTMyTVAxNXh4IHJlZmVyZW5jZSBtYW51YWwsIHRoZSB0d28gaW50ZXJydXB0cyBz
ZXJ2ZQo+PiB0aGUgc2FtZSBwdXJwb3NlLCBleGNlcHQgdGhlIEVYVEkgb25lIGNhbiBhbHNvIHdh
a2UgdGhlIHN5c3RlbSB1cC4gVGhlCj4+IEVYVEkgZHJpdmVyIGFscmVhZHkgaW50ZXJuYWxseSBo
YW5kbGVzIHRoaXMgR0lDIGFuZCBFWFRJIGR1YWxpdHkgYW5kCj4+IG1hcHMgdGhlIEVYVEkgaW50
ZXJydXB0IG9udG8gR0lDIGR1cmluZyBydW50aW1lLCBhbmQgb25seSB1c2VzIHRoZSBFWFRJCj4+
IGZvciB3YWtlIHVwIGZ1bmN0aW9uYWxpdHkuCj4+Cj4+IFRoZXJlZm9yZSwgZml4IHRoZSBkcml2
ZXIgc3VjaCB0aGF0IGlmIG9uIFNUTTMyTVAxNXh4IHRoZXJlIGlzIG9ubHkgb25lCj4+IGludGVy
cnVwdCBzcGVjaWZpZWQgaW4gdGhlIERULCB1c2UgdGhhdCBpbnRlcnJ1cHQgYXMgRVhUSSBpbnRl
cnJ1cHQgYW5kCj4+IHNldCBpdCBhcyB3YWtlIHVwIHNvdXJjZS4KPj4KPj4gVGhpcyBmaXhlcyB0
aGUgZm9sbG93aW5nIHdhcm5pbmcgaW4gdGhlIGtlcm5lbCBsb2cgb24gU1RNMzJNUDE1eHg6Cj4+
ICIKPj4gc3RtMzJfcnRjIDVjMDA0MDAwLnJ0YzogZXJyb3IgLUVOWElPOiBJUlEgaW5kZXggMSBu
b3QgZm91bmQKPj4gc3RtMzJfcnRjIDVjMDA0MDAwLnJ0YzogYWxhcm0gY2FuJ3Qgd2FrZSB1cCB0
aGUgc3lzdGVtOiAtNgo+PiAiCj4+Cj4+IFRoaXMgYWxzbyBmaXhlcyB0aGUgc3lzdGVtIHdha2Ug
dXAgdmlhIGJ1aWx0LWluIFJUQyB1c2luZyBlLmcuOgo+PiAkIHJ0Y3dha2UgLXMgNSAtbSBtZW0K
Pj4KPj4gRml4ZXM6IGI3MjI1MmI2NTgwYyAoInJ0Yzogc3RtMzI6IGFkZCBzdG0zMm1wMSBydGMg
c3VwcG9ydCIpCj4+IFNpZ25lZC1vZmYtYnk6IE1hcmVrIFZhc3V0IDxtYXJleEBkZW54LmRlPgo+
PiAtLS0KPj4gQ2M6IEFsZXNzYW5kcm8gWnVtbW8gPGEuenVtbW9AdG93ZXJ0ZWNoLml0Pgo+PiBD
YzogQWxleGFuZHJlIEJlbGxvbmkgPGFsZXhhbmRyZS5iZWxsb25pQGJvb3RsaW4uY29tPgo+PiBD
YzogQWxleGFuZHJlIFRvcmd1ZSA8YWxleGFuZHJlLnRvcmd1ZUBmb3NzLnN0LmNvbT4KPj4gQ2M6
IEFtZWxpZSBERUxBVU5BWSA8YW1lbGllLmRlbGF1bmF5QGZvc3Muc3QuY29tPgo+PiBDYzogTWF4
aW1lIENvcXVlbGluIDxtY29xdWVsaW4uc3RtMzJAZ21haWwuY29tPgo+PiBDYzogbGludXgtYXJt
LWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCj4+IENjOiBsaW51eC1ydGNAdmdlci5rZXJuZWwu
b3JnCj4+IENjOiBsaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCj4+IC0t
LQo+PiDCoCBkcml2ZXJzL3J0Yy9ydGMtc3RtMzIuYyB8IDkgKysrKystLS0tCj4+IMKgIDEgZmls
ZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL3J0Yy9ydGMtc3RtMzIuYyBiL2RyaXZlcnMvcnRjL3J0Yy1zdG0zMi5jCj4+
IGluZGV4IDIyOWNiMjg0N2NjNDguLjcyOTk0YjlmOTUzMTkgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZl
cnMvcnRjL3J0Yy1zdG0zMi5jCj4+ICsrKyBiL2RyaXZlcnMvcnRjL3J0Yy1zdG0zMi5jCj4+IEBA
IC03ODAsMTQgKzc4MCwxNSBAQCBzdGF0aWMgaW50IHN0bTMyX3J0Y19wcm9iZShzdHJ1Y3QgCj4+
IHBsYXRmb3JtX2RldmljZSAqcGRldikKPj4gwqDCoMKgwqDCoCByZXQgPSBkZXZpY2VfaW5pdF93
YWtldXAoJnBkZXYtPmRldiwgdHJ1ZSk7Cj4+IMKgwqDCoMKgwqAgaWYgKHJ0Yy0+ZGF0YS0+aGFz
X3dha2VpcnEpIHsKPj4gLcKgwqDCoMKgwqDCoMKgIHJ0Yy0+d2FrZWlycV9hbGFybSA9IHBsYXRm
b3JtX2dldF9pcnEocGRldiwgMSk7Cj4+ICvCoMKgwqDCoMKgwqDCoCBydGMtPndha2VpcnFfYWxh
cm0gPSBwbGF0Zm9ybV9nZXRfaXJxX29wdGlvbmFsKHBkZXYsIDEpOwo+PiDCoMKgwqDCoMKgwqDC
oMKgwqAgaWYgKHJ0Yy0+d2FrZWlycV9hbGFybSA+IDApIHsKPj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgcmV0ID0gZGV2X3BtX3NldF9kZWRpY2F0ZWRfd2FrZV9pcnEoJnBkZXYtPmRldiwK
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHJ0Yy0+d2FrZWlycV9hbGFybSk7Cj4+IC3CoMKgwqDCoMKgwqDCoCB9IGVs
c2Ugewo+PiArwqDCoMKgwqDCoMKgwqAgfSBlbHNlIGlmIChydGMtPndha2VpcnFfYWxhcm0gPT0g
LUVQUk9CRV9ERUZFUikgewo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXQgPSBydGMt
Pndha2VpcnFfYWxhcm07Cj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChydGMtPndha2Vp
cnFfYWxhcm0gPT0gLUVQUk9CRV9ERUZFUikKPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBnb3RvIGVycjsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byBlcnI7Cj4+ICvC
oMKgwqDCoMKgwqDCoCB9IGVsc2Ugewo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXQgPSBk
ZXZfcG1fc2V0X3dha2VfaXJxKCZwZGV2LT5kZXYsIHJ0Yy0+aXJxX2FsYXJtKTsKPj4gwqDCoMKg
wqDCoMKgwqDCoMKgIH0KPj4gwqDCoMKgwqDCoCB9Cj4+IMKgwqDCoMKgwqAgaWYgKHJldCkKPiAK
PiBJbiBvdXIgZG93bnN0cmVhbSBbMV0sIGRlZGljYXRlZCB3YWtldXAgaXJxIG1hbmFnZW1lbnQg
aXMgZHJvcHBlZDogaXQgaXMgCj4gbmVpdGhlciBkZXNjcmliZWQgaW4gc3Qsc3RtMzItcnRjIGJp
bmRpbmdzIG5vciB1c2VkIGluIFNUTTMyRngsIFNUTTMySHgsIAo+IFNUTTMyTVAxeCBkZXZpY2Ug
dHJlZXMuCj4gVGhlIHBvaW50ZWQgcGF0Y2ggaXMgZ29pbmcgdG8gYmUgdXBzdHJlYW1lZC4KPiAK
PiBbMV0gCj4gaHR0cHM6Ly9naXRodWIuY29tL1NUTWljcm9lbGVjdHJvbmljcy9saW51eC9jb21t
aXQvNWE0NWUxZjEwMGQ1OWMzM2I2YjUwZmU5OGMwZjYyODYyYmQ2ZjNkMgoKV29uJ3QgdGhhdCBi
cmVhayBjb21wYXRpYmlsaXR5IHdpdGggRFRzIHdoaWNoIGRvIHVzZSB0d28gaW50ZXJydXB0cyAK
ZW50cmllcyA/Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXN0bTMyCg==
