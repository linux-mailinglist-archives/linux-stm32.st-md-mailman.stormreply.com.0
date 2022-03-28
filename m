Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C20D44E90E1
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Mar 2022 11:14:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7B5DBC5C842;
	Mon, 28 Mar 2022 09:14:59 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 935D7C57183
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Mar 2022 09:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648458898; x=1679994898;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=iDPo4+auOxDlbVUvyIzvO6r769KSVx4M39s1sqLHWTg=;
 b=M13VVumGg/veClCNFhJYEDMJ+3SOEBEltR3VaXdONN4fe1BsdLUcAN8R
 plcLrC9Xps4KfOYpk9Co3ehJEplBG38g+3cswM0X2nMYJtEjyPSzExT54
 d5mwc2kcgFNuGSP3x8sGduTGh83rBk/5CPFmK1EvD5u4s4C9swIzec4X4
 5zOEfNVD5GWLLfBk/gYfQ6JQkmMVv3rBdHbQuCZWIGBJJ7bOeMf2hLKT4
 NjBwycdSkXoUMXW4CiTFSngcEPg0KQkJ7N9NjxSGySVrzNgiULyK1nfkU
 g6B1xJvz4y4a3CTJoUflmwQkAf+3sNZ8XBYp+oBgiKMX752749fbtlvmO g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10299"; a="239550784"
X-IronPort-AV: E=Sophos;i="5.90,217,1643702400"; d="scan'208";a="239550784"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 02:14:56 -0700
X-IronPort-AV: E=Sophos;i="5.90,217,1643702400"; d="scan'208";a="563473256"
Received: from smile.fi.intel.com ([10.237.72.59])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 02:14:51 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nYlS4-0081P4-9G; Mon, 28 Mar 2022 12:14:16 +0300
Date: Mon, 28 Mar 2022 12:14:15 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Message-ID: <YkF8Z165E9GqcKBY@smile.fi.intel.com>
References: <20220325200338.54270-1-andriy.shevchenko@linux.intel.com>
 <CAMuHMdXJo=XWNLKpFFe65fx-c7oPXmydvXxiPzGicNaxYthGbg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdXJo=XWNLKpFFe65fx-c7oPXmydvXxiPzGicNaxYthGbg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: Andrew Lunn <andrew@lunn.ch>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [Linux-stm32] [PATCH v1 1/5] gpiolib: Introduce
	gpiochip_count() helper
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

T24gTW9uLCBNYXIgMjgsIDIwMjIgYXQgMDk6MzU6MjVBTSArMDIwMCwgR2VlcnQgVXl0dGVyaG9l
dmVuIHdyb3RlOgo+IE9uIEZyaSwgTWFyIDI1LCAyMDIyIGF0IDk6MDQgUE0gQW5keSBTaGV2Y2hl
bmtvCj4gPGFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6CgouLi4KCj4g
PiArICAgICAgICAgICAgICAgaWYgKGRldmljZV9wcm9wZXJ0eV9yZWFkX2Jvb2woY2hpbGQsICJn
cGlvLWNvbnRyb2xsZXIiKSkKPiAKPiBlcnJvcjogcGFzc2luZyBhcmd1bWVudCAxIG9mIOKAmGRl
dmljZV9wcm9wZXJ0eV9yZWFkX2Jvb2zigJkgZnJvbQo+IGluY29tcGF0aWJsZSBwb2ludGVyIHR5
cGUgWy1XZXJyb3I9aW5jb21wYXRpYmxlLXBvaW50ZXItdHlwZXNdCgpPaCwgdGhhbmtzISBJIHdp
bGwgZml4IHRoaXMgaW4gdjIuCgo+IFNvIEknbSBhZnJhaWQgSSBjYW5ub3QgdGVzdCBwYXRjaCAz
LzUgeWV0IDstKQoKLS0gCldpdGggQmVzdCBSZWdhcmRzLApBbmR5IFNoZXZjaGVua28KCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBt
YWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRw
czovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1z
dG0zMgo=
