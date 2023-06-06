Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B72723FB3
	for <lists+linux-stm32@lfdr.de>; Tue,  6 Jun 2023 12:35:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ADA1AC65E70;
	Tue,  6 Jun 2023 10:35:39 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com
 [209.85.128.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4BE74C06F81
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Jun 2023 10:35:38 +0000 (UTC)
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-565e8d575cbso53918457b3.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 06 Jun 2023 03:35:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686047737; x=1688639737;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0ydybIENrvkznJ3jdND4RX/3pvLeHeCWFjJ95HKeLNA=;
 b=OV4sdUW1eArdcIuxWtCVYdGzJEWSOziku4STAecKVp7TwwzSQiBZVa5KHCzIHO9QXs
 nfdCnIEDLojgV1o3HltqmjpKacJNgmg6V+PE9r9cd9B0lf38hGi1gIHUOq0jVxh38qg5
 R7Uugi8rK6V1QOL4zXeZtZPAnU5asjc8kroL3DSx/fng8BmhuH/CCEHah+F4jLersF1i
 5SWRCMvEWZ4d8b/8jXXRTH3tlIdzxOpYUL9RQIFeCH83zF7Rnbh+eHwqdNEOhQlqxEAl
 TkkyWa6kt+i3xCBiNFYqgoYlpSH0g5K+HiKmmkvRzkKXPuwtJlo68rBOYpnZZ3+29JMm
 ivgA==
X-Gm-Message-State: AC+VfDw3cjqItvkFKyyg+89+TH9yUdwkFwDbCtQhCP90Lm1hv+21GXNl
 taHvvT2fpVXOCFLNymQyv153PEu5v9DuiQ==
X-Google-Smtp-Source: ACHHUZ7ld8ugUcL1ISPiAxwHXLewhGOohFUANMxRhJO+fqT+h1PfqPWSXCL4ASLBVaiYmiNXpqtflw==
X-Received: by 2002:a0d:f605:0:b0:561:b58e:31ff with SMTP id
 g5-20020a0df605000000b00561b58e31ffmr1669786ywf.44.1686047737043; 
 Tue, 06 Jun 2023 03:35:37 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com.
 [209.85.219.177]) by smtp.gmail.com with ESMTPSA id
 h187-20020a0dc5c4000000b0055aafcef659sm4001224ywd.5.2023.06.06.03.35.35
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jun 2023 03:35:35 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id
 3f1490d57ef6-bb15165ba06so5139184276.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 06 Jun 2023 03:35:35 -0700 (PDT)
X-Received: by 2002:a0d:f605:0:b0:561:b58e:31ff with SMTP id
 g5-20020a0df605000000b00561b58e31ffmr1669654ywf.44.1686047734832; Tue, 06 Jun
 2023 03:35:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230606064914.134945-1-maxime.chevallier@bootlin.com>
 <20230606064914.134945-2-maxime.chevallier@bootlin.com>
 <889297a0-88c3-90df-7752-efa00184859@linux-m68k.org>
 <ZH78uGBfeHjI4Cdn@shell.armlinux.org.uk> <20230606121311.3cc5aa78@pc-7.home>
 <ZH8JxF+TNuX0C1vC@shell.armlinux.org.uk>
In-Reply-To: <ZH8JxF+TNuX0C1vC@shell.armlinux.org.uk>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 6 Jun 2023 12:35:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWnqmwT_rEe5G4e+yZYAeTQxjjE=Xqq7R6No9SAF16sdg@mail.gmail.com>
Message-ID: <CAMuHMdWnqmwT_rEe5G4e+yZYAeTQxjjE=Xqq7R6No9SAF16sdg@mail.gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Ioana Ciornei <ioana.ciornei@nxp.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 alexis.lothore@bootlin.com, thomas.petazzoni@bootlin.com,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Simon Horman <simon.horman@corigine.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 1/2] net: stmmac: Add PCS_LYNX as
 a dependency for the whole driver
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

