Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F23E11B2E82
	for <lists+linux-stm32@lfdr.de>; Tue, 21 Apr 2020 19:44:16 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CBC16C36B0C;
	Tue, 21 Apr 2020 17:44:15 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A7FE4C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Apr 2020 17:44:14 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4969t608RMz1r0GS;
 Tue, 21 Apr 2020 19:44:14 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4969t56WtFz1qtws;
 Tue, 21 Apr 2020 19:44:13 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id BkkacvUwQ2Im; Tue, 21 Apr 2020 19:44:12 +0200 (CEST)
X-Auth-Info: R/fVuDdL3sivlt74LKiNIIO6W1M9sFtlbYZNoV/k70U=
Received: from [IPv6:::1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Tue, 21 Apr 2020 19:44:12 +0200 (CEST)
To: Alexandre Torgue <alexandre.torgue@st.com>,
 linux-arm-kernel@lists.infradead.org
References: <20200401132237.60880-1-marex@denx.de>
 <971b9046-2d77-fdc6-2916-8b02ffb601d5@denx.de>
 <b73cb2bf-e50b-ce52-8e53-d8b72fa273f0@st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <37cfbbb1-64a2-aca6-8901-5bdff6df71e9@denx.de>
Date: Tue, 21 Apr 2020 19:07:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <b73cb2bf-e50b-ce52-8e53-d8b72fa273f0@st.com>
Content-Language: en-US
Cc: Patrick Delaunay <patrick.delaunay@st.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [Linux-stm32] [PATCH V4 00/22] ARM: dts: stm32: Repair AV96
	board
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

T24gNC8yMS8yMCA2OjA0IFBNLCBBbGV4YW5kcmUgVG9yZ3VlIHdyb3RlOgo+IEhpIE1hcmVrCgpI
aSwKCj4gT24gNC8yMS8yMCAxMjozMCBQTSwgTWFyZWsgVmFzdXQgd3JvdGU6Cj4+IE9uIDQvMS8y
MCAzOjIyIFBNLCBNYXJlayBWYXN1dCB3cm90ZToKPj4+IFRoZSBBVjk2IGJvYXJkIGRldmljZSB0
cmVlIGlzIGNvbXBsZXRlbHkgYnJva2VuIGFuZCBkb2VzIG5vdCBtYXRjaCB0aGUKPj4+IGhhcmR3
YXJlLiBUaGlzIHNlcmllcyBmaXhlcyBpdCB1cC4KPj4+Cj4+PiBNYXJlayBWYXN1dCAoMjIpOgo+
Pj4gwqDCoCBBUk06IGR0czogc3RtMzI6IEFkZCBhbHRlcm5hdGUgcGlubXV4IGZvciBldGhlcm5l
dCBSR01JSQo+Pj4gwqDCoCBBUk06IGR0czogc3RtMzI6IFJlcGFpciBldGhlcm5ldCBvcGVyYXRp
b24gb24gQVY5Ngo+Pj4gwqDCoCBBUk06IGR0czogc3RtMzI6IEFkZCBtaXNzaW5nIGV0aGVybmV0
IFBIWSByZXNldCBvbiBBVjk2Cj4+PiDCoMKgIEFSTTogZHRzOiBzdG0zMjogQWRkIG1pc3Npbmcg
ZXRoZXJuZXQgUEhZIHNrZXdzIG9uIEFWOTYKPj4+IMKgwqAgQVJNOiBkdHM6IHN0bTMyOiBBZGQg
YWx0ZXJuYXRlIHBpbm11eCBmb3IgU0RNTUMxIGRpcmVjdGlvbiBwaW5zCj4+PiDCoMKgIEFSTTog
ZHRzOiBzdG0zMjogUmVwYWlyIFNETU1DMSBvcGVyYXRpb24gb24gQVY5Ngo+Pj4gwqDCoCBBUk06
IGR0czogc3RtMzI6IFJlcGFpciBQTUlDIGNvbmZpZ3VyYXRpb24gb24gQVY5Ngo+Pj4gwqDCoCBB
Uk06IGR0czogc3RtMzI6IFJlcGFpciBQTUlDIGludGVycnVwdCBvbiBBVjk2Cj4+PiDCoMKgIEFS
TTogZHRzOiBzdG0zMjogQWRkIGFsdGVybmF0ZSBwaW5tdXggZm9yIFNETU1DMiBwaW5zIDQtNwo+
Pj4gwqDCoCBBUk06IGR0czogc3RtMzI6IEFkZCBlTU1DIGF0dGFjaGVkIHRvIFNETU1DMiBvbiBB
Vjk2Cj4+PiDCoMKgIEFSTTogZHRzOiBzdG0zMjogQWRkIFFTUEkgTk9SIG9uIEFWOTYKPj4+IMKg
wqAgQVJNOiBkdHM6IHN0bTMyOiBBZGQgY29uZmlndXJhdGlvbiBFRVBST00gb24gQVY5Ngo+Pj4g
wqDCoCBBUk06IGR0czogc3RtMzI6IEFkZCBhbHRlcm5hdGUgcGlubXV4IGZvciBTRE1NQzMgcGlu
cwo+Pj4gwqDCoCBBUk06IGR0czogc3RtMzI6IEVuYWJsZSBXaUZpIG9uIEFWOTYKPj4+IMKgwqAg
QVJNOiBkdHM6IHN0bTMyOiBBZGQgYWx0ZXJuYXRlIHBpbm11eCBmb3IgVVNBUlQyIHBpbnMKPj4+
IMKgwqAgQVJNOiBkdHM6IHN0bTMyOiBFbmFibGUgQmx1ZXRvb3RoIG9uIEFWOTYKPj4+IMKgwqAg
QVJNOiBkdHM6IHN0bTMyOiBBZGQgYWx0ZXJuYXRlIHBpbm11eCBmb3IgTFREQyBwaW5zCj4+PiDC
oMKgIEFSTTogZHRzOiBzdG0zMjogQWRkIGJpbmRpbmdzIGZvciBIRE1JIHZpZGVvIG9uIEFWOTYK
Pj4+IMKgwqAgQVJNOiBkdHM6IHN0bTMyOiBBZGQgYWx0ZXJuYXRlIHBpbm11eCBmb3IgU0FJMiBw
aW5zCj4+PiDCoMKgIEFSTTogZHRzOiBzdG0zMjogQWRkIGJpbmRpbmdzIGZvciBhdWRpbyBvbiBB
Vjk2Cj4+PiDCoMKgIEFSTTogZHRzOiBzdG0zMjogQWRkIGJpbmRpbmdzIGZvciBVU0Igb24gQVY5
Ngo+Pj4gwqDCoCBBUk06IGR0czogc3RtMzI6IFJlbmFtZSBMRURzIHRvIG1hdGNoIHNpbGtzY3Jl
ZW4gb24gQVY5Ngo+Pj4KPj4+IMKgIGFyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNS1waW5jdHJs
LmR0c2nCoMKgwqAgfCAyODAgKysrKysrKysrKysrKysrKysKPj4+IMKgIGFyY2gvYXJtL2Jvb3Qv
ZHRzL3N0bTMybXAxNTdhLWF2ZW5nZXI5Ni5kdHMgfCAzMjQgKysrKysrKysrKysrKysrKysrLS0K
Pj4+IMKgIDIgZmlsZXMgY2hhbmdlZCwgNTcxIGluc2VydGlvbnMoKyksIDMzIGRlbGV0aW9ucygt
KQo+Pgo+PiBBbGV4LCBjYW4geW91IHByb3ZpZGUgc29tZSByZXZpZXcgb2YgdGhpcyBzZXJpZXMg
PyBJdCdzIGJlZW4gcG9zdGVkIGZvcgo+PiB0aHJlZSB3ZWVrcyBub3cuCj4+Cj4gCj4gWWVzLCBJ
IHdhcyB3YWl0aW5nIGZvciBNYW5pJ3MgcmV2aWV3IGZpcnN0IChhbmQgSSB3YXMgYSBiaXQgYnVz
eSBzb3JyeSkuCgpJdCBzZWVtcyBtb3N0IG9mIHRoZSBwYXRjaGVzIGdvdCB0aGF0IHJldmlldy4K
Cj4gQWxsIHBhdGNoZXMgbG9va3MgZ29vZCBmb3IgbWUuIE1heWJlIEknbGwgc3F1YXNoIHNvbWUg
cGluY3RybCBwYXRjaGVzIHRvCj4gZGVjcmVhc2UgbnVtYmVyIG9mIHBhdGNoZXMuCgpPbmUgcGF0
Y2ggc2hvdWxkIGRvIG9uZSB0aGluZyBhbmQgb25lIHRoaW5nIG9ubHksIG5vID8KCj4gT25lIHJl
bWFpbmluZyBxdWVzdGlvbnMgYWJvdXQgcGF0Y2ggNyAoIlJlcGFpciBQTUlDIGNvbmZpZ3VyYXRp
b24gb24KPiBBVjk2KS4gSSBzYXcgYSBkaXNjdXNzaW9uIG9uIHUtYm9vdCB0aHJlYWQgd2l0aCBw
YXNjYWwgUC4sIGV4cGxhaW5pbmcKPiB0aGF0IDgwMG12IGlzIG5vdCB0aGUgbWluaW1hbCB2b2x0
YWdlIGFjY2VwdGFibGUgZm9yIHZkZGNvcmUuIFdoYXQgaXMKPiB0aGUgc3RhdHVzID8KCkl0IHNo
b3VsZCBsaWtlbHkgYmUgc2V0IHRvIDFWMiwgc2FtZSBhcyA3OTFiZTk0ZTI4NzggKCJBUk06IGR0
czogc3RtMzI6CmNoYW5nZSBkZWZhdWx0IG1pbmltYWwgYnVjazEgdmFsdWUgb24gc3RtMzJtcDE1
NyIpIGRvZXMuIEknbGwgYWRkIGl0CmludG8gdGhlIGxpc3Qgb2YgZml4ZXMgZm9yIFY1LgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBt
YWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRw
czovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1z
dG0zMgo=
