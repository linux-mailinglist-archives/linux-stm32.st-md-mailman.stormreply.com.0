Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA2A69E296
	for <lists+linux-stm32@lfdr.de>; Tue, 21 Feb 2023 15:46:02 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6977CC6A5F8;
	Tue, 21 Feb 2023 14:46:02 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 75D52C69063
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Feb 2023 14:46:01 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id h16so4305332qta.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Feb 2023 06:46:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WSlt8RgFBsoWMBHQKRt7mco4LDvQe0nvEXzQx/tM6Uo=;
 b=n+HVfkxzVB8FqneYmnJlCqqZD0ZcSqXL6XQVIY+z8OLMKXydmNqrw7Oswe4Twh8Qyf
 0sRMMmsCYJzdrUCHYOC5jZ3eFaE28dKjcPM+E3OHJHBDZq/iMxKdD2hSUyi3/6pYhcTx
 zZ4Tx3WBrYTLzOoZ+u8AEKFjqa0Rb2WWfpZ+XXmwM6+AhEJBvF+GvFcHJ/TJGvudNxgz
 pLa93kvsyIgJrkDBxH+R4um88bU/ORJPsI9GFuiOUvYaeVn+FKuKr+p4Mf6RCFUYcguQ
 ym23ji6oNn2QcnUvK4Fd9a7vXRtowUfnNIhBzV1O1JiRKILRtSDxVNRvRr7iu8wFGQPG
 3YbA==
X-Gm-Message-State: AO0yUKWvcQwVOlBS2cJ4xNkc8c0PBkoMJTbjU2ADPpvnFPvAXmHQ65CH
 NucpVd+3ZtnmwJwtlEGiZh44YqYfyMrctw==
X-Google-Smtp-Source: AK7set9Wv3FKzhJqE0oPLGzgg4nwhZ53xN0Q+lsreTDF5VYxi1FYslJLvssLnl9wk1i0J2mWiDZFfg==
X-Received: by 2002:ac8:7d08:0:b0:3b8:6cb3:e54a with SMTP id
 g8-20020ac87d08000000b003b86cb3e54amr25049847qtb.5.1676990760249; 
 Tue, 21 Feb 2023 06:46:00 -0800 (PST)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com.
 [209.85.219.170]) by smtp.gmail.com with ESMTPSA id
 e8-20020a05620a014800b0073b399700adsm2457746qkn.3.2023.02.21.06.46.00
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Feb 2023 06:46:00 -0800 (PST)
Received: by mail-yb1-f170.google.com with SMTP id g88so4848705ybi.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Feb 2023 06:46:00 -0800 (PST)
X-Received: by 2002:a81:d351:0:b0:536:e16d:23ea with SMTP id
 d17-20020a81d351000000b00536e16d23eamr135830ywl.526.1676990739146; Tue, 21
 Feb 2023 06:45:39 -0800 (PST)
MIME-Version: 1.0
References: <20230209151632.275883-1-clement.leger@bootlin.com>
 <20230209151632.275883-6-clement.leger@bootlin.com>
In-Reply-To: <20230209151632.275883-6-clement.leger@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 21 Feb 2023 15:45:27 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWYkEN90MuKvexWnNZKajJ-yee77TMrYSUjC2VzW5gZhw@mail.gmail.com>
Message-ID: <CAMuHMdWYkEN90MuKvexWnNZKajJ-yee77TMrYSUjC2VzW5gZhw@mail.gmail.com>
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
Subject: Re: [Linux-stm32] [PATCH net-next v3 5/6] net: stmmac: add support
	for RZ/N1 GMAC
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

SGkgQ2zDqW1lbnQsCgpPbiBUaHUsIEZlYiA5LCAyMDIzIGF0IDQ6MTQgUE0gQ2zDqW1lbnQgTMOp
Z2VyIDxjbGVtZW50LmxlZ2VyQGJvb3RsaW4uY29tPiB3cm90ZToKPiBBZGQgc3VwcG9ydCBmb3Ig
UmVuZXNhcyBSWi9OMSBHTUFDLiBUaGlzIHN1cHBvcnQgdXNlcyBhIGN1c3RvbSBQQ1MgKE1JSUMp
Cj4gd2hpY2ggaXMgaGFuZGxlIGJ5IHBhcnNpbmcgdGhlIHBjcy1oYW5kbGUgZGV2aWNlIHRyZWUg
cHJvcGVydHkuCj4KPiBTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZW1lbnQubGVn
ZXJAYm9vdGxpbi5jb20+CgpUaGFua3MgZm9yIHlvdXIgcGF0Y2ghCgo+IC0tLSAvZGV2L251bGwK
PiArKysgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9zdG1pY3JvL3N0bW1hYy9kd21hYy1yem4xLmMK
Cj4gK3N0YXRpYyBpbnQgcnpuMV9kd21hY19yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
cGRldikKPiArewo+ICsgICAgICAgc3RydWN0IHJ6bjFfZHdtYWMgKmR3bWFjID0gZ2V0X3N0bW1h
Y19ic3BfcHJpdigmcGRldi0+ZGV2KTsKPiArICAgICAgIGludCByZXQgPSBzdG1tYWNfZHZyX3Jl
bW92ZSgmcGRldi0+ZGV2KTsKClRoaXMgbmVlZHMgYW4gdXBkYXRlIGZvciBjb21taXQgZmYwMDEx
Y2Y1NjAxNGI0ZCAoIm5ldDogc3RtbWFjOiBNYWtlCnN0bW1hY19kdnJfcmVtb3ZlKCkgcmV0dXJu
IHZvaWQiKSBpbiBuZXQtbmV4dC9tYXN0ZXIuCgo+ICsKPiArICAgICAgIGlmIChkd21hYy0+cGNz
KQo+ICsgICAgICAgICAgICAgICBtaWljX2Rlc3Ryb3koZHdtYWMtPnBjcyk7Cj4gKwo+ICsgICAg
ICAgcmV0dXJuIHJldDsKPiArfQoKR3J7b2V0amUsZWV0aW5nfXMsCgogICAgICAgICAgICAgICAg
ICAgICAgICBHZWVydAoKLS0gCkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2Yg
TGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNv
bnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2Vy
LiBCdXQKd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFt
bWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0LgogICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIC0tIExpbnVzIFRvcnZhbGRzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNv
bS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
