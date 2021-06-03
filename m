Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2561339A3D2
	for <lists+linux-stm32@lfdr.de>; Thu,  3 Jun 2021 16:59:01 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A970EC57B69;
	Thu,  3 Jun 2021 14:59:00 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 58CF1C57196
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  3 Jun 2021 14:58:59 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <a.fatoum@pengutronix.de>)
 id 1loooE-0002s8-PC; Thu, 03 Jun 2021 16:58:58 +0200
To: Grzegorz Szymaszek <gszymaszek@short.pl>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Marcin Sloniewski <marcin.sloniewski@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <YLjl6lE+uZ5ZCdiS@nx64de-df6d00>
 <fcee4f30-446e-f4da-6d95-c9223cf82981@pengutronix.de>
 <YLjr6XaK7q3r8dmi@nx64de-df6d00>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Message-ID: <7af54c28-1cc1-775e-a544-45a0f5f9957e@pengutronix.de>
Date: Thu, 3 Jun 2021 16:58:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <YLjr6XaK7q3r8dmi@nx64de-df6d00>
Content-Language: en-US
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: set stm32mp157c-odyssey
	DCMI pins
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

T24gMDMuMDYuMjEgMTY6NDksIEdyemVnb3J6IFN6eW1hc3playB3cm90ZToKPiBIZWxsbyBBaG1h
ZCwKPiAKPiBPbiBUaHUsIEp1biAwMywgMjAyMSBhdCAwNDoyNjo1OVBNICswMjAwLCBBaG1hZCBG
YXRvdW0gd3JvdGU6Cj4+IE9uIDAzLjA2LjIxIDE2OjIzLCBHcnplZ29yeiBTenltYXN6ZWsgd3Jv
dGU6Cj4+PiBUaGUgU2VlZWQgT2R5c3NleS1TVE0zMk1QMTU3QyBib2FyZCBoYXMgYSAyMC1waW4g
RFZQIGNhbWVyYSBvdXRwdXQuCj4+PiBzdG0zMm1wMTUtcGluY3RybC5kdHNpIGNvbnRhaW5zIG9u
ZSBwaW4gc3RhdGUgZGVmaW5pdGlvbiBmb3IgdGhlIERDTUkKPj4+IGludGVyZmFjZSwgZGNtaS0w
LCBBS0EgcGhhbmRsZSBkY21pX3BpbnNfYS4gVGhpcyBkZWZpbml0aW9uIGlzCj4+PiBpbmNvbXBh
dGlibGUgd2l0aCB0aGUgcGlucyB1c2VkIG9uIHRoZSBPZHlzc2V5IGJvYXJkLCB3aGVyZToKPj4+
IC0gdGhlcmUgYXJlIDggZGF0YSBwaW5zIGluc3RlYWQgb2YgMTIsCj4+PiAtIFvigKZdCj4+Pgo+
Pj4gT3ZlcnJpZGUgdGhlIGRjbWlfcGluc19hIGRlZmluaXRpb24gKGFzIHdlbGwgYXMgZGNtaV9z
bGVlcF9waW5zX2EpIGluCj4+PiB0aGUgT2R5c3NleSBkZXZpY2UgdHJlZS4KPj4KPj4gUmF0aGVy
IGRlZmluZSBhIG5ldyBwaW5jdHJsIGdyb3VwIChlLmcuICZkY21pX3BpbnNfYikgYW5kIHVzZSB0
aGF0Cj4+IGluc3RlYWQgb2Ygb3ZlcnJpZGluZyBhbiBleGlzdGluZyBvbmUuCj4gCj4gQ2FuIEkg
c2ltcGx5IHVzZSBkY21pX3BpbnNfYiAoYXMgdGhlIGZpcnN0IHVudXNlZCBpZGVudGlmaWVyKSBv
ciBpcwo+IHRoZXJlIHNvbWUgd2F5IHRvIG1hdGNoIHNwZWNpZmljIHBpbiBncm91cHMgdG8gYW4g
aWRlbnRpZmllciAoYiwgYywgZCwKPiBhbmQgc28gb24pPwoKSnVzdCB0YWtlIHRoZSBuZXh0IGF2
YWlsYWJsZS4gVGhhdCdzIGhvdyBJIGRpZCBpdCBzbyBmYXIuCgo+PiBDdXJyZW50IGNvbnZlbnRp
b24gaXMgYWxzbyB0byBwbGFjZSBhbGwgU1RNMzJNUDEgcGluY3RybCBub2RlcyBpbnRvCj4+IGEg
Y2VudHJhbCBmaWxlLCBub3QgaW4gdGhlIGluZGl2aWR1YWwgYm9hcmQgZGV2aWNlIHRyZWVzLgo+
IAo+IFN1cmUsIEkgd2lsbCB1cGRhdGUgdGhlIHBhdGNoLgo+IAo+IFRoYW5rcyBmb3IgeW91ciBj
b21tZW50cyEKCkNoZWVycywKQWhtYWQKCi0tIApQZW5ndXRyb25peCBlLksuICAgICAgICAgICAg
ICAgICAgICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfApTdGV1ZXJ3YWxk
ZXIgU3RyLiAyMSAgICAgICAgICAgICAgICAgICAgICAgfCBodHRwOi8vd3d3LnBlbmd1dHJvbml4
LmRlLyAgfAozMTEzNyBIaWxkZXNoZWltLCBHZXJtYW55ICAgICAgICAgICAgICAgICAgfCBQaG9u
ZTogKzQ5LTUxMjEtMjA2OTE3LTAgICAgfApBbXRzZ2VyaWNodCBIaWxkZXNoZWltLCBIUkEgMjY4
NiAgICAgICAgICAgfCBGYXg6ICAgKzQ5LTUxMjEtMjA2OTE3LTU1NTUgfApfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxp
c3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
