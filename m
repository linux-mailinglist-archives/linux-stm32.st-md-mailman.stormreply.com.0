Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BFE680F16B
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Dec 2023 16:46:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 38EE0C6C85B;
	Tue, 12 Dec 2023 15:46:39 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F2AD1C6B47F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Dec 2023 15:46:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C8236617EA;
 Tue, 12 Dec 2023 15:46:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB37BC433C7;
 Tue, 12 Dec 2023 15:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702395995;
 bh=QdFOL5GvOmMjeT6ecJwNi7r1ylofZKmjdO216ly8fKY=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=CcFK03V9l8qE3zl4R/Qpxj4+eR9xKsYRNwj7tEbnyqZaT8/AnTlsRUoXvnLrPSVAh
 +px0wae8aDtMedHB/MSvmCEghN6TgfFqMvo1R+4MoekhjKzNJ3lrRajEZSm7rCjgtD
 INevh84+LJortP+519bg/SRRMbewMCjaweuMEIKItkOj6tzMJvbQ7ftQjIfyvlCUj/
 9l62DcxBEv+rWQmICB4EXuxCMySsc6d67IBCckPEwbw3zV/OtVxEZccmgukSdurzfq
 6c3ZEgs3kLdc4dSaAZYNnT+2GtIy/kQysEwJZ4jD6It7QIVcNttn1+kBZvLCiW7O98
 ex5U9cg4Jjbbg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
In-Reply-To: <cover.1701778038.git.u.kleine-koenig@pengutronix.de>
References: <cover.1701778038.git.u.kleine-koenig@pengutronix.de>
Message-Id: <170239599261.81481.1924826267147407361.b4-ty@kernel.org>
Date: Tue, 12 Dec 2023 15:46:32 +0000
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-5c066
Cc: kernel@pengutronix.de, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Marek Vasut <marek.vasut+renesas@gmail.com>
Subject: Re: [Linux-stm32] [PATCH 0/8] regulator: Convert to platform remove
 callback returning void
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

