Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D76AB14886
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Jul 2025 08:49:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C2303C3F93A;
	Tue, 29 Jul 2025 06:49:42 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B96AEC35E2B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Jul 2025 21:07:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A34D8601DC;
 Wed, 23 Jul 2025 21:07:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28FF4C4CEE7;
 Wed, 23 Jul 2025 21:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753304875;
 bh=hGZi/sGJfyKViWvaeWB9IxwYAFMpegznJ3FoUdmRua4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=Gqi24YdzNvYMSEIuuWnPsO3qvZPiXiuqNjVcRfI3ca+QDOlIcQVctCxQVwASMg5RX
 kKSN+++vsYRtkShZ2jIn7n9mnmWan0sWyf9+j+FcP1OtPuxskwkhbcBrudkhSfoBKM
 MwmwBIod8AjBdQ/hY1VSFZgckrvCYWKj/O2in06m0I/WanJYb1r1IR60YOAcAziIdW
 QYWA/wf2slXq8an5oX99umRK55OTSZfqqlK7svVQ7zZjSWH1qmRk8TZE8MxVKrW29C
 cWzdu9fXmeqRxFHvDhtl27/CeRoyfGjJNhBAnXRLQMGg+xL3G10u4SszsT4uTcCqVc
 G6X77xbTuvtGQ==
Date: Wed, 23 Jul 2025 16:07:53 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Message-ID: <20250723210753.GA2911683@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACRpkdZHw8am05Qcjp7FJyo7D7bZcvzZKVjdB7BUCq3FuQCy8A@mail.gmail.com>
X-Mailman-Approved-At: Tue, 29 Jul 2025 06:48:52 +0000
Cc: robh@kernel.org, mani@kernel.org, linux-pci@vger.kernel.org,
 lpieralisi@kernel.org, linux-kernel@vger.kernel.org,
 Christian Bruel <christian.bruel@foss.st.com>, mcoquelin.stm32@gmail.com,
 linux-gpio@vger.kernel.org, bhelgaas@google.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 kwilczynski@kernel.org
Subject: Re: [Linux-stm32] [RESEND PATCH 0/2] Add
 pinctrl_pm_select_init_state helper function
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

