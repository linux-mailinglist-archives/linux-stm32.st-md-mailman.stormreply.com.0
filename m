Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 63FE4B3FCD0
	for <lists+linux-stm32@lfdr.de>; Tue,  2 Sep 2025 12:39:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7A3FAC3FACB;
	Tue,  2 Sep 2025 10:39:40 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DEB59C3F95C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Sep 2025 10:39:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B05A860202;
 Tue,  2 Sep 2025 10:39:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ED14C4CEED;
 Tue,  2 Sep 2025 10:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756809578;
 bh=qdOv0TZDnk3Fxtwy2oj8Po6KhwUJyHJXYLEe3RKwNJE=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=RQ9HpYIl1T1Y0Z2LSHjoV2VjUuoeuq0i6sdLxzkUNqWHvyJ0FWm5PFF5nMhG7H0DN
 x2b3Am0zSMrSifeNAzorRrWYDga7OuOaUWxIjb+ySQCrXZhzO5n5Nza72ZMdVsiG5e
 Dd4y2DFtEsBlDygKDNVnA1b/hz6OHmvXjyLhrewJ7GuUJ375zz6emDf75/TkjwGB+0
 BCXmqXLJP0oVi8k1bgEWQC3vrwWU6b5R/2lQGk4gq1XYCqUJ7RVaGOV7/ckZwo7vIw
 HypwBR5uPpq9VWJH2A9oMjI94S+tv/Dd4PnWDyNzctXOEwjfii/u77v7/XhxgBdXAk
 2pArlNm+UyhbA==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>
In-Reply-To: <20250819070458.1027883-1-alexander.stein@ew.tq-group.com>
References: <20250819070458.1027883-1-alexander.stein@ew.tq-group.com>
Message-Id: <175680957679.2263845.4991001517123713397.b4-ty@kernel.org>
Date: Tue, 02 Sep 2025 11:39:36 +0100
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-c81fc
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] (subset) [PATCH v2 1/1] mfd: stmpe: Allow
	building as module
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

T24gVHVlLCAxOSBBdWcgMjAyNSAwOTowNDo1NyArMDIwMCwgQWxleGFuZGVyIFN0ZWluIHdyb3Rl
Ogo+IEV4cG9ydCB0aGUgY29yZSBwcm9iZSBhbmQgcmVtb3ZlIGZ1bmN0aW9uIHRvIGJlIHVzZWQg
YnkgaTJjIGFuZCBzcGkKPiBkcml2ZXJzLiBBbHNvIGFkZCBuZWNlc3NhcnkgbW9kdWxlIGluZm9y
bWF0aW9uIHNvIHRoZSBkcml2ZXJzIGNhbiBiZSBidWlsdAo+IGFzIG1vZHVsZXMuIFRoaXMgcmVk
dWNlcyBmb290cHJpbnQgb2YgdGhlIGRyaXZlciBpcyBlbmFibGVkIGJ1dCB1bnVzZWQuCj4gCj4g
CgpBcHBsaWVkLCB0aGFua3MhCgpbMS8xXSBtZmQ6IHN0bXBlOiBBbGxvdyBidWlsZGluZyBhcyBt
b2R1bGUKICAgICAgY29tbWl0OiBhYThkNGM3M2U5OWU4YTQ2MTJlYjRhNTk4ZjJiMjliMTQxYTk3
MDNjCgotLQpMZWUgSm9uZXMgW+adjueQvOaWr10KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0z
MkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
