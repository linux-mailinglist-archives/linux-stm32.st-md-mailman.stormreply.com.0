Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C69011E87C
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Dec 2019 17:42:06 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CB3E5C36B0B;
	Fri, 13 Dec 2019 16:42:05 +0000 (UTC)
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 63143C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Dec 2019 16:42:02 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id c14so99531wrn.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Dec 2019 08:42:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arista.com; s=googlenew;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+Xy8RflunQ2h7lBPgvCLBQe6kC/5oXa7qNJM46i4OvE=;
 b=RDZC2ZiusGEyrtg6BPZpt/3zIXUDvTioxjK9hCuEm49HHbr3H/dAOfWKhTeLkK3Bp5
 mwslCzN5062kRXM1mLfDGyALHEWNTkHjICeOQc11+9KBDd7f19DKdFfeznFmkiP2iu/b
 X4xf0Xn0uq1+4PP0nKj0gPeSALXRk8hr+7z6OQI2nr4636450ZFHJs8VP3HyfFaJsTVP
 HzWknwSfbUCuDOtglpkghgYl1PzBXP2sQbaCvGZ+HwEkO2egA9fVrLSahpKuX/LZCycb
 kC6vC6YhGlL6xoAsu0f2oh+y3zZZpvkht74vL/pO8ENbamlFgdAMQPwCftTj41QI1w5d
 MyeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+Xy8RflunQ2h7lBPgvCLBQe6kC/5oXa7qNJM46i4OvE=;
 b=qLRW+dU/6PvlyJ4SelCoXpxUKLvkeMcYafm0sbdtZnWl7O0Kj6YHDQ+Gi/yATzyiWJ
 j65udezcLeJPRIXjnOKY5qk7Ecvmzq7ykJ0UaFyzsRspp44eyf2LG6q8DHsvimfM4D2j
 4p/FEwMttJ1hEd4IMoIn//ueU/YfwcNkEOicBf3pIiU75/Nrulbu1TSEfcZpqzA5c/2T
 PDNN66jXbendZMVVp/kIpI3FnPiJ6TKayxmZr9ZfyxbdNwS/XVm10hvOHDSIhdiIMINi
 U8WAkvFoWGfgNkwrRsVdq9kXc5dZEnbJxbIz/J/F13MC+DVldeb94IA6yMNOG2Uzh7/m
 qwhA==
X-Gm-Message-State: APjAAAUcUrn9XVI9K0qb6XCJfuybAQlf10n1xR2hXjICSG2WwaBn66Nl
 0C7Wwr6ITxc+eOsWYmxGJTcLVQ==
X-Google-Smtp-Source: APXvYqzIaw4yXEvzLQQBJqUcuUQde/4MOljSnSzj5+B7FHPM/cAqWL9ZIzlETdg8BqlmTOhn/Pq8vg==
X-Received: by 2002:a5d:4fd0:: with SMTP id h16mr13243381wrw.255.1576255321811; 
 Fri, 13 Dec 2019 08:42:01 -0800 (PST)
Received: from [10.83.36.153] ([217.173.96.166])
 by smtp.gmail.com with ESMTPSA id g69sm11707225wmg.13.2019.12.13.08.41.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Dec 2019 08:42:01 -0800 (PST)
To: Christophe Leroy <christophe.leroy@c-s.fr>, linux-kernel@vger.kernel.org
References: <20191213000657.931618-1-dima@arista.com>
 <524d9848-28a5-7e65-699b-600c49606487@c-s.fr>
