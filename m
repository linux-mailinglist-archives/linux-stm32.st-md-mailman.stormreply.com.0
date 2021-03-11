Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C42337320
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Mar 2021 13:54:52 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9D3C3C5718B;
	Thu, 11 Mar 2021 12:54:52 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 60C8FC32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Mar 2021 12:54:51 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <a.fatoum@pengutronix.de>)
 id 1lKKq2-0005KZ-KO; Thu, 11 Mar 2021 13:54:50 +0100
To: dillon min <dillon.minfei@gmail.com>,
 Alexandre TORGUE <alexandre.torgue@foss.st.com>
References: <1614758717-18223-1-git-send-email-dillon.minfei@gmail.com>
 <1614758717-18223-6-git-send-email-dillon.minfei@gmail.com>
 <b5f96460-dcdf-f40a-89d7-89def5669d7b@foss.st.com>
 <CAL9mu0+YFC97OBNLH-gip+MFKfdX4rAaxsFB4rMNrgjmhc5=Rw@mail.gmail.com>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Message-ID: <d2549995-2b46-3f9a-e3d5-0e2bc21465d7@pengutronix.de>
Date: Thu, 11 Mar 2021 13:54:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAL9mu0+YFC97OBNLH-gip+MFKfdX4rAaxsFB4rMNrgjmhc5=Rw@mail.gmail.com>
Content-Language: en-US
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Vladimir Murzin <vladimir.murzin@arm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux@armlinux.org.uk, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, afzal.mohd.ma@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 5/8] ARM: dts: stm32: introduce
 stm32h7-pinctrl.dtsi to support stm32h75x
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

SGVsbG8gRGlsbG9uLAoKT24gMTEuMDMuMjEgMTM6MjMsIGRpbGxvbiBtaW4gd3JvdGU6Cj4gRm9y
IHN0bTMyaDcncyBuZXcgYm9hcmQgc3VwcG9ydCAsIEkgZ3Vlc3MgZm9sbG93aW5nIHRoZSBzdG0z
MmY3L3N0bTMyZjQncyBzdHlsZQo+IGlzIGEgcmVhc29uYWJsZSB3YXkgdG8gZG8gaXQsIGJ1dCBh
ZGQgYSBsaXR0bGUgb3B0aW1pemF0aW9u44CCCj4gd2hpY2ggbWVhbnMgOgo+IG9sZCBzdHJ1Y3R1
cmUKPiBzdG0zMmg3LXBpbmN0cmwuZHRzaSAtLT4gc3RtMzJoNzQzLXBpbmN0cmwuZHRzaSAgKHJl
ZmVyZW5jZWQgYnkKPiBzdG0zMmg3NDNpLWRpc2NvLCAtZXZhbCkKPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHwtLT4gc3RtMzJoNzUwLXBpbmN0cmwuZHRzaQo+IChyZWZlcmVuY2Vk
IGJ5IHN0bTMyaDc1MGktYXJ0LXBpLCBldGMpCj4gYWRkIGFydC1waSBvdGhlciBib2FyZCdzIHBp
biBkZWZpbml0aW9uIGluIHN0bTMyaDc1MC1waW5jdHJsLmR0c2kgd2l0aAo+IHh4eF9waW5zX2Es
IHh4eF9waW5zX2IKPiB4eHhfcGluc19hIHVzZWQgZm9yIGFydC1waSwgeHh4X3BpbnNfYiB1c2Vk
IGZvciBvdGhlciBib2FyZHMuCj4gCj4gYWZ0ZXIgbW9yZSBib2FyZHMgYWRkIGluIHN1cHBvcnQs
IHRoZXJlIHdpbGwgYmUgbW9yZSB4eHhfcGluX2MsIC4uLi4gZGVmaW5lZAo+IAo+IGFzIHRoZSBw
aW4gbWFwIGlzIGFjY29yZGluZyB0byB0aGUgaGFyZHdhcmUgc2NoZW1hdGljIGRpYWdyYW0gaW8g
Y29ubmVjdGlvbi4KPiBzbywgd2h5IG5vdCBtb3ZlIHh4eF9waW5feCB0byBhIGJvYXJkIHNwZWNp
ZmljIHBsYWNlLiBzdWNoIGFzCj4gc3RtMzJoNzUwaS1hcnQtcGkuZHRzCj4gCj4gbmV3IHN0cnVj
dHVyZToKPiAxLCByZW5hbWUgc3RtMzJoNzQzLXBpbmN0cmwuZHRzaSB0byBzdG0zMmg3LXBpbmN0
cmwuZHRzaSAob25seQo+IHByZXNlcnZlIGdwaW9hLi4uaywpCj4gMiwgbW92ZSB4eHhfcGluc194
IGZyb20gc3RtMzJoNy1waW5jdHJsLmR0c2kgdG8KPiBzdG0zMmg3eHgtZGlzY28vZXZhbC9hcnQt
cGkvZXRjLmR0cyAoYXMgdGhleSBkZXBlbmRzIG9uIGhhcmR3YXJlCj4gc2NoZW1hdGljKQo+IAo+
IHN0bTMyaDctcGluY3RybC5kdHNpIC0tPiBzdG0zMmg3NDNpLWRpc2Nvbi5kdHMKPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHwtLT4gc3RtMzJoNzQzaS1ldmFsLmR0cwo+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgfC0tPiBzdG0zMmg3NTBpLWFydC1waS5kdHMKPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwtLT4gc3RtMzJoN3h4eC5kdHMKPiB3b3Vs
ZCB5b3UgYWdyZWUgdGhpcyA/CgpJZiB0aGUgb3B0aW1pemF0aW9uIHlvdSBpbnRlbmQgaXMgcmVk
dWNpbmcgRFRCIHNpemUsIHlvdSBjYW4gZmxhZwphbGwgcGluY3RybCBncm91cHMgd2l0aCAvb21p
dC1pZi1uby1yZWYvIHRvIGhhdmUgZHRjIHRocm93IHRoZW0KYXdheSBpZiB0aGV5IGFyZSB1bnVz
ZWQuCgooQnV0IGluIGdlbmVyYWwsIEkgYW0gaW4gZmF2b3Igb2YgaGF2aW5nIGJvYXJkLXNwZWNp
ZmljIGNvbmZpZ3VyYXRpb24KIGluIHRoZSBib2FyZCBkdHMpCgpDaGVlcnMsCkFobWFkCgotLSAK
UGVuZ3V0cm9uaXggZS5LLiAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHwKU3RldWVyd2FsZGVyIFN0ci4gMjEgICAgICAgICAgICAgICAgICAg
ICAgIHwgaHR0cDovL3d3dy5wZW5ndXRyb25peC5kZS8gIHwKMzExMzcgSGlsZGVzaGVpbSwgR2Vy
bWFueSAgICAgICAgICAgICAgICAgIHwgUGhvbmU6ICs0OS01MTIxLTIwNjkxNy0wICAgIHwKQW10
c2dlcmljaHQgSGlsZGVzaGVpbSwgSFJBIDI2ODYgICAgICAgICAgIHwgRmF4OiAgICs0OS01MTIx
LTIwNjkxNy01NTU1IHwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxt
YW4vbGlzdGluZm8vbGludXgtc3RtMzIK
