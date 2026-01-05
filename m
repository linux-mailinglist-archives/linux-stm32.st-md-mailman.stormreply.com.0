Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A16BACF4EA2
	for <lists+linux-stm32@lfdr.de>; Mon, 05 Jan 2026 18:09:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 55B2AC57A51;
	Mon,  5 Jan 2026 17:09:29 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 55DDBC56612
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Jan 2026 17:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
 Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=p1gzXDkRAfSsLirw5BNtPwUstkVTvPynwJOx+2Xmj98=; b=zRa4bM80CQpDZhryMbMzsFsCkX
 nSTrr0PLgUmgV2ncgRTwnc7GCglwhlJuPqwCo0qudRA6hSdqBLskS4xVzUzIHSQFGY4hz9F7INgoq
 mfiGiiYOVFDGpT7cZtMJKkzRa4Do8Jp1sKQPyavQBrAr51ZNWYlkSqQS0vTcZu9VaClmpLXXtiE6d
 W/kVKKKyM7BJD/6EVps8zWXtA//ja5QMDs+yQ9TBJE7d9aQeNEfaNa3UV87WUdAYthrne9uLs0IzV
 ogILDDhFXIYbFwnmnKEbcsuAxq9Ru/0wRcENC3s0BRpsOkPUu4l/Psa6D0FG01cyrcTI+nbfX7pki
 NYIOAJIQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:60322)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1vco4z-0000000089f-29LL;
 Mon, 05 Jan 2026 17:09:17 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1vco4v-00000000822-2qhH; Mon, 05 Jan 2026 17:09:13 +0000
Date: Mon, 5 Jan 2026 17:09:13 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Stefan Eichenberger <eichest@gmail.com>
Message-ID: <aVvwOYce1CFOLiBk@shell.armlinux.org.uk>
References: <20260105100245.19317-1-eichest@gmail.com>
 <6ee0d55a-69de-4c28-8d9d-d7755d5c0808@bootlin.com>
 <aVuxv3Pox-y5Dzln@eichest-laptop>
 <a597b9d6-2b32-461f-ac90-2db5bb20cdb2@lunn.ch>
 <aVvp70S2Lr3o_jyB@eichest-laptop>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aVvp70S2Lr3o_jyB@eichest-laptop>
Cc: robh@kernel.org, Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org,
 mcoquelin.stm32@gmail.com, imx@lists.linux.dev, festevam@gmail.com,
 s.hauer@pengutronix.de, linux-stm32@st-md-mailman.stormreply.com,
 francesco.dolcini@toradex.com, andrew+netdev@lunn.ch, edumazet@google.com,
 kernel@pengutronix.de, netdev@vger.kernel.org, kuba@kernel.org,
 Stefan Eichenberger <stefan.eichenberger@toradex.com>, pabeni@redhat.com,
 shawnguo@kernel.org, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH RESEND net-next v2] net: stmmac: dwmac:
 Add a fixup for the Micrel KSZ9131 PHY
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

