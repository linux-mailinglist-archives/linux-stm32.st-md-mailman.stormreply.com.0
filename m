Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1059584B0
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Aug 2024 12:35:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B27FDC6DD66;
	Tue, 20 Aug 2024 10:35:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5F8EFCFAC50
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Aug 2024 10:35:14 +0000 (UTC)
X-CSE-ConnectionGUID: 94OiHQ+QRYi885zgsdbvag==
X-CSE-MsgGUID: 0tecvGpsRiCi2cr6gTlmIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="33102948"
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; d="scan'208";a="33102948"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 03:35:13 -0700
X-CSE-ConnectionGUID: jPFRCu2HTpiBmNIFCKNJFw==
X-CSE-MsgGUID: pNVVVqHdTHK/wYhkKlAIQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; d="scan'208";a="60745183"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 03:35:06 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andy@kernel.org>) id 1sgMCb-0000000HGUy-3xzl;
 Tue, 20 Aug 2024 13:35:01 +0300
Date: Tue, 20 Aug 2024 13:35:01 +0300
From: Andy Shevchenko <andy@kernel.org>
To: Philipp Stanner <pstanner@redhat.com>
Message-ID: <ZsRxVUmTpT5nHncc@smile.fi.intel.com>
References: <20240819165148.58201-2-pstanner@redhat.com>
 <20240819165148.58201-10-pstanner@redhat.com>
 <74e9109a-ac59-49e2-9b1d-d825c9c9f891@wanadoo.fr>
 <ZsOQPbVGQFtUYSww@smile.fi.intel.com>
 <419e91cb2b698a450497dfc1fb86f2c46eb7d8fb.camel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <419e91cb2b698a450497dfc1fb86f2c46eb7d8fb.camel@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Alvaro Karsz <alvaro.karsz@solid-run.com>, Tom Rix <trix@redhat.com>,
 Linus Walleij <linus.walleij@linaro.org>, Eric Dumazet <edumazet@google.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, onathan Corbet <corbet@lwn.net>,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-doc@vger.kernel.org,
 Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
 Jose Abreu <joabreu@synopsys.com>, linux-pci@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Wu Hao <hao.wu@intel.com>,
 Richard Cochran <richardcochran@gmail.com>, virtualization@lists.linux.dev,
 linux-block@vger.kernel.org, linux-gpio@vger.kernel.org,
 Mark Brown <broonie@kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Bjorn Helgaas <bhelgaas@google.com>, linux-arm-kernel@lists.infradead.org,
 Jens Axboe <axboe@kernel.dk>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Xu Yilun <yilun.xu@intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Moritz Fischer <mdf@kernel.org>,
 linux-fpga@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH 8/9] vdap: solidrun: Replace deprecated
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

