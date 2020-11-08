Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8352AADCC
	for <lists+linux-stm32@lfdr.de>; Sun,  8 Nov 2020 23:20:30 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C8A27C3FAE2;
	Sun,  8 Nov 2020 22:20:29 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 16317C36B35
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  8 Nov 2020 22:20:29 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4CTpV43dqqz1rt44;
 Sun,  8 Nov 2020 23:20:28 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4CTpV43Jkhz1qy5Z;
 Sun,  8 Nov 2020 23:20:28 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id Dd8k6ie4iOBA; Sun,  8 Nov 2020 23:20:27 +0100 (CET)
X-Auth-Info: FQ8nXpx2eKJsc7kaukslN05zHPDULcOTDQ+yXzmlZbA=
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Sun,  8 Nov 2020 23:20:26 +0100 (CET)
To: Ahmad Fatoum <a.fatoum@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
References: <20201103181137.443586-1-marex@denx.de>
 <3803c9f1-3a4a-6316-a8c8-9d543ae1fe89@pengutronix.de>
 <24d6fe1f-c43a-fcb9-cfdf-5da0475fb6f6@denx.de>
 <e4d1ec6e-a5a3-c90d-d6dd-fc37f7c645f1@pengutronix.de>
From: Marek Vasut <marex@denx.de>
Message-ID: <bd39bd53-28e0-8b71-1307-ae178cb62081@denx.de>
Date: Sun, 8 Nov 2020 23:19:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <e4d1ec6e-a5a3-c90d-d6dd-fc37f7c645f1@pengutronix.de>
Content-Language: en-US
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gMTEvNC8yMCAxOjE5IFBNLCBBaG1hZCBGYXRvdW0gd3JvdGU6Cj4gSGVsbG8sCgpIaSwKCj4g
T24gMTEvNC8yMCAxOjE4IFBNLCBNYXJlayBWYXN1dCB3cm90ZToKPj4gT24gMTEvNC8yMCAxMTo1
MyBBTSwgQWhtYWQgRmF0b3VtIHdyb3RlOgo+Pj4gSGVsbG8gTWFyZWssCj4+Cj4+IEhpLAo+Pgo+
PiBbLi4uXQo+Pgo+Pj4+ICsjaW5jbHVkZSAic3RtMzJtcDE1Ny5kdHNpIgo+Pj4+ICsjaW5jbHVk
ZSAic3RtMzJtcDE1eGMuZHRzaSIKPj4+PiArI2luY2x1ZGUgInN0bTMybXAxNXh4LWRoY29tLXNv
bS5kdHNpIgo+Pj4+ICsjaW5jbHVkZSAic3RtMzJtcDE1eHgtZGhjb20tcGljb2l0eC5kdHNpIgo+
Pj4+ICsKPj4+PiArLyB7Cj4+Pj4gK8KgwqDCoCBtb2RlbCA9ICJESCBlbGVjdHJvbmljcyBTVE0z
Mk1QMTU3QyBESENPTSBQaWNvSVRYIjsKPj4+PiArwqDCoMKgIGNvbXBhdGlibGUgPSAiZGgsc3Rt
MzJtcDE1N2MtZGhjb20tcGljb2l0eCIsICJkaCxzdG0zMm1wMTU3Yy1kaGNvbS1zb20iLAo+Pj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgInN0LHN0bTMybXAxNTciOwo+Pj4KPj4+IElzIHRo
ZXJlIGEgc2VwYXJhdGUgZHQtYmluZGluZ3MgcGF0Y2ggZG9jdW1lbnRpbmcgdGhlc2UgbmV3IGNv
bXBhdGlibGVzPwo+Pgo+PiBXaGljaCBvbmVzID8gVGhlIGRoIGlzIGluIHZlbmRvci1wcmVmaXhl
cy55YW1sIC4KPiAKPiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL3N0bTMy
L3N0bTMyLnlhbWwKPiAKPiBTaG91bGQgbGlzdCB0aGUgYm9hcmQgY29tcGF0aWJsZXMgaW4gdXNl
LCBvdGhlcndpc2UgZHRfYmluZGluZ19jaGVjayBjb21wbGFpbnMuCgpJIGhvcGUgdGhpcyBbMV0g
c2hvdWxkIGZpeCB0aGF0IHdpdGhvdXQgY29sbGlkaW5nIHdpdGggWzJdLgoKWzFdIApodHRwczov
L3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtYXJtLWtlcm5lbC9wYXRjaC8yMDIw
MTEwODIyMTQzOC4zMTA0MDYtMS1tYXJleEBkZW54LmRlLwpbMl0gCmh0dHBzOi8vcGF0Y2h3b3Jr
Lmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1hcm0ta2VybmVsL3BhdGNoLzIwMjAxMTA0MTEzOTMy
LjMwNzAyLTEtYS5mYXRvdW1AcGVuZ3V0cm9uaXguZGUvCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1z
dG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