T24gTW9uLCBKYW4gMDUsIDIwMjYgYXQgMDU6NDI6MjNQTSArMDEwMCwgU3RlZmFuIEVpY2hlbmJl
cmdlciB3cm90ZToKPiBZZXMgdGhpcyBpcyBjb3JyZWN0LiBFUlIwNTA2OTQgZnJvbSBOWFAgc3Rh
dGVzOgo+IFRoZSBJRUVFIDgwMi4zIHN0YW5kYXJkIHN0YXRlcyB0aGF0LCBpbiBNSUkvR01JSSBt
b2RlcywgdGhlIGJ5dGUKPiBwcmVjZWRpbmcgdGhlIFNGRCAoMHhENSksIFNNRC1TICgweEU2LDB4
NEMsIDB4N0YsIG9yIDB4QjMpLCBvciBTTUQtQwo+ICgweDYxLCAweDUyLCAweDlFLCBvciAweDJB
KSBieXRlIGNhbiBiZSBhIG5vbi1QUkVBTUJMRSBieXRlIG9yIHRoZXJlIGNhbgo+IGJlIG5vIHBy
ZWNlZGluZyBwcmVhbWJsZSBieXRlLiBUaGUgTUFDIHJlY2VpdmVyIG11c3Qgc3VjY2Vzc2Z1bGx5
Cj4gcmVjZWl2ZSBhIHBhY2tldCB3aXRob3V0IGFueSBwcmVhbWJsZSgweDU1KSBieXRlIHByZWNl
ZGluZyB0aGUgU0ZELAo+IFNNRC1TLCBvciBTTUQtQyBieXRlLgo+IEhvd2V2ZXIgZHVlIHRvIHRo
ZSBkZWZlY3QsIGluIGNvbmZpZ3VyYXRpb25zIHdoZXJlIGZyYW1lIHByZWVtcHRpb24gaXMKPiBl
bmFibGVkLCB3aGVuIHByZWFtYmxlIGJ5dGUgZG9lcyBub3QgcHJlY2VkZSB0aGUgU0ZELCBTTUQt
Uywgb3IgU01ELUMKPiBieXRlLCB0aGUgcmVjZWl2ZWQgcGFja2V0IGlzIGRpc2NhcmRlZCBieSB0
aGUgTUFDIHJlY2VpdmVyLiBUaGlzIGlzCj4gYmVjYXVzZSwgdGhlIHN0YXJ0LW9mLXBhY2tldCBk
ZXRlY3Rpb24gbG9naWMgb2YgdGhlIE1BQyByZWNlaXZlcgo+IGluY29ycmVjdGx5IGNoZWNrcyBm
b3IgYSBwcmVhbWJsZSBieXRlLgo+IAo+IE5YUCByZWZlcnMgdG8gSUVFRSA4MDIuMyB3aGVyZSBp
biBjbGF1c2UgMzUuMi4zLjIuMiBSZWNlaXZlIGNhc2UgKEdNSUkpCj4gdGhleSBzaG93IHR3byB0
YWJsZXMgb25lIHdoZXJlIHRoZSBwcmVhbWJsZSBpcyBwcmVjZWRpbmcgdGhlIFNGRCBhbmQgb25l
Cj4gd2hlcmUgaXQgaXMgbm90LiBUaGUgdGV4dCBzYXlzOgo+IFRoZSBvcGVyYXRpb24gb2YgMTAw
MCBNYi9zIFBIWXMgY2FuIHJlc3VsdCBpbiBzaHJpbmthZ2Ugb2YgdGhlIHByZWFtYmxlCj4gYmV0
d2VlbiB0cmFuc21pc3Npb24gYXQgdGhlIHNvdXJjZSBHTUlJIGFuZCByZWNlcHRpb24gYXQgdGhl
IGRlc3RpbmF0aW9uCj4gR01JSS4gVGFibGUgMzXigJMzIGRlcGljdHMgdGhlIGNhc2Ugd2hlcmUg
bm8gcHJlYW1ibGUgYnl0ZXMgYXJlIGNvbnZleWVkCj4gYWNyb3NzIHRoZSBHTUlJLiBUaGlzIGNh
c2UgbWF5IG5vdCBiZSBwb3NzaWJsZSB3aXRoIGEgc3BlY2lmaWMgUEhZLCBidXQKPiBpbGx1c3Ry
YXRlcyB0aGUgbWluaW11bSBwcmVhbWJsZSB3aXRoIHdoaWNoIE1BQyBzaGFsbCBiZSBhYmxlIHRv
Cj4gb3BlcmF0ZS4gVGFibGUgMzXigJM0IGRlcGljdHMgdGhlIGNhc2Ugd2hlcmUgdGhlIGVudGly
ZSBwcmVhbWJsZSBpcwo+IGNvbnZleWVkIGFjcm9zcyB0aGUgR01JSS4KPiAKPiBXZSB3b3VsZCBj
aGFuZ2UgdGhlIGJlaGF2aW9yIGZyb20gIm5vIHByZWFtYmxlIGlzIHByZWNlZGluZyBTRkQiIHRv
ICJ0aGUKPiBlbml0cmUgcHJlYW1ibGUgaXMgcHJlY2VkaW5nIFNGRCIuIEJvdGggYXJlIGxpc3Rl
ZCBpbiB0aGUgc3RhbmRhcmQgYW5kCj4gc2hhbGwgYmUgc3VwcG9ydGVkIGJ5IHRoZSBNQUMuCgpU
aGFua3MgZm9yIHByb3ZpZGluZyB0aGUgZnVsbCBleHBsYW5hdGlvbiwgaXQgd291bGQgYmUgZ29v
ZCB0byBoYXZlCnRoYXQgaW4gdGhlIGNvbW1pdCBtZXNzYWdlLgoKVGhlIG5leHQgcXVlc3Rpb24g
d291bGQgYmUsIGlzIGl0IGp1c3QgdGhlIE5YUCBFUU9TIGltcGxlbWVudGF0aW9uCnRoYXQgdGhp
cyBicmVha3Mgb24sIG9yIGFyZSBvdGhlciBFUU9TIGltcGxlbWVudGF0aW9ucyBhZmZlY3RlZD8K
CkluIG90aGVyIHdvcmRzLCBpZiB3ZSBjaG9vc2UgdG8gY29uZGl0aW9uYWxseSBlbmFibGUgdGhl
IHByZWFibGUgYXQKdGhlIFBIWSwgc2hvdWxkIHRoZSBnZW5lcmljIHBhcnRzIG9mIHN0bW1hYyBo
YW5kbGUgdGhpcyByYXRoZXIgdGhhbgplbmRpbmcgdXAgd2l0aCBtdWx0aXBsZSBwbGF0Zm9ybSBz
cGVjaWZpYyBnbHVlIGhhdmluZyB0byBjb2RlIHRoaXMuCihUaGlzIGlzIHNvbWV0aGluZyBJIHJl
YWxseSB3YW50IHRvIGF2b2lkIC0gaXQgZG9lc24ndCBzY2FsZS4pCgotLSAKUk1LJ3MgUGF0Y2gg
c3lzdGVtOiBodHRwczovL3d3dy5hcm1saW51eC5vcmcudWsvZGV2ZWxvcGVyL3BhdGNoZXMvCkZU
VFAgaXMgaGVyZSEgODBNYnBzIGRvd24gMTBNYnBzIHVwLiBEZWNlbnQgY29ubmVjdGl2aXR5IGF0
IGxhc3QhCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXN0bTMyCg==
