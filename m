Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D7644EA420
	for <lists+linux-stm32@lfdr.de>; Tue, 29 Mar 2022 02:24:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 00B22C5C842;
	Tue, 29 Mar 2022 00:24:04 +0000 (UTC)
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E8332C57B6F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Mar 2022 00:24:02 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id AA157580367;
 Mon, 28 Mar 2022 20:24:01 -0400 (EDT)
Received: from imap49 ([10.202.2.99])
 by compute5.internal (MEProxy); Mon, 28 Mar 2022 20:24:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; bh=YVcOcYXKVU4PEK
 ENIKD3lZlfbqMF8OkXUPWQPtT0ZzA=; b=GV8iKIgkifB/LyajStlhIzzaA2PqSU
 rEPGZBnWRziuDMlxEaU3fjhl0DHmyiueo1E3rsDwPrq1dyaythjr8LeJ4NZ3kmFH
 v7J0UO7b64vG5VRtrXZ/OicN/3vDmtLy+M6As/zf5/EYH2TO2OF+YIkppderpdcN
 ocuY8KYW/dUFglcgTgXnC/6f5bvCH2TNkniwuNDGczxXDBDNnP2nHRX3u9u0y3Go
 2HHhDpJUS8OMLXTkUmRtrROlDXASYpEdp57tTxY7G7Ci6RHcafVgGiKZGpjbHNDZ
 //P9ySL7tvarTkKke+QN7H1PCcvhD3CsMcxHphO+TJq7W+71Q2wgIxYw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=YVcOcYXKVU4PEKENIKD3lZlfbqMF8OkXUPWQPtT0Z
 zA=; b=MfUF/QO1w2kk8LobJGDnDjGmGT9HUgvaIsBRcZJH4NP16C60y/NJslTt7
 orhhkgHh49rbOiH30mg+9nD++QY3WWgzSB2sDT9Qr4nBx6DPKrUBtQOsEMz/dHsj
 tnZTX8+5b3lvOKKTTCyQClpi0fsj22EquswXftZXPkMfoj2QCv1jAapgIQLAxfMF
 S0z3hjnx7eO2S93c8UZottn5LmdiG0YcFFuK5zB8/ar7yCvc0Jy0dFV5KjDfSzzb
 3LrydgytiTwdKd8S3tKaPDcolfNGWpjEyPMA80KKZ8LEsNOU94avhhnY8yVPYBI+
 z15/ibq45vK+JxVduu76w45M0nzjQ==
X-ME-Sender: <xms:oFFCYs9K0yagZswp7rFBq_h4vFfHgzOKyc_TzBu90N89g92vvi8M3A>
 <xme:oFFCYkvw9h1jnh95ii6UH3c9xPcsfcQHqQiMHfK2AbFZHDfMquci3iY3KqTCG7jHE
 woyrhqOfmB1RNSngg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudehkedgfedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgfgsehtqhertderreejnecuhfhrohhmpedftehn
 ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtf
 frrghtthgvrhhnpedvgeekheegfedvhfethefhudetteegueeggfeiieegueehkedugedt
 kefglefgheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:oVFCYiAKjCQA5Zb05U61crJ5MlOJCJLgZQqyWNA7a6PSqL49ds9rcQ>
 <xmx:oVFCYsd7HLs87jVXkH1pk4ddv_005tSApo64HS9hBsjced9RxeZQlg>
 <xmx:oVFCYhNCDSxTTbHGsk6l4iYUYPZLYU9gbpl7DI-t2s9QTshCOjdDqA>
 <xmx:oVFCYjVxoE5j7ipqETgwLEOiheaMjFzqbcptYMrhCgrHpWjYJYVlwQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id E057EF6043F; Mon, 28 Mar 2022 20:24:00 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4911-g925b585eab-fm-20220323.003-g925b585e
Mime-Version: 1.0
Message-Id: <d5e6c96b-5882-4602-93cb-b08a65bfa37e@www.fastmail.com>
In-Reply-To: <D9AFAC3C-46CA-4C40-8559-FD6934411CAB@goldelico.com>
References: <20220328000915.15041-1-ansuelsmth@gmail.com>
 <YkG2RPrtPaBNXb7a@latitude>
 <D9AFAC3C-46CA-4C40-8559-FD6934411CAB@goldelico.com>
Date: Tue, 29 Mar 2022 10:53:40 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "H. Nikolaus Schaller" <hns@goldelico.com>,
 =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 "Ansuel Smith" <ansuelsmth@gmail.com>
Cc: linux-aspeed@lists.ozlabs.org, linux-realtek-soc@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, chrome-platform@lists.linux.dev,
 linux-samsung-soc@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-arm-kernel@axis.com, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev,
 OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS <devicetree@vger.kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-actions@lists.infradead.org,
 linux-unisoc@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 Linux-OMAP <linux-omap@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, linux-renesas-soc@vger.kernel.org,
 kernel@dh-electronics.com, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-oxnas@groups.io
Subject: Re: [Linux-stm32] [RFC PATCH 0/1] Categorize ARM dts directory
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

CgpPbiBUdWUsIDI5IE1hciAyMDIyLCBhdCAwMDoyMCwgSC4gTmlrb2xhdXMgU2NoYWxsZXIgd3Jv
dGU6Cj4+IEFtIDI4LjAzLjIwMjIgdW0gMTU6MjEgc2NocmllYiBKb25hdGhhbiBOZXVzY2jDpGZl
ciA8ai5uZXVzY2hhZWZlckBnbXgubmV0PjoKPj4gCj4+IE9yIG1heWJlIGJjbSBpbnN0ZWFkIG9m
IGJyb2FkY29tLiBOb3Qgc3VyZSB3aGljaCBpcyBwcmVmZXJyZWQgYnkKPj4gQnJvYWRjb20gcGVv
cGxlLgo+Cj4gTWF5YmUgaXQgc2hvdWxkIGFsd2F5cyBmb2xsb3cgdGhlIGxpc3Qgb2YgdmVuZG9y
IHByZWZpeGVzIGFzIHdlIGFyZSAKPiB0YWxraW5nIGFib3V0IERUUz8KCisxIChpZiB3ZSdyZSBh
Y3R1YWxseSBnb2luZyB0byBkbyB0aGlzKS4gVGhhdCB3b3VsZCBuZXV0ZXIgbW9zdCB0aGUgCm1p
c3Rha2VzIGFuZCBkaXNjdXNzaW9uIGFuZCBjYW4gYmUgZXh0cmFjdGVkIGZyb20gdGhlIGR0cyBm
aWxlcyAKdGhlbXNlbHZlcy4KCkFuZHJldwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBs
eS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