T24gVHVlLCAwNSBEZWMgMjAyMyAxMzoyNjoxNSArMDEwMCwgVXdlIEtsZWluZS1Lw7ZuaWcgd3Jv
dGU6Cj4gdGhpcyBzZXJpZXMgY29udmVydHMgYWxsIGRyaXZlcnMgYmVsb3cgZHJpdmVycy9yZWd1
bGF0b3IgdG8gc3RydWN0Cj4gcGxhdGZvcm1fZHJpdmVyOjpyZW1vdmVfbmV3KCkuIFNlZSBjb21t
aXQgNWM1YTc2ODBlNjdiICgicGxhdGZvcm06Cj4gUHJvdmlkZSBhIHJlbW92ZSBjYWxsYmFjayB0
aGF0IHJldHVybnMgbm8gdmFsdWUiKSBmb3IgYW4gZXh0ZW5kZWQKPiBleHBsYW5hdGlvbiBhbmQg
dGhlIGV2ZW50dWFsIGdvYWwuCj4gCj4gQWxsIGNvbnZlcnNhdGlvbnMgYXJlIHRyaXZpYWwsIGJl
Y2F1c2UgYWxsIC5yZW1vdmUoKSBjYWxsYmFja3MgcmV0dXJuZWQKPiB6ZXJvIHVuY29uZGl0aW9u
YWxseS4KPiAKPiBbLi4uXQoKQXBwbGllZCB0bwoKICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9w
dWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvYnJvb25pZS9yZWd1bGF0b3IuZ2l0IGZvci1uZXh0CgpU
aGFua3MhCgpbMS84XSByZWd1bGF0b3I6IGFyaXpvbmEtbGRvMTogQ29udmVydCB0byBwbGF0Zm9y
bSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQKICAgICAgY29tbWl0OiAwMzU2MGZmMDhk
MjgzOWQ3MzgxZjE4NTc2YjMyOWEyZWVlNWNmYjM3ClsyLzhdIHJlZ3VsYXRvcjogYmQ5NTcxbXd2
OiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZAogICAg
ICBjb21taXQ6IGNkZGRhNmY1ZjQ3ZjdjYjEzMTkxYjc3NTNiYzM4ODI5NDBiNmYzMjUKWzMvOF0g
cmVndWxhdG9yOiBkYjg1MDAtcHJjbXU6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxi
YWNrIHJldHVybmluZyB2b2lkCiAgICAgIGNvbW1pdDogMDIxMGE2MGFhZDAyMTQ5ZDg1MDNkMjU5
NTI1YmZiZTBlOTlmOGNiMgpbNC84XSByZWd1bGF0b3I6IHN0bTMyLXZyZWZidWY6IENvbnZlcnQg
dG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCiAgICAgIGNvbW1pdDog
NmYzODJhMGM3ZWMxMmY4NWY0ZTQwZDUzNDNiYTUzZjE2ZjU0M2NjYgpbNS84XSByZWd1bGF0b3I6
IHVuaXBoaWVyOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcg
dm9pZAogICAgICBjb21taXQ6IDk2NDU3NTE3OTY2M2RiNzA4MzJlMzc0ZWRmYWNjOTE1MzllNzgz
ZDMKWzYvOF0gcmVndWxhdG9yOiB1c2Vyc3BhY2UtY29uc3VtZXI6IENvbnZlcnQgdG8gcGxhdGZv
cm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCiAgICAgIGNvbW1pdDogM2IyZThlOTg2
OTJiMjA0MzZkMDM0NmZjNmFkZmZmZjFiNTk2ZDUwZgpbNy84XSByZWd1bGF0b3I6IHZpcnR1YWw6
IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCiAgICAg
IGNvbW1pdDogZDYzN2E3NWVkZTNkYjg0ZjdhZTRiYzJhYjM5OGZlMjIzMmYyMmMyNgpbOC84XSBy
ZWd1bGF0b3I6IHdtODM1MDogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0
dXJuaW5nIHZvaWQKICAgICAgY29tbWl0OiA4ZDZmYWI1MmYzZmRhZWI4YWFiZmQwNDZkOTVlNWQz
Zjk0NjQzOTllCgpBbGwgYmVpbmcgd2VsbCB0aGlzIG1lYW5zIHRoYXQgaXQgd2lsbCBiZSBpbnRl
Z3JhdGVkIGludG8gdGhlIGxpbnV4LW5leHQKdHJlZSAodXN1YWxseSBzb21ldGltZSBpbiB0aGUg
bmV4dCAyNCBob3VycykgYW5kIHNlbnQgdG8gTGludXMgZHVyaW5nCnRoZSBuZXh0IG1lcmdlIHdp
bmRvdyAob3Igc29vbmVyIGlmIGl0IGlzIGEgYnVnIGZpeCksIGhvd2V2ZXIgaWYKcHJvYmxlbXMg
YXJlIGRpc2NvdmVyZWQgdGhlbiB0aGUgcGF0Y2ggbWF5IGJlIGRyb3BwZWQgb3IgcmV2ZXJ0ZWQu
CgpZb3UgbWF5IGdldCBmdXJ0aGVyIGUtbWFpbHMgcmVzdWx0aW5nIGZyb20gYXV0b21hdGVkIG9y
IG1hbnVhbCB0ZXN0aW5nCmFuZCByZXZpZXcgb2YgdGhlIHRyZWUsIHBsZWFzZSBlbmdhZ2Ugd2l0
aCBwZW9wbGUgcmVwb3J0aW5nIHByb2JsZW1zIGFuZApzZW5kIGZvbGxvd3VwIHBhdGNoZXMgYWRk
cmVzc2luZyBhbnkgaXNzdWVzIHRoYXQgYXJlIHJlcG9ydGVkIGlmIG5lZWRlZC4KCklmIGFueSB1
cGRhdGVzIGFyZSByZXF1aXJlZCBvciB5b3UgYXJlIHN1Ym1pdHRpbmcgZnVydGhlciBjaGFuZ2Vz
IHRoZXkKc2hvdWxkIGJlIHNlbnQgYXMgaW5jcmVtZW50YWwgdXBkYXRlcyBhZ2FpbnN0IGN1cnJl
bnQgZ2l0LCBleGlzdGluZwpwYXRjaGVzIHdpbGwgbm90IGJlIHJlcGxhY2VkLgoKUGxlYXNlIGFk
ZCBhbnkgcmVsZXZhbnQgbGlzdHMgYW5kIG1haW50YWluZXJzIHRvIHRoZSBDQ3Mgd2hlbiByZXBs
eWluZwp0byB0aGlzIG1haWwuCgpUaGFua3MsCk1hcmsKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1z
dG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
