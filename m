Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F5BA7BFA9
	for <lists+linux-stm32@lfdr.de>; Fri,  4 Apr 2025 16:40:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 14446C7802F;
	Fri,  4 Apr 2025 14:40:15 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2D0C6C78012
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Apr 2025 14:40:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 5972EA47624;
 Fri,  4 Apr 2025 14:34:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C24DC4CEDD;
 Fri,  4 Apr 2025 14:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743777612;
 bh=/RZ9Jsfr5r/ynHY5LjHn47dZxf3iZyn2PfuGAOJz5PE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Es+r2Jc5llwE6fe/0G2YE8Tfxo8QLszDIi+FELtIsScuyexbh7Ua23Tg3UkzVbiaK
 Dk7CB4DvhEbYh0HIb9k3xUBvhhoBWQLEjGBeNZNTJ52NyjceFMVdYe0BS1EX3pyVY0
 CzjXkIlAuhJ4JHEBU9qRjLtvu+Txbqe+pb87yWDbJk6Tnys0UwneBEpjog4YrET0iv
 p6UHblTneFfbN8LAeZ62rHqSSCJMCmuoSqaaPaUCPgcqZn057vcZREwk9tQYYurXf8
 58qiPPyYRSTLGAEeT1bt1kSoMIAl4JDMr63DwcVHla27uTPkP2A06Za4Sw+z9bMiRl
 SKwbcDwFUGcbg==
Date: Fri, 4 Apr 2025 15:40:06 +0100
From: Lee Jones <lee@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <20250404144006.GB372032@google.com>
References: <20250314171451.3497789-1-fabrice.gasnier@foss.st.com>
 <20250314171451.3497789-3-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250314171451.3497789-3-fabrice.gasnier@foss.st.com>
Cc: robh@kernel.org, conor+dt@kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-iio@vger.kernel.org, catalin.marinas@arm.com,
 daniel.lezcano@linaro.org, linux-pwm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, ukleinek@kernel.org,
 linux-arm-kernel@lists.infradead.org, krzk+dt@kernel.org, will@kernel.org,
 tglx@linutronix.de, jic23@kernel.org, wbg@kernel.org
Subject: Re: [Linux-stm32] [PATCH v4 2/8] mfd: stm32-lptimer: add support
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

T24gRnJpLCAxNCBNYXIgMjAyNSwgRmFicmljZSBHYXNuaWVyIHdyb3RlOgoKPiBBZGQgc3VwcG9y
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
YnJpY2UuZ2FzbmllckBmb3NzLnN0LmNvbT4KPiAtLS0KPiBDaGFuZ2VzIGluIFY0Ogo+IC0gQWRk
IERJRVJPSywgQVJST0sgc3RhdHVzIGZsYWdzLCBhbmQgdGhlaXIgY2xlYXIgZmxhZ3MuCj4gQ2hh
bmdlcyBpbiBWMjoKPiAtIHJlbHkgb24gZmFsbGJhY2sgY29tcGF0aWJsZSBhcyBubyBzcGVjaWZp
YyAuZGF0YSBpcyBhc3NvY2lhdGVkIHRvIHRoZQo+ICAgZHJpdmVyLiBDb21wYXRpYmlsaXR5IGlz
IGFkZGVkIGJ5IHJlYWRpbmcgaGFyZHdhcmUgY29uZmlndXJhdGlvbgo+ICAgcmVnaXN0ZXJzLgo+
IC0gcmVhZCB2ZXJzaW9uIHJlZ2lzdGVyLCB0byBiZSB1c2VkIGJ5IGNsb2NrZXZlbnQgY2hpbGQg
ZHJpdmVyCj4gLSByZW5hbWUgcmVnaXN0ZXIvYml0cyBkZWZpbml0aW9ucwo+IC0tLQo+ICBkcml2
ZXJzL21mZC9zdG0zMi1scHRpbWVyLmMgICAgICAgfCAzMyArKysrKysrKysrKysrKysrKysrKysr
KysrKy0KPiAgaW5jbHVkZS9saW51eC9tZmQvc3RtMzItbHB0aW1lci5oIHwgMzcgKysrKysrKysr
KysrKysrKysrKysrKysrKysrKy0tLQoKQXQgbGVhc3QgdGhlIENsb2Nrc291cmNlIGRyaXZlciBk
ZXBlbmRzIG9uIHRoaXMuCgpJIG5lZWQgQWNrcyBmcm9tIHRoZSBvdGhlciBNYWludGFpbmVycyBi
ZWZvcmUgSSBjYW4gbWVyZ2UgdGhpcy4KCi0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFp
bGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6
Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3Rt
MzIK
