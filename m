Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 76AAF1AE128
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Apr 2020 17:31:54 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 24AD1C36B0D;
	Fri, 17 Apr 2020 15:31:54 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C9727C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Apr 2020 15:31:52 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 493g7D0JF5z1rtyg;
 Fri, 17 Apr 2020 17:31:51 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 493g7C5ZqDz1qr4G;
 Fri, 17 Apr 2020 17:31:51 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id GUUUdMPMKaWa; Fri, 17 Apr 2020 17:31:50 +0200 (CEST)
X-Auth-Info: ukL+QQvR1R43aIroK+RGm7l/Kp938KyMrR7ZkknM+ig=
Received: from [IPv6:::1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Fri, 17 Apr 2020 17:31:50 +0200 (CEST)
To: Christophe Kerello <christophe.kerello@st.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
References: <1586966256-29548-1-git-send-email-christophe.kerello@st.com>
 <1586966256-29548-4-git-send-email-christophe.kerello@st.com>
 <20200416215328.53982fef@collabora.com>
 <e4a21df4-b01b-1215-7a3b-fea94f099b8f@st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <c69f86f4-5904-3f35-dac1-87080402a096@denx.de>
Date: Fri, 17 Apr 2020 17:31:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <e4a21df4-b01b-1215-7a3b-fea94f099b8f@st.com>
Content-Language: en-US
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, vigneshr@ti.com,
 tony@atomide.com, richard@nod.at, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 lee.jones@linaro.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2 03/12] bus: stm32-fmc2-ebi: add STM32
 FMC2 EBI controller driver
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

