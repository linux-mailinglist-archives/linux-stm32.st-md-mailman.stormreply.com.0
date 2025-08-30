Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D55B3CF28
	for <lists+linux-stm32@lfdr.de>; Sat, 30 Aug 2025 21:51:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E3CA9C36B2A;
	Sat, 30 Aug 2025 19:51:16 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BD42DC36B29
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 30 Aug 2025 19:51:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5C03A44499;
 Sat, 30 Aug 2025 19:51:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B181C4CEEB;
 Sat, 30 Aug 2025 19:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756583473;
 bh=gUGT9ZpP7T0v4R1MQrwTuz1NIpTv8oVeEjQlLS+Zn8c=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=dnYM+GUa0iWB5+jj10vKVbJaH1LmWnTenJtiGphiVapLIf4jiuGw1AemPGNvsGaFE
 iUTj5wbKG3IUtfed4wsATUB5ShUnxUVmJeQsroOeSzKIs/056k9Sda33ojIyPHeWJ7
 HQy9kV0ZDcQ/0SmVMhlBUVTgYDJyuzbMqyHYjWchnpviE2SGPczz38GlWZrAgeexiX
 FPdQscXttL0LoGGdEV6UnwK889fHWwEuhzPQ3SPimdT/ysDCHVDal/guTJ1WUQo+XC
 7lh6CqPvwNv68sxhGgG8cd9Ab36tC6PMAIkXWZ/MhmfrWr9K7iLCsvHxS3cSYNwQuF
 qp6oorfyUuwAQ==
Date: Sat, 30 Aug 2025 20:51:04 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Message-ID: <20250830205104.38d784a9@jic23-huawei>
In-Reply-To: <CAHp75Vdr5atuW8wivgR3KRjhCK_i+JE2rJFTU3CkWwzpuNv_pg@mail.gmail.com>
References: <20250828140617.3193288-1-sakari.ailus@linux.intel.com>
 <CAHp75Vdr5atuW8wivgR3KRjhCK_i+JE2rJFTU3CkWwzpuNv_pg@mail.gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.50; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Andy Shevchenko <andy@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>,
 Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@baylibre.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 David Lechner <dlechner@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v5 1/1] iio: dac: Remove redundant
 pm_runtime_mark_last_busy() calls
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

T24gVGh1LCAyOCBBdWcgMjAyNSAxNzo0MzoxOSArMDMwMApBbmR5IFNoZXZjaGVua28gPGFuZHku
c2hldmNoZW5rb0BnbWFpbC5jb20+IHdyb3RlOgoKPiBPbiBUaHUsIEF1ZyAyOCwgMjAyNSBhdCA1
OjA24oCvUE0gU2FrYXJpIEFpbHVzCj4gPHNha2FyaS5haWx1c0BsaW51eC5pbnRlbC5jb20+IHdy
b3RlOgo+ID4KPiA+IHBtX3J1bnRpbWVfcHV0X2F1dG9zdXNwZW5kKCksIHBtX3J1bnRpbWVfcHV0
X3N5bmNfYXV0b3N1c3BlbmQoKSwKPiA+IHBtX3J1bnRpbWVfYXV0b3N1c3BlbmQoKSBhbmQgcG1f
cmVxdWVzdF9hdXRvc3VzcGVuZCgpIG5vdyBpbmNsdWRlIGEgY2FsbAo+ID4gdG8gcG1fcnVudGlt
ZV9tYXJrX2xhc3RfYnVzeSgpLiBSZW1vdmUgdGhlIG5vdy1yZWR1bnRhbnQgZXhwbGljaXQgY2Fs
bCB0byAgCj4gCj4gcmVkdW5kYW50CkZpeGVkIHVwIHRoYXQgd2hpbHN0IGFwcGx5aW5nLgoKVGhh
bmtzLAoKSm9uYXRoYW4KCj4gCj4gPiBwbV9ydW50aW1lX21hcmtfbGFzdF9idXN5KCkuCj4gPgo+
ID4gQWxzbyBjbGVhbiB1cCBlcnJvciBoYW5kbGluZyBpbiBzdG0zMl9kYWNfc2V0X2VuYWJsZV9z
dGF0ZSgpLiAgCj4gCj4gCj4gQ29kZSBsb29rcyBnb29kIHRvIG1lIGluIHRoaXMgdmVyc2lvbgo+
IFJldmlld2VkLWJ5OiBBbmR5IFNoZXZjaGVua28gPGFuZHlAa2VybmVsLm9yZz4KPiAKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1h
aWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBz
Oi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0
bTMyCg==
