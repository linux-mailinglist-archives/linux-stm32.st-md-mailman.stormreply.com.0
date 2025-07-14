Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE31B03CC8
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Jul 2025 13:02:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2692EC3F92E;
	Mon, 14 Jul 2025 11:02:16 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4B713C3F92D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Jul 2025 11:02:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id D0819A56FC7;
 Mon, 14 Jul 2025 11:02:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 691D4C4CEED;
 Mon, 14 Jul 2025 11:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752490932;
 bh=nPxink05T5UZYe3FMijXbIpttjgyGk6c2hQX0HSdz2E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=f3R5uK4sIyPd3KoHIFWgzDtMaGRUupHCjSrUaE74omqUFb3docOSmYQBSycv8G5EG
 fKSE7Bq8rm/1fLWNp1oHKc4+eSyHVm6TsrwZ4LSxPNtLcjtl3FaCu6PzAF5mwEfVcm
 21GzmF4/pm5Rx72n4eUJZ1Y4Z3d7T8s1CI1jHMyP5juQhYGxmDDmyoMNi9FmlzKJK2
 pdL0MBQqfNmMCd1n5t6+LwrQgN75JzTWdbrP00m1LZZK7Hu77j4vwpuPnTR5cX3OOc
 lpHgQN9i1tUVWQHSLYKoq9gApIrF/jU+IawGxwc59hNUI/rwChj+kH1X8feDAtQv1z
 aviBLuPeo76mg==
Date: Mon, 14 Jul 2025 12:02:06 +0100
From: Simon Horman <horms@kernel.org>
To: Markus =?utf-8?Q?Bl=C3=B6chl?= <markus@blochl.de>
Message-ID: <20250714110206.GI721198@horms.kernel.org>
References: <20250713-stmmac_crossts-v1-1-31bfe051b5cb@blochl.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250713-stmmac_crossts-v1-1-31bfe051b5cb@blochl.de>
Cc: linux-kernel@vger.kernel.org,
 Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>,
 markus.bloechl@ipetronik.com, netdev@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, John Stultz <jstultz@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: intel: populate entire
 system_counterval_t in get_time_fn() callback
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

T24gU3VuLCBKdWwgMTMsIDIwMjUgYXQgMTA6MjE6NDFQTSArMDIwMCwgTWFya3VzIEJsw7ZjaGwg
d3JvdGU6Cj4gZ2V0X3RpbWVfZm4oKSBjYWxsYmFjayBpbXBsZW1lbnRhdGlvbnMgYXJlIGV4cGVj
dGVkIHRvIGZpbGwgb3V0IHRoZQo+IGVudGlyZSBzeXN0ZW1fY291bnRlcnZhbF90IHN0cnVjdCBh
cyBpdCBtYXkgYmUgaW5pdGlhbGx5IHVuaW5pdGlhbGl6ZWQuCj4gCj4gVGhpcyBicm9rZSB3aXRo
IHRoZSByZW1vdmFsIG9mIGNvbnZlcnRfYXJ0X3RvX3RzYygpIGhlbHBlciBmdW5jdGlvbnMKPiB3
aGljaCBsZWZ0IHVzZV9uc2VjcyB1bmluaXRpYWxpemVkLgo+IAo+IEluaXRpYWxseSBhc3NpZ24g
dGhlIGVudGlyZSBzdHJ1Y3Qgd2l0aCBkZWZhdWx0IHZhbHVlcy4KPiAKPiBGaXhlczogZjVlMWQw
ZGIzZjAyICgic3RtbWFjOiBpbnRlbDogUmVtb3ZlIGNvbnZlcnRfYXJ0X3RvX3RzYygpIikKPiBD
Yzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+IFNpZ25lZC1vZmYtYnk6IE1hcmt1cyBCbMO2Y2hs
IDxtYXJrdXNAYmxvY2hsLmRlPgoKUmV2aWV3ZWQtYnk6IFNpbW9uIEhvcm1hbiA8aG9ybXNAa2Vy
bmVsLm9yZz4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXN0bTMyCg==
