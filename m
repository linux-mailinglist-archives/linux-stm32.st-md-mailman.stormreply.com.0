Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7751128F7BE
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Oct 2020 19:43:12 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 286F4C424AF;
	Thu, 15 Oct 2020 17:43:11 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 66E73C32EA7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Oct 2020 17:43:08 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4CBxT75TPlz1r6mw;
 Thu, 15 Oct 2020 19:43:07 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4CBxT74VgCz1qqkv;
 Thu, 15 Oct 2020 19:43:07 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id SAzlejxYOuys; Thu, 15 Oct 2020 19:43:06 +0200 (CEST)
X-Auth-Info: 8xClcJF6nMA5erM2Ku6920DxeGsGzoqMSzCM+zJeCTk=
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Thu, 15 Oct 2020 19:43:06 +0200 (CEST)
To: Alexandre Torgue <alexandre.torgue@st.com>,
 Ahmad Fatoum <a.fatoum@pengutronix.de>, Yann GAUTIER <yann.gautier@st.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
References: <20201009210820.243659-1-marex@denx.de>
 <f842dd08-77d0-fd5b-63fd-26762a54be5e@st.com>
 <a28a3842-0fcf-458e-ef26-aeffed035b32@pengutronix.de>
 <a1f1138e-444d-5e3b-4e1a-614a3fc1981e@denx.de>
 <33b2ff3f-3809-46db-a989-c7517d6e8369@pengutronix.de>
 <11b92f1e-fda0-e98a-8db7-f53004f2404d@denx.de>
 <e95247bd-7b1d-b44c-4a9e-c9951f37e6cf@pengutronix.de>
 <0f815500-9ff3-da51-42b2-7a262d57f510@st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <764bf683-ba3d-6d6c-3514-c04c0155191b@denx.de>
Date: Thu, 15 Oct 2020 19:43:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <0f815500-9ff3-da51-42b2-7a262d57f510@st.com>
Content-Language: en-US
Cc: hardware@linux-automation.com, Patrick DELAUNAY <patrick.delaunay@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: Consistently enable
 internal pull-ups for SD bus
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

