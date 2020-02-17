Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 13596160961
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Feb 2020 05:00:06 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B52CFC36B0B;
	Mon, 17 Feb 2020 04:00:05 +0000 (UTC)
Received: from shards.monkeyblade.net (shards.monkeyblade.net [23.128.96.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 66FAAC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Feb 2020 04:00:01 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id D16A2158489B5;
 Sun, 16 Feb 2020 19:59:57 -0800 (PST)
Date: Sun, 16 Feb 2020 19:59:57 -0800 (PST)
Message-Id: <20200216.195957.2300038427552527679.davem@davemloft.net>
To: ilias.apalodimas@linaro.org
From: David Miller <davem@davemloft.net>
In-Reply-To: <20200216.195300.260413184133485319.davem@davemloft.net>
References: <20200216094056.8078-1-ilias.apalodimas@linaro.org>
 <20200216.195300.260413184133485319.davem@davemloft.net>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Sun, 16 Feb 2020 19:59:58 -0800 (PST)
Cc: mcoquelin.stm32@gmail.com, kuba@kernel.org, daniel@iogearbox.net,
 netdev@vger.kernel.org, john.fastabend@gmail.com, ast@kernel.org,
 linux-kernel@vger.kernel.org, jaswinder.singh@linaro.org, joabreu@synopsys.com,
 thomas.petazzoni@bootlin.com, jonathan.lemon@gmail.com, peppe.cavallaro@st.com,
 bpf@vger.kernel.org, lorenzo@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 hawk@kernel.org
Subject: Re: [Linux-stm32] [PATCH net-next] net: page_pool: API cleanup and
	comments
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
Content-Type: text/plain; charset="iso8859-7"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

RnJvbTogRGF2aWQgTWlsbGVyIDxkYXZlbUBkYXZlbWxvZnQubmV0Pg0KRGF0ZTogU3VuLCAxNiBG
ZWIgMjAyMCAxOTo1MzowMCAtMDgwMCAoUFNUKQ0KDQo+IEZyb206IElsaWFzIEFwYWxvZGltYXMg
PGlsaWFzLmFwYWxvZGltYXNAbGluYXJvLm9yZz4NCj4gRGF0ZTogU3VuLCAxNiBGZWIgMjAyMCAx
MTo0MDo1NSArMDIwMA0KPiANCj4+IEZ1bmN0aW9ucyBzdGFydGluZyB3aXRoIF9fIHVzdWFsbHkg
aW5kaWNhdGUgdGhvc2Ugd2hpY2ggYXJlIGV4cG9ydGVkLA0KPj4gYnV0IHNob3VsZCBub3QgYmUg
Y2FsbGVkIGRpcmVjdGx5LiBVcGRhdGUgc29tZSBvZiB0aG9zZSBkZWNsYXJlZCBpbiB0aGUNCj4+
IEFQSSBhbmQgbWFrZSBpdCBtb3JlIHJlYWRhYmxlLg0KPj4gDQo+PiBwYWdlX3Bvb2xfdW5tYXBf
cGFnZSgpIGFuZCBwYWdlX3Bvb2xfcmVsZWFzZV9wYWdlKCkgd2VyZSBkb2luZw0KPj4gZXhhY3Rs
eSB0aGUgc2FtZSB0aGluZy4gS2VlcCB0aGUgcGFnZV9wb29sX3JlbGVhc2VfcGFnZSgpIHZhcmlh
bnQNCj4+IGFuZCBleHBvcnQgaXQgaW4gb3JkZXIgdG8gc2hvdyB1cCBvbiBwZXJmIGxvZ3MuDQo+
PiBGaW5hbGx5IHJlbmFtZSBfX3BhZ2VfcG9vbF9wdXRfcGFnZSgpIHRvIHBhZ2VfcG9vbF9wdXRf
cGFnZSgpIHNpbmNlIHdlDQo+PiBjYW4gbm93IGRpcmVjdGx5IGNhbGwgaXQgZnJvbSBkcml2ZXJz
IGFuZCByZW5hbWUgdGhlIGV4aXN0aW5nDQo+PiBwYWdlX3Bvb2xfcHV0X3BhZ2UoKSB0byBwYWdl
X3Bvb2xfcHV0X2Z1bGxfcGFnZSgpIHNpbmNlIHRoZXkgZG8gdGhlIHNhbWUNCj4+IHRoaW5nIGJ1
dCB0aGUgbGF0dGVyIGlzIHRyeWluZyB0byBzeW5jIHRoZSBmdWxsIERNQSBhcmVhLg0KPj4gDQo+
PiBBbHNvIHVwZGF0ZSBuZXRzZWMsIG12bmV0YSBhbmQgc3RtbWFjIGRyaXZlcnMgd2hpY2ggdXNl
IHRob3NlIGZ1bmN0aW9ucy4NCj4+IA0KPj4gU3VnZ2VzdGVkLWJ5OiBKb25hdGhhbiBMZW1vbiA8
am9uYXRoYW4ubGVtb25AZ21haWwuY29tPg0KPj4gU2lnbmVkLW9mZi1ieTogSWxpYXMgQXBhbG9k
aW1hcyA8aWxpYXMuYXBhbG9kaW1hc0BsaW5hcm8ub3JnPg0KPiANCj4gQXBwbGllZCB0byBuZXQt
bmV4dCwgdGhhbmtzLg0KDQpBY3R1YWxseSB0aGlzIGRvZXNuJ3QgY29tcGlsZSwgcGxlYXNlIHJl
c3BpbjoNCg0KZHJpdmVycy9uZXQvZXRoZXJuZXQvc29jaW9uZXh0L25ldHNlYy5jOiBJbiBmdW5j
dGlvbiChbmV0c2VjX3VuaW5pdF9wa3RfZHJpbmeiOg0KZHJpdmVycy9uZXQvZXRoZXJuZXQvc29j
aW9uZXh0L25ldHNlYy5jOjEyMDE6NDogZXJyb3I6IHRvbyBmZXcgYXJndW1lbnRzIHRvIGZ1bmN0
aW9uIKFwYWdlX3Bvb2xfcHV0X3BhZ2WiDQogICAgcGFnZV9wb29sX3B1dF9wYWdlKGRyaW5nLT5w
YWdlX3Bvb2wsIHBhZ2UsIGZhbHNlKTsNCiAgICBefn5+fn5+fn5+fn5+fn5+fn4NCkluIGZpbGUg
aW5jbHVkZWQgZnJvbSBkcml2ZXJzL25ldC9ldGhlcm5ldC9zb2Npb25leHQvbmV0c2VjLmM6MTc6
DQouL2luY2x1ZGUvbmV0L3BhZ2VfcG9vbC5oOjE3Mjo2OiBub3RlOiBkZWNsYXJlZCBoZXJlDQog
dm9pZCBwYWdlX3Bvb2xfcHV0X3BhZ2Uoc3RydWN0IHBhZ2VfcG9vbCAqcG9vbCwgc3RydWN0IHBh
Z2UgKnBhZ2UsDQogICAgICBefn5+fn5+fn5+fn5+fn5+fn4NCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51
eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
