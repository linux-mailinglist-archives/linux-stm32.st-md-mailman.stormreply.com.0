Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C2EB06277
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Jul 2025 17:11:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C37D1C349C0;
	Tue, 15 Jul 2025 15:11:04 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EB1DAC36B3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Jul 2025 15:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
 Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
 In-Reply-To:References; bh=lxm0BMHsTQDJY5VVN8bBo0QKdZrScIjjqvDsm2mUM54=; b=Z9
 PvVpBz0hEgqOXkhF+yiuI1ocj439iMwU8DxWZ9XrTewgSy5HO2xkaijOlzjAby3u1qCkJ8mFWjjtw
 RtRLfC35IZRqkUmdqv2HIrJJ4JNVKSJ63XEG2ftONaG6Oo9UWQA8P+mpUeir5lFjLuxN8hXZfCNVe
 xN9DOodvCcwAbsY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1ubhIx-001bDi-8L; Tue, 15 Jul 2025 17:10:51 +0200
Date: Tue, 15 Jul 2025 17:10:51 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "G Thomas, Rohan" <rohan.g.thomas@altera.com>
Message-ID: <2154c04a-b9ad-4382-95c9-1e3d7d342c9b@lunn.ch>
References: <20250714-xgmac-minor-fixes-v1-0-c34092a88a72@altera.com>
 <20250714-xgmac-minor-fixes-v1-2-c34092a88a72@altera.com>
 <b192c96a-2989-4bdf-ba4f-8b7bcfd09cfa@lunn.ch>
 <e903cb0f-3970-4ad2-a0a2-ee58551779dc@altera.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e903cb0f-3970-4ad2-a0a2-ee58551779dc@altera.com>
Cc: linux-kernel@vger.kernel.org, Romain Gantois <romain.gantois@bootlin.com>,
 netdev@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Matthew Gerlach <matthew.gerlach@altera.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 2/3] net: stmmac: xgmac: Correct
 supported speed modes
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

PiBBcyBwZXIgdGhlIFhHTUFDIGRhdGFib29rIHZlciAzLjEwYSwgR01JSVNFTCBiaXQgb2YgTUFD
X0hXX0ZlYXR1cmVfMAo+IHJlZ2lzdGVyIGluZGljYXRlcyB3aGV0aGVyIHRoZSBYR01BQyBJUCBv
biB0aGUgU09DIGlzIHN5bnRoZXNpemVkIHdpdGgKPiBEV0NYR19HTUlJX1NVUFBPUlQuIFNwZWNp
ZmljYWxseSwgaXQgc3RhdGVzOgo+ICIxMDAwLzEwMC8xMCBNYnBzIFN1cHBvcnQuIFRoaXMgYml0
IGlzIHNldCB0byAxIHdoZW4gdGhlIEdNSUkgSW50ZXJmYWNlCj4gb3B0aW9uIGlzIHNlbGVjdGVk
LiIKPiAKPiBTbyB5ZXMsIGl04oCZcyBsaWtlbHkgdGhhdCBTZXJnZSB3YXMgd29ya2luZyB3aXRo
IGEgU0VSREVTIGludGVyZmFjZSB3aGljaAo+IGRvZXNuJ3Qgc3VwcG9ydCAxMC8xMDBNYnBzIHNw
ZWVkcy4gRG8geW91IHRoaW5rIGl0IHdvdWxkIGJlIGFwcHJvcHJpYXRlCj4gdG8gYWRkIGEgY2hl
Y2sgZm9yIHRoaXMgYml0IGJlZm9yZSBlbmFibGluZyAxMC8xMDBNYnBzIHNwZWVkcz8KClllcy4K
ClRoYXQgaXMgdGhlIHByb2JsZW0gd2l0aCBzdHVmZiB5b3UgY2FuIHN5bnRoZXNpemVyLiBZb3Ug
aGF2ZSBubyBpZGVhCndoYXQgaXQgYWN0dWFsbHkgaXMgdW5sZXNzIHlvdSByZWFkIGFsbCB0aGUg
c2VsZiBlbnVtZXJhdGluZwpyZWdpc3RlcnMuIEZsZXhpYmlsaXR5IGF0IHRoZSBjb3N0IG9mIGNv
bXBsZXhpdHkuCgoJQW5kcmV3Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
