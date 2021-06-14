Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5119F3A701F
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Jun 2021 22:20:10 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F14CCC597B0;
	Mon, 14 Jun 2021 20:20:09 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 42FDDC58D58
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Jun 2021 20:20:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 4FF5C61356;
 Mon, 14 Jun 2021 20:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623702006;
 bh=XOJ3V4TTGOTaNvJ/moAVHGooICyKoo2oFs2dvhRYbdo=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=Dw/3WhgnC5kqsYSdedfqedS+a+v1Coo7MXZGGQwR0amcs6rDA0o3I60TljQW4r54Z
 AZJEpK/Zd7cFHxUSTDBKoIl1yznyAEFmperHBkJff+zDCP7BVXHHEi2DIViMKTN3Lc
 J2Uezqsc0UsFEcbr//WAvT39jeZ+QfuctvlFQdiexoJ/C91rM70McFFTTL8U0ufjPQ
 w25Ms7XPMwXxzzbkaWMES2rQ3W5LPtfTUQlPfDVsoYH0Bx2bk0rshmZKVOvDdb6olO
 i9gAWaXSeKB5MdARn9IAlh1WwaqZoCTqn/yfepFv9c9f5TB+WZt+4jZaI668owdsrN
 o5lQ8UEMTNfUg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 4010060BE1;
 Mon, 14 Jun 2021 20:20:06 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <162370200625.25455.5879439335776203648.git-patchwork-notify@kernel.org>
Date: Mon, 14 Jun 2021 20:20:06 +0000
References: <1623690937-52389-1-git-send-email-zhouyanjie@wanyeetech.com>
In-Reply-To: <1623690937-52389-1-git-send-email-zhouyanjie@wanyeetech.com>
To: =?utf-8?b?5ZGo55Cw5p2wIChaaG91IFlhbmppZSkgPHpob3V5YW5qaWVAd2FueWVldGVjaC5j?=@ci.codeaurora.org,
 =?utf-8?b?b20+?=@ci.codeaurora.org
Cc: joabreu@synopsys.com, alexandre.torgue@st.com, jun.jiang@ingenic.com,
 devicetree@vger.kernel.org, rick.tyliu@ingenic.com, netdev@vger.kernel.org,
 sihui.liu@ingenic.com, linux-stm32@st-md-mailman.stormreply.com,
 alexandre.torgue@foss.st.com, linux-kernel@vger.kernel.org,
 sernia.zhou@foxmail.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, mcoquelin.stm32@gmail.com,
 peppe.cavallaro@st.com, matthias.bgg@gmail.com, kuba@kernel.org,
 dongsheng.qiu@ingenic.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, aric.pzqi@ingenic.com
Subject: Re: [Linux-stm32] [PATCH v3 0/2] Add Ingenic SoCs MAC support.
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

SGVsbG86CgpUaGlzIHNlcmllcyB3YXMgYXBwbGllZCB0byBuZXRkZXYvbmV0LW5leHQuZ2l0IChy
ZWZzL2hlYWRzL21hc3Rlcik6CgpPbiBUdWUsIDE1IEp1biAyMDIxIDAxOjE1OjM1ICswODAwIHlv
dSB3cm90ZToKPiB2Mi0+djM6Cj4gMS5BZGQgImluZ2VuaWMsbWFjLnlhbWwiIGZvciBJbmdlbmlj
IFNvQ3MuCj4gMi5DaGFuZ2UgdHggY2xrIGRlbGF5IGFuZCByeCBjbGsgZGVsYXkgZnJvbSBoYXJk
d2FyZSB2YWx1ZSB0byBwcy4KPiAzLnJldHVybiAtRUlOVkFMIHdoZW4gYSB1bnN1cHBvcnRlZCB2
YWx1ZSBpcyBlbmNvdW50ZXJlZCB3aGVuCj4gICBwYXJzaW5nIHRoZSBiaW5kaW5nLgo+IDQuU2lt
cGxpZnkgdGhlIGNvZGUgb2YgdGhlIFJHTUlJIHBhcnQgb2YgWDIwMDAgU29DIGFjY29yZGluZyB0
bwo+ICAgQW5kcmV3IEx1bm7igJlzIHN1Z2dlc3Rpb24uCj4gNS5Gb2xsb3cgdGhlIGV4YW1wbGUg
b2YgImR3bWFjLW1lZGlhdGVrLmMiIHRvIGltcHJvdmUgdGhlIGNvZGUKPiAgIHRoYXQgaGFuZGxl
cyBkZWxheXMgYWNjb3JkaW5nIHRvIEFuZHJldyBMdW5u4oCZcyBzdWdnZXN0aW9uLgo+IAo+IFsu
Li5dCgpIZXJlIGlzIHRoZSBzdW1tYXJ5IHdpdGggbGlua3M6CiAgLSBbdjMsMS8yXSBkdC1iaW5k
aW5nczogZHdtYWM6IEFkZCBiaW5kaW5ncyBmb3IgbmV3IEluZ2VuaWMgU29Dcy4KICAgIGh0dHBz
Oi8vZ2l0Lmtlcm5lbC5vcmcvbmV0ZGV2L25ldC1uZXh0L2MvM2I4NDAxMDY2ZTVhCiAgLSBbdjMs
Mi8yXSBuZXQ6IHN0bW1hYzogQWRkIEluZ2VuaWMgU29DcyBNQUMgc3VwcG9ydC4KICAgIGh0dHBz
Oi8vZ2l0Lmtlcm5lbC5vcmcvbmV0ZGV2L25ldC1uZXh0L2MvMmJiNGI5OGI2MGQ3CgpZb3UgYXJl
IGF3ZXNvbWUsIHRoYW5rIHlvdSEKLS0KRGVldC1kb290LWRvdCwgSSBhbSBhIGJvdC4KaHR0cHM6
Ly9rb3JnLmRvY3Mua2VybmVsLm9yZy9wYXRjaHdvcmsvcHdib3QuaHRtbAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcg
bGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
