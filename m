Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 384DB868C74
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Feb 2024 10:40:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E6E83C6C838;
	Tue, 27 Feb 2024 09:40:48 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7E0CAC6A61A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Feb 2024 09:40:48 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BFAB5C0002;
 Tue, 27 Feb 2024 09:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1709026848;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mmn0FjbhKH+X6W94t2nXwylEPzw7F/tZLjHorPr0+mk=;
 b=G7jS74uRsUCaZ5E75Nq45zmqM7nb7gdxLE+r0CITcsJKVEX8RwON39N9Bn/jSuuRlsV+jz
 1ZKUSEdlhJJVXYwUpUv/vcv1vqQKj7GcWNEczMtfO7Uy2UxLbtcRyvPIJEl1O6CHkwoH/B
 OPc55phx1zLp4VtCbEf6OUzVc3z2rq9it5Y4ZkWc4SOv4QovWrBCZxe8dlim1WJN+FWgz3
 As8H6DwpFXG/KWoFsnFudAH2f2xXQ6xFn8USrBpUJa9S1Mteb5ScZKfgWOsg5IQBZx/EKK
 rDoo8GPQxSvegGQe92oUwtIHM1O6xNsyXMI2sw7XSSWrheyISovuX7EEmWz8Gg==
Message-ID: <951bc29a-4483-4f4a-9c4e-900db9391112@bootlin.com>
Date: Tue, 27 Feb 2024 10:40:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Eric Dumazet <edumazet@google.com>, Guenter Roeck <linux@roeck-us.net>
References: <20240203190927.19669-1-petr@tesarici.cz>
 <ea1567d9-ce66-45e6-8168-ac40a47d1821@roeck-us.net>
 <Zct5qJcZw0YKx54r@xhacker>
 <CANn89i+4tVWezqr=BYZ5AF=9EgV2EPqhdHun=u=ga32CEJ4BXQ@mail.gmail.com>
 <20d94512-c4f2-49f7-ac97-846dc24a6730@roeck-us.net>
 <CANn89iL1piwsbsBx4Z=kySUfmPa9LbZn-SNthgA+W6NEnojgSQ@mail.gmail.com>
From: =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
In-Reply-To: <CANn89iL1piwsbsBx4Z=kySUfmPa9LbZn-SNthgA+W6NEnojgSQ@mail.gmail.com>
X-GND-Sasl: alexis.lothore@bootlin.com
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 open list <linux-kernel@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Petr Tesarik <petr@tesarici.cz>,
 "open list:STMMAC ETHERNET DRIVER" <netdev@vger.kernel.org>,
 Marc Haber <mh+netdev@zugschlus.de>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>, Chen-Yu Tsai <wens@csie.org>,
 Jose Abreu <joabreu@synopsys.com>, stable@vger.kernel.org,
 Jisheng Zhang <jszhang@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 "open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>,
 "David S. Miller" <davem@davemloft.net>,
 "moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH net v3] net: stmmac: protect updates of
 64-bit statistics counters
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

