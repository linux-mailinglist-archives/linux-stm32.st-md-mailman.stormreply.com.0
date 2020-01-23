Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 898D31465ED
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Jan 2020 11:44:09 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3FFDCC36B0C;
	Thu, 23 Jan 2020 10:44:09 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 85434C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Jan 2020 10:44:06 +0000 (UTC)
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EE65124125;
 Thu, 23 Jan 2020 10:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579776245;
 bh=m4u2YDQG2/L2dB0BvcFaUw0MzYEvAvAvZWF+DtGDh9Q=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=zxbn1JXTdGSJSpwe2vLF5wOX/zG00r5C/ZtqdD4OLkydFLFyptoYPz7i02XQYGxYd
 yD100QX8eX7094oCfh9vllw9ghLDMY0uJkFo9i/OOZu1mibvQ569p+7oMK+KyXqtBk
 y8y+2V4ySFwTZfGyZLqWExj2bNvgj2irVSWC6xp0=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <maz@kernel.org>)
 id 1iuZxz-000vRH-6i; Thu, 23 Jan 2020 10:44:03 +0000
MIME-Version: 1.0
Date: Thu, 23 Jan 2020 10:44:03 +0000
From: Marc Zyngier <maz@kernel.org>
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
In-Reply-To: <20200123101225.nscpc5t4nmlarbw2@pengutronix.de>
References: <20bb72d0-8258-abc0-e729-4d3d5a75c41c@denx.de>
 <d6e02817-2464-51b9-246a-7720b607b8d6@st.com>
 <65a1c5b2-c1b9-322f-338c-e6ff6379d8d1@denx.de>
 <129d04a0-c846-506d-5726-4a1024d977a6@st.com>
 <80db762c-3b3d-f007-2f9b-dadbffd95782@denx.de>
 <360b1adc-32f1-7993-c463-e52c7a5a8a67@st.com>
 <c4f08f59acd31951527ef1d6e9409e6f@kernel.org>
 <20200123101225.nscpc5t4nmlarbw2@pengutronix.de>
Message-ID: <03fd1cb7b5985b3221f66c6b0058adc8@kernel.org>
X-Sender: maz@kernel.org
User-Agent: Roundcube Webmail/1.3.8
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: u.kleine-koenig@pengutronix.de, alexandre.torgue@st.com,
 marex@denx.de, mcoquelin.stm32@gmail.com, patrick.delaunay@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
Cc: Marek Vasut <marex@denx.de>, Patrick Delaunay <patrick.delaunay@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] STM32MP1 level triggered interrupts
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

