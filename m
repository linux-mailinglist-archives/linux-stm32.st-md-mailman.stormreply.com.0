Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C5F47011C
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Dec 2021 14:01:36 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 84E40C5F1EA;
	Fri, 10 Dec 2021 13:01:36 +0000 (UTC)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3DC5BC5EC6C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Dec 2021 09:17:08 +0000 (UTC)
Date: Fri, 10 Dec 2021 10:17:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1639127827;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SrrpWGgf9+uiO2sWCKmxPg4yAkYkNCS2DX3oLevhhdU=;
 b=0+M5HkZ7rRvSfUvB3nU20IFpYjn5c5hh5759XiX1qFmZ5EAHBTHFBrClVCTVX/5KjeU0RW
 Jq/Ms1g4hQm/H6o/RR1qzT7tdzcE/TGdgANNFfF7SfXT1lHNnpmE0TGISlzq/NPKmEubff
 IfgLEiBsk4a1EitchxCXu3p27ZZc9m6Xf8mkOVnls9NL1i17rajXgNDlo8eP7I57RLXEOs
 rAVZTRj8ktfXFSFVyLvGBrbmhqrMcO/4X3ApgDy/hmiAr8SZdMkwylE5PA8ljvgAbSAkaj
 Dq0Fl54faONo8zr2cduIK+tJcv8r0AHytzHQrSh59IVe7RerqnVsT6yTKpSr0w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1639127827;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SrrpWGgf9+uiO2sWCKmxPg4yAkYkNCS2DX3oLevhhdU=;
 b=0saKW2xNPpi+A5De4Ui8UB9vBldZR0H8mbo0Pi8XxsFQckrvMx2ZrQ5xNMlTacICe8gx4c
 NVlKV0UkzScyW2DA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Ong Boon Leong <boon.leong.ong@intel.com>
Message-ID: <YbMbEclmABxiozb/@linutronix.de>
References: <20211209130335.81114-1-boon.leong.ong@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211209130335.81114-1-boon.leong.ong@intel.com>
X-Mailman-Approved-At: Fri, 10 Dec 2021 13:01:35 +0000
Cc: Alexandre Torgue <alexandre.torgue@st.com>, netdev@vger.kernel.org,
 Kurt Kanzenbach <kurt@linutronix.de>, alexandre.torgue@foss.st.com,
 linux-stm32@st-md-mailman.stormreply.com, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net 1/1] net: stmmac: fix tc flower
 deletion for VLAN priority Rx steering
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

T24gMjAyMS0xMi0wOSAyMTowMzozNSBbKzA4MDBdLCBPbmcgQm9vbiBMZW9uZyB3cm90ZToK4oCm
Cj4gRnJvbSBkbWVzZywgd2Ugd2lsbCBvYnNlcnZlIGtlcm5lbCBOVUxMIHBvaW50ZXIgb29vcHMK
PiAKPiBbICAxOTcuMTcwNDY0XSBCVUc6IGtlcm5lbCBOVUxMIHBvaW50ZXIgZGVyZWZlcmVuY2Us
IGFkZHJlc3M6IDAwMDAwMDAwMDAwMDAwMDAK4oCmCj4gWyAgMTk3LjE3MTM2N10gLS0tWyBlbmQg
dHJhY2UgOGI4ZDFjNjE3YzM5MDkzZCBdLS0tCgpDb3VsZCB0aGUgaHVnZSBhbW91bnQgb2YgYmFj
a3RyYWNlIGJlIHBhcnNlZCBhbmQgY29udmVydGVkIGludG8gdGhlCm5lZWRlZCBpbmZvcm1hdGlv
bi4gVGhhdCBjb3VsZCBiZSB3aHkgaXMgdGhlIE5VTEwgcG9pbnRlciBoYXBwZW5pbmcuIFRoZQpu
b3RhdGlvbiBvZiB0aGUgY2FsbCBjaGFpbiBtYWtlcyBzZW5zZSBpZiBpbXBvcnRhbnQgdG8gdGhl
IGlzc3VlIGFuZCBub3QKb2J2aW91cy4gQWxzbyBhIG5pY2UgZm9sbG93LXVwIGhvdyB0aGUgaXNz
dWUgaXMgYWRkcmVzc2VkLgoKU2ViYXN0aWFuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBz
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
