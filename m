Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F7DB3135D
	for <lists+linux-stm32@lfdr.de>; Fri, 22 Aug 2025 11:37:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 66301C3F95A;
	Fri, 22 Aug 2025 09:37:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 57E9DC3F959
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Aug 2025 09:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755855462; x=1787391462;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=QgkFZGSFeP9Tyb5OkVgiydGAskriNxja1kg0ydQsDXg=;
 b=naRzsWM91Mp3pDnCsDgGcRBw/IdgpQ6aE9w8XYfQfnK9p9P+ryshEyOf
 lC9qv68KIbw9/B8VOVCmNSQvwOnHi+6i1qgldJTd2ZQKuICn4DD9XHS6D
 xQO03ptlsPwgRw7gJCsg6cYo6a1+vieo4Ml+kafFd1AFT8bBU1Kc8avf/
 iRouylDQ0ui4KULq/odhrRVHViSwfwqJwXGMJVVEa7eeOm/6BFqwgz3vJ
 OkGv/z7yP16rEfCRlCmz+Gc6zrbvoeuZ57oioesC2/zlvBleDgEAy7h83
 JfM7gNACQzmJ6bjh7yLlDbP8hmFwrOa/JGgMTVB+2LGkKPsx8lLXZfMLR g==;
X-CSE-ConnectionGUID: O2wNNFkNTZSayEQOh6elcg==
X-CSE-MsgGUID: e2xZqizETxCMIw5o+bCFRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="69599501"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="69599501"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 02:37:40 -0700
X-CSE-ConnectionGUID: a6JIz9UlT9KH8DjMxcDzxA==
X-CSE-MsgGUID: EEY/MKcBRMWw+7H5MhgVDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="167907690"
Received: from smile.fi.intel.com ([10.237.72.52])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 02:37:33 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
 (envelope-from <andriy.shevchenko@intel.com>)
 id 1upODB-00000007TlT-0od7; Fri, 22 Aug 2025 12:37:29 +0300
Date: Fri, 22 Aug 2025 12:37:28 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Dixit Parmar <dixitparmar19@gmail.com>
Message-ID: <aKg6WP361s6gcUTD@smile.fi.intel.com>
References: <20250822-enomam_logs-v1-0-db87f2974552@gmail.com>
 <CAHp75VeTD5Y1bi-jYyfRnCPDfB4=WO+QF1uK5MSaSq=oUUMFdQ@mail.gmail.com>
 <CAFmh=S3x+SsuW79MdN6gE66CSK7smvbBy=22j=c9jGVOns6PiA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFmh=S3x+SsuW79MdN6gE66CSK7smvbBy=22j=c9jGVOns6PiA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
Cc: imx@lists.linux.dev, Crt Mori <cmo@melexis.com>, linux-iio@vger.kernel.org,
 Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Haibo Chen <haibo.chen@nxp.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Lars-Peter Clausen <lars@metafoo.de>, Krzysztof Kozlowski <krzk@kernel.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 David Lechner <dlechner@baylibre.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>, Ray Jui <rjui@broadcom.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-samsung-soc@vger.kernel.org,
 Cai Huoqing <cai.huoqing@linux.dev>, Andreas Klinger <ak@it-klinger.de>,
 linux-arm-kernel@lists.infradead.org, Andy Shevchenko <andy@kernel.org>,
 Support Opensource <support.opensource@diasemi.com>,
 Scott Branden <sbranden@broadcom.com>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Jonathan Cameron <jic23@kernel.org>
Subject: Re: [Linux-stm32] [PATCH 00/10] iio: Drop unnecessary -ENOMEM
	messages
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