SGVsbG8sIApGV0lXIEknbSBzZWVpbmcgdGhpcyBzcGxhdCB0b28gb24gU1RNMzJNUDE1NyB3aXRo
IDYuOC4wLXJjNSAoZnJvbSB3aXJlbGVzcyB0cmVlKS4gSXQgaGFwcGVucyBzeXN0ZW1hdGljYWxs
eSBhIGZldyBzZWNvbmRzIGFmdGVyIGxpbmsgdXAKClsgICAyNy44ODQ3MDNdID09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09ClsgICAyNy44ODg5ODhdIFdBUk5JTkc6IGluY29uc2lzdGVu
dCBsb2NrIHN0YXRlClsgICAyNy44OTMyNzFdIDYuOC4wLXJjNS1nNTk0NjBmN2Y0NWU2LWRpcnR5
ICMxNiBOb3QgdGFpbnRlZApbICAgMjcuODk4NjcxXSAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQpbICAgMjcuOTAyOTUxXSBpbmNvbnNpc3RlbnQge0hBUkRJUlEtT04tV30gLT4ge0lO
LUhBUkRJUlEtV30gdXNhZ2UuClsgICAyNy45MDg5NTRdIHN3YXBwZXIvMC8wIFtIQzFbMV06U0Mw
WzBdOkhFMDpTRTFdIHRha2VzOgpbICAgMjcuOTE0MTU1XSBkN2I3NjRhYyAoJnN5bmNwLT5zZXEj
Myl7Py4tLn0tezA6MH0sIGF0OiBkd21hYzRfZG1hX2ludGVycnVwdCsweGM0LzB4MmE4ClsgICAy
Ny45MjE5NzRdIHtIQVJESVJRLU9OLVd9IHN0YXRlIHdhcyByZWdpc3RlcmVkIGF0OgpbICAgMjcu
OTI2ODYzXSAgIGxvY2tfYWNxdWlyZSsweDEyYy8weDM4OApbICAgMjcuOTMwNTYzXSAgIF9fdTY0
X3N0YXRzX3VwZGF0ZV9iZWdpbisweDEzOC8weDIxNApbICAgMjcuOTM1MzcyXSAgIHN0bW1hY194
bWl0KzB4NTVjLzB4ZDgwClsgICAyNy45MzkwNjRdICAgZGV2X2hhcmRfc3RhcnRfeG1pdCsweGVj
LzB4MmY0ClsgICAyNy45NDMzNjJdICAgc2NoX2RpcmVjdF94bWl0KzB4OTQvMHgzMTAKWyAgIDI3
Ljk0NzI1NV0gICBfX2Rldl9xdWV1ZV94bWl0KzB4M2Y4LzB4ZDA0ClsgICAyNy45NTEzNDddICAg
aXA2X2ZpbmlzaF9vdXRwdXQyKzB4MmZjLzB4YmMwClsgICAyNy45NTU2NDJdICAgbWxkX3NlbmRw
YWNrKzB4MjY4LzB4NTk0ClsgICAyNy45NTkzMjldICAgbWxkX2lmY193b3JrKzB4MjY4LzB4NTY4
ClsgICAyNy45NjMxMTVdICAgcHJvY2Vzc19vbmVfd29yaysweDIwYy8weDYxOApbICAgMjcuOTY3
MjE2XSAgIHdvcmtlcl90aHJlYWQrMHgxZTgvMHg0YWMKWyAgIDI3Ljk3MTAwOV0gICBrdGhyZWFk
KzB4MTEwLzB4MTMwClsgICAyNy45NzQyOTZdICAgcmV0X2Zyb21fZm9yaysweDE0LzB4MjgKWyAg
IDI3Ljk3Nzk4Ml0gaXJxIGV2ZW50IHN0YW1wOiAxMjQ1NgpbICAgMjcuOTgxMzUzXSBoYXJkaXJx
cyBsYXN0ICBlbmFibGVkIGF0ICgxMjQ1NSk6IFs8YzA4ZTM1NTg+XSBkZWZhdWx0X2lkbGVfY2Fs
bCsweDFjLzB4MmNjClsgICAyNy45ODk1MDddIGhhcmRpcnFzIGxhc3QgZGlzYWJsZWQgYXQgKDEy
NDU2KTogWzxjMDEwMGI3ND5dIF9faXJxX3N2YysweDU0LzB4ZDAKWyAgIDI3Ljk5Njg0NF0gc29m
dGlycXMgbGFzdCAgZW5hYmxlZCBhdCAoMTI0NDApOiBbPGMwMTAxNjJjPl0gX19kb19zb2Z0aXJx
KzB4MzE4LzB4NGRjClsgICAyOC4wMDQ1ODZdIHNvZnRpcnFzIGxhc3QgZGlzYWJsZWQgYXQgKDEy
NDI5KTogWzxjMDEyYjJhOD5dIF9faXJxX2V4aXRfcmN1KzB4MTMwLzB4MTg0ClsgICAyOC4wMTI1
MzBdClsgICAyOC4wMTI1MzBdIG90aGVyIGluZm8gdGhhdCBtaWdodCBoZWxwIHVzIGRlYnVnIHRo
aXM6ClsgICAyOC4wMTkwNDBdICBQb3NzaWJsZSB1bnNhZmUgbG9ja2luZyBzY2VuYXJpbzoKWyAg
IDI4LjAxOTA0MF0KWyAgIDI4LjAyNTA0M10gICAgICAgIENQVTAKWyAgIDI4LjAyNzQwMF0gICAg
ICAgIC0tLS0KWyAgIDI4LjAyOTg1N10gICBsb2NrKCZzeW5jcC0+c2VxIzMpOwpbICAgMjguMDMz
MjUzXSAgIDxJbnRlcnJ1cHQ+ClsgICAyOC4wMzU5MTJdICAgICBsb2NrKCZzeW5jcC0+c2VxIzMp
OwpbICAgMjguMDM5NDEwXQpbICAgMjguMDM5NDEwXSAgKioqIERFQURMT0NLICoqKgpbICAgMjgu
MDM5NDEwXQpbICAgMjguMDQ1NDE2XSBubyBsb2NrcyBoZWxkIGJ5IHN3YXBwZXIvMC8wLgpbICAg
MjguMDQ5Mzk1XQpbICAgMjguMDQ5Mzk1XSBzdGFjayBiYWNrdHJhY2U6ClsgICAyOC4wNTM3ODFd
IENQVTogMCBQSUQ6IDAgQ29tbTogc3dhcHBlci8wIE5vdCB0YWludGVkIDYuOC4wLXJjNS1nNTk0
NjBmN2Y0NWU2LWRpcnR5ICMxNgpbICAgMjguMDYxODE5XSBIYXJkd2FyZSBuYW1lOiBTVE0zMiAo
RGV2aWNlIFRyZWUgU3VwcG9ydCkKWyAgIDI4LjA2NjkxOF0gIHVud2luZF9iYWNrdHJhY2UgZnJv
bSBzaG93X3N0YWNrKzB4MTgvMHgxYwpbICAgMjguMDcyMTQwXSAgc2hvd19zdGFjayBmcm9tIGR1
bXBfc3RhY2tfbHZsKzB4NTgvMHg3MApbICAgMjguMDc3MjUzXSAgZHVtcF9zdGFja19sdmwgZnJv
bSBtYXJrX2xvY2srMHhjNDAvMHgxMmZjClsgICAyOC4wODI0NzhdICBtYXJrX2xvY2sgZnJvbSBf
X2xvY2tfYWNxdWlyZSsweDk2OC8weDJjMjAKWyAgIDI4LjA4NzcwM10gIF9fbG9ja19hY3F1aXJl
IGZyb20gbG9ja19hY3F1aXJlKzB4MTJjLzB4Mzg4ClsgICAyOC4wOTMxMzFdICBsb2NrX2FjcXVp
cmUgZnJvbSBfX3U2NF9zdGF0c191cGRhdGVfYmVnaW4rMHgxMzgvMHgyMTQKWyAgIDI4LjA5OTM3
Ml0gIF9fdTY0X3N0YXRzX3VwZGF0ZV9iZWdpbiBmcm9tIGR3bWFjNF9kbWFfaW50ZXJydXB0KzB4
YzQvMHgyYTgKWyAgIDI4LjEwNjIxOV0gIGR3bWFjNF9kbWFfaW50ZXJydXB0IGZyb20gc3RtbWFj
X25hcGlfY2hlY2srMHg0OC8weDFkMApbICAgMjguMTEyNTU4XSAgc3RtbWFjX25hcGlfY2hlY2sg
ZnJvbSBzdG1tYWNfaW50ZXJydXB0KzB4YTQvMHgxODQKWyAgIDI4LjExODQ5MF0gIHN0bW1hY19p
bnRlcnJ1cHQgZnJvbSBfX2hhbmRsZV9pcnFfZXZlbnRfcGVyY3B1KzB4YjAvMHgzMDgKWyAgIDI4
LjEyNTAzNl0gIF9faGFuZGxlX2lycV9ldmVudF9wZXJjcHUgZnJvbSBoYW5kbGVfaXJxX2V2ZW50
KzB4NDAvMHg4OApbICAgMjguMTMxNTc4XSAgaGFuZGxlX2lycV9ldmVudCBmcm9tIGhhbmRsZV9m
YXN0ZW9pX2lycSsweGE0LzB4MjU4ClsgICAyOC4xMzc2MTBdICBoYW5kbGVfZmFzdGVvaV9pcnEg
ZnJvbSBnZW5lcmljX2hhbmRsZV9kb21haW5faXJxKzB4MzAvMHg0MApbICAgMjguMTQ0MzQ4XSAg
Z2VuZXJpY19oYW5kbGVfZG9tYWluX2lycSBmcm9tIGdpY19oYW5kbGVfaXJxKzB4N2MvMHg5MApb
ICAgMjguMTUwNjgyXSAgZ2ljX2hhbmRsZV9pcnEgZnJvbSBnZW5lcmljX2hhbmRsZV9hcmNoX2ly
cSsweDM0LzB4NDQKWyAgIDI4LjE1NjkxMV0gIGdlbmVyaWNfaGFuZGxlX2FyY2hfaXJxIGZyb20g
X19pcnFfc3ZjKzB4OGMvMHhkMApbICAgMjguMTYyNjMxXSBFeGNlcHRpb24gc3RhY2soMHhjMjIw
MWYzMCB0byAweGMyMjAxZjc4KQpbICAgMjguMTY3NzMyXSAxZjIwOiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBmZmZmZmZmZiBmZmZmZmZmZiAwMDAwMDAwMSAwMDAwMzBhNwpb
ICAgMjguMTc1OTc0XSAxZjQwOiBjMjIwYzc4MCBjMDE3OGRjNCBjMjIwOGQ1NCBjMjJjMmUxMCAw
MDAwMDAwMCAwMDAwMDAwMCBjMGIwNmQyOCBjMjIwYzIyYwpbICAgMjguMTg0MTE0XSAxZjYwOiAw
MDAwMDAwMCBjMjIwMWY4MCBjMDhlMzU1OCBjMDhlMzU1YyA2MDBmMDAxMyBmZmZmZmZmZgpbICAg
MjguMTkwNzI3XSAgX19pcnFfc3ZjIGZyb20gZGVmYXVsdF9pZGxlX2NhbGwrMHgyMC8weDJjYwpb
ICAgMjguMTk2MDQ1XSAgZGVmYXVsdF9pZGxlX2NhbGwgZnJvbSBkb19pZGxlKzB4ZDgvMHgxNDQK
WyAgIDI4LjIwMTE2NV0gIGRvX2lkbGUgZnJvbSBjcHVfc3RhcnR1cF9lbnRyeSsweDMwLzB4MzQK
WyAgIDI4LjIwNjE4MV0gIGNwdV9zdGFydHVwX2VudHJ5IGZyb20gcmVzdF9pbml0KzB4ZjQvMHgx
OTgKWyAgIDI4LjIxMTUwMl0gIHJlc3RfaW5pdCBmcm9tIGFyY2hfcG9zdF9hY3BpX3N1YnN5c19p
bml0KzB4MC8weDE4CgoKLS0gCkFsZXhpcyBMb3Rob3LDqSwgQm9vdGxpbgpFbWJlZGRlZCBMaW51
eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcg
bGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
