Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 410F41FCEF5
	for <lists+linux-stm32@lfdr.de>; Wed, 17 Jun 2020 15:59:47 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EC93FC36B0D;
	Wed, 17 Jun 2020 13:59:46 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5ECF1C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Jun 2020 13:59:46 +0000 (UTC)
Received: from localhost (unknown [171.61.66.58])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E1A4E20776;
 Wed, 17 Jun 2020 13:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592402384;
 bh=0Lz6TFQhfGp4bkoSVLTJgIT/broxuaK6TXcJSsj1HDM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LMOFazE11y2j35ElYwUhFG1c7RveWXp6JEzTsPUId8PCinClymu6lifqi+kjEA+7N
 ROrH8zIGYsAXahTZqkbHkC2tTE3RRK/NU6u4KzYYp8wNMheVO4SJyvikQNeLSb7Czv
 ZpkSIhit1bCec9vwK1O92LKaEcWlRVt/o5J2bQl0=
Date: Wed, 17 Jun 2020 19:29:40 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Navid Emamdoost <navid.emamdoost@gmail.com>
Message-ID: <20200617135940.GU2324254@vkoul-mobl>
References: <873bfb31-52d8-7c9b-5480-4a94dc945307@web.de>
 <CAEkB2ET_gfNUAuoZHxiGWZX7d3CQaJYJJqS2Fspif5mFq4-xfA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEkB2ET_gfNUAuoZHxiGWZX7d3CQaJYJJqS2Fspif5mFq4-xfA@mail.gmail.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 kernel-janitors@vger.kernel.org, Kangjie Lu <kjlu@umn.edu>,
 LKML <linux-kernel@vger.kernel.org>, Navid Emamdoost <emamd001@umn.edu>,
 Markus Elfring <Markus.Elfring@web.de>, Qiushi Wu <wu000273@umn.edu>,
 Stephen McCamant <smccaman@umn.edu>, dmaengine@vger.kernel.org,
 Dan Williams <dan.j.williams@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dmaengine: stm32-mdma: call
 pm_runtime_put if pm_runtime_get_sync fails
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

T24gMDMtMDYtMjAsIDE0OjE3LCBOYXZpZCBFbWFtZG9vc3Qgd3JvdGU6Cj4gT24gV2VkLCBKdW4g
MywgMjAyMCBhdCAxOjUyIFBNIE1hcmt1cyBFbGZyaW5nIDxNYXJrdXMuRWxmcmluZ0B3ZWIuZGU+
IHdyb3RlOgo+ID4KPiA+ID4gQ2FsbGluZyBwbV9ydW50aW1lX2dldF9zeW5jIGluY3JlbWVudHMg
dGhlIGNvdW50ZXIgZXZlbiBpbiBjYXNlIG9mCj4gPiA+IGZhaWx1cmUsIGNhdXNpbmcgaW5jb3Jy
ZWN0IHJlZiBjb3VudC4gQ2FsbCBwbV9ydW50aW1lX3B1dCBpZgo+ID4gPiBwbV9ydW50aW1lX2dl
dF9zeW5jIGZhaWxzLgo+ID4KPiA+IElzIGl0IGFwcHJvcHJpYXRlIHRvIGNvcHkgYSBzZW50ZW5j
ZSBmcm9tIHRoZSBjaGFuZ2UgZGVzY3JpcHRpb24KPiA+IGludG8gdGhlIHBhdGNoIHN1YmplY3Q/
Cj4gPgo+ID4gSG93IGRvIHlvdSB0aGluayBhYm91dCBhIHdvcmRpbmcgdmFyaWFudCBsaWtlIHRo
ZSBmb2xsb3dpbmc/Cj4gUGxlYXNlIHN0b3AgcHJvcG9zaW5nIHJld29yZGluZyBvbiBteSBwYXRj
aGVzIQo+IAo+IEkgd2lsbCBjb25zaWRlciB1cGRhdGluZyBteSBwYXRjaGVzIG9ubHkgaWYgYSBt
YWludGFpbmVyIGFza3MgZm9yIGl0LgoKWWVhaCBpZ25vcmUgdGhlc2UgOikgbm8gb25lIHRha2Vz
IHRoaXMgJ2JvdCcgc2VyaW91c2x5LCBpdCBpcyBhbm5veWluZwp5ZXMgOigKCj4gPgo+ID4gICAg
VGhlIFBNIHJ1bnRpbWUgcmVmZXJlbmNlIGNvdW50ZXIgaXMgZ2VuZXJhbGx5IGluY3JlbWVudGVk
IGJ5IGEgY2FsbCBvZgo+ID4gICAgdGhlIGZ1bmN0aW9uIOKAnHBtX3J1bnRpbWVfZ2V0X3N5bmPi
gJ0uCj4gPiAgICBUaHVzIGNhbGwgdGhlIGZ1bmN0aW9uIOKAnHBtX3J1bnRpbWVfcHV04oCdIGFs
c28gaW4gdHdvIGVycm9yIGNhc2VzCj4gPiAgICB0byBrZWVwIHRoZSByZWZlcmVuY2UgY291bnRp
bmcgY29uc2lzdGVudC4KPiA+Cj4gPgo+ID4gV291bGQgeW91IGxpa2UgdG8gYWRkIHRoZSB0YWcg
4oCcRml4ZXPigJ0gdG8gdGhlIGNvbW1pdCBtZXNzYWdlPwo+ID4KPiA+IFJlZ2FyZHMsCj4gPiBN
YXJrdXMKPiAKPiAKPiAKPiAtLSAKPiBOYXZpZC4KCi0tIAp+Vmlub2QKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0
CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
