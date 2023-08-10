Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E5A7774EB
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Aug 2023 11:52:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 10E3BC6B469;
	Thu, 10 Aug 2023 09:52:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E680FC6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Aug 2023 09:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691661161; x=1723197161;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=0QXCdnIeDvNVhe3zDIXfKLHqjJhkR646hmb6U9XbWSc=;
 b=dPn9uXQl3jcOX4YfafL6bYvgec3NwRkGk3KcjHCW4fR/LedJY3XGXGUR
 KNcGwAJbjZzz2FN7w2kmzCeHBlDBsVirf0Qm1ElhEbLCBodurZYoaLMHI
 YLunCGNae3Rnwo+Gq7IHKGHI8TmlPX6KzOoJuMu7UT4+NmOMjLFp+jXJ8
 RNP1Jh6O+9UHETpUhmJ6cVJoBoZVTWRWt5Wok4qkj8gmWaXLr+CUKZhqb
 3jGCw75Ozb4hHGmrnN+M3+OAes1sTxExiuy31phQHzs/fEC1p1roxO0tE
 IS1s7IfTZ2AEysOLOuuTc0LfOZv5SiwePEm4zRxkyyLUfTSTN29pDMEyf g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="368810609"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; d="scan'208";a="368810609"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2023 02:52:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="732142399"
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; d="scan'208";a="732142399"
Received: from choongyo-mobl.gar.corp.intel.com (HELO [10.213.42.193])
 ([10.213.42.193])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2023 02:52:13 -0700
Message-ID: <5e113258-7cb4-e503-5009-e46cd3aa5bee@linux.intel.com>
Date: Thu, 10 Aug 2023 17:52:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Content-Language: en-US
To: Andrew Lunn <andrew@lunn.ch>
References: <20230804084527.2082302-1-yong.liang.choong@linux.intel.com>
 <5bd05ba2-fd88-4e5c-baed-9971ff917484@lunn.ch>
From: Choong Yong Liang <yong.liang.choong@linux.intel.com>
In-Reply-To: <5bd05ba2-fd88-4e5c-baed-9971ff917484@lunn.ch>
Cc: Voon Wei Feng <weifeng.voon@intel.com>, Alexei Starovoitov <ast@kernel.org>,
 Jesse Brandeburg <jesse.brandeburg@intel.com>,
 Lai Peter Jun Ann <jun.ann.lai@intel.com>, Eric Dumazet <edumazet@google.com>,
 David E Box <david.e.box@linux.intel.com>, Shenwei Wang <shenwei.wang@nxp.com>,
 Jon Hunter <jonathanh@nvidia.com>, linux-stm32@st-md-mailman.stormreply.com,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 =?UTF-8?Q?Marek_Beh=c3=ban?= <kabel@kernel.org>,
 Tan Tee Min <tee.min.tan@linux.intel.com>,
 Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Wong Vee Khee <veekhee@apple.com>,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Andrey Konovalov <andrey.konovalov@linaro.org>,
 Guenter Roeck <linux@roeck-us.net>, Jose Abreu <Jose.Abreu@synopsys.com>,
 Jean Delvare <jdelvare@suse.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Richard Cochran <richardcochran@gmail.com>, Mark Gross <markgross@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, Revanth Kumar Uppala <ruppala@nvidia.com>,
 Jochen Henneberg <jh@henneberg-systemdesign.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 platform-driver-x86@vger.kernel.org,
 Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>, bpf@vger.kernel.org,
 "David S . Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v2 0/5] TSN auto negotiation
	between 1G and 2.5G
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

