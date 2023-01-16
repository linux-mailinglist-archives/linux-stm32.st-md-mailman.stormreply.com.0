Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C5E66BDCF
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Jan 2023 13:28:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6746DC6507E;
	Mon, 16 Jan 2023 12:28:07 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com
 [209.85.219.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CAEC5C65042
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Jan 2023 12:28:05 +0000 (UTC)
Received: by mail-qv1-f50.google.com with SMTP id h10so19426014qvq.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Jan 2023 04:28:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F61H973BIjXBatem9Exy4ACFKfXqK3XYvjoCLybvptw=;
 b=FR6f7yL3inN1Y07qcEGAXXmkMTAQqAOb8VMcAAR5FuRugWYBt0PdPlMyzbsPBMivGq
 xtMfQhOhGynOCq+RAI7HI9J+vgAhCsSGIGCYjpZYXe8RTFg3HoCuce7lh9MCUW6dhrJu
 P/x/sGE4OngKV7zVZBOVv9hFKTGrlFeuM8TPmkc7X6lXXZDXBnurk9rwDirHQPuj4Mbz
 PGKfnCEz2YnyYV+JRgVywXZj/jtG3c+BlQelFbDZQlZrUke7seudUlNPAJ6Sk0xAgOE8
 uiFmilPXfaoUu6Mco6SlYn6FUSoKtodP9slDWTzlZXflQvJ26tKyPYZ3YQaZw2udmnvb
 eT9A==
X-Gm-Message-State: AFqh2krfDAZN5RNkGLz8hAn930L869lgqHNgfs1ZasOTmL01Dzl1HRJt
 t4S8adHgFFEeQgXP2urn9jqYpkfA6oZWvA==
X-Google-Smtp-Source: AMrXdXvlbTUpguFjovpPMh6JQicDS1iy9lGEL/tjWxZw17fvfUEpxJh74TO80E3OCsH1RI7NEIzPhw==
X-Received: by 2002:a05:6214:2c19:b0:532:33e4:2d70 with SMTP id
 lc25-20020a0562142c1900b0053233e42d70mr37670023qvb.12.1673872084548; 
 Mon, 16 Jan 2023 04:28:04 -0800 (PST)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com.
 [209.85.128.175]) by smtp.gmail.com with ESMTPSA id
 v7-20020a05620a440700b006fb112f512csm18151107qkp.74.2023.01.16.04.28.04
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jan 2023 04:28:04 -0800 (PST)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-4c131bede4bso378297747b3.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Jan 2023 04:28:04 -0800 (PST)
X-Received: by 2002:a25:5189:0:b0:7bf:d201:60cb with SMTP id
 f131-20020a255189000000b007bfd20160cbmr1936519ybb.365.1673872073848; Mon, 16
 Jan 2023 04:27:53 -0800 (PST)
MIME-Version: 1.0
References: <20230116103926.276869-1-clement.leger@bootlin.com>
 <20230116103926.276869-5-clement.leger@bootlin.com>
In-Reply-To: <20230116103926.276869-5-clement.leger@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 16 Jan 2023 13:27:42 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVsa4t61AOnEHzuda7czE1fk-16-R8fXsp-MB3hZMJTEQ@mail.gmail.com>
Message-ID: <CAMuHMdVsa4t61AOnEHzuda7czE1fk-16-R8fXsp-MB3hZMJTEQ@mail.gmail.com>
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>
Cc: Herve Codina <herve.codina@bootlin.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kurt Kanzenbach <kurt@linutronix.de>, Eric Dumazet <edumazet@google.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?Q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>,
 Jon Hunter <jonathanh@nvidia.com>, linux-stm32@st-md-mailman.stormreply.com,
 Tan Tee Min <tee.min.tan@linux.intel.com>, Magnus Damm <magnus.damm@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Wong Vee Khee <veekhee@apple.com>,
 Jose Abreu <joabreu@synopsys.com>, Milan Stevanovic <milan.stevanovic@se.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 devicetree@vger.kernel.org,
 Mohammad Athari Bin Ismail <mohammad.athari.ismail@intel.com>,
 Rob Herring <robh+dt@kernel.org>, Revanth Kumar Uppala <ruppala@nvidia.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jimmy Lalande <jimmy.lalande@se.com>, linux-arm-kernel@lists.infradead.org,
 Sergey Shtylyov <s.shtylyov@omp.ru>, Pascal Eberhard <pascal.eberhard@se.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next 4/6] dt-bindings: net: renesas,
 rzn1-gmac: Document RZ/N1 GMAC support
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

