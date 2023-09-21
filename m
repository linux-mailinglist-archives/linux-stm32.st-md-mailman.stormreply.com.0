Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A609C7A9432
	for <lists+linux-stm32@lfdr.de>; Thu, 21 Sep 2023 14:20:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 57AF4C6B459;
	Thu, 21 Sep 2023 12:20:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1919CC6A60C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Sep 2023 12:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695298826; x=1726834826;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6hzWF6t3usS5DT5I810V3jYMFYBjf/9WntyNrqaTQuo=;
 b=bScfKyZpNZlXsOhfBTPh/MouoR2Cuz1KLDTsCPxlNsURt9qEGSfnTJLD
 oD0QiL+R+JW7qZeZmf+Lxy7vVbZ4UvZFLYbBFCEY2mgNR//qcDM7HuA8c
 YMEjuRo5PNAOJ/uxuTZG//xz5nhV+s/JVtmgpt3mCkoQWvbUDcIdsCvZy
 Z0+tH3ohwOj/M629GBF0wMX7n0ziIbXPR1xA6BRN2DIsDqxRZrsAEkxu6
 gKvMrgWWL41aO3rJupBYHDiA9L+SCAGVoOfveMfr9JQ4PwYSGbmQw6WAH
 lbiA/vyi60muFirZLMukKbSt+E9pBYb3BA//CBhHMuxolGcJ+LmQmPoul Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="444608124"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; d="scan'208";a="444608124"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2023 05:20:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="862441612"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; d="scan'208";a="862441612"
Received: from yongliang-ubuntu20-ilbpg12.png.intel.com ([10.88.229.33])
 by fmsmga002.fm.intel.com with ESMTP; 21 Sep 2023 05:20:13 -0700
From: Choong Yong Liang <yong.liang.choong@linux.intel.com>
To: Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
 David E Box <david.e.box@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>,
 Jose Abreu <Jose.Abreu@synopsys.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>,
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
Date: Thu, 21 Sep 2023 20:19:41 +0800
Message-Id: <20230921121946.3025771-1-yong.liang.choong@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: linux-hwmon@vger.kernel.org, Lai Peter Jun Ann <jun.ann.lai@intel.com>,
 Tan Tee Min <tee.min.tan@linux.intel.com>,
 Voon Wei Feng <weifeng.voon@intel.com>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Simon Horman <simon.horman@corigine.com>, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, David E Box <david.e.box@intel.com>,
 netdev@vger.kernel.org, Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>,
 bpf@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Andrew Halaney <ahalaney@redhat.com>
