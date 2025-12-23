Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A8CFCD91AF
	for <lists+linux-stm32@lfdr.de>; Tue, 23 Dec 2025 12:28:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3022EC8F272;
	Tue, 23 Dec 2025 11:28:31 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C966EC5A4C0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Dec 2025 11:28:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id AD1956013B;
 Tue, 23 Dec 2025 11:28:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05E5BC116C6;
 Tue, 23 Dec 2025 11:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1766489308;
 bh=KCJf4ICKUg4d+4CCrW1uq1qUVJx+y45H9G4fHNmF96Q=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=sH5oTrTB5k619Stb59NdBv4Swig7HXVjHNn9QI5WMWz/Trcq2M9GbuTaoVu6skcf4
 reZe+wV2HXuxEUMT9Sj9aWXelCHJ4SF+7Xh0yIh69XV3I9OreJh8JLXjrHfFlU6A3S
 2aKjO7ow6tJykFtKOumFrhc4smLI5c3mWlvmPW4dgp6q9Mci+PTgErMLDQCpnknXL0
 CRVISSBsGI+TYdhgMgVl+vufkZDWJglyG2TUS5k5RkjK/Fsd97NKx6wdA3yKldThGF
 JerthVbXS+1eibIZPxcCK7/zjt57amdmlTz5aVGlT8DBW9B4ZuEdleQo25PTKfgDAI
 qnbPQpsfa0YCQ==
From: Vinod Koul <vkoul@kernel.org>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, 
 Amelie Delaunay <amelie.delaunay@foss.st.com>
In-Reply-To: <20251217-mdma_warnings_fix-v2-1-340200e0bb55@foss.st.com>
References: <20251217-mdma_warnings_fix-v2-1-340200e0bb55@foss.st.com>
Message-Id: <176648930565.697163.2533356435881488772.b4-ty@kernel.org>
Date: Tue, 23 Dec 2025 16:58:25 +0530
MIME-Version: 1.0
X-Mailer: b4 0.13.0
Cc: dmaengine@vger.kernel.org,
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2] dmaengine: stm32-mdma: initialize
 m2m_hw_period and ccr to fix warnings
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

Ck9uIFdlZCwgMTcgRGVjIDIwMjUgMDk6MTU6MDMgKzAxMDAsIEFtZWxpZSBEZWxhdW5heSB3cm90
ZToKPiBtMm1faHdfcGVyaW9kIGlzIGluaXRpYWxpemVkIG9ubHkgd2hlbiBjaGFuX2NvbmZpZy0+
bTJtX2h3IGlzIHRydWUuIFRoaXMKPiB0cmlnZ2VycyBhIHdhcm5pbmc6Cj4g4oCYbTJtX2h3X3Bl
cmlvZOKAmSBtYXkgYmUgdXNlZCB1bmluaXRpYWxpemVkIFstV21heWJlLXVuaW5pdGlhbGl6ZWRd
Cj4gQWx0aG91Z2ggbTJtX2h3X3BlcmlvZCBpcyBvbmx5IHVzZWQgd2hlbiBjaGFuX2NvbmZpZy0+
bTJtX2h3IGlzIHRydWUgYW5kCj4gaWdub3JlZCBvdGhlcndpc2UsIGluaXRpYWxpemUgaXQgdW5j
b25kaXRpb25hbGx5IHRvIDAuCj4gCj4gY2NyIGlzIGluaXRpYWxpemVkIGJ5IHN0bTMyX21kbWFf
c2V0X3hmZXJfcGFyYW0oKSB3aGVuIHRoZSBzZyBsaXN0IGlzIG5vdAo+IGVtcHR5LiBUaGlzIHRy
aWdnZXJzIGEgd2FybmluZzoKPiDigJhjY3LigJkgbWF5IGJlIHVzZWQgdW5pbml0aWFsaXplZCBb
LVdtYXliZS11bmluaXRpYWxpemVkXQo+IEluZGVlZCwgaXQgY291bGQgYmUgdXNlZCB1bmluaXRp
YWxpemVkIGlmIHRoZSBzZyBsaXN0IGlzIGVtcHR5LiBJbml0aWFsaXplCj4gaXQgdG8gMC4KPiAK
PiBbLi4uXQoKQXBwbGllZCwgdGhhbmtzIQoKWzEvMV0gZG1hZW5naW5lOiBzdG0zMi1tZG1hOiBp
bml0aWFsaXplIG0ybV9od19wZXJpb2QgYW5kIGNjciB0byBmaXggd2FybmluZ3MKICAgICAgY29t
bWl0OiBhYWYzYmMwMjY1NzQ0YWRiYzJkMzY0OTY0ZWY0MDljZjExOGQxOTNkCgpCZXN0IHJlZ2Fy
ZHMsCi0tIAp+Vmlub2QKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFp
bG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
