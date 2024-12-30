Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D7F9FE3DD
	for <lists+linux-stm32@lfdr.de>; Mon, 30 Dec 2024 09:47:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E4948C78F63;
	Mon, 30 Dec 2024 08:47:02 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 37434C6DD9F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Dec 2024 08:46:55 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1E2C11C0006;
 Mon, 30 Dec 2024 08:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1735548414;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5qCsLO7/DPq0fAwnmdxvog17EUVkdcDvufsuKKDDU44=;
 b=V2WVMabCR3tv3DYkj8ceVupPJhyavl3qhgOPs/I9FnR1jKneit/XiPGS4Oc3CUJ4NxgIDa
 pLsgJlKUNCJfA515f2cbXKr4alkKR+evB+Nhem5PI6cI4VnnEOcC/HAK8JCJ1JdAfzJmTe
 6dgsWTL9OpD5zUqe/8e95WW3QQ4Tp+4lMXZeQE2S90e4/GkcOWocy7y7wQ5JbxsZYJxu3k
 9l1OiSjR1bbhRB8hcCLOCEgC5RZ0vKiojIFwD8vKUgqnyFwFYK6QTPAFa7ivLgOObUwIZw
 2bJ9jpIfno95cevOBvtX5QOOsUSJQh9z8xuE9lsVYdYaV2AwFpnAnxqv/vl/Qg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Raphael Gallais-Pou <rgallaispou@gmail.com>
In-Reply-To: <20241229-update_pm_macro-v1-3-c7d4c4856336@gmail.com> (Raphael
 Gallais-Pou's message of "Sun, 29 Dec 2024 00:32:42 +0100")
References: <20241229-update_pm_macro-v1-0-c7d4c4856336@gmail.com>
 <20241229-update_pm_macro-v1-3-c7d4c4856336@gmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 30 Dec 2024 09:46:52 +0100
Message-ID: <877c7ha77n.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Niklas Cassel <cassel@kernel.org>,
 Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 Richard Weinberger <richard@nod.at>, Jose Abreu <joabreu@synopsys.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Damien Le Moal <dlemoal@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-ide@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Mark Brown <broonie@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH 3/6] mtd: st_spi_fsm: Switch from
 CONFIG_PM_SLEEP guards to pm_sleep_ptr()
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

SGVsbG8gUmFwaGFlbCwKCk9uIDI5LzEyLzIwMjQgYXQgMDA6MzI6NDIgKzAxLCBSYXBoYWVsIEdh
bGxhaXMtUG91IDxyZ2FsbGFpc3BvdUBnbWFpbC5jb20+IHdyb3RlOgoKPiBMZXR0aW5nIHRoZSBj
b21waWxlciByZW1vdmUgdGhlc2UgZnVuY3Rpb25zIHdoZW4gdGhlIGtlcm5lbCBpcyBidWlsdAo+
IHdpdGhvdXQgQ09ORklHX1BNX1NMRUVQIHN1cHBvcnQgaXMgc2ltcGxlciBhbmQgbGVzcyBlcnJv
ciBwcm9uZSB0aGFuIHRoZQo+IHVzZSBvZiAjaWZkZWYgYmFzZWQga2VybmVsIGNvbmZpZ3VyYXRp
b24gZ3VhcmRzLgoKSWYgdGhhdCBkb2VzIG5vdCBsZWFkIHRvIGFueSB3YXJuaW5nLCBJJ20gZmlu
ZS4gSG93ZXZlciB0aGlzIGtpbmQgb2YKY2hhbmdlIGlzIGJldHRlciByZWNlaXZlZCBzdWJzeXN0
ZW0td2lkZSB0aGFuIHBsYXRmb3JtLXdpZGUsIGlmIHlvdSBldmVyCndpc2ggdG8gZ28gdGhpcyBy
b3V0ZS4KCj4gTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjQwNzE2MTgwMDEw
LjEyNjk4Ny0xLXJnYWxsYWlzcG91QGdtYWlsLmNvbQoKVGhpcyBsaW5rIGhvd2V2ZXIgc2VlbXMg
aXJyZWxldmFudC4KCj4gU2lnbmVkLW9mZi1ieTogUmFwaGFlbCBHYWxsYWlzLVBvdSA8cmdhbGxh
aXNwb3VAZ21haWwuY29tPgoKVGhhbmtzLApNaXF1w6hsCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1z
dG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
