Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B64B4C420B
	for <lists+linux-stm32@lfdr.de>; Fri, 25 Feb 2022 11:16:52 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BE058C60491;
	Fri, 25 Feb 2022 10:16:51 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E5E2EC56630
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Feb 2022 10:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1645784200;
 bh=ZBa8/L8iW7ShngPtjDMHz5hutdlp2KMJfLYcYHlTSac=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=UjcV5q8jw4HJ1NnJHIbhv9jjKqi803bfJEJkddrABEHqPOz4g0EFxZIJrHAzPmjJN
 UxH06gb96hwDsFANb6XM/Oi5Mf5S8wmiyoOtDOBH/HsnT1/4jstuZ5qc1EOACf+DHL
 9PkfTNLmJixtRvO/oGC9d/zi2N4aRD+MwcbKY7Nk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [149.172.237.68] ([149.172.237.68]) by web-mail.gmx.net
 (3c-app-gmx-bs22.server.lan [172.19.170.74]) (via HTTP); Fri, 25 Feb 2022
 11:16:40 +0100
MIME-Version: 1.0
Message-ID: <trinity-24577b7c-5c5c-4fc6-a651-76ff5306989f-1645784200761@3c-app-gmx-bs22>
From: Lino Sanfilippo <LinoSanfilippo@gmx.de>
To: Jiri Slaby <jirislaby@kernel.org>
Date: Fri, 25 Feb 2022 11:16:40 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <8c65bc42-438e-bf3e-fb76-2a4cbc7296c0@kernel.org>
References: <20220222011433.8761-1-LinoSanfilippo@gmx.de>
 <20220222011433.8761-2-LinoSanfilippo@gmx.de>
 <e883ccb5-68ea-f802-e4fd-864672d8ad7b@kernel.org>
 <8c65bc42-438e-bf3e-fb76-2a4cbc7296c0@kernel.org>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:ibYL81/cTwwyjgrY6rom2mIBEWHvIVWZqMEWewOjnErTr05yoYf2pdsMCoBxlPwP8FVC+
 6O0fux1W2EXyDiV77vhEuhlsD/FIlQedJo77XHw3gim6Ai615yn57T2QpdtbOULuKtJBn+RJthAX
 kes/rau+Wqar/h0FsnggtMlelJHLf9RKH1ZYsP2eXAcFOCHsT68GbxNN+BR+x/vgFmvZezc+mEY8
 IEthQkDlucjv4bBNrDFCof3m0/ACsl6zh47nnu+yvVEpeUKdLdU3QST7QT12DAxrI3qQGWwRHZ15
 b0=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:E9Z82zmc+mw=:pLPhOlVyfV3AzfuammmOhk
 BUI3M06giNfHrsX9mFJDK5aSVIo88CrtOWiEsVXW4NssL51BCEMf1EyA+f8kKvo+kfZUR4pcc
 wpybd3pyPMA/QvWat4LkIT4eSAHlSPQUCqAbXEyWIG0RXYPlOUIjeL1O3tPoaVZR1cUUudFti
 YeAMWy7QzbX9avZ4Y9QgJJMLTzvyLY+kBDMC0qcjcXnEI+3DIn8vSxLFDRjIKCGXQkQZ9a+zj
 2Rvjrs/xrXLJrqrSLkYRq32aLZhWrXxhhVVPWJQmGixlIHJUktd+5RPXxkQZNhfYwJARfop6B
 a2jNVOYWC66EH/uDBvVXUyrUVRFF3Pfh9x750huymEwXTX9rTbA5bJFaZoiraghQL2aphG2PB
 6UZEzgZ3ufDxKC3otERT03K0mN67CETOZdauXv96zeeBNArMUlnNuKki4Am+bAf3XsqWe+NLp
 CliIMVwGYSuW829QUf1pui31Q/pEeGnX8KSzUQNEYuK4qwOFboURM/LisnGDEEbhISnLJ1X3+
 2vxjb6Cw6MFav0aifpatTEidFtxHqG+Ed1CAeaE9Gs6+fkcL11gld4lXYYqtd53ZYkFSb1aJ0
 OknObjOgeAUYozHPsRLWHiATex/3ItRSTzBmUlzHx2RnLDR4wSBd5hhI/Wmn2KMzt30eP982I
 3m3hu1kiwoHjjx+SR2iDiqcbpxWszTexsKPhoKVOmzLwp3GLoM1qqFCkS31Py1VAtAWcMIIvu
 f+zcgjtNJ1IH3cg8fpihwnW5W+NgXru7XsBA7SLojo9DdHOWkMcNcXJbEaeuZeBuxTZMD/JmG
 kN19HXC
