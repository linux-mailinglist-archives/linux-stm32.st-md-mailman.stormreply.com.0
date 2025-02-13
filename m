Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 61ADBA3408B
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Feb 2025 14:43:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 10BCAC78F6D;
	Thu, 13 Feb 2025 13:43:04 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 93C66C78039
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Feb 2025 13:42:56 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0135D440EA;
 Thu, 13 Feb 2025 13:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1739454176;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cm7XKVhBb29N/0ZGLeQV/Hvrssux+61wOZwuTX8KNK4=;
 b=UsNJuD4XUBmjbgOSrbOsnmXWQjngrRl3HCRZ4AFsbr040l7wQWhGBAYM7ugvSPztEr404y
 sG3AFOT35aee2kcyCcGkHVWHvDWLTMCVNE1ns8zVCQGnoWl+B0uAw9DpcqVXoo8ozUa6si
 Jc1gBNVMH0/VFFCz0Rc0+nv4h3ejj3J77wPfgd91fgRYEn0cW0GJg3vXPzj0WO6lJY+UZm
 MKNeonZzYcSWALUPCOm72eXlzDqM5xYBRM5AYeUyc7A4m5+2STYJhBFkV2mbfyCWgkViuB
 ldlZfjaFDZunxqzdFCss+IKKZ0vP6wZ8nca4IX8LtwynwYIhz4hzGXWu5iWmbg==
Message-ID: <64ec49f2-8c3b-4642-a910-32a656095c68@bootlin.com>
Date: Thu, 13 Feb 2025 14:42:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20250213-atomic_sleep_mctrl_serial_gpio-v1-1-201ee6a148ad@bootlin.com>
 <2025021347-cling-smoked-9f28@gregkh>
Content-Language: en-US
From: =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
In-Reply-To: <2025021347-cling-smoked-9f28@gregkh>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegieelvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtkeertddtvdejnecuhfhrohhmpeetlhgvgihishcunfhothhhohhrrocuoegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepvdetteektdehudelheehkeeggfejgfelveevgeevtdejudfgveetgefhtdduuedtnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopegludelvddrudeikedrtddrvddungdpmhgrihhlfhhrohhmpegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudekpdhrtghpthhtohepghhrvghgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepjhhirhhishhlrggshieskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhitghhrghrugdrghgvnhhouhgusegsohhothhlihhnrdgtohhmpdhrtghpthhtohepnhhitgholhgrshdrfhgvrhhrvgesmhhitghro
 hgthhhiphdrtghomhdprhgtphhtthhopegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheptghlrghuughiuhdrsggviihnvggrsehtuhigohhnrdguvghvpdhrtghpthhtohepshhhrgifnhhguhhosehkvghrnhgvlhdrohhrghdprhgtphhtthhopehsrdhhrghuvghrsehpvghnghhuthhrohhnihigrdguvg
X-GND-Sasl: alexis.lothore@bootlin.com
Cc: imx@lists.linux.dev, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Fabio Estevam <festevam@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jiri Slaby <jirislaby@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-arm-kernel@lists.infradead.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>, linux-serial@vger.kernel.org,
 Shawn Guo <shawnguo@kernel.org>, Richard Genoud <richard.genoud@bootlin.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] serial: mctrl_gpio: add parameter to skip
	sync
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

SGVsbG8gR3JlZywKCk9uIDIvMTMvMjUgMTA6NTgsIEdyZWcgS3JvYWgtSGFydG1hbiB3cm90ZToK
PiBPbiBUaHUsIEZlYiAxMywgMjAyNSBhdCAwOToyNTowNEFNICswMTAwLCBBbGV4aXMgTG90aG9y
w6kgd3JvdGU6CgpbLi4uXQoKPj4gLQltY3RybF9ncGlvX2Rpc2FibGVfbXModXAtPmdwaW9zKTsK
Pj4gKwltY3RybF9ncGlvX2Rpc2FibGVfbXModXAtPmdwaW9zLCBmYWxzZSk7Cj4gCj4gVGhpcyBh
IGJhZCBhcGkuCj4gCj4gV2hlbiB5b3UgcmVhZCB0aGlzIGxpbmUgaW4gdGhlIGRyaXZlciwgZG8g
eW91IGtub3cgd2hhdCAiZmFsc2UiIG1lYW5zCj4gaGVyZT8KPiAKPiBQbGVhc2UgbWFrZSB0d28g
ZnVuY3Rpb25zLCBtY3RybF9ncGlvX2Rpc2FibGVfbXNfc3luYygpIGFuZAo+IG1jdHJsX2dwaW9f
ZGlzYWJsZV9tc19ub19zeW5jKCkgd2hpY2ggY2FuIGludGVybmFsbHkganVzdCBjYWxsCj4gbWN0
cmxfZ3Bpb19kaXNhYmxlX21zKCkgd2l0aCB0aGUgYm9vbGVhbiwgYnV0IG5vIGRyaXZlciBzaG91
bGQgaGF2ZSB0bwo+IGNhbGwgdGhhdCBhdCBhbGwuCj4gCj4gVGhhdCB3YXksIHdoZW4geW91IHJl
YWQgZHJpdmVyIGNvZGUsIHlvdSBLTk9XIHdoYXQgaXMgaGFwcGVuaW5nIGFuZCB5b3UKPiBkb24n
dCBoYXZlIHRvIGh1bnQgYXJvdW5kIGluIGEgdG90YWxseSBkaWZmZXJlbnQgQyBmaWxlIHRvIHRy
eSB0byBmaWd1cmUKPiBpdCBvdXQgYW5kIGxvb3NlIHlvdXIgY29uY2VudHJhdGlvbi4KCk1ha2Vz
IHNlbnNlLCBJJ2xsIHNwaW4gYSB2MiB3aXRoIGEgbW9yZSBleHBsaWNpdCBBUEkuCgpUaGFua3Ms
CgpBbGV4aXMKPiAKPiB0aGFua3MsCj4gCj4gZ3JlZyBrLWgKCgotLSAKQWxleGlzIExvdGhvcsOp
LCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcKaHR0cHM6Ly9i
b290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9s
aXN0aW5mby9saW51eC1zdG0zMgo=
