Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC6FA44006
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Feb 2025 14:04:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 01A79C78F7D;
	Tue, 25 Feb 2025 13:04:41 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 575B8C78F65
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Feb 2025 13:04:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id ACBF66125D;
 Tue, 25 Feb 2025 13:04:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83114C4CEE6;
 Tue, 25 Feb 2025 13:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740488678;
 bh=VmGLKYImE7DJ/sk9epTDObwuVtuKPlnNZgK/xKXvbm0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=HPzCTPca2u0cgrfG5EsEvMItYgdJ4sjvxrX2x+8UCey1+ZPA74V0kWqKq0RlXfUx2
 bUnX0ml0DzmVWgT48TCOijIQigqNVeR0uCclCyw4BeiqXhh9ahXowMsrRMKq4TVYpn
 /5Ta2eNtnY5D//Y+etvAzTzZtC+HPlS9QcmuJ9vIBxdjf4qmLLdrUCR2iRQ1HMB/Mc
 aBcfRV2SFqoogCJDmJf2WRVsg4Ps5nuAn/yzKeCEnQ/xd+RLzguKjfNfd5w8ofV03u
 swGyj72txdoEOdhCgKpvdVB3U63UI5VfJl5nrGY4G5HFRp8MELrIXCIOV+UQkU4cFY
 fvY+vQAJawKzg==
Message-ID: <6fc80544-6fc3-4450-a0cc-bfc740fe97bb@kernel.org>
Date: Tue, 25 Feb 2025 14:04:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>
References: <20250225-hdp-upstream-v1-0-9d049c65330a@foss.st.com>
 <20250225-hdp-upstream-v1-2-9d049c65330a@foss.st.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20250225-hdp-upstream-v1-2-9d049c65330a@foss.st.com>
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

T24gMjUvMDIvMjAyNSAwOTo0OCwgQ2zDqW1lbnQgTGUgR29mZmljIHdyb3RlOgo+ICsKPiArbWFp
bnRhaW5lcnM6Cj4gKyAgLSBDbMOpbWVudCBMRSBHT0ZGSUMgPGNsZW1lbnQubGVnb2ZmaWNAZm9z
cy5zdC5jb20+Cj4gKwo+ICtkZXNjcmlwdGlvbjogfAoKCkRvIG5vdCBuZWVkICd8JyB1bmxlc3Mg
eW91IG5lZWQgdG8gcHJlc2VydmUgZm9ybWF0dGluZy4KCj4gKyAgU1RNaWNyb2VsZWN0cm9uaWNz
J3MgU1RNMzIgTVBVcyBpbnRlZ3JhdGUgYSBIYXJkd2FyZSBEZWJ1ZyBQb3J0IChIRFApLgo+ICsg
IEl0IGFsbG93cyB0byBvdXRwdXQgaW50ZXJuYWwgc2lnbmFscyBvbiBTb0MncyBHUElPLgo+ICsK
PiArcHJvcGVydGllczoKPiArICBjb21wYXRpYmxlOgo+ICsgICAgY29uc3Q6IHN0LHN0bTMybXAt
aGRwCgpUaGVyZSBpcyBhIG1lc3MgaW4gU1RNIFNvQ3MuIFNvbWV0aW1lcyB5b3UgY2FsbCBTb0Mg
c3RtMzIsIHNvbWV0aW1lcwpzdG0zMm1wIGFuZCBzb21ldGltZXMgc3RtMzJtcFhYLgoKRGVmaW5l
IGZvciBhbGwgeW91ciBTVE0gY29udHJpYnV0aW9ucyB3aGF0IGlzIHRoZSBhY3R1YWwgU29DLiBU
aGlzCmZlZWRiYWNrIHdhcyBhbHJlYWR5IGdpdmVuIHRvIFNULgoKPiArCj4gKyAgcmVnOgo+ICsg
ICAgbWF4SXRlbXM6IDEKPiArCj4gKyAgY2xvY2tzOgo+ICsgICAgbWF4SXRlbXM6IDEKPiArCj4g
K3BhdHRlcm5Qcm9wZXJ0aWVzOgo+ICsgICctcGlucyQnOgo+ICsgICAgdHlwZTogb2JqZWN0Cj4g
KyAgICAkcmVmOiBwaW5tdXgtbm9kZS55YW1sIwo+ICsKPiArICAgIHByb3BlcnRpZXM6Cj4gKyAg
ICAgIGZ1bmN0aW9uOgo+ICsgICAgICAgIGVudW06IFsgIjAiLCAiMSIsICIyIiwgIjMiLCAiNCIs
ICI1IiwgIjYiLCAiNyIsCj4gKyAgICAgICAgICAgICAgICAiOCIsICI5IiwgIjEwIiwgIjExIiwg
IjEyIiwgIjEzIiwgIjE0IiwKPiArICAgICAgICAgICAgICAgICIxNSIgXQoKRnVuY3Rpb24gd2hp
Y2ggaGFzIGEgbnVtYmVyIGlzIG5vdCByZWFsbHkgdXNlZnVsLiBXaGF0IGRvZXMgaXQgZXZlbiBl
eHByZXNzPwoKCj4gKwo+ICsgICAgICBwaW5zOgo+ICsgICAgICAgIGVudW06IFsgaGRwMCwgaGRw
MSwgaGRwMiwgaGRwMywgaGRwNCwgaGRwNSwgaGRwNiwgaGRwNyBdCj4gKwo+ICsgICAgcmVxdWly
ZWQ6Cj4gKyAgICAgIC0gZnVuY3Rpb24KPiArICAgICAgLSBwaW5zCj4gKwo+ICsgICAgYWRkaXRp
b25hbFByb3BlcnRpZXM6IGZhbHNlCj4gKwo+ICthbGxPZjoKPiArICAtICRyZWY6IHBpbmN0cmwu
eWFtbCMKPiArCj4gK3JlcXVpcmVkOgo+ICsgIC0gY29tcGF0aWJsZQo+ICsgIC0gcmVnCj4gKyAg
LSBjbG9ja3MKPiArCj4gK2FkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQo+ICsKPiArZXhhbXBs
ZXM6Cj4gKyAgLSB8Cj4gKyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvY2xvY2svc3RtMzJtcDEt
Y2xrcy5oPgo+ICsgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL3BpbmN0cmwvc3RtMzJtcDE1LWhk
cC5oPgo+ICsgICAgLy9FeGFtcGxlIDEKCkRyb3AKCgpCZXN0IHJlZ2FyZHMsCktyenlzenRvZgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0z
MiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpo
dHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51
eC1zdG0zMgo=
