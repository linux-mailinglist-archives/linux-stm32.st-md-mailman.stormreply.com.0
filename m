Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E2A2A6423
	for <lists+linux-stm32@lfdr.de>; Wed,  4 Nov 2020 13:20:49 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 934BEC36B36;
	Wed,  4 Nov 2020 12:20:49 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1B261C36B25
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Nov 2020 12:20:48 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <a.fatoum@pengutronix.de>)
 id 1kaHmR-0005RF-JG; Wed, 04 Nov 2020 13:20:47 +0100
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
To: Marek Vasut <marex@denx.de>, linux-arm-kernel@lists.infradead.org
References: <20201103181137.443586-1-marex@denx.de>
 <3803c9f1-3a4a-6316-a8c8-9d543ae1fe89@pengutronix.de>
 <24d6fe1f-c43a-fcb9-cfdf-5da0475fb6f6@denx.de>
 <e4d1ec6e-a5a3-c90d-d6dd-fc37f7c645f1@pengutronix.de>
Message-ID: <d3ad3da0-384f-51d7-e0fd-fff933e5d1f5@pengutronix.de>
Date: Wed, 4 Nov 2020 13:20:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <e4d1ec6e-a5a3-c90d-d6dd-fc37f7c645f1@pengutronix.de>
Content-Language: en-US
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: Patrick Delaunay <patrick.delaunay@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
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

CgpPbiAxMS80LzIwIDE6MTkgUE0sIEFobWFkIEZhdG91bSB3cm90ZToKPj4+PiArI2luY2x1ZGUg
InN0bTMybXAxNTcuZHRzaSIKPj4+PiArI2luY2x1ZGUgInN0bTMybXAxNXhjLmR0c2kiCj4+Pj4g
KyNpbmNsdWRlICJzdG0zMm1wMTV4eC1kaGNvbS1zb20uZHRzaSIKPj4+PiArI2luY2x1ZGUgInN0
bTMybXAxNXh4LWRoY29tLXBpY29pdHguZHRzaSIKPj4+PiArCj4+Pj4gKy8gewo+Pj4+ICvCoMKg
wqAgbW9kZWwgPSAiREggZWxlY3Ryb25pY3MgU1RNMzJNUDE1N0MgREhDT00gUGljb0lUWCI7Cj4+
Pj4gK8KgwqDCoCBjb21wYXRpYmxlID0gImRoLHN0bTMybXAxNTdjLWRoY29tLXBpY29pdHgiLCAi
ZGgsc3RtMzJtcDE1N2MtZGhjb20tc29tIiwKPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
ICJzdCxzdG0zMm1wMTU3IjsKPj4+Cj4+PiBJcyB0aGVyZSBhIHNlcGFyYXRlIGR0LWJpbmRpbmdz
IHBhdGNoIGRvY3VtZW50aW5nIHRoZXNlIG5ldyBjb21wYXRpYmxlcz8KPj4KPj4gV2hpY2ggb25l
cyA/IFRoZSBkaCBpcyBpbiB2ZW5kb3ItcHJlZml4ZXMueWFtbCAuCj4gCj4gRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9zdG0zMi9zdG0zMi55YW1sCj4gCj4gU2hvdWxkIGxp
c3QgdGhlIGJvYXJkIGNvbXBhdGlibGVzIGluIHVzZSwgb3RoZXJ3aXNlIGR0X2JpbmRpbmdfY2hl
Y2sgY29tcGxhaW5zLgoKcy9kdF9iaW5kaW5nX2NoZWNrL2R0YnNfY2hlY2svCgotLSAKUGVuZ3V0
cm9uaXggZS5LLiAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwKU3RldWVyd2FsZGVyIFN0ci4gMjEgICAgICAgICAgICAgICAgICAgICAgIHwg
aHR0cDovL3d3dy5wZW5ndXRyb25peC5kZS8gIHwKMzExMzcgSGlsZGVzaGVpbSwgR2VybWFueSAg
ICAgICAgICAgICAgICAgIHwgUGhvbmU6ICs0OS01MTIxLTIwNjkxNy0wICAgIHwKQW10c2dlcmlj
aHQgSGlsZGVzaGVpbSwgSFJBIDI2ODYgICAgICAgICAgIHwgRmF4OiAgICs0OS01MTIxLTIwNjkx
Ny01NTU1IHwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlz
dGluZm8vbGludXgtc3RtMzIK
