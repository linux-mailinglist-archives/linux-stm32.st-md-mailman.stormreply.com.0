Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B86D12A641D
	for <lists+linux-stm32@lfdr.de>; Wed,  4 Nov 2020 13:19:47 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7F119C36B36;
	Wed,  4 Nov 2020 12:19:47 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 757AAC36B25
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Nov 2020 12:19:42 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <a.fatoum@pengutronix.de>)
 id 1kaHlN-0005Eo-Tp; Wed, 04 Nov 2020 13:19:42 +0100
To: Marek Vasut <marex@denx.de>, linux-arm-kernel@lists.infradead.org
References: <20201103181137.443586-1-marex@denx.de>
 <3803c9f1-3a4a-6316-a8c8-9d543ae1fe89@pengutronix.de>
 <24d6fe1f-c43a-fcb9-cfdf-5da0475fb6f6@denx.de>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Message-ID: <e4d1ec6e-a5a3-c90d-d6dd-fc37f7c645f1@pengutronix.de>
Date: Wed, 4 Nov 2020 13:19:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <24d6fe1f-c43a-fcb9-cfdf-5da0475fb6f6@denx.de>
Content-Language: en-US
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: Add DHCOM based PicoITX
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

SGVsbG8sCgpPbiAxMS80LzIwIDE6MTggUE0sIE1hcmVrIFZhc3V0IHdyb3RlOgo+IE9uIDExLzQv
MjAgMTE6NTMgQU0sIEFobWFkIEZhdG91bSB3cm90ZToKPj4gSGVsbG8gTWFyZWssCj4gCj4gSGks
Cj4gCj4gWy4uLl0KPiAKPj4+ICsjaW5jbHVkZSAic3RtMzJtcDE1Ny5kdHNpIgo+Pj4gKyNpbmNs
dWRlICJzdG0zMm1wMTV4Yy5kdHNpIgo+Pj4gKyNpbmNsdWRlICJzdG0zMm1wMTV4eC1kaGNvbS1z
b20uZHRzaSIKPj4+ICsjaW5jbHVkZSAic3RtMzJtcDE1eHgtZGhjb20tcGljb2l0eC5kdHNpIgo+
Pj4gKwo+Pj4gKy8gewo+Pj4gK8KgwqDCoCBtb2RlbCA9ICJESCBlbGVjdHJvbmljcyBTVE0zMk1Q
MTU3QyBESENPTSBQaWNvSVRYIjsKPj4+ICvCoMKgwqAgY29tcGF0aWJsZSA9ICJkaCxzdG0zMm1w
MTU3Yy1kaGNvbS1waWNvaXR4IiwgImRoLHN0bTMybXAxNTdjLWRoY29tLXNvbSIsCj4+PiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgICJzdCxzdG0zMm1wMTU3IjsKPj4KPj4gSXMgdGhlcmUgYSBz
ZXBhcmF0ZSBkdC1iaW5kaW5ncyBwYXRjaCBkb2N1bWVudGluZyB0aGVzZSBuZXcgY29tcGF0aWJs
ZXM/Cj4gCj4gV2hpY2ggb25lcyA/IFRoZSBkaCBpcyBpbiB2ZW5kb3ItcHJlZml4ZXMueWFtbCAu
CgpEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL3N0bTMyL3N0bTMyLnlhbWwK
ClNob3VsZCBsaXN0IHRoZSBib2FyZCBjb21wYXRpYmxlcyBpbiB1c2UsIG90aGVyd2lzZSBkdF9i
aW5kaW5nX2NoZWNrIGNvbXBsYWlucy4KCj4gCj4gWy4uLl0KPiAKCi0tIApQZW5ndXRyb25peCBl
LksuICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgfApTdGV1ZXJ3YWxkZXIgU3RyLiAyMSAgICAgICAgICAgICAgICAgICAgICAgfCBodHRwOi8v
d3d3LnBlbmd1dHJvbml4LmRlLyAgfAozMTEzNyBIaWxkZXNoZWltLCBHZXJtYW55ICAgICAgICAg
ICAgICAgICAgfCBQaG9uZTogKzQ5LTUxMjEtMjA2OTE3LTAgICAgfApBbXRzZ2VyaWNodCBIaWxk
ZXNoZWltLCBIUkEgMjY4NiAgICAgICAgICAgfCBGYXg6ICAgKzQ5LTUxMjEtMjA2OTE3LTU1NTUg
fApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1z
dG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9s
aW51eC1zdG0zMgo=
