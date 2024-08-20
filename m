Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 974F9958474
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Aug 2024 12:28:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 387D5C6DD66;
	Tue, 20 Aug 2024 10:28:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 779C8C6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Aug 2024 10:28:33 +0000 (UTC)
X-CSE-ConnectionGUID: P/UA2JevR2WieTDLCD44zw==
X-CSE-MsgGUID: fXV4DuG6RBSIzcUpI4+nZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="26306106"
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; d="scan'208";a="26306106"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 03:28:31 -0700
X-CSE-ConnectionGUID: i2TeOzYIRg25kacmae/h/Q==
X-CSE-MsgGUID: FG1tjdHOT4uS3xW62Fnj5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; d="scan'208";a="60664479"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 03:28:23 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andy@kernel.org>) id 1sgM65-0000000HGOZ-3tRE;
 Tue, 20 Aug 2024 13:28:17 +0300
Date: Tue, 20 Aug 2024 13:28:17 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Philipp Stanner <pstanner@redhat.com>
Message-ID: <ZsRvwVCzpLEQovmU@smile.fi.intel.com>
References: <20240819165148.58201-2-pstanner@redhat.com>
 <20240819165148.58201-6-pstanner@redhat.com>
 <ZsOJONEA2x93bSpO@smile.fi.intel.com>
 <e406ba06180571564b47872f090623b19e4ad87e.camel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e406ba06180571564b47872f090623b19e4ad87e.camel@redhat.com>
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

T24gVHVlLCBBdWcgMjAsIDIwMjQgYXQgMDk6Mjk6NTJBTSArMDIwMCwgUGhpbGlwcCBTdGFubmVy
IHdyb3RlOgo+IE9uIE1vbiwgMjAyNC0wOC0xOSBhdCAyMTowNCArMDMwMCwgQW5keSBTaGV2Y2hl
bmtvIHdyb3RlOgo+ID4gT24gTW9uLCBBdWcgMTksIDIwMjQgYXQgMDY6NTE6NDRQTSArMDIwMCwg
UGhpbGlwcCBTdGFubmVyIHdyb3RlOgoKLi4uCgo+ID4gaW50IG10aXBfcGNpX3Byb2JlKCkKPiA+
IAo+ID4gPiDCoHNldG1hc2tfZXJyOgo+ID4gPiAtCXBjaW1faW91bm1hcF9yZWdpb25zKHBkZXYs
IDEgPDwgTVRJUF9BQkFSKTsKPiA+ID4gKwlwY2ltX3JlbGVhc2VfcmVnaW9uKHBkZXYsIE1USVBf
QUJBUik7Cj4gPiAKPiA+IEJ1dCB3aHk/Cj4gCj4gRU1PUkVJTkZPUkVRVUlSRUQKPiBXaHkgSSBy
ZXBsYWNlIGl0IG9yIHdoeSBJIGRvbid0IHJlbW92ZSBpdCBjb21wbGV0ZWx5PwoKVGhlIGxhdHRl
ciBvbmU6IFdoeSBkaWQgeW91IGxlYXZlIGl0IGFuZCBub3QgcmVtb3ZlPwoKLi4uCgo+ID4gbXRp
cF9wY2lfcmVtb3ZlKCkKPiA+IAo+ID4gPiDCoAlwY2lfZGlzYWJsZV9tc2kocGRldik7Cj4gPiA+
IMKgCj4gPiA+IC0JcGNpbV9pb3VubWFwX3JlZ2lvbnMocGRldiwgMSA8PCBNVElQX0FCQVIpOwo+
ID4gCj4gPiBUaGlzIGlzIG9rYXkuCj4gCj4gUmVtb3ZpbmcgaXQgaXMgb2theSwgeW91IG1lYW4u
CgpZZXMhCgouLi4KCj4gPiA+IMKgCXBjaV9zZXRfZHJ2ZGF0YShwZGV2LCBOVUxMKTsKPiA+IAo+
ID4gU2lkZSBub3RlOiBUaGlzIGlzIGRvbmUgYnkgZHJpdmVyIGNvcmUgZm9yIHRoZSBsYXN0IDEw
KyB5ZWFyc+KApgo+IAo+IEFoIHlvdSBrbm93IEFuZHksIGtlcm5lbCBwcm9ncmFtbWVycyBiZSBs
aWtlOiAiV2hlbiB5b3UncmUgaHVudGluZyB5b3UKPiBiZXR0ZXIgbWFrZSBzdXJlIHRoZSB3aWxk
IHNvdyBpcyByZWFsbHkgZGVhZCBiZWZvcmUgeW91IGxvYWQgaXQgaW4geW91cgo+IHRydW5rIiA7
cAoKSW5kZWVkLCBJIGhhZCBiZWVuIHRvbGQgbWFueSB0aW1lcyBteXNlbGYgdG8gaW1wcm92ZSAv
IGNsZWFudXAgdGhpbmdzIHVucmVsYXRlZAp0byB0aGUgd29ya2luZyBhcmVhIGJlZm9yZSBhY3R1
YWxseSBjb25zaWRlcmluZyBteSBsaXR0bGUgd29yay4uLgoKQnV0LCBJIHNwZWNpZmljYWxseSBt
YXJrIGl0IGFzIGEgIlNpZGUgbm90ZToiLCBzbyBpdCdzIHVwIHRvIHlvdSB0byBhZGRyZXNzCm9y
IG5vdC4KCi0tIApXaXRoIEJlc3QgUmVnYXJkcywKQW5keSBTaGV2Y2hlbmtvCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGlu
ZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9z
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