SGkgQ2zDqW1lbnQsCgpUaGFua3MgZm9yIHlvdXIgcGF0Y2ghCgpPbiBNb24sIEphbiAxNiwgMjAy
MyBhdCAxMTozNyBBTSBDbMOpbWVudCBMw6lnZXIKPGNsZW1lbnQubGVnZXJAYm9vdGxpbi5jb20+
IHdyb3RlOgo+IEFkZCAicmVuZXNhcyxyem4xLWdtYWMiIGJpbmRpbmcgZG9jdW1lbnRpb24gd2hp
Y2ggaXMgY29tcGF0aWJsZSB3aGljaAoKZG9jdW1lbnRhdGlvbgoKPiAic25wcyxkd21hYyIgY29t
cGF0aWJsZSBkcml2ZXIgYnV0IHVzZXMgYSBjdXN0b20gUENTIHRvIGNvbW11bmljYXRlCj4gd2l0
aCB0aGUgcGh5Lgo+Cj4gU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVtZW50Lmxl
Z2VyQGJvb3RsaW4uY29tPgo+IC0tLQo+ICAuLi4vYmluZGluZ3MvbmV0L3JlbmVzYXMscnpuMS1n
bWFjLnlhbWwgICAgICAgfCA3MSArKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2Vk
LCA3MSBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvbmV0L3JlbmVzYXMscnpuMS1nbWFjLnlhbWwKPgo+IGRpZmYgLS1n
aXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L3JlbmVzYXMscnpuMS1n
bWFjLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L3JlbmVzYXMs
cnpuMS1nbWFjLnlhbWwKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAw
MC4uZWZmYjlhMzEyODMyCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9uZXQvcmVuZXNhcyxyem4xLWdtYWMueWFtbAo+IEBAIC0wLDAgKzEs
NzEgQEAKPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBPUiBCU0Qt
Mi1DbGF1c2UpCj4gKyVZQU1MIDEuMgo+ICstLS0KPiArJGlkOiBodHRwOi8vZGV2aWNldHJlZS5v
cmcvc2NoZW1hcy9uZXQvcmVuZXNhcyxyem4xLWdtYWMueWFtbCMKPiArJHNjaGVtYTogaHR0cDov
L2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjCj4gKwo+ICt0aXRsZTogUmVu
ZXNhcyBHTUFDMSBEZXZpY2UgVHJlZSBCaW5kaW5ncwo+ICsKPiArbWFpbnRhaW5lcnM6Cj4gKyAg
LSBDbMOpbWVudCBMw6lnZXIgPGNsZW1lbnQubGVnZXJAYm9vdGxpbi5jb20+Cj4gKwo+ICtzZWxl
Y3Q6Cj4gKyAgcHJvcGVydGllczoKPiArICAgIGNvbXBhdGlibGU6Cj4gKyAgICAgIGNvbnRhaW5z
Ogo+ICsgICAgICAgIGVudW06Cj4gKyAgICAgICAgICAtIHJlbmVzYXMscjlhMDZnMDMyLWdtYWMK
PiArICAgICAgICAgIC0gcmVuZXNhcyxyem4xLWdtYWMKPiArICByZXF1aXJlZDoKPiArICAgIC0g
Y29tcGF0aWJsZQo+ICsKPiArYWxsT2Y6Cj4gKyAgLSAkcmVmOiAic25wcyxkd21hYy55YW1sIyIK
PiArCj4gK3Byb3BlcnRpZXM6Cj4gKyAgY29tcGF0aWJsZToKPiArICAgIGFkZGl0aW9uYWxJdGVt
czogdHJ1ZQo+ICsgICAgbWF4SXRlbXM6IDMKPiArICAgIGl0ZW1zOgo+ICsgICAgICAtIGVudW06
Cj4gKyAgICAgICAgICAtIHJlbmVzYXMscjlhMDZnMDMyLWdtYWMKPiArICAgICAgICAgIC0gcmVu
ZXNhcyxyem4xLWdtYWMKPiArICAgIGNvbnRhaW5zOgo+ICsgICAgICBlbnVtOgo+ICsgICAgICAg
IC0gc25wcyxkd21hYwoKV2h5IG5vdCBqdXN0CgogICAgaXRlbXM6CiAgICAgIC0gZW51bToKICAg
ICAgICAgIC0gcmVuZXNhcyxyOWEwNmcwMzItZ21hYwogICAgICAgICAgLSByZW5lc2FzLHJ6bjEt
Z21hYwogICAgICAgICAgLSBzbnBzLGR3bWFjCgo/Cgo+ICtleGFtcGxlczoKPiArICAtIHwKPiAr
ICAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9jbG9jay9yOWEwNmcwMzItc3lzY3RybC5oPgo+ICsg
ICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL2FybS1naWMuaD4K
PiArCj4gKyAgICBldGhlcm5ldEA0NDAwMDAwMCB7Cj4gKyAgICAgIGNvbXBhdGlibGUgPSAicmVu
ZXNhcyxyem4xLWdtYWMiOwoKRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9y
ZW5lc2FzLHJ6bjEtZ21hYy5leGFtcGxlLmR0YjoKZXRoZXJuZXRANDQwMDAwMDA6IGNvbXBhdGli
bGU6IFsncmVuZXNhcyxyem4xLWdtYWMnXSBkb2VzIG5vdCBjb250YWluCml0ZW1zIG1hdGNoaW5n
IHRoZSBnaXZlbiBzY2hlbWEKCj4gKyAgICAgIHJlZyA9IDwweDQ0MDAwMDAwIDB4MjAwMD47Cj4g
KyAgICAgIGludGVycnVwdC1wYXJlbnQgPSA8JmdpYz47Cj4gKyAgICAgIGludGVycnVwdHMgPSA8
R0lDX1NQSSAzNCBJUlFfVFlQRV9MRVZFTF9ISUdIPiwKPiArICAgICAgICAgICAgIDxHSUNfU1BJ
IDM2IElSUV9UWVBFX0xFVkVMX0hJR0g+LAo+ICsgICAgICAgICAgICAgPEdJQ19TUEkgMzUgSVJR
X1RZUEVfTEVWRUxfSElHSD47Cj4gKyAgICAgIGludGVycnVwdC1uYW1lcyA9ICJtYWNpcnEiLCAi
ZXRoX3dha2VfaXJxIiwgImV0aF9scGkiOwo+ICsgICAgICBjbG9jay1uYW1lcyA9ICJzdG1tYWNl
dGgiOwo+ICsgICAgICBjbG9ja3MgPSA8JnN5c2N0cmwgUjlBMDZHMDMyX0hDTEtfR01BQzA+Owo+
ICsgICAgICBzbnBzLG11bHRpY2FzdC1maWx0ZXItYmlucyA9IDwyNTY+Owo+ICsgICAgICBzbnBz
LHBlcmZlY3QtZmlsdGVyLWVudHJpZXMgPSA8MTI4PjsKPiArICAgICAgdHgtZmlmby1kZXB0aCA9
IDwyMDQ4PjsKPiArICAgICAgcngtZmlmby1kZXB0aCA9IDw0MDk2PjsKPiArICAgICAgcGNzLWhh
bmRsZSA9IDwmbWlpX2NvbnYxPjsKPiArICAgICAgcGh5LW1vZGUgPSAibWlpIjsKPiArICAgIH07
Cj4gKwo+ICsuLi4KCkdye29ldGplLGVldGluZ31zLAoKICAgICAgICAgICAgICAgICAgICAgICAg
R2VlcnQKCi0tCkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5
b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNhdGlv
bnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKd2hl
biBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBz
b21ldGhpbmcgbGlrZSB0aGF0LgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExp
bnVzIFRvcnZhbGRzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
