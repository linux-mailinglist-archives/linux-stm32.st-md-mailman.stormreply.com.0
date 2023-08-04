Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F19D76FC48
	for <lists+linux-stm32@lfdr.de>; Fri,  4 Aug 2023 10:46:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F2C5BC6B459;
	Fri,  4 Aug 2023 08:46:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7891BC65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Aug 2023 08:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691138813; x=1722674813;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MAcJ299wo3k+KdBjVHFQ6R9T4MfMmRMDb+y4waGUqbo=;
 b=IcyAimM/XORuc4T3m+075vphnaVW0qdL8r3Z70pRjQLZwxCAkf7XdrG1
 61VMBil8Lox+/tztVGV2aU+wJYpvAPv8bqf3G8zHO8WF0kmyApNMThdGx
 D7TG2Zj4+ZQMRleZHAJmnm+Xgd5TSxP8Ycgy+aHtG57iQ2PbdX0FL233L
 lWm51vDN5CD+fkM4aFZ7obZwLF0lUZTOX4jxw0ls/BEzVY9bHrmvXbDuP
 lCDW1r33rkIaOBpEIGDTAlXmFHQ44o9aHrlYbnPLsWXFGCZBRHfU+Yx5B
 pZiyC0o3bB11ougAH/lC6aTggmxrsuJUwSc7N6mxE78oe4b68RW41wPp6 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="456478240"
