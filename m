Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 248661CD4C3
	for <lists+linux-stm32@lfdr.de>; Mon, 11 May 2020 11:22:46 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 72145C36B24;
	Mon, 11 May 2020 09:22:45 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6D55CC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 May 2020 09:22:41 +0000 (UTC)
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id D238124000F;
 Mon, 11 May 2020 09:22:38 +0000 (UTC)
Date: Mon, 11 May 2020 11:22:37 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christophe Kerello <christophe.kerello@st.com>
Message-ID: <20200511112237.20751831@xps13>
In-Reply-To: <1588756279-17289-1-git-send-email-christophe.kerello@st.com>
References: <1588756279-17289-1-git-send-email-christophe.kerello@st.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, marex@denx.de,
 vigneshr@ti.com, gregkh@linuxfoundation.org, richard@nod.at,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, boris.brezillon@collabora.com,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v4 00/10] add STM32 FMC2 EBI controller
	driver
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

SGkgQ2hyaXN0b3BoZSwKCkNocmlzdG9waGUgS2VyZWxsbyA8Y2hyaXN0b3BoZS5rZXJlbGxvQHN0
LmNvbT4gd3JvdGUgb24gV2VkLCA2IE1heSAyMDIwCjExOjExOjA5ICswMjAwOgoKPiBUaGUgRk1D
MiBmdW5jdGlvbmFsIGJsb2NrIG1ha2VzIHRoZSBpbnRlcmZhY2Ugd2l0aDogc3luY2hyb25vdXMg
YW5kCj4gYXN5bmNocm9ub3VzIHN0YXRpYyBkZXZpY2VzIChzdWNoIGFzIFBTTk9SLCBQU1JBTSBv
ciBvdGhlciBtZW1vcnktbWFwcGVkCj4gcGVyaXBoZXJhbHMpIGFuZCBOQU5EIGZsYXNoIG1lbW9y
aWVzLgo+IEl0cyBtYWluIHB1cnBvc2VzIGFyZToKPiAgIC0gdG8gdHJhbnNsYXRlIEFYSSB0cmFu
c2FjdGlvbnMgaW50byB0aGUgYXBwcm9wcmlhdGUgZXh0ZXJuYWwgZGV2aWNlCj4gICAgIHByb3Rv
Y29sCj4gICAtIHRvIG1lZXQgdGhlIGFjY2VzcyB0aW1lIHJlcXVpcmVtZW50cyBvZiB0aGUgZXh0
ZXJuYWwgZGV2aWNlcwo+IEFsbCBleHRlcm5hbCBkZXZpY2VzIHNoYXJlIHRoZSBhZGRyZXNzZXMs
IGRhdGEgYW5kIGNvbnRyb2wgc2lnbmFscyB3aXRoIHRoZQo+IGNvbnRyb2xsZXIuIEVhY2ggZXh0
ZXJuYWwgZGV2aWNlIGlzIGFjY2Vzc2VkIGJ5IG1lYW5zIG9mIGEgdW5pcXVlIENoaXAKPiBTZWxl
Y3QuIFRoZSBGTUMyIHBlcmZvcm1zIG9ubHkgb25lIGFjY2VzcyBhdCBhIHRpbWUgdG8gYW4gZXh0
ZXJuYWwgZGV2aWNlLgo+IAo+IENoYW5nZXMgaW4gdjQ6Cj4gIC0gYmluZGluZ3M6Cj4gICAgLSBm
aXggZmlsZW5hbWU6IHN0LHN0bTMyLWZtYzItZWJpLnlhbWwKPiAKPiBDaGFuZ2VzIGluIHYzOgo+
ICAtIE5BTkQ6Cj4gICAgLSByZW5hbWUgbGFiZWxzIHVzZWQgb24gZXJyb3JzCj4gICAgLSBhZGQg
aW4gdGhlIGNvbW1pdCBsb2cgdGhlIHJlYXNvbiB0byBpbmNyZWFzZSBGTUMyX1RJTUVPVVRfTVMg
KHBhdGNoIDMpCj4gICAgLSBhZGQgTWlxdWVsIHJldmlld2VkLWJ5IHRhZyAocGF0Y2hlcyAyLzQv
NS85KQo+ICAtIEVCSToKPiAgICAtIG1vdmUgaW4gbWVtb3J5IGZvbGRlcgo+ICAgIC0gbWVyZ2Ug
TUZEIGFuZCBCVVMgZHJpdmVycyB0byBhdm9pZCBhIE1GRCBkcml2ZXIKPiAgLSBiaW5kaW5nczoK
PiAgICAtIHBhdHRlcm4gbmFtZSBoYXMgYmVlbiBtb2RpZmllZAo+ICAgIC0gdmVuZG9yIHByb3Bl
cnRpZXMgaGF2ZSBiZWVuIG1vZGlmaWVkCj4gICAgICAtIHMvXy8tLwo+ICAgICAgLSBhZGQgdW5p
dCBzdWZmaXggKC1ucykgb24gdGltaW5nIHByb3BlcnRpZXMKPiAKPiBDaHJpc3RvcGhlIEtlcmVs
bG8gKDEwKToKPiAgIG10ZDogcmF3bmFuZDogc3RtMzJfZm1jMjogbWFuYWdlIGFsbCBlcnJvcnMg
Y2FzZXMgYXQgcHJvYmUgdGltZQo+ICAgbXRkOiByYXduYW5kOiBzdG0zMl9mbWMyOiByZW1vdmUg
dXNlbGVzcyBpbmxpbmUgY29tbWVudHMKPiAgIG10ZDogcmF3bmFuZDogc3RtMzJfZm1jMjogdXNl
IEZNQzJfVElNRU9VVF9NUyBmb3IgdGltZW91dHMKPiAgIG10ZDogcmF3bmFuZDogc3RtMzJfZm1j
MjogY2xlYW51cAo+ICAgbXRkOiByYXduYW5kOiBzdG0zMl9mbWMyOiB1c2UgRklFTERfUFJFUC9G
SUVMRF9HRVQgbWFjcm9zCj4gICBkdC1iaW5kaW5nczogbXRkOiB1cGRhdGUgU1RNMzIgRk1DMiBO
QU5EIGNvbnRyb2xsZXIgZG9jdW1lbnRhdGlvbgo+ICAgZHQtYmluZGluZ3M6IG1lbW9yeS1jb250
cm9sbGVyOiBhZGQgU1RNMzIgRk1DMiBFQkkgY29udHJvbGxlcgo+ICAgICBkb2N1bWVudGF0aW9u
Cj4gICBtZW1vcnk6IHN0bTMyLWZtYzItZWJpOiBhZGQgU1RNMzIgRk1DMiBFQkkgY29udHJvbGxl
ciBkcml2ZXIKPiAgIG10ZDogcmF3bmFuZDogc3RtMzJfZm1jMjogdXNlIHJlZ21hcCBBUElzCj4g
ICBtdGQ6IHJhd25hbmQ6IHN0bTMyX2ZtYzI6IGdldCByZXNvdXJjZXMgZnJvbSBwYXJlbnQgbm9k
ZQo+IAo+ICAuLi4vbWVtb3J5LWNvbnRyb2xsZXJzL3N0LHN0bTMyLWZtYzItZWJpLnlhbWwgICAg
ICB8ICAyNjEgKysrKysKPiAgLi4uL2JpbmRpbmdzL210ZC9zdCxzdG0zMi1mbWMyLW5hbmQueWFt
bCAgICAgICAgICAgfCAgIDE5ICstCj4gIGRyaXZlcnMvbWVtb3J5L0tjb25maWcgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHwgICAxMCArCj4gIGRyaXZlcnMvbWVtb3J5L01ha2VmaWxlICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgMSArCj4gIGRyaXZlcnMvbWVtb3J5L3N0bTMy
LWZtYzItZWJpLmMgICAgICAgICAgICAgICAgICAgIHwgMTIwNiArKysrKysrKysrKysrKysrKysr
Kwo+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgICB8
ICAgIDEgKwo+ICBkcml2ZXJzL210ZC9uYW5kL3Jhdy9zdG0zMl9mbWMyX25hbmQuYyAgICAgICAg
ICAgICB8IDExNzYgKysrKysrKysrKy0tLS0tLS0tLQo+ICA3IGZpbGVzIGNoYW5nZWQsIDIwNjEg
aW5zZXJ0aW9ucygrKSwgNjEzIGRlbGV0aW9ucygtKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lbW9yeS1jb250cm9sbGVycy9zdCxzdG0z
Mi1mbWMyLWViaS55YW1sCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL21lbW9yeS9zdG0z
Mi1mbWMyLWViaS5jCj4gCgpJJ20gZmluZSB3aXRoIHRoZSBwcmVwYXJhdGlvbiBwYXRjaGVzIDEt
NSBidXQgdGhlIG90aGVyIHBhdGNoZXMgbmVlZApSb2IncyBoYWNrIGFuZCBwcm9iYWJseSBtb3Jl
IGNoYW5nZXMuIElmIGl0J3MgZmluZSB3aXRoIHlvdSBJIGNhbiBhcHBseQp0aGVzZSBwYXRjaGVz
IGZvciB0aGUgbmV4dCBtZXJnZSB3aW5kb3cgYW5kIGxldCBtb3JlIHRpbWUgdG8gd29yayBvbgp0
aGUgbGFzdCA1LgoKVGhhbmtzLApNaXF1w6hsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBz
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
