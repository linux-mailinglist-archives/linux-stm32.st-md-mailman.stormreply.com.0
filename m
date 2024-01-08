Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E99B0826FC8
	for <lists+linux-stm32@lfdr.de>; Mon,  8 Jan 2024 14:29:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9F310C6DD63;
	Mon,  8 Jan 2024 13:29:47 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A7184C6DD62
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Jan 2024 13:29:46 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9FFE1240008;
 Mon,  8 Jan 2024 13:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1704720586;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kfQYkI24IKxSDWmoC0/qvQq6SNd6yUAhqqt111/kkzo=;
 b=GPEyp9PKlB8UzvwG6GITJdcl1GNaZ4PVmzWbdUEbT4EtUip/7WFDrRpenAfxbGz3P758wq
 iHKvXGFmmv7luyI5l93cLBqGz24eaSalQz6SebnFOz8AdEdGuMnxyrxXPLlXwotjHigKAM
 sdYGcN7nEyC57wPUgg/1Y+sQxrHCwqP/VXFABTgv6N9JYFUbQcCj+ii2To20JOFAdrRlS6
 VkFvpZUJ/4SFMpJ6Gkd248R5nIIEWBxU/Sn8gdFMksSPA9Qp51/R/YnE2GSKdoBQrynOoG
 sBQC/7iRDL3ZNW5yAtqll8vPm7t1EeLgv7/TQ2juc2RU+jEv7D27z/gCwZIhHw==
Date: Mon, 8 Jan 2024 14:29:41 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Message-ID: <20240108142941.2b14f90e@xps-13>
In-Reply-To: <20240108130238.j2denbdj3ifasbqi@skbuf>
References: <20240108111747.73872-2-romain.gantois@bootlin.com>
 <20240108130238.j2denbdj3ifasbqi@skbuf>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
Cc: Florian Fainelli <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Richard Tresidder <rtresidd@electromag.com.au>,
 Pascal EBERHARD <pascal.eberhard@se.com>,
 Romain Gantois <romain.gantois@bootlin.com>, netdev@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>,
 Sylvain Girard <sylvain.girard@se.com>,
 linux-stm32@st-md-mailman.stormreply.com, stable@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David
 S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net v3 1/1] net: stmmac: Prevent DSA tags
 from breaking COE
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

SGkgUm9tYWluLAoKPiA+ICsvKiBDaGVjayBpZiBldGhlcnR5cGUgd2lsbCB0cmlnZ2VyIElQCj4g
PiArICogaGVhZGVyIGNoZWNrcy9DT0UgaW4gaGFyZHdhcmUKPiA+ICsgKi8gIAo+IAo+IE5pdHBp
Y2s6IHlvdSBjb3VsZCByZW5kZXIgdGhpcyBpbiBrZXJuZWwtZG9jIGZvcm1hdC4KPiBodHRwczov
L2RvY3Mua2VybmVsLm9yZy9kb2MtZ3VpZGUva2VybmVsLWRvYy5odG1sCj4gCj4gPiArc3RhdGlj
IGlubGluZSBib29sIHN0bW1hY19oYXNfaXBfZXRoZXJ0eXBlKHN0cnVjdCBza19idWZmICpza2Ip
ICAKPiAKPiBOaXRwaWNrOiBpbiBuZXRkZXYgaXQgaXMgcHJlZmVycmVkIG5vdCB0byB1c2UgdGhl
ICJpbmxpbmUiIGtleXdvcmQgYXQKPiBhbGwgaW4gQyBmaWxlcywgb25seSAic3RhdGljIGlubGlu
ZSIgaW4gaGVhZGVycywgYW5kIHRvIGxldCB0aGUgY29tcGlsZXIKPiBkZWNpZGUgYnkgaXRzZWxm
IHdoZW4gaXQgaXMgYXBwcm9wcmlhdGUgdG8gaW5saW5lIHRoZSBjb2RlICh3aGljaCBpdAo+IGRv
ZXMgYnkgaXRzZWxmIGV2ZW4gd2l0aG91dCB0aGUgImlubGluZSIga2V5d29yZCkuIEZvciBhIGJp
dCBtb3JlCj4gYmFja2dyb3VuZCB3aHksIHlvdSBjYW4gdmlldyBEb2N1bWVudGF0aW9uL3Byb2Nl
c3MvNC5Db2RpbmcucnN0LCBzZWN0aW9uCj4gIklubGluZSBmdW5jdGlvbnMiLgo+IAo+ID4gK3sK
PiA+ICsJaW50IGRlcHRoID0gMDsKPiA+ICsJX19iZTE2IHByb3RvOwo+ID4gKwo+ID4gKwlwcm90
byA9IF9fdmxhbl9nZXRfcHJvdG9jb2woc2tiLCBldGhfaGVhZGVyX3BhcnNlX3Byb3RvY29sKHNr
YiksICZkZXB0aCk7Cj4gPiArCj4gPiArCXJldHVybiBkZXB0aCA8PSBFVEhfSExFTiAmJiAocHJv
dG8gPT0gaHRvbnMoRVRIX1BfSVApIHx8IHByb3RvID09IGh0b25zKEVUSF9QX0lQVjYpKTsKCkkg
YWxzbyB3YW50IHRvIG5pdHBpY2sgYSBiaXQgOikgSWYgeW91IGFyZSB0byBzZW5kIGEgdjQsIG1h
eWJlIHlvdSBjYW4KZW5jbG9zZSB0aGUgZmlyc3QgY29uZGl0aW9uIHdpdGhpbiBwYXJlbnRoZXNp
cyB0byBmdXJ0aGVyIGNsYXJpZnkgdGhlCnJldHVybiBsb2dpYy4KCkNoZWVycywKTWlxdcOobApf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0z
MiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpo
dHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51
eC1zdG0zMgo=
