Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A0C50F22C
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Apr 2022 09:21:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6E15EC60466;
	Tue, 26 Apr 2022 07:21:27 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9F91AC5F1D6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Apr 2022 07:21:26 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ore@pengutronix.de>)
 id 1njFVb-0003LR-UF; Tue, 26 Apr 2022 09:21:15 +0200
Received: from ore by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <ore@pengutronix.de>)
 id 1njFVZ-0003DA-1N; Tue, 26 Apr 2022 09:21:13 +0200
Date: Tue, 26 Apr 2022 09:21:13 +0200
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: =?utf-8?B?SsOpcsO0bWU=?= Pouiller <jerome.pouiller@silabs.com>
Message-ID: <20220426072113.GC3419@pengutronix.de>
References: <20220425132844.866743-1-o.rempel@pengutronix.de>
 <20220425132844.866743-3-o.rempel@pengutronix.de>
 <14881918.tv2OnDr8pf@pc-42>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <14881918.tv2OnDr8pf@pc-42>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 09:16:29 up 26 days, 19:46, 75 users,  load average: 0.03, 0.11, 0.14
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, kernel@pengutronix.de,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 2/4] dt-bindings: net: silabs,
 wfx: add prt, prtt1c-wfm200 antenna variant
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

T24gTW9uLCBBcHIgMjUsIDIwMjIgYXQgMDU6Mzg6MjBQTSArMDIwMCwgSsOpcsO0bWUgUG91aWxs
ZXIgd3JvdGU6Cj4gT24gTW9uZGF5IDI1IEFwcmlsIDIwMjIgMTU6Mjg6NDIgQ0VTVCBPbGVrc2lq
IFJlbXBlbCB3cm90ZToKPiA+IEFkZCBjb21wYXRpYmxlIGZvciB3Zm0yMDAgYW50ZW5uYSBjb25m
aWd1cmF0aW9uIHZhcmlhbnQgZm9yIFByb3RvbmljIFBSVFQxQwo+ID4gYm9hcmQuCj4gPiAKPiA+
IFNpZ25lZC1vZmYtYnk6IE9sZWtzaWogUmVtcGVsIDxvLnJlbXBlbEBwZW5ndXRyb25peC5kZT4K
PiA+IC0tLQo+ID4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3N0YWdpbmcvbmV0L3dpcmVsZXNz
L3NpbGFicyx3ZngueWFtbCAgICAgfCAxICsKPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKykKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9zdGFnaW5nL25ldC93aXJlbGVzcy9zaWxhYnMsd2Z4LnlhbWwgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3Mvc3RhZ2luZy9uZXQvd2lyZWxlc3Mvc2lsYWJzLHdmeC55YW1s
Cj4gPiBpbmRleCAxMDU3MjVhMTI3YWIuLmNlMTA3ZmU0NWQ3YyAxMDA2NDQKPiA+IC0tLSBhL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zdGFnaW5nL25ldC93aXJlbGVzcy9zaWxh
YnMsd2Z4LnlhbWwKPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9z
dGFnaW5nL25ldC93aXJlbGVzcy9zaWxhYnMsd2Z4LnlhbWwKPiA+IEBAIC0zOSw2ICszOSw3IEBA
IHByb3BlcnRpZXM6Cj4gPiAgICBjb21wYXRpYmxlOgo+ID4gICAgICBpdGVtczoKPiA+ICAgICAg
ICAtIGVudW06Cj4gPiArICAgICAgICAgIC0gcHJ0LHBydHQxYy13Zm0yMDAgIyBQcm90b25pYyBQ
UlRUMUMgQm9hcmQKPiA+ICAgICAgICAgICAgLSBzaWxhYnMsYnJkNDAwMWEgIyBXR00xNjBQIEV2
YWx1YXRpb24gQm9hcmQKPiA+ICAgICAgICAgICAgLSBzaWxhYnMsYnJkODAyMmEgIyBXRjIwMCBF
dmFsdWF0aW9uIEJvYXJkCj4gPiAgICAgICAgICAgIC0gc2lsYWJzLGJyZDgwMjNhICMgV0ZNMjAw
IEV2YWx1YXRpb24gQm9hcmQKPiAKPiBJIHRoaW5rIHlvdSBhbHNvIGhhdmUgdG8gZGVjbGFyZSB0
aGlzIG5ldyBlbnRyeSBpbiB3Znhfc2Rpb19vZl9tYXRjaCwKPiBhbmQvb3Igd2Z4X3NwaV9vZl9t
YXRjaCBhbmQgd2Z4X3NwaV9pZC4KPiAKPiBPbiB0aGUgV0ZNMjAwIHZhcmlhbnQsIHRoZSBhbnRl
bm5hIGlzIGJ1aWx0IGluIHRoZSBjaGlwLiBTbyBJIHRoaW5rIHlvdQo+IGNhbiBwb2ludCBvbiB0
aGUgc2FtZSBjb25maWd1cmF0aW9uIHRoYW4gdGhlIGJyZDgwMjNhLgoKSSBhc3N1bWUgZHJpdmVy
IHVwZGF0ZSBjYW4gYmUgbWFkZSBpbiBhIHNlcGFyYXRlIHBhdGNoLiBBcyBzb29uIGFzIHdlCnJl
c2VydmVkIGNvbXBhdGlibGUgZm9yIHRoaXMgYm9hcmRzIHRoZXJlIHNob3VsZCBiZSBubyBjb25m
bGljdHMuIFRoaXMgcGF0Y2hlcwpzZXJpZXMgaXMgdGFyZ2V0aW5nIG9ubHkgZGV2aWNldHJlZSBh
bmQgbmVlZGVkIERUIHNjaGVtYSBjaGFuZ2VzLgoKUmVnYXJkcywKT2xla3NpagotLSAKUGVuZ3V0
cm9uaXggZS5LLiAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwKU3RldWVyd2FsZGVyIFN0ci4gMjEgICAgICAgICAgICAgICAgICAgICAgIHwg
aHR0cDovL3d3dy5wZW5ndXRyb25peC5kZS8gIHwKMzExMzcgSGlsZGVzaGVpbSwgR2VybWFueSAg
ICAgICAgICAgICAgICAgIHwgUGhvbmU6ICs0OS01MTIxLTIwNjkxNy0wICAgIHwKQW10c2dlcmlj
aHQgSGlsZGVzaGVpbSwgSFJBIDI2ODYgICAgICAgICAgIHwgRmF4OiAgICs0OS01MTIxLTIwNjkx
Ny01NTU1IHwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlz
dGluZm8vbGludXgtc3RtMzIK
