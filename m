Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9111E5B581
	for <lists+linux-stm32@lfdr.de>; Mon,  1 Jul 2019 09:11:35 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 433EAD12B81
	for <lists+linux-stm32@lfdr.de>; Mon,  1 Jul 2019 07:11:35 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 587C8D12B7D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  1 Jul 2019 07:11:34 +0000 (UTC)
Received: from xps13 (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 8BDFD240009;
 Mon,  1 Jul 2019 07:11:29 +0000 (UTC)
Date: Mon, 1 Jul 2019 09:11:28 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christophe Kerello <christophe.kerello@st.com>
Message-ID: <20190701091128.4e67f1de@xps13>
In-Reply-To: <1561128189-14411-1-git-send-email-christophe.kerello@st.com>
References: <1561128189-14411-1-git-send-email-christophe.kerello@st.com>
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
LmNvbT4gd3JvdGUgb24gRnJpLCAyMSBKdW4KMjAxOSAxNjo0MzowOSArMDIwMDoKCj4gVGhpcyBw
YXRjaCBzb2x2ZXMgd2FybmluZ3MgZGV0ZWN0ZWQgYnkgc2V0dGluZyBXPTEgd2hlbiBidWlsZGlu
Zy4KPiAKPiBXYXJuaW5ncyB0eXBlIGRldGVjdGVkOgo+IGRyaXZlcnMvbXRkL25hbmQvcmF3L3N0
bTMyX2ZtYzJfbmFuZC5jOiBJbiBmdW5jdGlvbiDigJhzdG0zMl9mbWMyX2NhbGNfdGltaW5nc+KA
mToKPiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9zdG0zMl9mbWMyX25hbmQuYzoxNDE3OjIzOiB3YXJu
aW5nOiBjb21wYXJpc29uIGlzCj4gYWx3YXlzIGZhbHNlIGR1ZSB0byBsaW1pdGVkIHJhbmdlIG9m
IGRhdGEgdHlwZSBbLVd0eXBlLWxpbWl0c10KPiAgIGVsc2UgaWYgKHRpbXMtPnR3YWl0ID4gRk1D
Ml9QTUVNX1BBVFRfVElNSU5HX01BU0spCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoZSBL
ZXJlbGxvIDxjaHJpc3RvcGhlLmtlcmVsbG9Ac3QuY29tPgo+IC0tLQoKQXBwbGllZCB0byBuYW5k
L25leHQsIHRoYW5rcy4KCk1pcXXDqGwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