Cc: linux-arm-kernel@lists.infradead.org, alexandre.belloni@bootlin.com,
 festevam@gmail.com, mcoquelin.stm32@gmail.com, linux-serial@vger.kernel.org,
 richard.genoud@gmail.com, gregkh@linuxfoundation.org, s.hauer@pengutronix.de,
 nicolas.ferre@microchip.com, linux@armlinux.org.uk,
 alexandre.torgue@foss.st.com, ludovic.desroches@microchip.com, lukas@wunner.de,
 linux-imx@nxp.com, kernel@pengutronix.de, u.kleine-koenig@pengutronix.de,
 shawnguo@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, p.rosenberger@kunbus.com
Subject: Re: [Linux-stm32] [PATCH v3 1/9] serial: core: move RS485
 configuration tasks from drivers into core
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

SGksCgoKPiBPbiAyMi4gMDIuIDIyLCA3OjUxLCBKaXJpIFNsYWJ5IHdyb3RlOgo+ID4gT24gMjIu
IDAyLiAyMiwgMjoxNCwgTGlubyBTYW5maWxpcHBvIHdyb3RlOgo+ID4+IFNldmVyYWwgZHJpdmVy
cyB0aGF0IHN1cHBvcnQgc2V0dGluZyB0aGUgUlM0ODUgY29uZmlndXJhdGlvbiB2aWEgCj4gPj4g
dXNlcnNwYWNlCj4gPj4gaW1wbGVtZW50IG9uZSBvciBtb3JlIG9mIHRoZSBmb2xsb3dpbmcgdGFz
a3M6Cj4gPj4KPiA+PiAtIGluIGNhc2Ugb2YgYW4gaW52YWxpZCBSVFMgY29uZmlndXJhdGlvbiAo
Ym90aCBSVFMgYWZ0ZXIgc2VuZCBhbmQgUlRTIG9uCj4gPj4gwqDCoCBzZW5kIHNldCBvciBib3Ro
IHVuc2V0KSBmYWxsIGJhY2sgdG8gZW5hYmxlIFJUUyBvbiBzZW5kIGFuZCBkaXNhYmxlIAo+ID4+
IFJUUwo+ID4+IMKgwqAgYWZ0ZXIgc2VuZAo+ID4+Cj4gPj4gLSBudWxsaWZ5IHRoZSBwYWRkaW5n
IGZpZWxkIG9mIHRoZSByZXR1cm5lZCBzZXJpYWxfcnM0ODUgc3RydWN0Cj4gPj4KPiA+PiAtIGNv
cHkgdGhlIGNvbmZpZ3VyYXRpb24gaW50byB0aGUgdWFydCBwb3J0IHN0cnVjdAo+ID4+Cj4gPj4g
LSBsaW1pdCBSVFMgZGVsYXlzIHRvIDEwMCBtcwo+ID4+Cj4gPj4gTW92ZSB0aGVzZSB0YXNrcyBp
bnRvIHRoZSBzZXJpYWwgY29yZSB0byBtYWtlIHRoZW0gZ2VuZXJpYyBhbmQgdG8gcHJvdmlkZQo+
ID4+IGEgY29uc2lzdGVudCBiZWhhdmlvdXIgYW1vbmcgYWxsIGRyaXZlcnMuCj4gPj4KPiA+PiBT
aWduZWQtb2ZmLWJ5OiBMaW5vIFNhbmZpbGlwcG8gPExpbm9TYW5maWxpcHBvQGdteC5kZT4KPiA+
PiAtLS0KPiA+PiDCoCBkcml2ZXJzL3R0eS9zZXJpYWwvc2VyaWFsX2NvcmUuYyB8IDI5ICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysrCj4gPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDI5IGluc2Vy
dGlvbnMoKykKPiA+Pgo+ID4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3R0eS9zZXJpYWwvc2VyaWFs
X2NvcmUuYyAKPiA+PiBiL2RyaXZlcnMvdHR5L3NlcmlhbC9zZXJpYWxfY29yZS5jCj4gPj4gaW5k
ZXggODQ2MTkyYTdiNGJmLi4yYjNhZmUwMzhjMWMgMTAwNjQ0Cj4gPj4gLS0tIGEvZHJpdmVycy90
dHkvc2VyaWFsL3NlcmlhbF9jb3JlLmMKPiA+PiArKysgYi9kcml2ZXJzL3R0eS9zZXJpYWwvc2Vy
aWFsX2NvcmUuYwo+ID4+IEBAIC00Miw2ICs0MiwxMSBAQCBzdGF0aWMgc3RydWN0IGxvY2tfY2xh
c3Nfa2V5IHBvcnRfbG9ja19rZXk7Cj4gPj4gwqAgI2RlZmluZSBISUdIX0JJVFNfT0ZGU0VUwqDC
oMKgICgoc2l6ZW9mKGxvbmcpLXNpemVvZihpbnQpKSo4KQo+ID4+ICsvKgo+ID4+ICsgKiBNYXgg
dGltZSB3aXRoIGFjdGl2ZSBSVFMgYmVmb3JlL2FmdGVyIGRhdGEgaXMgc2VudC4KPiA+PiArICov
Cj4gPj4gKyNkZWZpbmUgUlM0ODVfTUFYX1JUU19ERUxBWcKgwqDCoCAxMDAgLyogbXNlY3MgKi8K
PiA+PiArCj4gPj4gwqAgc3RhdGljIHZvaWQgdWFydF9jaGFuZ2Vfc3BlZWQoc3RydWN0IHR0eV9z
dHJ1Y3QgKnR0eSwgc3RydWN0IAo+ID4+IHVhcnRfc3RhdGUgKnN0YXRlLAo+ID4+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3Qga3Rlcm1pb3MgKm9sZF90
ZXJtaW9zKTsKPiA+PiDCoCBzdGF0aWMgdm9pZCB1YXJ0X3dhaXRfdW50aWxfc2VudChzdHJ1Y3Qg
dHR5X3N0cnVjdCAqdHR5LCBpbnQgdGltZW91dCk7Cj4gPj4gQEAgLTEyODIsOCArMTI4NywzMiBA
QCBzdGF0aWMgaW50IHVhcnRfc2V0X3JzNDg1X2NvbmZpZyhzdHJ1Y3QgCj4gPj4gdWFydF9wb3J0
ICpwb3J0LAo+ID4+IMKgwqDCoMKgwqAgaWYgKGNvcHlfZnJvbV91c2VyKCZyczQ4NSwgcnM0ODVf
dXNlciwgc2l6ZW9mKCpyczQ4NV91c2VyKSkpCj4gPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVy
biAtRUZBVUxUOwo+ID4+ICvCoMKgwqAgLyogcGljayBzYW5lIHNldHRpbmdzIGlmIHRoZSB1c2Vy
IGhhc24ndCAqLwo+ID4+ICvCoMKgwqAgaWYgKCEocnM0ODUuZmxhZ3MgJiBTRVJfUlM0ODVfUlRT
X09OX1NFTkQpID09Cj4gPj4gK8KgwqDCoMKgwqDCoMKgICEocnM0ODUuZmxhZ3MgJiBTRVJfUlM0
ODVfUlRTX0FGVEVSX1NFTkQpKSB7Cj4gPj4gK8KgwqDCoMKgwqDCoMKgIHByX3dhcm4oImludmFs
aWQgUlRTIHNldHRpbmcsIHVzaW5nIFJUU19PTl9TRU5EIGluc3RlYWRcbiIpOwo+ID4gCj4gPiBD
YW4ndCB3ZSBoYXZlIGEgZGV2aWNlIHByZWZpeCBoZXJlLCBzbyB0aGF0IGV2ZXJ5b25lIGtub3dz
IHdoYXQgZGV2aWNlIAo+ID4gaXMgYWZmZWN0ZWQ/IFdpdGhvdXQgdGhhdCwgaXQncyBub3QgdGhh
dCB1c2VmdWwuIEF0IGxlYXN0IHBvcnQtPm5hbWUgJiAKPiA+IHBvcnQtPmxpbmUgY291bGQgYmUg
cHJpbnRlZC4gVGhlIHVhcnQgY29yZSB1c2VzIGRldl8qIHByaW50cywgYnV0IHByaW50cyAKPiA+
IGFsc28gbGluZSBhcyB1cG9ydC0+ZGV2IGNhbiBiZSBOVUxMIHNvbWV0aW1lcy4KPiAKPiBBbmQg
dGhpcyBjb21lcyBmcm9tIHVzZXJzcGFjZSwgc28gc2hvdWxkIGJlIHJhdGVsaW1pdGVkLgo+IAoK
UmlnaHQsIHJhdGVsaW1pdGluZyBtYWtlcyBzZW5zZSBoZXJlLiBJIHdpbGwgY2hhbmdlIGl0IGFz
IHN1Z2dlc3RlZCBpbiB0aGUgbmV4dCBwYXRjaCB2ZXJzaW9uLgpUaGFua3MgYSBsb3QgZm9yIHRo
ZSByZXZpZXcuCgpSZWdhcmRzLApMaW5vCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
