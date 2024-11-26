Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C499D9986
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Nov 2024 15:21:48 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D6EDDC78023;
	Tue, 26 Nov 2024 14:21:47 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8AFCBC78020
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Nov 2024 14:21:40 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ore@pengutronix.de>)
 id 1tFwRV-0001t6-Mp; Tue, 26 Nov 2024 15:21:29 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <ore@pengutronix.de>) id 1tFwRR-000GRf-2M;
 Tue, 26 Nov 2024 15:21:26 +0100
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
 (envelope-from <ore@pengutronix.de>) id 1tFwRS-00GeR7-1E;
 Tue, 26 Nov 2024 15:21:26 +0100
Date: Tue, 26 Nov 2024 15:21:26 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <Z0XZZszZFVbVl_kN@pengutronix.de>
References: <Z0XEWGqLJ8okNSIr@shell.armlinux.org.uk>
 <Z0XGl0caztvVarmZ@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z0XGl0caztvVarmZ@shell.armlinux.org.uk>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: UNGLinuxDriver@microchip.com, Andrew Lunn <andrew@lunn.ch>,
 Marcin Wojtas <marcin.s.wojtas@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Bryan Whitehead <bryan.whitehead@microchip.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH RFC net-next 00/23] net: phylink managed
	EEE support
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

