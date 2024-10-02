Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BCA4992868
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Oct 2024 11:42:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C6C57C78F66;
	Mon,  7 Oct 2024 09:42:41 +0000 (UTC)
Received: from bout3.ijzerbout.nl (bout3.ijzerbout.nl [136.144.140.114])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A5006C7801F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  2 Oct 2024 16:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ijzerbout.nl; s=key;
 t=1727887557; bh=S5oWTL07Z27zMnu/W4EqJbn2gKD9ls6Wmzpi8m05GrA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=oxyGFHuVJOfD5lPU2ru/RnfzDFVxqEqK/hSOYnaJgmQdXwA7N0cvxy7wCe49hL9d4
 Pojkx+Ms79FG0h9hIm502IKf1Wr20lr7rsF/MbAiZcl69DWef3Sa4Ld22fdFzKYDd1
 M+EW0xm1T+EKPOyJLynRIxFKNzP/jIq0bTmfC0H4ipySvqrbZe1/b+ZO3eLQnFQQ1q
 zIGzZB8sp36TVVcbBlf4vuf3WdEic9xiHCrbhp/ZhOO7v3RUe6iFRJY1EHZ3ulzJ5T
 6NlZ46Ym3iaoR/iUHHN67vuYH0FjQBZD1ckpHUMz1B+lae48K0/eoyfXl+m4MAqyd1
 yL1okg/F1KelgcW58wj+Bvjk1BL1yF5owHzYd5Ll/JgJ1KTZbfDAicex23+Tmf3Pkz
 c65Ie9h61N6voS65s4/MlFDUCE98g8gCUbasg/vIRX7zisLzShFa/Fj+OVCEtjjBwP
 gK71ompUfwPA6FpZ5E6x7ORfDGcMipQcUtrqSGIbRr1ECvHL/sfriXC8Ra/xbCJ3RW
 1CIWCy94G5JXY11/UUu4ix2MgW+KUvmNfQpymtM8DQJG+mU/7gJ9g8FVdIRE51su0l
 oguxGwISAQSaeqLPm+XbDgpcvISu0YP6epS8GbdyXmmxEtU7K2Uh3LSSQ+8UGNF6Cv
 9HvBqZAsTgV4HK3h+d6rmxWU=
Received: from [IPV6:2a10:3781:99:1:1ac0:4dff:fea7:ec3a] (racer.ijzerbout.nl
 [IPv6:2a10:3781:99:1:1ac0:4dff:fea7:ec3a])
 by bout3.ijzerbout.nl (Postfix) with ESMTPSA id 300C0168387;
 Wed,  2 Oct 2024 18:45:57 +0200 (CEST)
Message-ID: <cc8e3a21-ce15-472a-b838-3dc6e80f68e0@ijzerbout.nl>
Date: Wed, 2 Oct 2024 18:45:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
References: <cover.1726819463.git.u.kleine-koenig@baylibre.com>
 <332d4f736d8360038d03f109c013441c655eea23.1726819463.git.u.kleine-koenig@baylibre.com>
 <b0199625-9dbb-414b-8948-26ad86fd2740@ijzerbout.nl>
 <wl4wpipx2jaixlmdjv7uq5ghewwid5wo6gpmz5bkqj5chnu3vc@6bougxe3rzbx>
Content-Language: en-US
From: Kees Bakker <kees@ijzerbout.nl>
In-Reply-To: <wl4wpipx2jaixlmdjv7uq5ghewwid5wo6gpmz5bkqj5chnu3vc@6bougxe3rzbx>
X-Mailman-Approved-At: Mon, 07 Oct 2024 09:42:34 +0000
Cc: Trevor Gamblin <tgamblin@baylibre.com>, linux-pwm@vger.kernel.org,
 Kent Gibson <warthog618@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 David Lechner <dlechner@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v5 6/8] pwm: stm32: Implementation of the
 waveform callbacks
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

T3AgMDItMTAtMjAyNCBvbSAxMDowMiBzY2hyZWVmIFV3ZSBLbGVpbmUtS8O2bmlnOgo+IEhlbGxv
IEtlZXMsCj4KPiBPbiBUdWUsIE9jdCAwMSwgMjAyNCBhdCAwOToxNzo0N1BNICswMjAwLCBLZWVz
IEJha2tlciB3cm90ZToKPj4gT3AgMjAtMDktMjAyNCBvbSAxMDo1OCBzY2hyZWVmIFV3ZSBLbGVp
bmUtS8O2bmlnOgo+Pj4gKwkJCXJlZ21hcF9yZWFkKHByaXYtPnJlZ21hcCwgVElNX0FSUiwgJmFy
cik7Cj4+IERpZCB5b3UgZm9yZ2V0IHRvIGFzc2lnbiB0byByZXQ/Cj4+PiArCQkJaWYgKHJldCkK
Pj4+ICsJCQkJZ290byBvdXQ7Cj4+PiArCj4+PiBbLi4uXQo+IEl0IHNlZW1zIHNvLCB5ZXMuIEhv
dyBkaWQgeW91IGZpbmQgdGhhdCBvbmU/Cj4KPiBXaGVuIEkgY3JlYXRlIGEgcGF0Y2gsIGlzIGl0
IG9rIGlmIEkgYWRkIGEgUmVwb3J0ZWQtYnk6IGZvciB5b3U/CkZpbmUgYnkgbWUuIEJ1dCBJIGhh
dmUgdG8gYmUgaG9uZXN0IGhlcmUuIEl0IHdhcyByZXBvcnRlZCBieSBDb3Zlcml0eSBbMV0uCkkn
bSBzdWJzY3JpYmVkIHRvIGRhaWx5IHJlcG9ydHMgb2YgbGludXgtbmV4dCBzY2FubmluZy4KPgo+
IEJlc3QgcmVhZ3Jkcwo+IFV3ZQpbMV0gaHR0cHM6Ly9zY2FuLmNvdmVyaXR5LmNvbS9wcm9qZWN0
cy9saW51eC1uZXh0LXdlZWtseS1zY2FuP3RhYj1vdmVydmlldwpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGlu
dXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxt
YW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
