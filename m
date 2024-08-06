Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B784949C23
	for <lists+linux-stm32@lfdr.de>; Wed,  7 Aug 2024 01:13:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F077CC7129D;
	Tue,  6 Aug 2024 23:13:44 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1A90BC71289
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Aug 2024 23:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
 Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
 In-Reply-To:References; bh=iAbyq20dr/x8DIIqscYsYZaTUTmMS9DPb7crcF4AiLE=; b=uL
 s855XjjIZTiEaNprML52m6TpWaRk+3WiFLVjMZTwodWlRB7qBu1zHoVudMrApkP9omrQtnBTmimvy
 ylUL8GQkuq/GuM5GdjmLEx9RZpDaR6c9TuYoRZyzOn1rNk59xhd/Ht+166Ytxa58qmwig7MZ6t2K8
 SVVb2z1z97Kp9XU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1sbTMt-0049dj-Ai; Wed, 07 Aug 2024 01:13:27 +0200
Date: Wed, 7 Aug 2024 01:13:27 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
Message-ID: <e6b4fc20-a861-4f24-9881-f8151fe66351@lunn.ch>
References: <20240802031822.1862030-1-jitendra.vegiraju@broadcom.com>
 <20240802031822.1862030-3-jitendra.vegiraju@broadcom.com>
 <1e6e6eaa-3fd3-4820-bc1d-b1c722610e2f@lunn.ch>
 <CAMdnO-J-G2mUw=RySEMSUj8QmY7CyFe=Si1-Ez9PAuF+knygWQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMdnO-J-G2mUw=RySEMSUj8QmY7CyFe=Si1-Ez9PAuF+knygWQ@mail.gmail.com>
Cc: hawk@kernel.org, daniel@iogearbox.net, linux@armlinux.org.uk,
 netdev@vger.kernel.org, richardcochran@gmail.com, john.fastabend@gmail.com,
 ast@kernel.org, linux-stm32@st-md-mailman.stormreply.com, horms@kernel.org,
 edumazet@google.com, joabreu@synopsys.com,
 bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org,
 mcoquelin.stm32@gmail.com, florian.fainelli@broadcom.com, kuba@kernel.org,
 bpf@vger.kernel.org, pabeni@redhat.com, davem@davemloft.net,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH net-next v3 2/3] net: stmmac: Integrate
 dwxgmac4 into stmmac hwif handling
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

T24gTW9uLCBBdWcgMDUsIDIwMjQgYXQgMDU6MzY6MzBQTSAtMDcwMCwgSml0ZW5kcmEgVmVnaXJh
anUgd3JvdGU6Cj4gSGkgQW5kcmV3LAo+IE9uIEZyaSwgQXVnIDIsIDIwMjQgYXQgMzo1OeKAr1BN
IEFuZHJldyBMdW5uIDxhbmRyZXdAbHVubi5jaD4gd3JvdGU6Cj4gPgo+ID4gPiArICAgICB1c2Vy
X3ZlciA9IHN0bW1hY19nZXRfdXNlcl92ZXJzaW9uKHByaXYsIEdNQUM0X1ZFUlNJT04pOwo+ID4g
PiArICAgICBpZiAocHJpdi0+c3lub3BzeXNfaWQgPT0gRFdYR01BQ19DT1JFXzRfMDAgJiYKPiA+
ID4gKyAgICAgICAgIHVzZXJfdmVyID09IERXWEdNQUNfVVNFUl9WRVJfWDIyKQo+ID4gPiArICAg
ICAgICAgICAgIG1hYy0+ZG1hID0gJmR3eGdtYWM0MDBfZG1hX29wczsKPiA+Cj4gPiBJIGtub3cg
bm90aGluZyBhYm91dCB0aGlzIGhhcmR3YXJlLi4uLgo+ID4KPiA+IERvZXMgcHJpdi0+c3lub3Bz
eXNfaWQgPT0gRFdYR01BQ19DT1JFXzRfMCBub3QgaW1wbHkKPiA+IGR3eGdtYWM0MDBfZG1hX29w
cz8KPiA+Cj4gPiBDb3VsZCBhIHVzZXIgc3ludGhlc2lzZSBEV1hHTUFDX0NPUkVfNF8wMCB3aXRo
b3V0IHVzaW5nCj4gPiBkd3hnbWFjNDAwX2RtYV9vcHM/IENvdWxkIGR3eGdtYWM1MDBfZG1hX29w
cyBvciBkd3hnbWFjMTAwX2RtYV9vcHMgYmUKPiA+IHVzZWQ/Cj4gWWVzLCB0aGUgdXNlciBjYW4g
Y2hvb3NlIGJldHdlZW4gRW5oYW5jZWQgRE1BICwgSHlwZXIgRE1BICwgTm9ybWFsIERNQS4KPiBU
aGlzIFNvQyBzdXBwb3J0IGhhcyBjaG9zZW4gSHlwZXIgRE1BIGZvciBmdXR1cmUgZXhwYW5kYWJp
bGl0eS4KCklzIHRoZXJlIGEgcmVnaXN0ZXIgd2hpY2ggZGVzY3JpYmVzIHRoZSBzeW50aGVzaXMg
Y29uZmlndXJhdGlvbj8gSXQgaXMKbXVjaCBiZXR0ZXIgdGhhdCB0aGUgaGFyZHdhcmUgdGVsbHMg
dXMgd2hhdCBpdCBpcywgcmF0aGVyIHRoYW4gaGF2aW5nCnRvIGV4cGFuZCB0aGlzIGNvbmRpdGlv
biBmb3IgZXZlcnkgbmV3IGRldmljZXMgd2hpY2ggZ2V0cyBhZGRlZC4KCkFsc28sIHdoYXQgaXMg
dGhlIGRlZmluaXRpb24gb2YgdXNlcl92ZXIuIENhbiB3ZSBndWFyYW50ZWUgdGhpcyBpcwp1bmlx
dWUgYW5kIGNhbiBhY3R1YWxseSBiZSB1c2VkIHRvIGRldGVybWluZSB3aGF0IERNQSB2YXJpYW50
IGhhcyBiZWVuCnN5bnRoZXNpc2VkPwoKCUFuZHJldwpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3Rt
MzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
