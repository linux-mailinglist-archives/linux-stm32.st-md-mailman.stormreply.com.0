Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AA732A28F3E
	for <lists+linux-stm32@lfdr.de>; Wed,  5 Feb 2025 15:23:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 552B9C78F88;
	Wed,  5 Feb 2025 14:23:07 +0000 (UTC)
Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com
 [91.218.175.188])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E54F0C6C83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 Feb 2025 14:22:59 +0000 (UTC)
Message-ID: <f728a006-e588-4eab-b667-b1ff7dfd66c5@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1738765376;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zn1OZ0/xC5hWSYyFfGAzueY2AGtYBGt8AuLFCHG10t8=;
 b=eg4nZJbO0xpeG0pLWlbhMOe6AYAiwdcu4kYoQMdLWO+eZdJ3lFgi+Jpg3kpYb/i14hvLjJ
 /+NqrmVuZeacszL66SFSgoFSCyY+PoN4hFtdoc0HT7vGRqjXutkQ+JV8tyyG3jBtPypA32
 7MoUOedOYpMYKM+fZ/PdUpF9Kz9lHl0=
Date: Wed, 5 Feb 2025 22:22:00 +0800
MIME-Version: 1.0
To: Jakub Kicinski <kuba@kernel.org>,
 "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Steven Price <steven.price@arm.com>
References: <20250203093419.25804-1-steven.price@arm.com>
 <Z6CckJtOo-vMrGWy@shell.armlinux.org.uk>
 <811ea27c-c1c3-454a-b3d9-fa4cd6d57e44@arm.com>
 <Z6Clkh44QgdNJu_O@shell.armlinux.org.uk> <20250203142342.145af901@kernel.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <20250203142342.145af901@kernel.org>
X-Migadu-Flow: FLOW_OUT
Cc: Furong Xu <0x1207@gmail.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Petr Tesarik <petr@tesarici.cz>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Serge Semin <fancer.lancer@gmail.com>, linux-kernel@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Xi Ruoyao <xry111@xry111.site>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: Allow zero for
	[tr]x_fifo_size
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

CuWcqCAyLzQvMjUgMDY6MjMsIEpha3ViIEtpY2luc2tpIOWGmemBkzoKPiBPbiBNb24sIDMgRmVi
IDIwMjUgMTE6MTY6MzQgKzAwMDAgUnVzc2VsbCBLaW5nIChPcmFjbGUpIHdyb3RlOgo+Pj4gSSd2
ZSBubyBvcGluaW9uIHdoZXRoZXIgdGhlIG9yaWdpbmFsIHNlcmllcyAiaGFkIHZhbHVlIiAtIEkn
bSBqdXN0Cj4+PiB0cnlpbmcgdG8gZml4IHRoZSBicmVha2FnZSB0aGF0IGVudGFpbGVkLiBNeSBm
aXJzdCBhdHRlbXB0IGF0IGEgcGF0Y2gKPj4+IHdhcyBpbmRlZWQgYSAocGFydGlhbCkgcmV2ZXJ0
LCBidXQgQW5kcmV3IHdhcyBrZWVuIHRvIGZpbmQgYSBiZXR0ZXIKPj4+IHNvbHV0aW9uWzFdLgo+
PiBUaGVyZSBhcmUgdHdvIHdheXMgdG8gZml4IHRoZSBicmVha2FnZSAtIGVpdGhlciByZXZlcnQg
dGhlIG9yaWdpbmFsCj4+IHBhdGNoZXMgKHdoaWNoIGlmIHRoZXkgaGF2ZSBsaXR0bGUgdmFsdWUg
bm93IHdvdWxkIGJlIHRoZSBzZW5zaWJsZQo+PiBhcHByb2FjaCBJTUhPKQo+ICsxLCBJIGFsc28g
dm90ZSByZXZlcnQgRldJVwoKKzEsIHNhbWUgaGVyZS4KCgpGb3IgYSBkcml2ZXIgdGhhdCBydW5z
IG9uIHNvIG11Y2ggaGFyZHdhcmUsIHdlIG5lZWQgdG8gYWN0CgpjYXV0aW91c2x5LiBBIGNydWNp
YWwgcHJlcmVxdWlzaXRlIGlzIHRoYXQgY29kZSBjaGFuZ2VzIG11c3QKCm5ldmVyIGNhdXNlIHNv
bWUgaGFyZHdhcmUgdG8gbWFsZnVuY3Rpb24uIEkgd2FzIHRvbyBzaW1wbGlzdGljCgppbiBteSB0
aGlua2luZyB3aGVuIHJldmlld2luZyB0aGlzIGJlZm9yZSwgYW5kIEkgc2luY2VyZWx5CgphcG9s
b2dpemUgZm9yIHRoYXQuCgoKU3RldmVuLCB0aGFuayB5b3UgZm9yIHlvdXIgdGVzdHMsIExldCdz
IHJldmVydCBpdC4KCgpUaGFua3MsCgpZYW50ZW5nCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3Rt
MzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