Subject: [Linux-stm32] [PATCH net-next v3 0/5] TSN auto negotiation between
	1G and 2.5G
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
NUdicHMgaXMgbm90IGFsbG93ZWQuClRoZSBuZXcgcHJvcG9zYWwgaXMgdG8gc3VwcG9ydCBhdXRv
LW5lZ290aWF0aW9uIGJldHdlZW4gMTAvMTAwLzEwMDBNYnBzCmFuZCAyLjVHYnBzIC4gQXV0by1u
ZWdvdGlhdGlvbiBiZXR3ZWVuIDEwLCAxMDAsIDEwMDBNYnBzIHdpbGwgdXNlCmluLWJhbmQgYXV0
byBuZWdvdGlhdGlvbi4gQXV0by1uZWdvdGlhdGlvbiBiZXR3ZWVuIDEwLzEwMC8xMDAwTWJwcyBh
bmQKMi41R2JwcyB3aWxsIHdvcmsgYXMgdGhlIGZvbGxvd2luZyBwcm9wb3NlZCBmbG93LCB0aGUg
c3RtbWFjIGRyaXZlciByZWFkcwp0aGUgUEhZIGxpbmsgc3RhdHVzIHJlZ2lzdGVycyB0aGVuIGlk
ZW50aWZpZXMgdGhlIG5lZ290aWF0ZWQgc3BlZWQuCkJhc2VkIG9uIHRoZSBzcGVlZCBzdG1tYWMg
ZHJpdmVyIHdpbGwgaWRlbnRpZnkgVFNOIGxhbmUgcmVnaXN0ZXJzIGZyb20KRklBIHRoZW4gc2Vu
ZCBJUEMgY29tbWFuZCB0byB0aGUgUG93ZXIgTWFuYWdlbWVudCBjb250cm9sbGVyIChQTUMpCnRo
cm91Z2ggUE1DIGRyaXZlci9BUEkuIFBNQyB3aWxsIGFjdCBhcyBhIHByb3h5IHRvIHByb2dyYW1z
IHRoZQpQTEwgcmVnaXN0ZXJzLgpjaGFuZ2Vsb2c6Cgp2MSAtPiB2MjogCiAtIEFkZCBzdGF0aWMg
dG8gcG1jX2xwbV9tb2RlcyBkZWNsYXJhdGlvbgogLSBBZGQgY3VyX2xpbmtfYW5fbW9kZSB0byB0
aGUga2VybmVsIGRvYwogLSBDb21iaW5lIDIgY29tbWl0cyBpLmUuICJzdG1tYWM6IGludGVsOiBT
ZXBhcmF0ZSBkcml2ZXJfZGF0YSBvZiBBREwtTgogZnJvbSBUR0wiIGFuZCAibmV0OiBzdG1tYWM6
IEFkZCAxRy8yLjVHIGF1dG8tbmVnb3RpYXRpb24KIHN1cHBvcnQgZm9yIEFETC1OIiBpbnRvIDEg
Y29tbWl0LgoKdjIgLT4gdjM6CiAtIENyZWF0ZSBgcG1jX2lwYy5jYCBmaWxlIGZvciBgaW50ZWxf
cG1jX2lwYygpYCBmdW5jdGlvbiBhbmQgCiBhbGxvY2F0ZSB0aGUgZmlsZSBpbiBgYXJjaC94ODYv
cGxhdGZvcm0vaW50ZWwvYCBkaXJlY3RvcnkuCiAtIFVwZGF0ZSBwaHlsaW5rJ3MgQU4gbW9kZSBk
dXJpbmcgcGh5IGludGVyZmFjZSBjaGFuZ2UgYW5kIAogbm90IGV4cG9zaW5nIHBoeWxpbmsncyBB
TiBtb2RlIGludG8gcGh5bGliLgoKLS0tCgpDaG9vbmcgWW9uZyBMaWFuZyAoMik6CiAgbmV0OiBw
aHk6IHVwZGF0ZSBpbi1iYW5kIEFOIG1vZGUgd2hlbiBjaGFuZ2luZyBpbnRlcmZhY2UgYnkgUEhZ
IGRyaXZlcgogIHN0bW1hYzogaW50ZWw6IEFkZCAxRy8yLjVHIGF1dG8tbmVnb3RpYXRpb24gc3Vw
cG9ydCBmb3IgQURMLU4KCkRhdmlkIEUuIEJveCAoMSk6CiAgYXJjaDogeDg2OiBBZGQgSVBDIG1h
aWxib3ggYWNjZXNzb3IgZnVuY3Rpb24gYW5kIGFkZCBTb0MgcmVnaXN0ZXIKICAgIGFjY2VzcwoK
VGFuLCBUZWUgTWluICgyKToKICBuZXQ6IHBjczogeHBjczogY29tYmluZSBDMzcgU0dNSUkgQU4g
YW5kIDI1MDBCQVNFWCBmb3IgSW50ZWwgbUdiRQogICAgY29udHJvbGxlcgogIG5ldDogc3RtbWFj
OiBlbmFibGUgSW50ZWwgbUdiRSAxRy8yLjVHIGF1dG8tbmVnb3RpYXRpb24gc3VwcG9ydAoKIE1B
SU5UQUlORVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMiArCiBhcmNo
L3g4Ni9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDkgKwogYXJjaC94
ODYvcGxhdGZvcm0vaW50ZWwvTWFrZWZpbGUgICAgICAgICAgICAgIHwgICAxICsKIGFyY2gveDg2
L3BsYXRmb3JtL2ludGVsL3BtY19pcGMuYyAgICAgICAgICAgICB8ICA3NSArKysrKysrCiBkcml2
ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9LY29uZmlnICAgfCAgIDEgKwogLi4uL25l
dC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1pbnRlbC5jIHwgMTgzICsrKysrKysrKysr
KysrKysrLQogLi4uL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1pbnRlbC5oIHwg
IDgxICsrKysrKysrCiAuLi4vbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19tYWlu
LmMgfCAgMjAgKysKIGRyaXZlcnMvbmV0L3Bjcy9wY3MteHBjcy5jICAgICAgICAgICAgICAgICAg
ICB8ICA3MiArKysrKy0tCiBkcml2ZXJzL25ldC9waHkvcGh5bGluay5jICAgICAgICAgICAgICAg
ICAgICAgfCAgMzAgKystCiBpbmNsdWRlL2xpbnV4L3Bjcy9wY3MteHBjcy5oICAgICAgICAgICAg
ICAgICAgfCAgIDEgKwogLi4uL2xpbnV4L3BsYXRmb3JtX2RhdGEveDg2L2ludGVsX3BtY19pcGMu
aCAgIHwgIDM0ICsrKysKIGluY2x1ZGUvbGludXgvc3RtbWFjLmggICAgICAgICAgICAgICAgICAg
ICAgICB8ICAgMSArCiAxMyBmaWxlcyBjaGFuZ2VkLCA0OTMgaW5zZXJ0aW9ucygrKSwgMTcgZGVs
ZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC94ODYvcGxhdGZvcm0vaW50ZWwvcG1j
X2lwYy5jCiBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9saW51eC9wbGF0Zm9ybV9kYXRhL3g4
Ni9pbnRlbF9wbWNfaXBjLmgKCi0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0z
MkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
