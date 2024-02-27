Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1C2869E1E
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Feb 2024 18:44:36 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CA629C6DD66;
	Tue, 27 Feb 2024 17:44:35 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 20AF8C6DD65
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Feb 2024 17:44:34 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41RBi3K0029671; Tue, 27 Feb 2024 18:44:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=ZKduf9VukNB9GBil78oMEdLFb1eDrPFu/obW2gUDxi8=; b=GT
 W7VrNVOHVlekUom1ghEc7syzR22wSOzNMR4KhEH6FnUfWVy3FAUsauLzn/u5LW8B
 qrYNf5siWD0a6Ya7l5iByf2o+DW2VqV+oHHyPCYZZd0V+DLjTDxBbVfmpkO0elSm
 OWrC0vVO4oLDpYbyX1foWxyZAlEEVVZh7ydyUFpsIZa0fE0X9woJbQEwBEuEF80x
 YowXwha/s2fdw30aFR8Z6mY8ccUNxKvayeK2YSzh1whgNgjj3aDukUsYk0EIoLkp
 SN7gOXNR1hCJj+hnOxE/yAKzFRc63cZ7I8DiNH30qRU3xqXlI4S1RIzPkUFbnHRt
 APtvf4GpWfarRqEzTc4Q==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3whf4b9dpq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Feb 2024 18:44:23 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id D992F4002D;
 Tue, 27 Feb 2024 18:44:17 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4474F2ADF56;
 Tue, 27 Feb 2024 18:43:52 +0100 (CET)
Received: from [10.252.26.109] (10.252.26.109) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 27 Feb
 2024 18:43:49 +0100
Message-ID: <09262390-388f-402f-99e6-ea6229107119@foss.st.com>
Date: Tue, 27 Feb 2024 18:43:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: William Breathitt Gray <william.gray@linaro.org>
References: <20231220145726.640627-1-fabrice.gasnier@foss.st.com>
 <20231220145726.640627-11-fabrice.gasnier@foss.st.com>
 <ZZxyDbYC9oHNKcGF@ubuntu-server-vm-macos>
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
In-Reply-To: <ZZxyDbYC9oHNKcGF@ubuntu-server-vm-macos>
X-Originating-IP: [10.252.26.109]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-27_05,2024-02-27_01,2023-05-22_02
Cc: linux-iio@vger.kernel.org, lee@kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 10/10] counter: stm32-timer-cnt: add
 support for capture events
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

