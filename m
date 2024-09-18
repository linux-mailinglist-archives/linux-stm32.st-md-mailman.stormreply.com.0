Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 148F697B913
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Sep 2024 10:16:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C0585C6DD72;
	Wed, 18 Sep 2024 08:16:46 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6F531C6DD6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Sep 2024 08:16:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 513A05C5943;
 Wed, 18 Sep 2024 08:16:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A98DC4CECD;
 Wed, 18 Sep 2024 08:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1726647397;
 bh=HdC/s+4IDjIyq0DJlaC1jI1NNqleZp92TjfIk8thLgk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CJ7wgWuCdli6NO899TLGIii0tOyLCbzPyhf88B/gff0HapjU4Crv3882V7Bhg73ps
 ZEVB0kwsZxfp8MihZoZQqI9FcPPgAJy09zkQb0z4SjXltwtwtqflzL9S5ugKCCAlyH
 w0CTMUE+X6R+eRKbBG40h1aFkkWU07CoR3XW6v/xnuz9HwxJMtQ3G7gY1ihJIt8gf3
 RTTkUH3gQOS3tV/1/M2cfb/6lT+F2Dqqbt2nLCMjkiCArVTc5m1tJBgoiKn07WarBK
 D4Bvkak/vMtytGbRw1MctObRW02jUoGOeHtOUs2udG1C/CU4TL+Fl2zr1fAVxSQpxY
 gFvNILaJCcVYg==
Date: Wed, 18 Sep 2024 09:16:32 +0100
From: Simon Horman <horms@kernel.org>
To: Shenwei Wang <shenwei.wang@nxp.com>
Message-ID: <20240918081632.GU167971@kernel.org>
References: <20240917164206.414714-1-shenwei.wang@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240917164206.414714-1-shenwei.wang@nxp.com>
Cc: imx@lists.linux.dev, Chuah Kim Tatt <kim.tatt.chuah@intel.com>,
 Wong Vee Khee <vee.khee.wong@intel.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, linux-imx@nxp.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Ong Boon Leong <boon.leong.ong@intel.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: dwmac4: extend timeout
 for VLAN Tag register busy bit check
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

T24gVHVlLCBTZXAgMTcsIDIwMjQgYXQgMTE6NDI6MDZBTSAtMDUwMCwgU2hlbndlaSBXYW5nIHdy
b3RlOgo+IEluY3JlYXNlIHRoZSB0aW1lb3V0IGZvciBjaGVja2luZyB0aGUgYnVzeSBiaXQgb2Yg
dGhlIFZMQU4gVGFnIHJlZ2lzdGVyCj4gZnJvbSAxMMK1cyB0byA1MDBtcy4gVGhpcyBjaGFuZ2Ug
aXMgbmVjZXNzYXJ5IHRvIGFjY29tbW9kYXRlIHNjZW5hcmlvcwo+IHdoZXJlIEVuZXJneSBFZmZp
Y2llbnQgRXRoZXJuZXQgKEVFRSkgaXMgZW5hYmxlZC4KPiAKPiBPdmVybmlnaHQgdGVzdGluZyBy
ZXZlYWxlZCB0aGF0IHdoZW4gRUVFIGlzIGFjdGl2ZSwgdGhlIGJ1c3kgYml0IGNhbgo+IHJlbWFp
biBzZXQgZm9yIHVwIHRvIGFwcHJveGltYXRlbHkgMzAwbXMuIFRoZSBuZXcgNTAwbXMgdGltZW91
dCBwcm92aWRlcwo+IGEgc2FmZXR5IG1hcmdpbi4KPiAKPiBUaGlzIG1vZGlmaWNhdGlvbiBkb2Vz
IG5vdCBpbXBhY3Qgbm9ybWFsIHN1Y2Nlc3MgcGF0aCwgYXMgdGhlIGZ1bmN0aW9uCj4gdHlwaWNh
bGx5IHJldHVybnMgd2l0aGluIDHCtXMgaW4gbm9uLUVFRSBzY2VuYXJpb3MuIFRoZSBleHRlbmRl
ZCB0aW1lb3V0Cj4gb25seSBhZmZlY3RzIHRoZSBmYWlsdXJlIHBhdGguCj4gCj4gRml4ZXM6IGVk
NjQ2MzliYzFlMCAoIm5ldDogc3RtbWFjOiBBZGQgc3VwcG9ydCBmb3IgVkxBTiBSeCBmaWx0ZXJp
bmciKQo+IFNpZ25lZC1vZmYtYnk6IFNoZW53ZWkgV2FuZyA8c2hlbndlaS53YW5nQG54cC5jb20+
CgpIaSBTaGVud2VpIFdhbmcsCgpJdCBsb29rcyBsaWtlIHRoaXMgZnVuY3Rpb24gbm93IHVzZXMg
dWRlbGF5KCkgdG8gYnVzeS13YWl0IGZvciB1cCB0byA1MDBtcy4KQnV0IDUwMG1zLCBvciBpbmRl
ZWQgMzAwbXMsIHNlZW1zIGxpa2UgYSBsb25nIHRpbWUgdG8gdGllIGRvd24gYSBjb3JlLiAgSQp3
b25kZXIgaWYgc29tZSBvdGhlciBzb3J0IG9mIG1lY2hhbmlzbSwgZi5lLiBpbnZvbHZpbmcgbXNs
ZWVwIG9yIGRlbGF5ZWQKd29yaywgc2hvdWxkIGJlIGNvbnNpZGVyZWQuCgouLi4KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGlu
ZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9z
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
