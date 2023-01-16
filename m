Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5523B66C811
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Jan 2023 17:36:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 014C0C6507E;
	Mon, 16 Jan 2023 16:36:24 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com
 [209.85.160.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 13281C65042
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Jan 2023 16:36:23 +0000 (UTC)
Received: by mail-oa1-f41.google.com with SMTP id
 586e51a60fabf-15027746720so29314927fac.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Jan 2023 08:36:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=date:subject:message-id:references:in-reply-to:cc:to:from
 :mime-version:content-transfer-encoding:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=uNqcgfsqzvT4hYSE9tmwyaCcZuoHrn7TWnuHqh3zmXw=;
 b=K+BjRgPzpVTr/uThKECDhXPOWodUG5ZL4uhDOA6x8cWuJa77Y4T73FpXlAlqPYIH2q
 CnTaap6FPEenC23okLV/D3LvpwTfyTlylG6HexMMiyis2RDXo3rNH0DXiN8xExo1xrnb
 aMLr+voOgcvlLQLxQGdIQJ6CCXHfu8La5KwiXhRuwmlbqPK/HHG+YPyk0OJTil1AicoE
 8q4bl7RkkB1yz9/wCofinbkz8e5hr5ZFCf9/uMiKppVI5z8QFT1UUPocl7hl+DuETyno
 IzmKJbpge4p2QK2FxKGiGRqTWkDGTSpCa+jrgNRnIVCQin06nLForcP2YD/Gxo1vPb7i
 baeQ==
X-Gm-Message-State: AFqh2kovQHcMYq7dfF5Ls5PkR2cCfDjsODYznna6WwSxDVOlFHKNvVoh
 2B3QmSdFOnJZs9bSMvjHaQ==
X-Google-Smtp-Source: AMrXdXvfezfraQ6Rq29LStDso8y0eL9XBGMaLRCAZ8gl9g52Xip9qYzqJKCjohBq7pOVMFKayI8TyA==
X-Received: by 2002:a05:6870:c194:b0:158:7b1d:e9a3 with SMTP id
 h20-20020a056870c19400b001587b1de9a3mr13040474oad.6.1673886981775; 
 Mon, 16 Jan 2023 08:36:21 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 h24-20020a056870171800b0014f9cc82421sm14778754oae.33.2023.01.16.08.36.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jan 2023 08:36:21 -0800 (PST)
Received: (nullmailer pid 606186 invoked by uid 1000);
 Mon, 16 Jan 2023 16:36:12 -0000
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <clement.leger@bootlin.com>
In-Reply-To: <20230116103926.276869-5-clement.leger@bootlin.com>
References: <20230116103926.276869-1-clement.leger@bootlin.com>
 <20230116103926.276869-5-clement.leger@bootlin.com>
Message-Id: <167388663912.594183.16249688377425648606.robh@kernel.org>
Date: Mon, 16 Jan 2023 10:36:12 -0600
Cc: Herve Codina <herve.codina@bootlin.com>, ",
 Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kurt Kanzenbach <kurt@linutronix.de>, Eric Dumazet <edumazet@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
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
 Sergey Shtylyov <s.shtylyov@omp.ru>, ",
 Pascal Eberhard" <pascal.eberhard@se.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
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

Ck9uIE1vbiwgMTYgSmFuIDIwMjMgMTE6Mzk6MjQgKzAxMDAsIENsw6ltZW50IEzDqWdlciB3cm90
ZToKPiBBZGQgInJlbmVzYXMscnpuMS1nbWFjIiBiaW5kaW5nIGRvY3VtZW50aW9uIHdoaWNoIGlz
IGNvbXBhdGlibGUgd2hpY2gKPiAic25wcyxkd21hYyIgY29tcGF0aWJsZSBkcml2ZXIgYnV0IHVz
ZXMgYSBjdXN0b20gUENTIHRvIGNvbW11bmljYXRlCj4gd2l0aCB0aGUgcGh5Lgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlbWVudC5sZWdlckBib290bGluLmNvbT4KPiAt
LS0KPiAgLi4uL2JpbmRpbmdzL25ldC9yZW5lc2FzLHJ6bjEtZ21hYy55YW1sICAgICAgIHwgNzEg
KysrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNzEgaW5zZXJ0aW9ucygrKQo+
ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25l
dC9yZW5lc2FzLHJ6bjEtZ21hYy55YW1sCj4gCgpNeSBib3QgZm91bmQgZXJyb3JzIHJ1bm5pbmcg
J21ha2UgRFRfQ0hFQ0tFUl9GTEFHUz0tbSBkdF9iaW5kaW5nX2NoZWNrJwpvbiB5b3VyIHBhdGNo
IChEVF9DSEVDS0VSX0ZMQUdTIGlzIG5ldyBpbiB2NS4xMyk6Cgp5YW1sbGludCB3YXJuaW5ncy9l
cnJvcnM6CgpkdHNjaGVtYS9kdGMgd2FybmluZ3MvZXJyb3JzOgovYnVpbGRzL3JvYmhlcnJpbmcv
ZHQtcmV2aWV3LWNpL2xpbnV4L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQv
cmVuZXNhcyxyem4xLWdtYWMuZXhhbXBsZS5kdGI6IGV0aGVybmV0QDQ0MDAwMDAwOiBjb21wYXRp
YmxlOiBbJ3JlbmVzYXMscnpuMS1nbWFjJ10gZG9lcyBub3QgY29udGFpbiBpdGVtcyBtYXRjaGlu
ZyB0aGUgZ2l2ZW4gc2NoZW1hCglGcm9tIHNjaGVtYTogL2J1aWxkcy9yb2JoZXJyaW5nL2R0LXJl
dmlldy1jaS9saW51eC9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L3JlbmVz
YXMscnpuMS1nbWFjLnlhbWwKCmRvYyByZWZlcmVuY2UgZXJyb3JzIChtYWtlIHJlZmNoZWNrZG9j
cyk6CgpTZWUgaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2RldmljZXRyZWUt
YmluZGluZ3MvcGF0Y2gvMjAyMzAxMTYxMDM5MjYuMjc2ODY5LTUtY2xlbWVudC5sZWdlckBib290
bGluLmNvbQoKVGhlIGJhc2UgZm9yIHRoZSBzZXJpZXMgaXMgZ2VuZXJhbGx5IHRoZSBsYXRlc3Qg
cmMxLiBBIGRpZmZlcmVudCBkZXBlbmRlbmN5CnNob3VsZCBiZSBub3RlZCBpbiAqdGhpcyogcGF0
Y2guCgpJZiB5b3UgYWxyZWFkeSByYW4gJ21ha2UgZHRfYmluZGluZ19jaGVjaycgYW5kIGRpZG4n
dCBzZWUgdGhlIGFib3ZlCmVycm9yKHMpLCB0aGVuIG1ha2Ugc3VyZSAneWFtbGxpbnQnIGlzIGlu
c3RhbGxlZCBhbmQgZHQtc2NoZW1hIGlzIHVwIHRvCmRhdGU6CgpwaXAzIGluc3RhbGwgZHRzY2hl
bWEgLS11cGdyYWRlCgpQbGVhc2UgY2hlY2sgYW5kIHJlLXN1Ym1pdCBhZnRlciBydW5uaW5nIHRo
ZSBhYm92ZSBjb21tYW5kIHlvdXJzZWxmLiBOb3RlCnRoYXQgRFRfU0NIRU1BX0ZJTEVTIGNhbiBi
ZSBzZXQgdG8geW91ciBzY2hlbWEgZmlsZSB0byBzcGVlZCB1cCBjaGVja2luZwp5b3VyIHNjaGVt
YS4gSG93ZXZlciwgaXQgbXVzdCBiZSB1bnNldCB0byB0ZXN0IGFsbCBleGFtcGxlcyB3aXRoIHlv
dXIgc2NoZW1hLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4v
bGlzdGluZm8vbGludXgtc3RtMzIK
