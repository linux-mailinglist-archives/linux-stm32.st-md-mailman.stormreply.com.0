Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AA5E4772652
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Aug 2023 15:45:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3C5BCC6B45C;
	Mon,  7 Aug 2023 13:45:03 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com
 [209.85.128.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 80575C6B45A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Aug 2023 13:45:02 +0000 (UTC)
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-583a8596e2aso41624307b3.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 07 Aug 2023 06:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691415901; x=1692020701;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kMUoL4hnGiYD5mlozK9nMbQkuwFZ1466myKRpxECfj8=;
 b=c2hxnScmXyOJNNEwoKxei8znJecQS2wtI3TXpVfWBeONeEnG4vwx3hpcJpNe2AayPO
 0AMVZyb/lJSbUeTXtOm1Pe21cRqHs/VtGvkHi8MJvRMFFglgz/80jxQAaCUUe/phOgl+
 Qpm4Uk9oDmcOpnq7mI7TqxH1yYgAW7W51OpmZaeTlrdOKGOZyz/gild0J8SldxlJ8Vm+
 tWG35Hf6tHY/F2mjV+O+qDQgjBmuR6DtLD7/o7uSnQ2NONh4YbEdfL1P+dwcdwJJnrKp
 JkELJca+1W2nV5dANEMwy59TbI68sZY5P+DSD2wmKU1l6My7Ng/g6H72CJmoUzsZZFWh
 6YCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691415901; x=1692020701;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kMUoL4hnGiYD5mlozK9nMbQkuwFZ1466myKRpxECfj8=;
 b=KzkrpfLq+GggA7Uifp0RySU71spZWTtWXxRPijWYFd+2rgA5HQsnijauD89Q0HUFYK
 T8s1/MLEVzicshaLV+Y/jwQZVpI+02MHFVMYn17W7vMiqk8ZxLrF+bt5S6Yzi0y47IiG
 wO3szJp/ppSs2xD1n6iVjnmUzsccHjOrE7bSCofkcx3biDsln/fLbaXM3qTfELkLSrjR
 olJJ2jKVfUzSVnvltUYL/zaOS+UVNgAQS+u4zuV5YkbwlfRndV0/YT7MZgUbMN2BwzUV
 KoK+FZidm0e13FW9bKJSyHSMqbZ77jhUeyaoZrgzVfCF9zNcJFULWS/vpPgzBzvFw1ju
 598A==
X-Gm-Message-State: AOJu0YyUN+ez7fNHt8Vl3tXH9nU+U5yFuV10cUTl0JSfiEAHLA9YsfkW
 3NDeEH30AIkThFSaGVUwlGc1J6ieSrgyMSjAL0G/Eg==
X-Google-Smtp-Source: AGHT+IHx1ajT83sKAnSY+O0ambUwFc4zjHyYjGAv1pUY5pxl3rdlLFD2APpbEZ6FIFnRNRDlCKdb6Khb5uVyVETW/uM=
X-Received: by 2002:a25:d70a:0:b0:d4c:a288:ef4 with SMTP id
 o10-20020a25d70a000000b00d4ca2880ef4mr4049416ybg.44.1691415901373; Mon, 07
 Aug 2023 06:45:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230630-topic-oxnas-upstream-remove-v2-0-fb6ab3dea87c@linaro.org>
 <20230630-topic-oxnas-upstream-remove-v2-9-fb6ab3dea87c@linaro.org>
 <a9074f2d-ffa2-477f-e3b5-2c7d213ec72c@linaro.org>
In-Reply-To: <a9074f2d-ffa2-477f-e3b5-2c7d213ec72c@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 7 Aug 2023 15:44:50 +0200
Message-ID: <CACRpkdbMy=JWAgybtimQXJRQ7jsVZ1g-DfqjryjP31JT9f=Prg@mail.gmail.com>
To: neil.armstrong@linaro.org
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, linux-mtd@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-clk@vger.kernel.org,
 Marc Zyngier <maz@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, Jose Abreu <joabreu@synopsys.com>,
 Daniel Golle <daniel@makrotopia.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-pm@vger.kernel.org, linux-gpio@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Andy Shevchenko <andy@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 netdev@vger.kernel.org, Sebastian Reichel <sre@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-oxnas@groups.io,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH v2 09/15] pinctrl: pinctrl-oxnas: remove
	obsolete pinctrl driver
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

T24gTW9uLCBKdWwgMzEsIDIwMjMgYXQgNDo0NOKAr1BNIE5laWwgQXJtc3Ryb25nCjxuZWlsLmFy
bXN0cm9uZ0BsaW5hcm8ub3JnPiB3cm90ZToKPiBPbiAzMC8wNi8yMDIzIDE4OjU4LCBOZWlsIEFy
bXN0cm9uZyB3cm90ZToKPiA+IER1ZSB0byBsYWNrIG9mIG1haW50ZW5hbmNlIGFuZCBzdGFsbCBv
ZiBkZXZlbG9wbWVudCBmb3IgYSBmZXcgeWVhcnMgbm93LAo+ID4gYW5kIHNpbmNlIG5vIG5ldyBm
ZWF0dXJlcyB3aWxsIGV2ZXIgYmUgYWRkZWQgdXBzdHJlYW0sIHJlbW92ZSBzdXBwb3J0Cj4gPiBm
b3IgT1g4MTAgYW5kIE9YODIwIHBpbmN0cmwgJiBncGlvLgo+Cj4gRG8geW91IHBsYW4gdG8gdGFr
ZSBwYXRjaGVzIDksIDEwICYgMTEgb3Igc2hvdWxkIEkgZnVubmVsIHRoZW0gdmlhIGEgZmluYWwg
U29DIFBSID8KCkkgdHJpZWQgdG8gYXBwbHkgdGhlbSB0byB0aGUgcGluY3RybCB0cmVlIGJ1dCB0
aGF0IGZhaWxzIC4uLgpDb3VsZCB5b3UgcmViYXNlIHBhdGNoZXMgOSwxMCwxMSBvbnRvIG15ICJk
ZXZlbCIgYnJhbmNoCmFuZCBzZW5kIHNlcGFyYXRlbHk/IFRoZW4gSSB3aWxsIGFwcGx5IHRoZW0g
cmlnaHQgYXdheS4KCllvdXJzLApMaW51cyBXYWxsZWlqCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1z
dG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
