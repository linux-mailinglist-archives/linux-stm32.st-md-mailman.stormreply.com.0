Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F843221F95
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Jul 2020 11:20:49 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 611F8C36B29;
	Thu, 16 Jul 2020 09:20:48 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 61C35C36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Jul 2020 09:20:46 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06G9K6Dk012022; Thu, 16 Jul 2020 11:20:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=YYdEfJ7VryBj+oIRISl+0NE3XQm3xJF36O7Hxx33TUo=;
 b=DER8KaZgqXYt5QUIc87g+W9oYIbTIn83sSD4i0qGguy2ESL9oD2R2WZsxE/bYVL+29Qd
 wbyUSel97hEh2/DEJJYZRUNthWVqIPRKvovDSurABIXK4Olo1K1PshVG53lXUKc4RkcP
 cFHAqG3kFlwM4wn8Y5oImbyLjpsRNE5yLF8l4wlSaaQWx8sg9fI5H96b7K16ZPZmoiHi
 UUi/vkX6jl9MKfeSLVoXBsAA9zaXIUdh4MaMIWsiMhCQ+T8vjQNyrYsfAQXRmytyFN2W
 3qveZEdYGAkz57tzoQoFTMfsjldkJglAX7qiRv6aYOra4qIOm8cLz7f/bQVY7sMX7XJ6 0A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 327btt1asu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Jul 2020 11:20:30 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7BE7510002A;
 Thu, 16 Jul 2020 11:20:28 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5976F2AD9EB;
 Thu, 16 Jul 2020 11:20:28 +0200 (CEST)
Received: from lmecxl0995.lme.st.com (10.75.127.47) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 16 Jul
 2020 11:20:27 +0200
To: Rob Herring <robh@kernel.org>
References: <20200615161512.19150-1-amelie.delaunay@st.com>
 <20200615161512.19150-2-amelie.delaunay@st.com>
 <20200715181916.GA551920@bogus>
From: Amelie DELAUNAY <amelie.delaunay@st.com>
Message-ID: <f186558e-210c-ff11-29e0-fc653d4b865b@st.com>
Date: Thu, 16 Jul 2020 11:20:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200715181916.GA551920@bogus>
Content-Language: en-US
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-16_05:2020-07-16,
 2020-07-16 signatures=0
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Fabrice GASNIER <fabrice.gasnier@st.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 1/6] dt-bindings: connector: add
 power-opmode optional property to usb-connector
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