CgpPbiA0LzgvMjAyMyA4OjA0IHBtLCBBbmRyZXcgTHVubiB3cm90ZToKPiBPbiBGcmksIEF1ZyAw
NCwgMjAyMyBhdCAwNDo0NToyMlBNICswODAwLCBDaG9vbmcgWW9uZyBMaWFuZyB3cm90ZToKPj4g
SW50ZWwgcGxhdGZvcm1z4oCZIGludGVncmF0ZWQgR2lnYWJpdCBFdGhlcm5ldCBjb250cm9sbGVy
cyBzdXBwb3J0Cj4+IDIuNUdicHMgbW9kZSBzdGF0aWNhbGx5IHVzaW5nIEJJT1MgcHJvZ3JhbW1p
bmcuIEluIHRoZSBjdXJyZW50Cj4+IGltcGxlbWVudGF0aW9uLCB0aGUgQklPUyBtZW51IHByb3Zp
ZGVzIGFuIG9wdGlvbiB0byBzZWxlY3QgYmV0d2Vlbgo+PiAxMC8xMDAvMTAwME1icHMgYW5kIDIu
NUdicHMgbW9kZXMuIEJhc2VkIG9uIHRoZSBzZWxlY3Rpb24sIHRoZSBCSU9TCj4+IHByb2dyYW1z
IHRoZSBQaGFzZSBMb2NrIExvb3AgKFBMTCkgcmVnaXN0ZXJzLiBUaGUgQklPUyBhbHNvIHJlYWQg
dGhlCj4+IFRTTiBsYW5lIHJlZ2lzdGVycyBmcm9tIEZsZXhpYmxlIEkvTyBBZGFwdGVyIChGSUEp
IGJsb2NrIGFuZCBwcm92aWRlZAo+PiAxMC8xMDAvMTAwME1icHMvMi41R2JwcyBpbmZvcm1hdGlv
biB0byB0aGUgc3RtbWFjIGRyaXZlci4gQnV0Cj4+IGF1dG8tbmVnb3RpYXRpb24gYmV0d2VlbiAx
MC8xMDAvMTAwME1icHMgYW5kIDIuNUdicHMgaXMgbm90IGFsbG93ZWQuCj4+IFRoZSBuZXcgcHJv
cG9zYWwgaXMgdG8gc3VwcG9ydCBhdXRvLW5lZ290aWF0aW9uIGJldHdlZW4gMTAvMTAwLzEwMDBN
YnBzCj4+IGFuZCAyLjVHYnBzIC4gQXV0by1uZWdvdGlhdGlvbiBiZXR3ZWVuIDEwLCAxMDAsIDEw
MDBNYnBzIHdpbGwgdXNlCj4+IGluLWJhbmQgYXV0byBuZWdvdGlhdGlvbi4gQXV0by1uZWdvdGlh
dGlvbiBiZXR3ZWVuIDEwLzEwMC8xMDAwTWJwcyBhbmQKPj4gMi41R2JwcyB3aWxsIHdvcmsgYXMg
dGhlIGZvbGxvd2luZyBwcm9wb3NlZCBmbG93LCB0aGUgc3RtbWFjIGRyaXZlciByZWFkcwo+PiB0
aGUgUEhZIGxpbmsgc3RhdHVzIHJlZ2lzdGVycyB0aGVuIGlkZW50aWZpZXMgdGhlIG5lZ290aWF0
ZWQgc3BlZWQuCj4+IEJhc2VkIG9uIHRoZSBzcGVlZCBzdG1tYWMgZHJpdmVyIHdpbGwgaWRlbnRp
ZnkgVFNOIGxhbmUgcmVnaXN0ZXJzIGZyb20KPj4gRklBIHRoZW4gc2VuZCBJUEMgY29tbWFuZCB0
byB0aGUgUG93ZXIgTWFuYWdlbWVudCBjb250cm9sbGVyIChQTUMpCj4+IHRocm91Z2ggUE1DIGRy
aXZlci9BUEkuIFBNQyB3aWxsIGFjdCBhcyBhIHByb3h5IHRvIHByb2dyYW1zIHRoZQo+PiBQTEwg
cmVnaXN0ZXJzLgo+IAo+IEhhdmUgeW91IGNvbnNpZGVyZWQgdXNpbmcgb3V0IG9mIGJhbmQgZm9y
IGFsbCBsaW5rIG1vZGVzPyBZb3UgbWlnaHQKPiBlbmQgdXAgd2l0aCBhIGNsZWFuZXIgYXJjaGl0
ZWN0dXJlLCBhbmQgbm90IG5lZWQgYW55IHBoeWxpbmsvcGh5bGliCj4gaGFja3MuCj4gCj4gCUFu
ZHJldwpIaSBBbmRyZXcsCgpUaGFuayB5b3UgZm9yIHlvdXIgZmVlZGJhY2suCkkgd2lsbCBzdHVk
eSB0aGUgZmVhc2liaWxpdHkgb2YgdGhlIG91dC1vZi1iYW5kIChPT0IpIGFwcHJvYWNoLgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBt
YWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRw
czovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1z
dG0zMgo=
