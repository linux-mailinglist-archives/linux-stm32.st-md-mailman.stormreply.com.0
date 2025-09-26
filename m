Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B22BA22AC
	for <lists+linux-stm32@lfdr.de>; Fri, 26 Sep 2025 03:52:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1147EC3F95D;
	Fri, 26 Sep 2025 01:52:35 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 29DE5C3F94F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 26 Sep 2025 01:52:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A644A4477D;
 Fri, 26 Sep 2025 01:52:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C302BC4CEF0;
 Fri, 26 Sep 2025 01:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758851552;
 bh=O8SEbiV6bsY5wk64SP2GhKRTTTiaEXDFSuX28Ph1mjg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=FMB7Xx9105TLqKoh1eoqR0qRNhgr14jO3tRI1OchdSW2gQCzp3jbBaNCQqBxfDSNg
 KqqJFu2EKPQMUEOdCOx+tlE0pubYwQ2IqPpHXDmyB1j5P7y0+6Q7grJymYg5sANG6d
 uH7lsHvSva+WWyHgufaCC9jStvSoFTJhTtUG2umoHBevxEIicsu3OcTgo0uSqOMisS
 3RS/BzofuflXzDC0oHFqgOPSkD9a8Glc0SpTQS2xoPSLXl3C9wmNkIyBDPGkYYWMpJ
 NvJnOcYkzd7xM76Ql2RLLL/0oE1jdFecH0EOm0jhiyRDvMWemB1IcNVw2MSSODcbS9
 MfnadFklajciw==
Date: Thu, 25 Sep 2025 18:52:30 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "G Thomas, Rohan" <rohan.g.thomas@altera.com>
Message-ID: <20250925185230.62b4e2a5@kernel.org>
In-Reply-To: <157d21fc-4745-4fa3-b7b1-b9f33e2e926e@altera.com>
References: <20250915-qbv-fixes-v2-0-ec90673bb7d4@altera.com>
 <20250915-qbv-fixes-v2-2-ec90673bb7d4@altera.com>
 <20250917154920.7925a20d@kernel.org>
 <20250917155412.7b2af4f1@kernel.org>
 <a914f668-95b2-4e6d-bd04-01932fe0fe48@altera.com>
 <20250924160535.12c14ae9@kernel.org>
 <157d21fc-4745-4fa3-b7b1-b9f33e2e926e@altera.com>
MIME-Version: 1.0
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, linux-kernel@vger.kernel.org,
 Rohan G Thomas via B4 Relay <devnull+rohan.g.thomas.altera.com@kernel.org>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>, "Ng,
 Boon Khai" <boon.khai.ng@altera.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Rohan G Thomas <rohan.g.thomas@intel.com>, Paolo Abeni <pabeni@redhat.com>,
 Matthew Gerlach <matthew.gerlach@altera.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net v2 2/2] net: stmmac: Consider Tx VLAN
 offload tag length for maxSDU
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

T24gVGh1LCAyNSBTZXAgMjAyNSAxNjozMzoyMSArMDUzMCBHIFRob21hcywgUm9oYW4gd3JvdGU6
Cj4gV2hpbGUgdGVzdGluZyA4MDIuMUFEIHdpdGggWEdNQUMgaGFyZHdhcmUgdXNpbmcgYSBzaW1w
bGUgcGluZyB0ZXN0LCBJCj4gb2JzZXJ2ZWQgYW4gdW5leHBlY3RlZCBiZWhhdmlvcjogdGhlIGhh
cmR3YXJlIGFwcGVhcnMgdG8gaW5zZXJ0IGFuCj4gYWRkaXRpb25hbCA4MDIuMVEgQ1RBRyB3aXRo
IFZMQU4gSUQgMC4gRGVzcGl0ZSB0aGlzLCB0aGUgcGluZyB0ZXN0Cj4gZnVuY3Rpb25zIGNvcnJl
Y3RseS4KPiAKPiBIZXJl4oCZcyBhIHNuYXBzaG90IGZyb20gdGhlIHBjYXAgY2FwdHVyZWQgYXQg
dGhlIHJlbW90ZSBlbmQuIE91dGVyIFZMQU4KPiB0YWcgdXNlZCBpcyAxMDAgYW5kIGlubmVyIFZM
QU4gdGFnIHVzZWQgaXMgMjAwLgo+IAo+IEZyYW1lIDE6IDExMCBieXRlcyBvbiB3aXJlICg4ODAg
Yml0cyksIDExMCBieXRlcyBjYXB0dXJlZCAoODgwIGJpdHMpCj4gRXRoZXJuZXQgSUksIFNyYzog
PHNyYz4gKDxzcmM+KSwgRHN0OiA8ZHN0PiAoPGRzdD4pCj4gSUVFRSA4MDIuMWFkLCBJRDogMTAw
Cj4gODAyLjFRIFZpcnR1YWwgTEFOLCBQUkk6IDAsIERFSTogMCwgSUQ6IDAodW5leHBlY3RlZCkK
PiA4MDIuMVEgVmlydHVhbCBMQU4sIFBSSTogMCwgREVJOiAwLCBJRDogMjAwCj4gSW50ZXJuZXQg
UHJvdG9jb2wgVmVyc2lvbiA0LCBTcmM6IDE5Mi4xNjguNC4xMCwgRHN0OiAxOTIuMTY4LjQuMTEK
PiBJbnRlcm5ldCBDb250cm9sIE1lc3NhZ2UgUHJvdG9jb2wKCkFuZCB0aGUgcGFja2V0IGFycml2
ZXMgYXQgdGhlIGRyaXZlciB3aXRoIG9ubHkgdGhlIC4xUSBJRCAyMDAgcHVzaGVkPwoKSW5kZWVk
LCB0aGF0IGxvb2tzIGxpa2UgYSBwcm9ibGVtIHdpdGggdGhlIGRyaXZlcitIVyBpbnRlcmFjdGlv
bi4KSURLIHdoYXQgdGhlIHJpZ2h0IHRlcm1pbm9sb2d5IGlzIGJ1dCBJSVJDIFZMQU4gMCBpcyBu
b3QgYSByZWFsIFZMQU4sCmp1c3QgYW4gSUQgcmVzZXJ2ZWQgZm9yIGZyYW1lcyB0aGF0IGRvbid0
IGhhdmUgYSBWTEFOIElEIGJ1dCB3YW50IHRvCnVzZSB0aGUgcHJpb3JpdHkgZmllbGQuIFdoaWNo
IGV4cGxhaW5zIHdoeSBpdCAid29ya3MiLCByZWNlaXZlciBqdXN0Cmlnbm9yZXMgdGhhdCB0YWcu
IEJ1dCBpdCdzIGRlZmluaXRlbHkgbm90IGNvcnJlY3QgYmVjYXVzZSBzd2l0Y2hlcwpvbiB0aGUg
bmV0d29yayB3aWxsIG5vIHNlZSB0aGUgcmVhbCBDLVRBRyBhZnRlciB0aGUgUy1UQUcgaXMgc3Ry
aXBwZWQuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXN0bTMyCg==
