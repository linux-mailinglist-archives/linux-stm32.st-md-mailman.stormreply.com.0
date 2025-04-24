Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0508CA9AE2C
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Apr 2025 15:01:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AA37EC78F68;
	Thu, 24 Apr 2025 13:01:22 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4EA9CC7803A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Apr 2025 13:01:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C42905C63C0;
 Thu, 24 Apr 2025 12:59:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE734C4CEE8;
 Thu, 24 Apr 2025 13:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745499679;
 bh=w4ERmlgT37R8fqbbx4uVzFLB0bFMUP+qmxc5xgde/7k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pxm6+iDHVTleShgiF8bFeJvckCUPbkg57ANzPMtBwns7jfQzzmQz0EFJ05T112lwB
 WMYmpudJjzcHgAOUsrdINVZwv2/j3JmqCXznxVSHQq2h8faiVnOKb2RPegnUC/8c7p
 CHaM/QMNsb9S3xfYYv2Uod/Thx792cyS2aY6xTHFYMs9lM9RC3snvzyGXMCbGnsq0q
 S9nGIj8WSYURRlSOIHYy78OF6pj5n9fb8Tqqt9Sn/E9qC4HqxLGOVqzFxJrudWvFAS
 cqzpZUf5gYP+kfQp7RKfjlVq62KmV3pjTBFhnjHgok0FqDpTUNUI3do98G9jOCTAvJ
 KbiBb+ril+iaQ==
Date: Thu, 24 Apr 2025 14:01:12 +0100
From: Lee Jones <lee@kernel.org>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <20250424130112.GD8734@google.com>
References: <20250314171451.3497789-1-fabrice.gasnier@foss.st.com>
 <20250314171451.3497789-3-fabrice.gasnier@foss.st.com>
 <20250404144006.GB372032@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250404144006.GB372032@google.com>
Cc: robh@kernel.org, conor+dt@kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-iio@vger.kernel.org, catalin.marinas@arm.com,
 daniel.lezcano@linaro.org, linux-pwm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, ukleinek@kernel.org,
 linux-arm-kernel@lists.infradead.org, krzk+dt@kernel.org, will@kernel.org,
 tglx@linutronix.de, jic23@kernel.org, wbg@kernel.org
Subject: Re: [Linux-stm32] [PATCH v4 2/8] mfd: stm32-lptimer: add support
	for stm32mp25
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

T24gRnJpLCAwNCBBcHIgMjAyNSwgTGVlIEpvbmVzIHdyb3RlOgoKPiBPbiBGcmksIDE0IE1hciAy
MDI1LCBGYWJyaWNlIEdhc25pZXIgd3JvdGU6Cj4gCj4gPiBBZGQgc3VwcG9ydCBmb3IgU1RNMzJN
UDI1IFNvQy4KPiA+IEEgbmV3IGhhcmR3YXJlIGNvbmZpZ3VyYXRpb24gcmVnaXN0ZXIgKEhXQ0ZH
UjIpIGhhcyBiZWVuIGFkZGVkLCB0byBnYXRoZXIKPiA+IG51bWJlciBvZiBjYXB0dXJlL2NvbXBh
cmUgY2hhbm5lbHMsIGF1dG9ub21vdXMgbW9kZSBhbmQgaW5wdXQgY2FwdHVyZQo+ID4gY2FwYWJp
bGl0eS4gVGhlIGZ1bGwgZmVhdHVyZSBzZXQgaXMgaW1wbGVtZW50ZWQgaW4gTFBUSU0xLzIvMy80
LiBMUFRJTTUKPiA+IHN1cHBvcnRzIGEgc21hbGxlciBzZXQgb2YgZmVhdHVyZXMuIFRoaXMgY2Fu
IG5vdyBiZSByZWFkIGZyb20gSFdDRkdSCj4gPiByZWdpc3RlcnMuCj4gPiAKPiA+IEFkZCBuZXcg
cmVnaXN0ZXJzIHRvIHRoZSBzdG0zMi1scHRpbWVyLmg6IENDTVIxLCBDQ1IyLCBIV0NGR1IxLzIg
YW5kIFZFUlIuCj4gPiBVcGRhdGUgdGhlIHN0bTMyX2xwdGltZXIgZGF0YSBzdHJ1Y3Qgc28gc2ln
bmFsIHRoZSBudW1iZXIgb2YKPiA+IGNhcHR1cmUvY29tcGFyZSBjaGFubmVscyB0byB0aGUgY2hp
bGQgZGV2aWNlcy4KPiA+IEFsc28gUmVtb3ZlIHNvbWUgdW51c2VkIGJpdCBtYXNrcyAoQ01QT0tf
QVJST0sgLyBDTVBPS0NGX0FSUk9LQ0YpLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBGYWJyaWNl
IEdhc25pZXIgPGZhYnJpY2UuZ2FzbmllckBmb3NzLnN0LmNvbT4KPiA+IC0tLQo+ID4gQ2hhbmdl
cyBpbiBWNDoKPiA+IC0gQWRkIERJRVJPSywgQVJST0sgc3RhdHVzIGZsYWdzLCBhbmQgdGhlaXIg
Y2xlYXIgZmxhZ3MuCj4gPiBDaGFuZ2VzIGluIFYyOgo+ID4gLSByZWx5IG9uIGZhbGxiYWNrIGNv
bXBhdGlibGUgYXMgbm8gc3BlY2lmaWMgLmRhdGEgaXMgYXNzb2NpYXRlZCB0byB0aGUKPiA+ICAg
ZHJpdmVyLiBDb21wYXRpYmlsaXR5IGlzIGFkZGVkIGJ5IHJlYWRpbmcgaGFyZHdhcmUgY29uZmln
dXJhdGlvbgo+ID4gICByZWdpc3RlcnMuCj4gPiAtIHJlYWQgdmVyc2lvbiByZWdpc3RlciwgdG8g
YmUgdXNlZCBieSBjbG9ja2V2ZW50IGNoaWxkIGRyaXZlcgo+ID4gLSByZW5hbWUgcmVnaXN0ZXIv
Yml0cyBkZWZpbml0aW9ucwo+ID4gLS0tCj4gPiAgZHJpdmVycy9tZmQvc3RtMzItbHB0aW1lci5j
ICAgICAgIHwgMzMgKysrKysrKysrKysrKysrKysrKysrKysrKystCj4gPiAgaW5jbHVkZS9saW51
eC9tZmQvc3RtMzItbHB0aW1lci5oIHwgMzcgKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0t
LQo+IAo+IEF0IGxlYXN0IHRoZSBDbG9ja3NvdXJjZSBkcml2ZXIgZGVwZW5kcyBvbiB0aGlzLgo+
IAo+IEkgbmVlZCBBY2tzIGZyb20gdGhlIG90aGVyIE1haW50YWluZXJzIGJlZm9yZSBJIGNhbiBt
ZXJnZSB0aGlzLgoKU3VnZ2VzdCB5b3UgcmVzdWJtaXQgdGhlIHNldCBhcyBhIFtSRVNFTkRdIHRv
IHJlLWdhaW4gdHJhY3Rpb24uCgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcg
bGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