T24gMjAyMC0wMS0yMyAxMDoxMiwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cj4gT24gVGh1LCBK
YW4gMjMsIDIwMjAgYXQgMDk6MjI6NDhBTSArMDAwMCwgTWFyYyBaeW5naWVyIHdyb3RlOgo+PiBP
biAyMDIwLTAxLTIzIDA4OjI3LCBBbGV4YW5kcmUgVG9yZ3VlIHdyb3RlOgo+PiA+IE9uIDEvMjIv
MjAgODoyOSBQTSwgTWFyZWsgVmFzdXQgd3JvdGU6Cj4+ID4gPiBPbiAxLzIyLzIwIDY6MTkgUE0s
IEFsZXhhbmRyZSBUb3JndWUgd3JvdGU6Cj4+ID4gPgo+PiA+ID4gSGksCj4+ID4gPgo+PiA+ID4g
Wy4uLl0KPj4gPiA+Cj4+ID4gPiA+ID4gPiBDb25jZXJuaW5nLCB5b3VyIHF1ZXN0aW9uOgo+PiA+
ID4gPiA+ID4KPj4gPiA+ID4gPiA+IFNldHRpbmcgeW91ciBncGlvQyBpbnRlcnJ1cHRpb24gYXMg
ImZhbGxpbmcgZWRnZSIgc2hvdWxkCj4+ID4gPiA+ID4gPiBiZSBlbm91Z2guIE9uCj4+ID4gPiA+
ID4gPiBncGlvQ3ggZmFsbGluZyBlZGdlLCBhIGhpZ2gtbGV2ZWwgc2lnbmFsIGlzIGdlbmVyYXRl
ZCBieQo+PiA+ID4gPiA+ID4gZXh0aSBhbmQgc2VudAo+PiA+ID4gPiA+ID4gdG8gR0lDICh3aGlj
aCB0cmlnZ2VycyBHSUMgaW50ZXJydXB0KS4gVGhpcyBzaWduYWwKPj4gPiA+ID4gPiA+IHJlbWFp
bnMgaGlnaCB1bnRpbAo+PiA+ID4gPiA+ID4gc3RtMzJfaXJxX2FjayBpcyBjYWxsZWQuCj4+ID4g
PiA+ID4gPgo+PiA+ID4gPiA+ID4gU28geW91IG9ubHkgbmVlZDogKGV4IGZvciBncGlvYyAxKS4K
Pj4gPiA+ID4gPiA+Cj4+ID4gPiA+ID4gPiBpbnRlcnJ1cHQtcGFyZW50ID0gPCZncGlvYz47Cj4+
ID4gPiA+ID4gPiBpbnRlcnJ1cHRzID0gPDEgSVJRX1RZUEVfRURHRV9GQUxMSU5HPjsKPj4gPiA+
ID4gPgo+PiA+ID4gPiA+IEhvdyBkb2VzIHRoaXMgZGVhbCB3aXRoIHRoZSBjYXNlIHdoZXJlIHRo
ZSBkZXZpY2UgaG9sZHMgdGhlCj4+ID4gPiA+ID4gaW50ZXJydXB0Cj4+ID4gPiA+ID4gbGluZSBs
b3cgKHNpbmNlIGl0J3MgbGV2ZWwtc2Vuc2l0aXZlLCBhY3RpdmUgbG93KSBhZnRlciB0aGUgZHJp
dmVyCj4+ID4gPiA+ID4gaW50ZXJydXB0IGhhbmRsZXIgZmluaXNoZXMgPyBEb2VzIHN1Y2ggY29u
ZGl0aW9uIGdlbmVyYXRlIGFub3RoZXIKPj4gPiA+ID4gPiBpbnRlcnJ1cHQgYW5kIGNhbGwgdGhl
IGRyaXZlciBpbnRlcnJ1cHQgaGFuZGxlciBhZ2FpbiA/IEkKPj4gPiA+ID4gPiB3b3VsZCBleHBl
Y3QKPj4gPiA+ID4gPiB0aGUgYW5zd2VyIGlzIG5vLCBiZWNhdXNlIHRoZSBpbnRlcnJ1cHQgaXMg
ZWRnZS10cmlnZ2VyZWQKPj4gPiA+ID4gPiBhbmQgdGhlcmUgaXMKPj4gPiA+ID4gPiBubyBlZGdl
Lgo+PiA+ID4gPgo+PiA+ID4gPiBZb3VyIGFzc3VtcHRpb24gaXMgZ29vZC4gSWYgeW91ciBkZXZp
Y2UgY29udGludWUgdG8gaG9sZCB0aGUKPj4gPiA+ID4gbGluZSB0byBsb3cKPj4gPiA+ID4gYXQg
dGhlIGVuZCBvZiB5b3VyIGludGVycnVwdCBoYW5kbGVyLCBubyBtb3JlIGludGVycnVwdCB3aWxs
IGJlCj4+ID4gPiA+IGdlbmVyYXRlZC4KPj4gPiA+Cj4+ID4gPiBCdXQgZG9lcyB0aGF0IGJhc2lj
YWxseSBtZWFuIHRoYXQgc3VjaCBhIGRldmljZSBjYW5ub3QgYmUgdXNlZCB3aXRoCj4+ID4gPiBT
VE0zMk1QMSBvciBhbSBJIGZ1bmRhbWVudGFsbHkgbWlzdGFrZW4gYW5kIGRvbid0IHVuZGVyc3Rh
bmQgaG93IGEKPj4gPiA+IGxldmVsLXRyaWdnZXJlZCBpbnRlcnJ1cHQgd29ya3MgPyA6KQo+PiA+
Cj4+ID4gWW91IG5lZWQgdG8gcmVsZWFzZSB0aGUgbGluZSBpbiB5b3VyIGRldmljZSBpbnRlcnJ1
cHQgaGFuZGxlci4gSWYgbm90LAo+PiA+IHllcywgeW91IHdpbGwgbWlzcyBpbnRlcnJ1cHRzIDok
Cj4+IAo+PiBTbyB0byBzdW0gaXQgdXAsIHRoaXMgU29DIGRvZXNuJ3Qgc3VwcG9ydCBleHRlcm5h
bCBsZXZlbCBpbnRlcnJ1cHRzCj4+IG9uIGl0cyBvd24sIGZ1bGwgc3RvcC4gWW91J2QgbmVlZCBz
b21lIGFkZGl0aW9uYWwgZXh0ZXJuYWwgc2FtcGxpbmcKPj4gSFcgdG8gcmV0cmlnZ2VyIGFuIGVk
Z2Ugb24gRU9JLgo+IAo+IE9yIHlvdSBuZWVkIHNvZnR3YXJlIHN1cHBvcnQgdGhhdCBtYXJrcyB0
aGUgaXJxIHBlbmRpbmcgYWdhaW4gaWYgb24KPiB1bm1hc2sgdGhlIGlycSBsaW5lIGlzIHN0aWxs
IGFjdGl2ZS4KCkFzc3VtaW5nIHlvdSBjYW4gYWN0dWFsbHkgb2JzZXJ2ZSB0aGUgc3RhdGUgb2Yg
dGhlIGxpbmUgZGlyZWN0bHksCndpdGhvdXQgaGF2aW5nIHRvIGFkZCBzcGVjaWZpYyBrbm93bGVk
Z2Ugb2YgdGhlIGdlbmVyYXRpbmcgZGV2aWNlLgoKRG9pbmcgdGhpcyBraW5kIG9mIHRyaWNrcyBp
biAyMDIwIGlzIHByZXR0eSBwb29yIGZvciBhIG1vZGVybiBTb0MuCgogICAgICAgICBNLgotLSAK
SmF6eiBpcyBub3QgZGVhZC4gSXQganVzdCBzbWVsbHMgZnVubnkuLi4KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0
CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
