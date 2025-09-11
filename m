Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7BEB52E69
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Sep 2025 12:31:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 141C6C349C1;
	Thu, 11 Sep 2025 10:31:54 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 85740C36B14
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Sep 2025 10:31:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 7831F60208;
 Thu, 11 Sep 2025 10:31:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8575EC4CEF0;
 Thu, 11 Sep 2025 10:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757586712;
 bh=gS2weFUR+ncgV5TkM5dtRR0yU4ygK56P4uQOCMuOTVQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MPeidlrLVFVQvIMpDQUjBt7aE3/Koh8LezVfJHAhOLft/ifOxDs13u2ZqvtoWoplT
 f8A0Ju+FqdQyY/Z0RsvmB72DQLhrT0SOkF3OG3WXG8Zkcs/Nir5ZQxaQyuFrCL0+80
 Iv9ImkmL3OQign8E/ewgSOAr2XvyYORbC9IjV9nPd+WX7QRjRA7+NKWkrc5P9zsk7z
 ia2CFHUPHpD1HslbGUD7dtuCqjl1jfN9FbixTEh/TLohC6cl7C02C2WEiEqzlQd/rD
 LJO2XzZFnHJ+f9bCaLr27zvRUSxY54MzsimYXoxrZjaZiAavcQ7j24WcczVzXqWIpv
 +1WPDmxyt05Iw==
Date: Thu, 11 Sep 2025 11:31:47 +0100
From: Lee Jones <lee@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Message-ID: <20250911103147.GI9224@google.com>
References: <20250904130516.72266-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250904130516.72266-1-brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [GIT PULL] Immutable branch between the MFD and
 GPIO trees for v6.18-rc1
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

T24gVGh1LCAwNCBTZXAgMjAyNSwgQmFydG9zeiBHb2xhc3pld3NraSB3cm90ZToKCj4gRnJvbTog
QmFydG9zeiBHb2xhc3pld3NraSA8YmFydG9zei5nb2xhc3pld3NraUBsaW5hcm8ub3JnPgo+IAo+
IExlZSwKPiAKPiBQbGVhc2UgcHVsbCB0aGUgZm9sbG93aW5nIE1GRCBjaGFuZ2VzIHRoYXQgZGVw
ZW5kIG9uIGNvbW1pdHMgSSBhbHJlYWR5Cj4gaGF2ZSBpbiB0aGUgR1BJTyB0cmVlIGZvciB0aGUg
bmV4dCBtZXJnZSB3aW5kb3cuCj4gCj4gVGhhbmtzLAo+IEJhcnRvc3oKPiAKPiBUaGUgZm9sbG93
aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IDhmNWFlMzBkNjlkNzU0M2VlZTBkNzAwODNkYWY0ZGU4
ZmUxNWQ1ODU6Cj4gCj4gICBMaW51eCA2LjE3LXJjMSAoMjAyNS0wOC0xMCAxOTo0MToxNiArMDMw
MCkKPiAKPiBhcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoKPiAKPiAgIGdp
dDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9icmdsL2xpbnV4Lmdp
dCB0YWdzL2dwaW8vbWZkLXN0bXBlLWZvci12Ni4xOC1yYzEKPiAKPiBmb3IgeW91IHRvIGZldGNo
IGNoYW5nZXMgdXAgdG8gZGY2YTQ0MDAzOTUzZmIyM2FkNjdmODJkMjk5ZTQzOWU3ZmY3MTUwYToK
PiAKPiAgIG1mZDogc3RtcGU6IEFsbG93IGJ1aWxkaW5nIGFzIG1vZHVsZSAoMjAyNS0wOS0wNCAx
NTowMDo1MyArMDIwMCkKPiAKPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gSW1tdXRhYmxlIGJyYW5jaCBiZXR3ZWVuIHRo
ZSBNRkQgYW5kIEdQSU8gdHJlZXMgZm9yIHY2LjE4LXJjMQo+IAo+IEFsbG93IGJ1aWxkaW5nIHRo
ZSBNRkQgU1RNUEUgZHJpdmVyIGFzIG1vZHVsZS4KPiAKPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gQWxleGFuZGVyIFN0
ZWluICgxKToKPiAgICAgICBtZmQ6IHN0bXBlOiBBbGxvdyBidWlsZGluZyBhcyBtb2R1bGUKPiAK
PiAgZHJpdmVycy9tZmQvS2NvbmZpZyB8IDEwICsrKysrLS0tLS0KPiAgZHJpdmVycy9tZmQvc3Rt
cGUuYyB8ICA2ICsrKysrKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDUg
ZGVsZXRpb25zKC0pCgpQdWxsZWQsIHRoYW5rcy4KCi0tIApMZWUgSm9uZXMgW+adjueQvOaWr10K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3Rt
MzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20K
aHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtc3RtMzIK
