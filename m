Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C88EB6CD023
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Mar 2023 04:38:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 66820C69069;
	Wed, 29 Mar 2023 02:38:40 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1DB37C65E42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Mar 2023 02:38:39 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9EF35B81F90;
 Wed, 29 Mar 2023 02:38:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A0F5C433D2;
 Wed, 29 Mar 2023 02:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680057517;
 bh=CBOVidRkW5/whhVrkK1w/Zq5SV9hEA/J2CTxiDVR04A=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=Ic5dMoQ3vNovEGfy6hFtXDq21LbIkA3M6VegJhpXXAAxMAMEAdDII6IA5nG/AjGNt
 HutBlwjL20whsIjXARx6wdhi8SEPUzIqPXocugEWuCRKnSfJttqvp6L5V9dFvz3BrR
 4dz4c3/QPPrKruguvQOMGAVuMtHLpWaCob4Dtx9tzuvPFOBDS7uHiXgMJxjOXOddoM
 n3ds0yps/sjM8OfJTW2tqRWMw9swzFon7dbqHV/UzPyj+khD7RG/WYfMs8KL9tHD/Z
 Gue+gROKlspi2hfsM3b9M37U/EAGuwmqHilLtE8bAJIsibpejwK0UDmEMGYQ9aHg61
 mI6c5h2JZnUsA==
Message-ID: <59f8786822d13088fe2b5646edef5829.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230312161512.2715500-17-u.kleine-koenig@pengutronix.de>
References: <20230312161512.2715500-1-u.kleine-koenig@pengutronix.de>
 <20230312161512.2715500-17-u.kleine-koenig@pengutronix.de>
From: Stephen Boyd <sboyd@kernel.org>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Date: Tue, 28 Mar 2023 19:38:35 -0700
User-Agent: alot/0.10
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 16/30] clk: stm32mp1: Convert to platform
	remove callback returning void
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

UXVvdGluZyBVd2UgS2xlaW5lLUvDtm5pZyAoMjAyMy0wMy0xMiAwOToxNDo1OCkKPiBUaGUgLnJl
bW92ZSgpIGNhbGxiYWNrIGZvciBhIHBsYXRmb3JtIGRyaXZlciByZXR1cm5zIGFuIGludCB3aGlj
aCBtYWtlcwo+IG1hbnkgZHJpdmVyIGF1dGhvcnMgd3JvbmdseSBhc3N1bWUgaXQncyBwb3NzaWJs
ZSB0byBkbyBlcnJvciBoYW5kbGluZyBieQo+IHJldHVybmluZyBhbiBlcnJvciBjb2RlLiBIb3dl
dmVyIHRoZSB2YWx1ZSByZXR1cm5lZCBpcyAobW9zdGx5KSBpZ25vcmVkCj4gYW5kIHRoaXMgdHlw
aWNhbGx5IHJlc3VsdHMgaW4gcmVzb3VyY2UgbGVha3MuIFRvIGltcHJvdmUgaGVyZSB0aGVyZSBp
cyBhCj4gcXVlc3QgdG8gbWFrZSB0aGUgcmVtb3ZlIGNhbGxiYWNrIHJldHVybiB2b2lkLiBJbiB0
aGUgZmlyc3Qgc3RlcCBvZiB0aGlzCj4gcXVlc3QgYWxsIGRyaXZlcnMgYXJlIGNvbnZlcnRlZCB0
byAucmVtb3ZlX25ldygpIHdoaWNoIGFscmVhZHkgcmV0dXJucwo+IHZvaWQuCj4gCj4gVHJpdmlh
bGx5IGNvbnZlcnQgdGhpcyBkcml2ZXIgZnJvbSBhbHdheXMgcmV0dXJuaW5nIHplcm8gaW4gdGhl
IHJlbW92ZQo+IGNhbGxiYWNrIHRvIHRoZSB2b2lkIHJldHVybmluZyB2YXJpYW50Lgo+IAo+IFNp
Z25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9u
aXguZGU+Cj4gLS0tCgpBcHBsaWVkIHRvIGNsay1uZXh0Cl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1z
dG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
