Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A013A8182F7
	for <lists+linux-stm32@lfdr.de>; Tue, 19 Dec 2023 09:06:18 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 545EFC6B452;
	Tue, 19 Dec 2023 08:06:18 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 79CADC6B44D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Dec 2023 08:06:17 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-54ba86ae133so3732493a12.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Dec 2023 00:06:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702973177; x=1703577977;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zHZZ1qBFLYk5D7ybnvL0vNBwkKCdL+WfKJkMFR2G4jQ=;
 b=z2K7pWIS1Dw/uIllvR6Kz3lMSjjdJQvqrguFuk70ZPWhO0BIX47r28RYeHjjwDwqTs
 pIgJ0moaY9LQaGGA2TF4+XHNFMvFFQnFGiCfMk+mipkUE3nDBY7ep0t89d4b5tmOVCoO
 hxcklPcJYwJlWuhLP5wg5G1emoPfbd04pzfQMqcHw8KBqey/TWEp59Tzzl1djhaTNlyx
 2ZenyBEI5RgXG0Tn9t4X7/1HLvHFPd6iuaa8LOE11MM/wazGaTTUerzxsor13Nxp4+uI
 T4Quy8tOpABh3ndxDXP/K8MLcuWVA9BDkS6VdntA4p+qojuLTDJJABrO9gB5zAHh80wK
 Ee3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702973177; x=1703577977;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zHZZ1qBFLYk5D7ybnvL0vNBwkKCdL+WfKJkMFR2G4jQ=;
 b=JUxqtfitnQeE9Q9LeB4/mGT4fDsDXOmCR3GyNofD1lvyU/R12uJL6tOS27QQanlesx
 myVMdnHguukWTsDp/WNBHPuXMXCnl9tYcG8bXBZJd/RHDOJNKRTs8NlSgYJCIPeH+Oyi
 OZO4hkfYYec9cIX0LW8LbWFb7DeLVCGLXJG77sVf1V1m7ADHjQc78BfavtJT8q51lzqt
 4jvxj01+73qdAgtpCs00moJ4cZUhKMvOWGn1ux5dgfXT3tYAmzCoKfDgS7VoJNysFLzE
 a0SreTGVzXOqKPX0LVxX4DQjWplRFOO8pBDa7yxFyBuViK229OY9eOps/PGEQA+Rb7ya
 m7Ug==
X-Gm-Message-State: AOJu0YzaRaxCNxXqnOlhzAjgrNmH8N4YH4V0ukMgQv8XfUWCaUUfSL2e
 NMPhuZpJr4H0vqRjKpzXBcdIpw==
X-Google-Smtp-Source: AGHT+IFk7nCwJ3Cgygcv0PPxf8Nmoq++kFT+oSJXnVr98jtfa/yztBLisAU2VWlBWmsiTo2oa5jg+Q==
X-Received: by 2002:a50:cbc7:0:b0:54c:5d34:980c with SMTP id
 l7-20020a50cbc7000000b0054c5d34980cmr8989833edi.82.1702973176885; 
 Tue, 19 Dec 2023 00:06:16 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.27]) by smtp.gmail.com with ESMTPSA id
 t16-20020aa7d710000000b00553533738f0sm1667914edq.57.2023.12.19.00.06.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Dec 2023 00:06:16 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Date: Tue, 19 Dec 2023 09:06:12 +0100
Message-Id: <170297316309.10063.8435852209780151651.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1702822744.git.u.kleine-koenig@pengutronix.de>
References: <cover.1702822744.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Cc: Tony Lindgren <tony@atomide.com>, linux-mips@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 linux-samsung-soc@vger.kernel.org,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 linux-arm-kernel@lists.infradead.org, Sumit Gupta <sumitg@nvidia.com>,
 Nick Alcock <nick.alcock@oracle.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-pm@vger.kernel.org,
 Roger Quadros <rogerq@kernel.org>, linux-mediatek@lists.infradead.org,
 Markus Mayer <mmayer@broadcom.com>, Santosh Shilimkar <ssantosh@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-omap@vger.kernel.org,
 Yong Wu <yong.wu@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, kernel@pengutronix.de,
 Lukasz Luba <lukasz.luba@arm.com>
