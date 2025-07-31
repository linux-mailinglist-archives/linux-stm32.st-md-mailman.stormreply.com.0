Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C6099B1702A
	for <lists+linux-stm32@lfdr.de>; Thu, 31 Jul 2025 13:10:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7F584C36B3C;
	Thu, 31 Jul 2025 11:10:04 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 784D6C36B27
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 31 Jul 2025 11:10:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 44AD2437E7;
 Thu, 31 Jul 2025 11:10:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C50C8C4CEEF;
 Thu, 31 Jul 2025 11:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753960201;
 bh=IaumhB1vEQ8mFtzl1x6wHFM0WGMN8/g+r/ERn78ZaHs=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=TdKSG3HqmBCZ1GXCAA6Gb1sKcw0l15zuFWAApPyFOUJ91dcMFeqeFlFwc6Y3vvupE
 3pzR3acZixD6P//0n8DfAC+arkf4RPuIhdFSshECWJ5HOmqZHTqMtK8/3SxWF6NS0n
 5pwZfa4q/GIH+URgjUvtkvAeIHaT2iUd2bCf7E5hlx3Okbsg27MrjYbeO0LwfutWZq
 uP5xq+4qGBRt7U+qmrRj76orTXNDQe7mYpMjBQ1vXj8ywH8f/L3x/T9jaCrBV0yQxe
 NZSmcXEdNUKmBwhlS3Q0c4A1dt5ZjBdIFeu4lnYpevwcQiHDhYQ4GFkhTo2OhSE++R
 p/y7jdxUNce6Q==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>
In-Reply-To: <20250725071153.338912-1-alexander.stein@ew.tq-group.com>
References: <20250725071153.338912-1-alexander.stein@ew.tq-group.com>
Message-Id: <175396019955.1137478.912508239747809820.b4-ty@kernel.org>
Date: Thu, 31 Jul 2025 12:09:59 +0100
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-c81fc
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] (subset) [PATCH 0/3] stmpe module support
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

T24gRnJpLCAyNSBKdWwgMjAyNSAwOToxMTo0OCArMDIwMCwgQWxleGFuZGVyIFN0ZWluIHdyb3Rl
Ogo+IHRoaXMgc2VyaWVzIGFkZHMgc3VwcG9ydCBmb3IgYnVpbGRpbmcgc3RtcGUgbWZkIGRyaXZl
ciBhcyBhIG1vZHVsZSBhbG9uZyB3aXRoCj4gdGhlIGJ1cyBkcml2ZXIgZm9yIGkyYyBhbmQgc3Bp
LiBUaGlzIGRlcGVuZHMgb24gdGhlIGNsZWFudXAgc2VyaWVzIFsxXQo+IGp1c3QgZm9yIGF2b2lk
aW5nIGNvbmZsaWN0cy4KPiBJJ20gbm90IHN1cmUgaW4gd2hpY2ggb3JkZXIgbW9kdWxlIHN1cHBv
cnQgc2hvdWxkIGJlIGFkZGVkLCBtYXliZSBldmVuIGFsbCBhdAo+IG9uY2UuIFBsZWFzZSBhZHZp
Y2UgaWYgbmVjZXNzYXJ5Lgo+IAo+IEJlc3QgcmVnYXJkcywKPiBBbGV4YW5kZXIKPiAKPiBbLi4u
XQoKQXBwbGllZCwgdGhhbmtzIQoKWzEvM10gbWZkOiBzdG1wZS1zcGk6IEFkZCBtaXNzaW5nIE1P
RFVMRV9MSUNFTlNFCiAgICAgIGNvbW1pdDogZDczYmNjYzM2MjQ0ODAwMWZhMWQzOTczYWY2OTUw
NDgxMWI3MTBkYwpbMi8zXSBtZmQ6IHN0bXBlLWkyYzogQWRkIG1pc3NpbmcgTU9EVUxFX0xJQ0VO
U0UKICAgICAgY29tbWl0OiAwNDIwYWE5ZGVhZDE2NWQ4OTM1NDdhZjUxNzA0YTM2NzY2MzRiNjQ3
CgotLQpMZWUgSm9uZXMgW+adjueQvOaWr10KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBz
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
