Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA4E95C589
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Aug 2024 08:34:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A52C1C7802C;
	Fri, 23 Aug 2024 06:34:54 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AFF12C6C855
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Aug 2024 13:28:46 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DE17160003;
 Thu, 22 Aug 2024 13:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1724333326;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=23/UGc7HSdWd5XXoA2dH4m+DJsdQ98TBIyGL423yxJI=;
 b=ByZNkwYybdfVZ/peZeIpIbJiwwqti2s8SNgHbgXM3SfFoU2zBInDhtrTlr8bUtvte1Y1Ba
 JmJVHgL1bhDKuyIFJvsdz42Yp+lKuAlYiDUv4RAXFDqawxZ4q5vfQ+KtqA/852R9uDuwKx
 HXNkabi3i1/wtPrLVBPHe0XrY9M8DJYajGyDRsUsbmLV5Rpxg32QbUjeuLUfa5z2nePm40
 OH2ArqJQBsTeMiKEVCnYmuznHH5g2u/ssq3Vyc2F04YX3Fluq4CyAcfrI0I8crF6wXGdAB
 pXKv6Q364h0BmDU4eG8d3+pnTkfF5Ro+6TnKHlW+m1egBVdjVchPgL42VTJs+w==
Message-ID: <c54434e3-1fb8-4491-b24f-2167786fe84c@bootlin.com>
Date: Thu, 22 Aug 2024 15:28:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Lei Liu <liulei.rjpt@vivo.com>
References: <20240822033924.32397-1-liulei.rjpt@vivo.com>
 <20240822033924.32397-5-liulei.rjpt@vivo.com>
From: Richard GENOUD <richard.genoud@bootlin.com>
Content-Language: en-US, fr
Organization: Bootlin
In-Reply-To: <20240822033924.32397-5-liulei.rjpt@vivo.com>
X-GND-Sasl: richard.genoud@bootlin.com
X-Mailman-Approved-At: Fri, 23 Aug 2024 06:34:54 +0000
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Paul Cercueil <paul@crapouillou.net>,
 Thierry Reding <thierry.reding@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Jiri Slaby <jirislaby@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 opensource.kernel@vivo.com, Florian Fainelli <florian.fainelli@broadcom.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-arm-kernel@lists.infradead.org,
 Andi Shyti <andi.shyti@linux.intel.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-mips@vger.kernel.org, linux-serial@vger.kernel.org,
 John Ogness <john.ogness@linutronix.de>, linux-kernel@vger.kernel.org,
 linux-actions@lists.infradead.org, linux-tegra@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Lino Sanfilippo <l.sanfilippo@kunbus.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sudeep Holla <sudeep.holla@arm.com>, Jeff Johnson <quic_jjohnson@quicinc.com>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Subject: Re: [Linux-stm32] [PATCH 4/8] tty: atmel_serial: Use
	devm_clk_get_enabled() helpers
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

