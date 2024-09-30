Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A58998A779
	for <lists+linux-stm32@lfdr.de>; Mon, 30 Sep 2024 16:43:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 45023C78002;
	Mon, 30 Sep 2024 14:43:54 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8750CC7129D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Sep 2024 14:43:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4D5F95C1008;
 Mon, 30 Sep 2024 14:43:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F900C4CEC7;
 Mon, 30 Sep 2024 14:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727707426;
 bh=Q2YuJhchLQ06poSHZTzxtq2r4V1ioxkny0f6QHo+LAU=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=ey1iSMRhogguUBkHmM2gdxTFxCJ7EEaHnXOcz/fEy5qg/C9Td8rGsuQ7vjC2cL8XD
 J/Vt2agO32fRKlkQCoZOfyveSJl4UO9WKfZL2cH50mSKPTJUxL63RaT/nTapEKmjwI
 1Cr6J+GBsxFOxBkmlzGYyMYW1JUXtGzyAM2ELYUjb5n0WkouJAgnLmBCZfXt2OVyuZ
 vRdGVUn9N86kTUKjUUbSPIBAuk9JsQtvf/Yn/i2XJteH/y3yeQVHGou5ufb8pf2bnY
 LMitkZa96iQc1mxIOgHrJGnN2GobBb94MfFWkBuqDK76Aqse7jJ8MA30wHU14q1Jrm
 R5PpBJR8u5BRQ==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Nishanth Menon <nm@ti.com>
In-Reply-To: <20240903184710.1552067-1-nm@ti.com>
References: <20240903184710.1552067-1-nm@ti.com>
Message-Id: <172770742318.523866.16912261914335612487.b4-ty@kernel.org>
Date: Mon, 30 Sep 2024 15:43:43 +0100
MIME-Version: 1.0
X-Mailer: b4 0.13.0
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 Shawn Guo <shawnguo@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] (subset) [PATCH V2] mfd: syscon: Use regmap
 max_register_is_0 as needed
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

T24gVHVlLCAwMyBTZXAgMjAyNCAxMzo0NzoxMCAtMDUwMCwgTmlzaGFudGggTWVub24gd3JvdGU6
Cj4gc3lzY29uIGhhcyBhbHdheXMgc2V0IHRoZSBvcHRpb25hbCBtYXhfcmVnaXN0ZXIgY29uZmln
dXJhdGlvbiBvZgo+IHJlZ21hcCB0byBlbnN1cmUgdGhlIGNvcnJlY3QgY2hlY2tzIGFyZSBpbiBw
bGFjZS4gSG93ZXZlciwgYSByZWNlbnQKPiBjb21taXQgMGVjNzRhZDNjMTU3ICgicmVnbWFwOiBy
ZXdvcmsgLT5tYXhfcmVnaXN0ZXIgaGFuZGxpbmciKQo+IGludHJvZHVjZWQgZXhwbGljaXQgY29u
ZmlndXJhdGlvbiBpbiByZWdtYXAgZnJhbWV3b3JrIGZvciByZWdpc3Rlcgo+IG1hcHMgdGhhdCBp
cyBleGFjdGx5IDEgcmVnaXN0ZXIsIHdoZW4gbWF4X3JlZ2lzdGVyIGlzIHBvaW50aW5nIHRvIGEK
PiB2YWxpZCByZWdpc3RlciAwLiBUaGlzIGNvbW1pdCBzb2x2ZWQgYSBwcmV2aW91cyBsaW1pdGF0
aW9uIG9mIHJlZ21hcAo+IGZyYW1ld29yay4KPiAKPiBbLi4uXQoKQXBwbGllZCwgdGhhbmtzIQoK
WzEvMV0gbWZkOiBzeXNjb246IFVzZSByZWdtYXAgbWF4X3JlZ2lzdGVyX2lzXzAgYXMgbmVlZGVk
CiAgICAgIGNvbW1pdDogYmY1YjJkZGYwNmRhNTdmYTYyM2MxMWQ1OTk2OTdhOThmMTAwNzc1MgoK
LS0KTGVlIEpvbmVzIFvmnY7nkLzmlq9dCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
