Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B24BB2A2B06
	for <lists+linux-stm32@lfdr.de>; Mon,  2 Nov 2020 13:52:19 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 75100C36B35;
	Mon,  2 Nov 2020 12:52:19 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 245D6C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Nov 2020 12:52:18 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[127.0.0.1])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <a.fatoum@pengutronix.de>)
 id 1kZZJp-000202-Fe; Mon, 02 Nov 2020 13:52:17 +0100
To: Marek Vasut <marex@denx.de>, Alexandre Torgue <alexandre.torgue@st.com>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 Kevin Hilman <khilman@baylibre.com>, SoC Team <soc@kernel.org>,
 arm-soc <arm@kernel.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Marcin Sloniewski <marcin.sloniewski@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>
References: <4ac236b3-b980-f653-f644-53e586570724@st.com>
 <4bb5d090-df39-8d58-808f-1fe33c54de14@pengutronix.de>
 <10efa774-946d-b02d-2d0c-37d451cb3ccd@denx.de>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Message-ID: <61a89fe2-639d-32b9-be66-9f51b73d579f@pengutronix.de>
Date: Mon, 2 Nov 2020 13:52:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <10efa774-946d-b02d-2d0c-37d451cb3ccd@denx.de>
Content-Language: en-US
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [GIT PULL] STM32 DT fixes for v5.10 #1
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

