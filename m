Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F58ADB74B
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Jun 2025 18:48:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 11FB3C35E00;
	Mon, 16 Jun 2025 16:48:09 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 172D6C35E00
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Jun 2025 16:48:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D9824615F2;
 Mon, 16 Jun 2025 16:48:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E51EAC4CEEA;
 Mon, 16 Jun 2025 16:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750092485;
 bh=vhZVzII3CTfFCsNaHspYbWSGDD/REfUZxPruFgTiNbk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MrLy4Y78WdF45DgIA04d6GzEjtLBdJOuzQzc8TS3cPBYJrqvdD4dQFjmAu31g9sjj
 LElKFh4qj5gs6zQLqeNtg/LZNM8xpZZMDosfM3a/0yzIL+oPRsoyhb51Jn/kFadBXX
 Bebo2KAm91G1jlgy63aDMYFC8qn4J4+lj8Rw/0rr4SZqB1mLQOI/Cjvg57bIK0ElAz
 utaZ2+o6sCFUK+2HW2G7xhAxJ9FTDFKl/7sYwyO/Z/6YYo4+Mab1V7tfmjwSIoRHh8
 XfinTPBQZknPAJK0LIOHLuUnwUWEku8xay8HtSK4Je5aDfJXhT5Twr+elRYzkKM8lL
 bkKOrjBzNPQxg==
Date: Mon, 16 Jun 2025 17:47:57 +0100
From: Simon Horman <horms@kernel.org>
To: Joy Zou <joy.zou@nxp.com>
Message-ID: <20250616164757.GC4794@horms.kernel.org>
References: <20250613100255.2131800-1-joy.zou@nxp.com>
 <20250613100255.2131800-2-joy.zou@nxp.com>
 <20250614171642.GU414686@horms.kernel.org>
 <AS4PR04MB93869345F739436917920F59E170A@AS4PR04MB9386.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <AS4PR04MB93869345F739436917920F59E170A@AS4PR04MB9386.eurprd04.prod.outlook.com>
Cc: "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
 Jacky Bai <ping.bai@nxp.com>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 Frank Li <frank.li@nxp.com>, "edumazet@google.com" <edumazet@google.com>,
 Peng Fan <peng.fan@nxp.com>, "festevam@gmail.com" <festevam@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "robh@kernel.org" <robh@kernel.org>, "will@kernel.org" <will@kernel.org>,
 Clark Wang <xiaoning.wang@nxp.com>, "kuba@kernel.org" <kuba@kernel.org>,
 "pabeni@redhat.com" <pabeni@redhat.com>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>, Ye Li <ye.li@nxp.com>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "richardcochran@gmail.com" <richardcochran@gmail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Aisheng Dong <aisheng.dong@nxp.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "davem@davemloft.net" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH v5 1/9] dt-bindings: arm: fsl: add i.MX91
 11x11 evk board
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

T24gTW9uLCBKdW4gMTYsIDIwMjUgYXQgMDc6NDI6MzlBTSArMDAwMCwgSm95IFpvdSB3cm90ZToK
PiAKPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gPiBGcm9tOiBTaW1vbiBIb3JtYW4g
PGhvcm1zQGtlcm5lbC5vcmc+Cj4gPiBTZW50OiAyMDI15bm0NuaciDE15pelIDE6MTcKPiA+IFRv
OiBKb3kgWm91IDxqb3kuem91QG54cC5jb20+Cj4gPiBDYzogcm9iaEBrZXJuZWwub3JnOyBrcnpr
K2R0QGtlcm5lbC5vcmc7IGNvbm9yK2R0QGtlcm5lbC5vcmc7Cj4gPiBzaGF3bmd1b0BrZXJuZWwu
b3JnOyBzLmhhdWVyQHBlbmd1dHJvbml4LmRlOyBjYXRhbGluLm1hcmluYXNAYXJtLmNvbTsKPiA+
IHdpbGxAa2VybmVsLm9yZzsgYW5kcmV3K25ldGRldkBsdW5uLmNoOyBkYXZlbUBkYXZlbWxvZnQu
bmV0Owo+ID4gZWR1bWF6ZXRAZ29vZ2xlLmNvbTsga3ViYUBrZXJuZWwub3JnOyBwYWJlbmlAcmVk
aGF0LmNvbTsKPiA+IG1jb3F1ZWxpbi5zdG0zMkBnbWFpbC5jb207IGFsZXhhbmRyZS50b3JndWVA
Zm9zcy5zdC5jb207Cj4gPiB1bGYuaGFuc3NvbkBsaW5hcm8ub3JnOyByaWNoYXJkY29jaHJhbkBn
bWFpbC5jb207IGtlcm5lbEBwZW5ndXRyb25peC5kZTsKPiA+IGZlc3RldmFtQGdtYWlsLmNvbTsg
ZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7Cj4gPiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwu
b3JnOyBpbXhAbGlzdHMubGludXguZGV2Owo+ID4gbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZy
YWRlYWQub3JnOyBuZXRkZXZAdmdlci5rZXJuZWwub3JnOwo+ID4gbGludXgtc3RtMzJAc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbTsgbGludXgtcG1Admdlci5rZXJuZWwub3JnOwo+ID4gRnJh
bmsgTGkgPGZyYW5rLmxpQG54cC5jb20+OyBZZSBMaSA8eWUubGlAbnhwLmNvbT47IEphY2t5IEJh
aQo+ID4gPHBpbmcuYmFpQG54cC5jb20+OyBQZW5nIEZhbiA8cGVuZy5mYW5AbnhwLmNvbT47IEFp
c2hlbmcgRG9uZwo+ID4gPGFpc2hlbmcuZG9uZ0BueHAuY29tPjsgQ2xhcmsgV2FuZyA8eGlhb25p
bmcud2FuZ0BueHAuY29tPgo+ID4gU3ViamVjdDogUmU6IFtQQVRDSCB2NSAxLzldIGR0LWJpbmRp
bmdzOiBhcm06IGZzbDogYWRkIGkuTVg5MSAxMXgxMSBldmsKPiA+IGJvYXJkCj4gPiAKPiA+IE9u
IEZyaSwgSnVuIDEzLCAyMDI1IGF0IDA2OjAyOjQ3UE0gKzA4MDAsIEpveSBab3Ugd3JvdGU6Cj4g
PiA+IEZyb206IFBlbmdmZWkgTGkgPHBlbmdmZWkubGlfMUBueHAuY29tPgo+ID4gPgo+ID4gPiBB
ZGQgdGhlIGJvYXJkIGlteDkxLTExeDExLWV2ayBpbiB0aGUgYmluZGluZyBkb2N1ZW1udC4KPiA+
IAo+ID4gbml0OiBkb2N1bWVudAo+IFRoYW5rcyBmb3IgeW91ciBjb21tZW50cyEKPiBXaWxsIGNv
cnJlY3QgaXQhCj4gV2lsbCB1c2UgY29kZXNwZWxsIGNoZWNrIHRoZSBwYXRjaHNldC4KCkdvb2Qg
cGxhbi4gVGhlIC0tY29kZXNwZWxsIG9wdGlvbiB0byBjaGVja3BhdGNoIHNob3VsZCB3b3JrIHdl
bGwgaGVyZS4KCi4uLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1h
bi9saXN0aW5mby9saW51eC1zdG0zMgo=
