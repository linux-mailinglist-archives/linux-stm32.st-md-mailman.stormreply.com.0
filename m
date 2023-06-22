Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF25739724
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Jun 2023 08:01:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4333BC65E4F;
	Thu, 22 Jun 2023 06:01:46 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 92C84C5E2C2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Jun 2023 04:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687407660; x=1718943660;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rKgnFurbdIRdoh4CHd4XKUen+Eh+ergId4ed9rxs1x8=;
 b=F4UtLKO8DMKtQwe9O0cEL62NQP/ZZYC5ueyT5oJ92MOR0WJhTYFbXA3k
 868dzdnUj9gRSJMBTXl/tk6hop/3jIFSr1xtGNCD8YH85W3I8Oesija7h
 mBxAoQg5RlCiupwM0GIuWngU9W9rN98tlA3IFaKA4RylzenNAghkIlhX6
 uBMjtjo2fXsjoy82lb78INsVYSNWvLWSFbszyYDks+IlwyPtPE5S8HVVg
 rP4UwbVSzPX/8EXKtzb/nZV2zk5Tsg11zOn4aA1dHl5oZH/cB5A1BYkmJ
 pVYy4Co9+46cCxDA5T3krDHWw1LSZe99DsSjevLJ02DLdR3pgmKFKF+SG Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="363811742"
X-IronPort-AV: E=Sophos;i="6.00,262,1681196400"; d="scan'208";a="363811742"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2023 21:19:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="744453724"
X-IronPort-AV: E=Sophos;i="6.00,262,1681196400"; d="scan'208";a="744453724"
Received: from yongliang-ubuntu20-ilbpg12.png.intel.com ([10.88.229.33])
 by orsmga008.jf.intel.com with ESMTP; 21 Jun 2023 21:19:27 -0700
From: Choong Yong Liang <yong.liang.choong@linux.intel.com>
To: Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
 David E Box <david.e.box@intel.com>, Hans de Goede <hdegoede@redhat.com>,
 Mark Gross <markgross@kernel.org>, Jose Abreu <Jose.Abreu@synopsys.com>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>,
 Wong Vee Khee <veekhee@apple.com>, Jon Hunter <jonathanh@nvidia.com>,
 Jesse Brandeburg <jesse.brandeburg@intel.com>,
 Revanth Kumar Uppala <ruppala@nvidia.com>,
 Shenwei Wang <shenwei.wang@nxp.com>,
 Andrey Konovalov <andrey.konovalov@linaro.org>,
 Jochen Henneberg <jh@henneberg-systemdesign.com>
Date: Thu, 22 Jun 2023 12:18:59 +0800
Message-Id: <20230622041905.629430-1-yong.liang.choong@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 22 Jun 2023 06:01:45 +0000
Cc: linux-hwmon@vger.kernel.org,
	Tee Min <tee.min.tan@linux.intel.com>,
	Voon Wei Feng <weifeng.voon@intel.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	Lai Peter Jun Ann <jun.ann.lai@intel.com>,
	Tan@stm-ict-prod-mailman-01.stormreply.prv,
	Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>,
	bpf@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 0/6] TSN auto negotiation between 1G
	and 2.5G
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

