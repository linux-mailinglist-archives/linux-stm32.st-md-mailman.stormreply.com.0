Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8E2AED77D
	for <lists+linux-stm32@lfdr.de>; Mon, 30 Jun 2025 10:38:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 07864C32E8F;
	Mon, 30 Jun 2025 08:38:42 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 394DCC32E8E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Jun 2025 08:38:40 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1uWA1w-00011j-R3; Mon, 30 Jun 2025 10:38:24 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e]
 helo=lupine)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <p.zabel@pengutronix.de>) id 1uWA1t-0064Zw-1S;
 Mon, 30 Jun 2025 10:38:21 +0200
Received: from pza by lupine with local (Exim 4.96)
 (envelope-from <p.zabel@pengutronix.de>) id 1uWA1t-0007Gn-14;
 Mon, 30 Jun 2025 10:38:21 +0200
Message-ID: <5d4cf5bff7733421c8a031493742ba6a21e98583.camel@pengutronix.de>
From: Philipp Zabel <p.zabel@pengutronix.de>
To: =?ISO-8859-1?Q?Cl=E9ment?= Le Goffic <clement.legoffic@foss.st.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob
 Herring <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,  Jonathan Corbet
 <corbet@lwn.net>, Gatien Chevallier <gatien.chevallier@foss.st.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Date: Mon, 30 Jun 2025 10:38:21 +0200
In-Reply-To: <20250623-ddrperfm-upstream-v1-6-7dffff168090@foss.st.com>
References: <20250623-ddrperfm-upstream-v1-0-7dffff168090@foss.st.com>
 <20250623-ddrperfm-upstream-v1-6-7dffff168090@foss.st.com>
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-stm32@st-md-mailman.stormreply.com
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 06/13] perf: stm32: introduce DDRPERFM
	driver
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