T24gRnJpLCBBdWcgMjIsIDIwMjUgYXQgMDI6NTg6MzRQTSArMDUzMCwgRGl4aXQgUGFybWFyIHdy
b3RlOgo+IE9uIEZyaSwgQXVnIDIyLCAyMDI1IGF0IDExOjQ54oCvQU0gQW5keSBTaGV2Y2hlbmtv
Cj4gPGFuZHkuc2hldmNoZW5rb0BnbWFpbC5jb20+IHdyb3RlOgo+ID4gSSBkb24ndCB1bmRlcnN0
YW5kLiBEb24ndCB5b3UgaGF2ZSBhIHN1YnNjcmlwdGlvbiB0byBsaW51eC1paW9AIE1MPwo+ID4g
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtaWlvL0NBSHA3NVZkTDlrVjJmeWk2M3pxUFpu
VzRDYWVZUG1KNzR0bUdFZ1U9TTdGU1lCdjB3d0BtYWlsLmdtYWlsLmNvbS9ULyN0Cj4gPiBJZiB5
b3UgZm91bmQgc29tZXRoaW5nIG5ldywgcGxlYXNlIGJhc2UgaXQgb24gdGhhdCBzZXJpZXMgYXMg
aXQgd2FzCj4gPiBhbHJlYWR5IHNlbnQgYW5kIHJldmlld2VkLgoKPiBUaGFua3MuIEkgZG8gaGF2
ZSBzdWJzY3JpcHRpb24gdG8gbGludXgtaWlvQE1MIGFuZCBkaWQgY2hlY2sgdGhlIHBhdGNoCj4g
c2VyaWVzIHlvdSBtZW50aW9uZWQuCj4gVGhhdCBwYXRjaCBzZXJpZXMgYnkgWGljaGFvIFpoYW8g
cmVtb3ZlcyBkZXZfZXJyX3Byb2JlKCkgZm9yIC1FTk9NRU0KPiBjYXNlcyB3aGVyZWFzCj4gdGhp
cyBzZXJpZXMgaXMgdGFyZ2V0aW5nIHNsaWdodGx5IGRpZmZlcmVudCBjbGVhbnVwIG9mIHJlbW92
aW5nIHRoZQo+IHBsYWluIGRldl9lcnIoKSBsb2cgbWVzc2FnZXMKPiB0aGF0IGFyZSB0aGVyZSBm
b3IgLUVOT01FTS4KCkkgc2VlLCBtYWtlcyBzZW5zZS4KCj4gQXMgZmFyIGFzIEkgY2FuIHNlZSwg
Ym90aCB0aGUgc2VyaWVzIGFyZSBtb2RpZnlpbmcgY29tcGxldGVseQo+IGRpZmZlcmVudCBkcml2
ZXIgZmlsZXMgd2l0aG91dCBvdmVybGFwcGluZyBjaGFuZ2VzLgo+IFNpbmNlIHRoZSBvYmplY3Rp
dmVzIGFyZSByZWxhdGVkIGJ1dCBpbmRlcGVuZGVudCBhbmQgYWRkcmVzc2luZwo+IGRpZmZlcmVu
dCB0eXBlIG9mIGNoYW5nZSwgSSB0aG91Z2h0IHRvIGtlZXAKPiB0aGVzZSBwYXRjaGVzIGluIGRp
ZmZlcmVudCBwYXRjaCBzZXJpZXMgYW5kIGhhdmUgY2xlYXIgZGlmZmVyZW50aWF0aW9uLgo+IEFs
dGhvdWdoIHRvIGVzdGFibGlzaCBzaW1pbGFyaXR5IGl0IHdvdWxkIGhhdmUgbWFkZSBtb3JlIHNl
bnNlIElmIEkKPiB3b3VsZCBoYXZlIGFkZGVkIHRoZSBsaW5rIHRvIHRoYXQgcGF0Y2ggc2VyaWVz
IGhlcmUuCgpXaXRoIHRoaXMgY2xhcmlmaWNhdGlvbiBpdCBpbmRlZWQgbWF5IGJlIGFwcGxpZWQg
aW5kZXBlbmRlbnRseS4KCi0tIApXaXRoIEJlc3QgUmVnYXJkcywKQW5keSBTaGV2Y2hlbmtvCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3Rt
MzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20K
aHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtc3RtMzIK