SGkgUm9iLAoKT24gNy8xNS8yMCA4OjE5IFBNLCBSb2IgSGVycmluZyB3cm90ZToKPiBPbiBNb24s
IEp1biAxNSwgMjAyMCBhdCAwNjoxNTowN1BNICswMjAwLCBBbWVsaWUgRGVsYXVuYXkgd3JvdGU6
Cj4+IFBvd2VyIG9wZXJhdGlvbiBtb2RlIG1heSBkZXBlbmRzIG9uIGhhcmR3YXJlIGRlc2lnbiwg
c28sIGFkZCB0aGUgb3B0aW9uYWwKPj4gcHJvcGVydHkgcG93ZXItb3Btb2RlIGZvciB1c2ItYyBj
b25uZWN0b3IgdG8gc2VsZWN0IHRoZSBwb3dlciBvcGVyYXRpb24KPj4gbW9kZSBjYXBhYmlsaXR5
Lgo+PiAKPj4gU2lnbmVkLW9mZi1ieTogQW1lbGllIERlbGF1bmF5IDxhbWVsaWUuZGVsYXVuYXlA
c3QuY29tPgo+PiAtLS0KPj7CoCAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9jb25uZWN0b3IvdXNi
LWNvbm5lY3Rvci55YW1swqAgfCAxMSArKysrKysrKysrKwo+PsKgIDEgZmlsZSBjaGFuZ2VkLCAx
MSBpbnNlcnRpb25zKCspCj4+IAo+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2Nvbm5lY3Rvci91c2ItY29ubmVjdG9yLnlhbWwgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvY29ubmVjdG9yL3VzYi1jb25uZWN0b3IueWFtbAo+PiBpbmRl
eCA5YmQ1MmU2M2M5MzUuLmNkN2ZlYjJkNDk4NCAxMDA2NDQKPj4gLS0tIGEvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Nvbm5lY3Rvci91c2ItY29ubmVjdG9yLnlhbWwKPj4gKysr
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Nvbm5lY3Rvci91c2ItY29ubmVj
dG9yLnlhbWwKPj4gQEAgLTg4LDYgKzg4LDE3IEBAIHByb3BlcnRpZXM6Cj4+wqDCoMKgwqDCoMKg
wqAgLSBkZXZpY2UKPj7CoMKgwqDCoMKgwqDCoCAtIGR1YWwKPj4gIAo+PiArwqAgcG93ZXItb3Bt
b2RlOgo+PiArwqDCoMKgIGRlc2NyaXB0aW9uOiBEZXRlcm1pbmVzIHRoZSBwb3dlciBvcGVyYXRp
b24gbW9kZSB0aGF0IHRoZSBUeXBlIEMgY29ubmVjdG9yCj4+ICvCoMKgwqDCoMKgIHdpbGwgc3Vw
cG9ydC4KPj4gK8KgwqDCoCBhbGxPZjoKPj4gK8KgwqDCoMKgwqAgLSAkcmVmOiAvc2NoZW1hcy90
eXBlcy55YW1sI2RlZmluaXRpb25zL3N0cmluZwo+PiArwqDCoMKgIGVudW06Cj4+ICvCoMKgwqDC
oMKgIC0gZGVmYXVsdAo+IAo+IFdvdWxkbid0IHRoaXMganVzdCBiZSBubyBwcm9wZXJ0eT8KCk5v
IGJlY2F1c2UgdGhlIGFpbSBvZiB0aGlzIG9wdGlvbmFsIHByb3BlcnR5IGlzIHRvIHJlLWNvbmZp
Z3VyZSB0aGUgClR5cGUtQyBjb250cm9sbGVyIHBvd2VyIG9wZXJhdGlvbiBtb2RlLiBTbywgd2hl
biB1c2luZyBwb3dlci1vcG1vZGUgPSAKImRlZmF1bHQiLCB0aGUgdXNlIGNhbiByZS1jb25maWd1
cmUgaXQgdG8gdGhlICdkZWZhdWx0JyBVU0IgcG93ZXIgCm9wZXJhdGlvbiBtb2RlIC0gNTAwbUEg
Zm9yIFVTQjIgb3IgOTAwbUEgZm9yIFVTQjMuCgo+IAo+PiArwqDCoMKgwqDCoCAtIDEuNUEKPj4g
K8KgwqDCoMKgwqAgLSAzLjBBCj4gCj4gWW91J2xsIG5lZWQgdG8gZXhwbGFpbiB0aGVzZSBiZXR0
ZXIuCj4KCk9rIEknbGwgYWRkIGEgZGVzY3JpcHRpb24gaW4gVjIuCgo+PiArwqDCoMKgwqDCoCAt
IHVzYl9wb3dlcl9kZWxpdmVyeQo+IAo+IEkgd291bGQgaGF2ZSB0aG91Z2h0ICdkZWZhdWx0JyB3
b3VsZCBiZSBVU0ItUEQuIFRob3VnaCBJIHRob3VnaHQgVHlwZS1DCj4gd2FzIGFsd2F5cyBVU0It
UEQuCj4gCgpJbiBmYWN0LCB0aGUgRFQgcHJvcGVydHkgbWF0Y2hlcyB0aGUgdHlwZWNfcHdyX29w
bW9kZSBlbnVtIGFuZCAKdHlwZWNfcHdyX29wbW9kZXMgc3RyaW5ncyB0YWI6CnN0YXRpYyBjb25z
dCBjaGFyICogY29uc3QgdHlwZWNfcHdyX29wbW9kZXNbXSA9IHsKCVtUWVBFQ19QV1JfTU9ERV9V
U0JdCT0gImRlZmF1bHQiLAoJW1RZUEVDX1BXUl9NT0RFXzFfNUFdCT0gIjEuNUEiLAoJW1RZUEVD
X1BXUl9NT0RFXzNfMEFdCT0gIjMuMEEiLAoJW1RZUEVDX1BXUl9NT0RFX1BEXQk9ICJ1c2JfcG93
ZXJfZGVsaXZlcnkiLAp9OwpUaGUgc2FtZSBpcyBkb25lIGZvciBkYXRhLXJvbGUgYW5kIHBvd2Vy
LXJvbGUgcHJvcGVydGllcy4KClNvLCBJIHdvdWxkIGtlZXAgImRlZmF1bHQiLCAiMS41QSIsICIz
LjBBIiBhbmQgInVzYl9wb3dlcl9kZWxpdmVyeSIsIGFuZCAKSSdsbCBhZGQgYSBkZXNjcmlwdGlv
biBmb3IgZWFjaC4gSXMgaXQgT0sgZm9yIHlvdSA/CgpSZWdhcmRzLApBbWVsaWUKCj4+ICsKPj7C
oMKgwqAgIyBUaGUgZm9sbG93aW5nIGFyZSBvcHRpb25hbCBwcm9wZXJ0aWVzIGZvciAidXNiLWMt
Y29ubmVjdG9yIiB3aXRoIHBvd2VyCj4+wqDCoMKgICMgZGVsaXZlcnkgc3VwcG9ydC4KPj7CoMKg
wqAgc291cmNlLXBkb3M6Cj4+IC0tIAo+PiAyLjE3LjEKPj4gCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51
eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
