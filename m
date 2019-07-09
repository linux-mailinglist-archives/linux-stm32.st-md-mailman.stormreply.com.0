Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2624163281
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Jul 2019 09:59:39 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D28B2C7AB2C
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Jul 2019 07:59:38 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E5D13C7AB2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Jul 2019 07:59:37 +0000 (UTC)
X-Originating-IP: 86.250.200.211
Received: from xps13 (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id C60EC20002;
 Tue,  9 Jul 2019 07:59:25 +0000 (UTC)
Date: Tue, 9 Jul 2019 09:59:25 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christophe Kerello <christophe.kerello@st.com>
Message-ID: <20190709095925.7accd6f4@xps13>
In-Reply-To: <13d30ef8-b649-6416-3814-35a53c5c09ce@st.com>
References: <1561128189-14411-1-git-send-email-christophe.kerello@st.com>
 <20190701091128.4e67f1de@xps13>
 <13d30ef8-b649-6416-3814-35a53c5c09ce@st.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: vigneshr@ti.com, bbrezillon@kernel.org, richard@nod.at,
 linux-kernel@vger.kernel.org, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] mtd: rawnand: stm32_fmc2: avoid warnings
 when building with W=1 option
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

SGkgQ2hyaXN0b3BoZSwKCkNocmlzdG9waGUgS2VyZWxsbyA8Y2hyaXN0b3BoZS5rZXJlbGxvQHN0
LmNvbT4gd3JvdGUgb24gVHVlLCA5IEp1bCAyMDE5CjA5OjUwOjEwICswMjAwOgoKPiBPbiA3LzEv
MTkgOToxMSBBTSwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiA+IEhpIENocmlzdG9waGUsCj4gPiAK
PiA+IENocmlzdG9waGUgS2VyZWxsbyA8Y2hyaXN0b3BoZS5rZXJlbGxvQHN0LmNvbT4gd3JvdGUg
b24gRnJpLCAyMSBKdW4KPiA+IDIwMTkgMTY6NDM6MDkgKzAyMDA6Cj4gPiAgIAo+ID4+IFRoaXMg
cGF0Y2ggc29sdmVzIHdhcm5pbmdzIGRldGVjdGVkIGJ5IHNldHRpbmcgVz0xIHdoZW4gYnVpbGRp
bmcuCj4gPj4KPiA+PiBXYXJuaW5ncyB0eXBlIGRldGVjdGVkOgo+ID4+IGRyaXZlcnMvbXRkL25h
bmQvcmF3L3N0bTMyX2ZtYzJfbmFuZC5jOiBJbiBmdW5jdGlvbiDigJhzdG0zMl9mbWMyX2NhbGNf
dGltaW5nc+KAmToKPiA+PiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9zdG0zMl9mbWMyX25hbmQuYzox
NDE3OjIzOiB3YXJuaW5nOiBjb21wYXJpc29uIGlzCj4gPj4gYWx3YXlzIGZhbHNlIGR1ZSB0byBs
aW1pdGVkIHJhbmdlIG9mIGRhdGEgdHlwZSBbLVd0eXBlLWxpbWl0c10KPiA+PiAgICBlbHNlIGlm
ICh0aW1zLT50d2FpdCA+IEZNQzJfUE1FTV9QQVRUX1RJTUlOR19NQVNLKQo+ID4+Cj4gPj4gU2ln
bmVkLW9mZi1ieTogQ2hyaXN0b3BoZSBLZXJlbGxvIDxjaHJpc3RvcGhlLmtlcmVsbG9Ac3QuY29t
Pgo+ID4+IC0tLSAgCj4gPiAKPiA+IEFwcGxpZWQgdG8gbmFuZC9uZXh0LCB0aGFua3MuICAKPiAK
PiBIaSBNaXF1ZWwsCj4gCj4gQWZ0ZXIgZmV0Y2hpbmcgbmFuZC9uZXh0LCBJIGRvIG5vdCBzZWUg
dGhpcyBwYXRjaCBhcHBsaWVkLgo+IAoKTm90IHN1cmUgd2hhdCBoYXBwZW5lZCwgcGxlYXNlIHJl
c2VuZCB3aXRoIGEgRml4ZXMvc3RhYmxlIHRhZyBhZGRlZCwKSSdsbCBhcHBseSB3aGVuIC1yYzEg
d2lsbCBiZSBvdXQuCgpTb3JyeSBhZ2FpbiBmb3IgdGhlIHRyb3VibGUsIHRoYW5rcyBmb3IgdGhl
IG5vdGljZSEKTWlxdcOobApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFp
bG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
