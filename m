Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6E495729C
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Aug 2024 20:05:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6A9FEC6DD72;
	Mon, 19 Aug 2024 18:05:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3E05CC5E2CD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Aug 2024 18:04:57 +0000 (UTC)
X-CSE-ConnectionGUID: N7oueTVATXGoU30wVXDoog==
X-CSE-MsgGUID: 1zLqQTzlSJqG+VhXSA1iAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="22533085"
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; d="scan'208";a="22533085"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 11:04:54 -0700
X-CSE-ConnectionGUID: tSCzEHZcRx6b1ETz2cciBg==
X-CSE-MsgGUID: kxzUu48nQpaoQdK3Fh2GyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; d="scan'208";a="91187343"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 11:04:46 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andy@kernel.org>) id 1sg6kC-0000000H1wA-3FW0;
 Mon, 19 Aug 2024 21:04:40 +0300
Date: Mon, 19 Aug 2024 21:04:40 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Philipp Stanner <pstanner@redhat.com>
Message-ID: <ZsOJONEA2x93bSpO@smile.fi.intel.com>
References: <20240819165148.58201-2-pstanner@redhat.com>
 <20240819165148.58201-6-pstanner@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240819165148.58201-6-pstanner@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Alvaro Karsz <alvaro.karsz@solid-run.com>, Tom Rix <trix@redhat.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-pci@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, linux-stm32@st-md-mailman.stormreply.com,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, onathan Corbet <corbet@lwn.net>,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-doc@vger.kernel.org,
 Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Wu Hao <hao.wu@intel.com>,
 Chaitanya Kulkarni <kch@nvidia.com>,
 Richard Cochran <richardcochran@gmail.com>, virtualization@lists.linux.dev,
 linux-block@vger.kernel.org, linux-gpio@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Moritz Fischer <mdf@kernel.org>,
 Hannes Reinecke <hare@suse.de>, Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Bjorn Helgaas <bhelgaas@google.com>, linux-arm-kernel@lists.infradead.org,
 Jens Axboe <axboe@kernel.dk>, David Lechner <dlechner@baylibre.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Xu Yilun <yilun.xu@intel.com>,
 Damien Le Moal <dlemoal@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-fpga@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH 4/9] block: mtip32xx: Replace deprecated
	PCI functions
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

T24gTW9uLCBBdWcgMTksIDIwMjQgYXQgMDY6NTE6NDRQTSArMDIwMCwgUGhpbGlwcCBTdGFubmVy
IHdyb3RlOgo+IHBjaW1faW9tYXBfcmVnaW9ucygpIGFuZCBwY2ltX2lvbWFwX3RhYmxlKCkgaGF2
ZSBiZWVuIGRlcHJlY2F0ZWQgYnkgdGhlCj4gUENJIHN1YnN5c3RlbSBpbiBjb21taXQgZTM1NGJi
ODRhNGMxICgiUENJOiBEZXByZWNhdGUKPiBwY2ltX2lvbWFwX3RhYmxlKCksIHBjaW1faW9tYXBf
cmVnaW9uc19yZXF1ZXN0X2FsbCgpIikuCj4gCj4gSW4gbXRpcDMyeHgsIHRoZXNlIGZ1bmN0aW9u
cyBjYW4gZWFzaWx5IGJlIHJlcGxhY2VkIGJ5IHRoZWlyIHJlc3BlY3RpdmUKPiBzdWNjZXNzb3Jz
LCBwY2ltX3JlcXVlc3RfcmVnaW9uKCkgYW5kIHBjaW1faW9tYXAoKS4gTW9yZW92ZXIsIHRoZQo+
IGRyaXZlcidzIGNhbGwgdG8gcGNpbV9pb3VubWFwX3JlZ2lvbnMoKSBpcyBub3QgbmVjZXNzYXJ5
LCBiZWNhdXNlIGl0J3MKPiBpbnZva2VkIGluIHRoZSByZW1vdmUoKSBmdW5jdGlvbi4gQ2xlYW51
cCBjYW4sIGhlbmNlLCBiZSBwZXJmb3JtZWQgYnkKPiBQQ0kgZGV2cmVzIGF1dG9tYXRpY2FsbHku
Cj4gCj4gUmVwbGFjZSBwY2ltX2lvbWFwX3JlZ2lvbnMoKSBhbmQgcGNpbV9pb21hcF90YWJsZSgp
Lgo+IAo+IFJlbW92ZSB0aGUgY2FsbCB0byBwY2ltX2lvdW5tYXBfcmVnaW9ucygpLgoKLi4uCgpp
bnQgbXRpcF9wY2lfcHJvYmUoKQoKPiAgc2V0bWFza19lcnI6Cj4gLQlwY2ltX2lvdW5tYXBfcmVn
aW9ucyhwZGV2LCAxIDw8IE1USVBfQUJBUik7Cj4gKwlwY2ltX3JlbGVhc2VfcmVnaW9uKHBkZXYs
IE1USVBfQUJBUik7CgpCdXQgd2h5PwoKLi4uCgptdGlwX3BjaV9yZW1vdmUoKQoKPiAgCXBjaV9k
aXNhYmxlX21zaShwZGV2KTsKPiAgCj4gLQlwY2ltX2lvdW5tYXBfcmVnaW9ucyhwZGV2LCAxIDw8
IE1USVBfQUJBUik7CgpUaGlzIGlzIG9rYXkuCgouLi4KCj4gIAlwY2lfc2V0X2RydmRhdGEocGRl
diwgTlVMTCk7CgpTaWRlIG5vdGU6IFRoaXMgaXMgZG9uZSBieSBkcml2ZXIgY29yZSBmb3IgdGhl
IGxhc3QgMTArIHllYXJz4oCmCgotLSAKV2l0aCBCZXN0IFJlZ2FyZHMsCkFuZHkgU2hldmNoZW5r
bwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXN0bTMyCg==
