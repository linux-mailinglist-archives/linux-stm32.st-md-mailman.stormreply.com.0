Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EFD84EB222
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Mar 2022 18:47:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 38598C5EC6B;
	Tue, 29 Mar 2022 16:47:44 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8FA91C5EC47
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Mar 2022 16:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648572462; x=1680108462;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=l79PCfT680tSg5itoW3f+C4BVaO65e08V3oBAzUaQsg=;
 b=g9awV/IIjUeDvrI6n+KAzcNiyvZilQAKH0KF6RLi7KtBIEnmLIvjY93N
 LAe5bFcof6MfVqeEoe8HM7ldfVynsQDxJqcpmh97S1rjoZCJykGx5/qPb
 xs2W4qS7b46frNdyZ2b1TB/hSmDn78l4YwmXtstA5xskR99jrqbPo8pgq
 XpkgPMbhPktGQ2klh2gqHVvjliunR4U9CANVKI3QpEmFRTdn19xeBekX/
 ZVdm9Qe7I84IlgsFmZnJ9QBjDW12kRz84iAA7XB0Wp6ZVqf92tbPgAHEI
 wy7C/+LQht2LhER3ffoAs0dmu1MZuWdoQ2bFhL9huu85nrBEOdEeZFCRA w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10301"; a="345741229"
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; d="scan'208";a="345741229"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2022 09:42:43 -0700
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; d="scan'208";a="554327473"
Received: from smile.fi.intel.com ([10.237.72.59])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2022 09:42:36 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nZEuu-008rb0-Vw; Tue, 29 Mar 2022 19:42:00 +0300
Date: Tue, 29 Mar 2022 19:42:00 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Message-ID: <YkM22GwhxV+YKl8l@smile.fi.intel.com>
References: <20220329152926.50958-1-andriy.shevchenko@linux.intel.com>
 <20220329152926.50958-10-andriy.shevchenko@linux.intel.com>
 <94e888fe-d8fc-5379-302f-66d64f2ae10b@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <94e888fe-d8fc-5379-302f-66d64f2ae10b@baylibre.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: Andrew Lunn <andrew@lunn.ch>, Tomer Maimon <tmaimon77@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Linus Walleij <linus.walleij@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 linux-samsung-soc@vger.kernel.org, Benjamin Fair <benjaminfair@google.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Nancy Yuen <yuenn@google.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Alim Akhtar <alim.akhtar@samsung.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Qianggui Song <qianggui.song@amlogic.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 openbmc@lists.ozlabs.org
Subject: Re: [Linux-stm32] [PATCH v2 09/13] pinctrl: meson: Rename REG_* to
	MREG_*
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

T24gVHVlLCBNYXIgMjksIDIwMjIgYXQgMDY6MTM6MTlQTSArMDIwMCwgTmVpbCBBcm1zdHJvbmcg
d3JvdGU6Cj4gT24gMjkvMDMvMjAyMiAxNzoyOSwgQW5keSBTaGV2Y2hlbmtvIHdyb3RlOgo+ID4g
UmVuYW1lIFJFR18qIHRvICogYXMgYSBwcmVyZXF1aXNpdGUgZm9yIGVuYWJsaW5nIENPTVBJTEVf
VEVTVC4KPiAKPiBXaGF0IGVycm9yIGRvIHlvdSBoaXQgPwoKYXJjaC94ODYvaW5jbHVkZS9hc20v
YXJjaF9od2VpZ2h0Lmg6OToxNzogZXJyb3I6IGV4cGVjdGVkIGlkZW50aWZpZXIgYmVmb3JlIHN0
cmluZyBjb25zdGFudAo5IHwgI2RlZmluZSBSRUdfT1VUICJhIgogIHwgICAgICAgICAgICAgICAg
IF5+fgpkcml2ZXJzL3BpbmN0cmwvbWVzb24vcGluY3RybC1tZXNvbi5oOjY5Ojk6IG5vdGU6IGlu
IGV4cGFuc2lvbiBvZiBtYWNybyDigJhSRUdfT1VU4oCZCjY5IHwgICAgICAgICBSRUdfT1VULAoK
QW5kIHNvbWUgbW9yZS4KCj4gTVJFR18gaXMgcmF0aGVyIHVnbHksIHNvbWV0aGluZyBsaWtlIFBJ
TkNPTkZfUkVHXyBvciBtb3JlIHNpbXBsZXIgTUVTT05fUkVHXyB3b3VsZCBiZSBtb3JlIGFwcHJv
cHJpYXRlLgoKRmluZSB3aXRoIG1lLgoKLS0gCldpdGggQmVzdCBSZWdhcmRzLApBbmR5IFNoZXZj
aGVua28KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0
aW5mby9saW51eC1zdG0zMgo=
