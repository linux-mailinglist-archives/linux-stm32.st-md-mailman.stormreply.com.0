Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 698FCA45687
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Feb 2025 08:21:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 22913C7A82F;
	Wed, 26 Feb 2025 07:21:09 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4C7D8C7A82E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Feb 2025 07:21:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E8A2961139;
 Wed, 26 Feb 2025 07:20:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E5E6C4CEE2;
 Wed, 26 Feb 2025 07:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740554467;
 bh=QegaP2Da7E1JZvVAchd05hz3+HLw4pHhxmZVYmicUQQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=CP3R7TuXqviDoYcwaepIbuSIGdnf60Nsa9lHT+WW8r7Too1AZKMSjmCD1LS3zePkV
 BFeKkSOeWhjoTYlTOfJB5P2eJbN0Dwyh8kMNvxgdYvE4w/+wyc6q7cujyW/3puCbbn
 fguCBEjAxmDYpsHHuKS2O8zj24BYfPIQn2KJic/Rfdl1VCG4835z703J8I/v08yazJ
 G1ABsieQNik94oYbOoRuHLhyLwPjXDzVxXyaRyLNK3U5IRsL/79f/x5UNlo8Y9Icpx
 C+V/Vm9ukQCEMOAkmw8Sk25afT9qMKvepBls4oNiZYEhbyOBVinWxCEyb8LNnuq7h+
 X3bznEDKsSIBg==
Message-ID: <00526b1d-b753-4ee5-8f83-67d27d66a43c@kernel.org>
Date: Wed, 26 Feb 2025 08:21:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Clement LE GOFFIC <clement.legoffic@foss.st.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>
References: <20250225-hdp-upstream-v1-0-9d049c65330a@foss.st.com>
 <20250225-hdp-upstream-v1-2-9d049c65330a@foss.st.com>
 <6fc80544-6fc3-4450-a0cc-bfc740fe97bb@kernel.org>
 <91f19306-4b31-41fe-8ad2-680b1a339204@foss.st.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <91f19306-4b31-41fe-8ad2-680b1a339204@foss.st.com>
Cc: linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 2/9] dt-bindings: pinctrl: stm32:
	Introduce HDP
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

T24gMjUvMDIvMjAyNSAxNjo1MSwgQ2xlbWVudCBMRSBHT0ZGSUMgd3JvdGU6Cj4gT24gMi8yNS8y
NSAxNDowNCwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPj4gT24gMjUvMDIvMjAyNSAwOTo0
OCwgQ2zDqW1lbnQgTGUgR29mZmljIHdyb3RlOgo+Pj4gKwo+Pj4gK21haW50YWluZXJzOgo+Pj4g
KyAgLSBDbMOpbWVudCBMRSBHT0ZGSUMgPGNsZW1lbnQubGVnb2ZmaWNAZm9zcy5zdC5jb20+Cj4+
PiArCj4+PiArZGVzY3JpcHRpb246IHwKPj4KPj4KPj4gRG8gbm90IG5lZWQgJ3wnIHVubGVzcyB5
b3UgbmVlZCB0byBwcmVzZXJ2ZSBmb3JtYXR0aW5nLgo+IAo+IE9rCj4gCj4+PiArICBTVE1pY3Jv
ZWxlY3Ryb25pY3MncyBTVE0zMiBNUFVzIGludGVncmF0ZSBhIEhhcmR3YXJlIERlYnVnIFBvcnQg
KEhEUCkuCj4+PiArICBJdCBhbGxvd3MgdG8gb3V0cHV0IGludGVybmFsIHNpZ25hbHMgb24gU29D
J3MgR1BJTy4KPj4+ICsKPj4+ICtwcm9wZXJ0aWVzOgo+Pj4gKyAgY29tcGF0aWJsZToKPj4+ICsg
ICAgY29uc3Q6IHN0LHN0bTMybXAtaGRwCj4+Cj4+IFRoZXJlIGlzIGEgbWVzcyBpbiBTVE0gU29D
cy4gU29tZXRpbWVzIHlvdSBjYWxsIFNvQyBzdG0zMiwgc29tZXRpbWVzCj4+IHN0bTMybXAgYW5k
IHNvbWV0aW1lcyBzdG0zMm1wWFguCj4+Cj4+IERlZmluZSBmb3IgYWxsIHlvdXIgU1RNIGNvbnRy
aWJ1dGlvbnMgd2hhdCBpcyB0aGUgYWN0dWFsIFNvQy4gVGhpcwo+PiBmZWVkYmFjayB3YXMgYWxy
ZWFkeSBnaXZlbiB0byBTVC4KPj4KPj4+ICsKPj4+ICsgIHJlZzoKPj4+ICsgICAgbWF4SXRlbXM6
IDEKPj4+ICsKPj4+ICsgIGNsb2NrczoKPj4+ICsgICAgbWF4SXRlbXM6IDEKPj4+ICsKPj4+ICtw
YXR0ZXJuUHJvcGVydGllczoKPj4+ICsgICctcGlucyQnOgo+Pj4gKyAgICB0eXBlOiBvYmplY3QK
Pj4+ICsgICAgJHJlZjogcGlubXV4LW5vZGUueWFtbCMKPj4+ICsKPj4+ICsgICAgcHJvcGVydGll
czoKPj4+ICsgICAgICBmdW5jdGlvbjoKPj4+ICsgICAgICAgIGVudW06IFsgIjAiLCAiMSIsICIy
IiwgIjMiLCAiNCIsICI1IiwgIjYiLCAiNyIsCj4+PiArICAgICAgICAgICAgICAgICI4IiwgIjki
LCAiMTAiLCAiMTEiLCAiMTIiLCAiMTMiLCAiMTQiLAo+Pj4gKyAgICAgICAgICAgICAgICAiMTUi
IF0KPj4KPj4gRnVuY3Rpb24gd2hpY2ggaGFzIGEgbnVtYmVyIGlzIG5vdCByZWFsbHkgdXNlZnVs
LiBXaGF0IGRvZXMgaXQgZXZlbiBleHByZXNzPwo+IAo+IEFzIHNhaWQgaW4gbXkgcHJldmlvdXMg
YW5zd2VyLCBmdW5jdGlvbiBuYW1lcyBhcmUgdmVyeSBkaWZmZXJlbnQgZnJvbSAKPiBvbmUgcGxh
dGZvcm0gdG8gYW5vdGhlci4gTnVtYmVycyB3ZXJlIHVzZWQgYXMgc3RyaW5nIHRvIGJlIGdlbmVy
aWMuCj4gSSdsbCBjb25zaWRlciBpdCBpbiBhIFYyLgoKV2hhdCBkb2VzIGl0IG1lYW4gIm9uZSBw
bGF0Zm9ybSB0byBhbm90aGVyIj8gVGhpcyBpcyBvbmUgcGxhdGZvcm0hIElzCnRoaXMgc29tZSBz
b3J0IG9mIGNvbnRpbnVhdGlvbiBvZiBTb0MgY29tcGF0aWJsZSBtZXNzPwoKV2hhdCBhcmUgdGhl
IGV4YWN0IGZ1bmN0aW9ucyB3cml0dGVuIGluIGRhdGFzaGVldD8KCkJlc3QgcmVnYXJkcywKS3J6
eXN6dG9mCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXN0bTMyCg==
