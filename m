Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D2EEF693271
	for <lists+linux-stm32@lfdr.de>; Sat, 11 Feb 2023 17:33:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 84FA0C6A5EF;
	Sat, 11 Feb 2023 16:33:11 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CC02CC0D2C0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 11 Feb 2023 16:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676133189; x=1707669189;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=OMMsvl+bUPjHIfFs5mz9bCDS3SOP8YrQweMO/MZJftc=;
 b=PN0Tfy78R66OIvOn6P8TC1GowEta3xiCAB6/GPJj7Y3i5fsqmqI0+zCE
 BZiQf4ObhR7TBE5RIXxfV4qUMiE6oIORb5EJSp40ne/wrFQEPc1joT6pQ
 lem4p6DGi68Uc0qVNXQwCusUY6pXwms9z6NHTopVKDy9eg5/U+HUUYQqb
 VNwkuPvlLPX+hVVptU4kF9l+KeR7zTErOJXfZFcG6wwL1mO0IH56Om4KU
 +kIrQvv9S1XcMmLQ+1F0fhH3qrNnl29B9+NoseYB02TV2vNFugc0VJUzF
 +E2wiEgfAiFfGiaMlFgIKAjWN9HCkiW7hu1LV+4UfSVdjgi4dKqv5Zt03 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10618"; a="314267313"
X-IronPort-AV: E=Sophos;i="5.97,290,1669104000"; d="scan'208";a="314267313"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2023 08:33:06 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10618"; a="732029288"
X-IronPort-AV: E=Sophos;i="5.97,290,1669104000"; d="scan'208";a="732029288"
Received: from ajaymv-mobl1.gar.corp.intel.com ([10.215.205.181])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2023 08:32:51 -0800
Message-ID: <258dedb542d4dcb73e9ec903d205ba64639c9f0a.camel@linux.intel.com>
From: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Ricardo Neri
 <ricardo.neri-calderon@linux.intel.com>
Date: Sat, 11 Feb 2023 08:32:48 -0800
In-Reply-To: <9a121d43-b6d9-fe99-1e4c-498dac2e6b17@linaro.org>
References: <20230206153432.1017282-1-daniel.lezcano@linaro.org>
 <20230211021023.GA13306@ranerica-svr.sc.intel.com>
 <9a121d43-b6d9-fe99-1e4c-498dac2e6b17@linaro.org>
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
Cc: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
 Amit Kucheria <amitk@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Guillaume La Roque <glaroque@baylibre.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Fabio Estevam <festevam@gmail.com>,
 "moderated list:ARM/STM32
 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>,
 "open list:RENESAS R-CAR THERMAL DRIVERS" <linux-renesas-soc@vger.kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>, Haowen Bai <baihaowen@meizu.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, rafael.j.wysocki@intel.com,
 Minghao Chi <chi.minghao@zte.com.cn>, Jonathan Hunter <jonathanh@nvidia.com>,
 Andy Gross <agross@kernel.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 NXP Linux Team <linux-imx@nxp.com>, ye xingchen <ye.xingchen@zte.com.cn>,
 Zhang Rui <rui.zhang@intel.com>, Thara Gopinath <thara.gopinath@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-pm@vger.kernel.org,
 Ray Jui <rjui@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 "open list:SAMSUNG THERMAL DRIVER" <linux-samsung-soc@vger.kernel.org>,
 "moderated list:BROADCOM
 BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>,
 "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
 "open list:THERMAL DRIVER FOR AMLOGIC
 SOCS" <linux-amlogic@lists.infradead.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, Scott Branden <sbranden@broadcom.com>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Niklas =?ISO-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
 Shawn Guo <shawnguo@kernel.org>
Subject: Re: [Linux-stm32] [PATCH] thermal: Remove core header inclusion
	from drivers
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