X-IronPort-AV: E=Sophos;i="6.01,254,1684825200"; d="scan'208";a="456478240"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2023 01:46:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="765017754"
X-IronPort-AV: E=Sophos;i="6.01,254,1684825200"; d="scan'208";a="765017754"
Received: from yongliang-ubuntu20-ilbpg12.png.intel.com ([10.88.229.33])
 by orsmga001.jf.intel.com with ESMTP; 04 Aug 2023 01:46:36 -0700
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
Date: Fri,  4 Aug 2023 16:45:22 +0800
Message-Id: <20230804084527.2082302-1-yong.liang.choong@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: linux-hwmon@vger.kernel.org, Tan Tee Min <tee.min.tan@linux.intel.com>,
 Voon Wei Feng <weifeng.voon@intel.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 Lai Peter Jun Ann <jun.ann.lai@intel.com>,
 Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>, bpf@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2 0/5] TSN auto negotiation between
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
IHRoZQpQTEwgcmVnaXN0ZXJzLgoKY2hhbmdlbG9nOgp2MSAtPiB2MjogCiAtIENyZWF0ZWQgaW50
ZWxfcG1jX2NvcmUuaCBpbiBpbmNsdWRlL2xpbnV4L3BsYXRmb3JtX2RhdGEveDg2LyBhbmQKIGV4
cG9ydCB0aGUgZGVzaXJlZCBmdW5jdGlvbmFsaXR5LgogLSBBZGQgY3VyX2xpbmtfYW5fbW9kZSB0
byB0aGUga2VybmVsIGRvYwogLSBVcGRhdGUgY2ZnX2xpbmtfYW5fbW9kZSB2YWx1ZSBkdXJpbmcg
cGh5IGRyaXZlciBjaGFuZ2VkCiAtIENvbWJpbmUgMiBjb21taXRzIGkuZS4gInN0bW1hYzogaW50
ZWw6IFNlcGFyYXRlIGRyaXZlcl9kYXRhIG9mIEFETC1OCiBmcm9tIFRHTCIgYW5kICJuZXQ6IHN0
bW1hYzogQWRkIDFHLzIuNUcgYXV0by1uZWdvdGlhdGlvbgogc3VwcG9ydCBmb3IgQURMLU4iIGlu
dG8gMSBjb21taXQuCgoKdjEgLT4gdjI6IAogLSBBZGQgc3RhdGljIHRvIHBtY19scG1fbW9kZXMg
ZGVjbGFyYXRpb24KIC0gQWRkIGN1cl9saW5rX2FuX21vZGUgdG8gdGhlIGtlcm5lbCBkb2MKIC0g
Q29tYmluZSAyIGNvbW1pdHMgaS5lLiAic3RtbWFjOiBpbnRlbDogU2VwYXJhdGUgZHJpdmVyX2Rh
dGEgb2YgQURMLU4KIGZyb20gVEdMIiBhbmQgIm5ldDogc3RtbWFjOiBBZGQgMUcvMi41RyBhdXRv
LW5lZ290aWF0aW9uCiBzdXBwb3J0IGZvciBBREwtTiIgaW50byAxIGNvbW1pdC4KLS0tCkNob29u
ZyBZb25nIExpYW5nICgxKToKICBzdG1tYWM6IGludGVsOiBBZGQgMUcvMi41RyBhdXRvLW5lZ290
aWF0aW9uIHN1cHBvcnQgZm9yIEFETC1OCgpEYXZpZCBFLiBCb3ggKDEpOgogIHBsYXRmb3JtL3g4
NjogaW50ZWxfcG1jX2NvcmU6IEFkZCBJUEMgbWFpbGJveCBhY2Nlc3NvciBmdW5jdGlvbiBhbmQK
ICAgIGFkZCBTb0MgcmVnaXN0ZXIgYWNjZXNzCgpUYW4sIFRlZSBNaW4gKDMpOgogIG5ldDogcGNz
OiB4cGNzOiBjb21iaW5lIEMzNyBTR01JSSBBTiBhbmQgMjUwMEJBU0VYIGZvciBJbnRlbCBtR2JF
CiAgICBjb250cm9sbGVyCiAgbmV0OiBwaHk6IHVwZGF0ZSBpbi1iYW5kIEFOIG1vZGUgd2hlbiBj
aGFuZ2luZyBpbnRlcmZhY2UgYnkgUEhZIGRyaXZlcgogIG5ldDogc3RtbWFjOiBlbmFibGUgSW50
ZWwgbUdiRSAxRy8yLjVHIGF1dG8tbmVnb3RpYXRpb24gc3VwcG9ydAoKIE1BSU5UQUlORVJTICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMSArCiBkcml2ZXJzL25ldC9ldGhl
cm5ldC9zdG1pY3JvL3N0bW1hYy9LY29uZmlnICAgfCAgIDEgKwogLi4uL25ldC9ldGhlcm5ldC9z
dG1pY3JvL3N0bW1hYy9kd21hYy1pbnRlbC5jIHwgMTgzICsrKysrKysrKysrKysrKysrLQogLi4u
L25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1pbnRlbC5oIHwgIDgxICsrKysrKysr
CiAuLi4vbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19tYWluLmMgfCAgMjAgKysK
IGRyaXZlcnMvbmV0L3Bjcy9wY3MteHBjcy5jICAgICAgICAgICAgICAgICAgICB8ICA3MiArKysr
Ky0tCiBkcml2ZXJzL25ldC9waHkvbWFydmVsbDEwZy5jICAgICAgICAgICAgICAgICAgfCAgIDYg
KwogZHJpdmVycy9uZXQvcGh5L3BoeWxpbmsuYyAgICAgICAgICAgICAgICAgICAgIHwgICA0ICsK
IGRyaXZlcnMvcGxhdGZvcm0veDg2L2ludGVsL3BtYy9jb3JlLmMgICAgICAgICB8ICA2MCArKysr
KysKIGluY2x1ZGUvbGludXgvcGNzL3Bjcy14cGNzLmggICAgICAgICAgICAgICAgICB8ICAgMSAr
CiBpbmNsdWRlL2xpbnV4L3BoeS5oICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDMgKwog
Li4uL2xpbnV4L3BsYXRmb3JtX2RhdGEveDg2L2ludGVsX3BtY19jb3JlLmggIHwgIDQxICsrKysK
IGluY2x1ZGUvbGludXgvc3RtbWFjLmggICAgICAgICAgICAgICAgICAgICAgICB8ICAgMSArCiAx
MyBmaWxlcyBjaGFuZ2VkLCA0NTggaW5zZXJ0aW9ucygrKSwgMTYgZGVsZXRpb25zKC0pCiBjcmVh
dGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9saW51eC9wbGF0Zm9ybV9kYXRhL3g4Ni9pbnRlbF9wbWNf
Y29yZS5oCgotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20v
bWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