SGVsbG8gTWFyZWssCgpPbiAxMC8zMC8yMCAxMDowNCBBTSwgTWFyZWsgVmFzdXQgd3JvdGU6Cj4g
T24gMTAvMjgvMjAgNjozOCBQTSwgQWhtYWQgRmF0b3VtIHdyb3RlOgo+PiBIZWxsbyBBbGV4LAo+
IAo+IEhpLAo+IAo+PiBPbiAxMC8yOC8yMCA0OjI4IFBNLCBBbGV4YW5kcmUgVG9yZ3VlIHdyb3Rl
Ogo+Pj4gSGkgQXJuZCwgT2xvZiBhbmQgS2V2aW4sCj4+Pgo+Pj4gT24gdjUuMTAtcmMxIFNUTTMy
IGJvYXJkcyBjYW5ub3QgYm9vdC4gSXQgaXMgbGlua2VkIHRvIGEgY2hhbmdlIGluIHJlZ3VsYXRv
ciBmcmFtZXdvcmsgd2hpY2ggaGlnaGxpZ2h0cyB0aGF0IG91ciBzdXBwbGllcyBhcmUgbm90IHdl
bGwgZGVzY3JpYmVkLiBUaGlzIFBSIGZpeGVzIGl0IGZvciBTVE0zMiBib2FyZHMgdGhhdCBJIGhh
dmUgb24gbXkgZGVzazogRUQxIGFuZCBES3guCj4+Cj4+IFdoaWNoIGNoYW5nZSB0cmlnZ2VyZWQg
dGhlIHJlZ3Jlc3Npb24/Cj4gCj4gSSB0aGluayBpdCBtaWdodCBiZToKPiBhZWE2Y2I5OTcwM2Ug
KCJyZWd1bGF0b3I6IHJlc29sdmUgc3VwcGx5IGFmdGVyIGNyZWF0aW5nIHJlZ3VsYXRvciIpCj4g
d2hpY2ggbGFuZGVkIGluIDUuNC43MyBhcwo+IDAxMjBlYzMyYTc3NyAoInJlZ3VsYXRvcjogcmVz
b2x2ZSBzdXBwbHkgYWZ0ZXIgY3JlYXRpbmcgcmVndWxhdG9yIikKClRoYW5rcy4gSSBqdXN0IHJl
cGxpZWQgKHdpdGggYSBDQyB0byB0aGUgTUwgaGVyZSkgdG8gYW5vdGhlciB0aHJlYWQKcmVwb3J0
aW5nIGlzc3VlcyB0byB0aGUgYXV0aG9yJ3MgcGF0Y2guCgo+IAo+Pj4gSSBhc3N1bWUgdGhhdCBz
YW1lIHBhdGNoIGhhcyB0byBiZSBkb25lIGZvciBvdGhlciBTVE0zMiBib2FyZHMsIGJ1dCBhcyBJ
IGRvbid0IGhhdmUgc2NoZW1hdGljcyBJIGNhbid0IHByb3ZpZGUgaXQuIFNvIGEgcm91bmQyIGhh
cyB0byBiZSBkb25lIGZvcjoKPj4+IC0gc3Rpbmdlcjk2Cj4+PiAtIE1DLTEKPj4+IC0gT2R5c3Nl
eSBTT00KPj4+IC0gREhDT1IgL0RIQ09NCj4+Pgo+Pj4gTWFuaSwgTWFyZWssIEFobWFkLCBNYXJj
aW4gY2FuIHlvdSBwbGVhc2UgaGF2ZSBhIGxvb2sgb24gaXQgYW5kIHByb3ZpZGUgcGF0Y2hlcyAo
dGhlbiBJJ2xsIHByb3ZpZGUgcm91bmQyKS4gVGhhbmtzIGluIGFkdmFuY2UuCj4+Cj4+IFlvdXIg
Y2hhbmdlIGRvZXNuJ3QgbG9vayByaWdodC4gSWYgSSBzZXQgdnJlZl9kZHItc3VwcGx5IHRvIGEg
Zml4ZWQgcmVndWxhdG9yLAo+PiB0aGUgTUMtMSBub3cgYm9vdHMgYWdhaW4gYXMgd2VsbCwgYnV0
IHRoYXQgc2VlbXMgdG8ganVzdCBtYXNrIHRoZSByZWFsIGlzc3VlOgo+Pgo+PiDCoCAtIHZyZWZf
ZGRyIGlzIGFuIF9vdXRwdXRfIG9mIHRoZSBQTUlDLCB3aHkgc2hvdWxkIG9uZSBoYXZlIHRvIHNw
ZWNpZnkgYSBzdXBwbHkgZm9yIGl0Pwo+Pgo+PiDCoCAtIFRoaXMgaXMgYWN0dWFsbHkgaW5jb21w
YXRpYmxlIHdpdGggdGhlIGJpbmRpbmcuIHZyZWZfZGRyLXN1cHBseSBpc24ndCBzcGVjaWZpZWQK
Pj4gwqDCoMKgIGFzIGFuIGFsbG93ZWQgcHJvcGVydHkgKG5vdCB0byBtZW50aW9uIGEgcmVxdWly
ZWQgb25lKQo+Pgo+PiDCoCAtIElzbid0IHRoZSBrZXJuZWwgc3VwcG9zZWQgdG8gc3RheSBjb21w
YXRpYmxlIHRvIG9sZCBkZXZpY2UgdHJlZXM/Cj4+Cj4+IEkgdGhpbmsgdGhlIHN0cG1pYyBkcml2
ZXIgaXMgYXQgZmF1bHQgaGVyZSBhbmQgdGhhdCB0aGUgcmVndWxhdG9yIGZyYW1ld29yayBjaGFu
Z2UganVzdAo+PiBtYWRlIHRoYXQgYXBwYXJlbnQuCj4gCj4gSSBhZ3JlZSB1cGRhdGluZyB0aGUg
RFQgaXMgbm90IHRoZSByaWdodCBhcHByb2FjaC4KPiAKCi0tIApQZW5ndXRyb25peCBlLksuICAg
ICAgICAgICAgICAgICAgICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfApT
dGV1ZXJ3YWxkZXIgU3RyLiAyMSAgICAgICAgICAgICAgICAgICAgICAgfCBodHRwOi8vd3d3LnBl
bmd1dHJvbml4LmRlLyAgfAozMTEzNyBIaWxkZXNoZWltLCBHZXJtYW55ICAgICAgICAgICAgICAg
ICAgfCBQaG9uZTogKzQ5LTUxMjEtMjA2OTE3LTAgICAgfApBbXRzZ2VyaWNodCBIaWxkZXNoZWlt
LCBIUkEgMjY4NiAgICAgICAgICAgfCBGYXg6ICAgKzQ5LTUxMjEtMjA2OTE3LTU1NTUgfApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBt
YWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRw
czovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1z
dG0zMgo=