T24gMS84LzI0IDIzOjA3LCBXaWxsaWFtIEJyZWF0aGl0dCBHcmF5IHdyb3RlOgo+IE9uIFdlZCwg
RGVjIDIwLCAyMDIzIGF0IDAzOjU3OjI2UE0gKzAxMDAsIEZhYnJpY2UgR2FzbmllciB3cm90ZToK
Pj4gKwkvKgo+PiArCSAqIGNvbmZpZ3VyZSBjaGFubmVsIGluIGlucHV0IGNhcHR1cmUgbW9kZSwg
bWFwIGNoYW5uZWwgMSBvbiBUSTEsIGNoYW5uZWwyIG9uIFRJMi4uLgo+PiArCSAqIFNlbGVjdCBi
b3RoIGVkZ2VzIC8gbm9uLWludmVydGVkIHRvIHRyaWdnZXIgYSBjYXB0dXJlLgo+PiArCSAqLwo+
IAo+IEkgc3VnZ2VzdCBkZWZpbmluZyBhIG5ldyBsb2NhbCB2YXJpYWJsZSAnY2MnIHRvIHBvaW50
IHRvIHN0bTMyX2NjW2NoXS4gSQo+IHRoaW5rIHRoYXQncyBtYWtlIHRoZSBjb2RlIGxvb2sgbmlj
ZXIgaGVyZSB0byBhdm9pZCBhbGwgdGhlIGFycmF5IGluZGV4Cj4gc3ludGF4IGV2ZXJ5IHRpbWUg
eW91IGFjY2VzcyBzdG0zMl9jY1tjaF0uCgpIaSBXaWxsaWFtLAoKVGhhbmtzIGZvciBzdWdnZXN0
aW5nLgpEb25lLgoKPiAKPj4gKwlpZiAoZW5hYmxlKSB7Cj4+ICsJCS8qIGZpcnN0IGNsZWFyIHBv
c3NpYmx5IGxhdGNoZWQgY2FwdHVyZSBmbGFnIHVwb24gZW5hYmxpbmcgKi8KPj4gKwkJcmVnbWFw
X3JlYWQocHJpdi0+cmVnbWFwLCBUSU1fQ0NFUiwgJmNjZXIpOwo+PiArCQlpZiAoIShjY2VyICYg
c3RtMzJfY2NbY2hdLmNjZXJfYml0cykpIHsKPiAKPiBUcnkgcmVnbWFwX3Rlc3RfYml0cygpIGhl
cmUgaW5zdGVhZCBvZiB1c2luZyByZWdtYXBfcmVhZCgpLgoKRG9uZSwKCj4gCj4+ICsJCQlzciA9
IH5USU1fU1JfQ0NfSUYoY2gpOwo+PiArCQkJcmVnbWFwX3dyaXRlKHByaXYtPnJlZ21hcCwgVElN
X1NSLCBzcik7Cj4gCj4gRWxpbWluYXRlICdzcicgYnkgcmVnbWFwX3dyaXRlKHByaXYtPnJlZ21h
cCwgVElNX1NSLCB+VElNX1NSX0NDX0lGKGNoKSkuCj4gCj4+IEBAIC0zNjYsNiArNDYwLDEyIEBA
IHN0YXRpYyBpbnQgc3RtMzJfY291bnRfZXZlbnRzX2NvbmZpZ3VyZShzdHJ1Y3QgY291bnRlcl9k
ZXZpY2UgKmNvdW50ZXIpCj4+ICAJCQkJcmVnbWFwX3dyaXRlKHByaXYtPnJlZ21hcCwgVElNX1NS
LCAodTMyKX5USU1fU1JfVUlGKTsKPj4gIAkJCWRpZXIgfD0gVElNX0RJRVJfVUlFOwo+PiAgCQkJ
YnJlYWs7Cj4+ICsJCWNhc2UgQ09VTlRFUl9FVkVOVF9DQVBUVVJFOgo+PiArCQkJcmV0ID0gc3Rt
MzJfY291bnRfY2FwdHVyZV9jb25maWd1cmUoY291bnRlciwgZXZlbnRfbm9kZS0+Y2hhbm5lbCwg
dHJ1ZSk7Cj4+ICsJCQlpZiAocmV0KQo+PiArCQkJCXJldHVybiByZXQ7Cj4+ICsJCQlkaWVyIHw9
IFRJTV9ESUVSX0NDX0lFKGV2ZW50X25vZGUtPmNoYW5uZWwpOwo+IAo+IEFoLCBub3cgSSB1bmRl
cnN0YW5kIHdoeSB0aGUgcHJldmlvdXMgcGF0Y2ggT1InZCBUSU1fRElFUl9VSUUgdG8gZGllci4K
PiBBcG9sb2dpZXMgZm9yIHRoZSBub2lzZS4KPiAKPj4gQEAgLTM3NCw2ICs0NzQsMTUgQEAgc3Rh
dGljIGludCBzdG0zMl9jb3VudF9ldmVudHNfY29uZmlndXJlKHN0cnVjdCBjb3VudGVyX2Rldmlj
ZSAqY291bnRlcikKPj4gIAo+PiAgCXJlZ21hcF93cml0ZShwcml2LT5yZWdtYXAsIFRJTV9ESUVS
LCBkaWVyKTsKPj4gIAo+PiArCS8qIGNoZWNrIGZvciBkaXNhYmxlZCBjYXB0dXJlIGV2ZW50cyAq
Lwo+PiArCWZvciAoaSA9IDAgOyBpIDwgcHJpdi0+bmNoYW5uZWxzOyBpKyspIHsKPj4gKwkJaWYg
KCEoZGllciAmIFRJTV9ESUVSX0NDX0lFKGkpKSkgewo+PiArCQkJcmV0ID0gc3RtMzJfY291bnRf
Y2FwdHVyZV9jb25maWd1cmUoY291bnRlciwgaSwgZmFsc2UpOwo+PiArCQkJaWYgKHJldCkKPj4g
KwkJCQlyZXR1cm4gcmV0Owo+PiArCQl9Cj4gCj4gV291bGQgZm9yX2VhY2hfY2xlYXJfYml0cmFu
Z2UoKSBpbiBsaW51eC9maW5kLmggd29yayBmb3IgdGhpcyBsb29wPwoKSSBoYWQgYSBsb29rLCBi
dXQgaXQgcmVxdWlyZXMgdG8gYWRkIHNvbWUgdmFyaWFibGVzLCBmb3Igc3RhcnQgYW5kIHN0b3AK
Yml0IGluIHRoZSBiaXRtYXAuIEZvciBub3csIEkndmUga2VwdCB0aGUgc2ltcGxlIEJJVCBtYWNy
byBhbmQgYml0IG9wcy4KCj4gCj4+IEBAIC01MDQsNyArNjIwLDcgQEAgc3RhdGljIGlycXJldHVy
bl90IHN0bTMyX3RpbWVyX2NudF9pc3IoaW50IGlycSwgdm9pZCAqcHRyKQo+PiAgCSAqIFNvbWUg
c3RhdHVzIGJpdHMgaW4gU1IgZG9uJ3QgbWF0Y2ggd2l0aCB0aGUgZW5hYmxlIGJpdHMgaW4gRElF
Ui4gT25seSB0YWtlIGNhcmUgb2YKPj4gIAkgKiB0aGUgcG9zc2libHkgZW5hYmxlZCBiaXRzIGlu
IERJRVIgKHRoYXQgbWF0Y2hlcyBpbiBiZXR3ZWVuIFNSIGFuZCBESUVSKS4KPj4gIAkgKi8KPj4g
LQlkaWVyICY9IFRJTV9ESUVSX1VJRTsKPj4gKwlkaWVyICY9IChUSU1fRElFUl9VSUUgfCBUSU1f
RElFUl9DQzFJRSB8IFRJTV9ESUVSX0NDMklFIHwgVElNX0RJRVJfQ0MzSUUgfCBUSU1fRElFUl9D
QzRJRSk7Cj4gCj4gQWdhaW4sIHNvcnJ5IGZvciB0aGUgbm9pc2Ugb24gdGhlIHByZXZpb3VzIHBh
dGNoOyB0aGlzIG1ha2VzIHNlbnNlIG5vdy4KPiAKPj4gQEAgLTUxNSw2ICs2MzEsMTUgQEAgc3Rh
dGljIGlycXJldHVybl90IHN0bTMyX3RpbWVyX2NudF9pc3IoaW50IGlycSwgdm9pZCAqcHRyKQo+
PiAgCQljbHIgJj0gflRJTV9TUl9VSUY7Cj4+ICAJfQo+PiAgCj4+ICsJLyogQ2hlY2sgY2FwdHVy
ZSBldmVudHMgKi8KPj4gKwlmb3IgKGkgPSAwIDsgaSA8IHByaXYtPm5jaGFubmVsczsgaSsrKSB7
Cj4+ICsJCWlmIChzciAmIFRJTV9TUl9DQ19JRihpKSkgewo+IAo+IFdvdWxkIGZvcl9lYWNoX3Nl
dF9iaXRyYW5nZSgpIGluIGxpbnV4L2ZpbmQuaCB3b3JrIGZvciB0aGlzIGxvb3A/CgpzYW1lLgoK
PiAKPj4gKwkJCWNvdW50ZXJfcHVzaF9ldmVudChjb3VudGVyLCBDT1VOVEVSX0VWRU5UX0NBUFRV
UkUsIGkpOwo+PiArCQkJY2xyICY9IH5USU1fU1JfQ0NfSUYoaSk7Cj4gCj4gUGVyaGFwcyB1MzJw
X3JlcGxhY2VfYml0cygmY2xyLCAwLCBUSU1fU1JfQ0NfSUYoaSkpIGlzIGNsZWFyZXIgaGVyZS4K
CkkndmUgaGl0IHNvbWUgYnVpbGQgaXNzdWUgd2l0aCBUSU1fU1JfQ0NfSUYoaSkgbWFjcm8sIGUu
Zy46Ci4vaW5jbHVkZS9saW51eC9iaXRmaWVsZC5oOjE2NToxNzogZXJyb3I6IGNhbGwgdG8g4oCY
X19iYWRfbWFza+KAmSBkZWNsYXJlZAp3aXRoIGF0dHJpYnV0ZSBlcnJvcjogYmFkIGJpdGZpZWxk
IG1hc2sKICAxNjUgfCAgICAgICAgICAgICAgICAgX19iYWRfbWFzaygpOwoKU28gSSd2ZSBrZXB0
IHRoZSBzaW1wbGUgYml0IG9wZXJhdGlvbiBoZXJlLgoKVGhhbmtzICYgQmVzdCBSZWdhcmRzLApG
YWJyaWNlCgo+IAo+PiBAQCAtNjI3LDggKzc1MiwxMSBAQCBzdGF0aWMgaW50IHN0bTMyX3RpbWVy
X2NudF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+PiAgCQl9Cj4+ICAJfSBl
bHNlIHsKPj4gIAkJZm9yIChpID0gMDsgaSA8IHByaXYtPm5yX2lycXM7IGkrKykgewo+PiAtCQkJ
LyogT25seSB0YWtlIGNhcmUgb2YgdXBkYXRlIElSUSBmb3Igb3ZlcmZsb3cgZXZlbnRzICovCj4+
IC0JCQlpZiAoaSAhPSBTVE0zMl9USU1FUlNfSVJRX1VQKQo+PiArCQkJLyoKPj4gKwkJCSAqIE9u
bHkgdGFrZSBjYXJlIG9mIHVwZGF0ZSBJUlEgZm9yIG92ZXJmbG93IGV2ZW50cywgYW5kIGNjIGZv
cgo+PiArCQkJICogY2FwdHVyZSBldmVudHMuCj4+ICsJCQkgKi8KPj4gKwkJCWlmIChpICE9IFNU
TTMyX1RJTUVSU19JUlFfVVAgJiYgaSAhPSBTVE0zMl9USU1FUlNfSVJRX0NDKQo+PiAgCQkJCWNv
bnRpbnVlOwo+IAo+IE9rYXksIEkgc2VlIG5vdyB3aHkgeW91IGhhdmUgdGhpcyBjaGVjay4gVGhp
cyBzaG91bGQgYmUgZmluZSBhcyBpdCdsbAo+IG1ha2VzIGFkZGluZyBzdXBwb3J0IGluIHRoZSBm
dXR1cmUgZm9yIHRoZSBvdGhlciBJUlFzIGEgbGVzcyBpbnZhc2l2ZQo+IGNoYW5nZS4KPiAKPiBX
aWxsaWFtIEJyZWF0aGl0dCBHcmF5Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
