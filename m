Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E249C4A29
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Nov 2024 00:56:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B4958C78F70;
	Mon, 11 Nov 2024 23:56:25 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 345C5C78F6F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Nov 2024 23:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
 Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
 In-Reply-To:References; bh=MryA6VSFHDjqh8alDU5GvEoeFh8bEKlu6n8pBlDOixU=; b=18
 7e04cMD7Z6QrrTg8toFh4D4cJnnXj5/Duuel/TavF8d8UyiuBwfX9S/n/VPqDqHCVEQ1RUcYHOGH2
 HICcGyvhEjZkeWQmLorWtfibJl7rwymr9lg1nA6gvYXURvv6wM4sxm3c22IFsN1r+jF2U6zE2jMsO
 DX47zHvKjCsteA0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1tAeGJ-00Cwe9-3K; Tue, 12 Nov 2024 00:56:03 +0100
Date: Tue, 12 Nov 2024 00:56:03 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Vitalii Mordan <mordan@ispras.ru>
Message-ID: <eea9bb16-305f-45bd-af5d-b14b715a9027@lunn.ch>
References: <20241111130047.3679099-1-mordan@ispras.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241111130047.3679099-1-mordan@ispras.ru>
Cc: linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org,
 netdev@vger.kernel.org, Fedor Pchelkin <pchelkin@ispras.ru>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Vadim Mutilin <mutilin@ispras.ru>,
 Alexey Khoroshilov <khoroshilov@ispras.ru>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2] stmmac: dwmac-intel-plat:
 remove redundant dwmac->data check in probe
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

T24gTW9uLCBOb3YgMTEsIDIwMjQgYXQgMDQ6MDA6NDdQTSArMDMwMCwgVml0YWxpaSBNb3JkYW4g
d3JvdGU6Cj4gVGhlIGRyaXZlcuKAmXMgY29tcGF0aWJpbGl0eSB3aXRoIGRldmljZXMgaXMgY29u
ZmlybWVkIGVhcmxpZXIgaW4KPiBwbGF0Zm9ybV9tYXRjaCgpLiBTaW5jZSByZWFjaGluZyBwcm9i
ZSBtZWFucyB0aGUgZGV2aWNlIGlzIHZhbGlkLAo+IHRoZSBleHRyYSBjaGVjayBjYW4gYmUgcmVt
b3ZlZCB0byBzaW1wbGlmeSB0aGUgY29kZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBWaXRhbGlpIE1v
cmRhbiA8bW9yZGFuQGlzcHJhcy5ydT4KClJldmlld2VkLWJ5OiBBbmRyZXcgTHVubiA8YW5kcmV3
QGx1bm4uY2g+CgogICAgQW5kcmV3Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