T24gNC8xNy8yMCA1OjI5IFBNLCBDaHJpc3RvcGhlIEtlcmVsbG8gd3JvdGU6Cj4gCj4gCj4gT24g
NC8xNi8yMCA5OjUzIFBNLCBCb3JpcyBCcmV6aWxsb24gd3JvdGU6Cj4+IE9uIFdlZCwgMTUgQXBy
IDIwMjAgMTc6NTc6MjcgKzAyMDAKPj4gQ2hyaXN0b3BoZSBLZXJlbGxvIDxjaHJpc3RvcGhlLmtl
cmVsbG9Ac3QuY29tPiB3cm90ZToKPj4KPj4+IFRoZSBkcml2ZXIgYWRkcyB0aGUgc3VwcG9ydCBm
b3IgdGhlIFNUTWljcm9lbGVjdHJvbmljcyBGTUMyIEVCSQo+Pj4gY29udHJvbGxlcgo+Pj4gZm91
bmQgb24gU1RNMzJNUCBTT0NzLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waGUgS2Vy
ZWxsbyA8Y2hyaXN0b3BoZS5rZXJlbGxvQHN0LmNvbT4KPj4+IFRlc3RlZC1ieTogTWFyZWsgVmFz
dXQgPG1hcmV4QGRlbnguZGU+Cj4+PiAtLS0KPj4+IENoYW5nZXMgaW4gdjI6Cj4+PiDCoCAtIGNh
bGwgMiBBUElzIHRvIG1hbmFnZSBGTUMyIGVuYWJsZS9kaXNhYmxlIGluc3RlYWQgb2Ygb3BzCj4+
PiDCoCAtIGNhbGwgMiBBUElzIHRvIG1hbmFnZSBGTUMyIE5XQUlUIHNoYXJlZCBzaWduYWwgaW5z
dGVhZCBvZiBvcHMKPj4+Cj4+PiDCoCBkcml2ZXJzL2J1cy9LY29uZmlnwqDCoMKgwqDCoMKgwqDC
oMKgIHzCoMKgIDExICsKPj4+IMKgIGRyaXZlcnMvYnVzL01ha2VmaWxlwqDCoMKgwqDCoMKgwqDC
oCB8wqDCoMKgIDEgKwo+Pj4gwqAgZHJpdmVycy9idXMvc3RtMzItZm1jMi1lYmkuYyB8IDEwOTEK
Pj4+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+Pgo+PiBIbSwg
SSBzZWUgdGhhdCBvdGhlciBtZW1vcnkgYnVzIGNvbnRyb2xsZXIgZHJpdmVycyBhcmUgcGxhY2Vk
IHVuZGVyCj4+IGRyaXZlcnMvbWVtb3J5LywgYW55IHJlYXNvbiBmb3IgY2hvb3NpbmcgZHJpdmVy
cy9idXMvPyBJZiB0aGF0J3Mgd2hlcmUKPj4gd2Ugd2FudCB0byBoYXZlIGFsbCBnZW5lcmljIG1l
bW9yeSBidXMgY29udHJvbGxlcnMgdG8gbGl2ZSBpdCBtaWdodCBiZQo+PiB3b3J0aCBtb3Zpbmcg
ZXhpc3RpbmcgZHJpdmVycyB0byB0aGUgZHJpdmVycy9idXMvIGRpcmVjdG9yeSBhdCBzb21lCj4+
IHBvaW50Lgo+Pgo+IAo+IEhpIEJvcmlzLAo+IAo+IEkgc2VlIHRoaXMgY29udHJvbGxlciBhcyBh
biBleHRlcm5hbCBidXMgaW50ZXJmYWNlIGFzIHdlIGFyZSBhYmxlIHRvCj4gYXR0YWNoIGRpZmZl
cmVudCBkZXZpY2VzIG9uIGl0LCBsaWtlIGEgUFNSQU0sIGFuIGV0aGVybmV0IGNvbnRyb2xsZXIs
IGEKPiBGUEdBLCBhIExDRCBkaXNwbGF5LCAuLi4KPiAKPiBXaGVuIEkgaGFkIGEgbG9vayBhdCBi
dXMvS2NvbmZpZyBmaWxlLCBJIGhhdmUgZm91bmQgc2ltaWxhciBkcml2ZXJzCj4gKGxpa2UgSU1Y
X1dFSU0gb3IgUUNPTV9FQkkyIGRyaXZlcnMpLiBUaGVzZSBkcml2ZXJzIGFyZSBhYmxlIHRvIGNv
bm5lY3QKPiBkZXZpY2VzIGxpa2UgTkFORCBGbGFzaCwgU1JBTSwgZXRoZXJuZXQgYWRhcHRlcnMs
IEZQR0FzIGFuZCBMQ0QgZGlzcGxheXMKPiBhcyBpdCBpcyB3cml0dGVuIGluIHRoZSBLY29uZmln
IGZpbGUuCj4gCj4gQnV0LCBhZnRlciBjaGVja2luZyBtZW1vcnkvS2NvbmZpZyBmaWxlLCBpdCBp
cyBhbHNvIHBvc3NpYmxlIHRvIGZpbmQKPiBzaW1pbGFyIGRyaXZlcnMgKGxpa2UgQVRNRUxfRUJJ
IGRyaXZlciB0aGF0IGlzIGluc3BpcmVkIGJ5IHRoZSBXRUlNIGJ1cwo+IGRyaXZlcikuCj4gCj4g
U28sIEkgd2lsbCBmb2xsb3cgdGhlIHJlY29tbWVuZGF0aW9uIGFuZCBJIHdpbGwgbW92ZSBpdCB0
bwo+IGRyaXZlcnMvbWVtb3J5IGZvbGRlciBpZiBpdCBpcyB0aGUgcGxhY2Ugd2hlcmUgdGhpcyBk
cml2ZXIgc2hvdWxkIGJlLgoKVGhlIEVCSSBpc24ndCBhIG1lbW9yeSBidXMsIHlvdSBjYW4gdmVy
eSB3ZWxsIGhhdmUgYSBub24tbWVtb3J5IGRldmljZSwKbGlrZSBhbiBleHRlcm5hbCBwYXJhbGxl
bCBidXMgbWVtb3J5IGNvbnRyb2xsZXIgb24gaXQuIFNvIHdoeSBzaG91bGQgaXQKYmUgaW4gZHJp
dmVycy9tZW1vcnkgPwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1h
bi9saXN0aW5mby9saW51eC1zdG0zMgo=
