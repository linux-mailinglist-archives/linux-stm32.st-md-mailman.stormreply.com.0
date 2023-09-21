Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BDADD7A93FB
	for <lists+linux-stm32@lfdr.de>; Thu, 21 Sep 2023 13:50:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6AF52C6C823;
	Thu, 21 Sep 2023 11:50:57 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5C1B8C6B46F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 21 Sep 2023 11:50:55 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1E07261ED1;
 Thu, 21 Sep 2023 11:50:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E91A2C4AF7B;
 Thu, 21 Sep 2023 11:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695297053;
 bh=mXYzQ1Aw2AmUUG7pVcJYPh5w/95BLX6Xyx+iv32GdjM=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Bs2WggFziPp0qrw2QPhcDrEk2iWOjqSQHn7c+YlHM/5kRBfSCxdlUXbYPM5UknYKM
 t75jJJqXm4wRyg2gGjrsZtyfooghoz7C/bJOP6/zSOwkA2uLsJAsPXMsYpmN6JLVGw
 8MFNURKRlvcipijmnRr+i+K1ab4Ofk3AybcxouKfYlng1S5z8qvNnw4jQO4R+gw0Er
 YmJqw+V2ZTRUIQ3RGeelZr92fzcpWFmM4+xp5Q8/pu48a0hfIPiN0rvRAeipckKMaK
 CQZPD0H6T10DUVULVf9Ud3NZenXyl4qlByMEHHXZDLHvuf3nJOZJGmylLkdNZ7GGn6
 1jm9QEt6fhN6g==
From: Lee Jones <lee@kernel.org>
To: william.gray@linaro.org, lee@kernel.org, 
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>
In-Reply-To: <20230829134029.2402868-5-fabrice.gasnier@foss.st.com>
References: <20230829134029.2402868-1-fabrice.gasnier@foss.st.com>
 <20230829134029.2402868-5-fabrice.gasnier@foss.st.com>
Message-Id: <169529705167.3631705.15052366988953895917.b4-ty@kernel.org>
Date: Thu, 21 Sep 2023 12:50:51 +0100
MIME-Version: 1.0
X-Mailer: b4 0.12.2
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] (subset) [PATCH 4/8] mfd: stm32-timers: add
 support for interrupts
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

T24gVHVlLCAyOSBBdWcgMjAyMyAxNTo0MDoyNSArMDIwMCwgRmFicmljZSBHYXNuaWVyIHdyb3Rl
Ogo+IFRoZXJlIGFyZSB0d28gdHlwZXMgb2YgU1RNMzIgdGltZXJzIHRoYXQgbWF5IGhhdmU6Cj4g
LSBhIGdsb2JhbCBpbnRlcnJ1cHQgbGluZQo+IC0gNCBkZWRpY2F0ZWQgaW50ZXJydXB0IGxpbmVz
Lgo+IFRob3NlIGludGVycnVwdHMgYXJlIG9wdGlvbmFsIGFzIGRlZmluZWQgaW4gdGhlIGR0LWJp
bmRpbmdzLiBFbmZvcmNlIGNoZWNrcwo+IG9uIGVpdGhlciBvbmUsIGZvdXIgb3Igbm8gaW50ZXJy
dXB0cyBhcmUgcHJvdmlkZWQgd2l0aCB0aGVpciBuYW1lcy4KPiBPcHRpb25hbGx5IGdldCB0aGVt
IGhlcmUsIHRvIGJlIHVzZWQgYnkgY2hpbGQgZGV2aWNlcy4KPiAKPiBbLi4uXQoKQXBwbGllZCwg
dGhhbmtzIQoKWzQvOF0gbWZkOiBzdG0zMi10aW1lcnM6IGFkZCBzdXBwb3J0IGZvciBpbnRlcnJ1
cHRzCiAgICAgIGNvbW1pdDogZjc0N2I2MjdkMzk1YzRlYjhhODI4NDlkY2NjZjMxYmY0NmIyMTUw
NAoKLS0KTGVlIEpvbmVzIFvmnY7nkLzmlq9dCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJA
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
