Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6239491C0EE
	for <lists+linux-stm32@lfdr.de>; Fri, 28 Jun 2024 16:29:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2563BC6DD9F;
	Fri, 28 Jun 2024 14:29:01 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1188CCFAC50
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Jun 2024 14:28:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 16F78621A1;
 Fri, 28 Jun 2024 14:28:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88819C2BBFC;
 Fri, 28 Jun 2024 14:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719584932;
 bh=o0+FtQLeO2U5JLYoyvwKKH3oaXIVFsGVeZboLFjghKU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Mu02ujgOzG9d5fUcolSqf5bxAVmHpy6dZ5S0T1uPrLfBOtg+yFHwB1KaAEXkSU0du
 ctkaxwqC33ETdkMU7jSNbMxGH6RlrziiewF4YsEeAEw+LdZsxL+wJjwr2ytlKXy2OZ
 ++pQM0IhzEZiGHdhxu9PyOgNp/nqx7pqmayHI+8wVHrQfUoklJ7PvpR6vCxHkYv8c6
 Iey0vKm6hMA4DQlJglfC/kXE858Gf6bDLglvno17PsdAK/kmUab+Ru+U8A+csxDGlH
 qJPK0FBxbSMd34ubrREIzzhHz8CV44rJe4P6QLrUBTsZQH1/S9gFfhwqs3QUahdmWO
 sqkqgQ3VzAzJQ==
Date: Fri, 28 Jun 2024 15:28:47 +0100
From: Lee Jones <lee@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Message-ID: <20240628142847.GN2532839@google.com>
References: <cover.1718791090.git.u.kleine-koenig@baylibre.com>
 <20240626151343.GA2504017@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240626151343.GA2504017@google.com>
Cc: linux-pwm@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Thorsten Scherer <T.Scherer@eckelmann.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 William Breathitt Gray <wbg@kernel.org>
Subject: [Linux-stm32] [GIT PULL] Immutable branch between MFD and Counter
 due for the v5.11 merge window
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

RW5qb3khCgpUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IDE2MTNlNjA0ZGYwY2Qz
NTljZjJhN2ZiZDliZTdhMGJjZmFjZmFiZDA6CgogIExpbnV4IDYuMTAtcmMxICgyMDI0LTA1LTI2
IDE1OjIwOjEyIC0wNzAwKQoKYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6
CgogIHNzaDovL2dpdEBnaXRvbGl0ZS5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dp
dC9sZWUvbWZkLmdpdCB0YWdzL2liLW1mZC1jb3VudGVyLXY1LjExCgpmb3IgeW91IHRvIGZldGNo
IGNoYW5nZXMgdXAgdG8gMzA0ZDAyYWE3MTEzNjlkYTg5YjRmOGMwMTcwMmJmMWI1ZDFmN2FiYzoK
CiAgbWZkOiBzdG0zMi10aW1lcnM6IERyb3AgdW51c2VkIFRJTV9ESUVSX0NDX0lFICgyMDI0LTA2
LTI2IDE2OjA5OjU4ICswMTAwKQoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpJbW11dGFibGUgYnJhbmNoIGJldHdlZW4gTUZE
IGFuZCBDb3VudGVyIGR1ZSBmb3IgdGhlIHY1LjExIG1lcmdlIHdpbmRvdwoKLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpVd2Ug
S2xlaW5lLUvDtm5pZyAoNCk6CiAgICAgIG1mZDogc3RtMzItdGltZXJzOiBVbmlmeSBhbGlnbm1l
bnQgb2YgcmVnaXN0ZXIgZGVmaW5pdGlvbgogICAgICBtZmQ6IHN0bTMyLXRpbWVyczogQWRkIHNv
bWUgcmVnaXN0ZXIgZGVmaW5pdGlvbnMgd2l0aCBhIHBhcmFtZXRlcgogICAgICBjb3VudGVyOiBz
dG0zMi10aW1lci1jbnQ6IFVzZSBUSU1fRElFUl9DQ3hJRSh4KSBpbnN0ZWFkIG9mIFRJTV9ESUVS
X0NDeElFKHgpCiAgICAgIG1mZDogc3RtMzItdGltZXJzOiBEcm9wIHVudXNlZCBUSU1fRElFUl9D
Q19JRQoKIGRyaXZlcnMvY291bnRlci9zdG0zMi10aW1lci1jbnQuYyB8ICAgNCArLQogaW5jbHVk
ZS9saW51eC9tZmQvc3RtMzItdGltZXJzLmggIHwgMTc5ICsrKysrKysrKysrKysrKysrKysrLS0t
LS0tLS0tLS0tLS0tLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDk2IGluc2VydGlvbnMoKyksIDg3IGRl
bGV0aW9ucygtKQoKLS0gCkxlZSBKb25lcyBb5p2O55C85pavXQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGlu
dXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