Subject: Re: [Linux-stm32] [PATCH 00/15] memory: Convert to platform remove
	callback returning void
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

Ck9uIFN1biwgMTcgRGVjIDIwMjMgMTU6Mjk6MjYgKzAxMDAsIFV3ZSBLbGVpbmUtS8O2bmlnIHdy
b3RlOgo+IHRoaXMgc2VyaWVzIGNvbnZlcnRzIHRoZSBwbGF0Zm9ybSBkcml2ZXJzIGJlbG93IGRy
aXZlcnMvbWVtb3J5IHRvIG1ha2UKPiB1c2Ugb2YgLnJlbW92ZV9uZXcuIFNlZSBjb21taXQgNWM1
YTc2ODBlNjdiICgicGxhdGZvcm06IFByb3ZpZGUgYSByZW1vdmUKPiBjYWxsYmFjayB0aGF0IHJl
dHVybnMgbm8gdmFsdWUiKSBmb3IgYW4gZXh0ZW5kZWQgZXhwbGFuYXRpb24gYW5kIHRoZQo+IGV2
ZW50dWFsIGdvYWwuIFRoZSBUTDtEUjsgaXMgdG8gbWFrZSBpdCBoYXJkZXIgZm9yIGRyaXZlciBh
dXRob3JzIHRvCj4gbGVhayByZXNvdXJjZXMgd2l0aG91dCBub3RpY2luZy4KPiAKPiBUaGlzIGlz
IG1lcmdlIHdpbmRvdyBtYXRlcmlhbC4gQWxsIHBhdGNoZXMgYXJlIHBhaXJ3aXNlIGluZGVwZW5k
ZW50IG9mCj4gZWFjaCBvdGhlciBzbyB0aGV5IGNhbiBiZSBhcHBsaWVkIGluZGl2aWR1YWxseS4g
U3RpbGwgaXQgd291bGQgYmUgZ3JlYXQKPiB0byBsZXQgdGhlbSBnbyBpbiBhbGwgdG9nZXRoZXIu
Cj4gCj4gWy4uLl0KCkFwcGxpZWQsIHRoYW5rcyEKClswMS8xNV0gbWVtb3J5OiBicmNtc3RiX2Rw
ZmU6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCiAg
ICAgICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9rcnprL2xpbnV4LW1lbS1jdHJsL2MvNDMxMTg3
ZWFkYmM3YjBmMjY1MGQ0ZTU1MTExYjNmZmY0NzIwZjg2NwpbMDIvMTVdIG1lbW9yeTogYnJjbXN0
Yl9tZW1jOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9p
ZAogICAgICAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcva3J6ay9saW51eC1tZW0tY3RybC9jL2Y3
NzU0NzEyYWQ2MDk0ZGU1YmUxODY3NDc3N2IyNjVlZDRkYjJmNDUKWzAzLzE1XSBtZW1vcnk6IGVt
aWY6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCiAg
ICAgICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9rcnprL2xpbnV4LW1lbS1jdHJsL2MvYzhhNTM0
NjE5OTBjYjY5N2NhNDk0ZDY2NzFmYWI5ZTE5NmQyMGNlNApbMDQvMTVdIG1lbW9yeTogZnNsLWNv
cmVuZXQtY2Y6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2
b2lkCiAgICAgICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9rcnprL2xpbnV4LW1lbS1jdHJsL2Mv
MDIxZDA0NGIwZjljOWEwOWFhMmY3NzhlODc2ZTQ2N2E4ODEwZmI0YQpbMDUvMTVdIG1lbW9yeTog
ZnNsX2lmYzogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nIHZv
aWQKICAgICAgICBodHRwczovL2dpdC5rZXJuZWwub3JnL2tyemsvbGludXgtbWVtLWN0cmwvYy9m
MTcxMzA4NTVkNTFmMjQ1NjNhMjRjZDk1N2FkZDc2OWFkNTllZWU5ClswNi8xNV0gbWVtb3J5OiBq
ejQ3ODAtbmVtYzogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5n
IHZvaWQKICAgICAgICBodHRwczovL2dpdC5rZXJuZWwub3JnL2tyemsvbGludXgtbWVtLWN0cmwv
Yy85MDI0ZmJiZDc3YjRkNzMyNzliYmJlMmM3NDhhNGU0YjQxNGQ1MGNjClswNy8xNV0gbWVtb3J5
OiBtdGstc21pOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcg
dm9pZAogICAgICAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcva3J6ay9saW51eC1tZW0tY3RybC9j
LzA4YzFhZWFhNDVjZTBmZDE4OTEyZTkyYzY3MDU1ODZjOGFhNTI0MGYKWzA4LzE1XSBtZW1vcnk6
IG9tYXAtZ3BtYzogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5n
IHZvaWQKICAgICAgICBodHRwczovL2dpdC5rZXJuZWwub3JnL2tyemsvbGludXgtbWVtLWN0cmwv
Yy82YTRlZGIxYTRmNjFlMjhjYzEyN2NkMDZjNDcwY2UzNTk5ZWUwZDljClswOS8xNV0gbWVtb3J5
OiByZW5lc2FzLXJwYy1pZjogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0
dXJuaW5nIHZvaWQKICAgICAgICBodHRwczovL2dpdC5rZXJuZWwub3JnL2tyemsvbGludXgtbWVt
LWN0cmwvYy85NjFhYmM5ZjdkNjc3MWU4ZjEzZGIxZjRkOGIwZmZmZjNmMGY0MWE0ClsxMC8xNV0g
bWVtb3J5OiBleHlub3M1NDIyLWRtYzogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJh
Y2sgcmV0dXJuaW5nIHZvaWQKICAgICAgICBodHRwczovL2dpdC5rZXJuZWwub3JnL2tyemsvbGlu
dXgtbWVtLWN0cmwvYy84MDEzNDA4ZTQ5MTJmYjdlNDY5YmI4YjE0ZmQzYTVjOTU2MjU3ZWVjClsx
MS8xNV0gbWVtb3J5OiBzdG0zMi1mbWMyLWViaTogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUg
Y2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQKICAgICAgICBodHRwczovL2dpdC5rZXJuZWwub3JnL2ty
emsvbGludXgtbWVtLWN0cmwvYy8xNDU1YjZiMGM4MzEzMjk2MDgyNmQwZTUyN2E3OWEzNTVlMDk2
YTgwClsxMi8xNV0gbWVtb3J5OiB0ZWdyYTE4Ni1lbWM6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVt
b3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCiAgICAgICAgaHR0cHM6Ly9naXQua2VybmVsLm9y
Zy9rcnprL2xpbnV4LW1lbS1jdHJsL2MvZGNlZmEwMzY4NDU4ZTllMjA2NDJkYmQyNjA4YWRhZTZi
MjJlNjQ2NApbMTMvMTVdIG1lbW9yeTogdGVncmEyMTAtZW1jOiBDb252ZXJ0IHRvIHBsYXRmb3Jt
IHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZAogICAgICAgIGh0dHBzOi8vZ2l0Lmtlcm5l
bC5vcmcva3J6ay9saW51eC1tZW0tY3RybC9jLzYyMmZhODE5YTJmMGYzZTZkODMyMmEwYjZkMzE3
NzMwMmFlOTM3YjYKWzE0LzE1XSBtZW1vcnk6IHRpLWFlbWlmOiBDb252ZXJ0IHRvIHBsYXRmb3Jt
IHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZAogICAgICAgIGh0dHBzOi8vZ2l0Lmtlcm5l
bC5vcmcva3J6ay9saW51eC1tZW0tY3RybC9jLzc4NTJlYjhjOGFjN2UwMTY0YjQzY2M1ZjhkODI0
NWNjM2EwMzc2MjAKWzE1LzE1XSBtZW1vcnk6IHRpLWVtaWYtcG06IENvbnZlcnQgdG8gcGxhdGZv
cm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCiAgICAgICAgaHR0cHM6Ly9naXQua2Vy
bmVsLm9yZy9rcnprL2xpbnV4LW1lbS1jdHJsL2MvMzY1ZmNjMDNiNjMyMWYzNmViN2NiZGE4YmFh
NzM3MjM4YzM4NzkwNwoKQmVzdCByZWdhcmRzLAotLSAKS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6
eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJA
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
