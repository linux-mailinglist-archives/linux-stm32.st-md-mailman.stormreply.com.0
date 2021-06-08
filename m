Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B461539F86B
	for <lists+linux-stm32@lfdr.de>; Tue,  8 Jun 2021 16:05:18 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5B906C57B79;
	Tue,  8 Jun 2021 14:05:18 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E2E05C57B75
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  8 Jun 2021 14:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
 Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
 In-Reply-To:References; bh=omHxetGSf7WvvYJIz4CtL+xJtQiHSODIemCHft0cr2A=; b=iE
 OybeMN7wY1+wMg1xRqw8c16xMPRhSuDIhcUcDTwMJdmkOASe08GQKjpV+1qKSiyUxhixe74HQ/NWH
 /sTZWkqQZ2IPJUnW/HdNOP3honl1nn/7H4XQOqNIsTpv1YEuLGaQhqdwtTxSWnoSfzZjh2sHqweVt
 Sgnkf6lyJ2kutWc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1lqcLe-008Lsy-Lx; Tue, 08 Jun 2021 16:04:54 +0200
Date: Tue, 8 Jun 2021 16:04:54 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Zhou Yanjie <zhouyanjie@wanyeetech.com>
Message-ID: <YL95BgJTv/jyAYr1@lunn.ch>
References: <1623086867-119039-1-git-send-email-zhouyanjie@wanyeetech.com>
 <1623086867-119039-3-git-send-email-zhouyanjie@wanyeetech.com>
 <YL6zYgGdqxqL9c0j@lunn.ch>
 <6532a195-65db-afb3-37a2-f68bfed9d908@wanyeetech.com>
 <YL9gr2QQ/YEXNUmP@lunn.ch>
 <62ad605f-3689-cab3-e43e-9b6954da8df3@wanyeetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <62ad605f-3689-cab3-e43e-9b6954da8df3@wanyeetech.com>
Cc: joabreu@synopsys.com, jun.jiang@ingenic.com, sernia.zhou@foxmail.com,
 devicetree@vger.kernel.org, rick.tyliu@ingenic.com,
 linux-kernel@vger.kernel.org, sihui.liu@ingenic.com,
 linux-stm32@st-md-mailman.stormreply.com, alexandre.torgue@foss.st.com,
 linux-mips@vger.kernel.org, paul@crapouillou.net, robh+dt@kernel.org,
 mcoquelin.stm32@gmail.com, peppe.cavallaro@st.com, kuba@kernel.org,
 netdev@vger.kernel.org, dongsheng.qiu@ingenic.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, aric.pzqi@ingenic.com
Subject: Re: [Linux-stm32] [PATCH 2/2] net: stmmac: Add Ingenic SoCs MAC
	support.
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

T24gVHVlLCBKdW4gMDgsIDIwMjEgYXQgMDk6NDg6MzhQTSArMDgwMCwgWmhvdSBZYW5qaWUgd3Jv
dGU6Cj4gSGVsbG8gQW5kcmV3LAo+IAo+IE9uIDIwMjEvNi84IOS4i+WNiDg6MjEsIEFuZHJldyBM
dW5uIHdyb3RlOgo+ID4gUGxlYXNlIHdyYXAgeW91ciB0ZXh0IHRvIGFyb3VuZCA3NSBjaGFyYWN0
ZXJzIHBlciBsaW5lLgo+IAo+IAo+IFN1cmUuCj4gCj4gCj4gPiAKPiA+IEkgc3VzcGVjdCB5b3Ug
ZG9uJ3QgdW5kZXJzdGFuZCBSR01JSSBkZWxheXMuIEFzIGkgc2FpZCwgbm9ybWFsbHksIHRoZQo+
ID4gTUFDIGRvZXMgbm90IGFkZCBkZWxheXMsIHRoZSBQSFkgZG9lcy4gUGxlYXNlIHRha2UgYSBj
bG9zZXIgbG9vayBhdAo+ID4gdGhpcy4KPiAKPiAKPiBBY2NvcmRpbmcgdG8gdGhlIGRlc2NyaXB0
aW9uIG9mIGV0aGVybmV0LWNvbnRyb2xsZXIueWFtbCwgInJnbWlpIiBzZWVtcwo+IAo+IHRvIGFs
bG93IE1BQyB0byBhZGQgVFggZGVsYXkgKHRoZSBkZXNjcmlwdGlvbiBpbiBldGhlcm5ldC1jb250
cm9sbGVyLnlhbWwKPiAKPiBpcyAiUlggYW5kIFRYIGRlbGF5cyBhcmUgYWRkZWQgYnkgdGhlIE1B
QyB3aGVuIHJlcXVpcmVkIiksIHdoaWxlIHJnbWlpLWlkCj4gCj4gYW5kIHJnbWlpLXR4aWQgZG8g
bm90IGFsbG93IE1BQyB0byBhZGQgZGVsYXkgKHRoZSBkZXNjcmlwdGlvbiBpbgo+IAo+IGV0aGVy
bmV0LWNvbnRyb2xsZXIueWFtbCBpcyJSR01JSSB3aXRoIGludGVybmFsIFJYIGFuZCBUWCBkZWxh
eXMgcHJvdmlkZWQKPiAKPiBieSB0aGUgUEhZLCB0aGUgTUFDIHNob3VsZCBub3QgYWRkIHRoZSBS
WCBvciBUWCBkZWxheXMgaW4gdGhpcyBjYXNlIiBhbmQKPiAKPiAiUkdNSUkgd2l0aCBpbnRlcm5h
bCBUWCBkZWxheSBwcm92aWRlZCBieSB0aGUgUEhZLCB0aGUgTUFDIHNob3VsZCBub3QgYWRkCj4g
Cj4gYW4gVFggZGVsYXkgaW4gdGhpcyBjYXNlIiksIEkgd2lsbCBhZGQgc3VwcG9ydCBmb3IgdGhl
IG90aGVyIHRocmVlIFJHTUlJCj4gbW9kZXMKPiAKPiBpbiB0aGUgbmV4dCB2ZXJzaW9uIChJIGZv
cmdvdCB0byByZXBseSB0byB0aGlzIGluIHRoZSBwcmV2aW91cyBlbWFpbCkuCgpQbGVhc2UgZm9s
bG93IHRoZSBjb2RlIGFsbCB0aGUgd2F5IHRocm91Z2guIFdoYXQgZ2V0cyBwYXNzZWQgdG8KcGh5
bGlua19jcmVhdGUoKSBpcyB2ZXJ5IGltcG9ydGFudC4gSWYgeW91IGhhdmUgYm90aCB0aGUgTUFD
IGFuZCB0aGUKUEhZIGFkZGluZyBkZWxheXMsIGJhZCB0aGluZ3Mgd2lsbCBoYXBwZW4uCgogICAg
QW5kcmV3Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXN0bTMyCg==
