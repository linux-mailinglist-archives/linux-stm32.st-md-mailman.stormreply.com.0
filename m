Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D12F46BD1F
	for <lists+linux-stm32@lfdr.de>; Tue,  7 Dec 2021 15:00:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E1D35C5F1E8;
	Tue,  7 Dec 2021 14:00:02 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 58B27C597BA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Dec 2021 14:00:01 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <a.fatoum@pengutronix.de>)
 id 1mub0i-0006xW-KF; Tue, 07 Dec 2021 15:00:00 +0100
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 Rob Herring <robh@kernel.org>, Olivier MOYSAN <olivier.moysan@foss.st.com>
References: <20211125144053.774-1-olivier.moysan@foss.st.com>
 <20211125144053.774-2-olivier.moysan@foss.st.com>
 <1637875562.357461.2858318.nullmailer@robh.at.kernel.org>
 <237f56b3-0597-2526-a182-f1fbdd327338@foss.st.com>
 <Yaf4jiZIp8+ndaXs@robh.at.kernel.org>
 <627777a4-7458-88ed-e7c5-d11e3db847b5@foss.st.com>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Message-ID: <cf5f994b-aecf-e051-f5c9-4a46e6414207@pengutronix.de>
Date: Tue, 7 Dec 2021 14:59:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <627777a4-7458-88ed-e7c5-d11e3db847b5@foss.st.com>
Content-Language: en-US
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 alain.volmat@foss.st.com, arnaud.pouliquen@foss.st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/4] ASoC: dt-bindings: stm32: i2s: add
 audio-graph-card port
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