From: Dmitry Safonov <dima@arista.com>
Message-ID: <0e642e4e-7349-3d92-3e54-cbfd8d417fea@arista.com>
Date: Fri, 13 Dec 2019 16:41:53 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <524d9848-28a5-7e65-699b-600c49606487@c-s.fr>
Content-Language: en-US
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-aspeed@lists.ozlabs.org, Dmitry Safonov <0x7f454c46@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Paul Mackerras <paulus@samba.org>, "Maciej W. Rozycki" <macro@linux-mips.org>,
 sparclinux@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Vasiliy Khoruzhick <vasilykh@arista.com>, Alexander Shiyan <shc_work@mail.ru>,
 Kevin Hilman <khilman@baylibre.com>, Russell King <linux@armlinux.org.uk>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Andy Gross <agross@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 Joel Stanley <joel@jms.id.au>, linux-serial@vger.kernel.org,
 Jiri Slaby <jslaby@suse.com>, Orson Zhai <orsonzhai@gmail.com>,
 Iurii Zaikin <yzaikin@google.com>, NXP Linux Team <linux-imx@nxp.com>,
 Michal Simek <michal.simek@xilinx.com>, Kees Cook <keescook@chromium.org>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Johan Hovold <johan@kernel.org>, Baolin Wang <baolin.wang7@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, linux-amlogic@lists.infradead.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, Timur Tabi <timur@kernel.org>,
 Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linuxppc-dev@lists.ozlabs.org,
 Tony Prisk <linux@prisktech.co.nz>, Richard Genoud <richard.genoud@gmail.com>,
 Luis Chamberlain <mcgrof@kernel.org>, Vineet Gupta <vgupta@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, linux-fsdevel@vger.kernel.org,
 Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH 00/58] serial/sysrq: Cleanup ifdeffery
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

SGkgQ2hyaXN0b3BoZSwKCk9uIDEyLzEzLzE5IDU6NDcgQU0sIENocmlzdG9waGUgTGVyb3kgd3Jv
dGU6Cj4gTGUgMTMvMTIvMjAxOSDDoCAwMTowNSwgRG1pdHJ5IFNhZm9ub3YgYSDDqWNyaXTCoDoK
Wy4uXQo+IAo+IHBvd2VycGMgcGF0Y2h3b3JrIGRpZG4ndCBnZXQgdGhlIGZ1bGwgc2VyaWVzLCBz
ZWUKPiBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvbGludXhwcGMtZGV2L2xp
c3QvP3Nlcmllcz0xNDgxOTgKClllcywgSSB3YXMgdW5kZXIgaW1wcmVzc2lvbiB0aGF0IGFyY2hp
dGVjdHVyZSBtYWlsLWxpc3RzIHdhbnQgcmVsYXRlZApwYXRjaGVzLiBCdXQgbm93IEkgc2VlIHRo
YXQgZnJvbSB0aGUgcGF0Y2h3b3JrIHBvaW50IG9mIHZpZXcgaXQncyBiZXR0ZXIKdG8gaGF2ZSB0
aGUgd2hvbGUgc2VyaWVzIGluIGluYm94LgoKPiBDYW4ndCBmaW5kIHRoZW0gb24gbGludXgtc2Vy
aWFsIHBhdGNod29yayBlaXRoZXIKPiAoaHR0cHM6Ly9wYXRjaGVzLmxpbmFyby5vcmcvcHJvamVj
dC9saW51eC1zZXJpYWwvbGlzdC8pCgpJJ20gbm90IHN1cmUgLSBtYXliZSB0aGUgZnJlcXVlbmN5
IG9mIGNoZWNraW5nIGlzIGxvdz8KSSBzZWUgYWxsIHBhdGNoZXMgaW4gbGludXgtc2VyaWFsIG1s
OgpodHRwczovL21hcmMuaW5mby8/bD1saW51eC1zZXJpYWwmcj0xJmI9MjAxOTEyJnc9MgoKPiBJ
dCBpcyBpbXBvc3NpYmxlIHRvIHJldmlldy90ZXN0IHBvd2VycGMgYml0cyB3aXRob3V0IHRoZSBm
aXJzdCBwYXRjaGVzCj4gb2YgdGhlIHNlcmllcywgd2hlcmUgY2FuIHRoZSBlbnRpcmUgc2VyaWVz
IGJlIGZvdW5kID8KClNvcnJ5IGZvciB0aGUgaW5jb252ZW5pZW5jZS4KSSBjYW4gcmVzZW5kIHdp
dGhvdXQgQ2MnaW5nIGFsbCBwZW9wbGUganVzdCB0byBwcGMgbWFpbC1saXN0IGlmIHRoYXQKd29y
a3MgZm9yIHlvdS4gT3IgeW91IGNhbiBjbG9uZSBpdCBkaXJlY3RseSBmcm9tIG15IGdpdGh1YjoK
aHR0cHM6Ly9naXRodWIuY29tLzB4N2Y0NTRjNDYvbGludXgvdHJlZS9zeXNycS1zZXJpYWwtc2Vx
LXYxCgpUaGFua3MsCiAgICAgICAgICBEbWl0cnkKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMy
QHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3Jt
cmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