T24gU2F0LCAyMDIzLTAyLTExIGF0IDA4OjUzICswMTAwLCBEYW5pZWwgTGV6Y2FubyB3cm90ZToK
PiBPbiAxMS8wMi8yMDIzIDAzOjEwLCBSaWNhcmRvIE5lcmkgd3JvdGU6Cj4gPiBPbiBNb24sIEZl
YiAwNiwgMjAyMyBhdCAwNDozNDoyOVBNICswMTAwLCBEYW5pZWwgTGV6Y2FubyB3cm90ZToKPiA+
ID4gQXMgdGhlIG5hbWUgc3RhdGVzICJ0aGVybWFsX2NvcmUuaCIgaXMgdGhlIGhlYWRlciBmaWxl
IGZvciB0aGUKPiA+ID4gY29yZQo+ID4gPiBjb21wb25lbnRzIG9mIHRoZSB0aGVybWFsIGZyYW1l
d29yay4KPiA+ID4gCj4gPiA+IFRvbyBtYW55IGRyaXZlcnMgYXJlIGluY2x1ZGluZyBpdC4gSG9w
ZWZ1bGx5IHRoZSByZWNlbnQgY2xlYW51cHMKPiA+ID4gaGVscGVkIHRvIHNlbGYgZW5jYXBzdWxh
dGUgdGhlIGNvZGUgYSBiaXQgbW9yZSBhbmQgcHJldmVudGVkIHRoZQo+ID4gPiBkcml2ZXJzIHRv
IG5lZWQgdGhpcyBoZWFkZXIuCj4gPiA+IAo+ID4gPiBSZW1vdmUgdGhpcyBpbmNsdXNpb24gaW4g
ZXZlcnkgcGxhY2Ugd2hlcmUgaXQgaXMgcG9zc2libGUuCj4gPiA+IAo+ID4gPiBTb21lIG90aGVy
IGRyaXZlcnMgZGlkIGEgY29uZnVzaW9uIHdpdGggdGhlIGNvcmUgaGVhZGVyIGFuZCB0aGUKPiA+
ID4gb25lCj4gPiA+IGV4cG9ydGVkIGluIGxpbnV4L3RoZXJtYWwuaC4gVGhleSBpbmNsdWRlIHRo
ZSBmb3JtZXIgaW5zdGVhZCBvZgo+ID4gPiB0aGUKPiA+ID4gbGF0dGVyLiBUaGUgY2hhbmdlcyBh
bHNvIGZpeCB0aGlzLgo+ID4gPiAKPiA+ID4gVGhlIHRlZ3JhL3NvY3RoZXJtIGRyaXZlciBzdGls
bCByZW1haW5zIGFzIGl0IHVzZXMgYW4gaW50ZXJuYWwKPiA+ID4gZnVuY3Rpb24gd2hpY2ggbmVl
ZCB0byBiZSByZXBsYWNlZC4KPiA+ID4gCj4gPiA+IFRoZSBJbnRlbCBIRkkgZHJpdmVyIHVzZXMg
dGhlIG5ldGxpbmsgaW50ZXJuYWwgZnJhbWV3b3JrIGNvcmUgYW5kCj4gPiA+IHNob3VsZCBiZSBj
aGFuZ2VkIHRvIHByZXZlbnQgdG8gZGVhbCB3aXRoIHRoZSBpbnRlcm5hbHMuCj4gPiAKPiA+IEkg
ZG9uJ3Qgc2VlIGFueSBvZiB0aGUgdGhlcm1hbCBuZXRsaW5rIGZ1bmN0aW9uYWxpdHkgZXhwb3Nl
ZC4gSXMKPiA+IHRoZXJlIGFueSB3b3JrIGluIHByb2dyZXNzPwo+IAo+IGNvbW1pdCBiZDMwY2Rm
ZDliZDczYjY4ZTQ5NzdjZTdjNTU0MGFhN2IxNGMyNWNkCj4gQXV0aG9yOiBTcmluaXZhcyBQYW5k
cnV2YWRhIDxzcmluaXZhcy5wYW5kcnV2YWRhQGxpbnV4LmludGVsLmNvbT4KPiAKPiDCoMKgwqDC
oCB0aGVybWFsOiBpbnRlbDogaGZpOiBOb3RpZnkgdXNlciBzcGFjZSBmb3IgSEZJIGV2ZW50cwo+
IApUaGlzIGlzIGFscmVhZHkgZXhwb3NlZCBhbmQgd2UgdXNlIGl0IGluIHVzZXIgc3BhY2UuCnRo
ZXJtYWxfZ2VubF9jcHVfY2FwYWJpbGl0eV9ldmVudCgpIGlzIGNhbGxlZCBmcm9tIGludGVsX2hm
aSBkcml2ZXIgdG8Kc2VuZCB0aGUgY3B1IGNhcGFiaWxpdGllcy4KCk5vdCBzdXJlIHdoYXQgZG8g
eW91IG1lYW4gYnkgICJkb24ndCBzZWUgbmV0bGluayBmdW5jdGlvbmFsaXR5CmV4cG9zZWQiPwoK
dGhlcm1hbF9nZW5sX2NwdV9jYXBzIHN0cnVjdCBhbmQgdGhlcm1hbF9nZW5sX2NwdV9jYXBhYmls
aXR5X2V2ZW50KCkKYXJlIGRlZmluZWQgaW4gZHJpdmVycy90aGVybWFsL3RoZXJtYWxfbmV0bGlu
ay5oLgoKClRoYW5rcywKU3Jpbml2YXMKCgo+IAo+ID4gRldJVywgQWNrZWQtYnk6IFJpY2FyZG8g
TmVyaQo+ID4gPHJpY2FyZG8ubmVyaS1jYWxkZXJvbkBsaW51eC5pbnRlbC5jb20+Cj4gCj4gVGhh
bmtzIQo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlz
dGluZm8vbGludXgtc3RtMzIK
