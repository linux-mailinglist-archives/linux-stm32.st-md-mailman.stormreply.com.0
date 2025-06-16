Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D61ADAD71
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Jun 2025 12:33:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CFFE9C36B2C;
	Mon, 16 Jun 2025 10:33:05 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DDA28C36B17
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Jun 2025 10:33:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7DCDC4AC24;
 Mon, 16 Jun 2025 10:33:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65DF7C4CEF1;
 Mon, 16 Jun 2025 10:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750069983;
 bh=evebD+70FLqdj7CqaCuFWQrCrqnpoUVPYITOothIMUo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=pBZvAe1JwqIjZIXUCdnEdbNESOcXJYUVo2Dh+TNhazCeEjkhj7MFrAdVctShgprte
 COR7DxjuTGHlMU6e0PCqLAlBlCDn11H1Xzc2gIOxLn+BN+GciwEiwMFcR85T/4Zl4D
 rLN3a6gBFPEa+j4ShJ321w+jfUoifuabcAFvtZgS9lLIwZhmveSIBlN7+8A5LeGraM
 EGS3XA9KSkSlxBXANUQM+oEoehvRT+eM59R4d+Gf3A07IIIuhCWEAEC8z6kePziEe7
 s2ioqxbBGouAmk+DTSRGKjPbesuMwIGuPIq/kwakiks5PuLqINnE8EjtFS+rkJU6qG
 CUyeGEB9erfcA==
Message-ID: <5a4a9d58-d0c1-40f4-b18b-8b1a3dee55c2@kernel.org>
Date: Mon, 16 Jun 2025 12:32:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Joy Zou <joy.zou@nxp.com>, "robh@kernel.org" <robh@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "will@kernel.org" <will@kernel.org>,
 "andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "edumazet@google.com" <edumazet@google.com>,
 "kuba@kernel.org" <kuba@kernel.org>, "pabeni@redhat.com"
 <pabeni@redhat.com>, "mcoquelin.stm32@gmail.com"
 <mcoquelin.stm32@gmail.com>,
 "alexandre.torgue@foss.st.com" <alexandre.torgue@foss.st.com>,
 "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
 "richardcochran@gmail.com" <richardcochran@gmail.com>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "festevam@gmail.com" <festevam@gmail.com>
References: <20250613100255.2131800-1-joy.zou@nxp.com>
 <20250613100255.2131800-5-joy.zou@nxp.com>
 <27ca7dfa-9dee-43f5-9e97-78de5e964f6e@kernel.org>
 <AS4PR04MB9386F7BB0586AD1ADEB35237E170A@AS4PR04MB9386.eurprd04.prod.outlook.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <AS4PR04MB9386F7BB0586AD1ADEB35237E170A@AS4PR04MB9386.eurprd04.prod.outlook.com>
Cc: Aisheng Dong <aisheng.dong@nxp.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Peng Fan <peng.fan@nxp.com>, Ye Li <ye.li@nxp.com>,
 Jacky Bai <ping.bai@nxp.com>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 Frank Li <frank.li@nxp.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Clark Wang <xiaoning.wang@nxp.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v5 4/9] arm64: dts: imx93: move i.MX93
 specific part from imx91_93_common.dtsi to imx93.dtsi
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