SGkgUnVzc2VsbCwKCk9uIFR1ZSwgTm92IDI2LCAyMDI0IGF0IDAxOjAxOjExUE0gKzAwMDAsIFJ1
c3NlbGwgS2luZyAoT3JhY2xlKSB3cm90ZToKPiBPbiBUdWUsIE5vdiAyNiwgMjAyNCBhdCAxMjo1
MTozNlBNICswMDAwLCBSdXNzZWxsIEtpbmcgKE9yYWNsZSkgd3JvdGU6Cj4gPiBQYXRjaCAxMSBh
ZGRzIHBoeWxpbmsgbWFuYWdlZCBFRUUgc3VwcG9ydC4gVHdvIG5ldyBNQUMgQVBJcyBhcmUgYWRk
ZWQsCj4gPiB0byBlbmFibGUgYW5kIGRpc2FibGUgTFBJLiBUaGUgZW5hYmxlIG1ldGhvZCBpcyBw
YXNzZWQgdGhlIExQSSB0aW1lcgo+ID4gc2V0dGluZyB3aGljaCBpdCBpcyBleHBlY3RlZCB0byBw
cm9ncmFtIGludG8gdGhlIGhhcmR3YXJlLCBhbmQgYWxzbyBhCj4gPiBmbGFnIGVodGhlciB0aGUg
dHJhbnNtaXQgY2xvY2sgc2hvdWxkIGJlIHN0b3BwZWQuCj4gPiAKPiA+ICAqKiogVGhlcmUgYXJl
IG9wZW4gcXVlc3Rpb25zIGhlcmUuIEVhZ2xlIGV5ZWQgcmV2aWV3ZXJzIHdpbGwgbm90aWNlCj4g
PiAgICBwbC0+Y29uZmlnLT5scGlfaW50ZXJmYWNlcy4gVGhlcmUgYXJlIE1BQ3Mgb3V0IHRoZXJl
IHdoaWNoIG9ubHkKPiA+ICAgIHN1cHBvcnQgTFBJIHNpZ25hbGxpbmcgb24gYSBzdWJzZXQgb2Yg
dGhlaXIgaW50ZXJmYWNlIHR5cGVzLiBQaHlsaWIKPiA+ICAgIGRvZXNuJ3QgdW5kZXJzdGFuZCB0
aGlzLiBJJ20gaGFuZGxpbmcgdGhpcyBhdCB0aGUgbW9tZW50IGJ5IHNpbXBseQo+ID4gICAgbm90
IGFjdGl2YXRpbmcgTFBJIGF0IHRoZSBNQUMsIGJ1dCB0aGF0IGxlYWRzIHRvIGV0aHRvb2wgLS1z
aG93LWVlZQo+ID4gICAgc3VnZ2VzdGluZyB0aGF0IEVFRSBpcyBhY3RpdmUgd2hlbiBpdCBpc24n
dC4KPiA+ICAqKiogU2hvdWxkIHdlIHBhc3MgdGhlIHBoeV9pbnRlcmZhY2VfdCB0byB0aGVzZSBm
dW5jdGlvbnM/Cj4gPiAgKioqIFNob3VsZCBtYWNfZW5hYmxlX3R4X2xwaSgpIGJlIGFsbG93ZWQg
dG8gZmFpbCBpZiB0aGUgTUFDIGRvZXNuJ3QKPiA+ICAgIHN1cHBvcnQgdGhlIGludGVyZmFjZSBt
b2RlPwo+IAo+IFRoZXJlIGlzIGFub3RoZXIgcG9pbnQgdG8gcmFpc2UgaGVyZSAtIHNob3VsZCB3
ZSBoYXZlIGEgInZhbGlkYXRlX2VlZSIKPiBtZXRob2QgaW4gc3RydWN0IHBoeWxpbmtfbWFjX29w
cyBzbyB0aGF0IE1BQyBkcml2ZXJzIGNhbiB2YWxpZGF0ZQo+IHNldHRpbmdzIHN1Y2ggYXMgdGhl
IHR4X2xwaV90aW1lciB2YWx1ZSBjYW4gYmUgcHJvZ3JhbW1lZCBpbnRvIHRoZQo+IGhhcmR3YXJl
Pwo+IAo+IFdlIGRvIGhhdmUgdGhlIHNpdHVhdGlvbiBvbiBNYXJ2ZWxsIHBsYXRmb3JtcyB3aGVy
ZSB0aGUgcHJvZ3JhbW1lZAo+IHZhbHVlIGRlcGVuZHMgb24gdGhlIE1BQyBzcGVlZCwgYW5kIGlz
IG9ubHkgOCBiaXQsIHdoaWNoIG1ha2VzCj4gdmFsaWRhdGluZyBpdHMgdmFsdWUgcmF0aGVyIGRp
ZmZpY3VsdCAtIGF0IDFHIHNwZWVkcywgaXQncyBhCj4gcmVzb2x1dGlvbiBvZiAxdXMgc28gd2Ug
Y2FuIHN1cHBvcnQgdXAgdG8gMjU1dXMuIEF0IDEwME0gc3BlZWRzLAo+IGl0J3MgMTB1cywgc3Vw
cG9ydGluZyB1cCB0byAyLjU1bXMuIFRoaXMgbWFrZXMgaXQgYXdrd2FyZCB0byBiZSBhYmxlCj4g
dG8gdmFsaWRhdGUgdGhlIHNldF9lZWUoKSBzZXR0aW5ncyBhcmUgc2FuZSBmb3IgdGhlIGhhcmR3
YXJlLiBTaG91bGQKPiBNYXJ2ZWxsIHBsYXRmb3JtcyBpbnN0ZWFkIGltcGxlbWVudCBhIGhydGlt
ZXIgYWJvdmUgdGhpcz8gVGhhdCBzb3VuZHMKPiBhIGJpdCBwcm9ibGVtYXRpY2FsIHRvIG1hbmFn
ZSBzYW5lbHkuCgpJIGFncmVlIHRoYXQgdHhfbHBpX3RpbWVyIGNhbiBiZSBhIHByb2JsZW0sIGFu
ZCB0aGlzIGlzIG5vdCBqdXN0IGEKTWFydmVsbCBpc3N1ZS4gIEZvciBleGFtcGxlLCBJIHRoaW5r
IHRoZSBGRUMgTUFDIG9uIGkuTVg4TVAgbWlnaHQgYWxzbwpiZSBhZmZlY3RlZC4gIEJ1dCBJIGNh
bid0IGNvbmZpcm0gdGhpcyBiZWNhdXNlIEkgZG9uJ3QgaGF2ZSBhbiBpLk1YOE1QCmJvYXJkIHdp
dGggYSBQSFkgdGhhdCBzdXBwb3J0cyBNQUMtY29udHJvbGxlZCBFRUUgbW9kZS4gVGhlIFJlYWx0
ZWsgUEhZCkkgaGF2ZSB1c2VzIFBIWS1jb250cm9sbGVkIEVFRSAoU21hcnRFRUUpLgoKRXhjZXB0
IGZvciB0aGlzLCBJIHRoaW5rIHRoZXJlIHNob3VsZCBiZSBzYW5lIGRlZmF1bHQgdmFsdWVzIGZv
cgp0eF9scGlfdGltZXIuICBUaGUgSUVFRSA4MDIuMy0yMDIyIHN0YW5kYXJkIChTZWN0aW9uIDc4
LjIpIGRlc2NyaWJlcyBFRUUKdGltaW5nLCBidXQgaXQgZG9lc27igJl0IGdpdmUgYSBjbGVhciBy
ZWNvbW1lbmRhdGlvbiBmb3IgdHhfbHBpX3RpbWVyLgpJTU8sIHRoZSBiZXN0IHZhbHVlIGZvciB0
eF9scGlfdGltZXIgc2hvdWxkIGJlIHRoZSBzdW0gb2YgdGhlIHRpbWUKbmVlZGVkIHRvIHB1dCB0
aGUgZnVsbCBjaGFpbiAoTUFDIC0+IFBIWSAtPiByZW1vdGUgUEhZKSBpbnRvIHNsZWVwIG1vZGUK
YW5kIHRoZSB0aW1lIG5lZWRlZCB0byB3YWtlIHRoZSBjaGFpbi4gVGhlc2UgdGltZXMgYXJlIGxp
bmstc3BlZWQKc3BlY2lmaWMsIHNvIGRlZmF1bHRzIHNob3VsZCBjb25zaWRlciBQSFkgdGltaW5n
cyBmb3IgZWFjaCBsaW5rIHNwZWVkLgoKRXhjZXB0IGZvciB0eF9scGlfdGltZXIsIHNvbWUgTUFD
cyBhbHNvIGFsbG93IGNvbmZpZ3VyYXRpb24gb2YgdGhlIFR3YWtlCnRpbWVyLiAgRm9yIGV4YW1w
bGUsIHRoZSBGRUMgZHJpdmVyIHVzZXMgdGhlIGxwaV90aW1lciB2YWx1ZSB0bwpjb25maWd1cmUg
dGhlIFR3YWtlIHRpbWVyLCBhbmQgdGhlIExBTjc4eHggZHJpdmVyIGFsc28gcHJvdmlkZXMgYQpj
b25maWd1cmFibGUgVHdha2UgdGltZXIgcmVnaXN0ZXIuCgpJZiB0aGUgVHdha2UgdGltZXIgaXMg
bm90IGNvbmZpZ3VyZWQgcHJvcGVybHksIG9yIGlmIHRoZSBzeXN0ZW0gaGFzCnF1aXJrcyBjYXVz
aW5nIHRoZSBhY3R1YWwgVHdha2UgdGltZSB0byBiZSBsb25nZXIgdGhhbiBleHBlY3RlZCwgaXQg
Y2FuCnJlc3VsdCBpbiBmcmFtZSBjb3JydXB0aW9uLiAKClJlZ2FyZHMsCk9sZWtzaWoKLS0gClBl
bmd1dHJvbml4IGUuSy4gICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB8ClN0ZXVlcndhbGRlciBTdHIuIDIxICAgICAgICAgICAgICAgICAgICAg
ICB8IGh0dHA6Ly93d3cucGVuZ3V0cm9uaXguZGUvICB8CjMxMTM3IEhpbGRlc2hlaW0sIEdlcm1h
bnkgICAgICAgICAgICAgICAgICB8IFBob25lOiArNDktNTEyMS0yMDY5MTctMCAgICB8CkFtdHNn
ZXJpY2h0IEhpbGRlc2hlaW0sIEhSQSAyNjg2ICAgICAgICAgICB8IEZheDogICArNDktNTEyMS0y
MDY5MTctNTU1NSB8Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
