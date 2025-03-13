Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9308AA5FC0E
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Mar 2025 17:40:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4C2B6C78F85;
	Thu, 13 Mar 2025 16:40:17 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 34BD7C78F83
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Mar 2025 16:40:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 4166DA477B2;
 Thu, 13 Mar 2025 16:34:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 124B1C4CEDD;
 Thu, 13 Mar 2025 16:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741884014;
 bh=p8AVcBEQ4JH4wcFU3EvZQIw+okBDu/uodFFvEyHDmr0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gUBDOc9w3N3QjozeGeQIILT8Mbe5q45yfDahRhGlWKbXa6cAbkX28apn5101mzy0q
 r71b8K0QrswxlVM5UG8sxjOtJficURk0jRjeStTWrQAhljkS3N/XvAkSp3G7BRRDq/
 jEfUNBcPn6VkQtJRHV2qR0sVlTt5RQcALX5skRPgStcridDEVUtZ/yRLq/L7zoOjR+
 nu5W9LqomCOD6KOvsgQkcVhAb/5Q30CknG/rSnlFTV+go2RSYFjLNHbzp8kZaub6VS
 HKRgHske4Yf60+FjEutO8HFykny5ohBDeyE/ExZDr83PIdcqsrK+PWsgOds4njbUY1
 PWqLQw+Gk8mMw==
Date: Thu, 13 Mar 2025 16:40:08 +0000
From: Lee Jones <lee@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <20250313164008.GC3645863@google.com>
References: <20250305094935.595667-1-fabrice.gasnier@foss.st.com>
 <20250305094935.595667-3-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250305094935.595667-3-fabrice.gasnier@foss.st.com>
Cc: robh@kernel.org, conor+dt@kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-iio@vger.kernel.org, catalin.marinas@arm.com,
 daniel.lezcano@linaro.org, linux-pwm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, ukleinek@kernel.org,
 linux-arm-kernel@lists.infradead.org, krzk+dt@kernel.org, will@kernel.org,
 tglx@linutronix.de, jic23@kernel.org, wbg@kernel.org
Subject: Re: [Linux-stm32] [PATCH v3 2/8] mfd: stm32-lptimer: add support
	for stm32mp25
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

T24gV2VkLCAwNSBNYXIgMjAyNSwgRmFicmljZSBHYXNuaWVyIHdyb3RlOgoKPiBBZGQgc3VwcG9y
dCBmb3IgU1RNMzJNUDI1IFNvQy4KPiBBIG5ldyBoYXJkd2FyZSBjb25maWd1cmF0aW9uIHJlZ2lz
dGVyIChIV0NGR1IyKSBoYXMgYmVlbiBhZGRlZCwgdG8gZ2F0aGVyCj4gbnVtYmVyIG9mIGNhcHR1
cmUvY29tcGFyZSBjaGFubmVscywgYXV0b25vbW91cyBtb2RlIGFuZCBpbnB1dCBjYXB0dXJlCj4g
Y2FwYWJpbGl0eS4gVGhlIGZ1bGwgZmVhdHVyZSBzZXQgaXMgaW1wbGVtZW50ZWQgaW4gTFBUSU0x
LzIvMy80LiBMUFRJTTUKPiBzdXBwb3J0cyBhIHNtYWxsZXIgc2V0IG9mIGZlYXR1cmVzLiBUaGlz
IGNhbiBub3cgYmUgcmVhZCBmcm9tIEhXQ0ZHUgo+IHJlZ2lzdGVycy4KPiAKPiBBZGQgbmV3IHJl
Z2lzdGVycyB0byB0aGUgc3RtMzItbHB0aW1lci5oOiBDQ01SMSwgQ0NSMiwgSFdDRkdSMS8yIGFu
ZCBWRVJSLgo+IFVwZGF0ZSB0aGUgc3RtMzJfbHB0aW1lciBkYXRhIHN0cnVjdCBzbyBzaWduYWwg
dGhlIG51bWJlciBvZgo+IGNhcHR1cmUvY29tcGFyZSBjaGFubmVscyB0byB0aGUgY2hpbGQgZGV2
aWNlcy4KPiBBbHNvIFJlbW92ZSBzb21lIHVudXNlZCBiaXQgbWFza3MgKENNUE9LX0FSUk9LIC8g
Q01QT0tDRl9BUlJPS0NGKS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBGYWJyaWNlIEdhc25pZXIgPGZh
YnJpY2UuZ2FzbmllckBmb3NzLnN0LmNvbT4KPiAtLS0KPiBDaGFuZ2VzIGluIFYyOgo+IC0gcmVs
eSBvbiBmYWxsYmFjayBjb21wYXRpYmxlIGFzIG5vIHNwZWNpZmljIC5kYXRhIGlzIGFzc29jaWF0
ZWQgdG8gdGhlCj4gICBkcml2ZXIuIENvbXBhdGliaWxpdHkgaXMgYWRkZWQgYnkgcmVhZGluZyBo
YXJkd2FyZSBjb25maWd1cmF0aW9uCj4gICByZWdpc3RlcnMuCj4gLSByZWFkIHZlcnNpb24gcmVn
aXN0ZXIsIHRvIGJlIHVzZWQgYnkgY2xvY2tldmVudCBjaGlsZCBkcml2ZXIKPiAtIHJlbmFtZSBy
ZWdpc3Rlci9iaXRzIGRlZmluaXRpb25zCj4gLS0tCj4gIGRyaXZlcnMvbWZkL3N0bTMyLWxwdGlt
ZXIuYyAgICAgICB8IDMzICsrKysrKysrKysrKysrKysrKysrKysrKysrKystCgpMb29rcyBva2F5
LgoKPiAgaW5jbHVkZS9saW51eC9tZmQvc3RtMzItbHB0aW1lci5oIHwgMzUgKysrKysrKysrKysr
KysrKysrKysrKysrKysrKy0tLQoKQXNzdW1pbmdseSB0aGlzIHBhdGNoIGlzIG5vdCBpbmRlcGVu
ZGVudCBvZiB0aGUgb3RoZXJzPwoKLS0gCkxlZSBKb25lcyBb5p2O55C85pavXQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5n
IGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0
LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
