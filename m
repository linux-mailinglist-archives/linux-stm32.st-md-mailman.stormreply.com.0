Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA6AA884FD
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Apr 2025 16:31:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D4697C78028;
	Mon, 14 Apr 2025 14:31:49 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5054EC6DD9A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Apr 2025 14:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
 Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cuaKggYDRTaGllYGEl45fC0lvQ48d6zJXW22p95ihu0=; b=Zm9eD3mk3WM5hftniSBwFF1yr9
 wvxNTAJzgVasbkxZJHOK1DR3oOVb/26e4oc2Nzpgxl1KKp3lmgm7r0q4O4v1RXq44g3YXAnkmPM43
 2ha6YdMWO85CxFeTmi0XPvzd/aM0EX4N1G0Bo7ih03EUeqbV7ZcBOWGPdcG+MVbfEwUGIeKhmBY1g
 wZUp8xPG4mf95iso0eT2piUlROajI6jwnHoSX8Ei8Of0/zZAt3qtyK3lSb39SV9/9l7TRKiqaPBao
 z2gd3UeLxHusJWeDBZkkC2cny2t4IQ9/61aLTMG/t/Bj2Ul5kUTCL/MpnPtuL1et0NBwMJz/BygFc
 P5hiyRbA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:58820)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <linux@armlinux.org.uk>) id 1u4KqS-0006gu-0p;
 Mon, 14 Apr 2025 15:31:32 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
 (envelope-from <linux@shell.armlinux.org.uk>) id 1u4KqM-0007pA-1n;
 Mon, 14 Apr 2025 15:31:26 +0100
Date: Mon, 14 Apr 2025 15:31:26 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Message-ID: <Z_0cPmY_LzI_fo4S@shell.armlinux.org.uk>
References: <20250407120317.127056-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250407120317.127056-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <Z_QSHpvSK7I--xPq@shell.armlinux.org.uk>
 <CA+V-a8vgavmN7c9KYjc-3tm-9GC1_aVUkF-dF=Ws9axTBmSa5g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+V-a8vgavmN7c9KYjc-3tm-9GC1_aVUkF-dF=Ws9axTBmSa5g@mail.gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Eric Dumazet <edumazet@google.com>, linux-stm32@st-md-mailman.stormreply.com,
 Rob Herring <robh@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next v5 3/3] net: stmmac: Add DWMAC
 glue layer for Renesas GBETH
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

T24gTW9uLCBBcHIgMDcsIDIwMjUgYXQgMDc6MDc6NDlQTSArMDEwMCwgTGFkLCBQcmFiaGFrYXIg
d3JvdGU6Cj4gT24gTW9uLCBBcHIgNywgMjAyNSBhdCA2OjU44oCvUE0gUnVzc2VsbCBLaW5nIChP
cmFjbGUpCj4gPGxpbnV4QGFybWxpbnV4Lm9yZy51az4gd3JvdGU6Cj4gPgo+ID4gT24gTW9uLCBB
cHIgMDcsIDIwMjUgYXQgMDE6MDM6MTdQTSArMDEwMCwgUHJhYmhha2FyIHdyb3RlOgo+ID4gPiAr
c3RhdGljIHN0cnVjdCBjbGsgKnJlbmVzYXNfZ2JldGhfZmluZF9jbGsoc3RydWN0IHBsYXRfc3Rt
bWFjZW5ldF9kYXRhICpwbGF0X2RhdCwKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGNvbnN0IGNoYXIgKm5hbWUpCj4gPiA+ICt7Cj4gPiA+ICsgICAgIGZvciAo
dW5zaWduZWQgaW50IGkgPSAwOyBpIDwgcGxhdF9kYXQtPm51bV9jbGtzOyBpKyspCj4gPiA+ICsg
ICAgICAgICAgICAgaWYgKCFzdHJjbXAocGxhdF9kYXQtPmNsa3NbaV0uaWQsIG5hbWUpKQo+ID4g
PiArICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIHBsYXRfZGF0LT5jbGtzW2ldLmNsazsKPiA+
ID4gKwo+ID4gPiArICAgICByZXR1cm4gTlVMTDsKPiA+ID4gK30KPiA+Cj4gPiBJbiBhZGRpdGlv
biB0byBKYWt1YidzIHJlcXVlc3QsIEknbGwgYXNrIHRoYXQgeW91IGhvbGQgb2ZmIGZvciBhIHdl
ZWsKPiA+IGJlY2F1c2UgSSBoYXZlIHRoZSBmb2xsb3dpbmcgdGhhdCBJJ2QgbGlrZSB0byBzdWJt
aXQ6Cj4gPgo+IEFjaywgcGxlYXNlIGFkZCBtZSBpbiBDYyB3aGlsZSB5b3UgcG9zdCB0aGlzIHBh
dGNoLgoKRllJLCB0aGUgcGF0Y2ggd2FzIG1lcmdlZCBsYXN0IFRodXJzZGF5LCBzbyBwbGVhc2Ug
dXBkYXRlIHRvIHJlcGxhY2UKdGhlIGFib3ZlIHdpdGggc3RtbWFjX3BsdGZyX2ZpbmRfY2xrKCkg
d2hpY2ggd2lsbCBkbyB0aGlzIGZvciB5b3UuCgpUaGFua3MuCgotLSAKUk1LJ3MgUGF0Y2ggc3lz
dGVtOiBodHRwczovL3d3dy5hcm1saW51eC5vcmcudWsvZGV2ZWxvcGVyL3BhdGNoZXMvCkZUVFAg
aXMgaGVyZSEgODBNYnBzIGRvd24gMTBNYnBzIHVwLiBEZWNlbnQgY29ubmVjdGl2aXR5IGF0IGxh
c3QhCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHku
Y29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXN0bTMyCg==