T24gMTAvMTUvMjAgNTo1MSBQTSwgQWxleGFuZHJlIFRvcmd1ZSB3cm90ZToKCkhpLAoKWy4uLl0K
Cj4+Pj4+IEN1cnJlbnRseSB0aGUKPj4+Pj4gc3RtMzJtcDE1LXBpbm11eC5kdHNpIGlzIG5vdCBj
b25zaXN0ZW50IGluIHRoYXQgYXNwZWN0LiBJIGFtIG5vdAo+Pj4+PiBhcmd1aW5nCj4+Pj4+IGFi
b3V0IGFueSBvbmUgc2luZ2xlIGJvYXJkLCBidXQgYWJvdXQgdGhlIGR0c2ksIEkgc3VzcGVjdCBi
eQo+Pj4+PiBkZWZhdWx0IHRoZQo+Pj4+PiBwdWxsIHVwcyBzaG91bGQgYmUgZW5hYmxlZCwgYW5k
IHBvc3NpYmx5IG9uIGJvYXJkLURULWxldmVsIHRoZXkgc2hvdWxkCj4+Pj4+IGJlIGRpc2FibGVk
IGlmIG5vdCBuZWVkZWQgaW5zdGVhZCA/Cj4+Pj4KPj4+PiBJIHRoaW5rIHRoaXMgaXMgYSBnb29k
IGlkZWEuIEJ1dCBleGlzdGluZyBib2FyZHMgc2hvdWxkIGJlIGZpeGVkIHVwCj4+Pj4gc28gdGhh
dAo+Pj4+IHRoZWlyIG9sZCBiZWhhdmlvciBpcyBtYWludGFpbmVkLgo+Pj4KPj4+IFNvLCB3aGlj
aCBib2FyZHMgZG8gd2UgZml4LiBUaGUgYXV0b21hdGlvbi0xIGJvYXJkIGFuZCB0aGUgU1Qgb25l
cyA/Cj4+Cj4+IGZpeGVkIHVwLCBub3QgZml4ZWQuIEkgZG9uJ3Qga25vdyBpZiBTVCBpcyBmaW5l
IHdpdGggdGhlIGNoYW5nZXMsIGZvcgo+PiB0aGUgTUMtMSwgcGxlYXNlIGRvOgo+Pgo+PiAtLS0t
LS0tLS0tLS0tLSA4PCAtLS0tLS0tLS0tLS0tCj4+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290
L2R0cy9zdG0zMm1wMTU3Yy1seGEtbWMxLmR0cwo+PiBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMy
bXAxNTdjLWx4YS1tYzEuZHRzCj4+IGluZGV4IDU3MDBlNmI3MDBkMy4uNzEzNDQ2NjI1NmIzIDEw
MDY0NAo+PiAtLS0gYS9hcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTU3Yy1seGEtbWMxLmR0cwo+
PiArKysgYi9hcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTU3Yy1seGEtbWMxLmR0cwo+PiBAQCAt
MjA4LDYgKzIwOCwxNCBAQCBwaW5zMiB7Cj4+IMKgwqDCoMKgwqDCoMKgwqAgfTsKPj4gwqAgfTsK
Pj4KPj4gKyZzZG1tYzJfZDQ3X3BpbnNfYiB7Cj4+ICvCoMKgwqDCoMKgwqAgLyogYm9hcmQgYWxy
ZWFkeSBoYXMgZXh0ZXJuYWwgNDdLIHB1bGwtdXBzICovCj4+ICsKPj4gK8KgwqDCoMKgwqDCoCBw
aW5zIHsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgL2RlbGV0ZS1wcm9wZXJ0eS8g
Ymlhcy1wdWxsLXVwOwo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBiaWFzLWRpc2Fi
bGU7Cj4+ICvCoMKgwqDCoMKgwqAgfTsKPj4gK307Cj4+ICsKPiAKPiBUaGlzIHByb3Bvc2l0aW9u
IHJlbWluZCBtZSBhbiBvbGQgZGlzY3Vzc2lvbiB3ZSBnb3Qgd2l0aCBNYXJlayBhYm91dAo+ICJ3
aGVyZSBwaW4gZGVmaW5pdGlvbnMgaGFzIHRvIGJlIGRvbmUgPyIuIE15IGFwcHJvYWNoIGlzIHRv
IG5vdCBkZWZpbmUKPiBwaW5zIGdyb3VwcyBpbnNpZGUgYm9hcmQgZHRzIGZpbGUgbWFpbmx5IGJl
Y2F1c2UgcGlubXV4IGlzIGEgU29DCj4gY29uZmlndXJhdGlvbiBhbmQgYSBib2FyZCBvbmx5IHVz
ZSBvbmUgb2YgdGhvc2UgY29uZmlndXJhdGlvbnMgYmxhYmxhYmxhCj4gOikuIEJ1dCBjb3VudGVy
LWFyZ3VtZW50IGlzIHRoYXQgcHVsbC11cC9wdWxsLWRvd24sIE9wZW4tZHJhaW4gcHVzaC1wdWxs
Cj4gc2V0dGluZ3MgYXJlICJkcml2ZW4iIGJ5IHRoZSBib2FyZCBjb25maWd1cmF0aW9uIGFuZCBJ
IGFncmVlLgo+IAo+IFdlIGFyZSBleGFjdGx5IGluIHRoaXMgY2FzZSBoZXJlIGJ1dCBiZWZvcmUg
dG8gcmV3b3JrIGFsbCBTVE0zMiBEVCB0bwo+IHNwbGl0IHBpbiBjb25maWcgSSBwcm9wb3NlIHRv
IGtlZXAgd2hhdCB3ZSBoYXZlIHRvZGF5LCBhbmQgdG8gZW5hYmxlCj4gYmlhcy1wdWxsLXVwLCAo
b3Igb3RoZXIgc2V0dGluZ3MpIGluIGJvYXJkcyB0aGF0IG5lZWQgaXQuCgpJIHRoaW5rIHRoaXMg
aXMgbm90IGFuIGVhc3kgcXVlc3Rpb24gdG8gYW5zd2VyLgoKRWl0aGVyIHlvdSBlbmQgdXAgd2l0
aCBib2FyZHMgcGF0Y2hpbmcgc29tZSBjb21tb24gcGlubXV4IGZpbGUsIHdoaWNoCndvdWxkIHRo
ZW4gbWFrZSBpdCBkaWZmaWN1bHQgdG8gdXBkYXRlIHRoZSBwaW5tdXggaW4gdGhhdCBmaWxlIGlm
IG5lZWRlZApiZSwgYmVjYXVzZSB5b3UgaGF2ZSBzdWJ0bGUgZGVwZW5kZW5jaWVzIGFsbCBvdmVy
LiAodGhhdCdzIHRoZSBjdXJyZW50CnByb3Bvc2FsKQoKT1IKCllvdSBlbmQgdXAgd2l0aCBtdWx0
aXBsZSBjb3BpZXMgb2Ygc2ltaWxhci1idXQtbm90LXRoZS1zYW1lIHBpbm11eCBpbgpldmVyeSBi
b2FyZCBEVCwgYW5kIGl0IHdpbGwgbm90IGJlIGNsZWFyIHdoaWNoIG9uZSBpcyB0aGUgcmlnaHQg
b25lLgoodGhhdCdzIHRoZSBpLk1YIGNhc2UpCgpJIHJlYWxseSBkb24ndCBrbm93IHdoaWNoIG9u
ZSBpcyBiZXR0ZXIgKG9yIHdvcnNlKS4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