T24gV2VkLCBKdWwgMjMsIDIwMjUgYXQgMDE6MzI6NTJQTSArMDIwMCwgTGludXMgV2FsbGVpaiB3
cm90ZToKPiBPbiBUaHUsIEp1bCAxNywgMjAyNSBhdCA4OjMz4oCvQU0gQ2hyaXN0aWFuIEJydWVs
Cj4gPGNocmlzdGlhbi5icnVlbEBmb3NzLnN0LmNvbT4gd3JvdGU6Cj4gCj4gPiBXZSBoYXZlIHRo
ZSBoZWxwZXIgZnVuY3Rpb25zIHBpbmN0cmxfcG1fc2VsZWN0X2RlZmF1bHRfc3RhdGUgYW5kCj4g
PiBwaW5jdHJsX3BtX3NlbGVjdF9zbGVlcF9zdGF0ZS4KPiA+IFRoaXMgcGF0Y2ggYWRkcyB0aGUg
bWlzc2luZyBwaW5jdHJsX3BtX3NlbGVjdF9pbml0X3N0YXRlIGZ1bmN0aW9uLgo+ID4KPiA+IFRo
ZSBTVE0zMk1QMiBuZWVkcyB0byBzZXQgdGhlIHBpbmN0cmwgdG8gYW4gaW5pdGlhbCBzdGF0ZSBk
dXJpbmcKPiA+IHBtX3Jlc3VtZSwganVzdCBsaWtlIGluIHByb2JlLiBUbyBhY2hpZXZlIHRoaXMs
IHRoZSBmdW5jdGlvbgo+ID4gcGluY3RybF9wbV9zZWxlY3RfaW5pdF9zdGF0ZSBpcyBhZGRlZC4K
PiA+Cj4gPiBUaGlzIGFsbG93cyBhIGRyaXZlciB0byBiYWxhbmNlIHBpbmN0cmxfcG1fc2VsZWN0
X3NsZWVwX3N0YXRlKCkKPiA+IHdpdGggcGluY3RybF9wbV9zZWxlY3RfZGVmYXVsdF9zdGF0ZSgp
IGFuZAo+ID4gcGluY3RybF9wbV9zZWxlY3RfaW5pdF9zdGF0ZSgpIGluIHBtX3J1bnRpbWVfc3Vz
cGVuZCBhbmQgcG1fcnVudGltZV9yZXN1bWUuCj4gPgo+ID4gQ2hyaXN0aWFuIEJydWVsICgyKToK
PiA+ICAgcGluY3RybDogQWRkIHBpbmN0cmxfcG1fc2VsZWN0X2luaXRfc3RhdGUgaGVscGVyIGZ1
bmN0aW9uCj4gPiAgIFBDSTogc3RtMzI6IHVzZSBwaW5jdHJsX3BtX3NlbGVjdF9pbml0X3N0YXRl
KCkgaW4KPiA+ICAgICBzdG0zMl9wY2llX3Jlc3VtZV9ub2lycSgpCj4gCj4gSWYgQmpvcm4gSGVs
Z2FhcyBpcyBPSyB3aXRoIGl0IEkgY2FuIGFwcGx5IHRoaXMgdG8gdGhlIHBpbmN0cmwgdHJlZS4K
PiAKPiBPdGhlcndpc2UgSSBjYW4gYWxzbyBqdXN0IGFwcGx5IHBhdGNoIDEvMiwgYnV0IHRoYXQg
ZG9lc24ndCBzb2x2ZQo+IGFueSBwcm9ibGVtLgoKVGhlIHN0bTMyIGRyaXZlciBoYXMgYmVlbiBw
b3N0ZWQgYW5kIGlzIG9uIHRoaXMgYnJhbmNoIG9mIHRoZSBQQ0kKdHJlZToKCiAgaHR0cHM6Ly9n
aXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvcGNpL3BjaS5naXQvbG9nLz9o
PWNvbnRyb2xsZXIvZHdjLXN0bTMyJmlkPTVhOTcyYTAxZTI0YgoKYnV0IGl0J3Mgbm90IGluIG1h
aW5saW5lIChvciBldmVuIGluIHBjaS9uZXh0KSB5ZXQsIHNvIHlvdSB3b3VsZCBvbmx5CmJlIGFi
bGUgdG8gYXBwbHkgcGF0Y2ggMi8yIGlmIHlvdSB0b29rIHRoZSB3aG9sZSBkcml2ZXIsIHdoaWNo
IGlzCnByb2JhYmx5IG1vcmUgdGhhbiB5b3Ugd291bGQgd2FudCB0byBkby4KCkkgaGF2ZW4ndCBw
dXQgaXQgaW4gcGNpL25leHQgeWV0IGJlY2F1c2UgaXQgZG9lc24ndCBidWlsZCB3aGVuCkNPTkZJ
R19QSU5DVFJMIGlzIG5vdCBkZWZpbmVkOgoKICBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIw
MjUwNzE2MTkyNDE4LkdBMjU1MDg2MUBiaGVsZ2FhcwoKSSBkb24ndCBrbm93IGVub3VnaCBhYm91
dCBwaW5jdHJsIHRvIGtub3cgd2h5IHN0bTMyIG5lZWRzIHRoaXMgd2hlbgpub2JvZHkgZWxzZSBz
ZWVtcyB0by4gIEkgZG91YnQgaXQncyByZWFsbHkgdW5pcXVlLCBzbyBtYXliZSBpdCdzIGp1c3QK
bm90IGRvaW5nIHRoZSByaWdodCB0aGluZyBoZXJlLgoKQmpvcm4KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0Ckxp
bnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