SW50ZWwgcGxhdGZvcm1z4oCZIGludGVncmF0ZWQgR2lnYWJpdCBFdGhlcm5ldCBjb250cm9sbGVy
cyBzdXBwb3J0CjIuNUdicHMgbW9kZSBzdGF0aWNhbGx5IHVzaW5nIEJJT1MgcHJvZ3JhbW1pbmcu
IEluIHRoZSBjdXJyZW50CmltcGxlbWVudGF0aW9uLCB0aGUgQklPUyBtZW51IHByb3ZpZGVzIGFu
IG9wdGlvbiB0byBzZWxlY3QgYmV0d2VlbgoxMC8xMDAvMTAwME1icHMgYW5kIDIuNUdicHMgbW9k
ZXMuIEJhc2VkIG9uIHRoZSBzZWxlY3Rpb24sIHRoZSBCSU9TCnByb2dyYW1zIHRoZSBQaGFzZSBM
b2NrIExvb3AgKFBMTCkgcmVnaXN0ZXJzLiBUaGUgQklPUyBhbHNvIHJlYWQgdGhlClRTTiBsYW5l
IHJlZ2lzdGVycyBmcm9tIEZsZXhpYmxlIEkvTyBBZGFwdGVyIChGSUEpIGJsb2NrIGFuZCBwcm92
aWRlZAoxMC8xMDAvMTAwME1icHMvMi41R2JwcyBpbmZvcm1hdGlvbiB0byB0aGUgc3RtbWFjIGRy
aXZlci4gQnV0CmF1dG8tbmVnb3RpYXRpb24gYmV0d2VlbiAxMC8xMDAvMTAwME1icHMgYW5kIDIu
NUdicHMgaXMgbm90IGFsbG93ZWQuCgpUaGUgbmV3IHByb3Bvc2FsIGlzIHRvIHN1cHBvcnQgYXV0
by1uZWdvdGlhdGlvbiBiZXR3ZWVuIDEwLzEwMC8xMDAwTWJwcwphbmQgMi41R2JwcyAuIEF1dG8t
bmVnb3RpYXRpb24gYmV0d2VlbiAxMCwgMTAwLCAxMDAwTWJwcyB3aWxsIHVzZQppbi1iYW5kIGF1
dG8gbmVnb3RpYXRpb24uIEF1dG8tbmVnb3RpYXRpb24gYmV0d2VlbiAxMC8xMDAvMTAwME1icHMg
YW5kCjIuNUdicHMgd2lsbCB3b3JrIGFzIHRoZSBmb2xsb3dpbmcgcHJvcG9zZWQgZmxvdywgdGhl
IHN0bW1hYyBkcml2ZXIgcmVhZHMKdGhlIFBIWSBsaW5rIHN0YXR1cyByZWdpc3RlcnMgdGhlbiBp
ZGVudGlmaWVzIHRoZSBuZWdvdGlhdGVkIHNwZWVkLgpCYXNlZCBvbiB0aGUgc3BlZWQgc3RtbWFj
IGRyaXZlciB3aWxsIGlkZW50aWZ5IFRTTiBsYW5lIHJlZ2lzdGVycyBmcm9tCkZJQSB0aGVuIHNl
bmQgSVBDIGNvbW1hbmQgdG8gdGhlIFBvd2VyIE1hbmFnZW1lbnQgY29udHJvbGxlciAoUE1DKQp0
aHJvdWdoIFBNQyBkcml2ZXIvQVBJLiBQTUMgd2lsbCBhY3QgYXMgYSBwcm94eSB0byBwcm9ncmFt
cyB0aGUKUExMIHJlZ2lzdGVycy4KCkNob29uZyBZb25nIExpYW5nICgxKToKICBuZXQ6IHN0bW1h
YzogQWRkIDFHLzIuNUcgYXV0by1uZWdvdGlhdGlvbiBzdXBwb3J0IGZvciBBREwtTgoKRGF2aWQg
RS4gQm94ICgxKToKICBwbGF0Zm9ybS94ODY6IGludGVsX3BtY19jb3JlOiBBZGQgSVBDIG1haWxi
b3ggYWNjZXNzb3IgZnVuY3Rpb24gYW5kCiAgICBhZGQgU29DIHJlZ2lzdGVyIGFjY2VzcwoKTWlj
aGFlbCBTaXQgV2VpIEhvbmcgKDEpOgogIHN0bW1hYzogaW50ZWw6IFNlcGFyYXRlIGRyaXZlcl9k
YXRhIG9mIEFETC1OIGZyb20gVEdMCgpUYW4sIFRlZSBNaW4gKDMpOgogIG5ldDogcGNzOiB4cGNz
OiBjb21iaW5lIEMzNyBTR01JSSBBTiBhbmQgMjUwMEJBU0VYIGZvciBJbnRlbCBtR2JFCiAgICBj
b250cm9sbGVyCiAgbmV0OiBwaHk6IHVwZGF0ZSBpbi1iYW5kIEFOIG1vZGUgd2hlbiBjaGFuZ2lu
ZyBpbnRlcmZhY2UgYnkgUEhZIGRyaXZlcgogIG5ldDogc3RtbWFjOiBlbmFibGUgSW50ZWwgbUdi
RSAxRy8yLjVHIGF1dG8tbmVnb3RpYXRpb24gc3VwcG9ydAoKIE1BSU5UQUlORVJTICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMSArCiBkcml2ZXJzL25ldC9ldGhlcm5ldC9z
dG1pY3JvL3N0bW1hYy9LY29uZmlnICAgfCAgIDEgKwogLi4uL25ldC9ldGhlcm5ldC9zdG1pY3Jv
L3N0bW1hYy9kd21hYy1pbnRlbC5jIHwgMTgzICsrKysrKysrKysrKysrKysrLQogLi4uL25ldC9l
dGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1pbnRlbC5oIHwgIDgxICsrKysrKysrCiAuLi4v
bmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19tYWluLmMgfCAgMjAgKysKIGRyaXZl
cnMvbmV0L3Bjcy9wY3MteHBjcy5jICAgICAgICAgICAgICAgICAgICB8ICA3MiArKysrKy0tCiBk
cml2ZXJzL25ldC9waHkvbWFydmVsbDEwZy5jICAgICAgICAgICAgICAgICAgfCAgIDYgKwogZHJp
dmVycy9uZXQvcGh5L3BoeWxpbmsuYyAgICAgICAgICAgICAgICAgICAgIHwgICAzICsKIGRyaXZl
cnMvcGxhdGZvcm0veDg2L2ludGVsL3BtYy9hZGwuYyAgICAgICAgICB8ICAgMiArLQogZHJpdmVy
cy9wbGF0Zm9ybS94ODYvaW50ZWwvcG1jL2NucC5jICAgICAgICAgIHwgICAyICstCiBkcml2ZXJz
L3BsYXRmb3JtL3g4Ni9pbnRlbC9wbWMvY29yZS5jICAgICAgICAgfCAgNjMgKysrKystCiBkcml2
ZXJzL3BsYXRmb3JtL3g4Ni9pbnRlbC9wbWMvaWNsLmMgICAgICAgICAgfCAgIDIgKy0KIGRyaXZl
cnMvcGxhdGZvcm0veDg2L2ludGVsL3BtYy9tdGwuYyAgICAgICAgICB8ICAgMiArLQogZHJpdmVy
cy9wbGF0Zm9ybS94ODYvaW50ZWwvcG1jL3NwdC5jICAgICAgICAgIHwgICAyICstCiBkcml2ZXJz
L3BsYXRmb3JtL3g4Ni9pbnRlbC9wbWMvdGdsLmMgICAgICAgICAgfCAgIDIgKy0KIC4uLi9jb3Jl
LmggPT4gaW5jbHVkZS9saW51eC9pbnRlbF9wbWNfY29yZS5oICB8ICAyNyArKy0KIGluY2x1ZGUv
bGludXgvcGNzL3Bjcy14cGNzLmggICAgICAgICAgICAgICAgICB8ICAgMSArCiBpbmNsdWRlL2xp
bnV4L3BoeS5oICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDIgKwogaW5jbHVkZS9saW51
eC9zdG1tYWMuaCAgICAgICAgICAgICAgICAgICAgICAgIHwgICAxICsKIDE5IGZpbGVzIGNoYW5n
ZWQsIDQ0OSBpbnNlcnRpb25zKCspLCAyNCBkZWxldGlvbnMoLSkKIHJlbmFtZSBkcml2ZXJzL3Bs
YXRmb3JtL3g4Ni9pbnRlbC9wbWMvY29yZS5oID0+IGluY2x1ZGUvbGludXgvaW50ZWxfcG1jX2Nv
cmUuaCAoOTUlKQoKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
