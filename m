Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E79AC4F6B
	for <lists+linux-stm32@lfdr.de>; Tue, 27 May 2025 15:15:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4B68AC36B1E;
	Tue, 27 May 2025 13:15:20 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4A9D8C36B19
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 May 2025 13:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
 Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
 In-Reply-To:References; bh=JprIsYNIPoxyHns3ZiuAwn+9eyHxv4Lgti7x5LNjShc=; b=AF
 uyeuTyib24Ok9CdkIeRRn5HV0GkV8OSq1pHQwE4IYQ/1T77StuvLRzK0xL6saABwYOq1/invOrr6w
 JkSMrI+UIJGylzyvyvztiUG2E4YKbkQnWL+uoAjE9+XYPk7eHZ4y1B1ZIrNa5ZL0y53W5rYGZarIK
 rWstZv6hJ1yQVQ8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1uJu8u-00E4ti-AJ; Tue, 27 May 2025 15:14:56 +0200
Date: Tue, 27 May 2025 15:14:56 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Message-ID: <7bde400c-add3-47c7-bbbf-311aa8270ccf@lunn.ch>
References: <20250526161621.3549-1-sensor1010@163.com>
 <be687d2d-4c16-46d6-8828-b0e4866d91de@wanadoo.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <be687d2d-4c16-46d6-8828-b0e4866d91de@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 jonas@kwiboo.se, =?utf-8?B?5p2O5ZOy?= <sensor1010@163.com>,
 jan.petrous@oss.nxp.com, wens@csie.org, andrew+netdev@lunn.ch,
 edumazet@google.com, netdev@vger.kernel.org, mcoquelin.stm32@gmail.com,
 david.wu@rock-chips.com, kuba@kernel.org, pabeni@redhat.com,
 rmk+kernel@armlinux.org.uk, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: dwmac-rk: No need to check the
 return value of the phy_power_on()
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

T24gVHVlLCBNYXkgMjcsIDIwMjUgYXQgMDc6NDM6NTdBTSArMDIwMCwgQ2hyaXN0b3BoZSBKQUlM
TEVUIHdyb3RlOgo+IExlIDI2LzA1LzIwMjUgw6AgMTg6MTYsIOadjuWTsiBhIMOpY3JpdMKgOgo+
ID4gc2luY2UgdGhlIHJldHVybiB2YWx1ZSBvZiB0aGUgcGh5X3Bvd2VyX29uKCkgZnVuY3Rpb24g
aXMgYWx3YXlzIDAsCj4gPiBjaGVja2luZyBpdHMgcmV0dXJuIHZhbHVlIGlzIHJlZHVuZGFudC4K
PiAKPiBDYW4geW91IGVsYWJvcmF0ZSB3aHk/Cj4gCj4gTG9va2luZyBhdCAgKDFdLCBJIHRoaW5r
IHRoYXQgaXQgaXMgb2J2aW91cyB0aGF0IG5vbi0wIHZhbHVlcyBjYW4gYmUKPiByZXR1cm5lZC4K
Cldyb25nIHBoeV9wb3dlcl9vbigpLiBUaGVyZSBpcyBhIGxvY2FsIHNjb3BlIG9uZSB3aXRoaW4g
dGhlIGRyaXZlci4KCglBbmRyZXcKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
L21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