T24gMTYvMDYvMjAyNSAwOTo0MiwgSm95IFpvdSB3cm90ZToKPiAKPj4gLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0KPj4gRnJvbTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6a0BrZXJuZWwub3Jn
Pgo+PiBTZW50OiAyMDI15bm0NuaciDEz5pelIDE4OjQ0Cj4+IFRvOiBKb3kgWm91IDxqb3kuem91
QG54cC5jb20+OyByb2JoQGtlcm5lbC5vcmc7IGtyemsrZHRAa2VybmVsLm9yZzsKPj4gY29ub3Ir
ZHRAa2VybmVsLm9yZzsgc2hhd25ndW9Aa2VybmVsLm9yZzsgcy5oYXVlckBwZW5ndXRyb25peC5k
ZTsKPj4gY2F0YWxpbi5tYXJpbmFzQGFybS5jb207IHdpbGxAa2VybmVsLm9yZzsgYW5kcmV3K25l
dGRldkBsdW5uLmNoOwo+PiBkYXZlbUBkYXZlbWxvZnQubmV0OyBlZHVtYXpldEBnb29nbGUuY29t
OyBrdWJhQGtlcm5lbC5vcmc7Cj4+IHBhYmVuaUByZWRoYXQuY29tOyBtY29xdWVsaW4uc3RtMzJA
Z21haWwuY29tOwo+PiBhbGV4YW5kcmUudG9yZ3VlQGZvc3Muc3QuY29tOyB1bGYuaGFuc3NvbkBs
aW5hcm8ub3JnOwo+PiByaWNoYXJkY29jaHJhbkBnbWFpbC5jb207IGtlcm5lbEBwZW5ndXRyb25p
eC5kZTsgZmVzdGV2YW1AZ21haWwuY29tCj4+IENjOiBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9y
ZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsKPj4gaW14QGxpc3RzLmxpbnV4LmRldjsg
bGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnOwo+PiBuZXRkZXZAdmdlci5rZXJu
ZWwub3JnOyBsaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tOwo+PiBsaW51
eC1wbUB2Z2VyLmtlcm5lbC5vcmc7IEZyYW5rIExpIDxmcmFuay5saUBueHAuY29tPjsgWWUgTGkg
PHllLmxpQG54cC5jb20+Owo+PiBKYWNreSBCYWkgPHBpbmcuYmFpQG54cC5jb20+OyBQZW5nIEZh
biA8cGVuZy5mYW5AbnhwLmNvbT47IEFpc2hlbmcgRG9uZwo+PiA8YWlzaGVuZy5kb25nQG54cC5j
b20+OyBDbGFyayBXYW5nIDx4aWFvbmluZy53YW5nQG54cC5jb20+Cj4+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjUgNC85XSBhcm02NDogZHRzOiBpbXg5MzogbW92ZSBpLk1YOTMgc3BlY2lmaWMKPj4g
cGFydCBmcm9tIGlteDkxXzkzX2NvbW1vbi5kdHNpIHRvIGlteDkzLmR0c2kKPj4KPj4gT24gMTMv
MDYvMjAyNSAxMjowMiwgSm95IFpvdSB3cm90ZToKPj4+IE1vdmUgaS5NWDkzIHNwZWNpZmljIHBh
cnQgZnJvbSBpbXg5MV85M19jb21tb24uZHRzaSB0byBpbXg5My5kdHNpLgo+Pgo+PiBZb3UganVz
dCBtb3ZlZCB0aGVtIHRvIHRoZSBjb21tb24gZmlsZS4gV2h5IGFyZSB5b3UgbW92aW5nIHRoZSBz
YW1lIGxpbmUKPj4gYWdhaW4/Cj4gVGhhbmtzIGZvciB5b3VyIGNvbW1lbnRzIQo+IFRoZXNlIGFy
ZSB0aGUgZGlmZmVyZW5jZXMgZm9yIHRoZSBjb252ZW5pZW5jZSBvZiByZXZpZXcuCgpTbyB5b3Ug
anVzdCBrZWVwIGNoYW5naW5nIHNhbWUgbGluZXMgZm9yIGEgcmV2aWV3PyBOby4gSXQgbWFrZXMK
ZXZlcnl0aGluZyBkaWZmaWN1bHQgdG8gcmV2aWV3LgoKT3JnYW5pemUgeW91ciBwYXRjaGVzIGlu
IGxvZ2ljYWwgY2h1bmtzLCBhcyByZXF1ZXN0ZWQgYnkgc3VibWl0dGluZyBwYXRjaGVzLgoKCgpC
ZXN0IHJlZ2FyZHMsCktyenlzenRvZgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
