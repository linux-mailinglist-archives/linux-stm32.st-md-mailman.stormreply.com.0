Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F668AC75C2
	for <lists+linux-stm32@lfdr.de>; Thu, 29 May 2025 04:16:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 537EFC35E3F;
	Thu, 29 May 2025 02:16:10 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BFAAEC35E3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 May 2025 02:16:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 98AC1614AC;
 Thu, 29 May 2025 02:16:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D39DDC4CEE3;
 Thu, 29 May 2025 02:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748484967;
 bh=VP/IQdT2nGS/s+RGboroFvF7fX6MZ+U9ZwH4o4Nlc4Y=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=iUJX5dXw3a9NowbtG9QFD71irkXCZh7CBN6jIJVPGflF05BtdPBfQWEAZFhl6G7Kh
 DwjF6+Lyuc+vXaa6Y3SJ33rGHopC6CArMOeXebJjHE4mZpqLYZ0iOwxebMp8Cb/xGV
 wmAUy1QJ0HnWG3CNveRLvaMCdP/LaBI1IKkdWo9LbTM1W3YiDS5MmZVBWkeuHl/HX5
 6zJ0W5VPWgkj9M5Vi8tYn4gpUKGFHmeUJNV/ZMkWM0jQuDw0SzSBjCvmAVAGmIQOMH
 66Yj8lsujPYS6EdiAY3NuVUkRsszgOlp4Tz90XeEIkgPPyrl83LcjrEhIkI+JaDBja
 ltk+hdZUgSvsg==
Date: Wed, 28 May 2025 19:16:06 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Alexis =?UTF-8?B?TG90aG9yw6k=?= <alexis.lothore@bootlin.com>
Message-ID: <20250528191606.66034ab3@kernel.org>
In-Reply-To: <20250528-stmmac_tstamp_div-v3-0-b525ecdfd84c@bootlin.com>
References: <20250528-stmmac_tstamp_div-v3-0-b525ecdfd84c@bootlin.com>
MIME-Version: 1.0
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Phil Reid <preid@electromag.com.au>,
 linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 netdev@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S.
 Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 0/2] net: stmmac: prevent div by 0
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

T24gV2VkLCAyOCBNYXkgMjAyNSAxMDoyOTo0OSArMDIwMCBBbGV4aXMgTG90aG9yw6kgd3JvdGU6
Cj4gSGVsbG8sCj4gdGhpcyBzbWFsbCBzZXJpZXMgYWltcyB0byBmaXggYSBzbWFsbCBzcGxhdCBJ
IGFtIG9ic2VydmluZyBvbiBhIFNUTTMyTVAxNTcKPiBwbGF0Zm9ybSBhdCBib290IChzZWUgY29t
bWl0IDEpIGR1ZSB0byBhIGRpdmlzaW9uIGJ5IDAuIFRoaXMgbmV3Cj4gcmV2aXNpb24gYWRkIHRo
ZSBzYW1lIGNoZWNrIGluIGFub3RoZXIgY29kZSBwYXRoIHBvc3NpYmx5IGFmZmVjdGVkIGJ5Cj4g
dGhlIHNhbWUgaXNzdWUsIGFzIGRpc2N1c3NlZCBpbiB2Mi4KCnYzIGRvZXNudCBhcHBseSBjbGVh
bmx5LiBDb3VsZCB5b3UgcmViYXNlIG9uIGxhdGVzdCBuZXQgYW5kIHJlcG9zdD8KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGlu
ZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9z
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