T24gVHVlLCBBdWcgMjAsIDIwMjQgYXQgMTA6MTM6NDBBTSArMDIwMCwgUGhpbGlwcCBTdGFubmVy
IHdyb3RlOgo+IE9uIE1vbiwgMjAyNC0wOC0xOSBhdCAyMTozNCArMDMwMCwgQW5keSBTaGV2Y2hl
bmtvIHdyb3RlOgo+ID4gT24gTW9uLCBBdWcgMTksIDIwMjQgYXQgMDg6MTk6MjhQTSArMDIwMCwg
Q2hyaXN0b3BoZSBKQUlMTEVUIHdyb3RlOgo+ID4gPiBMZSAxOS8wOC8yMDI0IMOgIDE4OjUxLCBQ
aGlsaXBwIFN0YW5uZXIgYSDDqWNyaXTCoDoKCi4uLgoKPiA+ID4gVW5yZWxhdGVkIHRvIHRoZSBw
YXRjaCwgYnV0IGlzIGlzIHNhZmUgdG8gaGF2ZSAnbmFtZScgYmUgb24gdGhlCj4gPiA+IHN0YWNr
Pwo+ID4gPiAKPiA+ID4gcGNpbV9pb21hcF9yZWdpb24oKQo+ID4gPiAtLT4gX19wY2ltX3JlcXVl
c3RfcmVnaW9uKCkKPiA+ID4gLS0+IF9fcGNpbV9yZXF1ZXN0X3JlZ2lvbl9yYW5nZSgpCj4gPiA+
IC0tPiByZXF1ZXN0X3JlZ2lvbigpIG9yIF9fcmVxdWVzdF9tZW1fcmVnaW9uKCkKPiA+ID4gLS0+
IF9fcmVxdWVzdF9yZWdpb24oKQo+ID4gPiAtLT4gX19yZXF1ZXN0X3JlZ2lvbl9sb2NrZWQoKQo+
ID4gPiAtLT4gcmVzLT5uYW1lID0gbmFtZTsKPiA+ID4gCj4gPiA+IFNvIGFuIGFkZHJlc3Mgb24g
dGhlIHN0YWNrIGVuZHMgaW4gdGhlICduYW1lJyBmaWVsZCBvZiBhICJzdHJ1Y3QKPiA+ID4gcmVz
b3VyY2UiLgo+ID4gPiAKPiA+ID4gQWNjb3JkaW5nIHRvIGEgZmV3IGdyZXAsIGl0IGxvb2tzIHJl
YWxseSB1bnVzdWFsLgo+ID4gPiAKPiA+ID4gSSBkb24ndCBrbm93IGlmIGl0IGlzIHVzZWQsIGJ1
dCBpdCBsb29rcyBzdHJhbmdlIHRvIG1lLgo+ID4gCj4gPiBJdCBtaWdodCBiZSB1c2VkIHdoZW4g
cHJpbnRpbmcgL3Byb2MvaW9tZW0sIGJ1dCBJIGRvbid0IHJlbWVtYmVyIGJ5Cj4gPiBoZWFydC4K
PiA+IAo+ID4gPiBJZiBpdCBpcyBhbiBpc3N1ZSwgaXQgd2FzIGFwcGFyZW50bHkgYWxyZWFkeSB0
aGVyZSBiZWZvcmUgdGhpcwo+ID4gPiBwYXRjaC4KPiA+IAo+ID4gVGhpcyBzZXJpZXMgc2VlbXMg
dG8gcmV2ZWFsIGEgbG90IG9mIGlzc3VlcyB3aXRoIHRoZSBwcm9iZS9yZW1vdmUgaW4KPiA+IG1h
bnkKPiA+IGRyaXZlcnMuIEkgdGhpbmsgaXQncyBiZXR0ZXIgdG8gbWFrZSBmaXhlcyBvZiB0aGVt
IGJlZm9yZSB0aGlzIHNlcmllcwo+ID4gZm9yCj4gPiB0aGUgc2FrZSBvZiBlYXNpZXIgYmFja3Bv
cnRpbmcuCj4gCj4gSnVzdCBzbyB3ZSdyZSBpbiBzeW5jOgo+IEkgdGhpbmsgdGhlIG9ubHkgcmVh
bCBidWcgaGVyZSBzbyBmYXIgaXMgdGhlIG9uZSBmb3VuZCBieSBDaHJpc3RvcGhlLgo+IAo+IFRo
ZSB1c2FnZXMgb2YgcGNpX2Rpc2FibGVfZGV2aWNlKCksIHBjaW1faW91bm1hcF9yZWdpb25zKCkg
YW5kIHRoZSBsaWtlCj4gaW4gcmVtb3ZlKCkgYW5kIGVycm9yIHVud2luZCBwYXRocyBhcmUgbm90
IGVsZWdhbnQgYW5kIG1ha2UgZGV2cmVzIGtpbmQKPiBvZiB1c2VsZXNzIOKAkyBidXQgdGhleSBh
cmUgbm90IGJ1Z3MuIFNvIEkgd291bGRuJ3QgYmFja3BvcnQgdGhlbS4KCkFncmVlLgoKPiA+IElm
IGhlcmUgaXMgYSBwcm9ibGVtLCB0aGUgZGV2bV9rYXNwcmludGYoKSBzaG91bGQgYmUgdXNlZC4K
Ci0tIApXaXRoIEJlc3QgUmVnYXJkcywKQW5keSBTaGV2Y2hlbmtvCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0
CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
