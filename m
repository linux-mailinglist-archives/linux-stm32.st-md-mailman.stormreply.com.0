Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 336FD2B667
	for <lists+linux-stm32@lfdr.de>; Mon, 27 May 2019 15:27:49 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 83B66C5C82E
	for <lists+linux-stm32@lfdr.de>; Mon, 27 May 2019 13:27:48 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0A758C5C82D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 May 2019 13:27:46 +0000 (UTC)
Received: from localhost (unknown [171.61.91.186])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id ED6842075E;
 Mon, 27 May 2019 13:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1558963664;
 bh=5LGQZbcDiGADtRy7nX7CzuVlxf33jXUOVsnEJ3zPY0c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uUXx9qkdl3PVY7xkVd58jgCJb3Lp8OiMlxFqQAZ1sXvFApYBGITyi/UALTTG1JNUy
 b4OWejyk5gOFmczJsWLyvzX/xMHkG9aA+Gs4E2Yyer9SEsRVyYUwwjJhI9jtNeZVmJ
 yENXghH6AMpxYO/JJtw0k+PYaBdMKfJNOOojTcVI=
Date: Mon, 27 May 2019 18:57:39 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Weitao Hou <houweitaoo@gmail.com>
Message-ID: <20190527132739.GJ15118@vkoul-mobl>
References: <20190526071324.15307-1-houweitaoo@gmail.com>
 <20190527064303.GG15118@vkoul-mobl>
 <CAK98mP9teTxZn9mMZ_yXSmC7h8gimgN14kX=GT0Q43O58zC-rw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK98mP9teTxZn9mMZ_yXSmC7h8gimgN14kX=GT0Q43O58zC-rw@mail.gmail.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Cc: linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com,
 dmaengine@vger.kernel.org, dan.j.williams@intel.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dmaengine: use to_platform_device()
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

SGkgV2VpdGFvLAoKT24gMjctMDUtMTksIDIxOjEwLCBXZWl0YW8gSG91IHdyb3RlOgo+IEhpLFZp
bm9kCj4gICAgIE5lZWQgSSBhZGQgdGhlIHN0bTMyIGRyaXZlciB0YWcgYW5kIHJlc2VuZCB2MiBw
YXRjaD8KClBsZWFzZSBkbyBub3QgdG9wIHBvc3QhCgpBcyBiZWxvdyBzYXlzLCB0aGUgcGF0Y2gg
aXMgYXBwbGllZCBhbmQgSSBjb3JyZWN0ZWQgdGhlIHRhZyBhbmQgYWRkZWQKc3RtMzIgd2hpbGUg
YXBwbHlpbmcsIHNvIG5vIGNoYW5nZSBvciB2MiByZXF1aXJlZC4KCj4gVmlub2QgS291bCA8dmtv
dWxAa2VybmVsLm9yZz4g5LqOMjAxOeW5tDXmnIgyN+aXpeWRqOS4gCDkuIvljYgyOjQz5YaZ6YGT
77yaCj4gCj4gPiBPbiAyNi0wNS0xOSwgMTU6MTMsIFdlaXRhbyBIb3Ugd3JvdGU6Cj4gPiA+IFVz
ZSB0b19wbGF0Zm9ybV9kZXZpY2UoKSBpbnN0ZWFkIG9mIG9wZW4tY29kaW5nIGl0Lgo+ID4KPiA+
IEFwcGxpZWQgYWZ0ZXIgYWRkaW5nIHN0bTMyIGRyaXZlciB0YWcsIHRoYW5rcwo+ID4KPiA+IC0t
Cj4gPiB+Vmlub2QKPiA+CgotLSAKflZpbm9kCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBz
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
