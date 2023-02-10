Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ADBB691AF0
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Feb 2023 10:12:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B6989C65E73;
	Fri, 10 Feb 2023 09:12:36 +0000 (UTC)
Received: from mr85p00im-ztdg06021101.me.com (mr85p00im-ztdg06021101.me.com
 [17.58.23.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0A102C01E98
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Feb 2023 09:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
 t=1676020353; bh=ILKYIIRd6kMS4UnYulq9JOaUkpq0+0KEk+MTEwNILxs=;
 h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
 b=Mi7CnmPz4rSN/7Vqyzsw/sfB06lbDNCPNrRa5O0R1zgwLa3xqCQivZUjBUmM1p8t8
 +Y2pRd/s0KoSW+udC8jAT0gXAbvHDZ66rKN6yiCU823KaWgy1gJlCRZ9alyEjJVJG8
 KMudh7LgiwTHtENBUeKjmnS19dSvx5r3oEeEWynv/M6i3Uy7SycvKttiy/Y5CTZDbz
 svZSYbB0eE86gWv3tW0MFC7RLo+P7DfdxJ1fmUjVZEdryStOANihbuslwIKf3XZifm
 zgzu5jkIMSVzNSuVpjTa3nEeyuwuN4EMs7++yKvj/HeCuf4p9cCqn9dKiapx2DfNRm
 X9TEgLlX6hBWw==
Received: from imac101 (mr38p00im-dlb-asmtp-mailmevip.me.com [17.57.152.18])
 by mr85p00im-ztdg06021101.me.com (Postfix) with ESMTPSA id B454D80B94;
 Fri, 10 Feb 2023 09:12:28 +0000 (UTC)
Date: Fri, 10 Feb 2023 10:12:25 +0100
From: Alain Volmat <avolmat@me.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <Y+YKeVoq91/mtlo2@imac101>
Mail-Followup-To: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Russell King <linux@armlinux.org.uk>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-pm@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20230209091659.1409-1-avolmat@me.com>
 <20230210090420.GB175687@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230210090420.GB175687@linaro.org>
X-Proofpoint-ORIG-GUID: JHGVi_UVrX6scGCC87yDBtTbmYZETUZI
X-Proofpoint-GUID: JHGVi_UVrX6scGCC87yDBtTbmYZETUZI
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.138,18.0.572,17.11.62.513.0000000_definitions?=
 =?UTF-8?Q?=3D2020-02-14=5F11:2020-02-14=5F02,2020-02-14=5F11,2021-12-02?=
 =?UTF-8?Q?=5F01_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxscore=0 spamscore=0
 mlxlogscore=716 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2302100080
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Amit Kucheria <amitk@kernel.org>,
 Eric Dumazet <edumazet@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, Jonathan Corbet <corbet@lwn.net>,
 Marc Zyngier <maz@kernel.org>, linux-doc@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, linux-clk@vger.kernel.org,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, Paolo Abeni <pabeni@redhat.com>,
 devicetree@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-pm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Stephen Boyd <sboyd@kernel.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 "David S . Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH 00/11] ARM: removal of STiH415/STiH416
	remainings bits
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

T24gRnJpLCBGZWIgMTAsIDIwMjMgYXQgMTA6MDQ6MjBBTSArMDEwMCwgRGFuaWVsIExlemNhbm8g
d3JvdGU6Cj4gT24gVGh1LCBGZWIgMDksIDIwMjMgYXQgMTA6MTY6NDhBTSArMDEwMCwgQWxhaW4g
Vm9sbWF0IHdyb3RlOgo+ID4gTW9zdCBvZiBjb2RlIGluIG9yZGVyIHRvIHN1cHBvcnQgU1RpSDQx
NSBhbmQgU1RpSDQxNiBoYXZlIGFscmVhZHkKPiA+IGJlZW4gcmVtb3ZlZCBmcm9tIHRoZSBrZXJu
ZWwgaW4gMjAxNiwgaG93ZXZlciBmZXcgYml0cyBhcmUgc3RpbGwKPiA+IHJlbWFpbmluZ3MuCj4g
PiBUaGlzIHNlcmllIHJlbW92ZXMgdGhlIGxhc3QgcGllY2VzIG9mIHN1cHBvcnQgZm9yIFNUaUg0
MTUsIFNUaUg0MTYKPiA+IGFuZCBTVGlEMTI3Lgo+IAo+IEhvdyB3b3VsZCBsaWtlIHRvIGhhdmUg
dGhlIHBhdGNoZXMgYXBwbGllZCA/Cj4gCj4gQWNrIGZyb20gdGhlIGRpZmZlcmVudCBtYWludGFp
bmVycyBvciBlYWNoIG1haW50YWluZXIgYXBwbHkgdGhlIHJlbGV2YW50IHBhdGNoZXMgPwoKSGF2
aW5nIHNlZW4gc2l0dWF0aW9ucyBsaWtlIHRoYXQgZm9yIHNvbWUgb3RoZXIgc2VyaWVzIEkgd2Fz
IGd1ZXNzaW5nCnRoYXQgZWFjaCBtYWludGFpbmVyIHdvdWxkIGFwcGx5IHRoZSByZWxldmFudCBw
YXRjaGVzIG9uIGhpcyBzaWRlLgpUaG9zZSB0d28gcGxhdGZvcm1zIGJlaW5nIG5vIG1vcmUgdXNl
ZCwgdGhlcmUgaXMgbm8gc3BlY2lmaWMgcGF0Y2gKb3JkZXJpbmcgdG8ga2VlcC4KCkkndmUgYWN0
dWFsbHkgYmVlbiB3b25kZXJpbmcgYXQgdGhlIGJlZ2lubmluZyBob3cgc2hvdWxkIEkgcG9zdCB0
aG9zZQpwYXRjaGVzLiAgSWYgYW5vdGhlciB3YXkgaXMgcHJlZmVycmFibGUgSSBjYW4gcG9zdCBh
Z2FpbiBkaWZmZXJlbnRseQppZiB0aGF0IGhlbHBzLgoKVGhhbmtzCkFsYWluCgo+IAo+IFRoYW5r
cwo+ICAgLS0gRGFuaWVsCj4gCj4gLS0gCj4gCj4gIDxodHRwOi8vd3d3LmxpbmFyby5vcmcvPiBM
aW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQVJNIFNvQ3MKPiAKPiBGb2xs
b3cgTGluYXJvOiAgPGh0dHA6Ly93d3cuZmFjZWJvb2suY29tL3BhZ2VzL0xpbmFybz4gRmFjZWJv
b2sgfAo+IDxodHRwOi8vdHdpdHRlci5jb20vIyEvbGluYXJvb3JnPiBUd2l0dGVyIHwKPiA8aHR0
cDovL3d3dy5saW5hcm8ub3JnL2xpbmFyby1ibG9nLz4gQmxvZwpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGlu
dXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
