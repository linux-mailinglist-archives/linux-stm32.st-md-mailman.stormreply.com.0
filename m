Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C703C9C406C
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Nov 2024 15:12:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 86B7FC78F66;
	Mon, 11 Nov 2024 14:12:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5C44CC78F65
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Nov 2024 14:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731334353; x=1762870353;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=d194LAtbHHA+WQxpTakn4/4xXjdgsxHN5zzVyFMbmZo=;
 b=exor82uugYE35JrRlFqyeNGshixHCAxDiQCzahYIVmwVGa8g/h+oIOCt
 hcEGS2abvw+GKZdoepUnM9UZOeb3EIPXLI8kkjm0aU+FsXeKgdxtBVI3G
 qvX8qOwhP0rm9TPJBjAflMkfOWhZWYFG+n2aGzrRlGqFsMH8XFtTrgqiJ
 /0FPMRkfMMuQ+3qEHbbNgjQQIvIW7RaQq0lOsEq5b1Sygyni9Pqbre4ue
 LyiZx+7TPktvGApj7yS/obo5Zh84czqQhUcnGlgirsZ6nZ1PJYJyCJpCB
 SRov9vz/eB3Eofyu2Aq4WVvLv+URI2qTHch+pqrLllmV8Rpu3sGVqGUrG A==;
X-CSE-ConnectionGUID: 5Q/tdPolQR+RWQiYr+S9/w==
X-CSE-MsgGUID: elOOU4UNQOuBf9qWRwLZIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11253"; a="56535212"
X-IronPort-AV: E=Sophos;i="6.12,145,1728975600"; d="scan'208";a="56535212"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2024 06:12:24 -0800
X-CSE-ConnectionGUID: 0O9YeO9nR0mJkqccr+rJfg==
X-CSE-MsgGUID: Ws0h1OM1QryPUar4jSR7LA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,145,1728975600"; d="scan'208";a="117864269"
Received: from ubik.fi.intel.com (HELO localhost) ([10.237.72.184])
 by fmviesa001.fm.intel.com with ESMTP; 11 Nov 2024 06:12:21 -0800
From: Alexander Shishkin <alexander.shishkin@linux.intel.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
In-Reply-To: <20241111110922.334610-2-u.kleine-koenig@baylibre.com>
References: <20241111110922.334610-2-u.kleine-koenig@baylibre.com>
Date: Mon, 11 Nov 2024 16:12:20 +0200
Message-ID: <87h68duaez.fsf@ubik.fi.intel.com>
MIME-Version: 1.0
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
 alexander.shishkin@linux.intel.com, coresight@lists.linaro.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 James Clark <james.clark@linaro.org>, linux-arm-kernel@lists.infradead.org,
 Mike Leach <mike.leach@linaro.org>
Subject: Re: [Linux-stm32] [PATCH] hwtracing: Switch back to struct
	platform_driver::remove()
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

VXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BiYXlsaWJyZS5jb20+IHdyaXRlczoK
Cj4gQWZ0ZXIgY29tbWl0IDBlZGI1NTVhNjVkMSAoInBsYXRmb3JtOiBNYWtlIHBsYXRmb3JtX2Ry
aXZlcjo6cmVtb3ZlKCkKPiByZXR1cm4gdm9pZCIpIC5yZW1vdmUoKSBpcyAoYWdhaW4pIHRoZSBy
aWdodCBjYWxsYmFjayB0byBpbXBsZW1lbnQgZm9yCj4gcGxhdGZvcm0gZHJpdmVycy4KPgo+IENv
bnZlcnQgYWxsIHBsYXRmb3JtIGRyaXZlcnMgYmVsb3cgZHJpdmVycy9od3RyYWNpbmcgdG8gdXNl
IC5yZW1vdmUoKSwKPiB3aXRoIHRoZSBldmVudHVhbCBnb2FsIHRvIGRyb3Agc3RydWN0IHBsYXRm
b3JtX2RyaXZlcjo6cmVtb3ZlX25ldygpLiBBcwo+IC5yZW1vdmUoKSBhbmQgLnJlbW92ZV9uZXco
KSBoYXZlIHRoZSBzYW1lIHByb3RvdHlwZXMsIGNvbnZlcnNpb24gaXMgZG9uZQo+IGJ5IGp1c3Qg
Y2hhbmdpbmcgdGhlIHN0cnVjdHVyZSBtZW1iZXIgbmFtZSBpbiB0aGUgZHJpdmVyIGluaXRpYWxp
emVyLgo+Cj4gQWxzbyBhZGFwdCBzb21lIHdoaXRlc3BhY2UgdG8gbWFrZSBpbmRlbnRpb24gY29u
c2lzdGVudC4KPgo+IFNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1r
b2VuaWdAYmF5bGlicmUuY29tPgoKQWNrZWQtYnk6IEFsZXhhbmRlciBTaGlzaGtpbiA8YWxleGFu
ZGVyLnNoaXNoa2luQGxpbnV4LmludGVsLmNvbT4KCj4gLS0tCj4gSGVsbG8sCj4KPiBJIGRpZCBh
IHNpbmdsZSBwYXRjaCBmb3IgYWxsIG9mIGRyaXZlcnMvaHd0cmFjaW5nLiBXaGlsZSBJIHVzdWFs
bHkKPiBwcmVmZXIgdG8gZG8gb25lIGxvZ2ljYWwgY2hhbmdlIHBlciBwYXRjaCwgdGhpcyBzZWVt
cyB0byBiZQo+IG92ZXJlbmdpbmVlcmluZyBoZXJlIGFzIHRoZSBpbmRpdmlkdWFsIGNoYW5nZXMg
YXJlIHJlYWxseSB0cml2aWFsIGFuZAo+IHNob3VsZG4ndCBiZSBtdWNoIGluIHRoZSB3YXkgZm9y
IHN0YWJsZSBiYWNrcG9ydHMuIEJ1dCBJJ2xsIGhhcHBpbHkKPiBzcGxpdCB0aGUgcGF0Y2ggaWYg
eW91IHByZWZlciBpdCBzcGxpdC4gTWF5YmUgc3BsaXQgZm9yIGNvcmVzaWdodCB2cy4KPiBpbnRl
bF90aD8gQWxzbyBpZiB5b3Ugb2JqZWN0IHRoZSBpbmRlbnRhdGlvbiBzdHVmZiwgSSBjYW4gcmV3
b3JrIHRoYXQuCgpJJ20gZmluZSB3aXRoIGl0IGFzIGlzLgoKPiBUaGlzIGlzIGJhc2VkIG9uIHRv
ZGF5J3MgbmV4dCwgaWYgY29uZmxpY3RzIGFyaXNlIHdoZW4geW91IGFwcGx5IGl0IGF0Cj4gc29t
ZSBsYXRlciB0aW1lIGFuZCBkb24ndCB3YW50IHRvIHJlc29sdmUgdGhlbSwgZmVlbCBmcmVlIHRv
IGp1c3QgZHJvcAo+IHRoZSBjaGFuZ2VzIHRvIHRoZSBjb25mbGljdGluZyBmaWxlcy4gSSdsbCBu
b3RpY2UgYW5kIGZvbGxvd3VwIGF0IGEKPiBsYXRlciB0aW1lIHRoZW4uIE9yIGFzayBtZSBmb3Ig
YSBmaXhlZCByZXNlbmQuIChIYXZpbmcgc2FpZCB0aGF0LCBJCj4gcmVjb21tZW5kIGI0IGFtIC0z
ICsgZ2l0IGFtIC0zIHdoaWNoIHNob3VsZCByZXNvbHZlIG1vc3QgY29uZmxpY3RzIGp1c3QKPiBm
aW5lLikKCkRvZXMgYW55Ym9keSB3YW50IHRvIHBpY2sgdGhpcyB1cCBvciBzaG91bGQgST8gSSdt
IGZpbmUgZWl0aGVyIHdheSwgYnV0CmlmIHRoZXJlIGFyZSBhbnkgY29uZmxpY3RzIHRoZXkgd29u
J3QgYmUgZnJvbSBteSBlbmQgb2YgdGhpbmdzLCBzbyBpdAptaWdodCBtYWtlIHNlbnNlIHRvIHRh
a2UgaXQgdmlhIHRoZSBjb3Jlc2lnaHQgcGF0aC4KClRoYW5rcywKLS0KQWxleApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5n
IGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
