Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6539905EE
	for <lists+linux-stm32@lfdr.de>; Fri,  4 Oct 2024 16:24:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 04C4AC7802B;
	Fri,  4 Oct 2024 14:24:07 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8E933C78028
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Oct 2024 14:23:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 3E246A44A4F;
 Fri,  4 Oct 2024 14:23:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EA08C4CEC6;
 Fri,  4 Oct 2024 14:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728051838;
 bh=XlcQ35UDL4Ddq3O7GDIWM1FWw0FdIbvAByQr3gyc5YQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=EW5tXoz/DI26Mb4DC6u+NEA1D5nJPnJnxF6+HUeQ9K0vfPfcsM5L1PwlCt7RTWXId
 8FZAsjYKIIG3FQ6T2f56dQ4lMsrKcbA6EM0lZW5NEaHYxQkaqVckP2D6H0oNly5pDH
 tPgaYC71CTZicKhci8PS+pYOEwVPmhfNLipOtKvlRKyB6OcomxMwGNhMQuiEoFQ7K/
 BWbJMmMhi+BO/Jfv/imHy7pXZ7nbW+ZPB4lk7m5zer/FKy5K364OozDnZ75fpTvJeI
 Cl6MFlCcot0YzCQ5e6hrhoMD6zKm1nm5fnXJTobHxjf9PSA7RMPGahIsjuBmbPOjkq
 /76XwOVwcD6+A==
Date: Fri, 4 Oct 2024 07:23:56 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Shenwei Wang <shenwei.wang@nxp.com>
Message-ID: <20241004072356.5905e684@kernel.org>
In-Reply-To: <20240924205424.573913-1-shenwei.wang@nxp.com>
References: <20240924205424.573913-1-shenwei.wang@nxp.com>
MIME-Version: 1.0
Cc: imx@lists.linux.dev, Chuah Kim Tatt <kim.tatt.chuah@intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Wong Vee Khee <vee.khee.wong@intel.com>, netdev@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, linux-imx@nxp.com, horms@kernel.org,
 Ong Boon Leong <boon.leong.ong@intel.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 net] net: stmmac: dwmac4: extend
 timeout for VLAN Tag register busy bit check
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

T24gVHVlLCAyNCBTZXAgMjAyNCAxNTo1NDoyNCAtMDUwMCBTaGVud2VpIFdhbmcgd3JvdGU6Cj4g
SW5jcmVhc2UgdGhlIHRpbWVvdXQgZm9yIGNoZWNraW5nIHRoZSBidXN5IGJpdCBvZiB0aGUgVkxB
TiBUYWcgcmVnaXN0ZXIKPiBmcm9tIDEwwrVzIHRvIDUwMG1zLiBUaGlzIGNoYW5nZSBpcyBuZWNl
c3NhcnkgdG8gYWNjb21tb2RhdGUgc2NlbmFyaW9zCj4gd2hlcmUgRW5lcmd5IEVmZmljaWVudCBF
dGhlcm5ldCAoRUVFKSBpcyBlbmFibGVkLgo+IAo+IE92ZXJuaWdodCB0ZXN0aW5nIHJldmVhbGVk
IHRoYXQgd2hlbiBFRUUgaXMgYWN0aXZlLCB0aGUgYnVzeSBiaXQgY2FuCj4gcmVtYWluIHNldCBm
b3IgdXAgdG8gYXBwcm94aW1hdGVseSAzMDBtcy4gVGhlIG5ldyA1MDBtcyB0aW1lb3V0IHByb3Zp
ZGVzCj4gYSBzYWZldHkgbWFyZ2luLgo+IAo+IEZpeGVzOiBlZDY0NjM5YmMxZTAgKCJuZXQ6IHN0
bW1hYzogQWRkIHN1cHBvcnQgZm9yIFZMQU4gUnggZmlsdGVyaW5nIikKPiBSZXZpZXdlZC1ieTog
QW5kcmV3IEx1bm4gPGFuZHJld0BsdW5uLmNoPgo+IFNpZ25lZC1vZmYtYnk6IFNoZW53ZWkgV2Fu
ZyA8c2hlbndlaS53YW5nQG54cC5jb20+CgpGVFIgdGhpcyB3YXMgbWVyZ2VkIHRvIG5ldCBhcyBj
b21taXQgNGMxYjU2NjcxYjYuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
