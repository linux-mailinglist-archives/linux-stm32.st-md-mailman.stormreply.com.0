Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B43716981A
	for <lists+linux-stm32@lfdr.de>; Sun, 23 Feb 2020 15:38:02 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BBAF4C36B0B;
	Sun, 23 Feb 2020 14:38:01 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3438AC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 23 Feb 2020 14:37:59 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 48QSTx58wTz1rcBT;
 Sun, 23 Feb 2020 15:37:57 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 48QSTx4R7hz1r0cR;
 Sun, 23 Feb 2020 15:37:57 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id DRg4d07ql-mS; Sun, 23 Feb 2020 15:37:56 +0100 (CET)
X-Auth-Info: qbc25jYxOW4DR+2yuAUozJmjPr9Hme7XPCIo3LNOuy0=
Received: from [IPv6:::1] (unknown [195.140.253.167])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Sun, 23 Feb 2020 15:37:56 +0100 (CET)
To: Alexandre Torgue <alexandre.torgue@st.com>,
 linux-arm-kernel@lists.infradead.org
References: <20200119191143.50033-1-marex@denx.de>
 <20200119191143.50033-6-marex@denx.de>
 <1b288811-8ffb-a150-71ef-4c006e6d5740@st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <1ec643e9-217d-c83d-793f-c05d6c4502bd@denx.de>
Date: Sun, 23 Feb 2020 15:37:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <1b288811-8ffb-a150-71ef-4c006e6d5740@st.com>
Content-Language: en-US
Cc: Patrick Delaunay <patrick.delaunay@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH V2 6/6] ARM: dts: stm32: Add DH
 Electronics DHCOM STM32MP1 SoM and PDK2 board
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

T24gMi8xMC8yMCA1OjM1IFBNLCBBbGV4YW5kcmUgVG9yZ3VlIHdyb3RlOgo+IEhpIE1hcmVrCgpI
aSwKCj4gT24gMS8xOS8yMCA4OjExIFBNLCBNYXJlayBWYXN1dCB3cm90ZToKPj4gQWRkIHN1cHBv
cnQgZm9yIERIIEVsZWN0cm9uaWNzIERIQ09NIFNvTSBhbmQgUERLMiByZXYuIDQwMCBjYXJyaWVy
Cj4+IGJvYXJkLiBUaGlzIGlzIGFuIFNvTSB3aXRoIFNUTTMyTVAxNTdDIGFuZCBhbiBldmFsdWF0
aW9uIGtpdC4gVGhlCj4+IGJhc2Vib2FyZCBwcm92aWRlcyBFdGhlcm5ldCwgVUFSVCwgVVNCLCBD
QU4gYW5kIG9wdGlvbmFsIGRpc3BsYXkuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IE1hcmVrIFZhc3V0
IDxtYXJleEBkZW54LmRlPgo+PiBDYzogQWxleGFuZHJlIFRvcmd1ZSA8YWxleGFuZHJlLnRvcmd1
ZUBzdC5jb20+Cj4+IENjOiBNYXhpbWUgQ29xdWVsaW4gPG1jb3F1ZWxpbi5zdG0zMkBnbWFpbC5j
b20+Cj4+IENjOiBQYXRyaWNlIENob3RhcmQgPHBhdHJpY2UuY2hvdGFyZEBzdC5jb20+Cj4+IENj
OiBQYXRyaWNrIERlbGF1bmF5IDxwYXRyaWNrLmRlbGF1bmF5QHN0LmNvbT4KPj4gQ2M6IGxpbnV4
LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KPj4gVG86IGxpbnV4LWFybS1rZXJu
ZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwo+PiAtLS0KPj4gVjI6IC0gQWRkIHN0bTMybXAxIGludG8g
dGhlIHN1YmplY3QgYW5kIGNvbW1pdCBtZXNzYWdlCj4+IMKgwqDCoMKgIC0gU29ydCBEVCBhbHBo
YW51bWVyaWNhbGx5Cj4+IMKgwqDCoMKgIC0gTW92ZSBhbGwgcGluY29udHJvbCBlbnRyaWVzIGlu
dG8gc3RtMzJtcDE1LXBpbmN0cmwuZHRzaQo+PiAtLS0KPiAKPiBUaGFua3MgdG8gYWRkIGEgbmV3
IFNUTTMyIGJvYXJkLgo+IAo+IFNlcmllcyBhcHBsaWVkIG9uIHN0bTMyLW5leHQuCgpIb3cgY29t
ZSB0aGVzZSBhcmUgbm90IGluIG5leHQvbWFzdGVyIHlldCwgaXMgdGhlIGJyYW5jaCBub3QgYmVp
bmcKbWVyZ2VkIGludG8gbmV4dCByZWd1bGFybHkgPwpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3Rt
MzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
