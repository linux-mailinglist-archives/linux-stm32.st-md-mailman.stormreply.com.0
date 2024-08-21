Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2447B959ADD
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Aug 2024 13:56:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C18C1C6DD9D;
	Wed, 21 Aug 2024 11:56:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 255E5C6C83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Aug 2024 11:55:52 +0000 (UTC)
X-CSE-ConnectionGUID: kn6yS73gSP21j6WAZfEGoQ==
X-CSE-MsgGUID: jHfoh0+nSPixg8fZQTEgqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="26463247"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="26463247"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 04:55:50 -0700
X-CSE-ConnectionGUID: HStPPOxdS8Ck/2Tx3xAuhg==
X-CSE-MsgGUID: Jz531zfFTbKXF2EHryWZDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="65758961"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 04:55:43 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andy.shevchenko@gmail.com>)
 id 1sgjwA-000000003O8-2q1s; Wed, 21 Aug 2024 14:55:38 +0300
Date: Wed, 21 Aug 2024 14:55:38 +0300
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Philipp Stanner <pstanner@redhat.com>
Message-ID: <ZsXVuq2jthHoTHPO@smile.fi.intel.com>
References: <20240821071842.8591-2-pstanner@redhat.com>
 <20240821071842.8591-8-pstanner@redhat.com>
 <CAHp75VduuT=VLtXS+zha4ZNe3ZvBV-jgZpn2oP4WkzDdt6Pnog@mail.gmail.com>
 <be1c2f6fb63542ccdcb599956145575293625c37.camel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <be1c2f6fb63542ccdcb599956145575293625c37.camel@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Alvaro Karsz <alvaro.karsz@solid-run.com>, Tom Rix <trix@redhat.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-pci@vger.kernel.org,
 Keith Busch <kbusch@kernel.org>, Eric Dumazet <edumazet@google.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Jonathan Corbet <corbet@lwn.net>,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-doc@vger.kernel.org,
 Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Wu Hao <hao.wu@intel.com>,
 Richard Cochran <richardcochran@gmail.com>, virtualization@lists.linux.dev,
 linux-block@vger.kernel.org, linux-gpio@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Moritz Fischer <mdf@kernel.org>,
 Hannes Reinecke <hare@suse.de>, Bjorn Helgaas <bhelgaas@google.com>,
 linux-arm-kernel@lists.infradead.org, Jens Axboe <axboe@kernel.dk>,
 David Lechner <dlechner@baylibre.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Xu Yilun <yilun.xu@intel.com>,
 Damien Le Moal <dlemoal@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-fpga@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH v2 6/9] ethernet: stmicro: Simplify PCI
	devres usage
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

T24gV2VkLCBBdWcgMjEsIDIwMjQgYXQgMTE6MzY6MzZBTSArMDIwMCwgUGhpbGlwcCBTdGFubmVy
IHdyb3RlOgo+IE9uIFdlZCwgMjAyNC0wOC0yMSBhdCAxMToxNCArMDMwMCwgQW5keSBTaGV2Y2hl
bmtvIHdyb3RlOgo+ID4gT24gV2VkLCBBdWcgMjEsIDIwMjQgYXQgMTA6MTnigK9BTSBQaGlsaXBw
IFN0YW5uZXIKPiA+IDxwc3Rhbm5lckByZWRoYXQuY29tPiB3cm90ZToKCi4uLgoKPiA+ID4gLcKg
wqDCoMKgwqDCoCBmb3IgKGkgPSAwOyBpIDwgUENJX1NURF9OVU1fQkFSUzsgaSsrKSB7Cj4gPiA+
IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChwY2lfcmVzb3VyY2VfbGVuKHBkZXYs
IGkpID09IDApCj4gPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBjb250aW51ZTsKPiA+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcGNpbV9p
b3VubWFwX3JlZ2lvbnMocGRldiwgQklUKGkpKTsKPiA+IAo+ID4gSGVyZSBpcyB0aGUgQkFSeCwg
d2hpY2ggY29udHJhZGljdHMgdGhlIHByb2JlIDotKQo+IAo+IEknbSBub3Qgc3VyZSB3aGF0IHNo
b3VsZCBiZSBkb25lIGFib3V0IGl0LiBUaGUgb25seSBpbnRlcmVzdGluZwo+IHF1ZXN0aW9uIGlz
IHdoZXRoZXIgdGhlIG90aGVyIGNvZGUgd2l0aCBwY2ltX2lvbWFwX3JlZ2lvbnMoLi4uIEJJVChp
KQo+IGRvZXMgYWxzbyBvbmx5IGdyYXAgQkFSIDAuCj4gSW4gdGhhdCBjYXNlIHRoZSBkcml2ZXIg
d291bGRuJ3QgZXZlbiBiZSBrbm93aW5nIHdoYXQgaXRzIG93biBoYXJkd2FyZQo+IGlzIC8gZG9l
cywgdGhvdWdoLgoKSSB0aGluayB5b3VyIHBhdGNoIGRvZXMgdGhlIHJpZ2h0IHRoaW5nIGFscmVh
ZHkuCgo+ID4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBicmVhazsKPiA+ID4gLcKg
wqDCoMKgwqDCoCB9CgotLSAKV2l0aCBCZXN0IFJlZ2FyZHMsCkFuZHkgU2hldmNoZW5rbwoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMy
IG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0
dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXN0bTMyCg==
