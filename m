Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC8550E616
	for <lists+linux-stm32@lfdr.de>; Mon, 25 Apr 2022 18:45:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1249FC628C0;
	Mon, 25 Apr 2022 16:45:10 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 740AAC6047D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 Apr 2022 05:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650431835; x=1681967835;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=l0WdwVsUeyccH1Fn1OB0E52YvfyFMuwl2zNyTg/ZU5E=;
 b=TrKq2kDQIQNdt+OFZPIuCksNxrUJAc00w35Tjayu0kwp/GbRedIJXNxC
 K+QdU5t9uAYP8JTzYpwx6HPbjfYQHQwkEA+UV355R0eGX5sweQc76X0V2
 adSa3ZonlmUOv62myWcC+9l0mbDYhp4E4C6j36F0eSTXObnE8m3sFUcSt
 cg8CokweTIeFXfBUpzUaVVRVQTgITujssGnB5qTklg7CL72LVKUzPBoQg
 brjyergCMBW5huZLveZdySZiTfp4ptkdu2QyITMKaroA893/gHiVjg85n
 AYRHaU47vIL55CT5QLY9UHlvxWljeExp5IwaQziknQ7jwY2psYVwtn8Dn g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10322"; a="263404943"
X-IronPort-AV: E=Sophos;i="5.90,274,1643702400"; d="scan'208";a="263404943"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2022 22:17:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,274,1643702400"; d="scan'208";a="804919014"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga006.fm.intel.com with ESMTP; 19 Apr 2022 22:17:12 -0700
Received: from linux.intel.com (ssid-ilbpg3-teeminta.png.intel.com
 [10.88.227.74])
 (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 5DCF85807D2;
 Tue, 19 Apr 2022 22:17:08 -0700 (PDT)
Date: Wed, 20 Apr 2022 13:15:08 +0800
From: Tan Tee Min <tee.min.tan@linux.intel.com>
To: Richard Cochran <richardcochran@gmail.com>
Message-ID: <20220420051508.GA18173@linux.intel.com>
References: <20220413040115.2351987-1-tee.min.tan@intel.com>
 <20220413125915.GA667752@hoboy.vegasvil.org>
 <20220414072934.GA10025@linux.intel.com>
 <20220414104259.0b928249@kernel.org>
 <20220419005220.GA17634@linux.intel.com>
 <20220419132853.GA19386@hoboy.vegasvil.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220419132853.GA19386@hoboy.vegasvil.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Mailman-Approved-At: Mon, 25 Apr 2022 16:45:09 +0000
Cc: Song Yoong Siang <yoong.siang.song@intel.com>, linux-kernel@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Voon Wei Feng <weifeng.voon@intel.com>,
 Wong Vee Khee <vee.khee.wong@intel.com>, netdev@vger.kernel.org,
 Tan Tee Min <tee.min.tan@intel.com>,
 Rayagond Kokatanur <rayagond@vayavyalabs.com>, stable@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net 1/1] net: stmmac: add fsleep() in HW
 Rx timestamp checking loop
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

T24gVHVlLCBBcHIgMTksIDIwMjIgYXQgMDY6Mjg6NTNBTSAtMDcwMCwgUmljaGFyZCBDb2NocmFu
IHdyb3RlOgo+IE9uIFR1ZSwgQXByIDE5LCAyMDIyIGF0IDA4OjUyOjIwQU0gKzA4MDAsIFRhbiBU
ZWUgTWluIHdyb3RlOgo+IAo+ID4gSSBhZ3JlZSB0aGF0IHRoZSBmc2xlZXAoMSkgKD0xdXMpIGlz
IGEgYmlnIGhhbW1lci4KPiA+IFRodXMgaW4gb3JkZXIgdG8gaW1wcm92ZSB0aGlzLCBJ4oCZdmUg
ZmlndXJlZCBvdXQgYSBzbWFsbGVyIGRlbGF5Cj4gPiB0aW1lIHRoYXQgaXMgZW5vdWdoIGZvciB0
aGUgY29udGV4dCBkZXNjcmlwdG9yIHRvIGJlIHJlYWR5IHdoaWNoCj4gPiBpcyBuZGVsYXkoNTAw
KSAoPTUwMG5zKS4KPiAKPiBXaHkgaXNuJ3QgdGhlIGNvbnRleHQgZGVzY3JpcHRvciByZWFkeT8K
PiAKPiBJIG1lYW4sIHRoZSBmcmFtZSBhbHJlYWR5IGJlbG9uZ3MgdG8gdGhlIENQVSwgcmlnaHQ/
CgpOby4gVGhlIGNvbnRleHQgZGVzY3JpcHRvciAoZnJhbWUpIGlzIHBvc3NpYmx5IHN0aWxsIG93
bmVkIGJ5IHRoZQpETUEgY29udHJvbGxlciBpbiB0aGlzIHNpdHVhdGlvbi4KVGhpcyBpcyB3aHkg
YSBsb29waW5nIGluIHRoZSBvcmlnaW5hbCBjb2RlIHRvIHdhaXQgZm9yIHRoZSBkZXNjcmlwdG9y
CnRvIGJlIG93bmVkIGJ5IHRoZSBhcHBsaWNhdGlvbiBDUFUuIEhvd2V2ZXIsIHdoZW4gTkFQSSBp
cyBidXN5IHBvbGxpbmcsCnRoZSBjb250ZXh0IGRlc2NyaXB0b3IgbWlnaHQgYmUgc3RpbGwgb3du
ZWQgYnkgdGhlIERNQSBjb250cm9sbGVyIGV2ZW4KYWZ0ZXIgdGhlIGxvb3BpbmcuCgpUaHVzLCB3
ZSBhcmUgYWRkaW5nIGFuIGFkZGl0aW9uYWwgbmFub3NlY29uZCBkZWxheSBpbnNpZGUgdGhlIGxv
b3AsCnNvIHRoYXQgdGhlIERNQSBjb250cm9sbGVyIGNhbiBnZXQgYSBzaG9ydCBtb21lbnQgdG8g
YnJlYXRoZSBhbmQKY29tcGxldGUgdGhlIGNvbnRleHQgZGVzY3JpcHRvci4KClRoYW5rcywKVGVl
IE1pbgoKPiAKPiBUaGFua3MsCj4gUmljaGFyZApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJA
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
