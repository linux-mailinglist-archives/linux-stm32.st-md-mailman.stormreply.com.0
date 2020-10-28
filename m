Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CA35029D159
	for <lists+linux-stm32@lfdr.de>; Wed, 28 Oct 2020 18:38:49 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 579A5C3FAD5;
	Wed, 28 Oct 2020 17:38:49 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EC551C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Oct 2020 17:38:47 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <a.fatoum@pengutronix.de>)
 id 1kXpPK-0005zh-W9; Wed, 28 Oct 2020 18:38:47 +0100
To: Alexandre Torgue <alexandre.torgue@st.com>, Arnd Bergmann
 <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 Kevin Hilman <khilman@baylibre.com>, SoC Team <soc@kernel.org>,
 arm-soc <arm@kernel.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Marcin Sloniewski <marcin.sloniewski@gmail.com>, Marek Vasut
 <marex@denx.de>, Pengutronix Kernel Team <kernel@pengutronix.de>
References: <4ac236b3-b980-f653-f644-53e586570724@st.com>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Message-ID: <4bb5d090-df39-8d58-808f-1fe33c54de14@pengutronix.de>
Date: Wed, 28 Oct 2020 18:38:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <4ac236b3-b980-f653-f644-53e586570724@st.com>
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

SGVsbG8gQWxleCwKCk9uIDEwLzI4LzIwIDQ6MjggUE0sIEFsZXhhbmRyZSBUb3JndWUgd3JvdGU6
Cj4gSGkgQXJuZCwgT2xvZiBhbmQgS2V2aW4sCj4gCj4gT24gdjUuMTAtcmMxIFNUTTMyIGJvYXJk
cyBjYW5ub3QgYm9vdC4gSXQgaXMgbGlua2VkIHRvIGEgY2hhbmdlIGluIHJlZ3VsYXRvciBmcmFt
ZXdvcmsgd2hpY2ggaGlnaGxpZ2h0cyB0aGF0IG91ciBzdXBwbGllcyBhcmUgbm90IHdlbGwgZGVz
Y3JpYmVkLiBUaGlzIFBSIGZpeGVzIGl0IGZvciBTVE0zMiBib2FyZHMgdGhhdCBJIGhhdmUgb24g
bXkgZGVzazogRUQxIGFuZCBES3guCgpXaGljaCBjaGFuZ2UgdHJpZ2dlcmVkIHRoZSByZWdyZXNz
aW9uPwogCj4gSSBhc3N1bWUgdGhhdCBzYW1lIHBhdGNoIGhhcyB0byBiZSBkb25lIGZvciBvdGhl
ciBTVE0zMiBib2FyZHMsIGJ1dCBhcyBJIGRvbid0IGhhdmUgc2NoZW1hdGljcyBJIGNhbid0IHBy
b3ZpZGUgaXQuIFNvIGEgcm91bmQyIGhhcyB0byBiZSBkb25lIGZvcjoKPiAtIHN0aW5nZXI5Ngo+
IC0gTUMtMQo+IC0gT2R5c3NleSBTT00KPiAtIERIQ09SIC9ESENPTQo+IAo+IE1hbmksIE1hcmVr
LCBBaG1hZCwgTWFyY2luIGNhbiB5b3UgcGxlYXNlIGhhdmUgYSBsb29rIG9uIGl0IGFuZCBwcm92
aWRlIHBhdGNoZXMgKHRoZW4gSSdsbCBwcm92aWRlIHJvdW5kMikuIFRoYW5rcyBpbiBhZHZhbmNl
LgoKWW91ciBjaGFuZ2UgZG9lc24ndCBsb29rIHJpZ2h0LiBJZiBJIHNldCB2cmVmX2Rkci1zdXBw
bHkgdG8gYSBmaXhlZCByZWd1bGF0b3IsCnRoZSBNQy0xIG5vdyBib290cyBhZ2FpbiBhcyB3ZWxs
LCBidXQgdGhhdCBzZWVtcyB0byBqdXN0IG1hc2sgdGhlIHJlYWwgaXNzdWU6CgogLSB2cmVmX2Rk
ciBpcyBhbiBfb3V0cHV0XyBvZiB0aGUgUE1JQywgd2h5IHNob3VsZCBvbmUgaGF2ZSB0byBzcGVj
aWZ5IGEgc3VwcGx5IGZvciBpdD8KCiAtIFRoaXMgaXMgYWN0dWFsbHkgaW5jb21wYXRpYmxlIHdp
dGggdGhlIGJpbmRpbmcuIHZyZWZfZGRyLXN1cHBseSBpc24ndCBzcGVjaWZpZWQKICAgYXMgYW4g
YWxsb3dlZCBwcm9wZXJ0eSAobm90IHRvIG1lbnRpb24gYSByZXF1aXJlZCBvbmUpCgogLSBJc24n
dCB0aGUga2VybmVsIHN1cHBvc2VkIHRvIHN0YXkgY29tcGF0aWJsZSB0byBvbGQgZGV2aWNlIHRy
ZWVzPwoKSSB0aGluayB0aGUgc3RwbWljIGRyaXZlciBpcyBhdCBmYXVsdCBoZXJlIGFuZCB0aGF0
IHRoZSByZWd1bGF0b3IgZnJhbWV3b3JrIGNoYW5nZSBqdXN0Cm1hZGUgdGhhdCBhcHBhcmVudC4K
CkNoZWVycywKQWhtYWQKCj4gCj4gCj4gUmVnYXJkcwo+IEFsZXgKPiAKPiAKPiBUaGUgZm9sbG93
aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IDM2NTBiMjI4ZjgzYWRkYTdlNWVlNTMyZTJiOTA0Mjlj
MDNmN2I5ZWM6Cj4gCj4gwqAgTGludXggNS4xMC1yYzEgKDIwMjAtMTAtMjUgMTU6MTQ6MTEgLTA3
MDApCj4gCj4gYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6Cj4gCj4gwqAg
Z2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2F0b3JndWUvc3Rt
MzIuZ2l0IHRhZ3Mvc3RtMzItZHQtZm9yLXY1LjEwLWZpeGVzLTEKPiAKPiBmb3IgeW91IHRvIGZl
dGNoIGNoYW5nZXMgdXAgdG8gNzI4YTdlMjI1YWQ4MDdiNGI0ZGUzYmUzZmI2NTM0MjQxOTlmOGE3
NjoKPiAKPiDCoCBBUk06IGR0czogc3RtMzI6IERlc2NyaWJlIFZpbiBwb3dlciBzdXBwbHkgb24g
c3RtMzJtcDE1N2MtZWR4IGJvYXJkICgyMDIwLTEwLTI4IDE1OjA4OjI0ICswMTAwKQo+IAo+IC0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0KPiBTVE0zMiBEVCBmaXhlcyBmb3IgdjUuMTAsIHJvdW5kIDEKPiAKPiBIaWdobGlnaHRz
Ogo+IC0tLS0tLS0tLS0tCj4gCj4gwqAtT24gU1RNMzJNUDE1NyBESyAmIEVEIGJvYXJkczogQWRk
IFZpbiBzdXBwbHkgZGVzY3JpcHRpb24gdG8gYXZvaWQKPiDCoCByYW5kb20ga2VybmVsIGNyYXNo
IGR1ZSB0byB2cmVmX2RkciByZWd1bGF0b3IgaXNzdWUuCj4gCj4gLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+IFBhc2NhbCBQ
YWlsbGV0ICgyKToKPiDCoMKgwqDCoMKgIEFSTTogZHRzOiBzdG0zMjogRGVzY3JpYmUgVmluIHBv
d2VyIHN1cHBseSBvbiBzdG0zMm1wMTV4eC1ka3ggYm9hcmQKPiDCoMKgwqDCoMKgIEFSTTogZHRz
OiBzdG0zMjogRGVzY3JpYmUgVmluIHBvd2VyIHN1cHBseSBvbiBzdG0zMm1wMTU3Yy1lZHggYm9h
cmQKPiAKPiDCoGFyY2gvYXJtL2Jvb3QvZHRzL3N0bTMybXAxNTdjLWVkMS5kdHPCoCB8IDE1ICsr
KysrKysrKysrKysrKwo+IMKgYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJtcDE1eHgtZGt4LmR0c2kg
fCAxNyArKysrKysrKysrKysrKysrKwo+IMKgMiBmaWxlcyBjaGFuZ2VkLCAzMiBpbnNlcnRpb25z
KCspCj4gCgotLSAKUGVuZ3V0cm9uaXggZS5LLiAgICAgICAgICAgICAgICAgICAgICAgICAgIHwg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwKU3RldWVyd2FsZGVyIFN0ci4gMjEgICAgICAg
ICAgICAgICAgICAgICAgIHwgaHR0cDovL3d3dy5wZW5ndXRyb25peC5kZS8gIHwKMzExMzcgSGls
ZGVzaGVpbSwgR2VybWFueSAgICAgICAgICAgICAgICAgIHwgUGhvbmU6ICs0OS01MTIxLTIwNjkx
Ny0wICAgIHwKQW10c2dlcmljaHQgSGlsZGVzaGVpbSwgSFJBIDI2ODYgICAgICAgICAgIHwgRmF4
OiAgICs0OS01MTIxLTIwNjkxNy01NTU1IHwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
