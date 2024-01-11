Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E49582ADB2
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Jan 2024 12:40:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4F097C6DD66;
	Thu, 11 Jan 2024 11:40:30 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7067CC6B452
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Jan 2024 11:40:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 28C4261989;
 Thu, 11 Jan 2024 11:40:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 304CFC433F1;
 Thu, 11 Jan 2024 11:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1704973226;
 bh=rGE5aLBgG8rJvHpHzdIZ5UZ/WMT/chk9s1YqtP4odSs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uq87kzgyV/Bo+E6Sqqkjo3Vi1g2cOMAEMp+AVTWTFrlgZ+OsW4JJmm8CQ4cEAH4Dt
 tCw1JPLKu1P0sjntzy9JoNDwfX2a+fAzSIONCete70Mcnfk1ZY1hIkwLTbgkEWetzr
 sTEPFZtxbzXahrF3Zk0xIOOlOIZvBs9X8t2EGIQJLNU1BrgK05cG/v4bSB7gKeKzty
 lfgEK9mginYvPfkX6/8/8HMTILVqGgOEBKSjUjna0i1q/cKM2i3fLTsOhgEqUqoe3S
 gQwe4Zte45/KDRXtESj9PtJ2ugYoUPCdmJ8IBvwjA/db97f6xOJd9Km/cIRCUrWA0s
 ydDPWUgG2RrVQ==
Date: Thu, 11 Jan 2024 11:40:21 +0000
From: Lee Jones <lee@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20240111114021.GJ1678981@google.com>
References: <20240111113146.16011-1-dario.binacchi@amarulasolutions.com>
 <20240111113146.16011-2-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240111113146.16011-2-dario.binacchi@amarulasolutions.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-kernel@vger.kernel.org,
 Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-amarula@amarulasolutions.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v7 1/5] dt-bindings: mfd: stm32f7: Add
 binding definition for DSI
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

T24gVGh1LCAxMSBKYW4gMjAyNCwgRGFyaW8gQmluYWNjaGkgd3JvdGU6Cgo+IEFkZCBiaW5kaW5n
IGRlZmluaXRpb24gZm9yIE1JUEkgRFNJIEhvc3QgY29udHJvbGxlci4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBEYXJpbyBCaW5hY2NoaSA8ZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20+
Cj4gQWNrZWQtYnk6IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+Cj4g
Cj4gLS0tCj4gCj4gKG5vIGNoYW5nZXMgc2luY2UgdjIpCj4gCj4gQ2hhbmdlcyBpbiB2MjoKPiAt
IEFkZCBBY2tlZC1ieSB0YWcgb2YgQ29ub3IgRG9vbGV5Cj4gCj4gIGluY2x1ZGUvZHQtYmluZGlu
Z3MvbWZkL3N0bTMyZjctcmNjLmggfCAxICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspCgpBY2tlZC1ieTogTGVlIEpvbmVzIDxsZWVAa2VybmVsLm9yZz4KCj4gZGlmZiAtLWdpdCBh
L2luY2x1ZGUvZHQtYmluZGluZ3MvbWZkL3N0bTMyZjctcmNjLmggYi9pbmNsdWRlL2R0LWJpbmRp
bmdzL21mZC9zdG0zMmY3LXJjYy5oCj4gaW5kZXggOGQ3M2E5YzUxZTJiLi5hNGU0ZjkyNzEzOTUg
MTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9kdC1iaW5kaW5ncy9tZmQvc3RtMzJmNy1yY2MuaAo+ICsr
KyBiL2luY2x1ZGUvZHQtYmluZGluZ3MvbWZkL3N0bTMyZjctcmNjLmgKPiBAQCAtMTA4LDYgKzEw
OCw3IEBACj4gICNkZWZpbmUgU1RNMzJGN19SQ0NfQVBCMl9TQUkxCQkyMgo+ICAjZGVmaW5lIFNU
TTMyRjdfUkNDX0FQQjJfU0FJMgkJMjMKPiAgI2RlZmluZSBTVE0zMkY3X1JDQ19BUEIyX0xUREMJ
CTI2Cj4gKyNkZWZpbmUgU1RNMzJGN19SQ0NfQVBCMl9EU0kJCTI3Cj4gIAo+ICAjZGVmaW5lIFNU
TTMyRjdfQVBCMl9SRVNFVChiaXQpCShTVE0zMkY3X1JDQ19BUEIyXyMjYml0ICsgKDB4MjQgKiA4
KSkKPiAgI2RlZmluZSBTVE0zMkY3X0FQQjJfQ0xPQ0soYml0KQkoU1RNMzJGN19SQ0NfQVBCMl8j
I2JpdCArIDB4QTApCj4gLS0gCj4gMi40My4wCj4gCgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9d
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0
bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
Cmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXN0bTMyCg==