TGUgMjIvMDgvMjAyNCDDoCAwNTozOSwgTGVpIExpdSBhIMOpY3JpdMKgOgo+IFRoZSBkZXZtX2Ns
a19nZXRfZW5hYmxlZCgpIGhlbHBlcnM6Cj4gICAgICAtIGNhbGwgZGV2bV9jbGtfZ2V0KCkKPiAg
ICAgIC0gY2FsbCBjbGtfcHJlcGFyZV9lbmFibGUoKSBhbmQgcmVnaXN0ZXIgd2hhdCBpcyBuZWVk
ZWQgaW4gb3JkZXIgdG8KPiAgICAgICBjYWxsIGNsa19kaXNhYmxlX3VucHJlcGFyZSgpIHdoZW4g
bmVlZGVkLCBhcyBhIG1hbmFnZWQgcmVzb3VyY2UuCj4gCj4gVGhpcyBzaW1wbGlmaWVzIHRoZSBj
b2RlIGFuZCBhdm9pZHMgY2FsbHMgdG8gY2xrX2Rpc2FibGVfdW5wcmVwYXJlKCkuCj4gCj4gU2ln
bmVkLW9mZi1ieTogTGVpIExpdSA8bGl1bGVpLnJqcHRAdml2by5jb20+Cj4gLS0tCj4gICBkcml2
ZXJzL3R0eS9zZXJpYWwvYXRtZWxfc2VyaWFsLmMgfCA4ICstLS0tLS0tCj4gICAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDcgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvdHR5L3NlcmlhbC9hdG1lbF9zZXJpYWwuYyBiL2RyaXZlcnMvdHR5L3NlcmlhbC9hdG1l
bF9zZXJpYWwuYwo+IGluZGV4IDA5YjI0NmM5ZTM4OS4uMjA5ZjNkNDFhMTdjIDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvdHR5L3NlcmlhbC9hdG1lbF9zZXJpYWwuYwo+ICsrKyBiL2RyaXZlcnMvdHR5
L3NlcmlhbC9hdG1lbF9zZXJpYWwuYwo+IEBAIC0yOTEwLDE0ICsyOTEwLDExIEBAIHN0YXRpYyBp
bnQgYXRtZWxfc2VyaWFsX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gICAJ
YXRvbWljX3NldCgmYXRtZWxfcG9ydC0+dGFza2xldF9zaHV0ZG93biwgMCk7Cj4gICAJc3Bpbl9s
b2NrX2luaXQoJmF0bWVsX3BvcnQtPmxvY2tfc3VzcGVuZGVkKTsKPiAgIAo+IC0JYXRtZWxfcG9y
dC0+Y2xrID0gZGV2bV9jbGtfZ2V0KCZwZGV2LT5kZXYsICJ1c2FydCIpOwo+ICsJYXRtZWxfcG9y
dC0+Y2xrID0gZGV2bV9jbGtfZ2V0X2VuYWJsZWQoJnBkZXYtPmRldiwgInVzYXJ0Iik7Cj4gICAJ
aWYgKElTX0VSUihhdG1lbF9wb3J0LT5jbGspKSB7Cj4gICAJCXJldCA9IFBUUl9FUlIoYXRtZWxf
cG9ydC0+Y2xrKTsKPiAgIAkJZ290byBlcnI7Cj4gICAJfQo+IC0JcmV0ID0gY2xrX3ByZXBhcmVf
ZW5hYmxlKGF0bWVsX3BvcnQtPmNsayk7Cj4gLQlpZiAocmV0KQo+IC0JCWdvdG8gZXJyOwo+ICAg
Cj4gICAJYXRtZWxfcG9ydC0+Z2NsayA9IGRldm1fY2xrX2dldF9vcHRpb25hbCgmcGRldi0+ZGV2
LCAiZ2NsayIpOwo+ICAgCWlmIChJU19FUlIoYXRtZWxfcG9ydC0+Z2NsaykpIHsKPiBAQCAtMjk2
OCwxNSArMjk2NSwxMiBAQCBzdGF0aWMgaW50IGF0bWVsX3NlcmlhbF9wcm9iZShzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlICpwZGV2KQo+ICAgCSAqIFRoZSBwZXJpcGhlcmFsIGNsb2NrIGNhbiBub3cg
c2FmZWx5IGJlIGRpc2FibGVkIHRpbGwgdGhlIHBvcnQKPiAgIAkgKiBpcyB1c2VkCj4gICAJICov
Cj4gLQljbGtfZGlzYWJsZV91bnByZXBhcmUoYXRtZWxfcG9ydC0+Y2xrKTsKPiAtCldoeSByZW1v
dmluZyB0aGlzID8KVGhpcyBpcyBub3QgYW4gZXJyb3IgcGF0aC4KCj4gICAJcmV0dXJuIDA7Cj4g
ICAKPiAgIGVycl9hZGRfcG9ydDoKPiAgIAlrZnJlZShhdG1lbF9wb3J0LT5yeF9yaW5nLmJ1Zik7
Cj4gICAJYXRtZWxfcG9ydC0+cnhfcmluZy5idWYgPSBOVUxMOwo+ICAgZXJyX2Nsa19kaXNhYmxl
X3VucHJlcGFyZToKPiAtCWNsa19kaXNhYmxlX3VucHJlcGFyZShhdG1lbF9wb3J0LT5jbGspOwo+
ICAgCWNsZWFyX2JpdChhdG1lbF9wb3J0LT51YXJ0LmxpbmUsIGF0bWVsX3BvcnRzX2luX3VzZSk7
Cj4gICBlcnI6Cj4gICAJcmV0dXJuIHJldDsKClRoYW5rcywKUmljaGFyZC4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcg
bGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