SGkgUnVzc2VsbCwKCk9uIFR1ZSwgSnVuIDYsIDIwMjMgYXQgMTI6MjbigK9QTSBSdXNzZWxsIEtp
bmcgKE9yYWNsZSkKPGxpbnV4QGFybWxpbnV4Lm9yZy51az4gd3JvdGU6Cj4gT24gVHVlLCBKdW4g
MDYsIDIwMjMgYXQgMTI6MTM6MTFQTSArMDIwMCwgTWF4aW1lIENoZXZhbGxpZXIgd3JvdGU6Cj4g
PiBPbiBUdWUsIDYgSnVuIDIwMjMgMTA6MzA6MzIgKzAxMDAKPiA+ICJSdXNzZWxsIEtpbmcgKE9y
YWNsZSkiIDxsaW51eEBhcm1saW51eC5vcmcudWs+IHdyb3RlOgo+ID4gPiBPbiBUdWUsIEp1biAw
NiwgMjAyMyBhdCAxMDoyOToyMEFNICswMjAwLCBHZWVydCBVeXR0ZXJob2V2ZW4gd3JvdGU6Cj4g
PiA+ID4gT24gVHVlLCA2IEp1biAyMDIzLCBNYXhpbWUgQ2hldmFsbGllciB3cm90ZToKPiA+ID4g
PiA+IEFsdGhvdWdoIHBjc19seW54IGlzIG9ubHkgdXNlZCBvbiBkd21hY19zb2NmcGdhIGZvciBu
b3csIHRoZSBjbGVhbnVwCj4gPiA+ID4gPiBwYXRoIGlzIGluIHRoZSBnZW5lcmljIGRyaXZlciwg
YW5kIHRyaWdnZXJzIGJ1aWxkIGlzc3VlcyBmb3Igb3RoZXIKPiA+ID4gPiA+IHN0bW1hYyB2YXJp
YW50cy4gTWFrZSBzdXJlIHdlIGJ1aWxkIHBjc19seW54IGluIGFsbCBjYXNlcyB0b28sIGFzIGZv
cgo+ID4gPiA+ID4gWFBDUy4KPiA+ID4gPgo+ID4gPiA+IFRoYXQgc2VlbXMgc3Vib3B0aW1hbCB0
byBtZSwgYXMgaXQgbmVlZGxlc2x5IGluY3JlYXNlcyBrZXJuZWwgc2l6ZSBmb3IKPiA+ID4gPiBw
ZW9wbGUgd2hvIGRvIG5vdCB1c2UgZHdtYWNfc29jZnBnYS4gIEhlbmNlIEkgbWFkZSBhbiBhbHRl
cm5hdGl2ZSBwYXRjaDoKPiA+ID4gPiBodHRwczovL2xvcmUua2VybmVsL29yZy83YjM2YWM0Mzc3
OGI0MTgzMWRlYmQ1YzMwYjViMzdkMjY4NTEyMTk1LjE2ODYwMzk5MTUuZ2l0LmdlZXJ0K3JlbmVz
YXNAZ2xpZGVyLmJlCj4gPiA+Cj4gPiA+IEEgYmV0dGVyIHNvbHV0aW9uIHdvdWxkIGJlIHRvIHJl
LWFyY2hpdGVjdCB0aGUgcmVtb3ZhbCBjb2RlIHNvIHRoYXQKPiA+ID4gd2hhdGV2ZXIgY3JlYXRl
cyB0aGUgUENTIGlzIGFsc28gcmVzcG9uc2libGUgZm9yIHJlbW92aW5nIGl0Lgo+ID4gPgo+ID4g
PiBBbHNvLCBkd21hY19zb2NmcGdhIG5lZXMgdG8gYmUgcmVvcmdhbmlzZWQgYW55d2F5LCBiZWNh
dXNlIGl0IGNhbGxzCj4gPiA+IHN0bW1hY19kdnJfcHJvYmUoKSB3aGljaCB0aGVuIGdvZXMgb24g
dG8gY2FsbCByZWdpc3Rlcl9uZXRkZXYoKSwKPiA+ID4gcHVibGlzaGluZyB0aGUgbmV0d29yayBk
ZXZpY2UsIGFuZCB0aGVuIGFmdGVyIHN0bW1hY19kdnJfcHJvYmUoKSwKPiA+ID4gZnVydGhlciBk
ZXZpY2Ugc2V0dXAgaXMgZG9uZS4gQXMgdGhlIGJhc2ljIGRyaXZlciBwcm9iZSBmbG93IHNob3Vs
ZAo+ID4gPiBiZSBzZXR1cCBhbmQgdGhlbiBwdWJsaXNoLCB0aGUgZXhpc3RpbmcgY29kZSBzdHJ1
Y3R1cmUgdmlvbGF0ZXMgdGhhdC4KPiA+ID4KPiA+Cj4gPiBJIGFncmVlIHRoYXQgdGhpcyBzb2x1
dGlvbiBpcyBkZWZpbml0ZWx5IHN1Ym9wdGltYWwsIEkgd2FudGVkIG1vc3RseSB0byBnZXQgaXQK
PiA+IGZpeGVkIHF1aWNrbHkgYXMgdGhpcyBicmVha3Mgb3RoZXIgc3RtbWFjIHZhcmlhbnRzLgo+
ID4KPiA+IERvIHdlIHN0aWxsIGdvIG9uIHdpdGggdGhlIGN1cnJlbnQgcGF0Y2ggKGFzIEdlZXJ0
J3MgaGFzIGlzc3VlcykgYW5kIHRoZW4KPiA+IGNvbnNpZGVyIHJld29ya2luZyBkd21hY19zb2Nm
cGdhID8KPgo+IEFzIEdlZXJ0IGhpbXNlbGYgbWVudGlvbmVkLCBwYXNzZWQgb24gZnJvbSBBcm5k
Ogo+ICAgQXMgcG9pbnRlZCBvdXQgYnkgQXJuZCwgdGhpcyBkb2Vzbid0IHdvcmsgd2hlbiBQQ1Nf
TFlOWCBpcyBhIGxvYWRhYmxlCj4gICBtb2R1bGUgYW5kIFNUTU1BQyBpcyBidWlsdC1pbjoKPiAg
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMTFiZDM3ZTktYzYyZS00NmJhLTk0NTYtOGUzYjM1
M2RmMjhmQGFwcC5mYXN0bWFpbC5jb20KPgo+IFNvIEdlZXJ0J3Mgc29sdXRpb24gd2lsbCBqdXN0
IGdldCByaWQgb2YgdGhlIGJ1aWxkIGVycm9yLCBidXQgbGVhdmUgdGhlCj4gTHlueCBQQ1MgdW5k
ZXN0cm95ZWQuIEkgdGFrZSBHZWVydCdzIGNvbW1lbnQgYXMgYSBzZWxmLW5hY2sgb24gaGlzCj4g
cHJvcG9zZWQgcGF0Y2guCgpFeGFjdGx5Li4uCgo+IFRoZSBjaGFuZ2VzIGFyZSBvbmx5IGluIG5l
dC1uZXh0IGF0IHRoZSBtb21lbnQsIGFuZCB3ZSdyZSBhdCAtcmM1Lgo+IFRoZXJlJ3MgcHJvYmFi
bHkgYWJvdXQgMi41IHdlZWtzIHRvIGdldCB0aGlzIHNvcnRlZCBiZWZvcmUgdGhlIG1lcmdlCj4g
d2luZG93IG9wZW5zLgo+Cj4gU28sIHdlIGN1cnJlbnRseSBoYXZlIHlvdXIgc3VnZ2VzdGlvbi4g
SGVyZSdzIG1pbmUgYXMgYW4gaW1tZWRpYXRlCj4gZml4LiBUaGlzIGRvZXNuJ3QgYWRkcmVzcyBh
bGwgdGhlIHBvaW50cyBJJ3ZlIHJhaXNlZCwgYnV0IHNob3VsZAo+IHJlc29sdmUgdGhlIGltbWVk
aWF0ZSBpc3N1ZS4KPgo+IFVudGVzdGVkIHNpbmNlIEkgZG9uJ3QgaGF2ZSB0aGUgaGFyZHdhcmUu
Li4gKHRoZSB0ZXN0IGJ1aWxkIGlzCj4gcnVubmluZyk6Cj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtc29jZnBnYS5jIGIvZHJpdmVycy9u
ZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtc29jZnBnYS5jCj4gaW5kZXggZTM5OWZj
Y2JhZmU1Li4yMzljN2U5ZWQ0MWQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9uZXQvZXRoZXJuZXQv
c3RtaWNyby9zdG1tYWMvZHdtYWMtc29jZnBnYS5jCj4gKysrIGIvZHJpdmVycy9uZXQvZXRoZXJu
ZXQvc3RtaWNyby9zdG1tYWMvZHdtYWMtc29jZnBnYS5jCj4gQEAgLTQ5NCw2ICs0OTQsMTcgQEAg
c3RhdGljIGludCBzb2NmcGdhX2R3bWFjX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBk
ZXYpCj4gICAgICAgICByZXR1cm4gcmV0Owo+ICB9Cj4KPiArc3RhdGljIHZvaWQgc29jZnBnYV9k
d21hY19yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiArewo+ICsgICAgICAg
c3RydWN0IG5ldF9kZXZpY2UgKm5kZXYgPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShwZGV2KTsKPiAr
ICAgICAgIHN0cnVjdCBzdG1tYWNfcHJpdiAqcHJpdiA9IG5ldGRldl9wcml2KG5kZXYpOwo+ICsg
ICAgICAgc3RydWN0IHBoeWxpbmtfcGNzICpwY3MgPSBwcml2LT5ody0+bHlueF9wY3M7Cj4gKwo+
ICsgICAgICAgc3RtbWFjX3BsdGZyX3JlbW92ZShwZGV2KTsKPiArCj4gKyAgICAgICBseW54X3Bj
c19kZXN0cm95KHBjcyk7Cj4gK30KPiArCj4gICNpZmRlZiBDT05GSUdfUE1fU0xFRVAKPiAgc3Rh
dGljIGludCBzb2NmcGdhX2R3bWFjX3Jlc3VtZShzdHJ1Y3QgZGV2aWNlICpkZXYpCj4gIHsKPiBA
QCAtNTY1LDcgKzU3Niw3IEBAIE1PRFVMRV9ERVZJQ0VfVEFCTEUob2YsIHNvY2ZwZ2FfZHdtYWNf
bWF0Y2gpOwo+Cj4gIHN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIHNvY2ZwZ2FfZHdtYWNf
ZHJpdmVyID0gewo+ICAgICAgICAgLnByb2JlICA9IHNvY2ZwZ2FfZHdtYWNfcHJvYmUsCj4gLSAg
ICAgICAucmVtb3ZlX25ldyA9IHN0bW1hY19wbHRmcl9yZW1vdmUsCj4gKyAgICAgICAucmVtb3Zl
X25ldyA9IHNvY2ZwZ2FfZHdtYWNfcmVtb3ZlLAo+ICAgICAgICAgLmRyaXZlciA9IHsKPiAgICAg
ICAgICAgICAgICAgLm5hbWUgICAgICAgICAgID0gInNvY2ZwZ2EtZHdtYWMiLAo+ICAgICAgICAg
ICAgICAgICAucG0gICAgICAgICAgICAgPSAmc29jZnBnYV9kd21hY19wbV9vcHMsCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19tYWluLmMg
Yi9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9zdG1tYWNfbWFpbi5jCj4gaW5k
ZXggZmEwN2IwZDUwYjQ2Li4xODAxZjhjYzg0MTMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9uZXQv
ZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX21haW4uYwo+ICsrKyBiL2RyaXZlcnMvbmV0
L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19tYWluLmMKPiBAQCAtOTQwLDkgKzk0MCw2
IEBAIHN0YXRpYyBzdHJ1Y3QgcGh5bGlua19wY3MgKnN0bW1hY19tYWNfc2VsZWN0X3BjcyhzdHJ1
Y3QgcGh5bGlua19jb25maWcgKmNvbmZpZywKPiAgICAgICAgIGlmIChwcml2LT5ody0+eHBjcykK
PiAgICAgICAgICAgICAgICAgcmV0dXJuICZwcml2LT5ody0+eHBjcy0+cGNzOwo+Cj4gLSAgICAg
ICBpZiAocHJpdi0+aHctPmx5bnhfcGNzKQo+IC0gICAgICAgICAgICAgICByZXR1cm4gcHJpdi0+
aHctPmx5bnhfcGNzOwo+IC0KPiAgICAgICAgIHJldHVybiBOVUxMOwo+ICB9CgpJIHRoaW5rIHRo
ZSBhYm92ZSBodW5rIGlzIHdyb25nLCBhbmQgc2hvdWxkIGJlIHJlcGxhY2VkIGJ5IGEgcmVtb3Zh
bApvZiB0aGUgY2FsbCB0byBseW54X3Bjc19kZXN0cm95KCk/CgpHcntvZXRqZSxlZXRpbmd9cywK
CiAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0CgotLSAKR2VlcnQgVXl0dGVyaG9ldmVuIC0t
IFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9y
ZwoKSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2Fs
bCBteXNlbGYgYSBoYWNrZXIuIEJ1dAp3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkg
anVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuCiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0Ckxp
bnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
