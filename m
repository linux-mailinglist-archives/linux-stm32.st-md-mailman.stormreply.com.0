Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BD816391266
	for <lists+linux-stm32@lfdr.de>; Wed, 26 May 2021 10:32:47 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 839F9C5978C;
	Wed, 26 May 2021 08:32:47 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 42C59C32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 May 2021 08:32:44 +0000 (UTC)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id CE013FF80D;
 Wed, 26 May 2021 08:32:41 +0000 (UTC)
Date: Wed, 26 May 2021 10:32:40 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mark Brown <broonie@kernel.org>
Message-ID: <20210526103240.1c71002c@xps13>
In-Reply-To: <20210519191836.GH4224@sirena.org.uk>
References: <20210518162754.15940-1-patrice.chotard@foss.st.com>
 <20210519191836.GH4224@sirena.org.uk>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-spi@vger.kernel.org,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v5 0/3] MTD: spinand: Add
	spi_mem_poll_status() support
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

SGkgTWFyaywKCk1hcmsgQnJvd24gPGJyb29uaWVAa2VybmVsLm9yZz4gd3JvdGUgb24gV2VkLCAx
OSBNYXkgMjAyMSAyMDoxODozNgorMDEwMDoKCj4gT24gVHVlLCBNYXkgMTgsIDIwMjEgYXQgMDY6
Mjc6NTFQTSArMDIwMCwgcGF0cmljZS5jaG90YXJkQGZvc3Muc3QuY29tIHdyb3RlOgo+ID4gRnJv
bTogUGF0cmljZSBDaG90YXJkIDxwYXRyaWNlLmNob3RhcmRAZm9zcy5zdC5jb20+Cj4gPiAKPiA+
IFRoaXMgc2VyaWVzIGFkZHMgc3VwcG9ydCBmb3IgdGhlIHNwaV9tZW1fcG9sbF9zdGF0dXMoKSBz
cGluYW5kCj4gPiBpbnRlcmZhY2UuCj4gPiBTb21lIFFTUEkgY29udHJvbGxlcnMgYWxsb3dzIHRv
IHBvbGwgYXV0b21hdGljYWxseSBtZW1vcnkgCj4gPiBzdGF0dXMgZHVyaW5nIG9wZXJhdGlvbnMg
KGVyYXNlLCByZWFkIG9yIHdyaXRlKS4gVGhpcyBhbGxvd3MgdG8gCj4gPiBvZmZsb2FkIHRoZSBD
UFUgZm9yIHRoaXMgdGFzay4KPiA+IFNUTTMyIFFTUEkgaXMgc3VwcG9ydGluZyB0aGlzIGZlYXR1
cmUsIGRyaXZlciB1cGRhdGUgYXJlIGFsc28KPiA+IHBhcnQgb2YgdGhpcyBzZXJpZXMuICAKPiAK
PiBUaGUgU1BJIGJpdHMgbG9vayBnb29kIHRvIG1lIC0gc2hvdWxkIHdlIG1lcmdlIHZpYSBNVEQg
b3IgU1BJPwoKSSBkb24ndCBleHBlY3QgYW55IGNvbmZsaWN0cyB3aXRoIHRoZSBjdXJyZW50IGNo
YW5nZXMgaW4gTVRELCBJIGp1c3QKYWNrZWQgdGhlIFNQSS1OQU5EIHBhdGNoLCB5b3UgbWF5IHRh
a2UgaXQgdGhyb3VnaCBTUEkuCgpUaGFua3MsCk1pcXXDqGwKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4
LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
