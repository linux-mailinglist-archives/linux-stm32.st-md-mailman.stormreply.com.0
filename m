Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E23AF17587E
	for <lists+linux-stm32@lfdr.de>; Mon,  2 Mar 2020 11:35:33 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AA818C36B0B;
	Mon,  2 Mar 2020 10:35:33 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 13CBCC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Mar 2020 10:35:32 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <a.fatoum@pengutronix.de>)
 id 1j8iQ3-0006CW-My; Mon, 02 Mar 2020 11:35:27 +0100
To: Alexandre Torgue <alexandre.torgue@st.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
References: <20200226143826.1146-1-a.fatoum@pengutronix.de>
 <20200226143826.1146-2-a.fatoum@pengutronix.de>
 <244a4502-03e0-836c-2ce2-7fa6cef3c188@st.com>
 <fbba971d7501c774ce0081f22dcff4ef74002a4d.camel@pengutronix.de>
 <e227de9a-7440-7e1f-2928-5648cbbe44c1@st.com>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Message-ID: <a9a7c18b-c8a2-f566-b8a0-198551f60827@pengutronix.de>
Date: Mon, 2 Mar 2020 11:35:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <e227de9a-7440-7e1f-2928-5648cbbe44c1@st.com>
Content-Language: en-US
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: devicetree@vger.kernel.org, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 2/3] ARM: dts: stm32: add STM32MP1-based
 Linux Automation MC-1 board
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

SGksCgpPbiAzLzIvMjAgMTE6MjkgQU0sIEFsZXhhbmRyZSBUb3JndWUgd3JvdGU6Cj4gT24gMy8y
LzIwIDExOjE4IEFNLCBMdWNhcyBTdGFjaCB3cm90ZToKPj4gT24gTW8sIDIwMjAtMDMtMDIgYXQg
MTE6MDYgKzAxMDAsIEFsZXhhbmRyZSBUb3JndWUgd3JvdGU6Cj4+Pj4gKwo+Pj4+ICsmZ3B1IHsK
Pj4+PiArwqDCoMKgIHN0YXR1cyA9ICJva2F5IjsKPj4+PiArfTsKPj4KPj4gVGhpcyBxdWVzdGlv
biBpcyBtb3JlIHRvIHRoZSBTVCBndXlzIHRoYW4gdGhpcyBzcGVjaWZpYyBEVDogV2h5IGlzIHRo
ZQo+PiBHUFUgbWFya2VkIGFzIGRpc2FibGVkIGluIHRoZSBTb0MgZHRzaSBmaWxlPyBUaGlzIGRl
dmljZSBpcyBhbHdheXMKPj4gcHJlc2VudCBvbiB0aGUgU29DIGFuZCBBRkFJQ1MgdGhlcmUgYXJl
IG5vIGJvYXJkIGxldmVsIGRlcGVuZGVuY2llcywgc28KPj4gdGhlcmUgaXMgbm8gcmVhc29uIHRv
IGhhdmUgaXQgZGlzYWJsZWQgYnkgZGVmYXVsdCwgcmlnaHQ/IFJlbW92aW5nIHRoZQo+PiBzdGF0
dXMgcHJvcGVydHkgZnJvbSB0aGUgZHRzaSB3b3VsZCByZW1vdmUgdGhlIG5lZWQgZm9yIHRoaXMg
b3ZlcnJpZGUKPj4gb24gdGhlIGJvYXJkIERULgo+IAo+IFlvdSBhcmUgcmlnaHQuIFdpdGggbmV3
IHN0bTMyIGRldmljZSB0cmVlIGRpdmVyc2l0eSwgaXQgbWFrZXMgbm8gbG9uZ2VyIHNlbnMgdG8g
ZGlzYWJsZSBHUFUgbm9kZSBpbiBzdG0zMm1wMTU3IGR0c2kgZmlsZS4gSW5kZWVkLCB3ZSB1c2Ug
bm93IGRlZGljYXRlZCBmaWxlcyBmb3IgZWFjaCBTb0MgKHN0bTMybXAxNTEgLyBzdG0zMm1wMTUz
IC9zdG0zMm1wMTU3KS4KPiAKPiBBaG1hZCwgY2FuIHlvdSBhZGQgdGhpcyBtb2RpZmljYXRpb24g
aW4geW91ciBzZXJpZXMgcGxlYXNlID8KCldpbGwgcHJlcHJlbmQgaXQgdG8gdjIuCgpDaGVlcnMs
CkFobWFkCgotLSAKUGVuZ3V0cm9uaXggZS5LLiAgICAgICAgICAgICAgICAgICAgICAgICAgIHwg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwKU3RldWVyd2FsZGVyIFN0ci4gMjEgICAgICAg
ICAgICAgICAgICAgICAgIHwgaHR0cDovL3d3dy5wZW5ndXRyb25peC5kZS8gIHwKMzExMzcgSGls
ZGVzaGVpbSwgR2VybWFueSAgICAgICAgICAgICAgICAgIHwgUGhvbmU6ICs0OS01MTIxLTIwNjkx
Ny0wICAgIHwKQW10c2dlcmljaHQgSGlsZGVzaGVpbSwgSFJBIDI2ODYgICAgICAgICAgIHwgRmF4
OiAgICs0OS01MTIxLTIwNjkxNy01NTU1IHwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
