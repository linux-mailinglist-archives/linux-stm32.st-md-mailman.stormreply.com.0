Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C266957B1
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Feb 2023 05:10:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 28CB1C6A5F7;
	Tue, 14 Feb 2023 04:10:23 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0B0E8C6A5F7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Feb 2023 04:10:21 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D33C661422;
 Tue, 14 Feb 2023 04:10:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B1D14C433EF;
 Tue, 14 Feb 2023 04:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676347818;
 bh=4fjkDMRrzB3vI7RPysL2qMkgf4eLgrhwGlBnf8QbxAA=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=kgRn2GSS334ZIqTAEjPrsceVR38aJvDwfARNHGJW0MVWWxp4vTXNwjx77cNgc5Lor
 fhNSeORIHiUgaAq0bxuOSwfx2tPXJu7aj/kK1JBv+JkGufAtEWIGzIqpigPou3gbCT
 uxk7t6OQpY1R+gF3Wa9eLjYL9Bjcsmk47eOjhI8V5F0MvhKAAxUfENL1l3yW2GHVFa
 yn/mg08FndNkEwSzIHCuUyOZpKNFJHJcsFHTX0Ub9u5rsv4aH/lWeXhr8dS23s3SYv
 yrJer8sBKtkFfClKXKRibmS1pPgujqMxUfbH/pcbArsBM5ciT9HTozKSJGMDRbFQoz
 Gckx27B2gWDvQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 96181C41672; Tue, 14 Feb 2023 04:10:18 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <167634781860.18399.10618008698033755860.git-patchwork-notify@kernel.org>
Date: Tue, 14 Feb 2023 04:10:18 +0000
References: <20230211112431.214252-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230211112431.214252-1-u.kleine-koenig@pengutronix.de>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig_=3Cu=2Ekleine-koenig=40pengutronix=2Ede=3E?=@ci.codeaurora.org
Cc: netdev@vger.kernel.org, joabreu@synopsys.com, kernel@pengutronix.de,
 peppe.cavallaro@st.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/2] net: stmmac: Make stmmac_dvr_remove()
	return void
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

SGVsbG86CgpUaGlzIHNlcmllcyB3YXMgYXBwbGllZCB0byBuZXRkZXYvbmV0LW5leHQuZ2l0ICht
YXN0ZXIpCmJ5IEpha3ViIEtpY2luc2tpIDxrdWJhQGtlcm5lbC5vcmc+OgoKT24gU2F0LCAxMSBG
ZWIgMjAyMyAxMjoyNDozMCArMDEwMCB5b3Ugd3JvdGU6Cj4gVGhlIGZ1bmN0aW9uIHJldHVybnMg
emVybyB1bmNvbmRpdGlvbmFsbHkuIENoYW5nZSBpdCB0byByZXR1cm4gdm9pZCBpbnN0ZWFkCj4g
d2hpY2ggc2ltcGxpZmllcyBzb21lIGNhbGxlcnMgYXMgZXJyb3IgaGFuZGluZyBiZWNvbWVzIHVu
bmVjZXNzYXJ5Lgo+IAo+IFRoaXMgYWxzbyBtYWtlcyBpdCBtb3JlIG9idmlvdXMgdGhhdCBtb3N0
IHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFja3MgYWx3YXlzCj4gcmV0dXJuIHplcm8uCj4gCj4gU2ln
bmVkLW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25p
eC5kZT4KPiAKPiBbLi4uXQoKSGVyZSBpcyB0aGUgc3VtbWFyeSB3aXRoIGxpbmtzOgogIC0gWzEv
Ml0gbmV0OiBzdG1tYWM6IE1ha2Ugc3RtbWFjX2R2cl9yZW1vdmUoKSByZXR1cm4gdm9pZAogICAg
aHR0cHM6Ly9naXQua2VybmVsLm9yZy9uZXRkZXYvbmV0LW5leHQvYy9mZjAwMTFjZjU2MDEKICAt
IFsyLzJdIG5ldDogc3RtbWFjOiBkd2MtcW9zOiBNYWtlIHN0cnVjdCBkd2NfZXRoX2R3bWFjX2Rh
dGE6OnJlbW92ZSByZXR1cm4gdm9pZAogICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9uZXRkZXYv
bmV0LW5leHQvYy8xYTk0MGIwMDAxM2EKCllvdSBhcmUgYXdlc29tZSwgdGhhbmsgeW91IQotLSAK
RGVldC1kb290LWRvdCwgSSBhbSBhIGJvdC4KaHR0cHM6Ly9rb3JnLmRvY3Mua2VybmVsLm9yZy9w
YXRjaHdvcmsvcHdib3QuaHRtbAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
