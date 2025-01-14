Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED9FA102FB
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Jan 2025 10:28:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C3BE1C7802D;
	Tue, 14 Jan 2025 09:28:38 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 00BFDC7801E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jan 2025 09:28:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CB4665C57EB;
 Tue, 14 Jan 2025 09:27:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B31FC4CEDD;
 Tue, 14 Jan 2025 09:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736846910;
 bh=OJWtwbRS0GQYnP2iRmQnG5KMhHxA7svt0XHwtX+wAlQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=XcRvbyADGXCNuCGb751eenW4IeCS5w2PZMR+MDGpDES3t1vihwuObyxnVh4+FBgfs
 0Zc+pq+f2s9W4zzip8qVD1dptDvGnkl+Vx28MGiFHHNN46lUJKicHQ1A2EOhw2t2J5
 cMJxoVzgMVrNtq/ofu70qxsy4JwzZVkBTeae6w7Yd7jquayBVXOlHKjNjF4WrvBXP2
 BzkfFJSSdFclwuZJw+g60Uew5Mr4q/jUa02NIgPgtBqzxGQuq7Klo3F9FDt35clXyr
 zuc2wAFGnIMV/4q3CidjXnApB4n6GyOPEgyekXas1sAGFhwmnj2KAWJR1P1nmp3OJD
 QZxsG/72WyTSw==
Message-ID: <679440a5-5ee2-47a3-9811-3be96cdcf2a2@kernel.org>
Date: Tue, 14 Jan 2025 10:28:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
References: <20250109211908.1553072-1-dario.binacchi@amarulasolutions.com>
 <20250109211908.1553072-2-dario.binacchi@amarulasolutions.com>
 <bfxyod5l2s6g3j47be7mjh6i7wgjapka2q5b6f2mleipiai6gm@hfvclvkzrtyd>
 <CABGWkvqu10dyW6y5S7qvY4G7uh0OaUgr6k-F7BA1AU0H9bA9GQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <CABGWkvqu10dyW6y5S7qvY4G7uh0OaUgr6k-F7BA1AU0H9bA9GQ@mail.gmail.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-amarula@amarulasolutions.com,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/4] dt-bindings: clock: convert stm32
 rcc bindings to json-schema
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

T24gMTQvMDEvMjAyNSAxMDoxMCwgRGFyaW8gQmluYWNjaGkgd3JvdGU6Cj4gT24gU2F0LCBKYW4g
MTEsIDIwMjUgYXQgMTA6MjXigK9BTSBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5v
cmc+IHdyb3RlOgo+Pgo+PiBPbiBUaHUsIEphbiAwOSwgMjAyNSBhdCAxMDoxODoyOFBNICswMTAw
LCBEYXJpbyBCaW5hY2NoaSB3cm90ZToKPj4+ICttYWludGFpbmVyczoKPj4+ICsgIC0gRGFyaW8g
QmluYWNjaGkgPGRhcmlvLmJpbmFjY2hpQGFtYXJ1bGFzb2x1dGlvbnMuY29tPgo+Pj4gKwo+Pj4g
K2Rlc2NyaXB0aW9uOiB8Cj4+PiArICBUaGUgUkNDIElQIGlzIGJvdGggYSByZXNldCBhbmQgYSBj
bG9jayBjb250cm9sbGVyLgo+Pj4gKyAgVGhlIHJlc2V0IHBoYW5kbGUgYXJndW1lbnQgaXMgdGhl
IGJpdCBudW1iZXIgd2l0aGluIHRoZSBSQ0MgcmVnaXN0ZXJzIGJhbmssCj4+PiArICBzdGFydGlu
ZyBmcm9tIFJDQyBiYXNlIGFkZHJlc3MuCj4+PiArCj4+PiArcHJvcGVydGllczoKPj4+ICsgIGNv
bXBhdGlibGU6Cj4+PiArICAgIG9uZU9mOgo+Pj4gKyAgICAgIC0gaXRlbXM6Cj4+PiArICAgICAg
ICAgIC0gY29uc3Q6IHN0LHN0bTMyZjQyeHgtcmNjCj4+PiArICAgICAgICAgIC0gY29uc3Q6IHN0
LHN0bTMyLXJjYwo+Pj4gKyAgICAgIC0gaXRlbXM6Cj4+PiArICAgICAgICAgIC0gZW51bToKPj4+
ICsgICAgICAgICAgICAgIC0gc3Qsc3RtMzJmNDY5LXJjYwo+Pj4gKyAgICAgICAgICAtIGNvbnN0
OiBzdCxzdG0zMmY0Mnh4LXJjYwo+Pj4gKyAgICAgICAgICAtIGNvbnN0OiBzdCxzdG0zMi1yY2MK
Pj4+ICsgICAgICAtIGl0ZW1zOgo+Pj4gKyAgICAgICAgICAtIGNvbnN0OiBzdCxzdG0zMmY3NDYt
cmNjCj4+Cj4+IFdoeSB0aGlzIGlzbid0IGp1c3QgcGFydCBvZiBlbnVtIHdpdGggZmlyc3QgZ3Jv
dXAvbGlzdD8gRGlmZmVyZW50Cj4+IGdyb3Vwcy9saXN0cyBhcmUgZm9yIGRpZmZlcmVudCBmYWxs
YmFja3MgYW5kIEkgYW0gcHJldHR5IHN1cmUgZmFsbGJhY2sKPj4gaXMgdGhlIHNhbWUuCj4gCj4g
SSB0cmllZCBydW5uaW5nIHRlc3RzIGFmdGVyIGFwcGx5aW5nIHRoZSBjaGFuZ2VzIHlvdSBzdWdn
ZXN0ZWQsIGJ1dAo+IHRoZSB0ZXN0cyBhcmUgZmFpbGluZy4KQW5kPyBGaXggdGhlIGNvZGUgdGhl
bj8KCkJlc3QgcmVnYXJkcywKS3J6eXN6dG9mCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBz
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