SGVsbG8gQWxleCwKCk9uIDA3LjEyLjIxIDE0OjUyLCBBbGV4YW5kcmUgVE9SR1VFIHdyb3RlOgo+
IEhpIFJvYgo+IAo+IE9uIDEyLzEvMjEgMTE6MzQgUE0sIFJvYiBIZXJyaW5nIHdyb3RlOgo+PiBP
biBGcmksIE5vdiAyNiwgMjAyMSBhdCAxMToyNToyN0FNICswMTAwLCBPbGl2aWVyIE1PWVNBTiB3
cm90ZToKPj4+IEhpIFJvYiwKPj4+Cj4+PiBPbiAxMS8yNS8yMSAxMDoyNiBQTSwgUm9iIEhlcnJp
bmcgd3JvdGU6Cj4+Pj4gT24gVGh1LCAyNSBOb3YgMjAyMSAxNTo0MDo1MCArMDEwMCwgT2xpdmll
ciBNb3lzYW4gd3JvdGU6Cj4+Pj4+IFRoZSBTVE0yIEkyUyBEQUkgY2FuIGJlIGNvbm5lY3RlZCB2
aWEgdGhlIGF1ZGlvLWdyYXBoLWNhcmQuCj4+Pj4+IEFkZCBwb3J0IGVudHJ5IGludG8gdGhlIGJp
bmRpbmdzLgo+Pj4+Pgo+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBPbGl2aWVyIE1veXNhbiA8b2xpdmll
ci5tb3lzYW5AZm9zcy5zdC5jb20+Cj4+Pj4+IC0tLQo+Pj4+PiDCoMKgIERvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9zb3VuZC9zdCxzdG0zMi1pMnMueWFtbCB8IDUgKysrKysKPj4+
Pj4gwqDCoCAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCj4+Pj4+Cj4+Pj4KPj4+PiBS
dW5uaW5nICdtYWtlIGR0YnNfY2hlY2snIHdpdGggdGhlIHNjaGVtYSBpbiB0aGlzIHBhdGNoIGdp
dmVzIHRoZQo+Pj4+IGZvbGxvd2luZyB3YXJuaW5ncy4gQ29uc2lkZXIgaWYgdGhleSBhcmUgZXhw
ZWN0ZWQgb3IgdGhlIHNjaGVtYSBpcwo+Pj4+IGluY29ycmVjdC4gVGhlc2UgbWF5IG5vdCBiZSBu
ZXcgd2FybmluZ3MuCj4+Pj4KPj4+PiBOb3RlIHRoYXQgaXQgaXMgbm90IHlldCBhIHJlcXVpcmVt
ZW50IHRvIGhhdmUgMCB3YXJuaW5ncyBmb3IgZHRic19jaGVjay4KPj4+PiBUaGlzIHdpbGwgY2hh
bmdlIGluIHRoZSBmdXR1cmUuCj4+Pj4KPj4+PiBGdWxsIGxvZyBpcyBhdmFpbGFibGUgaGVyZTog
aHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wYXRjaC8xNTU5NzUwCj4+Pj4KPj4+Pgo+Pj4+
IGF1ZGlvLWNvbnRyb2xsZXJANDAwMGIwMDA6ICdwb3J0JyBkb2VzIG5vdCBtYXRjaCBhbnkgb2Yg
dGhlIHJlZ2V4ZXM6ICdecG9ydEBbMC05XScsICdwaW5jdHJsLVswLTldKycKPj4+PiDCoMKgwqDC
oGFyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNTdhLWRrMS5kdC55YW1sCj4+Pj4gwqDCoMKgwqBh
cmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTU3Yy1kazIuZHQueWFtbAo+Pj4+Cj4+Pgo+Pj4gVGhp
cyB3YXJuaW5nIGlzIG5vdCBhIG5ldyBvbmUuCj4+Pgo+Pj4gVGhlIGkyczIgbm9kZSBpbiBzdG0z
Mm1wMTV4eC1ka3guZHRzaSB3b3VsZCByZXF1aXJlIHRoZSBmb2xsb3dpbmcgYmluZGluZzoKPj4+
IHBvcnQ6Cj4+PiDCoMKgwqDCoCRyZWY6IGF1ZGlvLWdyYXBoLXBvcnQueWFtbCMKPj4+IMKgwqDC
oMKgdW5ldmFsdWF0ZWRQcm9wZXJ0aWVzOiBmYWxzZQo+Pj4KPj4+IEhvd2V2ZXIgdGhlIHNwaSBi
aW5kaW5nIHJlcXVpcmVzIHRvIGludHJvZHVjZSBhIHVuaXQgYWRkcmVzczoKPj4+IHBhdHRlcm5Q
cm9wZXJ0aWVzOgo+Pj4gwqDCoCAnXnBvcnRAWzAtOV0nOgo+Pj4gwqDCoMKgwqAgJHJlZjogYXVk
aW8tZ3JhcGgtcG9ydC55YW1sIwo+Pj4gwqDCoMKgwqAgdW5ldmFsdWF0ZWRQcm9wZXJ0aWVzOiBm
YWxzZQo+Pj4KPj4+IFRoZSB3YXJuaW5nIGNhbiBiZSByZW1vdmVkIGJ5IHJlLW9yZGVyaW5nIHRo
ZSBiaW5kaW5ncyBwYXRjaGVzIGluIHRoZSBzZXJpZSwKPj4+IGFzICJhZGRpdGlvbmFsUHJvcGVy
dGllczogdHJ1ZSIgbWFrZXMgdGhlIGNoZWNrIG1vcmUgdG9sZXJhbnQgb24gZXh0cmEKPj4+IHBy
b3BlcnRpZXMuCj4+Cj4+IFRoYXQncyBuZXZlciByaWdodC4KPj4KPj4+IFRoZSBwYXRjaCAiQVNv
QzogZHQtYmluZGluZ3M6IHN0bTMyOiBpMnM6IGFkZCBhdWRpby1ncmFwaC1jYXJkIHBvcnQiIGNh
bgo+Pj4gZXZlbiBiZSBtZXJlbHkgZHJvcHBlZC4KPj4+IFNvLCBJIHN1Z2dlc3QgdG8gcmVzZW5k
IHRoZSBzZXJpZSB3aXRob3V0IGF1ZGlvLWdyYXBoLWNhcmQgcGF0Y2guCj4+Cj4+IE9ubHkgaWYg
eW91IGFyZW4ndCB1c2luZyBhdWRpby1ncmFwaC1jYXJkLgo+Pgo+Pj4KPj4+IERvZXMgaXQgc291
bmQgdG9vIHBlcm1pc3NpdmUgdG8geW91ID8KPj4KPj4gSSB0aGluayBwZXJoYXBzIHlvdSBuZWVk
IHRvIGNvbWJpbmUgdGhlIHNjaGVtYXMgaW50byAxLiBPciB5b3UgbmVlZCB0bwo+PiByZXN0cnVj
dHVyZSB5b3VyIGR0c2kgZmlsZXMgc3VjaCB0aGF0IHlvdSBvbmx5IGFkZCBzcGkgc3BlY2lmaWMK
Pj4gcHJvcGVydGllcyB3aGVuIHNwaSBtb2RlIGlzIGVuYWJsZWQgYW5kIG9ubHkgYWRkIGkycyBz
cGVjaWZpYyBwcm9wZXJ0aWVzCj4+IHdoZW4gaTJzIG1vZGUgaXMgZW5hYmxlZC4gT3IgdXNlIHRo
ZSAvZGVsZXRlLXByb3BlcnR5LyBkaXJlY3RpdmUuCj4gCj4gSW5pdGlhbGx5IHRoZSBhaW0gb2Yg
dGhpcyBzZXJpZXMgd2FzIHRvIGZpeCBhICJtYWtlIFc9MSIgd2FybmluZ3Mgc2VlbiBvbiBzcGkg
YW5kIGkycyBub2RlcyAoZHVwbGljYXRlIHVuaXQtYWRkcmVzcykuIE1vdmluZyBib3RoIG5vZGVz
IGluIGEgY29tbW9uIG5vZGUgKyB1c2luZyBhIGRpZmZlcmVudCBjb21wYXRpYmxlIGRlcGVuZGlu
ZyBvbiBTUEkgb3IgSTJTIHVzYWdlIHNvdW5kZWQgZ29vZCkgYnV0IGl0IGlzIG5vdCBlbm91Z2gu
IEluIHRoaXMgc2VyaWVzIHRoZSBjb21tb24gbm9kZSBpcyBuYW1lZCBhcyBmb2xsb3dpbmc6ICJz
cGkyczI6IHNwaUA0MDAwYjAwMCIuIEl0IGlzIGZpbmUgZm9yIGEgc3BpIHVzYWdlIGJ1dCBpZiB3
ZSB3YW50IHRvIHVzZSB0aGlzICJjb21tb24gbm9kZSIgd2l0aCBJMlMgY29tcGF0aWJsZSBhbmQg
c3BlY2lmaWMgYmluZGluZ3MsIHRoZSBub2RlIG5hbWUgcmVtYWlucyBzcGlALi4uIGFuZCB0aGVu
IHNwZWNpZmljIHNwaSBjaGVja3MgYXJlIGRvbmUuIEZvciB0aGlzIHdpdGggdGhpcyBzZXJpZXMg
YXBwbGllZCB3ZSBnb3QgdGhpcyBpc3N1ZSByZXBvcnRlZCBieSBzcGktY29udHJvbGxlci55YW1s
Ogo+IAo+IHNwaUA0MDAwYjAwMDogcG9ydEAwOiAnY29tcGF0aWJsZScgaXMgYSByZXF1aXJlZCBw
cm9wZXJ0eQo+IAo+IFNvLCBpZiB3ZSB1c2UgdHdvIHNlcGFyYXRlcyBub2RlcyB3ZSBnb3QgVz0x
IHdhcm5pbmcgYW5kIGlmIHdlIHVzZSBhIGNvbW1vbiBub2RlIHdlIGdvdCB5YW1sIGNoZWNrIGlz
c3VlLiBPbmUgcG9zc2liaWxpdHkgd291bGQgYmUgdG8gdXNlIGEgY29tbW9uIG5vZGUgd2l0aCBh
IG5ldyBub2RlIG5hbWUgKGZvciBleGFtcGxlIGkyc3BpQC4uLikgYnV0IEkgdGhpbmsgaXQgaXMg
bm90IGFjY2VwdGFibGUuCj4gCj4gSG93IHRvIHByb2dyZXNzID8KCkF0bWVsIEZsZXhjb20gY2Fu
IGJlIGNvbmZpZ3VyZWQgdG8gYmUgZWl0aGVyIFVBUlQsIFNQSSBvciBpMmMuIEZ1bmN0aW9ucwph
cmUgY2hpbGQgbm9kZXMgb2YgdGhlIGZsZXhjb20gbm9kZSBhbmQgdGhlIE1GRCBkcml2ZXIgbWF0
Y2hpbmcgYWdhaW5zdCBpdCwKanVzdCBjb25maWd1cmUgdGhlIG9wZXJhdGluZyBtb2RlIGFuZCB0
aGVuIGNhbGxzIG9mX3BsYXRmb3JtX3BvcHVsYXRlLgoKV291bGQgc29tZXRoaW5nIGFsb25nIHRo
ZXNlIGxpbmVzIGZpdCBoZXJlIGFzIHdlbGw/CgpDaGVlcnMsCkFobWFkCgo+IAo+IFRoYW5rcwo+
IEFsZXgKPiAKPiAKPj4gUm9iCj4+Cj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KPiBMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKPiBMaW51eC1zdG0z
MkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCj4gaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIKPiAKCgotLSAKUGVuZ3V0
cm9uaXggZS5LLiAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwKU3RldWVyd2FsZGVyIFN0ci4gMjEgICAgICAgICAgICAgICAgICAgICAgIHwg
aHR0cDovL3d3dy5wZW5ndXRyb25peC5kZS8gIHwKMzExMzcgSGlsZGVzaGVpbSwgR2VybWFueSAg
ICAgICAgICAgICAgICAgIHwgUGhvbmU6ICs0OS01MTIxLTIwNjkxNy0wICAgIHwKQW10c2dlcmlj
aHQgSGlsZGVzaGVpbSwgSFJBIDI2ODYgICAgICAgICAgIHwgRmF4OiAgICs0OS01MTIxLTIwNjkx
Ny01NTU1IHwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlz
dGluZm8vbGludXgtc3RtMzIK