T24gTW8sIDIwMjUtMDYtMjMgYXQgMTE6MjcgKzAyMDAsIENsw6ltZW50IExlIEdvZmZpYyB3cm90
ZToKPiBJbnRyb2R1Y2UgdGhlIGRyaXZlciBmb3IgdGhlIEREUiBQZXJmb3JtYW5jZSBNb25pdG9y
IGF2YWlsYWJsZSBvbgo+IFNUTTMyTVBVIFNvQy4KPiAKPiBPbiBTVE0zMk1QMiBwbGF0Zm9ybXMs
IHRoZSBERFJQRVJGTSBhbGxvd3MgdG8gbW9uaXRvciB1cCB0byA4IEREUiBldmVudHMKPiB0aGF0
IGNvbWUgZnJvbSB0aGUgRERSIENvbnRyb2xsZXIgc3VjaCBhcyByZWFkIG9yIHdyaXRlIGV2ZW50
cy4KPiAKPiBPbiBTVE0zMk1QMSBwbGF0Zm9ybXMsIHRoZSBERFJQRVJGTSBjYW5ub3QgbW9uaXRv
ciBhbnkgZXZlbnQgb24gYW55Cj4gY291bnRlciwgdGhlcmUgaXMgYSBub3Rpb24gb2Ygc2V0IG9m
IGV2ZW50cy4KPiBFdmVudHMgZnJvbSBkaWZmZXJlbnQgc2V0cyBjYW5ub3QgYmUgbW9uaXRvcmVk
IGF0IHRoZSBzYW1lIHRpbWUuCj4gVGhlIGZpcnN0IGNob3NlbiBldmVudCBzZWxlY3RzIHRoZSBz
ZXQuCj4gVGhlIHNldCBpcyBjb2RlZCBpbiB0aGUgZmlyc3QgdHdvIGJ5dGVzIG9mIHRoZSBjb25m
aWcgdmFsdWUgd2hpY2ggaXMgb24gNAo+IGJ5dGVzLgo+IAo+IE9uIFNUTTMyTVAyNXggc2VyaWVz
LCB0aGUgRERSUEVSRk0gY2xvY2sgaXMgc2hhcmVkIHdpdGggdGhlIEREUiBjb250cm9sbGVyCj4g
YW5kIG1heSBiZSBzZWN1cmVkIGJ5IGJvb3Rsb2FkZXJzLgo+IEFjY2VzcyBjb250cm9sbGVycyBh
bGxvdyB0byBjaGVjayBhY2Nlc3MgdG8gYSByZXNvdXJjZS4gVXNlIHRoZSBhY2Nlc3MKPiBjb250
cm9sbGVyIGRlZmluZWQgaW4gdGhlIGRldmljZXRyZWUgdG8ga25vdyBhYm91dCB0aGUgYWNjZXNz
IHRvIHRoZQo+IEREUlBFUkZNIGNsb2NrLgo+IAo+IFNpZ25lZC1vZmYtYnk6IENsw6ltZW50IExl
IEdvZmZpYyA8Y2xlbWVudC5sZWdvZmZpY0Bmb3NzLnN0LmNvbT4KPiAtLS0KPiAgZHJpdmVycy9w
ZXJmL0tjb25maWcgICAgICAgICB8ICAxMSArCj4gIGRyaXZlcnMvcGVyZi9NYWtlZmlsZSAgICAg
ICAgfCAgIDEgKwo+ICBkcml2ZXJzL3BlcmYvc3RtMzJfZGRyX3BtdS5jIHwgODkzICsrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgMyBmaWxlcyBjaGFuZ2VkLCA5
MDUgaW5zZXJ0aW9ucygrKQo+IApbLi4uXQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BlcmYvc3Rt
MzJfZGRyX3BtdS5jIGIvZHJpdmVycy9wZXJmL3N0bTMyX2Rkcl9wbXUuYwo+IG5ldyBmaWxlIG1v
ZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwLi5jMGJjZTFmNDQ2YTAKPiAtLS0gL2Rldi9u
dWxsCj4gKysrIGIvZHJpdmVycy9wZXJmL3N0bTMyX2Rkcl9wbXUuYwo+IEBAIC0wLDAgKzEsODkz
IEBAClsuLi5dCj4gKwlpZiAob2ZfcHJvcGVydHlfcHJlc2VudChwZGV2LT5kZXYub2Zfbm9kZSwg
InJlc2V0cyIpKSB7Cj4gKwkJcnN0ID0gZGV2bV9yZXNldF9jb250cm9sX2dldCgmcGRldi0+ZGV2
LCBOVUxMKTsKClVzZSBkZXZtX3Jlc2V0X2NvbnRyb2xfZ2V0X29wdGlvbmFsX2V4Y2x1c2l2ZSgp
IGluc3RlYWQuIEl0IHJldHVybnMKTlVMTCBpZiB0aGUgZGV2aWNlIHRyZWUgZG9lc24ndCBjb250
YWluIGEgcmVzZXRzIHByb3BlcnR5LgoKPiArCQlpZiAoSVNfRVJSKHJzdCkpIHsKPiArCQkJZGV2
X2VycigmcGRldi0+ZGV2LCAiRmFpbGVkIHRvIGdldCByZXNldFxuIik7CgpQbGVhc2UgY29uc2lk
ZXIgdXNpbmcgZGV2X2Vycl9wcm9iZSgpIGluc3RlYWQuCgo+ICsJCQlyZXQgPSBQVFJfRVJSKHJz
dCk7Cj4gKwkJCWdvdG8gZXJyX2NsazsKPiArCQl9Cj4gKwkJcmVzZXRfY29udHJvbF9hc3NlcnQo
cnN0KTsKPiArCQlyZXNldF9jb250cm9sX2RlYXNzZXJ0KHJzdCk7CgpUaGVzZSBjYW4gYmUgZG9u
ZSB1bmNvbmRpdGlvbmFsbHksIGFzIHRoZXkgYXJlIG5vLW9wcyBmb3IgcnN0ID09IE5VTEwuIAoK
cmVnYXJkcwpQaGlsaXBwCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFu
LnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
